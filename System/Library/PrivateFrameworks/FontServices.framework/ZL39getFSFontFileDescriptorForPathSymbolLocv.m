@implementation ZL39getFSFontFileDescriptorForPathSymbolLocv

void *___ZL39getFSFontFileDescriptorForPathSymbolLocv_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (_MergedGlobals)
  {
    v2 = (void *)_MergedGlobals;
  }
  else
  {
    _MergedGlobals = _sl_dlopen();
    v2 = (void *)_MergedGlobals;
    if (!_MergedGlobals)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "FSFontFileDescriptorForPath");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1ECDE6AD0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
