@implementation CVAFilterAlphaBlend

- (CVAFilterAlphaBlend)initWithMetalContext:(void *)a3
{
  CVAFilterAlphaBlend *v4;
  CVAFilterAlphaBlend *v5;
  dispatch_semaphore_t v6;
  OS_dispatch_semaphore *renderingCallbackSemaphore;
  dispatch_queue_t v8;
  OS_dispatch_queue *synchronousRenderingCallbackQueue;
  CVAFilterAlphaBlend *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CVAFilterAlphaBlend;
  v4 = -[ImageSaverAndFileConfigRegistrator init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_device, *(id *)a3);
    objc_storeStrong((id *)&v5->_commandQueue, *((id *)a3 + 1));
    objc_storeStrong((id *)&v5->_library, *((id *)a3 + 2));
    objc_storeStrong((id *)&v5->_pipelineLibrary, *((id *)a3 + 3));
    sub_1B5674B88((void **)&v5->_alphaBlend_Kernel, v5->_library, v5->_pipelineLibrary, v5->_device, CFSTR("alphaBlendRG"), 0, 0);
    +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v5->_alphaBlend_Kernel);

    v6 = dispatch_semaphore_create(5);
    renderingCallbackSemaphore = v5->_renderingCallbackSemaphore;
    v5->_renderingCallbackSemaphore = (OS_dispatch_semaphore *)v6;

    v8 = dispatch_queue_create("_synchronousAlphaBlendCallbackQueue", 0);
    synchronousRenderingCallbackQueue = v5->_synchronousRenderingCallbackQueue;
    v5->_synchronousRenderingCallbackQueue = (OS_dispatch_queue *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeAlphaBlendToCommandBuffer:(id)a3 inTexFirst:(id)a4 inTexSecond:(id)a5 outTex:(id)a6 alpha:(float)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v19[3];
  _QWORD v20[3];
  float v21;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21 = a7;
  objc_msgSend(a3, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[MTLComputePipelineState threadExecutionWidth](self->_alphaBlend_Kernel, "threadExecutionWidth");
  v18 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_alphaBlend_Kernel, "maxTotalThreadsPerThreadgroup");
  objc_msgSend(v16, "setLabel:", CFSTR("_alphaBlend_Kernel"));
  objc_msgSend(v16, "setComputePipelineState:", self->_alphaBlend_Kernel);
  objc_msgSend(v16, "setTexture:atIndex:", v12, 0);
  objc_msgSend(v16, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v16, "setTexture:atIndex:", v14, 2);
  objc_msgSend(v16, "setBytes:length:atIndex:", &v21, 4, 0);
  v20[0] = objc_msgSend(v14, "width");
  v20[1] = objc_msgSend(v14, "height");
  v20[2] = 1;
  v19[0] = v17;
  v19[1] = v18 / v17;
  v19[2] = 1;
  objc_msgSend(v16, "dispatchThreads:threadsPerThreadgroup:", v20, v19);
  objc_msgSend(v16, "endEncoding");

}

- (pair<id<MTLTexture>,)getTexturePlanesFromPixelBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4
{
  uint64_t *v4;
  uint64_t *v8;
  size_t Width;
  void *v10;
  void *v11;
  size_t WidthOfPlane;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  pair<id<MTLTexture>, id<MTLTexture>> result;

  v8 = v4;
  Width = CVPixelBufferGetWidth(a3);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, Width, CVPixelBufferGetHeight(a3), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v10);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setUsage:", a4);
  v11 = (void *)MEMORY[0x1E0CC6BB0];
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
  objc_msgSend(v11, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 30, WidthOfPlane, CVPixelBufferGetHeightOfPlane(a3, 1uLL), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setUsage:", a4);
  v15 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v21, CVPixelBufferGetIOSurface(a3), 0);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)-[MTLDeviceSPI newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v14, CVPixelBufferGetIOSurface(a3), 1);
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v17);
  v18 = objc_claimAutoreleasedReturnValue();

  *v8 = v16;
  v8[1] = v18;

  result.var1 = v20;
  result.var0 = v19;
  return result;
}

- (void)alphaBlendPixelBuffer:(RetainPtr<__CVBuffer *>)a3 inPixelBufferSecond:(RetainPtr<__CVBuffer *>)a4 outPixelBuffer:(RetainPtr<__CVBuffer *>)a5 alpha:(float)a6 callbackQueue:(id)a7 callback:(id)a8
{
  void *v14;
  void **v15;
  void *v16;
  void **v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  const void *v22;
  const void *v23;
  const void *v24;
  id v25;
  id v26;
  CFTypeRef v27;
  CFTypeRef v28;
  const void *v29;
  id v30;
  id v31;
  void **v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  CVAFilterAlphaBlend *v36;
  id v37;
  void **v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD v41[6];
  CFTypeRef cf;
  _QWORD v43[6];
  CFTypeRef v44;
  void *v45;
  void **v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  void *v50;
  const void *v51;

  v31 = a7;
  v30 = a8;
  -[CVAFilterAlphaBlend getTexturePlanesFromPixelBuffer:usage:](self, "getTexturePlanesFromPixelBuffer:usage:", *(_QWORD *)a3.m_ptr, 1);
  v14 = v45;
  v15 = v46;
  v45 = 0;
  v46 = 0;

  -[CVAFilterAlphaBlend getTexturePlanesFromPixelBuffer:usage:](self, "getTexturePlanesFromPixelBuffer:usage:", *(_QWORD *)a4.m_ptr, 1);
  v32 = v46;
  v33 = v45;
  v45 = 0;
  v46 = 0;

  -[CVAFilterAlphaBlend getTexturePlanesFromPixelBuffer:usage:](self, "getTexturePlanesFromPixelBuffer:usage:", *(_QWORD *)a5.m_ptr, 2);
  v16 = v45;
  v17 = v46;
  v45 = 0;
  v46 = 0;

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[CVAPhotoExceptionMetalResourceUnavailable throwIfNil:](CVAPhotoExceptionMetalResourceUnavailable, "throwIfNil:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setLabel:", CFSTR("alpha blend"));
  *(float *)&v20 = a6;
  -[CVAFilterAlphaBlend encodeAlphaBlendToCommandBuffer:inTexFirst:inTexSecond:outTex:alpha:](self, "encodeAlphaBlendToCommandBuffer:inTexFirst:inTexSecond:outTex:alpha:", v19, v14, v33, v16, v20);
  *(float *)&v21 = a6;
  -[CVAFilterAlphaBlend encodeAlphaBlendToCommandBuffer:inTexFirst:inTexSecond:outTex:alpha:](self, "encodeAlphaBlendToCommandBuffer:inTexFirst:inTexSecond:outTex:alpha:", v19, v15, v32, v17, v21);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_renderingCallbackSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v45 = 0;
  v46 = &v45;
  v47 = 0x3812000000;
  v48 = sub_1B56789A4;
  v49 = sub_1B56789B4;
  v22 = *(const void **)a3.m_ptr;
  v50 = &unk_1B56B673F;
  v51 = v22;
  if (v22)
    CFRetain(v22);
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3812000000;
  v43[3] = sub_1B56789A4;
  v43[4] = sub_1B56789B4;
  v23 = *(const void **)a4.m_ptr;
  v43[5] = &unk_1B56B673F;
  v44 = v23;
  if (v23)
    CFRetain(v23);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3812000000;
  v41[3] = sub_1B56789A4;
  v41[4] = sub_1B56789B4;
  v24 = *(const void **)a5.m_ptr;
  v41[5] = &unk_1B56B673F;
  cf = v24;
  if (v24)
    CFRetain(v24);
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1B56789CC;
  v34[3] = &unk_1E6936D10;
  v38 = &v45;
  v39 = v43;
  v25 = v31;
  v35 = v25;
  v36 = self;
  v26 = v30;
  v37 = v26;
  v40 = v41;
  objc_msgSend(v19, "addCompletedHandler:", v34);
  objc_msgSend(v19, "commit");

  _Block_object_dispose(v41, 8);
  v27 = cf;
  cf = 0;
  if (v27)
    CFRelease(v27);
  _Block_object_dispose(v43, 8);
  v28 = v44;
  v44 = 0;
  if (v28)
    CFRelease(v28);
  _Block_object_dispose(&v45, 8);
  v29 = v51;
  v51 = 0;
  if (v29)
    CFRelease(v29);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingCallbackSemaphore, 0);
  objc_storeStrong((id *)&self->_synchronousRenderingCallbackQueue, 0);
  objc_storeStrong((id *)&self->_alphaBlend_Kernel, 0);
  objc_storeStrong((id *)&self->_pipelineLibrary, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
