@implementation VSCopyLanguageIdentifierForLocaleSymbolLoc

void *__get_VSCopyLanguageIdentifierForLocaleSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (VoiceServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)VoiceServicesLibraryCore_frameworkLibrary;
  }
  else
  {
    VoiceServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)VoiceServicesLibraryCore_frameworkLibrary;
    if (!VoiceServicesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "_VSCopyLanguageIdentifierForLocale");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_VSCopyLanguageIdentifierForLocaleSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
