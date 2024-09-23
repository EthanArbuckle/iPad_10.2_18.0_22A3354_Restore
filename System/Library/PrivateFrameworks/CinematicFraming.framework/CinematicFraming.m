void sub_1D4E20DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1D4E21598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D4E21E74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1D4E224C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4E2294C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4E22C1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4E22DF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D4E23154(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4E2327C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1D4E23368(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4E233C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)VCProcessor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1D4E239B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{

  _Unwind_Resume(a1);
}

void sub_1D4E24090(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4E24418(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

float32x2_t warpPoint(uint64_t a1, uint64_t a2, float32x2_t a3)
{
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float v13;
  float v14;
  float32x2_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  int32x4_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float v27;
  float v28;
  float32x2_t v29;
  float32x2_t v30;
  unint64_t v31;
  simd_float4 v32;
  float32x2_t v34;
  __int128 v35;

  v4 = *(float32x2_t *)(a1 + 16);
  v4.i32[1] = HIDWORD(*(_QWORD *)(a1 + 32));
  v5 = *(float32x2_t *)(a1 + 48);
  v6 = *(float32x2_t *)a1;
  v7 = vmla_f32(vneg_f32(v5), *(float32x2_t *)a1, a3);
  v8 = vmul_f32(v7, v7);
  v8.f32[0] = vaddv_f32(v8) * 0.25;
  v9 = vdiv_f32(vadd_f32(v5, vmla_n_f32(v7, vsub_f32(vmul_f32(v7, vdiv_f32(vmul_f32(v4, v4), vmla_f32(vneg_f32((float32x2_t)vdup_lane_s32((int32x2_t)v8, 0)), v4, v4))), v7), COERCE_FLOAT(*(_QWORD *)(a1 + 344)))), *(float32x2_t *)a1);
  if (*(_BYTE *)(a1 + 256))
  {
    v10 = vmul_f32(v6, v9);
    v11 = *(float32x2_t *)(a1 + 264);
    v12 = vsub_f32(v10, v11);
    v13 = vaddv_f32(vmul_f32(v12, v12));
    if (sqrtf(v13) <= (float)*(int *)(a1 + 308))
    {
      v14 = v13 * *(float *)(a1 + 112);
      v9 = vdiv_f32(vadd_f32(v11, vmul_n_f32(v12, 1.0/ (float)((float)((float)(*(float *)(a1 + 312)+ (float)((float)(*(float *)(a1 + 316)+ (float)((float)(*(float *)(a1 + 320)+ (float)((float)(*(float *)(a1 + 324)+ (float)((float)(*(float *)(a1 + 328) + (float)((float)(*(float *)(a1 + 332) + (float)((float)(*(float *)(a1 + 336) + (float)((float)(*(float *)(a1 + 340) + (float)(v14 * 0.0)) * v14)) * v14)) * v14))* v14))* v14))* v14))* v14))* 0.01)+ 1.0))), v6);
    }
    else
    {
      v9 = (float32x2_t)vdup_n_s32(0x7FC00000u);
    }
  }
  v15 = vmul_f32(v6, v9);
  v16 = vaddq_f32(*(float32x4_t *)(a1 + 96), vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)(a1 + 64), v15.f32[0]), *(float32x4_t *)(a1 + 80), v15, 1));
  v17 = vaddq_f32(*(float32x4_t *)(a1 + 240), vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)(a1 + 192), v16.f32[0]), *(float32x4_t *)(a1 + 208), *(float32x2_t *)v16.f32, 1), *(float32x4_t *)(a1 + 224), v16, 2));
  v18 = vaddq_f32(*(float32x4_t *)(a2 + 176), vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)(a2 + 128), v17.f32[0]), *(float32x4_t *)(a2 + 144), *(float32x2_t *)v17.f32, 1), *(float32x4_t *)(a2 + 160), v17, 2));
  v19 = *(float32x4_t *)(a2 + 16);
  v20 = *(float32x4_t *)(a2 + 48);
  v21 = (int32x4_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, v18.f32[0]), *(float32x4_t *)(a2 + 32), *(float32x2_t *)v18.f32, 1), v20, v18, 2);
  v22 = *(float32x2_t *)a2;
  v23 = vdiv_f32(vdiv_f32(*(float32x2_t *)v21.i8, (float32x2_t)vdup_laneq_s32(v21, 2)), *(float32x2_t *)a2);
  if (*(_BYTE *)(a2 + 256))
  {
    v24 = vmul_f32(v22, v23);
    v25 = *(float32x2_t *)(a2 + 264);
    v26 = vsub_f32(v24, v25);
    v27 = vaddv_f32(vmul_f32(v26, v26));
    if (sqrtf(v27) <= (float)*(int *)(a2 + 272))
    {
      v28 = v27 * *(float *)(a2 + 112);
      v23 = vdiv_f32(vadd_f32(v25, vmul_n_f32(v26, 1.0/ (float)((float)((float)(*(float *)(a2 + 276)+ (float)((float)(*(float *)(a2 + 280)+ (float)((float)(*(float *)(a2 + 284)+ (float)((float)(*(float *)(a2 + 288)+ (float)((float)(*(float *)(a2 + 292) + (float)((float)(*(float *)(a2 + 296) + (float)((float)(*(float *)(a2 + 300) + (float)((float)(*(float *)(a2 + 304) + (float)(v28 * 0.0)) * v28)) * v28)) * v28))* v28))* v28))* v28))* v28))* 0.01)+ 1.0))), v22);
    }
    else
    {
      v23 = (float32x2_t)vdup_n_s32(0x7FC00000u);
    }
  }
  v19.i32[1] = HIDWORD(*(_QWORD *)(a2 + 32));
  v34 = *(float32x2_t *)v19.f32;
  v35 = *(_OWORD *)(a2 + 48);
  v29 = vmla_f32(vneg_f32(*(float32x2_t *)v20.f32), v22, v23);
  v23.f32[0] = sqrtf(vaddv_f32(vmul_f32(v29, v29)));
  v30 = (float32x2_t)vdup_lane_s32((int32x2_t)v23, 0);
  LODWORD(v31) = v23.i32[0];
  HIDWORD(v31) = v23.i32[0];
  v32 = _simd_atan2_f4((simd_float4)v31, (simd_float4)v19.u64[0]);
  *(float32x2_t *)v32.f32 = vmul_f32(*(float32x2_t *)v32.f32, (float32x2_t)0x3F0000003F000000);
  return vdiv_f32(vadd_f32(*(float32x2_t *)&v35, vmla_n_f32(v29, vsub_f32(vmul_f32(v29, vdiv_f32(vmul_f32(vadd_f32(v34, v34), (float32x2_t)*(_OWORD *)&_simd_tan_f4(v32)), v30)), v29), COERCE_FLOAT(*(_QWORD *)(a2 + 344)))), v22);
}

void sub_1D4E248B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4E24A68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1D4E24B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1D4E24D2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4E24E7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1D4E250E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

float zRotationForOrientation(int a1, int a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  float result;
  _DWORD v8[4];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  v2 = 0;
  if (a2)
    v3 = 4;
  else
    v3 = 3;
  if (a2)
    v4 = 3;
  else
    v4 = 4;
  v8[0] = v3;
  v8[1] = 1;
  v8[2] = v4;
  v8[3] = 2;
  do
    v5 = v8[v2++];
  while (v5 != a1);
  result = (double)((int)v2 - 1) * 1.57079633;
  if (result > 3.14159265)
    return result + -6.28318531;
  return result;
}

void sub_1D4E25540(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t isViewFrustumContained(VCCamera *a1, VCCamera *a2, float a3)
{
  VCCamera *v5;
  VCCamera *v6;
  uint64_t v7;
  int32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  uint64_t v11;
  float32x2_t v12;
  uint32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  int v18;
  float32x2_t v19;

  v5 = a1;
  v6 = a2;
  v7 = 0;
  *(float *)v8.i32 = a3 + 0.0;
  v9 = (float32x2_t)vdup_lane_s32(v8, 0);
  *(float *)v8.i32 = 1.0 - a3;
  v10 = (float32x2_t)vdup_lane_s32(v8, 0);
  LOBYTE(v11) = 1;
  do
  {
    v12 = warpPoint((uint64_t)-[VCCamera model](v5, "model"), (uint64_t)-[VCCamera model](v6, "model"), (float32x2_t)qword_1D4E43B20[v7]);
    v13 = (uint32x2_t)vand_s8((int8x8_t)vcge_f32(v12, v9), (int8x8_t)vcge_f32(v10, v12));
    v11 = v11 & (vpmin_u32(v13, v13).i32[0] < 0);
    if (-[VCCamera hasGeometricDistortionCalibration](v6, "hasGeometricDistortionCalibration")
      && -[VCCamera geometricDistortionCalibrationMaxRadius](v6, "geometricDistortionCalibrationMaxRadius") >= 1)
    {
      -[VCCamera sensorSize](v6, "sensorSize");
      v15 = v14;
      -[VCCamera geometricDistortionCenter](v6, "geometricDistortionCenter");
      v17 = v16;
      v18 = -[VCCamera geometricDistortionCalibrationMaxRadius](v6, "geometricDistortionCalibrationMaxRadius");
      v19 = vsub_f32(vmul_f32(v12, v15), v17);
      if (sqrtf(vaddv_f32(vmul_f32(v19, v19))) < (float)v18)
        v11 = v11;
      else
        v11 = 0;
    }
    ++v7;
  }
  while (v7 != 8);

  return v11;
}

void sub_1D4E25904(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4E25E0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4E25F58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4E2610C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4E26290(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1D4E263F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1D4E2671C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1D4E26B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1D4E26F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1D4E27304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1D4E27434(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D4E27660(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

float ApplyMotionConstraints(float result, float a2, float a3)
{
  if (a2 >= result)
    result = a2;
  if (result >= a3)
    return a3;
  return result;
}

float CombineMotionConstraints(float result, double a2, float a3)
{
  if (result <= a3)
    return a3;
  return result;
}

float ComputeSizeVelocityConstraints(void *a1)
{
  id v1;
  float v2;
  float v3;

  v1 = a1;
  objc_msgSend(v1, "zoomInSpeedMultiplier");
  v3 = v2 * -0.3;
  objc_msgSend(v1, "zoomOutSpeedMultiplier");

  return v3;
}

float ComputeSizeFrameEdgeConstraints@<S0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  id v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double LeftMargin;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  float Width;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  CGFloat v33;
  CGFloat MidX;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  float v45;
  float result;
  float v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v11 = a1;
  objc_msgSend(v11, "zoomAccelerationMultiplier");
  v13 = v12 * 0.425;
  CGRectGetVerticalRightMargin(a3, a4, a5, a6);
  v15 = v14;
  CGRectGetRightMargin(a3, a4, a5, a6);
  v17 = v16 + v16;
  LeftMargin = CGRectGetLeftMargin(a3, a4, a5, a6);
  if (v17 >= LeftMargin + LeftMargin)
    v19 = CGRectGetLeftMargin(a3, a4, a5, a6);
  else
    CGRectGetRightMargin(a3, a4, a5, a6);
  v20 = v13;
  if (v15 >= v19 + v19)
  {
    CGRectGetRightMargin(a3, a4, a5, a6);
    v23 = v22 + v22;
    v24 = CGRectGetLeftMargin(a3, a4, a5, a6);
    if (v23 >= v24 + v24)
      v25 = CGRectGetLeftMargin(a3, a4, a5, a6);
    else
      CGRectGetRightMargin(a3, a4, a5, a6);
    v21 = v25 + v25;
  }
  else
  {
    CGRectGetVerticalRightMargin(a3, a4, a5, a6);
  }
  v26 = v21;
  v48.origin.x = a3;
  v48.origin.y = a4;
  v48.size.width = a5;
  v48.size.height = a6;
  CGRectGetWidth(v48);
  v49.origin.x = a3;
  v49.origin.y = a4;
  v49.size.width = a5;
  v49.size.height = a6;
  CGRectGetWidth(v49);
  v50.origin.x = a3;
  v50.origin.y = a4;
  v50.size.width = a5;
  v50.size.height = a6;
  Width = CGRectGetWidth(v50);
  v28 = (float)(v26 + v26) * v20;
  if (v28 < 0.0)
    v28 = 0.0;
  v29 = sqrtf(v28);
  if (v29 > 100000000.0)
    v29 = 100000000.0;
  v30 = (float)(Width + Width) * v20;
  if (v30 < 0.0)
    v30 = 0.0;
  v31 = sqrtf(v30);
  if (v31 > 100000000.0)
    v31 = 100000000.0;
  *(float *)a2 = -v20;
  *(float *)(a2 + 4) = v20;
  *(float *)(a2 + 8) = -v31;
  *(float *)(a2 + 12) = v29;
  *(_QWORD *)(a2 + 16) = 0x4CBEBC20CCBEBC20;
  objc_msgSend(v11, "viewportMinimumFOV");
  v47 = v32;

  v51.origin.x = a3;
  v51.origin.y = a4;
  v51.size.width = a5;
  v51.size.height = a6;
  v33 = CGRectGetMidX(v51) * -2.0 + 2.0;
  v52.origin.x = a3;
  v52.origin.y = a4;
  v52.size.width = a5;
  v52.size.height = a6;
  MidX = CGRectGetMidX(v52);
  v35 = MidX + MidX;
  v53.origin.x = a3;
  v53.origin.y = a4;
  v53.size.width = a5;
  v53.size.height = a6;
  v36 = CGRectGetMidX(v53);
  v37 = v36 * -2.0 + 2.0;
  v38 = v36 + v36;
  if (v33 >= v35)
    v39 = v38;
  else
    v39 = v37;
  v54.origin.x = a3;
  v54.origin.y = a4;
  v54.size.width = a5;
  v54.size.height = a6;
  if (v39 >= 1.0 - CGRectGetMinY(v54))
  {
    v58.origin.x = a3;
    v58.origin.y = a4;
    v58.size.width = a5;
    v58.size.height = a6;
    v44 = 1.0 - CGRectGetMinY(v58);
  }
  else
  {
    v55.origin.x = a3;
    v55.origin.y = a4;
    v55.size.width = a5;
    v55.size.height = a6;
    v40 = CGRectGetMidX(v55) * -2.0 + 2.0;
    v56.origin.x = a3;
    v56.origin.y = a4;
    v56.size.width = a5;
    v56.size.height = a6;
    v41 = CGRectGetMidX(v56);
    v42 = v41 + v41;
    v57.origin.x = a3;
    v57.origin.y = a4;
    v57.size.width = a5;
    v57.size.height = a6;
    v43 = CGRectGetMidX(v57);
    if (v40 >= v42)
      v44 = v43 + v43;
    else
      v44 = v43 * -2.0 + 2.0;
  }
  v45 = logf(v47);
  result = log(v44);
  *(float *)(a2 + 16) = v45;
  *(float *)(a2 + 20) = result;
  return result;
}

float ComputeSizeEaseInAccelerationConstraintsForVelocityAndDisplacement(void *a1, float a2, float a3)
{
  id v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;

  v5 = a1;
  objc_msgSend(v5, "zoomEaseInCurveB");
  v7 = v6;
  objc_msgSend(v5, "zoomEaseInCurveA");
  v9 = v8;
  objc_msgSend(v5, "zoomEaseInCurveB");
  objc_msgSend(v5, "zoomEaseInCurveA");
  v10 = fabsf(a2);
  if (a3 >= 0.0)
    v11 = -100000000.0;
  else
    v11 = -(float)(v7 - (float)((float)(fabsf(sqrtf(v10)) * a3) * v9));
  objc_msgSend(v5, "zoomAccelerationMultiplier");
  v13 = v11 * v12;
  objc_msgSend(v5, "zoomAccelerationMultiplier");

  return v13;
}

float ComputeXVelocityConstraints(void *a1, double a2, double a3, double a4)
{
  double v4;
  float v5;
  float v6;

  v4 = a4 / 3.0;
  objc_msgSend(a1, "horizontalSpeedMultiplier");
  v6 = v4 * v5;
  return -v6;
}

float ComputeYVelocityConstraints(void *a1, double a2, double a3, double a4, double a5)
{
  double v5;
  float v6;
  float v7;

  v5 = a5 / 3.0;
  objc_msgSend(a1, "verticalSpeedMultiplier");
  v7 = v5 * v6;
  return -v7;
}

float ComputeXFrameEdgeConstraints@<S0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>, CGFloat a7@<D4>, CGFloat a8@<D5>, CGFloat a9@<D6>, CGFloat a10@<D7>)
{
  float v19;
  double MinX;
  BOOL v21;
  float v22;
  double v23;
  float v24;
  double MaxX;
  CGFloat v26;
  float v27;
  double v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  CGFloat v35;
  float v36;
  float result;
  float v38;
  float v39;
  CGFloat rect;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  objc_msgSend(a1, "horizontalAccelerationMultiplier");
  v39 = v19;
  v41.origin.x = a3;
  v41.origin.y = a4;
  v41.size.width = a5;
  rect = a6;
  v41.size.height = a6;
  MinX = CGRectGetMinX(v41);
  v42.origin.x = a7;
  v42.origin.y = a8;
  v42.size.width = a9;
  v42.size.height = a10;
  v21 = MinX - CGRectGetMinX(v42) < 0.0;
  v22 = 0.0;
  if (!v21)
  {
    v43.origin.x = a3;
    v43.origin.y = a4;
    v43.size.width = a5;
    v43.size.height = rect;
    v23 = CGRectGetMinX(v43);
    v44.origin.x = a7;
    v44.origin.y = a8;
    v44.size.width = a9;
    v44.size.height = a10;
    v24 = v23 - CGRectGetMinX(v44);
    v22 = (float)(v24 * 100.0) + (float)(v24 * 100.0);
  }
  v38 = v22;
  v45.origin.x = a7;
  v45.origin.y = a8;
  v45.size.width = a9;
  v45.size.height = a10;
  MaxX = CGRectGetMaxX(v45);
  v46.origin.x = a3;
  v46.origin.y = a4;
  v46.size.width = a5;
  v46.size.height = rect;
  v26 = CGRectGetMaxX(v46);
  v27 = 0.0;
  if (MaxX - v26 >= 0.0)
  {
    v47.origin.x = a7;
    v47.origin.y = a8;
    v47.size.width = a9;
    v47.size.height = a10;
    v28 = CGRectGetMaxX(v47);
    v48.origin.x = a3;
    v48.origin.y = a4;
    v48.size.width = a5;
    v48.size.height = rect;
    v29 = v28 - CGRectGetMaxX(v48);
    v27 = (float)(v29 * 100.0) + (float)(v29 * 100.0);
  }
  v30 = a5 * 0.6 * v39;
  v31 = v27 * v30;
  v21 = (float)(v27 * v30) < 0.0;
  v32 = 0.0;
  if (v21)
    v31 = 0.0;
  v33 = sqrtf(v31);
  if (v33 > 100000000.0)
    v33 = 100000000.0;
  if ((float)(v38 * v30) >= 0.0)
    v32 = v38 * v30;
  v34 = sqrtf(v32);
  if (v34 > 100000000.0)
    v34 = 100000000.0;
  *(float *)a2 = -v30;
  *(float *)(a2 + 4) = v30;
  *(float *)(a2 + 8) = -v34;
  *(float *)(a2 + 12) = v33;
  *(_QWORD *)(a2 + 16) = 0x4CBEBC20CCBEBC20;
  v49.origin.x = a7;
  v49.origin.y = a8;
  v49.size.width = a9;
  v49.size.height = a10;
  v35 = a5 * 0.5;
  v36 = v35 + CGRectGetMinX(v49);
  v50.origin.x = a7;
  v50.origin.y = a8;
  v50.size.width = a9;
  v50.size.height = a10;
  result = CGRectGetMaxX(v50) - v35;
  *(float *)(a2 + 16) = v36;
  *(float *)(a2 + 20) = result;
  return result;
}

float ComputeYFrameEdgeConstraints@<S0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>, CGFloat a7@<D4>, CGFloat a8@<D5>, CGFloat a9@<D6>, CGFloat a10@<D7>)
{
  float v19;
  double MinY;
  BOOL v21;
  float v22;
  double v23;
  float v24;
  double MaxY;
  CGFloat v26;
  float v27;
  double v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float result;
  float v37;
  float v38;
  double rect;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  objc_msgSend(a1, "verticalAccelerationMultiplier");
  v38 = v19;
  v40.origin.x = a3;
  v40.origin.y = a4;
  v40.size.width = a5;
  rect = a6;
  v40.size.height = a6;
  MinY = CGRectGetMinY(v40);
  v41.origin.x = a7;
  v41.origin.y = a8;
  v41.size.width = a9;
  v41.size.height = a10;
  v21 = MinY - CGRectGetMinY(v41) < 0.0;
  v22 = 0.0;
  if (!v21)
  {
    v42.origin.x = a3;
    v42.origin.y = a4;
    v42.size.width = a5;
    v42.size.height = rect;
    v23 = CGRectGetMinY(v42);
    v43.origin.x = a7;
    v43.origin.y = a8;
    v43.size.width = a9;
    v43.size.height = a10;
    v24 = v23 - CGRectGetMinY(v43);
    v22 = (float)(v24 * 10000.0) + (float)(v24 * 10000.0);
  }
  v37 = v22;
  v44.origin.x = a7;
  v44.origin.y = a8;
  v44.size.width = a9;
  v44.size.height = a10;
  MaxY = CGRectGetMaxY(v44);
  v45.origin.x = a3;
  v45.origin.y = a4;
  v45.size.width = a5;
  v45.size.height = rect;
  v26 = CGRectGetMaxY(v45);
  v27 = 0.0;
  if (MaxY - v26 >= 0.0)
  {
    v46.origin.x = a7;
    v46.origin.y = a8;
    v46.size.width = a9;
    v46.size.height = a10;
    v28 = CGRectGetMaxY(v46);
    v47.origin.x = a3;
    v47.origin.y = a4;
    v47.size.width = a5;
    v47.size.height = rect;
    v29 = v28 - CGRectGetMaxY(v47);
    v27 = (float)(v29 * 10000.0) + (float)(v29 * 10000.0);
  }
  v30 = a5 * 0.6 * v38;
  v31 = v27 * v30;
  v21 = (float)(v27 * v30) < 0.0;
  v32 = 0.0;
  if (v21)
    v31 = 0.0;
  v33 = sqrtf(v31);
  if (v33 > 100000000.0)
    v33 = 100000000.0;
  if ((float)(v37 * v30) >= 0.0)
    v32 = v37 * v30;
  v34 = sqrtf(v32);
  if (v34 > 100000000.0)
    v34 = 100000000.0;
  *(float *)a2 = -v30;
  *(float *)(a2 + 4) = v30;
  *(float *)(a2 + 8) = -v34;
  *(float *)(a2 + 12) = v33;
  *(_QWORD *)(a2 + 16) = 0x4CBEBC20CCBEBC20;
  v48.origin.x = a7;
  v48.origin.y = a8;
  v48.size.width = a9;
  v48.size.height = a10;
  v35 = CGRectGetMinY(v48);
  v49.origin.x = a7;
  v49.origin.y = a8;
  v49.size.width = a9;
  v49.size.height = a10;
  result = CGRectGetMaxY(v49) - rect;
  *(float *)(a2 + 16) = v35;
  *(float *)(a2 + 20) = result;
  return result;
}

float ComputeXEaseInAccelerationConstraintsForVelocityAndDisplacement(void *a1, float a2, float a3, float a4)
{
  id v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;

  v7 = a1;
  objc_msgSend(v7, "xEaseInCurveB");
  v9 = v8;
  objc_msgSend(v7, "xEaseInCurveA");
  v11 = v10;

  v12 = fabsf(a2 / a4);
  if ((float)(a3 / a4) >= 0.0)
    v13 = -100000000.0;
  else
    v13 = -(float)(v9 - (float)((float)((float)(a3 / a4) * fabsf(sqrtf(v12))) * v11));
  return v13 * a4;
}

float ComputeYEaseInAccelerationConstraintsForVelocityAndDisplacement(void *a1, float a2, float a3, float a4)
{
  id v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;

  v7 = a1;
  objc_msgSend(v7, "yEaseInCurveB");
  v9 = v8;
  objc_msgSend(v7, "yEaseInCurveA");
  v11 = v10;

  v12 = fabsf(a2 / a4);
  if ((float)(a3 / a4) >= 0.0)
    v13 = -100000000.0;
  else
    v13 = -(float)(v9 - (float)((float)((float)(a3 / a4) * fabsf(sqrtf(v12))) * v11));
  return v13 * a4;
}

float PlistReadFloat(void *a1, void *a2, float a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  float v9;

  v5 = a1;
  v6 = a2;
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    a3 = v9;

  }
  return a3;
}

void _resetGaussianWeights(int a1, float *a2, float a3)
{
  float v3;
  float v4;
  int v5;
  float *v6;
  int v7;
  int v8;
  int v9;
  float v10;
  int v11;
  float *v12;
  int v13;
  float v14;
  BOOL v15;
  int v16;

  v3 = (float)(a3 * a3) + (float)(a3 * a3);
  if (v3 >= 0.00000011921)
    v4 = 1.0 / v3;
  else
    v4 = 8388600.0;
  v5 = a1 - 1;
  if (a1 < 1)
    v5 = a1;
  if ((a1 & 0x80000000) == 0)
  {
    v6 = a2;
    v7 = v5 >> 1;
    v8 = -(v5 >> 1);
    if (v5 >> 1 >= 0)
      v9 = v5 >> 1;
    else
      v9 = -v7;
    v10 = 0.0;
    v11 = -(v5 >> 1);
    v12 = a2;
    do
    {
      v13 = v8;
      do
      {
        v14 = expf(-(float)((float)((float)(v11 * v11) + (float)(v13 * v13)) * v4));
        *v12++ = v14;
        v10 = v10 + v14;
        ++v13;
      }
      while (v9 + 1 != v13);
      v15 = v11++ == v9;
    }
    while (!v15);
    do
    {
      v16 = v7 + v9 + 1;
      do
      {
        *v6 = *v6 / v10;
        ++v6;
        --v16;
      }
      while (v16);
      v15 = v8++ == v9;
    }
    while (!v15);
  }
}

void sub_1D4E2CDB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void _getLineToRectIntersectionPoints(int8x8_t *a1, float32x2_t a2, float32x2_t a3, double a4, double a5, double a6, double a7)
{
  float32x2_t v12;
  float32_t v13;
  float32x2_t v14;
  unsigned int v15;
  unsigned int v16;
  float32x2_t v17;
  float32x2_t v18;
  __int32 v19;
  float32x2_t v20;
  __int32 v21;
  float32x2_t v22;

  v12.f32[0] = a4;
  v21 = v12.i32[0];
  v13 = a5;
  v12.f32[1] = v13;
  v14.f32[0] = a4 + a6;
  v18 = v12;
  v19 = v14.i32[0];
  v14.f32[1] = v13;
  v17 = v14;
  *a1 = _getlineToLineIntersectionPoint(a2, a3, v12, v14);
  *(float *)&v15 = a5 + a7;
  v16 = v15;
  v20 = (float32x2_t)__PAIR64__(v15, v19);
  a1[1] = _getlineToLineIntersectionPoint(a2, a3, v17, v20);
  v22 = (float32x2_t)__PAIR64__(v16, v21);
  a1[2] = _getlineToLineIntersectionPoint(a2, a3, v20, v22);
  a1[3] = _getlineToLineIntersectionPoint(a2, a3, v22, v18);
}

__n64 simd_matrix3x3(float32x4_t a1)
{
  float v9;
  __n64 result;

  _Q2 = a1;
  _S3 = a1.i32[1];
  _S4 = a1.i32[2];
  __asm { FMLS            S0, S4, V2.S[2] }
  _S6 = _Q2.i32[3];
  __asm { FMLA            S0, S6, V2.S[3] }
  v9 = vmlas_n_f32(vmuls_lane_f32(a1.f32[2], _Q2, 3), a1.f32[1], _Q2.f32[0]);
  __asm
  {
    FMLA            S5, S3, V2.S[1]
    FMLA            S5, S6, V2.S[3]
    FMLS            S5, S2, V2.S[0]
    FMLA            S18, S4, V2.S[1]
    FMLA            S6, S4, V2.S[2]
    FMLS            S6, S2, V2.S[0]
    FMLS            S6, S3, V2.S[1]
  }
  result.n64_f32[1] = v9 + v9;
  return result;
}

int8x8_t _getlineToLineIntersectionPoint(float32x2_t a1, float32x2_t a2, float32x2_t a3, float32x2_t a4)
{
  float v4;
  float v5;
  float32x2_t v6;
  float v7;
  float v8;
  float32x2_t v9;
  float v10;
  float v11;
  BOOL v14;
  float32x2_t v15;
  unsigned int v16;

  LODWORD(v4) = vsub_f32(a1, a3).u32[0];
  v5 = a3.f32[1];
  v6 = vsub_f32(a3, a4);
  v7 = -(float)(a1.f32[1] - v5);
  v8 = vmlas_n_f32(v7 * v6.f32[0], v6.f32[1], v4);
  v9 = vsub_f32(a1, a2);
  v6.f32[0] = vmlas_n_f32((float)-v9.f32[1] * v6.f32[0], v6.f32[1], v9.f32[0]);
  v10 = v8 / v6.f32[0];
  v11 = vmlas_n_f32(v7 * v9.f32[0], v9.f32[1], v4) / v6.f32[0];
  v14 = v10 > 1.0 || v10 < 0.0 || v11 < 0.0 || v11 > 1.0;
  v15 = vsub_f32(a2, a1);
  if (v14)
    v16 = 0;
  else
    v16 = -1;
  return vbsl_s8((int8x8_t)vdup_n_s32(v16), (int8x8_t)vmla_n_f32(a1, v15, v10), (int8x8_t)vdup_n_s32(0x7F7FFFFFu));
}

double CGRectSafeIntersection(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v16;
  float v17;
  double MinY;
  double MaxX;
  CGFloat MinX;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  MinX = CGRectGetMinX(*(CGRect *)&a1);
  v25.origin.x = a5;
  v25.origin.y = a6;
  v25.size.width = a7;
  v25.size.height = a8;
  v16 = fmax(MinX, CGRectGetMinX(v25));
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  v17 = fmin(v16, CGRectGetMaxX(v26));
  *(float *)&MinX = v17;
  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  MinY = CGRectGetMinY(v27);
  v28.size.height = a8;
  v28.origin.x = a5;
  v28.origin.y = a6;
  v28.size.width = a7;
  fmax(MinY, CGRectGetMinY(v28));
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  CGRectGetMaxY(v29);
  v30.origin.x = a1;
  v30.origin.y = a2;
  v30.size.width = a3;
  v30.size.height = a4;
  MaxX = CGRectGetMaxX(v30);
  v31.origin.x = a5;
  v31.origin.y = a6;
  v31.size.width = a7;
  v31.size.height = a8;
  fmin(MaxX, CGRectGetMaxX(v31));
  v32.origin.x = a1;
  v32.origin.y = a2;
  v32.size.width = a3;
  v32.size.height = a4;
  CGRectGetMinX(v32);
  v33.origin.x = a1;
  v33.origin.y = a2;
  v33.size.width = a3;
  v33.size.height = a4;
  CGRectGetMaxY(v33);
  v34.origin.x = a5;
  v34.origin.y = a6;
  v34.size.width = a7;
  v34.size.height = a8;
  CGRectGetMaxY(v34);
  v35.origin.x = a1;
  v35.origin.y = a2;
  v35.size.width = a3;
  v35.size.height = a4;
  CGRectGetMinY(v35);
  return *(float *)&MinX;
}

float ComputeSizeToFitSubjectsInDeadband(float result, double a2, double _D2, double a4, double a5, double _D5, double a7)
{
  int32x2_t v7;
  float v8;
  float v9;
  float32x2_t v13;
  float32x2_t v14;
  double v15;
  double v16;
  float32x2_t v18;
  double v19;
  double v20;
  float v21;
  float32x2_t v23;
  float32x2_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float32x2_t v29;
  float v30;
  float v31;
  float v32;
  double v33;
  double v34;
  double v35;
  float32x2_t v36;
  double v37;
  float v38;
  float v39;
  double v41;
  double v42;
  float v43;

  *(float *)&a7 = vmlas_n_f32(*(float *)&a4, result, *(float *)&_D2);
  v8 = *((float *)&a2 + 1);
  v9 = *((float *)&_D2 + 1);
  __asm { FMLS            S5, S0, V2.S[1] }
  v13.f32[0] = fmaxf(*(float *)&a2, *(float *)&a7);
  v13.i32[1] = fminf(*((float *)&a2 + 1), *(float *)&_D5);
  _NF = *(float *)&_D5 < *(float *)&a2;
  v14 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&_D5, 0);
  if (!_NF)
    v14 = v13;
  v15 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&a7, 0));
  if (*((float *)&a2 + 1) < *(float *)&a7)
  {
    v9 = *((float *)&_D2 + 1);
    *(double *)&v14 = v15;
  }
  v16 = 1.0 - *(float *)&_D2;
  _D7 = result * (v16 - v9) + 0.001;
  if (_D7 <= vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v14, 1), v14).f32[0])
  {
    __asm { FMLS            S7, S0, V2.S[1] }
    _NF = *(float *)&_D7 < *(float *)&a2;
    v18.f32[0] = fmaxf(*(float *)&a2, *(float *)&a7);
    v18.i32[1] = fminf(*((float *)&a2 + 1), *(float *)&_D7);
    v19 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&_D7, 0));
    v20 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&a7, 0));
    if (_NF)
      *(double *)&v18 = v19;
    v21 = *((float *)&_D2 + 1);
    _NF = *((float *)&a2 + 1) < *(float *)&a7;
    if (*((float *)&a2 + 1) < *(float *)&a7)
      *(double *)&v18 = v20;
    v23 = (float32x2_t)vdup_lane_s32((int32x2_t)v18, 1);
    if (!_NF)
      v21 = *((float *)&_D2 + 1);
    v24 = vsub_f32(v23, v18);
    v25 = v16 - v21;
    result = v24.f32[0] / v25;
    *(float *)&v16 = *(float *)&a4 + (float)(result * *(float *)&_D2);
    *(float *)&v20 = *((float *)&a4 + 1) - (float)(result * v21);
    _NF = *(float *)&v20 < *(float *)&a2;
    *(float *)&v26 = fmaxf(*(float *)&a2, *(float *)&v16);
    HIDWORD(v26) = fminf(*((float *)&a2 + 1), *(float *)&v20);
    v27 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&v20, 0));
    if (!_NF)
      v27 = v26;
    v28 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&v16, 0));
    if (*((float *)&a2 + 1) < *(float *)&v16)
      *(double *)&v29 = v28;
    else
      *(double *)&v29 = v27;
    if (fabsf(vsub_f32(vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v29, 1), v29), v24).f32[0]) >= 0.001)
    {
      LODWORD(v30) = vdiv_f32(vsub_f32(*(float32x2_t *)&a2, *(float32x2_t *)&a4), *(float32x2_t *)&_D2).u32[0];
      v31 = (float)(*((float *)&a4 + 1) - *((float *)&a2 + 1)) / v21;
      v32 = fmaxf(v30, v31);
      *(float *)&v28 = *(float *)&a4 + (float)(v32 * *(float *)&_D2);
      *(float *)v7.i32 = *((float *)&a4 + 1) - (float)(v32 * v21);
      _NF = *(float *)v7.i32 < *(float *)&a2;
      *(float *)&v33 = fmaxf(*(float *)&a2, *(float *)&v28);
      HIDWORD(v33) = fminf(*((float *)&a2 + 1), *(float *)v7.i32);
      v34 = COERCE_DOUBLE(vdup_lane_s32(v7, 0));
      if (!_NF)
        v34 = v33;
      v35 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&v28, 0));
      if (*((float *)&a2 + 1) < *(float *)&v28)
        *(double *)&v36 = v35;
      else
        *(double *)&v36 = v34;
      v37 = vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v36, 1), v36).f32[0];
      if (v30 < v31)
      {
        v38 = *(float *)&_D2;
      }
      else
      {
        v30 = (float)(*((float *)&a4 + 1) - *((float *)&a2 + 1)) / v21;
        v38 = v21;
      }
      if (v32 * v25 + 0.001 > v37)
      {
        v39 = v38;
      }
      else
      {
        v30 = v32;
        v39 = *(float *)&_D2 + v21;
      }
      *(float *)&_D2 = *(float *)&a4 + (float)(v30 * *(float *)&_D2);
      *(float *)&a4 = *((float *)&a4 + 1) - (float)(v30 * v21);
      _NF = *(float *)&a4 < *(float *)&a2;
      *(float *)&a2 = fmaxf(*(float *)&a2, *(float *)&_D2);
      HIDWORD(a2) = fminf(*((float *)&a2 + 1), *(float *)&a4);
      v41 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&a4, 0));
      if (_NF)
        a2 = v41;
      v42 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&_D2, 0));
      if (v8 < *(float *)&_D2)
        a2 = v42;
      v43 = (vsub_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&a2, 1), *(float32x2_t *)&a2).f32[0] - v30 * v25)
          / (v25 + v39);
      return v30 + v43;
    }
  }
  return result;
}

float DetermineNewDeadbandMinComponent(double a1, double a2, double _D2, float a4, float _S4)
{
  float v5;
  double v6;
  double v7;
  float v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  float v14;
  float v20;
  double v21;
  double v22;

  v5 = *(float *)&a1;
  v6 = vaddv_f32(*(float32x2_t *)&a1) * 0.5;
  v7 = _S4 * 0.5;
  *(float *)&a1 = v6 - v7;
  v8 = v6 + v7;
  v9 = *((float *)&a2 + 1);
  v10 = v8 + 0.001;
  if (*(float *)&a2 + 0.001 <= *(float *)&a1)
  {
    if (v10 > v9)
      *(float *)&a1 = fmaxf(*((float *)&a2 + 1) - (float)(v8 - *(float *)&a1), *(float *)&a2);
  }
  else if (v10 <= v9)
  {
    *(float *)&a1 = fminf(*((float *)&a2 + 1) - (float)(v8 - *(float *)&a1), *(float *)&a2);
  }
  v11 = *(float *)&a1 + _S4;
  v12 = *((float *)&a1 + 1);
  v13 = (float)(*(float *)&a1 + _S4) + 0.001;
  if (v5 + 0.001 <= *(float *)&a1)
  {
    if (v13 > v12)
      *(float *)&a1 = fmaxf(*((float *)&a1 + 1) - (float)(v11 - *(float *)&a1), v5);
  }
  else if (v13 <= v12)
  {
    *(float *)&a1 = fminf(*((float *)&a1 + 1) - (float)(v11 - *(float *)&a1), v5);
  }
  v14 = vmlas_n_f32(a4, _S4, *(float *)&_D2);
  __asm { FMLS            S3, S4, V2.S[1] }
  v20 = *(float *)&a1 + _S4;
  v21 = _S3;
  v22 = v20 + 0.001;
  if (v14 + 0.001 <= *(float *)&a1)
  {
    if (v22 > v21)
      *(float *)&a1 = fmaxf(_S3 - (float)(v20 - *(float *)&a1), v14);
  }
  else if (v22 <= v21)
  {
    *(float *)&a1 = fminf(_S3 - (float)(v20 - *(float *)&a1), v14);
  }
  return *(float *)&a1;
}

uint64_t PixelFormatIs420(int a1)
{
  uint64_t result;
  int v3;

  result = 1;
  if (a1 > 792229423)
  {
    if (a1 <= 875704437)
    {
      if (a1 == 792229424)
        return result;
      v3 = 875704422;
      goto LABEL_14;
    }
    if (a1 != 875704438 && a1 != 2084070960)
    {
      v3 = 2084075056;
LABEL_14:
      if (a1 != v3)
        return 0;
    }
  }
  else
  {
    if (a1 <= 758670895)
    {
      if (a1 == 641230384)
        return result;
      v3 = 641234480;
      goto LABEL_14;
    }
    if (a1 != 758670896 && a1 != 758674992)
    {
      v3 = 792225328;
      goto LABEL_14;
    }
  }
  return result;
}

uint64_t cachedTexturesFromPixelBuffer(__CVBuffer *a1, uint64_t a2, __CVMetalTextureCache *a3)
{
  signed int PixelFormatType;
  const __CFDictionary *v7;
  uint64_t v8;
  int v9;
  unsigned int WidthOfPlane;
  unsigned int HeightOfPlane;
  uint64_t v12;
  const __CFAllocator *v13;
  uint64_t v14;
  void *v15;
  signed int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  const __CFDictionary *v20;
  uint64_t v21;
  void *v22;
  CVMetalTextureRef image;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  image = 0;
  if (!a1 || !a2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v7 = 0;
    v8 = 4294954516;
    goto LABEL_41;
  }
  *(_DWORD *)a2 = 0;
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  v7 = 0;
  v8 = 4294954514;
  if (PixelFormatType > 792229423)
  {
    if (PixelFormatType <= 875704437)
    {
      if (PixelFormatType == 792229424)
        goto LABEL_17;
      v9 = 875704422;
    }
    else
    {
      if (PixelFormatType == 875704438 || PixelFormatType == 2084075056)
        goto LABEL_17;
      v9 = 2084070960;
    }
  }
  else if (PixelFormatType <= 758670895)
  {
    if (PixelFormatType == 641230384)
      goto LABEL_17;
    v9 = 641234480;
  }
  else
  {
    if (PixelFormatType == 758670896 || PixelFormatType == 758674992)
      goto LABEL_17;
    v9 = 792225328;
  }
  if (PixelFormatType != v9)
    goto LABEL_41;
LABEL_17:
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, 0);
  v12 = *MEMORY[0x1E0CA8F58];
  v27 = *MEMORY[0x1E0CA8F58];
  v28[0] = &unk_1E98AFA70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, a1, v7, MTLPixelFormatR8Unorm, WidthOfPlane, HeightOfPlane, 0, &image)|| (CVMetalTextureGetTexture(image), v14 = objc_claimAutoreleasedReturnValue(), v15 = *(void **)(a2 + 8), *(_QWORD *)(a2 + 8) = v14, v15, !*(_QWORD *)(a2 + 8)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v8 = 4294954510;
    goto LABEL_41;
  }
  ++*(_DWORD *)a2;
  if (image)
    CFRelease(image);
  v16 = CVPixelBufferGetPixelFormatType(a1);
  v8 = 4294954514;
  if (v16 > 792229423)
  {
    if (v16 <= 875704437)
    {
      if (v16 == 792229424)
        goto LABEL_35;
      v17 = 875704422;
    }
    else
    {
      if (v16 == 875704438 || v16 == 2084075056)
        goto LABEL_35;
      v17 = 2084070960;
    }
LABEL_34:
    if (v16 != v17)
      goto LABEL_41;
    goto LABEL_35;
  }
  if (v16 <= 758670895)
  {
    if (v16 == 641230384)
      goto LABEL_35;
    v17 = 641234480;
    goto LABEL_34;
  }
  if (v16 != 758670896 && v16 != 758674992)
  {
    v17 = 792225328;
    goto LABEL_34;
  }
LABEL_35:
  v18 = CVPixelBufferGetWidthOfPlane(a1, 1uLL);
  v19 = CVPixelBufferGetHeightOfPlane(a1, 1uLL);
  v25 = v12;
  v26 = &unk_1E98AFA70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (CVMetalTextureCacheCreateTextureFromImage(v13, a3, a1, v20, MTLPixelFormatRG8Unorm, v18, v19, 1uLL, &image)
    || (CVMetalTextureGetTexture(image),
        v21 = objc_claimAutoreleasedReturnValue(),
        v22 = *(void **)(a2 + 16),
        *(_QWORD *)(a2 + 16) = v21,
        v22,
        !*(_QWORD *)(a2 + 16)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v8 = 4294954510;
  }
  else
  {
    ++*(_DWORD *)a2;
    if (image)
      CFRelease(image);
    v8 = 0;
  }
  v7 = v20;
LABEL_41:

  return v8;
}

uint64_t computeNumberOfCCWRotationsFromInputToFramingSpaceForCameraOrientation(int a1, int a2, int a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  _DWORD v10[4];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 4;
  v3 = 0;
  if (a2)
    v4 = 4;
  else
    v4 = 3;
  if (a2)
    v5 = 3;
  else
    v5 = 4;
  v10[0] = v4;
  v10[1] = 2;
  v10[2] = v5;
  v10[3] = 1;
  do
    v6 = v10[v3++];
  while (v6 != a1);
  v7 = v3 - 1;
  if (a3)
    v8 = v3 - 1;
  else
    v8 = v3 + 1;
  if (!a2)
    v8 = v7;
  return (4 - v8);
}

double rotatePointCCW(int a1, double a2, double a3)
{
  float v5;
  __float2 v6;
  float32x4_t v7;
  float32x4_t v8;
  float v9;
  float v10;
  float32x4_t v11;
  int32x4_t v12;
  int8x16_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  int32x4_t v17;
  int8x16_t v18;
  float32x4_t v19;
  float32x4_t v20;

  if (a1)
  {
    v5 = (double)a1 * 1.57079633;
    v6 = __sincosf_stret(v5 * 0.5);
    v7 = vmulq_n_f32((float32x4_t)xmmword_1D4E43AA0, v6.__sinval);
    v8 = v7;
    v8.i32[3] = LODWORD(v6.__cosval);
    v9 = a2;
    v10 = a3;
    v11 = vmulq_f32(v8, (float32x4_t)xmmword_1D4E43B10);
    v12 = (int32x4_t)vnegq_f32(v11);
    v13 = (int8x16_t)vtrn2q_s32((int32x4_t)v11, vtrn1q_s32((int32x4_t)v11, v12));
    v14 = vmlaq_n_f32(vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v11, (int8x16_t)v12, 8uLL), v10), (float32x4_t)vextq_s8(v13, v13, 8uLL), v9);
    v15 = (float32x4_t)vrev64q_s32((int32x4_t)v11);
    v15.i32[0] = v12.i32[1];
    v15.i32[3] = v12.i32[2];
    v16 = vmlaq_f32(v14, (float32x4_t)0, v15);
    v17 = (int32x4_t)vnegq_f32(v16);
    v18 = (int8x16_t)vtrn2q_s32((int32x4_t)v16, vtrn1q_s32((int32x4_t)v16, v17));
    v19 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v16, (int8x16_t)v17, 8uLL), *(float32x2_t *)v7.f32, 1), (float32x4_t)vextq_s8(v18, v18, 8uLL), v7.f32[0]);
    v20 = (float32x4_t)vrev64q_s32((int32x4_t)v16);
    v20.i32[0] = v17.i32[1];
    v20.i32[3] = v17.i32[2];
    return vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v16, v8, 3), v20, v7, 2), v19).f32[0];
  }
  return a2;
}

CGFloat rotateRectCCW(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  float v9;
  __float2 v10;
  float32x4_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double MinX;
  double MaxX;
  double MinY;
  CGFloat MaxY;
  float v19;
  float v20;
  float32x4_t v21;
  int32x4_t v22;
  int8x16_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  int32x4_t v29;
  int8x16_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  int32x4_t v34;
  int8x16_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  int32x4_t v40;
  int8x16_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  int32x4_t v46;
  int8x16_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v54;
  float32x4_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  if (a1)
  {
    v9 = (double)a1 * 1.57079633;
    v10 = __sincosf_stret(v9 * 0.5);
    v11 = vmulq_n_f32((float32x4_t)xmmword_1D4E43AA0, v10.__sinval);
    v55 = v11;
    v11.i32[3] = LODWORD(v10.__cosval);
    v54 = v11;
    *(CGFloat *)v11.i64 = a2;
    v12 = a3;
    v13 = a4;
    v14 = a5;
    MinX = CGRectGetMinX(*(CGRect *)v11.f32);
    v56.origin.x = a2;
    v56.origin.y = a3;
    v56.size.width = a4;
    v56.size.height = a5;
    MaxX = CGRectGetMaxX(v56);
    v57.origin.x = a2;
    v57.origin.y = a3;
    v57.size.width = a4;
    v57.size.height = a5;
    MinY = CGRectGetMinY(v57);
    v58.origin.x = a2;
    v58.origin.y = a3;
    v58.size.width = a4;
    v58.size.height = a5;
    MaxY = CGRectGetMaxY(v58);
    v19 = MinX;
    v20 = MinY;
    v21 = vmulq_f32(v54, (float32x4_t)xmmword_1D4E43B10);
    v22 = (int32x4_t)vnegq_f32(v21);
    v23 = (int8x16_t)vtrn2q_s32((int32x4_t)v21, vtrn1q_s32((int32x4_t)v21, v22));
    v24 = (float32x4_t)vextq_s8(v23, v23, 8uLL);
    v25 = (float32x4_t)vextq_s8((int8x16_t)v21, (int8x16_t)v22, 8uLL);
    v26 = vmulq_n_f32(v25, v20);
    v27 = (float32x4_t)vrev64q_s32((int32x4_t)v21);
    v27.i32[0] = v22.i32[1];
    v27.i32[3] = v22.i32[2];
    v28 = vmlaq_f32(vmlaq_n_f32(v26, v24, v19), (float32x4_t)0, v27);
    v29 = (int32x4_t)vnegq_f32(v28);
    v30 = (int8x16_t)vtrn2q_s32((int32x4_t)v28, vtrn1q_s32((int32x4_t)v28, v29));
    v31 = (float32x4_t)vrev64q_s32((int32x4_t)v28);
    v31.i32[0] = v29.i32[1];
    v31.i32[3] = v29.i32[2];
    v32 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v28, v54, 3), v31, v55, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v28, (int8x16_t)v29, 8uLL), *(float32x2_t *)v55.f32, 1), (float32x4_t)vextq_s8(v30, v30, 8uLL), v55.f32[0]));
    *(float *)v29.i32 = MaxX;
    v33 = vmlaq_f32(vmlaq_n_f32(v26, v24, *(float *)v29.i32), (float32x4_t)0, v27);
    v34 = (int32x4_t)vnegq_f32(v33);
    v35 = (int8x16_t)vtrn2q_s32((int32x4_t)v33, vtrn1q_s32((int32x4_t)v33, v34));
    v36 = (float32x4_t)vrev64q_s32((int32x4_t)v33);
    v36.i32[0] = v34.i32[1];
    v36.i32[3] = v34.i32[2];
    v37 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v33, v54, 3), v36, v55, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v33, (int8x16_t)v34, 8uLL), *(float32x2_t *)v55.f32, 1), (float32x4_t)vextq_s8(v35, v35, 8uLL), v55.f32[0]));
    *(float *)&MaxY = MaxY;
    v38 = vmulq_n_f32(v25, *(float *)&MaxY);
    v39 = vmlaq_f32(vmlaq_n_f32(v38, v24, v19), (float32x4_t)0, v27);
    v40 = (int32x4_t)vnegq_f32(v39);
    v41 = (int8x16_t)vtrn2q_s32((int32x4_t)v39, vtrn1q_s32((int32x4_t)v39, v40));
    v42 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v39, (int8x16_t)v40, 8uLL), *(float32x2_t *)v55.f32, 1), (float32x4_t)vextq_s8(v41, v41, 8uLL), v55.f32[0]);
    v43 = (float32x4_t)vrev64q_s32((int32x4_t)v39);
    v43.i32[0] = v40.i32[1];
    v43.i32[3] = v40.i32[2];
    v44 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v39, v54, 3), v43, v55, 2), v42);
    v45 = vmlaq_f32(vmlaq_n_f32(v38, v24, *(float *)v29.i32), (float32x4_t)0, v27);
    v46 = (int32x4_t)vnegq_f32(v45);
    v47 = (int8x16_t)vtrn2q_s32((int32x4_t)v45, vtrn1q_s32((int32x4_t)v45, v46));
    v48 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v45, (int8x16_t)v46, 8uLL), *(float32x2_t *)v55.f32, 1), (float32x4_t)vextq_s8(v47, v47, 8uLL), v55.f32[0]);
    v49 = (float32x4_t)vrev64q_s32((int32x4_t)v45);
    v49.i32[0] = v46.i32[1];
    v49.i32[3] = v46.i32[2];
    v50 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v45, v54, 3), v49, v55, 2), v48);
    v32.i32[3] = 0;
    v37.i32[3] = 0;
    v51 = vminnmq_f32(v32, v37);
    v44.i32[3] = 0;
    v50.i32[3] = 0;
    v51.i32[3] = 0;
    v52 = vminnmq_f32(v44, v50);
    v52.i32[3] = 0;
    return vminnmq_f32(v51, v52).f32[0];
  }
  return a2;
}

double rotateRectInImageCCW(int a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double v8;
  int v9;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  int v14;
  double v15;
  double v16;
  double v17;
  int v18;
  double v19;
  double v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v8 = a2;
  if (a1)
  {
    v9 = a1;
    MinX = CGRectGetMinX(*(CGRect *)&a2);
    v28.origin.x = v8;
    v28.origin.y = a3;
    v28.size.width = a4;
    v28.size.height = a5;
    MaxX = CGRectGetMaxX(v28);
    v29.origin.x = v8;
    v29.origin.y = a3;
    v29.size.width = a4;
    v29.size.height = a5;
    MinY = CGRectGetMinY(v29);
    v30.origin.x = v8;
    v30.origin.y = a3;
    v30.size.width = a4;
    v30.size.height = a5;
    MaxY = CGRectGetMaxY(v30);
    if (v9 < 1)
    {
      v16 = MinX;
      v19 = MaxX;
    }
    else
    {
      v14 = v9;
      v15 = MinY;
      v16 = MinX;
      do
      {
        v17 = v16;
        v16 = v15;
        v15 = 1.0 - v17;
        --v14;
      }
      while (v14);
      v18 = v9;
      v19 = MaxX;
      do
      {
        v20 = v19;
        v19 = MinY;
        MinY = 1.0 - v20;
        --v18;
      }
      while (v18);
      v21 = v9;
      v22 = MaxY;
      do
      {
        v23 = MinX;
        MinX = v22;
        v22 = 1.0 - v23;
        --v21;
      }
      while (v21);
      do
      {
        v24 = MaxX;
        MaxX = MaxY;
        MaxY = 1.0 - v24;
        --v9;
      }
      while (v9);
    }
    if (MinX >= MaxX)
      v25 = MaxX;
    else
      v25 = MinX;
    if (v16 >= v19)
      v26 = v19;
    else
      v26 = v16;
    if (v26 >= v25)
      return v25;
    else
      return v26;
  }
  return v8;
}

float32x2_t distortPoint(float32x2_t *a1, float32x2_t a2)
{
  float32x2_t v2;
  float32x2_t v3;
  float v4;

  v2 = a1[9];
  v3 = vsub_f32(a2, v2);
  v4 = a1[10].f32[0] * vaddv_f32(vmul_f32(v3, v3));
  return vmla_n_f32(v2, v3, 1.0/ (float)((float)((float)(a1[15].f32[0]+ (float)((float)(a1[15].f32[1]+ (float)((float)(a1[16].f32[0]+ (float)((float)(a1[16].f32[1]+ (float)((float)(a1[17].f32[0]+ (float)((float)(a1[17].f32[1] + (float)((float)(a1[18].f32[0] + (float)(a1[18].f32[1] * v4)) * v4)) * v4))* v4))* v4))* v4))* v4))* 0.01)+ 1.0));
}

float32x2_t undistortPoint(float32x2_t *a1, float32x2_t a2)
{
  float32x2_t v3;
  float32x2_t v4;
  float32x2_t v5;
  int v6;
  int v7;
  float v8;
  int32x2_t v9;
  int v10;
  float32x2_t v11;
  float32x2_t v12;
  int v13;
  int v14;
  BOOL v15;
  int v16;
  float v17;
  float v18;
  float v19;
  float v20;

  v3 = a1[9];
  v4 = vsub_f32(a2, v3);
  v5 = *a1;
  v6 = (int)COERCE_FLOAT(*a1);
  if (v6 >= 0)
    v7 = (int)COERCE_FLOAT(*a1);
  else
    v7 = v6 + 1;
  LODWORD(v8) = HIDWORD(*(unint64_t *)a1);
  v9.i32[0] = (int)COERCE_FLOAT(*a1);
  v9.i32[1] = (int)v5.f32[1];
  v10 = a1[10].i32[1];
  v11 = vmul_f32(vcvt_f32_s32(v9), (float32x2_t)0x3F0000003F000000);
  v12 = vmul_f32(v11, v11);
  v12.f32[0] = sqrtf(vaddv_f32(v12));
  v13 = (int)(float)(v12.f32[0] - (float)v10);
  v14 = v7 >> 1;
  if (v12.f32[0] <= (float)v10)
    v13 = 0;
  v15 = __OFSUB__(v14, v10);
  v16 = v14 - v10;
  if ((v16 < 0) ^ v15 | (v16 == 0))
    v16 = v13;
  else
    LODWORD(v8) = HIDWORD(*(unint64_t *)a1);
  v17 = vsub_f32(v5, v3).f32[0] - (float)v16;
  if (v17 <= (float)(v3.f32[0] - (float)v16))
    v17 = v3.f32[0] - (float)v16;
  v18 = v8 - v3.f32[1];
  if (v18 <= v3.f32[1])
    LODWORD(v18) = HIDWORD(*(_QWORD *)&a1[9]);
  if (v17 > v18)
    v18 = v17;
  v19 = vaddv_f32(vmul_f32(v4, v4));
  v12.f32[0] = sqrtf(v19);
  if (v12.f32[0] > v18)
  {
    v4 = vmul_n_f32(vdiv_f32(v4, (float32x2_t)vdup_lane_s32((int32x2_t)v12, 0)), v18);
    v19 = vaddv_f32(vmul_f32(v4, v4));
  }
  v20 = a1[10].f32[0] * v19;
  return vmla_n_f32(v3, v4, 1.0/ (float)((float)((float)(a1[11].f32[0]+ (float)((float)(a1[11].f32[1]+ (float)((float)(a1[12].f32[0]+ (float)((float)(a1[12].f32[1]+ (float)((float)(a1[13].f32[0]+ (float)((float)(a1[13].f32[1] + (float)((float)(a1[14].f32[0] + (float)(a1[14].f32[1] * v20)) * v20)) * v20))* v20))* v20))* v20))* v20))* 0.01)+ 1.0));
}

uint64_t isCinematicFramingFrontCamera(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D05A50]) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D05A38]);

  return v2;
}

uint64_t isCinematicFramingAllowedCamera(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D05A50]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D05A38]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D05A18]) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D05A28]);
  }

  return v2;
}

uint64_t isDeskCamAllowedCamera(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D05A50]) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D05A28]);

  return v2;
}

BOOL _isRectAlmostEqual(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, float a9)
{
  float v24;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v27 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  v24 = v27.size.width * v27.size.height;
  if (v24 == 0.0)
    return 0;
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  v30.origin.x = a5;
  v30.origin.y = a6;
  v30.size.width = a7;
  v30.size.height = a8;
  v29 = CGRectUnion(v28, v30);
  *(float *)&v29.origin.x = v29.size.width * v29.size.height;
  return (float)(v24 / *(float *)&v29.origin.x) >= a9;
}

id getVisionCoreProcessingDescriptorClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVisionCoreProcessingDescriptorClass_softClass;
  v7 = getVisionCoreProcessingDescriptorClass_softClass;
  if (!getVisionCoreProcessingDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVisionCoreProcessingDescriptorClass_block_invoke;
    v3[3] = &unk_1E98A7750;
    v3[4] = &v4;
    __getVisionCoreProcessingDescriptorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D4E378E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getVisionCoreInferenceNetworkIdentifierCamGaze()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getVisionCoreInferenceNetworkIdentifierCamGazeSymbolLoc_ptr;
  v6 = getVisionCoreInferenceNetworkIdentifierCamGazeSymbolLoc_ptr;
  if (!getVisionCoreInferenceNetworkIdentifierCamGazeSymbolLoc_ptr)
  {
    v1 = (void *)VisionCoreLibrary();
    v0 = (id *)dlsym(v1, "VisionCoreInferenceNetworkIdentifierCamGaze");
    v4[3] = (uint64_t)v0;
    getVisionCoreInferenceNetworkIdentifierCamGazeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getVisionCoreInferenceNetworkIdentifierCamGaze_cold_1();
  return *v0;
}

void sub_1D4E3797C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getVisionCoreResourceVersionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVisionCoreResourceVersionClass_softClass;
  v7 = getVisionCoreResourceVersionClass_softClass;
  if (!getVisionCoreResourceVersionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVisionCoreResourceVersionClass_block_invoke;
    v3[3] = &unk_1E98A7750;
    v3[4] = &v4;
    __getVisionCoreResourceVersionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D4E38138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVisionCoreResourceVersionClass_block_invoke(uint64_t a1)
{
  Class result;

  VisionCoreLibrary();
  result = objc_getClass("VisionCoreResourceVersion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getVisionCoreResourceVersionClass_block_invoke_cold_1();
  getVisionCoreResourceVersionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t VisionCoreLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!VisionCoreLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E98A7730;
    v3 = 0;
    VisionCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VisionCoreLibraryCore_frameworkLibrary)
    VisionCoreLibrary_cold_1(&v1);
  return VisionCoreLibraryCore_frameworkLibrary;
}

Class __getVisionCoreProcessingDescriptorClass_block_invoke(uint64_t a1)
{
  Class result;

  VisionCoreLibrary();
  result = objc_getClass("VisionCoreProcessingDescriptor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getVisionCoreProcessingDescriptorClass_block_invoke_cold_1();
  getVisionCoreProcessingDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

float RectToState@<S0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  float MinX;
  float MinY;
  float result;
  CGRect v13;
  CGRect v14;

  MinX = CGRectGetMinX(*(CGRect *)&a2);
  *(float *)a1 = MinX;
  v13.origin.x = a2;
  v13.origin.y = a3;
  v13.size.width = a4;
  v13.size.height = a5;
  MinY = CGRectGetMinY(v13);
  *(float *)(a1 + 4) = MinY;
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  result = CGRectGetWidth(v14);
  *(float *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 16) = 0;
  *(_DWORD *)(a1 + 12) = 0;
  return result;
}

__n128 PivotDescriptionsToState@<Q0>(void *a1@<X0>, uint64_t a2@<X8>, __n128 _Q0@<Q0>, __n128 a4@<Q1>, float _S2@<S2>, float a6@<S3>)
{
  unsigned __int32 v9;
  float v15;
  id v16;
  double v17;
  float v18;
  double v21;
  float v22;
  float v23;
  __n128 result;
  __n128 v25;

  _S9 = _S2;
  v25 = _Q0;
  v9 = _Q0.n128_u32[2];
  __asm { FMLS            S1, S2, V0.S[2] }
  *(_DWORD *)a2 = _S1;
  v15 = _Q0.n128_f32[1];
  v16 = a1;
  LODWORD(v17) = v9;
  objc_msgSend(v16, "getHeightForWidth:", v17);
  *(_DWORD *)(a2 + 8) = v25.n128_u32[2];
  *(float *)(a2 + 4) = v15 - (float)(v18 * a6);
  _D1 = __PAIR64__(v25.n128_u32[1], a4.n128_u32[2]);
  __asm { FMLS            S0, S9, V2.S[2] }
  *(_DWORD *)(a2 + 12) = _S0;
  LODWORD(v21) = v9;
  objc_msgSend(v16, "getHeightDerivativeForWidth:widthDerivative:", v21, COERCE_DOUBLE(__PAIR64__(v25.n128_u32[1], a4.n128_u32[2])));
  v23 = v22;

  *(float *)(a2 + 16) = a4.n128_f32[1] - (float)(v23 * a6);
  result = a4;
  *(_DWORD *)(a2 + 20) = a4.n128_u32[2];
  return result;
}

float ComputeTPivot(float a1, float a2, float a3, float a4, float a5)
{
  float v5;
  float v6;
  float v7;
  float v8;
  BOOL v9;
  float v10;
  float v11;

  v5 = a2 - a1;
  v6 = a4 - a3;
  if (vabds_f32(v5, v6) >= 0.001)
  {
    v7 = v5 - v6;
    v8 = (float)(a3 - a1) / v7;
    a5 = 1.0;
    v9 = v8 >= 1.0 || v8 <= 0.0;
    v10 = a1 - a3;
    v11 = (float)(v10 + (float)(v7 * v8)) * (float)(v10 + (float)(v7 * v8));
    if (v9)
      v11 = *(float *)"(knN";
    if ((float)((float)(v10 + (float)(v7 * 0.0)) * (float)(v10 + (float)(v7 * 0.0))) < v11)
    {
      v8 = 0.0;
      v11 = (float)(v10 + (float)(v7 * 0.0)) * (float)(v10 + (float)(v7 * 0.0));
    }
    if ((float)((float)(v10 + v7) * (float)(v10 + v7)) >= v11)
      return v8;
  }
  return a5;
}

uint64_t __filterTracksThatCanFitInView_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  float v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  float v19;
  __int128 v21;
  uint64_t v22;

  v21 = *(_OWORD *)(a1 + 64);
  v22 = *(_QWORD *)(a1 + 80);
  v5 = a3;
  objc_msgSend(a2, "faceBoundingBoxForFramingAtTime:", &v21);
  v10 = distanceToViewport(v6, v7, v8, v9, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  v21 = *(_OWORD *)(a1 + 64);
  v22 = *(_QWORD *)(a1 + 80);
  objc_msgSend(v5, "faceBoundingBoxForFramingAtTime:", &v21);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = distanceToViewport(v12, v14, v16, v18, *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  if (v10 < v19)
    return -1;
  else
    return v10 != v19;
}

float distanceToViewport(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  float MidX;
  double MaxX;
  double MinX;
  CGFloat v17;
  float MidY;
  double MaxY;
  double MinY;
  float v21;
  float v22;
  float v23;
  float v26;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v28.origin.x = a5;
  v28.origin.y = a6;
  v28.size.width = a7;
  v28.size.height = a8;
  MidX = CGRectGetMidX(v28);
  v26 = MidX;
  MaxX = MidX;
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  MinX = MaxX;
  if (CGRectGetMinX(v29) <= MaxX)
  {
    v30.origin.x = a1;
    v30.origin.y = a2;
    v30.size.width = a3;
    v30.size.height = a4;
    MinX = CGRectGetMinX(v30);
  }
  v31.origin.x = a1;
  v31.origin.y = a2;
  v31.size.width = a3;
  v31.size.height = a4;
  if (MinX <= CGRectGetMaxX(v31))
  {
    v34.origin.x = a1;
    v34.origin.y = a2;
    v34.size.width = a3;
    v34.size.height = a4;
    MaxX = CGRectGetMaxX(v34);
    v17 = a8;
  }
  else
  {
    v32.origin.x = a1;
    v32.origin.y = a2;
    v32.size.width = a3;
    v32.size.height = a4;
    v17 = a8;
    if (CGRectGetMinX(v32) <= MaxX)
    {
      v33.origin.x = a1;
      v33.origin.y = a2;
      v33.size.width = a3;
      v33.size.height = a4;
      MaxX = CGRectGetMinX(v33);
    }
  }
  v35.origin.x = a5;
  v35.origin.y = a6;
  v35.size.width = a7;
  v35.size.height = v17;
  MidY = CGRectGetMidY(v35);
  MaxY = MidY;
  v36.origin.x = a1;
  v36.origin.y = a2;
  v36.size.width = a3;
  v36.size.height = a4;
  MinY = MidY;
  if (CGRectGetMinY(v36) <= MidY)
  {
    v37.origin.x = a1;
    v37.origin.y = a2;
    v37.size.width = a3;
    v37.size.height = a4;
    MinY = CGRectGetMinY(v37);
  }
  v38.origin.x = a1;
  v38.origin.y = a2;
  v38.size.width = a3;
  v38.size.height = a4;
  if (MinY <= CGRectGetMaxY(v38))
  {
    v41.origin.x = a1;
    v41.origin.y = a2;
    v41.size.width = a3;
    v41.size.height = a4;
    MaxY = CGRectGetMaxY(v41);
    v21 = v26;
  }
  else
  {
    v39.origin.x = a1;
    v39.origin.y = a2;
    v39.size.width = a3;
    v39.size.height = a4;
    v21 = v26;
    if (CGRectGetMinY(v39) <= MaxY)
    {
      v40.origin.x = a1;
      v40.origin.y = a2;
      v40.size.width = a3;
      v40.size.height = a4;
      MaxY = CGRectGetMinY(v40);
    }
  }
  v22 = MaxX;
  v23 = MaxY;
  return (float)((float)(MidY - v23) * (float)(MidY - v23)) + (float)((float)(v21 - v22) * (float)(v21 - v22));
}

void sub_1D4E39FE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4E3A128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1D4E3A310(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SpringAnimation<double,6ul>::update(uint64_t result, double a2, double a3, double a4, __n128 a5)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  double v9;
  int64x2_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  int64x2_t v15;
  uint64_t v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  int64x2_t v20;
  uint64_t v21;
  uint64_t v22;
  int64x2_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  int64x2_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  __int128 v35;
  __n128 v36;
  _OWORD v37[3];
  _OWORD v38[3];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  a5.n128_f64[0] = a2;
  v5 = result;
  if (a2 > 0.00833333333)
  {
    do
    {
      v36 = a5;
      result = SpringAnimation<double,6ul>::update(v5, 0.00833333333);
      a5.n128_u64[1] = v36.n128_u64[1];
      a5.n128_f64[0] = v36.n128_f64[0] + -0.00833333333;
    }
    while (v36.n128_f64[0] + -0.00833333333 > 0.00833333333);
  }
  v6 = 0;
  v43 = 0u;
  v44 = 0u;
  v7 = (_OWORD *)(v5 + 72);
  v42 = 0u;
  do
  {
    *(__int128 *)((char *)&v42 + v6) = (__int128)vsubq_f64(*(float64x2_t *)(v5 + v6 + 72), *(float64x2_t *)(v5 + v6 + 24));
    v6 += 16;
  }
  while (v6 != 48);
  v8 = 0;
  v9 = *(double *)v5;
  v10 = vdupq_lane_s64(COERCE__INT64(-*(double *)v5), 0);
  do
    v38[v8++] = v10;
  while (v8 != 3);
  v11 = 0;
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  do
  {
    *(__int128 *)((char *)&v39 + v11 * 16) = (__int128)vmulq_f64((float64x2_t)v38[v11], *(float64x2_t *)((char *)&v42 + v11 * 16));
    ++v11;
  }
  while (v11 != 3);
  v12 = 0;
  v13 = *(uint64_t *)(v5 + 8);
  v14 = sqrt(v9 * *(double *)&v13);
  v15 = vdupq_lane_s64(COERCE__INT64(-(*(double *)(v5 + 16) * (v14 + v14))), 0);
  do
    v37[v12++] = v15;
  while (v12 != 3);
  v16 = 0;
  v17 = (_OWORD *)(v5 + 120);
  memset(v38, 0, sizeof(v38));
  do
  {
    v38[v16] = vmulq_f64((float64x2_t)v37[v16], (float64x2_t)v17[v16]);
    ++v16;
  }
  while (v16 != 3);
  v18 = 0;
  memset(v37, 0, sizeof(v37));
  do
  {
    v37[v18] = vaddq_f64(*(float64x2_t *)((char *)&v39 + v18 * 16), (float64x2_t)v38[v18]);
    ++v18;
  }
  while (v18 != 3);
  v19 = 0;
  v20 = vdupq_lane_s64(v13, 0);
  do
  {
    *(__int128 *)((char *)&v39 + v19) = (__int128)v20;
    v19 += 16;
  }
  while (v19 != 48);
  v21 = 0;
  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  do
  {
    *(__int128 *)((char *)&v42 + v21 * 16) = (__int128)vdivq_f64((float64x2_t)v37[v21], *(float64x2_t *)((char *)&v39 + v21 * 16));
    ++v21;
  }
  while (v21 != 3);
  v22 = 0;
  v23 = vdupq_lane_s64(a5.n128_i64[0], 0);
  do
    v38[v22++] = v23;
  while (v22 != 3);
  v24 = 0;
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  do
  {
    *(__int128 *)((char *)&v39 + v24 * 16) = (__int128)vmulq_f64((float64x2_t)v38[v24], *(float64x2_t *)((char *)&v42 + v24 * 16));
    ++v24;
  }
  while (v24 != 3);
  for (i = 0; i != 3; ++i)
    v17[i] = vaddq_f64(*(float64x2_t *)((char *)&v39 + i * 16), (float64x2_t)v17[i]);
  v26 = 0;
  v27 = vdupq_lane_s64(a5.n128_i64[0], 0);
  do
    v38[v26++] = v27;
  while (v26 != 3);
  v28 = 0;
  v40 = 0u;
  v41 = 0u;
  v39 = 0u;
  do
  {
    *(__int128 *)((char *)&v39 + v28 * 16) = (__int128)vmulq_f64((float64x2_t)v38[v28], (float64x2_t)v17[v28]);
    ++v28;
  }
  while (v28 != 3);
  for (j = 0; j != 3; ++j)
    v7[j] = vaddq_f64(*(float64x2_t *)((char *)&v39 + j * 16), (float64x2_t)v7[j]);
  v30 = 0;
  *(double *)(v5 + 168) = a5.n128_f64[0] + *(double *)(v5 + 168);
  v31 = 0.0;
  do
  {
    v31 = v31 + *(double *)((char *)v37 + v30) * *(double *)((char *)v37 + v30);
    v30 += 8;
  }
  while (v30 != 48);
  v32 = 0;
  v33 = 0.0;
  v34 = sqrt(v31);
  do
  {
    v33 = v33 + *(double *)((char *)v17 + v32) * *(double *)((char *)v17 + v32);
    v32 += 8;
  }
  while (v32 != 48);
  if (v34 < 0.01 && sqrt(v33) < 0.01)
  {
    v35 = *(_OWORD *)(v5 + 40);
    *v7 = *(_OWORD *)(v5 + 24);
    *(_OWORD *)(v5 + 88) = v35;
    *(_OWORD *)(v5 + 104) = *(_OWORD *)(v5 + 56);
    *v17 = 0u;
    *(_OWORD *)(v5 + 136) = 0u;
    *(_OWORD *)(v5 + 152) = 0u;
    *(_QWORD *)(v5 + 168) = 0;
  }
  return result;
}

void sub_1D4E3A81C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4E3A964(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

double CGRectGetLeftMargin(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v9;

  if (CGRectGetMinX(*(CGRect *)&a1) < 0.0)
    return 0.0;
  v9.origin.x = a1;
  v9.origin.y = a2;
  v9.size.width = a3;
  v9.size.height = a4;
  return CGRectGetMinX(v9);
}

void CGRectGetRightMargin(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v8;

  if (1.0 - CGRectGetMaxX(*(CGRect *)&a1) >= 0.0)
  {
    v8.origin.x = a1;
    v8.origin.y = a2;
    v8.size.width = a3;
    v8.size.height = a4;
    CGRectGetMaxX(v8);
  }
}

void CGRectGetVerticalRightMargin(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v8;

  if (1.0 - CGRectGetMaxY(*(CGRect *)&a1) >= 0.0)
  {
    v8.origin.x = a1;
    v8.origin.y = a2;
    v8.size.width = a3;
    v8.size.height = a4;
    CGRectGetMaxY(v8);
  }
}

id defaultCalibrationDictionaryForPennsylvania()
{
  if (defaultCalibrationDictionaryForPennsylvania_onceToken != -1)
    dispatch_once(&defaultCalibrationDictionaryForPennsylvania_onceToken, &__block_literal_global);
  return (id)defaultCalibrationDictionaryForPennsylvania_paCalibrationDictionary;
}

void __defaultCalibrationDictionaryForPennsylvania_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("IntrinsicMatrixReferenceDimensions");
  v5[1] = CFSTR("PixelSize");
  v6[0] = &unk_1E98AFC50;
  v6[1] = &unk_1E98AFD40;
  v6[2] = &unk_1E98AFC78;
  v5[2] = CFSTR("LensDistortionCenter");
  v5[3] = CFSTR("IntrinsicMatrix");
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &_block_invoke_intrinsicBytes, 48);
  v6[3] = v0;
  v5[4] = CFSTR("LensDistortionCoefficients");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &_block_invoke_lensDistortionCoefficients, 32);
  v6[4] = v1;
  v5[5] = CFSTR("InverseLensDistortionCoefficients");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &_block_invoke_inverseLensDistortionCoefficients, 32);
  v5[6] = CFSTR("DistortionCalibrationValidMaxRadiusInPixels");
  v6[5] = v2;
  v6[6] = &unk_1E98AFAB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)defaultCalibrationDictionaryForPennsylvania_paCalibrationDictionary;
  defaultCalibrationDictionaryForPennsylvania_paCalibrationDictionary = v3;

}

id defaultCalibrationDictionaryForPictou()
{
  if (defaultCalibrationDictionaryForPictou_onceToken != -1)
    dispatch_once(&defaultCalibrationDictionaryForPictou_onceToken, &__block_literal_global_34);
  return (id)defaultCalibrationDictionaryForPictou_ptCalibrationDictionary;
}

void __defaultCalibrationDictionaryForPictou_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("IntrinsicMatrixReferenceDimensions");
  v5[1] = CFSTR("PixelSize");
  v6[0] = &unk_1E98AFCA0;
  v6[1] = &unk_1E98AFD40;
  v6[2] = &unk_1E98AFCC8;
  v5[2] = CFSTR("LensDistortionCenter");
  v5[3] = CFSTR("IntrinsicMatrix");
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &_block_invoke_2_intrinsicBytes, 48);
  v6[3] = v0;
  v5[4] = CFSTR("LensDistortionCoefficients");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &_block_invoke_2_lensDistortionCoefficients, 32);
  v6[4] = v1;
  v5[5] = CFSTR("InverseLensDistortionCoefficients");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &_block_invoke_2_inverseLensDistortionCoefficients, 32);
  v5[6] = CFSTR("DistortionCalibrationValidMaxRadiusInPixels");
  v6[5] = v2;
  v6[6] = &unk_1E98AFAE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)defaultCalibrationDictionaryForPictou_ptCalibrationDictionary;
  defaultCalibrationDictionaryForPictou_ptCalibrationDictionary = v3;

}

void sub_1D4E3E7EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

double warpPointInputImageToFramingSpaceInLandscapeLeft(uint64_t a1, float32x2_t a2)
{
  float32x2_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  float v9;
  float v11;
  _OWORD v12[10];

  v3 = vmul_f32(*(float32x2_t *)a1, a2);
  if (*(_BYTE *)(a1 + 64))
  {
    v4 = *(_OWORD *)(a1 + 112);
    v12[6] = *(_OWORD *)(a1 + 96);
    v12[7] = v4;
    v5 = *(_OWORD *)(a1 + 144);
    v12[8] = *(_OWORD *)(a1 + 128);
    v12[9] = v5;
    v6 = *(_OWORD *)(a1 + 48);
    v12[2] = *(_OWORD *)(a1 + 32);
    v12[3] = v6;
    v7 = *(_OWORD *)(a1 + 80);
    v12[4] = *(_OWORD *)(a1 + 64);
    v12[5] = v7;
    v8 = *(_OWORD *)(a1 + 16);
    v12[0] = *(_OWORD *)a1;
    v12[1] = v8;
    v3 = undistortPoint((float32x2_t *)v12, v3);
  }
  v9 = (float)(v3.f32[1] - *(float *)(a1 + 40)) / *(float *)(a1 + 36);
  v11 = atanf((float)(v3.f32[0] - COERCE_FLOAT(*(_QWORD *)(a1 + 24))) / COERCE_FLOAT(*(_OWORD *)(a1 + 16)));
  return COERCE_DOUBLE(__PAIR64__(COERCE_UNSIGNED_INT(atanf(v9)), LODWORD(v11)));
}

void getVisionCoreInferenceNetworkIdentifierCamGaze_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getVisionCoreInferenceNetworkIdentifierCamGaze(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SubjectSelectionSession.m"), 32, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getVisionCoreResourceVersionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getVisionCoreResourceVersionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SubjectSelectionSession.m"), 31, CFSTR("Unable to find class %s"), "VisionCoreResourceVersion");

  __break(1u);
}

void VisionCoreLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *VisionCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SubjectSelectionSession.m"), 29, CFSTR("%s"), *a1);

  __break(1u);
}

void __getVisionCoreProcessingDescriptorClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;
  CFAllocatorRef v2;
  CFPropertyListRef v3;
  CFOptionFlags v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getVisionCoreProcessingDescriptorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SubjectSelectionSession.m"), 30, CFSTR("Unable to find class %s"), "VisionCoreProcessingDescriptor");

  __break(1u);
  CFPropertyListCreateDeepCopy(v2, v3, v4);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D528]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1E0CA8900](buffer, key, attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8950](buffer, key, value, *(_QWORD *)&attachmentMode);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1E0CA8A30](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1E0CA8A38](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
  MEMORY[0x1E0CA8A40](textureCache, options);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1E0CA8A50](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B28](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B40](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B58](pixelBuffer, planeIndex);
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x1E0CA04E0]();
}

uint64_t FigMetalDecRef()
{
  return MEMORY[0x1E0D08A60]();
}

uint64_t FigMetalIncRef()
{
  return MEMORY[0x1E0D08A68]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x1E0CA1550]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x1E0CC69C8]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x1E0CECD28](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0CECD80](session, propertyKey, propertyValue);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x1E0C80B30]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x1E0C80B38]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

simd_float4 _simd_atan2_f4(simd_float4 y, simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x1E0C811B8]((__n128)y, (__n128)x);
  return result;
}

simd_float4 _simd_tan_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x1E0C81208]((__n128)x);
  return result;
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

float asinf(float a1)
{
  float result;

  MEMORY[0x1E0C815A0](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x1E0C81630](a1);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1E0D1FF10]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1E0D1FF38]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1E0D1FF40]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1E0D1FFB8]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x1E0D1FFD0]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x1E0D20130]();
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x1E0CA1F70]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

float tanf(float a1)
{
  float result;

  MEMORY[0x1E0C857F0](a1);
  return result;
}

