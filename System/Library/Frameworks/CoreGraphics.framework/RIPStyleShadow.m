@implementation RIPStyleShadow

double __RIPStyleShadow_block_invoke()
{
  double result;

  rips_s_cs = (uint64_t)CGColorSpaceCreateDeviceGray();
  if (rips_s_cs)
  {
    result = *(double *)&_rips_class;
    *(_QWORD *)&RIPStyleShadow_rips_s_cls = rips_s_super;
    *((_QWORD *)&RIPStyleShadow_rips_s_cls + 1) = rips_s_size;
    qword_1ECDA68B8 = (uint64_t)rips_retain;
    unk_1ECDA68C0 = rips_s_release;
    qword_1ECDA68C8 = (uint64_t)rips_s_Create;
    unk_1ECDA68D0 = rips_s_Growth;
    qword_1ECDA68D8 = (uint64_t)rips_s_ColorSpace;
    unk_1ECDA68E0 = rips_s_BltShape;
    qword_1ECDA68E8 = (uint64_t)rips_s_BltGlyph;
    unk_1ECDA68F0 = rips_s_BltImage;
    qword_1ECDA68F8 = (uint64_t)rips_s_BltShade;
  }
  return result;
}

@end
