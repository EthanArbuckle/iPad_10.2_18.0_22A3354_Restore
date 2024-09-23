@implementation Z31AudioIssueDetectorLibraryLoaderv

void *___Z31AudioIssueDetectorLibraryLoaderv_block_invoke()
{
  void *v0;
  void *result;

  v0 = dlopen("/usr/lib/libAudioIssueDetector.dylib", 1);
  if (v0 || (v0 = dlopen("/usr/local/lib/libAudioIssueDetector.dylib", 1)) != 0)
  {
    AudioIssueDetectorLibraryLoader(void)::libSym = dlsym(v0, "AudioIssueDetectorCreate");
    off_254E41A18 = (uint64_t (*)(_QWORD))dlsym(v0, "AudioIssueDetectorInitialize");
    off_254E41A20 = (uint64_t (*)(_QWORD))dlsym(v0, "AudioIssueDetectorDispose");
    qword_254E41A28 = (uint64_t)dlsym(v0, "AudioIssueDetectorSetNodeFormat");
    off_254E41A30 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))dlsym(v0, "AudioIssueDetectorSetNodeFormatWithDirection");
    off_254E41A38 = (uint64_t (*)(_QWORD))dlsym(v0, "AudioIssueDetectorReset");
    off_254E41A40 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))dlsym(v0, "AudioIssueDetectorAnalyzeBuffer");
    qword_254E41A48 = (uint64_t)dlsym(v0, "AudioIssueDetectorUpdateReportingSessions");
    qword_254E41A50 = (uint64_t)dlsym(v0, "AudioIssueDetectorRemoveNode");
    qword_254E41A58 = (uint64_t)dlsym(v0, "AudioIssueDetectorSetUplinkMute");
    qword_254E41A60 = (uint64_t)dlsym(v0, "AudioIssueDetectorSetDownlinkVolume");
    qword_254E41A68 = (uint64_t)dlsym(v0, "AudioIssueDetectorSetRouteSpecificDownlinkGainAdjustment");
    qword_254E41A70 = (uint64_t)dlsym(v0, "AudioIssueDetectorSetSmartCaseMicMute");
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

void *___Z31AudioIssueDetectorLibraryLoaderv_block_invoke_0()
{
  void *v0;
  void *result;

  v0 = dlopen("/usr/lib/libAudioIssueDetector.dylib", 1);
  if (v0 || (v0 = dlopen("/usr/local/lib/libAudioIssueDetector.dylib", 1)) != 0)
  {
    AudioIssueDetectorLibraryLoader(void)::libSym = (uint64_t (*)(_QWORD, _QWORD))dlsym(v0, "AudioIssueDetectorCreate");
    off_254E41A18 = (uint64_t (*)(_QWORD))dlsym(v0, "AudioIssueDetectorInitialize");
    off_254E41A20 = (uint64_t (*)(_QWORD))dlsym(v0, "AudioIssueDetectorDispose");
    qword_254E41A28 = (uint64_t)dlsym(v0, "AudioIssueDetectorSetNodeFormat");
    off_254E41A30 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))dlsym(v0, "AudioIssueDetectorSetNodeFormatWithDirection");
    off_254E41A38 = (uint64_t (*)(_QWORD))dlsym(v0, "AudioIssueDetectorReset");
    off_254E41A40 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))dlsym(v0, "AudioIssueDetectorAnalyzeBuffer");
    qword_254E41A48 = (uint64_t)dlsym(v0, "AudioIssueDetectorUpdateReportingSessions");
    qword_254E41A50 = (uint64_t)dlsym(v0, "AudioIssueDetectorRemoveNode");
    qword_254E41A58 = (uint64_t)dlsym(v0, "AudioIssueDetectorSetUplinkMute");
    qword_254E41A60 = (uint64_t)dlsym(v0, "AudioIssueDetectorSetDownlinkVolume");
    qword_254E41A68 = (uint64_t)dlsym(v0, "AudioIssueDetectorSetRouteSpecificDownlinkGainAdjustment");
    qword_254E41A70 = (uint64_t)dlsym(v0, "AudioIssueDetectorSetSmartCaseMicMute");
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
