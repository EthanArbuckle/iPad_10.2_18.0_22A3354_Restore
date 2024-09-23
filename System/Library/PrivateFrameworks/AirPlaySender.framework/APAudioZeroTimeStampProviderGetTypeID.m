@implementation APAudioZeroTimeStampProviderGetTypeID

uint64_t __APAudioZeroTimeStampProviderGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  APAudioZeroTimeStampProviderGetTypeID_typeID = result;
  return result;
}

@end
