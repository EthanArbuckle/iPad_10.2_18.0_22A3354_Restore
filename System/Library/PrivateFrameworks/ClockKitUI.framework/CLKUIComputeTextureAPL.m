@implementation CLKUIComputeTextureAPL

double __CLKUIComputeTextureAPL_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64x2_t v5;
  float64x2_t v6;
  float32x4_t v7;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 40), "width");
  *(double *)&v9 = (double)(unint64_t)(objc_msgSend(*(id *)(a1 + 40), "height") * v3) * 255.0;
  v4 = objc_msgSend(objc_retainAutorelease(v2), "contents");
  v5.i64[0] = *(_QWORD *)v4;
  v5.i64[1] = HIDWORD(*(_QWORD *)v4);
  v6 = (float64x2_t)vdupq_lane_s64(v9, 0);
  v7 = (float32x4_t)vdivq_f64(vcvtq_f64_u64(v5), v6);
  *(float32x2_t *)v7.f32 = vcvt_f32_f64((float64x2_t)v7);
  LODWORD(v6.f64[0]) = *(_DWORD *)(v4 + 8);
  *(float *)v6.f64 = (double)*(unint64_t *)&v6.f64[0] / *(double *)&v9;
  v7.i32[2] = LODWORD(v6.f64[0]);
  return CLKUIConvertSRGBToAPL(v7);
}

@end
