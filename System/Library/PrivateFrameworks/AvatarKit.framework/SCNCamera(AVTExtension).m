@implementation SCNCamera(AVTExtension)

- (double)avt_simdProjectionTransform
{
  double v2;

  objc_msgSend(a1, "projectionTransform");
  return v2;
}

- (uint64_t)avt_setSimdProjectionTransform:()AVTExtension
{
  _OWORD v6[4];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  v6[3] = a5;
  return objc_msgSend(a1, "setProjectionTransform:", v6);
}

- (float32x2_t)avt_simdPostProjectionTransform
{
  float32x2_t result;

  objc_msgSend(a1, "postProjectionTransform");
  result = vcvt_f32_f64((float64x2_t)0);
  __asm { FMOV            V2.4S, #1.0 }
  return result;
}

- (uint64_t)avt_setSimdPostProjectionTransform:()AVTExtension
{
  _OWORD v5[3];

  v5[0] = vcvtq_f64_f32(a2);
  v5[1] = vcvtq_f64_f32(a3);
  v5[2] = vcvtq_f64_f32(a4);
  return objc_msgSend(a1, "setPostProjectionTransform:", v5);
}

@end
