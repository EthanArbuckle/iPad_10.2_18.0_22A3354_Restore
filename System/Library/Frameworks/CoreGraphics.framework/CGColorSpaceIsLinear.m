@implementation CGColorSpaceIsLinear

BOOL __CGColorSpaceIsLinear_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a2 + 28);
  if (!v2)
    return 1;
  if (v2 != 1)
    return 0;
  v3 = **(_QWORD **)(a2 + 52);
  if (CGColorTRCGetGammaID_cglibrarypredicate != -1)
    dispatch_once(&CGColorTRCGetGammaID_cglibrarypredicate, &__block_literal_global_6);
  return CGColorTRCGetGammaID_f(v3) == 7;
}

@end
