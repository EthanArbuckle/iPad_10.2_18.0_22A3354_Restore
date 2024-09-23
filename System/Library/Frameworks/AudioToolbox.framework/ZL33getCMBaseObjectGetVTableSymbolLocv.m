@implementation ZL33getCMBaseObjectGetVTableSymbolLocv

void *___ZL33getCMBaseObjectGetVTableSymbolLocv_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (CoreMediaLibraryCore(char **)::frameworkLibrary)
  {
    v2 = (void *)CoreMediaLibraryCore(char **)::frameworkLibrary;
  }
  else
  {
    CoreMediaLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
    v2 = (void *)CoreMediaLibraryCore(char **)::frameworkLibrary;
    if (!CoreMediaLibraryCore(char **)::frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "CMBaseObjectGetVTable");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCMBaseObjectGetVTableSymbolLoc(void)::ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
