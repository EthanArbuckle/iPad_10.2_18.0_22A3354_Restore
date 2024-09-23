@implementation APCarPlayAudioFormatsGetTypeID

uint64_t __APCarPlayAudioFormatsGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  APCarPlayAudioFormatsGetTypeID_typeID = result;
  return result;
}

@end
