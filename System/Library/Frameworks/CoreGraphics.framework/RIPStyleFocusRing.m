@implementation RIPStyleFocusRing

double __RIPStyleFocusRing_block_invoke()
{
  double result;

  rips_f_cs = (uint64_t)CGColorSpaceCreateDeviceGray();
  if (rips_f_cs)
  {
    result = *(double *)&_rips_class;
    *(_QWORD *)&RIPStyleFocusRing_rips_f_cls = rips_f_super;
    *((_QWORD *)&RIPStyleFocusRing_rips_f_cls + 1) = rips_f_size;
    qword_1EDD2B9A0 = (uint64_t)rips_retain;
    unk_1EDD2B9A8 = rips_f_release;
    qword_1EDD2B9B0 = (uint64_t)rips_f_Create;
    unk_1EDD2B9B8 = rips_f_Growth;
    qword_1EDD2B9C0 = (uint64_t)rips_f_ColorSpace;
    unk_1EDD2B9C8 = rips_f_BltShape;
    qword_1EDD2B9D0 = (uint64_t)rips_f_BltGlyph;
    unk_1EDD2B9D8 = rips_f_BltImage;
    qword_1EDD2B9E0 = (uint64_t)rips_f_BltShade;
  }
  return result;
}

@end
