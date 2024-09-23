@implementation AVTFaceTrackingIsSupported

uint64_t __AVTFaceTrackingIsSupported_block_invoke()
{
  int v0;
  uint64_t result;

  v0 = MGIsQuestionValid();
  if (v0)
    LOBYTE(v0) = MGGetBoolAnswer();
  AVTFaceTrackingIsSupported_kAVTFaceTrackingIsSupported = v0;
  result = MGIsQuestionValid();
  if ((_DWORD)result)
    result = MGGetBoolAnswer();
  AVTFaceTrackingIsSupported_kAVTFaceTrackingIsSupported |= result;
  return result;
}

@end
