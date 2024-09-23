@implementation AVCaptureClientIsCameraOrDerivative

void __AVCaptureClientIsCameraOrDerivative_block_invoke()
{
  char v0;
  __CFString *v1;

  v1 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  if ((-[__CFString isEqualToString:](v1, "isEqualToString:", 0x1E4220D28) & 1) != 0
    || (-[__CFString isEqualToString:](v1, "isEqualToString:", 0x1E4221D88) & 1) != 0)
  {
    v0 = 1;
  }
  else
  {
    v0 = -[__CFString isEqualToString:](v1, "isEqualToString:", 0x1E4221D68);
  }
  AVCaptureClientIsCameraOrDerivative_sAnswer = v0;

}

@end
