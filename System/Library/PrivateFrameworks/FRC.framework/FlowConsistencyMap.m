@implementation FlowConsistencyMap

- (FlowConsistencyMap)initWithDevice:(id)a3 commmandQueue:(id)a4
{
  FlowConsistencyMap *v4;
  FlowConsistencyMap *v5;
  FlowConsistencyMap *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FlowConsistencyMap;
  v4 = -[FRCMetalBase initWithDevice:commmandQueue:](&v8, sel_initWithDevice_commmandQueue_, a3, a4);
  v5 = v4;
  if (v4 && (v4->_useSIMD = 1, !-[FlowConsistencyMap createKernels](v4, "createKernels")))
    v6 = 0;
  else
    v6 = v5;

  return v6;
}

- (BOOL)createKernels
{
  const __CFString *v3;
  MTLComputePipelineState *v4;
  MTLComputePipelineState *consistencyComputeKernel;
  MTLComputePipelineState *v6;
  MTLComputePipelineState *consistencyNormalizationKernel;
  MTLComputePipelineState *v8;
  MTLComputePipelineState *consistencyUpscalingKernel;

  if (self->_useSIMD && -[MTLDevice supportsFamily:](self->super._device, "supportsFamily:", 1007))
    v3 = CFSTR("create_consistency_map_SIMD");
  else
    v3 = CFSTR("create_consistency_map");
  -[FRCMetalBase createKernel:](self, "createKernel:", v3);
  v4 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  consistencyComputeKernel = self->_consistencyComputeKernel;
  self->_consistencyComputeKernel = v4;

  if (!self->_consistencyComputeKernel)
    return 0;
  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("normalized_consistency_map"));
  v6 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  consistencyNormalizationKernel = self->_consistencyNormalizationKernel;
  self->_consistencyNormalizationKernel = v6;

  -[FRCMetalBase createKernel:](self, "createKernel:", CFSTR("upscale_consistency_map"));
  v8 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
  consistencyUpscalingKernel = self->_consistencyUpscalingKernel;
  self->_consistencyUpscalingKernel = v8;

  return self->_consistencyNormalizationKernel != 0;
}

- (void)setUseSIMD:(BOOL)a3
{
  self->_useSIMD = a3;
  -[FlowConsistencyMap createKernels](self, "createKernels");
}

- (float)createFlowConsistencyMapsWithForwardFlow:(id)a3 backwardFlow:(id)a4 forwardConsistencyMap:(id)a5 backwardConsistencyMap:(id)a6
{
  MTLCommandQueue *commandQueue;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  float v16;
  float v17;
  void *v18;

  commandQueue = self->super._commandQueue;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FlowConsistencyMap encodeUnomalizedMapCreationToCommandBuffer:forwardFlow:backwardFlow:forwardConsistencyMap:backwardConsistencyMap:](self, "encodeUnomalizedMapCreationToCommandBuffer:forwardFlow:backwardFlow:forwardConsistencyMap:backwardConsistencyMap:", v15, v14, v13, v12, v11);

  objc_msgSend(v15, "commit");
  objc_msgSend(v15, "waitUntilCompleted");
  printf("Max values from atomic max %d\n", *(_DWORD *)-[MTLBuffer contents](self->_maxBuffer, "contents"));
  -[FlowConsistencyMap computeMaxConsisnteciesForwardConsistencyMap:backwardConsistencyMap:](self, "computeMaxConsisnteciesForwardConsistencyMap:backwardConsistencyMap:", v12, v11);
  v17 = v16;
  printf("Max vlues from CPU %f\n", v16);
  -[MTLCommandQueue commandBuffer](self->super._commandQueue, "commandBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[FlowConsistencyMap encodeMapNormalizationToCommandBuffer:consisitencyMap:maxConsistency:](self, "encodeMapNormalizationToCommandBuffer:consisitencyMap:maxConsistency:", v18, v12, self->_maxBuffer);
  -[FlowConsistencyMap encodeMapNormalizationToCommandBuffer:consisitencyMap:maxConsistency:](self, "encodeMapNormalizationToCommandBuffer:consisitencyMap:maxConsistency:", v18, v11, self->_maxBuffer);

  objc_msgSend(v18, "commit");
  objc_msgSend(v18, "waitUntilCompleted");

  return v17;
}

- (float)maxValueInTexture:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  char *BaseAddress;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v12;

  v3 = a3;
  objc_msgSend(v3, "buffer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    NSLog(CFSTR("Error! Texture is not made from a buffer"));
    _S8 = 0.0;
    goto LABEL_19;
  }
  v5 = objc_msgSend(v3, "bufferBytesPerRow");
  if (objc_msgSend(v4, "iosurface"))
  {
    IOSurfaceLock((IOSurfaceRef)objc_msgSend(v4, "iosurface"), 1u, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress((IOSurfaceRef)objc_msgSend(v4, "iosurface"));
  }
  else
  {
    BaseAddress = (char *)objc_msgSend(objc_retainAutorelease(v4), "contents");
  }
  v8 = BaseAddress;
  if (BaseAddress)
  {
    if (objc_msgSend(v3, "height"))
    {
      v9 = 0;
      v10 = 2 * (v5 >> 1);
      _H8 = 0;
      do
      {
        if (objc_msgSend(v3, "width"))
        {
          v12 = 0;
          do
          {
            _H0 = *(_WORD *)&v8[2 * v12];
            __asm
            {
              FCVT            S0, H0
              FCVT            S1, H8
            }
            _S0 = fmaxf(_S0, _S1);
            __asm { FCVT            H8, S0 }
            ++v12;
          }
          while (objc_msgSend(v3, "width") > v12);
        }
        ++v9;
        v8 += v10;
      }
      while (objc_msgSend(v3, "height") > v9);
      goto LABEL_16;
    }
  }
  else
  {
    NSLog(CFSTR("Error! buffer is not accessible"));
  }
  _H8 = 0;
LABEL_16:
  if (objc_msgSend(v4, "iosurface"))
    IOSurfaceUnlock((IOSurfaceRef)objc_msgSend(v4, "iosurface"), 1u, 0);
  __asm { FCVT            S8, H8 }
LABEL_19:

  return _S8;
}

- (float)computeMaxConsisnteciesForwardConsistencyMap:(id)a3 backwardConsistencyMap:(id)a4
{
  id v6;
  float v7;
  float v8;
  float v9;
  float v10;

  v6 = a4;
  -[FlowConsistencyMap maxValueInTexture:](self, "maxValueInTexture:", a3);
  v8 = v7;
  -[FlowConsistencyMap maxValueInTexture:](self, "maxValueInTexture:", v6);
  v10 = v9;

  return fmaxf(v8, v10);
}

- (void)encodeToCommandBuffer:(id)a3 forwardFlow:(id)a4 backwardFlow:(id)a5 forwardConsistencyMap:(id)a6 backwardConsistencyMap:(id)a7
{
  id v12;
  id v13;
  id v14;

  v12 = a7;
  v13 = a6;
  v14 = a3;
  -[FlowConsistencyMap encodeUnomalizedMapCreationToCommandBuffer:forwardFlow:backwardFlow:forwardConsistencyMap:backwardConsistencyMap:](self, "encodeUnomalizedMapCreationToCommandBuffer:forwardFlow:backwardFlow:forwardConsistencyMap:backwardConsistencyMap:", v14, a4, a5, v13, v12);
  -[FlowConsistencyMap encodeMapNormalizationToCommandBuffer:consisitencyMap:maxConsistency:](self, "encodeMapNormalizationToCommandBuffer:consisitencyMap:maxConsistency:", v14, v13, self->_maxBuffer);

  -[FlowConsistencyMap encodeMapNormalizationToCommandBuffer:consisitencyMap:maxConsistency:](self, "encodeMapNormalizationToCommandBuffer:consisitencyMap:maxConsistency:", v14, v12, self->_maxBuffer);
}

- (void)encodeUnomalizedMapCreationToCommandBuffer:(id)a3 forwardFlow:(id)a4 backwardFlow:(id)a5 forwardConsistencyMap:(id)a6 backwardConsistencyMap:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  MTLBuffer *v17;
  MTLBuffer *maxBuffer;
  unint64_t v19;
  uint64_t v20;
  int64x2_t v21;
  uint64_t v22;
  _QWORD v23[3];

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setComputePipelineState:", self->_consistencyComputeKernel);
  objc_msgSend(v16, "setTexture:atIndex:", v15, 0);
  objc_msgSend(v16, "setTexture:atIndex:", v14, 1);

  objc_msgSend(v16, "setTexture:atIndex:", v13, 2);
  objc_msgSend(v16, "setTexture:atIndex:", v12, 3);

  v17 = (MTLBuffer *)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", 4, 0);
  maxBuffer = self->_maxBuffer;
  self->_maxBuffer = v17;

  objc_msgSend(v16, "setBuffer:offset:atIndex:", self->_maxBuffer, 0, 0);
  v19 = (unint64_t)(objc_msgSend(v15, "width") + 31) >> 5;
  v20 = objc_msgSend(v15, "height");

  v23[0] = v19;
  v23[1] = (unint64_t)(v20 + 31) >> 5;
  v23[2] = 1;
  v21 = vdupq_n_s64(0x20uLL);
  v22 = 1;
  objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", v23, &v21);
  objc_msgSend(v16, "endEncoding");

}

- (void)encodeMapNormalizationToCommandBuffer:(id)a3 consisitencyMap:(id)a4 maxConsistency:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  _QWORD v15[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_consistencyNormalizationKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);
  objc_msgSend(v10, "setBuffer:offset:atIndex:", v8, 0, 0);

  v11 = (unint64_t)(objc_msgSend(v9, "width") + 31) >> 5;
  v12 = objc_msgSend(v9, "height");

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 31) >> 5;
  v15[2] = 1;
  v13 = vdupq_n_s64(0x20uLL);
  v14 = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v10, "endEncoding");

}

- (id)allocateLinearConsistencyMapWithWidth:(unint64_t)a3 height:(unint64_t)a4
{
  unint64_t v5;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, a3, a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUsage:", 3);
  objc_msgSend(v7, "setStorageMode:", 0);
  v5 *= 2;
  v8 = (void *)-[MTLDevice newBufferWithLength:options:](self->super._device, "newBufferWithLength:options:", v5 * a4, 0);
  v9 = (void *)objc_msgSend(v8, "newTextureWithDescriptor:offset:bytesPerRow:", v7, 0, v5);

  return v9;
}

- (float)maxConsistency
{
  MTLBuffer *maxBuffer;

  maxBuffer = self->_maxBuffer;
  if (maxBuffer)
    return (float)*(unsigned int *)-[MTLBuffer contents](maxBuffer, "contents") / 10000.0;
  else
    return 0.0;
}

- (void)encodeMapUpscalingToCommandBuffer:(id)a3 source:(id)a4 detination:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  int64x2_t v13;
  uint64_t v14;
  _QWORD v15[3];

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "computeCommandEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComputePipelineState:", self->_consistencyUpscalingKernel);
  objc_msgSend(v10, "setTexture:atIndex:", v9, 0);

  objc_msgSend(v10, "setTexture:atIndex:", v8, 1);
  v11 = (unint64_t)(objc_msgSend(v8, "width") + 31) >> 5;
  v12 = objc_msgSend(v8, "height");

  v15[0] = v11;
  v15[1] = (unint64_t)(v12 + 31) >> 5;
  v15[2] = 1;
  v13 = vdupq_n_s64(0x20uLL);
  v14 = 1;
  objc_msgSend(v10, "dispatchThreadgroups:threadsPerThreadgroup:", v15, &v13);
  objc_msgSend(v10, "endEncoding");

}

- (BOOL)useSIMD
{
  return self->_useSIMD;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxBuffer, 0);
  objc_storeStrong((id *)&self->_consistencyUpscalingKernel, 0);
  objc_storeStrong((id *)&self->_consistencyNormalizationKernel, 0);
  objc_storeStrong((id *)&self->_consistencyComputeKernel, 0);
}

@end
