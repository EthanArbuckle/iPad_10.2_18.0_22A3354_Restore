@implementation Z31AudioIssueDetectorLibraryLoaderv

void *___Z31AudioIssueDetectorLibraryLoaderv_block_invoke()
{
  void *v0;
  void *result;

  v0 = dlopen("/usr/lib/libAudioIssueDetector.dylib", 1);
  if (v0 || (v0 = dlopen("/usr/local/lib/libAudioIssueDetector.dylib", 1)) != 0)
  {
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD, _QWORD))dlsym(v0, "AudioIssueDetectorCreate");
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD))dlsym(v0, "AudioIssueDetectorInitialize");
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD))dlsym(v0, "AudioIssueDetectorDispose");
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))dlsym(v0, "AudioIssueDetectorSetNodeFormat");
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioIssueDetectorSetNodeFormatWithDirection");
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD))dlsym(v0, "AudioIssueDetectorReset");
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD, _QWORD, _QWORD))dlsym(v0, "AudioIssueDetectorAnalyzeBuffer");
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD, _QWORD))dlsym(v0, "AudioIssueDetectorUpdateReportingSessions");
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioIssueDetectorRemoveNode");
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioIssueDetectorSetUplinkMute");
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioIssueDetectorSetDownlinkVolume");
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioIssueDetectorSetRouteSpecificDownlinkGainAdjustment");
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t)dlsym(v0, "AudioIssueDetectorSetSmartCaseMicMute");
  }
  result = dlopen("/System/Library/Frameworks/AudioToolbox.framework/libAudioDSP.dylib", 1);
  if (result)
  {
    result = dlsym(result, "RegisterAudioUnits_Analyzer");
    if (result)
      return (void *)((uint64_t (*)(void))result)();
  }
  return result;
}

@end
