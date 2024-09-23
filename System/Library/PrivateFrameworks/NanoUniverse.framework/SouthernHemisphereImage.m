@implementation SouthernHemisphereImage

uint64_t ___SouthernHemisphereImage_block_invoke(int a1, id a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  double v5;
  double v6;

  v2 = (void *)MEMORY[0x24BEBD640];
  v3 = objc_retainAutorelease(a2);
  v4 = objc_msgSend(v3, "CGImage");
  objc_msgSend(v3, "scale");
  v6 = v5;

  return objc_msgSend(v2, "imageWithCGImage:scale:orientation:", v4, 1, v6);
}

@end
