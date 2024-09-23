@implementation CMContinityCaptureDebugLogEnabled

uint64_t __CMContinityCaptureDebugLogEnabled_block_invoke()
{
  uint64_t result;

  result = CMContinuityCaptureGetBootArgsForKey(CFSTR("CMCaptureDebug"));
  CMContinityCaptureDebugLogEnabled_debugOptions = result;
  return result;
}

@end
