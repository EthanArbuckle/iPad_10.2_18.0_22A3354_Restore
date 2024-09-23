@implementation GPUImageUndistortion

- (GPUImageUndistortion)init
{
  GPUImageUndistortion *v2;
  MTLDevice *v3;
  MTLDevice *device;
  uint64_t v5;
  MTLCommandQueue *commandQueue;
  void *v7;
  void *v8;
  MTLDevice *v9;
  uint64_t v10;
  id v11;
  MTLLibrary *library;
  void *v13;
  uint64_t v14;
  MTLComputePipelineState *lutGenerationPipelineState;
  void *v16;
  uint64_t v17;
  MTLComputePipelineState *pipelineState;
  id v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)GPUImageUndistortion;
  v2 = -[GPUImageUndistortion init](&v21, sel_init);
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = v2->_device;
  v2->_device = v3;

  v5 = -[MTLDevice newCommandQueue](v2->_device, "newCommandQueue");
  commandQueue = v2->_commandQueue;
  v2->_commandQueue = (MTLCommandQueue *)v5;

  -[MTLCommandQueue setLabel:](v2->_commandQueue, "setLabel:", CFSTR("com.apple.abpk.gpuimageundistortion.queue"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v2->_device;
  v20 = 0;
  v10 = -[MTLDevice newLibraryWithURL:error:](v9, "newLibraryWithURL:error:", v8, &v20);
  v11 = v20;
  library = v2->_library;
  v2->_library = (MTLLibrary *)v10;

  v13 = (void *)-[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("compute_lut"));
  v14 = -[MTLDevice newComputePipelineStateWithFunction:error:](v2->_device, "newComputePipelineStateWithFunction:error:", v13, 0);
  lutGenerationPipelineState = v2->_lutGenerationPipelineState;
  v2->_lutGenerationPipelineState = (MTLComputePipelineState *)v14;

  v16 = (void *)-[MTLLibrary newFunctionWithName:](v2->_library, "newFunctionWithName:", CFSTR("undistort_image"));
  v17 = -[MTLDevice newComputePipelineStateWithFunction:error:](v2->_device, "newComputePipelineStateWithFunction:error:", v16, 0);
  pipelineState = v2->_pipelineState;
  v2->_pipelineState = (MTLComputePipelineState *)v17;

  return v2;
}

- (void)undistortFisheyeImage:(float32x4_t)a3 withFisheyeIntrinsics:(float32x4_t)a4 withFisheyeRadialCoefficients:(float32x4_t)a5 toRectilinearImage:(__n128)a6 withRectilinearIntrinsics:(__n128)a7
{
  __CVBuffer *v14;
  const __CFDictionary *v15;
  size_t v16;
  size_t v17;
  void *v18;
  uint32x4_t v19;
  uint32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  size_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  CVBufferRef v35;
  void *v36;
  void *v37;
  size_t v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  _BYTE v44[48];
  void *v45;
  void *v46;
  size_t Height;
  size_t Width;
  void *v49;
  CFDictionaryRef pixelBufferAttributes;
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[5];
  _QWORD v54[3];
  _QWORD v55[3];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  uint64_t v63;
  _QWORD v64[4];
  simd_float3x3 v65;

  *(__n128 *)&v44[16] = a7;
  *(__n128 *)&v44[32] = a8;
  *(__n128 *)v44 = a6;
  v64[1] = *MEMORY[0x24BDAC8D0];
  v61 = a3;
  v62 = a4;
  v59 = a5;
  v60 = a2;
  Width = CVPixelBufferGetWidth(a10);
  Height = CVPixelBufferGetHeight(a10);
  v14 = *a11;
  if (!*a11)
  {
    v63 = *MEMORY[0x24BDC5668];
    v64[0] = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferCreate(0, Width, Height, 0x34323076u, v15, a11);

    v14 = *a11;
  }
  v16 = CVPixelBufferGetWidth(v14);
  v17 = CVPixelBufferGetHeight(*a11);
  objc_msgSend(*(id *)(a1 + 16), "commandBuffer");
  pixelBufferAttributes = (CFDictionaryRef)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary setLabel:](pixelBufferAttributes, "setLabel:", CFSTR("com.apple.abpk.gpuimageundistortion.commandBuffer"));
  v18 = *(void **)(a1 + 40);
  if (!v18
    || objc_msgSend(v18, "width") != v16
    || objc_msgSend(*(id *)(a1 + 40), "height") != v17
    || (v19 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 64), v61), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 48), v60)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 80), v62)), v19.i32[3] = v19.i32[2], (vminvq_u32(v19) & 0x80000000) == 0)|| (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)(a1 + 96), v59)) & 0x80000000) == 0|| (v20 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 128), *(float32x4_t *)&v44[16]), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 112), *(float32x4_t *)v44)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 144), *(float32x4_t *)&v44[32])), v20.i32[3] = v20.i32[2], (vminvq_u32(v20) & 0x80000000) == 0))
  {
    v21 = v61;
    v22 = v62;
    v23 = v59;
    *(float32x4_t *)(a1 + 48) = v60;
    *(float32x4_t *)(a1 + 64) = v21;
    *(float32x4_t *)(a1 + 80) = v22;
    *(float32x4_t *)(a1 + 96) = v23;
    *(_OWORD *)(a1 + 112) = *(_OWORD *)v44;
    *(_OWORD *)(a1 + 128) = *(_OWORD *)&v44[16];
    *(_OWORD *)(a1 + 144) = *(_OWORD *)&v44[32];
    v24 = *(void **)(a1 + 40);
    if (!v24 || objc_msgSend(v24, "width") != v16 || objc_msgSend(*(id *)(a1 + 40), "height") != v17)
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 105, v16, v17, 0, *(_OWORD *)v44);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setUsage:", 3);
      v26 = objc_msgSend(*(id *)(a1 + 8), "newTextureWithDescriptor:", v25);
      v27 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v26;

    }
    -[__CFDictionary computeCommandEncoder](pixelBufferAttributes, "computeCommandEncoder", *(_OWORD *)v44);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setLabel:", CFSTR("com.apple.abpk.gpuimageundistortion.generatelut"));
    objc_msgSend(v28, "setComputePipelineState:", *(_QWORD *)(a1 + 32));
    v29 = v17;
    v57 = 0u;
    v58 = 0u;
    v56 = 0u;
    v65 = __invert_f3(*(simd_float3x3 *)v44);
    DWORD2(v56) = v65.columns[0].i32[2];
    DWORD2(v57) = v65.columns[1].i32[2];
    *(_QWORD *)&v56 = v65.columns[0].i64[0];
    *(_QWORD *)&v57 = v65.columns[1].i64[0];
    DWORD2(v58) = v65.columns[2].i32[2];
    *(_QWORD *)&v58 = v65.columns[2].i64[0];
    objc_msgSend(v28, "setTexture:atIndex:", *(_QWORD *)(a1 + 40), 0);
    objc_msgSend(v28, "setBytes:length:atIndex:", &v60, 48, 0);
    objc_msgSend(v28, "setBytes:length:atIndex:", &v59, 16, 1);
    objc_msgSend(v28, "setBytes:length:atIndex:", &v56, 48, 2);
    v30 = objc_msgSend(*(id *)(a1 + 32), "threadExecutionWidth");
    v31 = objc_msgSend(*(id *)(a1 + 32), "maxTotalThreadsPerThreadgroup");
    v32 = objc_msgSend(*(id *)(a1 + 40), "width");
    v33 = objc_msgSend(*(id *)(a1 + 40), "height");
    v55[0] = (v30 + v32 - 1) / v30;
    v55[1] = (v31 / v30 + v33 - 1) / (v31 / v30);
    v55[2] = 1;
    v54[0] = v30;
    v54[1] = v31 / v30;
    v54[2] = 1;
    objc_msgSend(v28, "dispatchThreadgroups:threadsPerThreadgroup:", v55, v54);
    objc_msgSend(v28, "endEncoding");

    v17 = v29;
  }
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, Width, Height, 0, *(_OWORD *)v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setUsage:", 3);
  v45 = (void *)objc_msgSend(*(id *)(a1 + 8), "newTextureWithDescriptor:iosurface:plane:", v46, CVPixelBufferGetIOSurface(a10), 0);
  objc_msgSend(v45, "setLabel:", CFSTR("com.apple.abpk.gpuimageundistortion.srcY"));
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, Width >> 1, Height >> 1, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setUsage:", 1);
  v34 = (void *)objc_msgSend(*(id *)(a1 + 8), "newTextureWithDescriptor:iosurface:plane:", v49, CVPixelBufferGetIOSurface(a10), 1);
  objc_msgSend(v34, "setLabel:", CFSTR("com.apple.abpk.gpuimageundistortion.srcCbCr"));
  v35 = CVBufferRetain(a10);
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __143__GPUImageUndistortion_undistortFisheyeImage_withFisheyeIntrinsics_withFisheyeRadialCoefficients_toRectilinearImage_withRectilinearIntrinsics___block_invoke;
  v53[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
  v53[4] = v35;
  -[__CFDictionary addCompletedHandler:](pixelBufferAttributes, "addCompletedHandler:", v53);
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, v16, v17, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setUsage:", 3);
  v37 = (void *)objc_msgSend(*(id *)(a1 + 8), "newTextureWithDescriptor:iosurface:plane:", v36, CVPixelBufferGetIOSurface(*a11), 0);
  objc_msgSend(v37, "setLabel:", CFSTR("com.apple.abpk.gpuimageundistortion.dstY"));
  v38 = v17;
  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, v16 >> 1, v17 >> 1, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setUsage:", 3);
  v40 = (void *)objc_msgSend(*(id *)(a1 + 8), "newTextureWithDescriptor:iosurface:plane:", v39, CVPixelBufferGetIOSurface(*a11), 1);
  objc_msgSend(v40, "setLabel:", CFSTR("com.apple.abpk.gpuimageundistortion.dstCbCr"));
  -[__CFDictionary computeCommandEncoder](pixelBufferAttributes, "computeCommandEncoder");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setLabel:", CFSTR("com.apple.abpk.gpuimageundistortion.settexture"));
  objc_msgSend(v41, "setComputePipelineState:", *(_QWORD *)(a1 + 24));
  objc_msgSend(v41, "setTexture:atIndex:", v45, 0);
  objc_msgSend(v41, "setTexture:atIndex:", v34, 1);
  objc_msgSend(v41, "setTexture:atIndex:", *(_QWORD *)(a1 + 40), 2);
  objc_msgSend(v41, "setTexture:atIndex:", v37, 3);
  objc_msgSend(v41, "setTexture:atIndex:", v40, 4);
  v42 = objc_msgSend(*(id *)(a1 + 24), "threadExecutionWidth");
  v43 = objc_msgSend(*(id *)(a1 + 24), "maxTotalThreadsPerThreadgroup");
  v52[0] = (v16 + v42 - 1) / v42;
  v52[1] = (v38 + v43 / v42 - 1) / (v43 / v42);
  v52[2] = 1;
  v51[0] = v42;
  v51[1] = v43 / v42;
  v51[2] = 1;
  objc_msgSend(v41, "dispatchThreadgroups:threadsPerThreadgroup:", v52, v51);
  objc_msgSend(v41, "endEncoding");
  -[__CFDictionary commit](pixelBufferAttributes, "commit");
  -[__CFDictionary waitUntilCompleted](pixelBufferAttributes, "waitUntilCompleted");

}

void __143__GPUImageUndistortion_undistortFisheyeImage_withFisheyeIntrinsics_withFisheyeRadialCoefficients_toRectilinearImage_withRectilinearIntrinsics___block_invoke(uint64_t a1)
{
  CVBufferRelease(*(CVBufferRef *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_lut, 0);
  objc_storeStrong((id *)&self->_lutGenerationPipelineState, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
