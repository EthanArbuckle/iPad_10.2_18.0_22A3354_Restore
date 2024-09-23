@implementation MSVGetMaximumScreenScale

void __MSVGetMaximumScreenScale_block_invoke()
{
  void *v0;
  void *v1;
  float v2;
  NSObject *v3;
  uint8_t buf[4];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MGCopyAnswerWithError();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "floatValue");
    *(double *)&MSVGetMaximumScreenScale_deviceScreenScale = v2;
  }
  else
  {
    v3 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v5 = 0;
      _os_log_impl(&dword_1A077D000, v3, OS_LOG_TYPE_ERROR, "Failed to get main screen scale from MobileGestalt (error = %d)", buf, 8u);
    }

  }
}

@end
