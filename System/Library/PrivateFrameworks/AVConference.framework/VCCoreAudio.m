@implementation VCCoreAudio

VCCoreAudio_AudioUnitMock *__43__VCCoreAudio_AudioUnitMock_sharedInstance__block_invoke()
{
  VCCoreAudio_AudioUnitMock *result;

  result = objc_alloc_init(VCCoreAudio_AudioUnitMock);
  sharedInstance__audioUnitMock = (uint64_t)result;
  return result;
}

@end
