@implementation ZL44getCreateIsolatedAudioServicePortalSymbolLocv

void *___ZL44getCreateIsolatedAudioServicePortalSymbolLocv_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!IsolatedCoreAudioClientLibraryCore(char **)::frameworkLibrary)
    IsolatedCoreAudioClientLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v2 = (void *)IsolatedCoreAudioClientLibraryCore(char **)::frameworkLibrary;
  if (!IsolatedCoreAudioClientLibraryCore(char **)::frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IsolatedCoreAudioClientLibrary()");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("IsolatedCoreAudioServer.mm"), 10, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "CreateIsolatedAudioServicePortal");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getCreateIsolatedAudioServicePortalSymbolLoc(void)::ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
