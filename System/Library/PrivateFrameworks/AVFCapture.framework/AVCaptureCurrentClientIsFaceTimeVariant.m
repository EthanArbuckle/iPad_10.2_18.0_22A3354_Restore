@implementation AVCaptureCurrentClientIsFaceTimeVariant

void __AVCaptureCurrentClientIsFaceTimeVariant_block_invoke()
{
  __CFString *v0;

  v0 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  AVCaptureCurrentClientIsFaceTimeVariant_sAnswer = AVCaptureClientIsFaceTimeVariant(v0);

}

@end
