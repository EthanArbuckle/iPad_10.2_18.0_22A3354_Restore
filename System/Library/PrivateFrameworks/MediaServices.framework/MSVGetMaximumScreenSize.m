@implementation MSVGetMaximumScreenSize

void __MSVGetMaximumScreenSize_block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  uint64_t v3;
  NSObject *v4;
  CGAffineTransform v5;
  int v6;
  int v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v0 = (void *)MGCopyAnswerWithError();
  v6 = 0;
  v1 = (void *)MGCopyAnswerWithError();
  if (objc_msgSend(v0, "integerValue") < 1 || objc_msgSend(v1, "integerValue") < 1)
  {
    if (MSVGetMaximumScreenScale_onceToken != -1)
      dispatch_once(&MSVGetMaximumScreenScale_onceToken, &__block_literal_global_93_2142);
    CGAffineTransformMakeScale(&v5, *(CGFloat *)&MSVGetMaximumScreenScale_deviceScreenScale, *(CGFloat *)&MSVGetMaximumScreenScale_deviceScreenScale);
    *(double *)&MSVGetMaximumScreenSize_maximumScreenSize_0 = v5.c * 1024.0 + v5.a * 1366.0;
    *(double *)&MSVGetMaximumScreenSize_maximumScreenSize_1 = v5.d * 1024.0 + v5.b * 1366.0;
    v4 = os_log_create("com.apple.amp.MediaServices", "SystemUtilities");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v9 = v7;
      v10 = 1024;
      v11 = v6;
      _os_log_impl(&dword_1A077D000, v4, OS_LOG_TYPE_ERROR, "Failed to get screen size from MobileGestalt (width_error = %d / height_error = %d", buf, 0xEu);
    }

  }
  else
  {
    v2 = (double)objc_msgSend(v0, "integerValue");
    v3 = objc_msgSend(v1, "integerValue");
    MSVGetMaximumScreenSize_maximumScreenSize_0 = *(_QWORD *)&v2;
    *(double *)&MSVGetMaximumScreenSize_maximumScreenSize_1 = (double)v3;
  }

}

@end
