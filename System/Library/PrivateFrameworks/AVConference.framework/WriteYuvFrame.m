@implementation WriteYuvFrame

void __WriteYuvFrame_block_invoke(uint64_t a1)
{
  OSType PixelFormatType;
  char *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  int WidthOfPlane;
  int HeightOfPlane;
  char *v7;
  size_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *BaseAddress;
  size_t BytesPerRow;
  int Width;
  int Height;
  size_t v24;
  uint64_t v25;
  NSObject *v26;

  PixelFormatType = CVPixelBufferGetPixelFormatType(*(CVPixelBufferRef *)(a1 + 32));
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
  if ((PixelFormatType & 0xFFFFFFEF) == 0x34323066)
  {
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(a1 + 32), 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(a1 + 32), 0);
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(*(CVPixelBufferRef *)(a1 + 32), 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(*(CVPixelBufferRef *)(a1 + 32), 0);
    if (HeightOfPlane >= 1)
    {
      do
      {
        fwrite(BaseAddressOfPlane, 1uLL, WidthOfPlane, *(FILE **)(a1 + 40));
        BaseAddressOfPlane += BytesPerRowOfPlane;
        --HeightOfPlane;
      }
      while (HeightOfPlane);
    }
    v7 = (char *)CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
    v8 = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
    v9 = CVPixelBufferGetWidthOfPlane(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
    v10 = CVPixelBufferGetHeightOfPlane(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
    if (v10 >= 1)
    {
      v11 = 0;
      v12 = v10;
      v13 = v7;
      do
      {
        v14 = v9;
        v15 = v13;
        if (v9 >= 1)
        {
          do
          {
            fwrite(v15, 1uLL, 1uLL, *(FILE **)(a1 + 40));
            v15 += 2;
            --v14;
          }
          while (v14);
        }
        ++v11;
        v13 += v8;
      }
      while (v11 != v12);
      v16 = 0;
      v17 = v7 + 1;
      do
      {
        v18 = v9;
        v19 = v17;
        if (v9 >= 1)
        {
          do
          {
            fwrite(v19, 1uLL, 1uLL, *(FILE **)(a1 + 40));
            v19 += 2;
            --v18;
          }
          while (v18);
        }
        ++v16;
        v17 += v8;
      }
      while (v16 != v12);
    }
  }
  else if (PixelFormatType == 846624121)
  {
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 32));
    BytesPerRow = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a1 + 32));
    Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 32));
    Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 32));
    if (Height >= 1)
    {
      v24 = 2 * Width;
      do
      {
        fwrite(BaseAddress, 1uLL, v24, *(FILE **)(a1 + 40));
        BaseAddress += BytesPerRow;
        --Height;
      }
      while (Height);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __WriteYuvFrame_block_invoke_cold_1(v25, PixelFormatType, v26);
  }
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a1 + 32), 1uLL);
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 32));
  if (*(_BYTE *)(a1 + 48))
    fclose(*(FILE **)(a1 + 40));
}

void __WriteYuvFrame_block_invoke_cold_1(uint64_t a1, int a2, NSObject *a3)
{
  __int16 v5;
  __int16 v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  FourccToCStr(a2);
  v8 = 136316162;
  v9 = a1;
  v10 = 2080;
  OUTLINED_FUNCTION_9();
  v11 = 173;
  v12 = v5;
  v13 = 173;
  v14 = v6;
  v15 = v7;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/Others/VideoUtil.m:%d: Unknown pixel format '%s'", (uint8_t *)&v8, 0x2Cu);
}

@end
