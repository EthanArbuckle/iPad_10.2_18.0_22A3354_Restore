@implementation ZL34getAudioCaptureInitializeSymbolLocv

void *___ZL34getAudioCaptureInitializeSymbolLocv_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AudioCaptureLibraryCore(char **)::frameworkLibrary)
  {
    v2 = (void *)AudioCaptureLibraryCore(char **)::frameworkLibrary;
  }
  else
  {
    AudioCaptureLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    v2 = (void *)AudioCaptureLibraryCore(char **)::frameworkLibrary;
    if (!AudioCaptureLibraryCore(char **)::frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AudioCaptureInitialize");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAudioCaptureInitializeSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
