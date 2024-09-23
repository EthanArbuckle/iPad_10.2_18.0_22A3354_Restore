@implementation ZL45getPLLogTimeSensitiveRegisteredEventSymbolLocv

void *___ZL45getPLLogTimeSensitiveRegisteredEventSymbolLocv_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!PowerLogLibraryCore(char **)::frameworkLibrary)
    PowerLogLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v2 = (void *)PowerLogLibraryCore(char **)::frameworkLibrary;
  if (!PowerLogLibraryCore(char **)::frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PowerLogLibrary()");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("HapticMetrics.mm"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "PLLogTimeSensitiveRegisteredEvent");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getPLLogTimeSensitiveRegisteredEventSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
