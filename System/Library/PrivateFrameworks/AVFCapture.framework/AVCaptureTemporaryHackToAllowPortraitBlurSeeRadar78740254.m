@implementation AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254

void __AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254_block_invoke()
{
  char v0;
  __CFString *v1;

  v1 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  if ((-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("com.apple.camera")) & 1) != 0)
    v0 = 1;
  else
    v0 = -[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("com.apple.VisionKit.KeyboardCamera"));
  AVCaptureTemporaryHackToAllowPortraitBlurSeeRadar78740254_sAnswer = v0;

}

@end
