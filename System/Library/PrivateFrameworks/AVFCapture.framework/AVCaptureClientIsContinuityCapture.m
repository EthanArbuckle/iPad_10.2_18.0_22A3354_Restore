@implementation AVCaptureClientIsContinuityCapture

void __AVCaptureClientIsContinuityCapture_block_invoke()
{
  char v0;
  __CFString *v1;

  v1 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  if ((-[__CFString isEqualToString:](v1, "isEqualToString:", 0x1E4221DE8) & 1) != 0)
    v0 = 1;
  else
    v0 = -[__CFString isEqualToString:](v1, "isEqualToString:", 0x1E4221DA8);
  AVCaptureClientIsContinuityCapture_sAnswer = v0;

}

@end
