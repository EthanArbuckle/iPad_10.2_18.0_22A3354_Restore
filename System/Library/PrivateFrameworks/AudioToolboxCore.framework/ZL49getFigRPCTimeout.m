@implementation ZL49getFigRPCTimeout

void *___ZL49getFigRPCTimeout_KillAndForceCrashReportSymbolLocv_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!CoreMediaLibraryCore(char **)::frameworkLibrary)
    CoreMediaLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v2 = (void *)CoreMediaLibraryCore(char **)::frameworkLibrary;
  if (!CoreMediaLibraryCore(char **)::frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreMediaLibrary()");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("RPCTimeout.mm"), 29, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "FigRPCTimeout_KillAndForceCrashReport");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getFigRPCTimeout_KillAndForceCrashReportSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
