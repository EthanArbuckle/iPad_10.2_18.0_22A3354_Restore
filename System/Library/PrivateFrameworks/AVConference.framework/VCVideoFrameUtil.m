@implementation VCVideoFrameUtil

+ (id)newXPCDictionaryWithCVPixelBuffer:(__CVBuffer *)a3 depthPixelBuffer:(__CVBuffer *)a4 time:(id *)a5
{
  __IOSurface *IOSurface;
  xpc_object_t XPCObject;
  void *v9;
  const __CFAllocator *v10;
  CFDictionaryRef v11;
  void *v12;
  xpc_object_t v13;
  __IOSurface *v14;
  xpc_object_t v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCVideoFrameUtil newXPCDictionaryWithCVPixelBuffer:depthPixelBuffer:time:].cold.1();
    }
    return 0;
  }
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (!IOSurface)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCVideoFrameUtil newXPCDictionaryWithCVPixelBuffer:depthPixelBuffer:time:].cold.2();
    }
    return 0;
  }
  XPCObject = IOSurfaceCreateXPCObject(IOSurface);
  if (!XPCObject)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCVideoFrameUtil newXPCDictionaryWithCVPixelBuffer:depthPixelBuffer:time:].cold.3();
    }
    return 0;
  }
  v9 = XPCObject;
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v17 = *a5;
  v11 = CMTimeCopyAsDictionary((CMTime *)&v17, v10);
  v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v13, "vcEffectsXPCIOSurface", v9);
  xpc_dictionary_set_value(v13, "vcEffectsXPCCMTime", v12);
  if (a4)
  {
    v14 = CVPixelBufferGetIOSurface(a4);
    v15 = IOSurfaceCreateXPCObject(v14);
    xpc_dictionary_set_value(v13, "vcEffectsXPCDepthIOSurface", v15);
    xpc_release(v15);
  }
  if (v11)
    CFRelease(v11);
  if (v12)
    xpc_release(v12);
  xpc_release(v9);
  return v13;
}

+ (__CVBuffer)newCVPixelBufferFromXPCDictionary:(id)a3 isDepth:(BOOL)a4
{
  const char *v4;
  xpc_object_t value;
  __CVBuffer *result;
  __CVBuffer *v7;
  CVReturn v8;
  CVReturn v9;
  uint64_t v10;
  NSObject *v11;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  CVReturn v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  pixelBufferOut = 0;
  if (a4)
    v4 = "vcEffectsXPCDepthIOSurface";
  else
    v4 = "vcEffectsXPCIOSurface";
  value = xpc_dictionary_get_value(a3, v4);
  result = IOSurfaceLookupFromXPCObject(value);
  if (result)
  {
    v7 = result;
    v8 = CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], result, 0, &pixelBufferOut);
    if (v8)
    {
      v9 = v8;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v14 = v10;
          v15 = 2080;
          v16 = "+[VCVideoFrameUtil newCVPixelBufferFromXPCDictionary:isDepth:]";
          v17 = 1024;
          v18 = 67;
          v19 = 1024;
          v20 = v9;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Could not recreate pixel buffer from surface: %d", buf, 0x22u);
        }
      }
    }
    CFRelease(v7);
    return pixelBufferOut;
  }
  return result;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)CMTimeFromXPCDictionary:(SEL)a3
{
  const __CFDictionary *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  xpc_dictionary_get_value(a4, "vcEffectsXPCCMTime");
  v5 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject();
  memset(retstr, 170, sizeof($3CC8671D27C23BF42ADDB32F2B5E48AE));
  CMTimeMakeFromDictionary((CMTime *)retstr, v5);
  CFRelease(v5);
  return result;
}

+ (void)newXPCDictionaryWithCVPixelBuffer:depthPixelBuffer:time:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d pixelBuffer is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)newXPCDictionaryWithCVPixelBuffer:depthPixelBuffer:time:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CVPixelBufferGetIOSurface returned NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)newXPCDictionaryWithCVPixelBuffer:depthPixelBuffer:time:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d IOSurfaceCreateXPCObject returned NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
