@implementation ZL32getPLLogRegisteredEventSymbolLocv

void *___ZL32getPLLogRegisteredEventSymbolLocv_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (PowerLogLibraryCore(char **)::frameworkLibrary)
  {
    v2 = (void *)PowerLogLibraryCore(char **)::frameworkLibrary;
  }
  else
  {
    PowerLogLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    v2 = (void *)PowerLogLibraryCore(char **)::frameworkLibrary;
    if (!PowerLogLibraryCore(char **)::frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "PLLogRegisteredEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getPLLogRegisteredEventSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
