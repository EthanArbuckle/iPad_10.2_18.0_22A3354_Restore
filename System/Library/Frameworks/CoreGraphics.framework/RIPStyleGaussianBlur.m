@implementation RIPStyleGaussianBlur

double __RIPStyleGaussianBlur_block_invoke()
{
  double result;

  rips_gb_cs = (uint64_t)CGColorSpaceCreateDeviceRGB();
  if (rips_gb_cs)
  {
    result = *(double *)&_rips_class;
    *(_QWORD *)&RIPStyleGaussianBlur_rips_gb_cls = rips_gb_super;
    *((_QWORD *)&RIPStyleGaussianBlur_rips_gb_cls + 1) = rips_gb_size;
    qword_1EDD2C6C0 = (uint64_t)rips_retain;
    unk_1EDD2C6C8 = rips_gb_release;
    qword_1EDD2C6D0 = (uint64_t)rips_gb_Create;
    unk_1EDD2C6D8 = rips_gb_Growth;
    qword_1EDD2C6E0 = (uint64_t)rips_gb_ColorSpace;
    unk_1EDD2C6E8 = rips_gb_BltShape;
    qword_1EDD2C6F0 = (uint64_t)rips_gb_BltGlyph;
    unk_1EDD2C6F8 = rips_gb_BltImage;
    qword_1EDD2C700 = (uint64_t)rips_gb_BltShade;
  }
  return result;
}

@end
