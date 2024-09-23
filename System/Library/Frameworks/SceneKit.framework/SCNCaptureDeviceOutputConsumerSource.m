@implementation SCNCaptureDeviceOutputConsumerSource

- (SCNCaptureDeviceOutputConsumerSource)init
{
  return -[SCNCaptureDeviceOutputConsumerSource initWithOptions:](self, "initWithOptions:", 0);
}

- (SCNCaptureDeviceOutputConsumerSource)initWithOptions:(id)a3
{
  SCNCaptureDeviceOutputConsumerSource *v4;
  SCNCaptureDeviceOutputConsumerSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCNCaptureDeviceOutputConsumerSource;
  v4 = -[SCNCaptureDeviceOutputConsumerSource init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_videoMirrored = 0;
    v4->_automaticallyAdjustsVideoMirroring = 1;
    v4->_containsAlpha = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SCNCaptureDeviceOutputConsumerOptionContainsAlpha")), "BOOLValue");
  }
  return v5;
}

- (BOOL)containsAlpha
{
  return self->_containsAlpha;
}

- (void)dealloc
{
  __CVMetalTextureCache *textureCache;
  objc_super v4;

  SCNVideoTextureSourceRelease((uint64_t)&self->_data);
  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNCaptureDeviceOutputConsumerSource;
  -[SCNTextureSource dealloc](&v4, sel_dealloc);
}

- (void)connectToProxy:(__C3DImageProxy *)a3
{
  _OWORD v4[2];

  C3DImageProxySetSource((uint64_t)a3, self, 3);
  v4[0] = xmmword_1EA5A5050;
  v4[1] = *(_OWORD *)&off_1EA5A5060;
  C3DImageProxySetCallbacks((uint64_t)a3, (uint64_t)v4);
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  uint64_t RenderContext;
  MTLTexture *mtlTextureForRenderer;
  uint64_t v11;
  __CVMetalTextureCache *textureCache;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
  mtlTextureForRenderer = self->_data.mtlTextureForRenderer;
  if (mtlTextureForRenderer)
  {
    *a6 = ($96EE1C12479E9B303E9C2794B92A11A2)256;
  }
  else if (self->_data.var0)
  {
    v11 = RenderContext;
    textureCache = self->_textureCache;
    if (!textureCache)
    {
      v13 = (void *)-[SCNMTLRenderContext device](RenderContext);
      v15 = *MEMORY[0x1E0CA8F58];
      v16[0] = &unk_1EA5FF198;
      CVMetalTextureCacheCreate(0, 0, v13, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1), &self->_textureCache);
      textureCache = self->_textureCache;
    }
    SCNVideoTextureSourceCreateMetalTexture((uint64_t)&self->_data, v11, textureCache);
    *a6 = ($96EE1C12479E9B303E9C2794B92A11A2)257;
    mtlTextureForRenderer = self->_data.mtlTextureForRenderer;
  }
  else
  {
    mtlTextureForRenderer = 0;
  }
  objc_sync_exit(self);
  return mtlTextureForRenderer;
}

- (BOOL)automaticallyAdjustsVideoMirroring
{
  return self->_automaticallyAdjustsVideoMirroring;
}

- (void)setAutomaticallyAdjustsVideoMirroring:(BOOL)a3
{
  self->_automaticallyAdjustsVideoMirroring = a3;
}

- (BOOL)isVideoMirrored
{
  return self->_videoMirrored;
}

- (void)setVideoMirrored:(BOOL)a3
{
  self->_videoMirrored = a3;
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  -[SCNCaptureDeviceOutputConsumerSource setSampleBuffer:fromDevice:](self, "setSampleBuffer:fromDevice:", a3, 0);
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)ImageBuffer fromDevice:(id)a4
{
  __CVBuffer *var0;
  __CVBuffer *v8;
  NSObject *v9;

  objc_sync_enter(self);
  if (ImageBuffer)
    ImageBuffer = CMSampleBufferGetImageBuffer(ImageBuffer);
  if (self->_data.var0 != ImageBuffer)
  {
    SCNVideoTextureSourceDiscardVideoData((uint64_t)&self->_data);
    var0 = self->_data.var0;
    if (var0 != ImageBuffer)
    {
      if (var0)
      {
        CFRelease(var0);
        self->_data.var0 = 0;
      }
      if (ImageBuffer)
        v8 = (__CVBuffer *)CFRetain(ImageBuffer);
      else
        v8 = 0;
      self->_data.var0 = v8;
    }
  }
  if (ImageBuffer)
  {
    self->_width = CVPixelBufferGetWidth(ImageBuffer);
    self->_height = CVPixelBufferGetHeight(ImageBuffer);
    if (a4 && self->_automaticallyAdjustsVideoMirroring)
      self->_videoMirrored = objc_msgSend(a4, "position") == 2;
  }
  else
  {
    v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SCNAVPlayerSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:].cold.1();
  }
  objc_sync_exit(self);
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  -[SCNCaptureDeviceOutputConsumerSource setPixelBuffer:fromDevice:](self, "setPixelBuffer:fromDevice:", a3, 0);
}

- (void)setPixelBuffer:(__CVBuffer *)a3 fromDevice:(id)a4
{
  __CVBuffer *var0;
  __CVBuffer *v8;
  NSObject *v9;

  objc_sync_enter(self);
  if (self->_data.var0 != a3)
  {
    SCNVideoTextureSourceDiscardVideoData((uint64_t)&self->_data);
    var0 = self->_data.var0;
    if (var0 != a3)
    {
      if (var0)
      {
        CFRelease(var0);
        self->_data.var0 = 0;
      }
      if (a3)
        v8 = (__CVBuffer *)CFRetain(a3);
      else
        v8 = 0;
      self->_data.var0 = v8;
    }
  }
  if (a3)
  {
    self->_width = CVPixelBufferGetWidth(a3);
    self->_height = CVPixelBufferGetHeight(a3);
    if (a4 && self->_automaticallyAdjustsVideoMirroring)
      self->_videoMirrored = objc_msgSend(a4, "position") == 2;
    if (!CVPixelBufferGetIOSurface(a3))
    {
      v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SCNCaptureDeviceOutputConsumerSource setPixelBuffer:fromDevice:].cold.1();
    }
  }
  objc_sync_exit(self);
}

- (void)setPixelBuffer:fromDevice:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Pixel buffer (CVPixelBufferRef) must be IOSurface-backed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
