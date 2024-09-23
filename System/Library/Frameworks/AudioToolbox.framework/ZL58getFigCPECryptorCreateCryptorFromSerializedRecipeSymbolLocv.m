@implementation ZL58getFigCPECryptorCreateCryptorFromSerializedRecipeSymbolLocv

void *___ZL58getFigCPECryptorCreateCryptorFromSerializedRecipeSymbolLocv_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (MediaToolboxLibraryCore(char **)::frameworkLibrary)
  {
    v2 = (void *)MediaToolboxLibraryCore(char **)::frameworkLibrary;
  }
  else
  {
    MediaToolboxLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    v2 = (void *)MediaToolboxLibraryCore(char **)::frameworkLibrary;
    if (!MediaToolboxLibraryCore(char **)::frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "FigCPECryptorCreateCryptorFromSerializedRecipe");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getFigCPECryptorCreateCryptorFromSerializedRecipeSymbolLoc(void)::ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                + 8)
                                                                                    + 24);
  return result;
}

@end
