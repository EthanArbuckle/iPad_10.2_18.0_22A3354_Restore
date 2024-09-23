@implementation ZL31getkFigSTSLabel

void *___ZL31getkFigSTSLabel_GlobalSymbolLocv_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!MediaToolboxLibraryCore(char **)::frameworkLibrary)
    MediaToolboxLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v2 = (void *)MediaToolboxLibraryCore(char **)::frameworkLibrary;
  if (!MediaToolboxLibraryCore(char **)::frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaToolboxLibrary()");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("STS_N_Singleton.mm"), 20, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "kFigSTSLabel_Global");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getkFigSTSLabel_GlobalSymbolLoc(void)::ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
