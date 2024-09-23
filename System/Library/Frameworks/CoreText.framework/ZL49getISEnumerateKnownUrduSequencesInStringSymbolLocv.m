@implementation ZL49getISEnumerateKnownUrduSequencesInStringSymbolLocv

void *___ZL49getISEnumerateKnownUrduSequencesInStringSymbolLocv_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!qword_1ECDE7818)
    qword_1ECDE7818 = _sl_dlopen();
  v2 = (void *)qword_1ECDE7818;
  if (!qword_1ECDE7818)
  {
    a1 = (_QWORD *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *InternationalSupportLibrary()"), CFSTR("LocaleSupport.cpp"), 1101, CFSTR("%s"), 0);
    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "ISEnumerateKnownUrduSequencesInString");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  qword_1ECDE7820 = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
