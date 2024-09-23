@implementation ZN13MEOWACDecoder8LoadOpusEv

void *___ZN13MEOWACDecoder8LoadOpusEv_block_invoke()
{
  void *result;
  void *v1;
  AudioComponentPlugInInterface *(__cdecl *v2)(const AudioComponentDescription *);
  AudioComponentDescription v3;

  result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/AudioCodecs", 5);
  if (result)
  {
    v1 = result;
    v2 = (AudioComponentPlugInInterface *(__cdecl *)(const AudioComponentDescription *))dlsym(result, "ACOpusDecoderFactory");
    if (v2)
    {
      *(_OWORD *)&v3.componentType = xmmword_1D22CF590;
      v3.componentFlagsMask = 0;
      result = AudioComponentRegister(&v3, &stru_1E936B8A8, 0, v2);
      MEOWACDecoder::LoadOpus(void)::sOpusDecoderComponent = (uint64_t)result;
      if (result)
        return result;
      return (void *)dlclose(v1);
    }
    result = (void *)MEOWACDecoder::LoadOpus(void)::sOpusDecoderComponent;
    if (!MEOWACDecoder::LoadOpus(void)::sOpusDecoderComponent)
      return (void *)dlclose(v1);
  }
  return result;
}

@end
