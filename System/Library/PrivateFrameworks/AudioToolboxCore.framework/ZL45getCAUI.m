@implementation ZL45getCAUI

void *___ZL45getCAUI_retrieveHostIconForAudioUnitSymbolLocv_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!CoreAudioKitLibraryCore(char **)::frameworkLibrary)
    CoreAudioKitLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v2 = (void *)CoreAudioKitLibraryCore(char **)::frameworkLibrary;
  if (!CoreAudioKitLibraryCore(char **)::frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreAudioKitLibrary()");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("AUAudioUnit_Internal.h"), 352, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "CAUI_retrieveHostIconForAudioUnit");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getCAUI_retrieveHostIconForAudioUnitSymbolLoc(void)::ptr = *(_UNKNOWN **)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
