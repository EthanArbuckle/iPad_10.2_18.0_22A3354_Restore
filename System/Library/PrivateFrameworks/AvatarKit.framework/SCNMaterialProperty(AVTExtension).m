@implementation SCNMaterialProperty(AVTExtension)

- (double)avt_simdContentsTransform
{
  double v2;

  objc_msgSend(a1, "contentsTransform");
  return v2;
}

- (uint64_t)avt_setSimdContentsTransform:()AVTExtension
{
  _OWORD v6[4];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  return objc_msgSend(a1, "setContentsTransform:", v6);
}

@end
