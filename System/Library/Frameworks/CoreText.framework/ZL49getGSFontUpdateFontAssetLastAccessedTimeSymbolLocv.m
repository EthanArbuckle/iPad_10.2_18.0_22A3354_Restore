@implementation ZL49getGSFontUpdateFontAssetLastAccessedTimeSymbolLocv

void *___ZL49getGSFontUpdateFontAssetLastAccessedTimeSymbolLocv_block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  char *v4;
  void *result;
  uint64_t v6;
  char *v7;

  v7 = 0;
  v3 = GSFontLibraryCore(&v7);
  if (!v3)
  {
    a1 = (_QWORD *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *GSFontLibrary()");
    v4 = (char *)objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("TDescriptorSourceDownloadableAsset.cpp"), 51, CFSTR("%s"), v7);
    __break(1u);
    goto LABEL_5;
  }
  v1 = (void *)v3;
  v4 = v7;
  if (v7)
LABEL_5:
    free(v4);
  result = dlsym(v1, "GSFontUpdateFontAssetLastAccessedTime");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getGSFontUpdateFontAssetLastAccessedTimeSymbolLoc(void)::ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

@end
