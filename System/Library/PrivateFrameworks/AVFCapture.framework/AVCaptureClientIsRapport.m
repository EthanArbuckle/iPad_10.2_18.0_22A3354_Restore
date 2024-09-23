@implementation AVCaptureClientIsRapport

void __AVCaptureClientIsRapport_block_invoke()
{
  __CFString *v0;

  v0 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  AVCaptureClientIsRapport_sAnswer = -[__CFString isEqualToString:](v0, "isEqualToString:", 0x1E4221688);

}

@end
