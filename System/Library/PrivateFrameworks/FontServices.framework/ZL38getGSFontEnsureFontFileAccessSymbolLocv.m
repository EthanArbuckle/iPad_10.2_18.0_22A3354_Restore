@implementation ZL38getGSFontEnsureFontFileAccessSymbolLocv

void *___ZL38getGSFontEnsureFontFileAccessSymbolLocv_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *result;
  char *v5;

  v5 = 0;
  v2 = (void *)GSFontLibraryCore(&v5);
  v3 = v5;
  if (!v2)
  {
    v3 = (void *)abort_report_np();
    goto LABEL_5;
  }
  if (v5)
LABEL_5:
    free(v3);
  result = dlsym(v2, "GSFontEnsureFontFileAccess");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getGSFontEnsureFontFileAccessSymbolLoc(void)::ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
