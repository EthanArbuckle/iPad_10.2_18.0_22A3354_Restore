@implementation RIPStyleColorMatrix

double __RIPStyleColorMatrix_block_invoke()
{
  double result;

  rips_cm_cs = (uint64_t)CGColorSpaceCreateDeviceRGB();
  if (rips_cm_cs)
  {
    result = *(double *)&_rips_class;
    *(_QWORD *)&RIPStyleColorMatrix_rips_cm_cls = rips_cm_super;
    *((_QWORD *)&RIPStyleColorMatrix_rips_cm_cls + 1) = rips_cm_size;
    qword_1EDD2C628 = (uint64_t)rips_retain;
    unk_1EDD2C630 = rips_cm_release;
    qword_1EDD2C638 = (uint64_t)rips_cm_Create;
    unk_1EDD2C640 = rips_cm_Growth;
    qword_1EDD2C648 = (uint64_t)rips_cm_ColorSpace;
    unk_1EDD2C650 = rips_cm_BltShape;
    qword_1EDD2C658 = (uint64_t)rips_cm_BltGlyph;
    unk_1EDD2C660 = rips_cm_BltImage;
    qword_1EDD2C668 = (uint64_t)rips_cm_BltShade;
  }
  return result;
}

@end
