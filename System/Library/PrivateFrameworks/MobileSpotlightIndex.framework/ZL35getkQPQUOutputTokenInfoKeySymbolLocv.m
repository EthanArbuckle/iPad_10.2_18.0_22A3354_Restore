@implementation ZL35getkQPQUOutputTokenInfoKeySymbolLocv

void *___ZL35getkQPQUOutputTokenInfoKeySymbolLocv_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!QueryParserLibraryCore(char **)::frameworkLibrary)
    QueryParserLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v2 = (void *)QueryParserLibraryCore(char **)::frameworkLibrary;
  if (!QueryParserLibraryCore(char **)::frameworkLibrary)
  {
    a1 = (_QWORD *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *QueryParserLibrary()"), CFSTR("PRQueryProcessor.mm"), 27, CFSTR("%s"), 0);
    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "kQPQUOutputTokenInfoKey");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getkQPQUOutputTokenInfoKeySymbolLoc(void)::ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
