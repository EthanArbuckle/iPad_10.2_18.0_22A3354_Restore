@implementation CPTimeFormatIs24HourModeSymbolLoc

void *__get_CPTimeFormatIs24HourModeSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AppSupportLibraryCore_frameworkLibrary)
  {
    v2 = (void *)AppSupportLibraryCore_frameworkLibrary;
  }
  else
  {
    AppSupportLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)AppSupportLibraryCore_frameworkLibrary;
    if (!AppSupportLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "_CPTimeFormatIs24HourMode");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  get_CPTimeFormatIs24HourModeSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
