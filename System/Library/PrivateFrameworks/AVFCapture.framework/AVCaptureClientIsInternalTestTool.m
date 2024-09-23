@implementation AVCaptureClientIsInternalTestTool

void __AVCaptureClientIsInternalTestTool_block_invoke()
{
  char v0;
  __CFString *v1;

  v1 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  if ((-[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("com.apple.avfoundation.figcam")) & 1) != 0)
    v0 = 1;
  else
    v0 = -[__CFString isEqualToString:](v1, "isEqualToString:", CFSTR("com.apple.avcapture"));
  AVCaptureClientIsInternalTestTool_sAnswer = v0;

}

@end
