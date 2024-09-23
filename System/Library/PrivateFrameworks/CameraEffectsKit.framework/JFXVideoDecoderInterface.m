@implementation JFXVideoDecoderInterface

- (JFXVideoDecoderInterface)init
{
  JFXVideoDecoderInterface *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXVideoDecoderInterface;
  v2 = -[JFXVideoDecoderInterface init](&v5, sel_init);
  if (v2)
  {
    JFXLog_DebugDepthCodec();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[JFXVideoDecoderInterface init].cold.1(v3);

  }
  return v2;
}

- (JFXVideoDecoderInterface)initWithFormatDescription:(opaqueCMFormatDescription *)a3
{
  JFXVideoDecoderInterface *v4;
  JFXVideoDecoderInterface *v5;
  const __CFDictionary *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  VTDecompressionOutputCallbackRecord outputCallback;
  objc_super v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)JFXVideoDecoderInterface;
  v4 = -[JFXVideoDecoderInterface init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    outputCallback.decompressionOutputCallback = (VTDecompressionOutputCallback)VTDecompressionOutputCallbackImpl;
    outputCallback.decompressionOutputRefCon = v4;
    v17[0] = CFSTR("EnableHardwareAcceleratedVideoDecoder");
    v17[1] = CFSTR("RequireHardwareAcceleratedVideoDecoder");
    v18[0] = MEMORY[0x24BDBD1C8];
    v18[1] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (!VTDecompressionSessionCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, v6, 0, &outputCallback, &v5->_session))
    {
      JFXLog_DebugDepthCodec();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[JFXVideoDecoderInterface initWithFormatDescription:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

    }
  }
  return v5;
}

- (__CVBuffer)decodeFrame:(opaqueCMSampleBuffer *)a3
{
  dispatch_semaphore_t v5;
  OSStatus v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  VTDecodeInfoFlags infoFlagsOut;

  infoFlagsOut = 0;
  v5 = dispatch_semaphore_create(0);
  -[JFXVideoDecoderInterface setFrameSemaphore:](self, "setFrameSemaphore:", v5);

  v6 = VTDecompressionSessionDecodeFrame(self->_session, a3, 0, self, &infoFlagsOut);
  JFXLog_DebugDepthCodec();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
      -[JFXVideoDecoderInterface decodeFrame:].cold.2((uint64_t)self, v6, v7);
  }
  else if (v8)
  {
    -[JFXVideoDecoderInterface decodeFrame:].cold.1((uint64_t)self, v7, v9, v10, v11, v12, v13, v14);
  }

  -[JFXVideoDecoderInterface frameSemaphore](self, "frameSemaphore");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

  return -[JFXVideoDecoderInterface imageBuffer](self, "imageBuffer");
}

- (void)dealloc
{
  OpaqueVTDecompressionSession *session;
  OpaqueVTDecompressionSession *v4;
  objc_super v5;

  session = self->_session;
  if (session)
  {
    VTDecompressionSessionFinishDelayedFrames(session);
    v4 = self->_session;
    if (v4)
      CFRelease(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)JFXVideoDecoderInterface;
  -[JFXVideoDecoderInterface dealloc](&v5, sel_dealloc);
}

- (OS_dispatch_semaphore)frameSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFrameSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (__CVBuffer)imageBuffer
{
  return self->_imageBuffer;
}

- (void)setImageBuffer:(__CVBuffer *)a3
{
  self->_imageBuffer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameSemaphore, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEBUG, "Error: JFXVideoDecoderInterface: don't use this init method", v1, 2u);
}

- (void)initWithFormatDescription:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, a2, a3, "JFXVideoDecoderInterface[%p]: A new session is created for the new format description.\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)decodeFrame:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2269A9000, a2, a3, "JFXVideoDecoderInterface[%p]: Decoding succeeds with the new session!\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)decodeFrame:(os_log_t)log .cold.2(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_debug_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEBUG, "JFXVideoDecoderInterface[%p]: Decoding fails with the new session: %d!\n", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_4();
}

@end
