@implementation ACTPanoGPUDownscaler

- (ACTPanoGPUDownscaler)initWithContext:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  ACTPanoGPUDownscaler *v8;
  uint64_t v9;
  MTLDevice *device;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  MTLDevice *v14;
  uint64_t v15;
  MTLCommandQueue *queue;
  const char *v17;
  uint64_t v18;
  MTLComputePipelineState *downsampleState;
  ACTPanoGPUDownscaler *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ACTPanoGPUDownscaler;
  v8 = -[ACTPanoGPUDownscaler init](&v22, sel_init);
  if (!v8)
    goto LABEL_6;
  objc_msgSend_device(v4, v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue();
  device = v8->_device;
  v8->_device = (MTLDevice *)v9;

  v14 = v8->_device;
  if (!v14)
    goto LABEL_6;
  v15 = objc_msgSend_newCommandQueue(v14, v11, v12, v13);
  queue = v8->_queue;
  v8->_queue = (MTLCommandQueue *)v15;

  if (v8->_queue)
  {
    objc_msgSend_computePipelineStateFor_constants_(v4, v17, (uint64_t)CFSTR("downsampleYUV"), 0);
    v18 = objc_claimAutoreleasedReturnValue();
    downsampleState = v8->_downsampleState;
    v8->_downsampleState = (MTLComputePipelineState *)v18;

    v20 = v8;
  }
  else
  {
LABEL_6:
    v20 = 0;
  }

  return v20;
}

- (ACTPanoGPUDownscaler)init
{
  ACTPanoGPUDownscaler *v2;
  id v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *inited;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MTLDevice *device;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  MTLDevice *v19;
  uint64_t v20;
  MTLCommandQueue *queue;
  const char *v22;
  uint64_t v23;
  MTLComputePipelineState *downsampleState;
  ACTPanoGPUDownscaler *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)ACTPanoGPUDownscaler;
  v2 = -[ACTPanoGPUDownscaler init](&v27, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE11A10]);
    v4 = (void *)MEMORY[0x24BDD1488];
    v5 = objc_opt_class();
    objc_msgSend_bundleForClass_(v4, v6, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    inited = (void *)objc_msgSend_initWithbundle_andOptionalCommandQueue_(v3, v9, (uint64_t)v8, 0);

    objc_msgSend_device(inited, v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    device = v2->_device;
    v2->_device = (MTLDevice *)v14;

    v19 = v2->_device;
    if (v19
      && (v20 = objc_msgSend_newCommandQueue(v19, v16, v17, v18),
          queue = v2->_queue,
          v2->_queue = (MTLCommandQueue *)v20,
          queue,
          v2->_queue))
    {
      objc_msgSend_computePipelineStateFor_constants_(inited, v22, (uint64_t)CFSTR("downsampleYUV"), 0);
      v23 = objc_claimAutoreleasedReturnValue();
      downsampleState = v2->_downsampleState;
      v2->_downsampleState = (MTLComputePipelineState *)v23;

      v25 = v2;
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
    inited = 0;
  }

  return v25;
}

- (void)dealloc
{
  MTLComputePipelineState *downsampleState;
  MTLCommandQueue *queue;
  MTLDevice *device;
  objc_super v6;

  downsampleState = self->_downsampleState;
  self->_downsampleState = 0;

  queue = self->_queue;
  self->_queue = 0;

  device = self->_device;
  self->_device = 0;

  v6.receiver = self;
  v6.super_class = (Class)ACTPanoGPUDownscaler;
  -[ACTPanoGPUDownscaler dealloc](&v6, sel_dealloc);
}

- (int)downsample:(__CVBuffer *)a3 to:(__CVBuffer *)a4
{
  IOSurfaceRef IOSurface;
  IOSurfaceRef v8;
  void *v9;
  size_t Width;
  size_t Height;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  void *v18;
  size_t v19;
  size_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  void *v27;
  size_t v28;
  size_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  void *v36;
  size_t v37;
  size_t v38;
  const char *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD v86[3];
  _QWORD v87[3];

  IOSurface = CVPixelBufferGetIOSurface(a3);
  v8 = CVPixelBufferGetIOSurface(a4);
  v9 = (void *)MEMORY[0x24BDDD740];
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v9, v12, 10, Width, Height, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUsage_(v13, v14, 1, v15);
  v17 = (void *)objc_msgSend_newTextureWithDescriptor_iosurface_plane_(self->_device, v16, (uint64_t)v13, (uint64_t)IOSurface, 0);
  v18 = (void *)MEMORY[0x24BDDD740];
  v19 = CVPixelBufferGetWidth(a3) >> 1;
  v20 = CVPixelBufferGetHeight(a3);
  objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v18, v21, 30, v19, v20 >> 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setUsage_(v22, v23, 1, v24);
  v26 = (void *)objc_msgSend_newTextureWithDescriptor_iosurface_plane_(self->_device, v25, (uint64_t)v22, (uint64_t)IOSurface, 1);
  v27 = (void *)MEMORY[0x24BDDD740];
  v28 = CVPixelBufferGetWidth(a4);
  v29 = CVPixelBufferGetHeight(a4);
  objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v27, v30, 10, v28, v29, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setUsage_(v31, v32, 2, v33);
  v35 = (void *)objc_msgSend_newTextureWithDescriptor_iosurface_plane_(self->_device, v34, (uint64_t)v31, (uint64_t)v8, 0);
  v36 = (void *)MEMORY[0x24BDDD740];
  v37 = CVPixelBufferGetWidth(a4) >> 1;
  v38 = CVPixelBufferGetHeight(a4);
  objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v36, v39, 30, v37, v38 >> 1, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setUsage_(v40, v41, 2, v42);
  v44 = (void *)objc_msgSend_newTextureWithDescriptor_iosurface_plane_(self->_device, v43, (uint64_t)v40, (uint64_t)v8, 1);
  v48 = objc_msgSend_threadExecutionWidth(self->_downsampleState, v45, v46, v47);
  v52 = objc_msgSend_maxTotalThreadsPerThreadgroup(self->_downsampleState, v49, v50, v51) / v48;
  objc_msgSend_commandBuffer(self->_queue, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v56, v57, (uint64_t)CFSTR("Panorama:GPUDownscaler"), v58);
  objc_msgSend_computeCommandEncoder(v56, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setComputePipelineState_(v62, v63, (uint64_t)self->_downsampleState, v64);
  objc_msgSend_setTexture_atIndex_(v62, v65, (uint64_t)v17, 0);
  objc_msgSend_setTexture_atIndex_(v62, v66, (uint64_t)v26, 1);
  objc_msgSend_setTexture_atIndex_(v62, v67, (uint64_t)v35, 2);
  objc_msgSend_setTexture_atIndex_(v62, v68, (uint64_t)v44, 3);
  v87[0] = objc_msgSend_width(v44, v69, v70, v71);
  v87[1] = objc_msgSend_height(v44, v72, v73, v74);
  v87[2] = 1;
  v86[0] = v48;
  v86[1] = v52;
  v86[2] = 1;
  objc_msgSend_dispatchThreads_threadsPerThreadgroup_(v62, v75, (uint64_t)v87, (uint64_t)v86);
  objc_msgSend_endEncoding(v62, v76, v77, v78);
  objc_msgSend_commit(v56, v79, v80, v81);
  objc_msgSend_waitUntilCompleted(v56, v82, v83, v84);

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downsampleState, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
