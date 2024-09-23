@implementation NTKCScreenEdgeMargin

double __NTKCScreenEdgeMargin_block_invoke()
{
  double result;

  if (NTKCScreenStyle_onceToken != -1)
    dispatch_once(&NTKCScreenStyle_onceToken, &__block_literal_global_171);
  if ((unint64_t)(NTKCScreenStyle_style + 1) <= 2)
  {
    result = dbl_1B7560600[NTKCScreenStyle_style + 1];
    NTKCScreenEdgeMargin_margin = *(_QWORD *)&result;
  }
  return result;
}

@end
