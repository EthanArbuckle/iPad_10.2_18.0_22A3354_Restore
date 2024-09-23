@implementation ZL42getDDShouldUseLightLinksForResultSymbolLocv

void *___ZL42getDDShouldUseLightLinksForResultSymbolLocv_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_1ECEE6338)
  {
    v2 = (void *)qword_1ECEE6338;
  }
  else
  {
    qword_1ECEE6338 = _sl_dlopen();
    v2 = (void *)qword_1ECEE6338;
    if (!qword_1ECEE6338)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "DDShouldUseLightLinksForResult");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_142 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
