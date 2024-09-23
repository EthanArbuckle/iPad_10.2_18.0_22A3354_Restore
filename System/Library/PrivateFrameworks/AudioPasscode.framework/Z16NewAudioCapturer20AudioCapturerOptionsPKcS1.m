@implementation Z16NewAudioCapturer20AudioCapturerOptionsPKcS1

void *___Z16NewAudioCapturer20AudioCapturerOptionsPKcS1_jPK27AudioStreamBasicDescriptionRS3__block_invoke()
{
  void *result;

  result = dlopen((const char *)_ZZZ16NewAudioCapturer20AudioCapturerOptionsPKcS1_jPK27AudioStreamBasicDescriptionRS3_EUb_E8kLibPath, 5);
  if (result)
  {
    result = dlsym(result, "NewAudioCapturerImpl");
    if (result)
      NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))result;
  }
  return result;
}

@end
