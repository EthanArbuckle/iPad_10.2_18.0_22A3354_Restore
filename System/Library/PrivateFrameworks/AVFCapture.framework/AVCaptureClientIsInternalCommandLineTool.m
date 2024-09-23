@implementation AVCaptureClientIsInternalCommandLineTool

void __AVCaptureClientIsInternalCommandLineTool_block_invoke()
{
  __CFString *v0;

  v0 = (__CFString *)AVCaptureCopyClientCodeSigningIdentifier();
  AVCaptureClientIsInternalCommandLineTool_sAnswer = -[__CFString isEqualToString:](v0, "isEqualToString:", CFSTR("com.apple.avcapture"));

}

@end
