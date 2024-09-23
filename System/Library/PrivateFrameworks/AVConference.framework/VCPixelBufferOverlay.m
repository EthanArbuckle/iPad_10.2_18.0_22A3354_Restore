@implementation VCPixelBufferOverlay

- (VCPixelBufferOverlay)init
{
  VCPixelBufferOverlay *v2;
  VCPixelBufferOverlay *v3;
  uint64_t v4;
  __int128 v5;
  NSObject *CustomRootQueue;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VCPixelBufferOverlay;
  v2 = -[VCObject init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = MEMORY[0x1E0C9BAA8];
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v2->_transform.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v2->_transform.c = v5;
    *(_OWORD *)&v2->_transform.tx = *(_OWORD *)(v4 + 32);
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v2->_textFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v2->_textFrame.size = (CGSize)v12;
    v2->_stringAttributes = 0;
    v2->_mutableDisplayText = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1000);
    v10 = *MEMORY[0x1E0C9D820];
    v3->_currentVRADimensions = (CGSize)*MEMORY[0x1E0C9D820];
    v3->_currentLongestLine = 0;
    v17 = unk_1D910F058;
    v18 = xmmword_1D910F068;
    v14 = xmmword_1D910F028;
    v15 = unk_1D910F038;
    v16 = xmmword_1D910F048;
    -[VCPixelBufferOverlay currentDetails](v3, "currentDetails");
    LOBYTE(v14) = 1;
    BYTE1(v14) = VCOverlayManager_dispatchedIsOverlayEnabled();
    BYTE2(v14) = 1;
    *(_QWORD *)((char *)&v14 + 4) = 0;
    v15 = v11;
    v16 = v12;
    v17 = v10;
    *(_QWORD *)&v18 = 0;
    v13[2] = v12;
    v13[3] = v10;
    v13[4] = v18;
    v13[0] = v14;
    v13[1] = v11;
    -[VCPixelBufferOverlay setCurrentDetails:](v3, "setCurrentDetails:", v13);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
    v3->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCPixelBufferOverlay.stateQueue", 0, CustomRootQueue);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCPixelBufferOverlay init].cold.1(v8, v9);
  }
  return v3;
}

- (void)dealloc
{
  __CFDictionary *stringAttributes;
  __CFString *mutableDisplayText;
  tagVCOverlaySource *audioInfo;
  tagVCOverlaySource *videoInfo;
  tagVCOverlaySource *networkInfo;
  NSObject *stateQueue;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  stringAttributes = self->_stringAttributes;
  if (stringAttributes)
    CFRelease(stringAttributes);
  mutableDisplayText = self->_mutableDisplayText;
  if (mutableDisplayText)
    CFRelease(mutableDisplayText);
  audioInfo = self->_audioInfo;
  if (audioInfo)
    CFRelease(audioInfo);
  videoInfo = self->_videoInfo;
  if (videoInfo)
    CFRelease(videoInfo);
  networkInfo = self->_networkInfo;
  if (networkInfo)
    CFRelease(networkInfo);
  stateQueue = self->_stateQueue;
  if (stateQueue)
    dispatch_release(stateQueue);
  v9.receiver = self;
  v9.super_class = (Class)VCPixelBufferOverlay;
  -[VCObject dealloc](&v9, sel_dealloc);
}

void __VCPixelBufferOverlay_updateSourceForType_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[6];
  if (v2)
  {
    CFRetain((CFTypeRef)v2);
    v2 = a1[6];
  }
  v3 = *(unsigned __int8 *)(v2 + 28);
  if (v3 == 2)
  {
    v4 = a1[4];
    v5 = 200;
    if (*(_QWORD *)(v4 + 200))
    {
      CFRelease(*(CFTypeRef *)(v4 + 200));
      v2 = a1[6];
      v4 = a1[4];
      v5 = 200;
    }
    goto LABEL_10;
  }
  if (v3 == 1)
  {
    v6 = a1[4];
    if (*(_QWORD *)(v6 + 192))
    {
      CFRelease(*(CFTypeRef *)(v6 + 192));
      v2 = a1[6];
      v6 = a1[4];
    }
    *(_QWORD *)(v6 + 176) = *(_QWORD *)(v2 + 16);
    *(_QWORD *)(a1[4] + 192) = v2;
  }
  else
  {
    if (!*(_BYTE *)(v2 + 28))
    {
      v4 = a1[4];
      v5 = 184;
      if (*(_QWORD *)(v4 + 184))
      {
        CFRelease(*(CFTypeRef *)(v4 + 184));
        v2 = a1[6];
        v4 = a1[4];
        v5 = 184;
      }
LABEL_10:
      *(_QWORD *)(v4 + v5) = v2;
      return;
    }
    CFRelease((CFTypeRef)v2);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }
}

- (tagVCPixelBufferOverlayConfig)currentDetails
{
  tagVCPixelBufferOverlayConfig *result;

  objc_copyStruct(retstr, &self->_currentDetails, 80, 1, 0);
  return result;
}

- (void)setCurrentDetails:(tagVCPixelBufferOverlayConfig *)a3
{
  objc_copyStruct(&self->_currentDetails, a3, 80, 1, 0);
}

- (void)init
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCPixelBufferOverlay init]";
  v6 = 1024;
  v7 = 64;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to initialize VCPixelBufferOverlay", (uint8_t *)&v2, 0x1Cu);
}

@end
