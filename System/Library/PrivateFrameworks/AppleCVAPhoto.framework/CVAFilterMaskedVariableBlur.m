@implementation CVAFilterMaskedVariableBlur

- (CVAFilterMaskedVariableBlur)initWithDevice:(id)a3 library:(id)a4 pipelineLibrary:(id)a5 commandQueue:(id)a6 kernelSize:(int)a7 error:(id *)a8
{
  uint64_t v9;
  id v15;
  id v16;
  id v17;
  id v18;
  CVAFilterMaskedVariableBlur *v19;
  objc_class *v20;
  uint64_t v21;
  NSString *label;
  uint64_t v23;
  int32x4_t *v24;
  int32x4_t *v25;
  int32x2_t v26;
  unint64_t v27;
  int32x4_t *v28;
  uint64_t v29;
  int32x4_t v30;
  int32x4_t *v31;
  uint64_t v32;
  CVAFilterMaskedVariableBlur *v33;
  uint64_t v34;
  MPSImageGaussianPyramid *gaussianPyramid;
  void *v36;
  void *v37;
  objc_super v39;

  v9 = *(_QWORD *)&a7;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v39.receiver = self;
  v39.super_class = (Class)CVAFilterMaskedVariableBlur;
  v19 = -[CVAFilterMaskedVariableBlur init](&v39, sel_init);
  if (v19)
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = objc_claimAutoreleasedReturnValue();
    label = v19->_label;
    v19->_label = (NSString *)v21;

    objc_storeStrong((id *)&v19->_device, a3);
    sub_1B5674B88((void **)&v19->_maskedVariableBlurKernel, v16, v17, v19->_device, CFSTR("maskedVariableBlurWithUpsample"), a8, 0);
    if (v19->_maskedVariableBlurKernel)
    {
      if (sub_1B569090C(CFSTR("harvesting.enabled"), CFSTR("com.apple.coremedia"), 0))
      {
LABEL_16:
        v33 = v19;
        goto LABEL_17;
      }
      if (!(_DWORD)v9)
      {
        v25 = 0;
        goto LABEL_14;
      }
      v23 = (v9 * v9);
      v24 = (int32x4_t *)operator new(4 * v23);
      v25 = v24;
      *(float *)v26.i32 = 1.0 / (float)(int)v23;
      v27 = (v23 - 1) & 0x3FFFFFFFFFFFFFFFLL;
      v28 = v24;
      if (v27 >= 7)
      {
        v29 = (v27 + 1) & 0x7FFFFFFFFFFFFFF8;
        v30 = vdupq_lane_s32(v26, 0);
        v31 = v24 + 1;
        v32 = v29;
        do
        {
          v31[-1] = v30;
          *v31 = v30;
          v31 += 2;
          v32 -= 8;
        }
        while (v32);
        if (v27 + 1 == v29)
        {
LABEL_14:
          v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E50]), "initWithDevice:kernelWidth:kernelHeight:weights:", v19->_device, (int)v9, (int)v9, v25);
          gaussianPyramid = v19->_gaussianPyramid;
          v19->_gaussianPyramid = (MPSImageGaussianPyramid *)v34;

          -[MPSImageGaussianPyramid setEdgeMode:](v19->_gaussianPyramid, "setEdgeMode:", 1);
          -[MPSImageGaussianPyramid setOptions:](v19->_gaussianPyramid, "setOptions:", 2);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GaussianPyramid%ix%i"), v9, v9);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[MPSImageGaussianPyramid setLabel:](v19->_gaussianPyramid, "setLabel:", v36);

          objc_msgSend(v18, "commandBuffer");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setLabel:", CFSTR("GaussianPyramid"));
          +[CVAFilterMaskedVariableBlur prewarmGaussianPyramid:device:commandBuffer:](CVAFilterMaskedVariableBlur, "prewarmGaussianPyramid:device:commandBuffer:", v19->_gaussianPyramid, v19->_device, v37);
          objc_msgSend(v37, "commit");

          if (v25)
            operator delete(v25);
          goto LABEL_16;
        }
        v28 = (int32x4_t *)((char *)v24 + 4 * v29);
      }
      do
      {
        v28->i32[0] = v26.i32[0];
        v28 = (int32x4_t *)((char *)v28 + 4);
      }
      while (v28 != (int32x4_t *)((char *)v24 + 4 * v23));
      goto LABEL_14;
    }
  }
  v33 = 0;
LABEL_17:

  return v33;
}

- (void)encodeBlurPyramidInPlaceToCommandBuffer:(id)a3 inoutTexture:(id)a4
{
  id v6;

  v6 = a4;
  -[MPSImageGaussianPyramid encodeToCommandBuffer:inPlaceTexture:fallbackCopyAllocator:](self->_gaussianPyramid, "encodeToCommandBuffer:inPlaceTexture:fallbackCopyAllocator:", a3, &v6, 0);

}

- (void)encodeToCommandBuffer:(id)a3 source:(id)a4 destination:(id)a5 mask:(id)a6 maxBlurRadius:(float)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[3];
  float v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20 = a7;
  -[CVAFilterMaskedVariableBlur encodeBlurPyramidInPlaceToCommandBuffer:inoutTexture:](self, "encodeBlurPyramidInPlaceToCommandBuffer:inoutTexture:", v12, v13);
  objc_msgSend(v12, "computeCommandEncoder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLabel:", CFSTR("_maskedVariableBlurKernel"));
  objc_msgSend(v16, "setComputePipelineState:", self->_maskedVariableBlurKernel);
  objc_msgSend(v16, "setTexture:atIndex:", v14, 0);
  objc_msgSend(v16, "setTexture:atIndex:", v15, 1);
  objc_msgSend(v16, "setTexture:atIndex:", v13, 2);
  objc_msgSend(v16, "setBytes:length:atIndex:", &v20, 4, 0);
  v19[0] = (unint64_t)(objc_msgSend(v14, "width") + 15) >> 4;
  v19[1] = (unint64_t)(objc_msgSend(v14, "height") + 15) >> 4;
  v19[2] = 1;
  v18 = 1;
  v17 = xmmword_1B56AC968;
  objc_msgSend(v16, "dispatchThreadgroups:threadsPerThreadgroup:", v19, &v17);
  objc_msgSend(v16, "endEncoding");

}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_maskedVariableBlurKernel, 0);
  objc_storeStrong((id *)&self->_gaussianPyramid, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

+ (void)prewarmGaussianPyramid:(id)a3 device:(id)a4 commandBuffer:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 70, 144, 108, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMipmapLevelCount:", 7);
  objc_msgSend(v10, "setUsage:", 3);
  v11 = (id)objc_msgSend(v8, "newTextureWithDescriptor:", v10);
  objc_msgSend(v7, "encodeToCommandBuffer:inPlaceTexture:fallbackCopyAllocator:", v9, &v11, 0);

}

@end
