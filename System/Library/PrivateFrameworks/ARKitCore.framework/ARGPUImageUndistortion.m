@implementation ARGPUImageUndistortion

- (ARGPUImageUndistortion)init
{
  ARGPUImageUndistortion *v2;
  void *v3;
  uint64_t v4;
  MTLDevice *device;
  uint64_t v6;
  MTLCommandQueue *commandQueue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MTLDevice *v12;
  uint64_t v13;
  id v14;
  MTLComputePipelineState *lutGenerationPipelineState;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  MTLDevice *v21;
  uint64_t v22;
  id v23;
  MTLComputePipelineState *yuvPipelineState;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  MTLDevice *v28;
  uint64_t v29;
  id v30;
  MTLComputePipelineState *rgbPipelineState;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  ARGPUImageUndistortion *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)ARGPUImageUndistortion;
  v2 = -[ARGPUImageUndistortion init](&v39, sel_init);
  if (v2)
  {
    +[ARSharedGPUDevice sharedInstance](ARSharedGPUDevice, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v4 = objc_claimAutoreleasedReturnValue();
    device = v2->_device;
    v2->_device = (MTLDevice *)v4;

    v6 = -[MTLDevice newCommandQueue](v2->_device, "newCommandQueue");
    commandQueue = v2->_commandQueue;
    v2->_commandQueue = (MTLCommandQueue *)v6;

    -[MTLCommandQueue setLabel:](v2->_commandQueue, "setLabel:", CFSTR("com.apple.arkit.gpuimageundistortion.queue"));
    ARKitCoreBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("default"), CFSTR("metallib"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)-[MTLDevice newLibraryWithURL:error:](v2->_device, "newLibraryWithURL:error:", v9, 0);
    objc_msgSend(v10, "setLabel:", CFSTR("com.apple.arkit.gpuimageundistortion.library"));
    v11 = (void *)objc_msgSend(v10, "newFunctionWithName:", CFSTR("compute_lut"));
    v12 = v2->_device;
    v38 = 0;
    v13 = -[MTLDevice newComputePipelineStateWithFunction:error:](v12, "newComputePipelineStateWithFunction:error:", v11, &v38);
    v14 = v38;
    lutGenerationPipelineState = v2->_lutGenerationPipelineState;
    v2->_lutGenerationPipelineState = (MTLComputePipelineState *)v13;

    if (!v2->_lutGenerationPipelineState)
    {
      _ARLogGeneral_18();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v18;
        v42 = 2048;
        v43 = v2;
        v44 = 2112;
        v45 = v14;
        _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create lut pipeline state, error %@", buf, 0x20u);

      }
    }

    v19 = (void *)objc_msgSend(v10, "newFunctionWithName:", CFSTR("undistort_image_yuv"));
    v20 = (void *)objc_msgSend(v10, "newFunctionWithName:", CFSTR("undistort_image"));
    v21 = v2->_device;
    v37 = 0;
    v22 = -[MTLDevice newComputePipelineStateWithFunction:error:](v21, "newComputePipelineStateWithFunction:error:", v19, &v37);
    v23 = v37;
    yuvPipelineState = v2->_yuvPipelineState;
    v2->_yuvPipelineState = (MTLComputePipelineState *)v22;

    if (!v2->_yuvPipelineState)
    {
      _ARLogGeneral_18();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v27;
        v42 = 2048;
        v43 = v2;
        v44 = 2112;
        v45 = v23;
        _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create image undistortion pipeline state, error %@", buf, 0x20u);

      }
    }
    v28 = v2->_device;
    v36 = v23;
    v29 = -[MTLDevice newComputePipelineStateWithFunction:error:](v28, "newComputePipelineStateWithFunction:error:", v20, &v36);
    v30 = v36;

    rgbPipelineState = v2->_rgbPipelineState;
    v2->_rgbPipelineState = (MTLComputePipelineState *)v29;

    if (!v2->_rgbPipelineState)
    {
      _ARLogGeneral_18();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v34;
        v42 = 2048;
        v43 = v2;
        v44 = 2112;
        v45 = v30;
        _os_log_impl(&dword_1B3A68000, v32, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create image undistortion pipeline state, error %@", buf, 0x20u);

      }
    }

  }
  return v2;
}

- (void)undistortFisheyeImage:(double)a3 withFisheyeIntrinsics:(double)a4 withFisheyeRadialCoefficients:(double)a5 toRectilinearImage:(double)a6 withRectilinearIntrinsics:(double)a7
{
  size_t Width;
  size_t Height;
  __CVBuffer *v16;
  const __CFDictionary *v17;
  size_t v18;
  size_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CVBuffer *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v39[2];
  _QWORD v40[2];
  uint64_t v41;
  _QWORD v42[3];

  v42[1] = *MEMORY[0x1E0C80C00];
  Width = CVPixelBufferGetWidth(a10);
  Height = CVPixelBufferGetHeight(a10);
  v16 = *a11;
  if (!*a11)
  {
    v41 = *MEMORY[0x1E0CA8FF0];
    v42[0] = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CVPixelBufferCreate(0, Width, Height, 0x34323076u, v17, a11);

    v16 = *a11;
  }
  v18 = CVPixelBufferGetWidth(v16);
  v19 = CVPixelBufferGetHeight(*a11);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, Width, Height, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setUsage:", 3);
  v20 = (void *)objc_msgSend(a1[1], "newTextureWithDescriptor:iosurface:plane:", v31, CVPixelBufferGetIOSurface(a10), 0);
  objc_msgSend(v20, "setLabel:", CFSTR("com.apple.arkit.gpuimageundistortion.srcY"));
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, Width >> 1, Height >> 1, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setUsage:", 1);
  v21 = (void *)objc_msgSend(a1[1], "newTextureWithDescriptor:iosurface:plane:", v30, CVPixelBufferGetIOSurface(a10), 1);
  objc_msgSend(v21, "setLabel:", CFSTR("com.apple.arkit.gpuimageundistortion.srcCbCr"));
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, v18, v19, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUsage:", 3);
  v23 = (void *)objc_msgSend(a1[1], "newTextureWithDescriptor:iosurface:plane:", v22, CVPixelBufferGetIOSurface(*a11), 0);
  objc_msgSend(v23, "setLabel:", CFSTR("com.apple.arkit.gpuimageundistortion.dstY"));
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, v18 >> 1, v19 >> 1, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setUsage:", 3);
  v25 = (void *)objc_msgSend(a1[1], "newTextureWithDescriptor:iosurface:plane:", v24, CVPixelBufferGetIOSurface(*a11), 1);
  objc_msgSend(v25, "setLabel:", CFSTR("com.apple.arkit.gpuimageundistortion.dstCbCr"));
  v26 = CVBufferRetain(a10);
  v40[0] = v20;
  v40[1] = v21;
  v27 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v23;
  v39[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "undistortFisheyeTexture:withFisheyeIntrinsics:withFisheyeRadialCoefficients:toRectilinearImage:withRectilinearIntrinsics:", v28, v29, a2, a3, a4, a5, a6, a7, a8);

  CVBufferRelease(v26);
}

- (uint64_t)undistortFisheyeTexture:(float32x4_t)a3 withFisheyeIntrinsics:(float32x4_t)a4 withFisheyeRadialCoefficients:(float32x4_t)a5 toRectilinearImage:(__n128)a6 withRectilinearIntrinsics:(__n128)a7
{
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint32x4_t v20;
  uint32x4_t v21;
  float32x4_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  objc_class *v42;
  void *v43;
  uint64_t v44;
  void *v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v55[48];
  _QWORD v57[3];
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  _BYTE buf[32];
  __int128 v66;
  uint64_t v67;
  simd_float3x3 v68;

  *(__n128 *)&v55[16] = a7;
  *(__n128 *)&v55[32] = a8;
  *(__n128 *)v55 = a6;
  v67 = *MEMORY[0x1E0C80C00];
  v62 = a2;
  v63 = a3;
  v64 = a4;
  v13 = a10;
  v61 = a5;
  v14 = a11;
  if (objc_msgSend(v13, "count")
    && (unint64_t)objc_msgSend(v13, "count") <= 2
    && (v15 = objc_msgSend(v13, "count"), v15 == objc_msgSend(v14, "count")))
  {
    v50 = objc_msgSend(v13, "count");
    objc_msgSend(v14, "firstObject");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = -[NSObject width](v16, "width");
    v51 = -[NSObject height](v16, "height");
    objc_msgSend(*(id *)(a1 + 16), "commandBuffer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLabel:", CFSTR("com.apple.arkit.gpuimageundistortion.commandBuffer"));
    v19 = *(void **)(a1 + 48);
    if (!v19
      || objc_msgSend(v19, "width") != v17
      || objc_msgSend(*(id *)(a1 + 48), "height") != v51
      || (v20 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 80), a3), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 64), a2)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 96), a4)), v20.i32[3] = v20.i32[2], (vminvq_u32(v20) & 0x80000000) == 0)|| (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)(a1 + 112), a5)) & 0x80000000) == 0|| (v21 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 144), *(float32x4_t *)&v55[16]), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 128), *(float32x4_t *)v55)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 160), *(float32x4_t *)&v55[32])), v21.i32[3] = v21.i32[2], (vminvq_u32(v21) & 0x80000000) == 0))
    {
      v22 = v63;
      *(float32x4_t *)(a1 + 64) = v62;
      *(float32x4_t *)(a1 + 80) = v22;
      *(float32x4_t *)(a1 + 96) = v64;
      *(float32x4_t *)(a1 + 112) = a5;
      *(_OWORD *)(a1 + 128) = *(_OWORD *)v55;
      *(_OWORD *)(a1 + 144) = *(_OWORD *)&v55[16];
      *(_OWORD *)(a1 + 160) = *(_OWORD *)&v55[32];
      v23 = *(void **)(a1 + 48);
      if (!v23 || objc_msgSend(v23, "width") != v17 || objc_msgSend(*(id *)(a1 + 48), "height") != v51)
      {
        objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 105, v17, v51, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setUsage:", 3);
        v25 = objc_msgSend(*(id *)(a1 + 8), "newTextureWithDescriptor:", v24);
        v26 = *(void **)(a1 + 48);
        *(_QWORD *)(a1 + 48) = v25;

      }
      objc_msgSend(v18, "computeCommandEncoder");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setLabel:", CFSTR("com.apple.arkit.gpuimageundistortion.lutgeneration"));
      objc_msgSend(v27, "setComputePipelineState:", *(_QWORD *)(a1 + 40));
      *(_OWORD *)&buf[16] = 0u;
      v66 = 0u;
      *(_OWORD *)buf = 0u;
      v68 = __invert_f3(*(simd_float3x3 *)v55);
      *(_DWORD *)&buf[8] = v68.columns[0].i32[2];
      *(_DWORD *)&buf[24] = v68.columns[1].i32[2];
      *(_QWORD *)buf = v68.columns[0].i64[0];
      *(_QWORD *)&buf[16] = v68.columns[1].i64[0];
      DWORD2(v66) = v68.columns[2].i32[2];
      *(_QWORD *)&v66 = v68.columns[2].i64[0];
      objc_msgSend(v27, "setTexture:atIndex:", *(_QWORD *)(a1 + 48), 0);
      objc_msgSend(v27, "setBytes:length:atIndex:", &v62, 48, 0);
      objc_msgSend(v27, "setBytes:length:atIndex:", &v61, 16, 1);
      objc_msgSend(v27, "setBytes:length:atIndex:", buf, 48, 2);
      v28 = objc_msgSend(*(id *)(a1 + 40), "threadExecutionWidth");
      v29 = objc_msgSend(*(id *)(a1 + 40), "maxTotalThreadsPerThreadgroup") / v28;
      v30 = v18;
      v31 = v17;
      v32 = (v28 + objc_msgSend(*(id *)(a1 + 48), "width") - 1) / v28;
      v33 = objc_msgSend(*(id *)(a1 + 48), "height");
      v58 = v32;
      v59 = (v29 + v33 - 1) / v29;
      v17 = v31;
      v18 = v30;
      v60 = 1;
      v57[0] = v28;
      v57[1] = v29;
      v57[2] = 1;
      objc_msgSend(v27, "dispatchThreadgroups:threadsPerThreadgroup:", &v58, v57);
      objc_msgSend(v27, "endEncoding");

    }
    objc_msgSend(v18, "computeCommandEncoder");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setLabel:", CFSTR("com.apple.arkit.gpuimageundistortion.textureundistort"));
    v35 = 24;
    if (v50 == 1)
      v35 = 32;
    v36 = *(id *)(a1 + v35);
    objc_msgSend(v34, "setComputePipelineState:", v36);
    objc_msgSend(v13, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTexture:atIndex:", v37, 0);

    if (v50 == 1)
    {
      objc_msgSend(v34, "setTexture:atIndex:", *(_QWORD *)(a1 + 48), 1);
      objc_msgSend(v14, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v34;
      v40 = v38;
      v41 = 2;
    }
    else
    {
      objc_msgSend(v13, "lastObject");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setTexture:atIndex:", v46, 1);

      objc_msgSend(v34, "setTexture:atIndex:", *(_QWORD *)(a1 + 48), 2);
      objc_msgSend(v14, "firstObject");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setTexture:atIndex:", v47, 3);

      objc_msgSend(v14, "lastObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v34;
      v40 = v38;
      v41 = 4;
    }
    objc_msgSend(v39, "setTexture:atIndex:", v40, v41);

    v48 = objc_msgSend(v36, "threadExecutionWidth");
    v49 = objc_msgSend(v36, "maxTotalThreadsPerThreadgroup");
    *(_QWORD *)buf = (v17 + v48 - 1) / v48;
    *(_QWORD *)&buf[8] = (v51 + v49 / v48 - 1) / (v49 / v48);
    v44 = 1;
    *(_QWORD *)&buf[16] = 1;
    v58 = v48;
    v59 = v49 / v48;
    v60 = 1;
    objc_msgSend(v34, "dispatchThreadgroups:threadsPerThreadgroup:", buf, &v58);
    objc_msgSend(v34, "endEncoding");
    objc_msgSend(v18, "commit");
    objc_msgSend(v18, "waitUntilCompleted");

  }
  else
  {
    _ARLogGeneral_18();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v43;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a1;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Incorrect number of input/output textures", buf, 0x16u);

    }
    v44 = 0;
  }

  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lut, 0);
  objc_storeStrong((id *)&self->_lutGenerationPipelineState, 0);
  objc_storeStrong((id *)&self->_rgbPipelineState, 0);
  objc_storeStrong((id *)&self->_yuvPipelineState, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
