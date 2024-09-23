@implementation ZL30CreateUplinkSpeechMixerFactoryv

void *___ZL30CreateUplinkSpeechMixerFactoryv_block_invoke()
{
  void *result;
  uint64_t v1;

  result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/libAudioDSP.dylib", 1);
  if (result)
  {
    result = NSClassFromString(CFSTR("AudioDSPUplinkSpeechMixerFactory"));
    if (result)
    {
      v1 = (uint64_t)result;
      result = (void *)objc_msgSend(result, "conformsToProtocol:", &unk_1EE5F4800);
      if ((_DWORD)result)
        CreateUplinkSpeechMixerFactory(void)::sUplinkSpeechMixerFactoryClass = v1;
    }
  }
  return result;
}

@end
