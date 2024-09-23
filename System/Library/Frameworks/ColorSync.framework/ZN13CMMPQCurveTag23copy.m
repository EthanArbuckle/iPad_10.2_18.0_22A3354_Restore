@implementation ZN13CMMPQCurveTag23copy

int *___ZN13CMMPQCurveTag23copy_inv_pq_curve_tableEP15CMMFloatLutInfo_block_invoke()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  int *v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t i;
  float v7;
  float v8;
  float v9;
  float v10;
  int v11;
  int v12;
  _DWORD *exception;

  v0 = CMMBase::NewInternal(0x28uLL, &CMMPQCurveTag::copy_inv_pq_curve_table(CMMFloatLutInfo *)::m);
  *v0 = off_1E215FE00;
  v0[1] = 1;
  v0[3] = 0;
  v0[4] = 21512;
  v0[2] = CMMBase::NewInternal(0x5408uLL, &CMMPQCurveTag::copy_inv_pq_curve_table(CMMFloatLutInfo *)::m);
  CMMPQCurveTag::copy_inv_pq_curve_table(CMMFloatLutInfo *)::fixed_table = (uint64_t)v0;
  v1 = CMMBase::NewInternal(0x28uLL, &CMMPQCurveTag::copy_inv_pq_curve_table(CMMFloatLutInfo *)::m);
  *v1 = off_1E215FE00;
  v1[1] = 1;
  v1[3] = 0;
  v1[4] = 16388;
  v2 = CMMBase::NewInternal(0x4004uLL, &CMMPQCurveTag::copy_inv_pq_curve_table(CMMFloatLutInfo *)::m);
  v1[2] = v2;
  CMMPQCurveTag::copy_inv_pq_curve_table(CMMFloatLutInfo *)::float_table = (uint64_t)v1;
  v3 = *(int **)(CMMPQCurveTag::copy_inv_pq_curve_table(CMMFloatLutInfo *)::fixed_table + 16);
  if (!v3)
  {
    exception = __cxa_allocate_exception(4uLL);
    *exception = -171;
  }
  v4 = v2;
  CMMTable::MutableFloatData((uint64_t)v2);
  v5 = 0;
  for (i = 0; i != 16781312; i += 4096)
  {
    v7 = powf((float)i * 0.000000059605, 0.1593);
    v8 = powf((float)((float)(v7 * 18.852) + 0.83594) / (float)((float)(v7 * 18.688) + 1.0), 78.844);
    v9 = -v8;
    if ((float)((float)i * 0.000000059605) >= 0.0)
      v9 = v8;
    v10 = 0.0;
    if (fabsf(v9) == INFINITY || v9 >= 0.0 && (v10 = v9, v9 > 1.0))
      v10 = 1.0;
    *(float *)((char *)v4 + v5 * 4) = v10;
    v11 = vcvtmd_s64_f64((float)(v10 * 16777000.0) + 0.5);
    v12 = v11 & ~(v11 >> 31);
    if (v12 >= 0x1000000)
      v12 = 0x1000000;
    v3[v5++] = v12;
  }
  return MakeLookups(v3);
}

@end
