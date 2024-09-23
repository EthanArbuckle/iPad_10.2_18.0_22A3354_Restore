@implementation CMIOExtensionFigCaptureStreamCopyProperty

uint64_t __CMIOExtensionFigCaptureStreamCopyProperty_block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  result = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0D074F8], *MEMORY[0x1E0D078A0], *MEMORY[0x1E0D07320], 0);
  CMIOExtensionFigCaptureStreamCopyProperty_noOpProperties = result;
  return result;
}

@end
