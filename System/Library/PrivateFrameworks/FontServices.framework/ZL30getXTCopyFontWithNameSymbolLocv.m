@implementation ZL30getXTCopyFontWithNameSymbolLocv

void *___ZL30getXTCopyFontWithNameSymbolLocv_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (_MergedGlobals_3)
  {
    v2 = (void *)_MergedGlobals_3;
  }
  else
  {
    _MergedGlobals_3 = _sl_dlopen();
    v2 = (void *)_MergedGlobals_3;
    if (!_MergedGlobals_3)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "XTCopyFontWithName");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_1ECDE6B48 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
