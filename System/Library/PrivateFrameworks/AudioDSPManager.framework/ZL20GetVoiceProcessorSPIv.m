@implementation ZL20GetVoiceProcessorSPIv

_DWORD *___ZL20GetVoiceProcessorSPIv_block_invoke()
{
  _DWORD *result;

  result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/libAudioDSP.dylib", 1);
  if (result)
  {
    result = dlsym(result, "gVoiceProcessorSPI");
    if (result)
    {
      if (*result >= 0xBu)
        GetVoiceProcessorSPI(void)::sVoiceProcessorSPI = (uint64_t)result;
    }
  }
  return result;
}

@end
