@implementation SCNCaptureDeviceSource

- (void)dealloc
{
  __CVMetalTextureCache *textureCache;
  objc_super v4;

  -[AVCaptureSession stopRunning](self->_captureSession, "stopRunning");

  SCNVideoTextureSourceRelease((uint64_t)&self->_data);
  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNCaptureDeviceSource;
  -[SCNTextureSource dealloc](&v4, sel_dealloc);
}

- (void)setCaptureDevice:(id)a3
{
  if (self->_captureDevice != a3)
  {
    -[AVCaptureSession stopRunning](self->_captureSession, "stopRunning");

    self->_captureSession = 0;
    self->_captureDevice = (AVCaptureDevice *)a3;
  }
}

- (AVCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (void)connectToProxy:(__C3DImageProxy *)a3
{
  _OWORD v4[2];

  C3DImageProxySetSource((uint64_t)a3, self, 2);
  v4[0] = xmmword_1EA5A5028;
  v4[1] = *(_OWORD *)off_1EA5A5038;
  C3DImageProxySetCallbacks((uint64_t)a3, (uint64_t)v4);
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  uint64_t RenderContext;
  id v10;
  uint64_t v11;
  MTLTexture *mtlTextureForRenderer;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CVMetalTextureCache *textureCache;
  void *v22;
  AVCaptureSession *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  if (!self->_captureSession)
  {
    v26 = 0;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B0B0]), "initWithDevice:error:", self->_captureDevice, &v26);
    if (v26)
    {
      v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SCNCaptureDeviceSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:].cold.2((uint64_t)&v26, v14, v15, v16, v17, v18, v19, v20);

      goto LABEL_10;
    }
    v24 = (AVCaptureSession *)objc_alloc_init(MEMORY[0x1E0C8B108]);
    self->_captureSession = v24;
    -[AVCaptureSession addInput:](v24, "addInput:", v13);

    -[AVCaptureSession commitConfiguration](self->_captureSession, "commitConfiguration");
    -[AVCaptureSession startRunning](self->_captureSession, "startRunning");
  }
  RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
  if (!self->_data.videoOutput)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C8B168]);
    v11 = *MEMORY[0x1E0CA9040];
    v29[0] = *MEMORY[0x1E0CA9010];
    v29[1] = v11;
    v30[0] = MEMORY[0x1E0C9AAB0];
    v30[1] = &unk_1EA5FF708;
    objc_msgSend(v10, "setVideoSettings:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
    objc_msgSend(v10, "setSampleBufferDelegate:queue:", self, -[SCNMTLRenderContext resourceQueue](RenderContext));
    -[AVCaptureSession addOutput:](self->_captureSession, "addOutput:", v10);
    self->_data.videoOutput = (pixelBuffer *)v10;
  }
  mtlTextureForRenderer = self->_data.mtlTextureForRenderer;
  if (mtlTextureForRenderer)
  {
    *a6 = ($96EE1C12479E9B303E9C2794B92A11A2)256;
    goto LABEL_15;
  }
  if (!self->_data.var0)
  {
    v25 = scn_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SCNAVPlayerSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:].cold.1();
LABEL_10:
    mtlTextureForRenderer = 0;
    goto LABEL_15;
  }
  textureCache = self->_textureCache;
  if (!textureCache)
  {
    v22 = (void *)-[SCNMTLRenderContext device](RenderContext);
    v27 = *MEMORY[0x1E0CA8F58];
    v28 = &unk_1EA5FF198;
    CVMetalTextureCacheCreate(0, 0, v22, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1), &self->_textureCache);
    textureCache = self->_textureCache;
  }
  SCNVideoTextureSourceCreateMetalTexture((uint64_t)&self->_data, RenderContext, textureCache);
  *a6 = ($96EE1C12479E9B303E9C2794B92A11A2)257;
  mtlTextureForRenderer = self->_data.mtlTextureForRenderer;
LABEL_15:
  objc_sync_exit(self);
  return mtlTextureForRenderer;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  __CVBuffer *ImageBuffer;
  NSObject *v9;

  objc_sync_enter(self);
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (ImageBuffer)
  {
    SCNVideoTextureSourceDiscardVideoData((uint64_t)&self->_data);
    self->_data.var0 = CVPixelBufferRetain(ImageBuffer);
    self->_videoMirrored = objc_msgSend(a5, "isVideoMirrored");
    self->_width = CVPixelBufferGetWidth(ImageBuffer);
    self->_height = CVPixelBufferGetHeight(ImageBuffer);
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNAVPlayerSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:].cold.1();
  }
  objc_sync_exit(self);
}

- (void)metalTextureWithEngineContext:(uint64_t)a3 textureSampler:(uint64_t)a4 nextFrameTime:(uint64_t)a5 status:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DCCB8000, a2, a3, "Error: Could not create AVCaptureInput with error: %@", a5, a6, a7, a8, 2u);
}

@end
