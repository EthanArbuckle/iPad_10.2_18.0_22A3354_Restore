@implementation SCNAVPlayerSource

- (SCNAVPlayerSource)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNAVPlayerSource;
  return -[SCNAVPlayerSource init](&v3, sel_init);
}

- (void)registerPlayerIfNeeded:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  pixelBuffer *v11;
  _QWORD v12[5];
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  if (!self->_data.videoOutput)
  {
    v5 = *MEMORY[0x1E0CA8D88];
    v6 = *MEMORY[0x1E0CA8F18];
    v7 = *MEMORY[0x1E0CA8EB0];
    v8 = *MEMORY[0x1E0CA8EE8];
    v12[0] = *MEMORY[0x1E0CA8D68];
    v12[1] = v8;
    v13[0] = v5;
    v13[1] = v6;
    v9 = *MEMORY[0x1E0CA9010];
    v12[2] = *MEMORY[0x1E0CA8E98];
    v12[3] = v9;
    v13[2] = v7;
    v13[3] = MEMORY[0x1E0C9AAB0];
    v12[4] = *MEMORY[0x1E0CA9040];
    v13[4] = &unk_1EA5FF708;
    v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 5);
    v11 = (pixelBuffer *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B328]), "initWithPixelBufferAttributes:", v10);
    self->_data.videoOutput = v11;
    objc_msgSend((id)objc_msgSend(a3, "currentItem"), "addOutput:", v11);
  }
}

- (void)unregisterPlayer:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "currentItem"), "removeOutput:", self->_data.videoOutput);
}

- (void)dealloc
{
  __CVMetalTextureCache *textureCache;
  objc_super v4;

  -[SCNAVPlayerSource unregisterPlayer:](self, "unregisterPlayer:", self->_player);

  SCNVideoTextureSourceRelease((uint64_t)&self->_data);
  textureCache = self->_textureCache;
  if (textureCache)
  {
    CFRelease(textureCache);
    self->_textureCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNAVPlayerSource;
  -[SCNTextureSource dealloc](&v4, sel_dealloc);
}

- (void)setPlayer:(id)a3
{
  if (self->_player != a3)
  {
    -[SCNAVPlayerSource unregisterPlayer:](self, "unregisterPlayer:");

    self->_player = (AVPlayer *)a3;
  }
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)connectToProxy:(__C3DImageProxy *)a3
{
  _OWORD v4[2];

  C3DImageProxySetSource((uint64_t)a3, self, 1);
  v4[0] = xmmword_1EA5A5008;
  v4[1] = *(_OWORD *)&off_1EA5A5018;
  C3DImageProxySetCallbacks((uint64_t)a3, (uint64_t)v4);
}

- (id)metalTextureWithEngineContext:(__C3DEngineContext *)a3 textureSampler:(__C3DTextureSampler *)a4 nextFrameTime:(double *)a5 status:(id *)a6
{
  uint64_t RenderContext;
  $F9D35730A1C5871B9CE52059C0BC22F2 *p_data;
  pixelBuffer *videoOutput;
  double SystemTime;
  uint64_t v13;
  __CVBuffer *v14;
  id result;
  NSObject *v16;
  __CVMetalTextureCache **p_textureCache;
  __CVMetalTextureCache *v18;
  void *v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  RenderContext = C3DEngineContextGetRenderContext((uint64_t)a3);
  -[SCNAVPlayerSource registerPlayerIfNeeded:](self, "registerPlayerIfNeeded:", self->_player);
  p_data = &self->_data;
  videoOutput = self->_data.videoOutput;
  v22 = 0uLL;
  v23 = 0;
  SystemTime = C3DEngineContextGetSystemTime((uint64_t)a3);
  if (videoOutput)
  {
    -[pixelBuffer itemTimeForHostTime:](videoOutput, "itemTimeForHostTime:", SystemTime);
  }
  else
  {
    v22 = 0uLL;
    v23 = 0;
  }
  v20 = v22;
  v21 = v23;
  if (-[pixelBuffer hasNewPixelBufferForItemTime:](videoOutput, "hasNewPixelBufferForItemTime:", &v20))
  {
    v20 = v22;
    v21 = v23;
    v13 = -[pixelBuffer copyPixelBufferForItemTime:itemTimeForDisplay:](videoOutput, "copyPixelBufferForItemTime:itemTimeForDisplay:", &v20, 0);
    if (v13)
    {
      v14 = (__CVBuffer *)v13;
      SCNVideoTextureSourceDiscardVideoData((uint64_t)&self->_data);
      self->_data.var0 = v14;
      self->_width = CVPixelBufferGetWidth(v14);
      self->_height = CVPixelBufferGetHeight(v14);
    }
  }
  if (self->_data.var0)
  {
    result = self->_data.mtlTextureForRenderer;
    if (result)
    {
      *a6 = ($96EE1C12479E9B303E9C2794B92A11A2)256;
    }
    else
    {
      p_textureCache = &self->_textureCache;
      v18 = *p_textureCache;
      if (!*p_textureCache)
      {
        v19 = (void *)-[SCNMTLRenderContext device](RenderContext);
        v24 = *MEMORY[0x1E0CA8F58];
        v25[0] = &unk_1EA5FF198;
        CVMetalTextureCacheCreate(0, 0, v19, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1), p_textureCache);
        v18 = *p_textureCache;
      }
      SCNVideoTextureSourceCreateMetalTexture((uint64_t)p_data, RenderContext, v18);
      *a6 = ($96EE1C12479E9B303E9C2794B92A11A2)257;
      return p_data->mtlTextureForRenderer;
    }
  }
  else
  {
    v16 = scn_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SCNAVPlayerSource metalTextureWithEngineContext:textureSampler:nextFrameTime:status:].cold.1();
    return 0;
  }
  return result;
}

- (void)metalTextureWithEngineContext:textureSampler:nextFrameTime:status:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: Could not get pixel buffer (CVPixelBufferRef)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
