@implementation ZN14CMMHLGCurveTag24copy

_QWORD *___ZN14CMMHLGCurveTag24copy_inv_hlg_curve_tableEP15CMMFloatLutInfo_block_invoke()
{
  _QWORD *v0;
  _QWORD *result;

  v0 = CMMBase::NewInternal(0x28uLL, &CMMHLGCurveTag::copy_inv_hlg_curve_table(CMMFloatLutInfo *)::m);
  v0[2] = 0;
  v0[3] = &kHLGOETFData;
  *v0 = off_1E215FE00;
  v0[1] = 0;
  v0[4] = 21512;
  CMMHLGCurveTag::copy_inv_hlg_curve_table(CMMFloatLutInfo *)::fixed_table = (uint64_t)v0;
  result = CMMBase::NewInternal(0x28uLL, &CMMHLGCurveTag::copy_inv_hlg_curve_table(CMMFloatLutInfo *)::m);
  result[2] = 0;
  result[3] = &kHLGOETFFloatData;
  *result = off_1E215FE00;
  result[1] = 0;
  result[4] = 16388;
  CMMHLGCurveTag::copy_inv_hlg_curve_table(CMMFloatLutInfo *)::float_table = (uint64_t)result;
  return result;
}

@end
