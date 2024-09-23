void sub_212DE96D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;
  int v15;

  if (v15)
    objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212DEA360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL ARUIFloatEqual(float a1, float a2)
{
  return vabds_f32(a1, a2) < 0.0001;
}

void sub_212DEA680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212DEA884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double matrix_float4x4_translation()
{
  return *(double *)&_PromotedConst_1;
}

BOOL ARUIFloatGreater(float a1, float a2)
{
  return (float)(a1 - a2) > 0.0001;
}

void sub_212DEC88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

float ARUISaturate(float a1)
{
  return fmaxf(fminf(a1, 1.0), 0.0);
}

float ARUIMix(float a1, float a2, float a3)
{
  return a1 + (float)(a3 * (float)(a2 - a1));
}

BOOL ARUIFloatLess(float a1, float a2)
{
  return (float)(a1 - a2) < 0.0001;
}

void sub_212DEDDA4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_212DEDECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212DEDFF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212DEE23C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_212DEE3A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

BOOL ARUIFloat2Equal(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2;

  v2 = vsub_f32(a1, a2);
  return fabsf(v2.f32[0]) < 0.0001 && fabsf(v2.f32[1]) < 0.0001;
}

void sub_212DEE530(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_212DEE694(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_212DEE7F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_212DEE94C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_212DEF648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_212DF01DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212DF0428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212DF05A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double matrix_float4x4_zRotation_and_translation(float a1, double a2)
{
  float32x4_t v2;
  int32x2_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  _OWORD v18[4];
  _OWORD v19[4];

  *(double *)v2.i64 = a2;
  v4 = vcgt_f32((float32x2_t)vdup_n_s32(0x38D1B717u), vabs_f32(*(float32x2_t *)v2.f32));
  if ((vand_s8((int8x8_t)v4, (int8x8_t)vdup_lane_s32(v4, 1)).u8[0] & 1) != 0)
  {
    v5 = *MEMORY[0x24BDAEE00];
    v6 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
    v7 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
    v2 = *(float32x4_t *)(MEMORY[0x24BDAEE00] + 48);
  }
  else
  {
    v2.i32[2] = 0;
    v2.i32[3] = 1.0;
    v7 = xmmword_212E0A8B0;
    v5 = xmmword_212E0A8C0;
    v6 = xmmword_212E0A8A0;
  }
  if (fabsf(a1) >= 0.0001)
  {
    v16 = (float32x4_t)v5;
    v17 = v2;
    v14 = (float32x4_t)v6;
    v15 = (float32x4_t)v7;
    *(double *)&v8 = matrix_float4x4_rotation((float32x4_t)xmmword_212E0A8B0, a1);
    v9 = 0;
    v18[0] = v8;
    v18[1] = v10;
    v18[2] = v11;
    v18[3] = v12;
    memset(v19, 0, sizeof(v19));
    do
    {
      v19[v9] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, COERCE_FLOAT(v18[v9])), v14, *(float32x2_t *)&v18[v9], 1), v15, (float32x4_t)v18[v9], 2), v17, (float32x4_t)v18[v9], 3);
      ++v9;
    }
    while (v9 != 4);
    *(_QWORD *)&v5 = *(_QWORD *)&v19[0];
  }
  return *(double *)&v5;
}

id arui_rings_log()
{
  if (arui_rings_log_onceToken != -1)
    dispatch_once(&arui_rings_log_onceToken, &__block_literal_global_5);
  return (id)arui_rings_log___logger;
}

id ActivityRingsUIFrameworkBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)ActivityRingsUIFrameworkBundle___ARUIClassBundle;
  if (!ActivityRingsUIFrameworkBundle___ARUIClassBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)ActivityRingsUIFrameworkBundle___ARUIClassBundle;
    ActivityRingsUIFrameworkBundle___ARUIClassBundle = v1;

    v0 = (void *)ActivityRingsUIFrameworkBundle___ARUIClassBundle;
  }
  return v0;
}

void __arui_rings_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ActivityRingsUI", "rings");
  v1 = (void *)arui_rings_log___logger;
  arui_rings_log___logger = (uint64_t)v0;

}

void freeData(int a1, void *a2)
{
  free(a2);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

const __CFString *NSStringFromARUICelebrationType()
{
  return CFSTR("sparks");
}

void sub_212DF4894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212DF4C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_212DF4D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212DF6BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212DF6E94(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_212DF6FDC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  _Unwind_Resume(a1);
}

void sub_212DF71C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_212DF7398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  uint64_t v0;

  return v0;
}

double blend(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double clamp(double result, double a2, double a3)
{
  if (a3 >= result)
    result = a3;
  if (result > a2)
    return a2;
  return result;
}

BOOL ARUIFloatGreaterEqual(float a1, float a2)
{
  return (float)(a1 - a2) > -0.0001;
}

BOOL ARUIFloat2Greater(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2;

  v2 = vsub_f32(a1, a2);
  return v2.f32[0] > 0.0001 && v2.f32[1] > 0.0001;
}

BOOL ARUIFloat2GreaterEqual(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2;

  v2 = vsub_f32(a1, a2);
  return v2.f32[0] > -0.0001 && v2.f32[1] > -0.0001;
}

BOOL ARUIFloat2Less(float32x2_t a1, float32x2_t a2)
{
  float32x2_t v2;

  v2 = vsub_f32(a1, a2);
  return v2.f32[0] < 0.0001 && v2.f32[1] < 0.0001;
}

float32x2_t ARUIFloat2Saturate(float32x2_t a1)
{
  __asm { FMOV            V1.2S, #1.0 }
  return vmaxnm_f32(vminnm_f32(a1, _D1), 0);
}

BOOL ARUICGFloatEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 0.001;
}

BOOL ARUICGFloatGreater(double a1, double a2)
{
  return a1 - a2 > 0.001;
}

BOOL ARUICGFloatLess(double a1, double a2)
{
  return a1 - a2 < 0.001;
}

float ARUIClip(float a1, float a2, float a3)
{
  return fmaxf(a2, fminf(a1, a3));
}

float ARUIMixVector(double a1, float a2)
{
  return vmlas_n_f32(*(float *)&a1, a2, vsub_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&a1, 1), *(float32x2_t *)&a1).f32[0]);
}

float ARUIPercent(float a1, float a2, float a3)
{
  float result;

  result = 1.0;
  if (vabds_f32(a2, a3) >= 0.0001)
    return (float)(a1 - a2) / (float)(a3 - a2);
  return result;
}

float ARUIRandomFloat(float a1, float a2)
{
  return a1 + (float)((float)((float)(arc4random() & 0x7FFFFFFF) * 4.6566e-10) * (float)(a2 - a1));
}

double ARUIRandomCGFloat(double a1, double a2)
{
  return a1 + (double)(arc4random() & 0x7FFFFFFF) / 2147483650.0 * (a2 - a1);
}

float32x2_t ARUIRandomFloat2(double a1, float a2)
{
  uint32_t v2;
  uint32_t v3;
  uint32x2_t v4;
  float v7;

  v7 = a2 - *(float *)&a1;
  v2 = arc4random();
  v3 = arc4random();
  v4.i32[0] = v2 & 0x7FFFFFFF;
  v4.i32[1] = v3 & 0x7FFFFFFF;
  return vmla_n_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)&a1, 0), vmul_f32(vcvt_f32_u32(v4), (float32x2_t)0x3000000030000000), v7);
}

uint64_t ARUIRandomInt(int a1, int a2)
{
  return arc4random() % (a2 - a1 + 1) + a1;
}

double ARUIDistance(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

uint64_t ARUIRandomNSUInt(uint64_t a1, uint64_t a2)
{
  return arc4random() % (unint64_t)(a2 - a1) + a1;
}

double ARUIScreenBlend(float32x4_t a1, float32x4_t a2)
{
  double result;

  __asm { FMOV            V2.4S, #1.0 }
  *(_QWORD *)&result = vmlsq_f32(_Q2, vsubq_f32(_Q2, a2), vsubq_f32(_Q2, a1)).u64[0];
  return result;
}

double matrix_float4x4_scale_y()
{
  return *(double *)&_PromotedConst;
}

double matrix_float4x4_rotation(float32x4_t a1, float a2)
{
  __float2 v2;
  float v10;

  v2 = __sincosf_stret(a2);
  _D4 = *(float32x2_t *)a1.f32;
  __asm { FMLS            S2, S4, V4.S[0] }
  _S5 = a1.u32[1];
  v10 = vmuls_lane_f32(_D4.f32[0], _D4, 1);
  _S16 = a1.u32[2];
  _Q21 = a1;
  _D4.i32[0] = vmlas_n_f32(v2.__cosval * _S2, _D4.f32[0], _D4.f32[0]);
  _D4.f32[1] = -(float)(vmuls_lane_f32(v2.__sinval, a1, 2) - (float)(v10 * (float)(1.0 - v2.__cosval)));
  __asm
  {
    FMLS            S6, S5, V21.S[1]
    FMLA            S6, S5, V21.S[1]
    FMLS            S3, S16, V21.S[2]
    FMLA            S1, S16, V21.S[2]
  }
  return *(double *)&_D4;
}

double matrix_float2x2_rotation(float a1)
{
  __float2 v1;

  v1 = __sincosf_stret(a1);
  return COERCE_DOUBLE(__PAIR64__(LODWORD(v1.__sinval), LODWORD(v1.__cosval)));
}

uint64_t sub_212E014C8()
{
  return 0;
}

id SparksCelebration.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SparksCelebration.init()()
{
  char *v0;
  char *v1;
  objc_super v3;

  *(_QWORD *)&v0[OBJC_IVAR____TtC15ActivityRingsUI17SparksCelebration_duration] = 0x4014000000000000;
  type metadata accessor for Sparks();
  v1 = v0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15ActivityRingsUI17SparksCelebration_scene] = sub_212E03950();

  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for SparksCelebration();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for SparksCelebration()
{
  return objc_opt_self();
}

uint64_t sub_212E01658(void *a1, id a2)
{
  uint64_t v2;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  float32x2_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  uint64_t v21;
  id v22;
  id v23;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;

  v5 = *(void **)(v2 + OBJC_IVAR____TtC15ActivityRingsUI17SparksCelebration_scene);
  objc_msgSend(a2, sel_screenScale);
  v29 = v6;
  objc_msgSend(a1, sel_translation);
  v28 = v7;
  objc_msgSend(a2, sel_drawableSize);
  v27 = v8;
  objc_msgSend(a2, sel_screenScale);
  v25 = v9;
  objc_msgSend(a1, sel_translation);
  v26 = v10;
  objc_msgSend(a2, sel_drawableSize);
  v12 = vdiv_f32(vmul_f32(vmul_f32((float32x2_t)__PAIR64__(v25, v29), (float32x2_t)0xC000000040000000), (float32x2_t)__PAIR64__(v26, v28)), (float32x2_t)__PAIR64__(v11, v27));
  objc_msgSend(a1, sel_scale);
  v14 = v13;
  objc_msgSend(a2, sel_screenScale);
  v16 = v14 * v15;
  objc_msgSend(a1, sel_diameter);
  v18 = v16 * v17;
  objc_msgSend(a2, sel_drawableSize);
  v20 = 1.25 / (float)(v18 / v19);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v5;
  *(float *)(v21 + 24) = v20;
  *(float32x2_t *)(v21 + 32) = v12;
  *(_QWORD *)(v21 + 40) = a1;
  v22 = v5;
  v23 = a1;
  sub_212E0711C();
  return swift_release();
}

uint64_t sub_212E017D8(double a1, double a2)
{
  float32x4_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  uint64_t v21;
  simd_float4x4 v22;
  simd_float4x4 v23;
  simd_float4x4 v24;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B683F0);
  sub_212E070E0();
  sub_212E0714C();
  if (!v17.i64[1])
  {
    sub_212E02098((uint64_t)&v16);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B68400);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_212E0AC10;
    *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
    v8 = 0xD000000000000029;
    v9 = 0x8000000212E0BD00;
    goto LABEL_11;
  }
  sub_212E07128();
  if (v21)
  {
    type metadata accessor for simd_float4x4();
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_212E07128();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v22.columns[0] = (simd_float4)v16;
        v22.columns[1] = (simd_float4)v17;
        v22.columns[2] = (simd_float4)v18;
        v22.columns[3] = (simd_float4)v19;
        v23 = __invert_f4(v22);
        v11 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, v23.columns[0].f32[0]), v17, *(float32x2_t *)v23.columns[0].f32, 1), v18, (float32x4_t)v23.columns[0], 2), v19, (float32x4_t)v23.columns[0], 3);
        v23.columns[1] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, v23.columns[1].f32[0]), v17, *(float32x2_t *)v23.columns[1].f32, 1), v18, (float32x4_t)v23.columns[1], 2), v19, (float32x4_t)v23.columns[1], 3);
        v12 = (float32x4_t)v23.columns[1];
        v23.columns[2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, v23.columns[2].f32[0]), v17, *(float32x2_t *)v23.columns[2].f32, 1), v18, (float32x4_t)v23.columns[2], 2), v19, (float32x4_t)v23.columns[2], 3);
        v13 = (float32x4_t)v23.columns[2];
        v14 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, v23.columns[3].f32[0]), v17, *(float32x2_t *)v23.columns[3].f32, 1), v18, (float32x4_t)v23.columns[3], 2), v19, (float32x4_t)v23.columns[3], 3);
        v23.columns[0] = (simd_float4)v11;
        v23.columns[3] = (simd_float4)v14;
        v24 = __invert_f4(v23);
        v2 = vaddq_f32(v14, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, v20.f32[0]), v12, *(float32x2_t *)v20.f32, 1), v13, v20, 2));
        v24.columns[0] = (simd_float4)vaddq_f32((float32x4_t)v24.columns[3], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v24.columns[0], *(float *)&a2), (float32x4_t)v24.columns[1], *(float32x2_t *)&a2, 1), (float32x4_t)v24.columns[2], vdivq_f32(v2, (float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 3)), 2));
        v24.columns[2] = (simd_float4)vdupq_laneq_s32((int32x4_t)v24.columns[0], 3);
        *(float32x2_t *)v24.columns[3].f32 = vdiv_f32(*(float32x2_t *)v24.columns[0].f32, *(float32x2_t *)v24.columns[2].f32);
        v24.columns[3].i64[1] = __PAIR64__(vextq_s8(*(int8x16_t *)&v24, *(int8x16_t *)&v24, 8uLL).u32[1], vdivq_f32(*(float32x4_t *)&v24, *(float32x4_t *)(&v24 + 32)).u32[2]);
        v16 = (float32x4_t)v24.columns[3];
        MEMORY[0x24BDAC7A8](v3);
        sub_212E070E0();
        v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B68408);
        MEMORY[0x24BDAC7A8](v4);
        v5 = sub_212E070E0();
        MEMORY[0x24BDAC7A8](v5);
        sub_212E070E0();
        sub_212E070E0();
        sub_212E070E0();
        sub_212E070E0();
        sub_212E070E0();
        return sub_212E070E0();
      }
    }
  }
  else
  {
    sub_212E02098((uint64_t)&v20);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B68400);
  v7 = swift_allocObject();
  v10 = MEMORY[0x24BEE0D00];
  *(_OWORD *)(v7 + 16) = xmmword_212E0AC10;
  *(_QWORD *)(v7 + 56) = v10;
  v8 = 0x72656D6163206F4ELL;
  v9 = 0xE900000000000061;
LABEL_11:
  *(_QWORD *)(v7 + 32) = v8;
  *(_QWORD *)(v7 + 40) = v9;
  sub_212E071DC();
  return swift_bridgeObjectRelease();
}

_BYTE *sub_212E01EC8(_BYTE *result)
{
  *result = 0;
  return result;
}

_BYTE *sub_212E01ED0(_BYTE *result)
{
  *result = 1;
  return result;
}

_DWORD *sub_212E01EDC(_DWORD *result)
{
  *result = 1069547520;
  return result;
}

_DWORD *sub_212E01EE8(_DWORD *result)
{
  *result = 1067450368;
  return result;
}

_DWORD *sub_212E01EF4(_DWORD *result)
{
  *result = 1008981770;
  return result;
}

id SparksCelebration.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SparksCelebration();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SparksCelebration()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_212E02004()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_212E02030(double a1)
{
  uint64_t v1;

  LODWORD(a1) = *(_DWORD *)(v1 + 24);
  return sub_212E017D8(a1, *(double *)(v1 + 32));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199A655C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

__n128 sub_212E02084(_OWORD *a1)
{
  uint64_t v1;
  __int128 v2;
  __n128 result;

  *(_QWORD *)&v2 = 0;
  *((_QWORD *)&v2 + 1) = *(unsigned int *)(v1 + 16);
  *a1 = v2;
  result.n128_u64[0] = v2;
  result.n128_u32[2] = DWORD2(v2);
  return result;
}

uint64_t sub_212E02098(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B683F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for simd_float4x4()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_254B68410)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_254B68410);
  }
}

float sub_212E0212C(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;

  v2 = *(_OWORD *)*(_QWORD *)(v1 + 16);
  *((_QWORD *)&v2 + 1) = *(unsigned int *)(a1 + 8);
  *(_OWORD *)a1 = v2;
  return *(float *)&v2;
}

id sub_212E02148(_OWORD *a1)
{
  return sub_212E02180(a1, (SEL *)&selRef_topColorVector);
}

id sub_212E02164(_OWORD *a1)
{
  return sub_212E02180(a1, (SEL *)&selRef_bottomColorVector);
}

id sub_212E02180(_OWORD *a1, SEL *a2)
{
  uint64_t v2;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  id result;
  __int128 v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;

  v5 = *(void **)(v2 + 16);
  objc_msgSend(v5, *a2);
  v14 = v6;
  objc_msgSend(v5, *a2);
  v13 = v7;
  objc_msgSend(v5, *a2);
  v12 = v8;
  result = objc_msgSend(v5, *a2);
  *(_QWORD *)&v10 = __PAIR64__(v13, v14);
  *((_QWORD *)&v10 + 1) = __PAIR64__(v11, v12);
  *a1 = v10;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SpringAnimation.SpringAnimationState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy64_16(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_212E02258(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_212E02278(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 64) = v3;
  return result;
}

double sub_212E022C4()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState);
}

uint64_t sub_212E02350()
{
  uint64_t v0;
  uint64_t result;

  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 40) & 1) == 0)
  {
    result = sub_212E071A0();
    __break(1u);
  }
  return result;
}

id SpringAnimation.__allocating_init(initialValue:delay:)(double a1, double a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  objc_super v8;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = &v5[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState];
  *(double *)v6 = a1;
  *(_OWORD *)(v6 + 8) = 0u;
  *(_OWORD *)(v6 + 24) = 0u;
  v6[40] = 0;
  *(double *)&v5[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_delay] = a2;
  *(double *)&v5[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_remainingDelay] = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

id SpringAnimation.init(initialValue:delay:)(double a1, double a2)
{
  char *v2;
  char *v3;
  objc_super v5;

  v3 = &v2[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState];
  *(double *)v3 = a1;
  *(_OWORD *)(v3 + 8) = 0u;
  *(_OWORD *)(v3 + 24) = 0u;
  v3[40] = 0;
  *(double *)&v2[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_delay] = a2;
  *(double *)&v2[OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_remainingDelay] = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for SpringAnimation();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for SpringAnimation()
{
  return objc_opt_self();
}

void sub_212E02544(double a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;

  v4 = v3 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState;
  *(double *)(v4 + 16) = a1;
  *(double *)(v4 + 24) = a2;
  *(double *)(v4 + 32) = a3;
  *(_BYTE *)(v4 + 40) = 1;
}

uint64_t sub_212E02584(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 40) & 1) != 0)
  {
    *(double *)(v2 + 32) = a1;
    *(_BYTE *)(v2 + 40) = 1;
  }
  else
  {
    result = sub_212E071A0();
    __break(1u);
  }
  return result;
}

uint64_t sub_212E0268C(double a1)
{
  uint64_t v1;
  uint64_t v2;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t result;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __double2 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  long double v24;
  double v25;
  long double v26;
  long double v27;
  double v28;
  long double v29;
  double v30;
  double v31;
  double v32;

  v2 = v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 40) & 1) == 0)
  {
    result = sub_212E071A0();
    __break(1u);
    return result;
  }
  v4 = *(double *)(v2 + 32);
  v5 = *(double *)(v2 + 24);
  v6 = *(double *)v2;
  v7 = *(double *)(v2 + 8);
  if (*(double *)(v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_delay) <= 0.001
    || (v8 = *(double *)(v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_remainingDelay), v8 <= 0.001))
  {
    if (vabdd_f64(v6, v4) < 0.001 && fabs(v7) < 0.001)
      return 0;
    v11 = v6 - v4;
    v12 = sqrt(*(double *)(v2 + 16));
    v13 = v5 * 0.5;
    if (v12 - v5 * 0.5 <= 0.001)
    {
      if (v13 - v12 <= 0.001)
      {
        v29 = exp(-(v13 * a1));
        v30 = v7 + v13 * v11;
        v31 = v11 + v30 * a1;
        v19 = v29 * v31;
        v28 = v29 * v30 - v29 * v13 * v31;
        goto LABEL_18;
      }
      v22 = sqrt(v13 * v13 - v12 * v12);
      v23 = exp(-(v13 * a1));
      v24 = v22 * a1;
      v32 = cosh(v24);
      v25 = (v7 + v13 * v11) / v22;
      v26 = sinh(v24);
      v27 = v11 * v32 + v25 * v26;
      v19 = v23 * v27;
      v20 = v23 * (v22 * (v25 * v32) + v22 * (v11 * v26));
      v21 = v23 * v13 * v27;
    }
    else
    {
      v14 = sqrt(v12 * v12 - v13 * v13);
      v15 = exp(-(v13 * a1));
      v16 = __sincos_stret(v14 * a1);
      v17 = (v7 + v13 * v11) / v14;
      v18 = v11 * v16.__cosval + v17 * v16.__sinval;
      v19 = v15 * v18;
      v20 = v15 * (v14 * (v17 * v16.__cosval) - v14 * (v11 * v16.__sinval));
      v21 = v15 * v13 * v18;
    }
    v28 = v20 - v21;
LABEL_18:
    if (vabdd_f64(v19 + v4, v4) >= 0.001)
      *(double *)v2 = v19 + v4;
    else
      *(double *)v2 = v4;
    *(double *)(v2 + 8) = v28;
    result = 1;
    *(_BYTE *)(v2 + 40) = 1;
    return result;
  }
  v9 = v8 - a1;
  if (v8 - a1 > 1.0)
    v9 = 1.0;
  if (v9 < 0.0)
    v9 = 0.0;
  *(double *)(v1 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_remainingDelay) = v9;
  return 1;
}

void sub_212E02960()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState;
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC15ActivityRingsUI15SpringAnimation_animationState + 40) == 1)
  {
    *(_QWORD *)v1 = *(_QWORD *)(v1 + 32);
    *(_QWORD *)(v1 + 8) = 0;
    *(_BYTE *)(v1 + 40) = 1;
  }
}

id SpringAnimation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SpringAnimation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SpringAnimation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpringAnimation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SpringAnimation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SpringAnimation.value.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SpringAnimation.target.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SpringAnimation.__allocating_init(initialValue:delay:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of SpringAnimation.configure(tension:friction:target:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SpringAnimation.updateTarget(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SpringAnimation.advanceWith(deltaTime:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SpringAnimation.completeWithSnap()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SpringAnimation.SpringAnimationState(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SpringAnimation.SpringAnimationState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_212E02BC8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_212E02BD4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SpringAnimation.SpringAnimationState()
{
  return &type metadata for SpringAnimation.SpringAnimationState;
}

uint64_t sub_212E02BF0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_212E02BF8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_212E02C68(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  void (*v15)(uint64_t *, uint64_t *, uint64_t);
  unint64_t v16;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_DWORD *)(v6 + 80);
  v9 = ~v8;
  v10 = v7 + v8;
  v11 = ((v7 + v8 + ((v7 + v8) & ~v8)) & ~v8) + v7;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v15(a1, a2, *(_QWORD *)(a3 + 16));
    v16 = ((unint64_t)a2 + v10) & v9;
    v15((uint64_t *)(((unint64_t)v4 + v10) & v9), (uint64_t *)v16, v5);
    v15((uint64_t *)((v10 + (((unint64_t)v4 + v10) & v9)) & v9), (uint64_t *)((v10 + v16) & v9), v5);
  }
  return v4;
}

uint64_t sub_212E02D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v10)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v10 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v10(a1, v3);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = v5 + v6;
  v8 = (v5 + v6 + a1) & ~v6;
  v10(v8, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v10)((v7 + v8) & ~v6, v3);
}

uint64_t sub_212E02DCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a2) & ~v8;
  v7((v9 + a1) & ~v8, v10, v5);
  v7((v9 + ((v9 + a1) & ~v8)) & ~v8, (v9 + v10) & ~v8, v5);
  return a1;
}

uint64_t sub_212E02E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a2) & ~v8;
  v7((v9 + a1) & ~v8, v10, v5);
  v7((v9 + ((v9 + a1) & ~v8)) & ~v8, (v9 + v10) & ~v8, v5);
  return a1;
}

uint64_t sub_212E02EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a2) & ~v8;
  v7((v9 + a1) & ~v8, v10, v5);
  v7((v9 + ((v9 + a1) & ~v8)) & ~v8, (v9 + v10) & ~v8, v5);
  return a1;
}

uint64_t sub_212E02F88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a2) & ~v8;
  v7((v9 + a1) & ~v8, v10, v5);
  v7((v9 + ((v9 + a1) & ~v8)) & ~v8, (v9 + v10) & ~v8, v5);
  return a1;
}

uint64_t sub_212E0301C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = ((*(_QWORD *)(v4 + 64)
       + *(unsigned __int8 *)(v4 + 80)
       + ((*(_QWORD *)(v4 + 64) + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
     + *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_212E030E4 + 4 * byte_212E0AC80[(v7 - 1)]))();
}

void sub_212E03134(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v6 + 64)
       + *(unsigned __int8 *)(v6 + 80)
       + ((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, ((*(_QWORD *)(v6 + 64)+ *(unsigned __int8 *)(v6 + 80)+ ((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for SpringConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SpringConfiguration);
}

uint64_t sub_212E03308()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_212E03310()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_212E0337C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  void (*v15)(uint64_t *, uint64_t *, uint64_t);

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_DWORD *)(v6 + 80);
  v9 = ~v8;
  v10 = v7 + v8;
  v11 = ((v7 + v8) & ~v8) + v7;
  if (v8 > 7 || (*(_DWORD *)(v6 + 80) & 0x100000) != 0 || v11 > 0x18)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v8 + 16) & v9));
    swift_retain();
  }
  else
  {
    v15 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16);
    v15(a1, a2, *(_QWORD *)(a3 + 16));
    v15((uint64_t *)(((unint64_t)v4 + v10) & v9), (uint64_t *)(((unint64_t)a2 + v10) & v9), v5);
  }
  return v4;
}

uint64_t sub_212E03430(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v6)(unint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v6 = *(uint64_t (**)(unint64_t, uint64_t))(v4 + 8);
  v6(a1, v3);
  return v6((*(_QWORD *)(v4 + 64) + a1 + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), v3);
}

unint64_t sub_212E03498(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(unint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  v7((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), v5);
  return a1;
}

unint64_t sub_212E03504(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(unint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 24);
  v7(a1, a2, v5);
  v7((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), v5);
  return a1;
}

unint64_t sub_212E03570(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(unint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  v7((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), v5);
  return a1;
}

unint64_t sub_212E035DC(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(unint64_t, unint64_t, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(unint64_t, unint64_t, uint64_t))(v6 + 40);
  v7(a1, a2, v5);
  v7((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), (*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), v5);
  return a1;
}

uint64_t sub_212E03648(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = ((*(_QWORD *)(v4 + 64) + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
     + *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_212E03708 + 4 * byte_212E0AC8E[(v7 - 1)]))();
}

void sub_212E03758(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = ((*(_QWORD *)(v6 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t type metadata accessor for SpringAnimation.SpringState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SpringAnimation.SpringState);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199A652C](a1, v6, a5);
}

_QWORD *sub_212E03950()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B685E0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v2 = (char *)&v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_212E07038();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - v8;
  sub_212E04780((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_212E06738((uint64_t)v2);
    v10 = (_QWORD *)sub_212E070C8();
    sub_212E06778();
    swift_allocError();
    *v11 = 0x762E736B72617053;
    v11[1] = 0xEA00000000007866;
    (*(void (**)(_QWORD *, _QWORD, _QWORD *))(*(v10 - 1) + 104))(v11, *MEMORY[0x24BEBFA78], v10);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    v10 = objc_allocWithZone((Class)sub_212E07158());
    v12 = sub_212E070D4();
    if (!v0)
      v10 = (_QWORD *)v12;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  return v10;
}

uint64_t sub_212E03B28()
{
  uint64_t v0;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B685D0);
  sub_212E07110();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_212E0AD40;
  sub_212E070EC();
  sub_212E070EC();
  sub_212E070EC();
  sub_212E070EC();
  sub_212E070EC();
  sub_212E070EC();
  sub_212E070EC();
  sub_212E070EC();
  sub_212E070EC();
  sub_212E070EC();
  sub_212E070EC();
  sub_212E070EC();
  result = sub_212E070EC();
  off_254B68558 = (_UNKNOWN *)v0;
  return result;
}

_QWORD *__vfx_script_Sparks_graph_42(uint64_t a1)
{
  return sub_212E03F64(a1, (uint64_t (*)(uint64_t, __n128))sub_212E05BB0);
}

_QWORD *sub_212E03DF8(uint64_t a1)
{
  return sub_212E03F64(a1, (uint64_t (*)(uint64_t, __n128))sub_212E05BB0);
}

_QWORD *__vfx_script_Sparks_graph_14(uint64_t a1)
{
  return sub_212E04264(a1, (uint64_t (*)(uint64_t, float))sub_212E04C2C);
}

_QWORD *sub_212E03E20(uint64_t a1)
{
  return sub_212E04264(a1, (uint64_t (*)(uint64_t, float))sub_212E04C2C);
}

_QWORD *sub_212E03E30(uint64_t a1)
{
  double v1;
  int v2;
  _QWORD *result;
  float *v4;
  float *v5;
  float *v6;
  float *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;

  qword_254B68560 = a1;
  sub_212E07050();
  *(float *)&v1 = v1;
  dword_254B68568 = LODWORD(v1);
  sub_212E0708C();
  dword_254B6856C = v2;
  result = (_QWORD *)sub_212E070BC();
  v4 = (float *)result[1];
  if (!v4)
  {
    __break(1u);
    goto LABEL_7;
  }
  v5 = (float *)result[2];
  if (!v5)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v6 = (float *)result[3];
  if (!v6)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v7 = (float *)result[4];
  if (v7)
  {
    v8 = *v4 * *v5;
    v9 = (float)(v8 * 0.02) / 5.0;
    v10 = (float)(v8 * 0.03) / 5.0;
    v11 = (float)(v8 * 0.1) / 5.0;
    v12 = (float)(v8 * 0.2) / 5.0;
    *v6 = fminf(v9, v10);
    v6[1] = fmaxf(v9, v10);
    *v7 = fminf(v11, v12);
    v7[1] = fmaxf(v11, v12);
    return result;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t __vfx_script_Sparks_graph_1(uint64_t a1)
{
  return sub_212E043A4(a1);
}

_QWORD *__vfx_script_Sparks_graph_2(uint64_t a1)
{
  return sub_212E03F64(a1, (uint64_t (*)(uint64_t, __n128))sub_212E05DCC);
}

_QWORD *sub_212E03F58(uint64_t a1)
{
  return sub_212E03F64(a1, (uint64_t (*)(uint64_t, __n128))sub_212E05DCC);
}

_QWORD *sub_212E03F64(uint64_t a1, uint64_t (*a2)(uint64_t, __n128))
{
  double v3;
  int v4;
  _QWORD *result;
  __n128 *v6;

  qword_254B68560 = a1;
  sub_212E07050();
  *(float *)&v3 = v3;
  dword_254B68568 = LODWORD(v3);
  sub_212E0708C();
  dword_254B6856C = v4;
  result = (_QWORD *)sub_212E070BC();
  if (!result[1])
  {
    __break(1u);
    goto LABEL_7;
  }
  v6 = (__n128 *)result[2];
  if (!v6)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (!result[3])
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (result[4])
    return (_QWORD *)a2(a1, *v6);
LABEL_9:
  __break(1u);
  return result;
}

_QWORD *sub_212E03FFC(uint64_t a1)
{
  double v2;
  int v3;
  _QWORD *result;
  float *v5;
  float *v6;
  uint64_t *v7;

  qword_254B68560 = a1;
  sub_212E07050();
  *(float *)&v2 = v2;
  dword_254B68568 = LODWORD(v2);
  sub_212E0708C();
  dword_254B6856C = v3;
  result = (_QWORD *)sub_212E070BC();
  v5 = (float *)result[1];
  if (!v5)
  {
    __break(1u);
    goto LABEL_6;
  }
  v6 = (float *)result[2];
  if (!v6)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v7 = (uint64_t *)result[3];
  if (v7)
    return (_QWORD *)sub_212E04D08(*v5, *v6, a1, v7);
LABEL_7:
  __break(1u);
  return result;
}

_QWORD *sub_212E0407C(uint64_t a1)
{
  double v1;
  int v2;
  _QWORD *result;
  float *v4;
  int *v5;
  uint64_t v6;
  _OWORD *v7;
  float *v8;
  float *v9;
  _DWORD *v10;
  int v11;
  float v12;
  float v13;
  float v14;
  float v15;

  qword_254B68560 = a1;
  sub_212E07050();
  *(float *)&v1 = v1;
  dword_254B68568 = LODWORD(v1);
  sub_212E0708C();
  dword_254B6856C = v2;
  result = (_QWORD *)sub_212E070BC();
  v4 = (float *)result[1];
  if (!v4)
  {
    __break(1u);
    goto LABEL_12;
  }
  v5 = (int *)result[2];
  if (!v5)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!result[3])
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v6 = result[4];
  if (!v6)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v7 = (_OWORD *)result[5];
  if (!v7)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v8 = (float *)result[6];
  if (!v8)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v9 = (float *)result[7];
  if (!v9)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v10 = (_DWORD *)result[8];
  if (!v10)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  result = (_QWORD *)result[9];
  if (result)
  {
    v11 = *v5;
    v12 = (float)(*v4 * 0.02) / 5.0;
    v13 = (float)(*v4 * 0.03) / 5.0;
    v14 = (float)(*v4 * 0.25) / 5.0;
    v15 = (float)(*v4 * 0.4) / 5.0;
    *(_OWORD *)v6 = xmmword_212E0AD50;
    *v7 = xmmword_212E0AD50;
    *v8 = fminf(v12, v13);
    v8[1] = fmaxf(v12, v13);
    *v9 = fminf(v14, v15);
    v9[1] = fmaxf(v14, v15);
    *v10 = v11;
    result = (_QWORD *)sub_212E07080();
    *(_DWORD *)(v6 + 12) = 1065353216;
    return result;
  }
LABEL_19:
  __break(1u);
  return result;
}

_QWORD *sub_212E041C4(uint64_t a1)
{
  double v1;
  int v2;
  _QWORD *result;

  qword_254B68560 = a1;
  sub_212E07050();
  *(float *)&v1 = v1;
  dword_254B68568 = LODWORD(v1);
  sub_212E0708C();
  dword_254B6856C = v2;
  result = (_QWORD *)sub_212E070BC();
  if (!result[1])
  {
    __break(1u);
    goto LABEL_6;
  }
  if (!result[2])
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result[3])
    return (_QWORD *)sub_212E06090();
LABEL_7:
  __break(1u);
  return result;
}

_QWORD *__vfx_script_Sparks_graph_17(uint64_t a1)
{
  return sub_212E04264(a1, (uint64_t (*)(uint64_t, float))sub_212E04E78);
}

_QWORD *sub_212E04258(uint64_t a1)
{
  return sub_212E04264(a1, (uint64_t (*)(uint64_t, float))sub_212E04E78);
}

_QWORD *sub_212E04264(uint64_t a1, uint64_t (*a2)(uint64_t, float))
{
  double v3;
  int v4;
  _QWORD *result;
  float *v6;

  qword_254B68560 = a1;
  sub_212E07050();
  *(float *)&v3 = v3;
  dword_254B68568 = LODWORD(v3);
  sub_212E0708C();
  dword_254B6856C = v4;
  result = (_QWORD *)sub_212E070BC();
  v6 = (float *)result[1];
  if (!v6)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (!result[2])
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result[3])
    return (_QWORD *)a2(a1, *v6);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_212E042F0(uint64_t a1)
{
  double v1;
  int v2;
  uint64_t result;
  float *v4;
  float *v5;
  float v6;
  float v7;

  qword_254B68560 = a1;
  sub_212E07050();
  *(float *)&v1 = v1;
  dword_254B68568 = LODWORD(v1);
  sub_212E0708C();
  dword_254B6856C = v2;
  result = sub_212E070BC();
  v4 = *(float **)(result + 8);
  if (v4)
  {
    v5 = *(float **)(result + 16);
    if (v5)
    {
      v6 = (float)(*v4 * 0.01) / 3.0;
      v7 = (float)(*v4 * 0.02) / 3.0;
      *v5 = fminf(v6, v7);
      v5[1] = fmaxf(v6, v7);
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t __vfx_script_Sparks_graph_49(uint64_t a1)
{
  return sub_212E043A4(a1);
}

uint64_t sub_212E043A4(uint64_t a1)
{
  double v1;
  int v2;
  uint64_t result;

  qword_254B68560 = a1;
  sub_212E07050();
  *(float *)&v1 = v1;
  dword_254B68568 = LODWORD(v1);
  sub_212E0708C();
  dword_254B6856C = v2;
  result = sub_212E070BC();
  if (*(_QWORD *)(result + 8))
  {
    result = *(_QWORD *)(result + 16);
    if (result)
      return sub_212E07080();
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_212E0440C(uint64_t a1)
{
  double v2;
  int v3;
  _QWORD *v4;
  __n128 *v5;
  char *v6;
  char *v7;
  __n128 *v8;
  __n128 *v9;
  _DWORD *v10;
  float *v11;
  float *v12;
  float *v13;

  qword_254B68560 = a1;
  sub_212E07050();
  *(float *)&v2 = v2;
  dword_254B68568 = LODWORD(v2);
  sub_212E0708C();
  dword_254B6856C = v3;
  v4 = (_QWORD *)sub_212E070BC();
  v5 = (__n128 *)v4[1];
  if (!v5)
  {
    __break(1u);
    goto LABEL_14;
  }
  v6 = (char *)v4[2];
  if (!v6)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (!v4[3])
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = (char *)v4[4];
  if (!v7)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v8 = (__n128 *)v4[5];
  if (!v8)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v9 = (__n128 *)v4[6];
  if (!v9)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v10 = (_DWORD *)v4[7];
  if (!v10)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v11 = (float *)v4[8];
  if (!v11)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v12 = (float *)v4[9];
  if (!v12)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (!v4[10])
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v13 = (float *)v4[11];
  if (v13)
  {
    sub_212E04F64(*v5, a1, *v6, *v7, v8, v9, v10, v11, v12, (_DWORD *)v4[10], v13);
    v8->n128_u32[3] = 1065353216;
    return;
  }
LABEL_23:
  __break(1u);
}

void sub_212E04510(uint64_t a1)
{
  double v1;
  int v2;
  _QWORD *v3;

  qword_254B68560 = a1;
  sub_212E07050();
  *(float *)&v1 = v1;
  dword_254B68568 = LODWORD(v1);
  sub_212E0708C();
  dword_254B6856C = v2;
  sub_212E070B0();
  v3 = (_QWORD *)sub_212E070BC();
  if (!v3[1])
  {
    __break(1u);
    goto LABEL_10;
  }
  if (!v3[2])
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (!v3[3])
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (!v3[4])
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (!v3[5])
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!v3[6])
  {
LABEL_14:
    __break(1u);
LABEL_15:
    __break(1u);
  }
  if (!v3[7])
    goto LABEL_15;
}

id sub_212E046D0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B685E0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_212E04780((uint64_t)v2);
  v3 = sub_212E07038();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
  {
    v5 = (void *)sub_212E07020();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
  }
  return v5;
}

uint64_t sub_212E04780@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  type metadata accessor for Sparks();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_212E07170();
  v5 = (void *)sub_212E07170();
  v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  if (v6)
  {
    sub_212E0702C();

    v7 = sub_212E07038();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 0;
  }
  else
  {
    v7 = sub_212E07038();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 1;
  }
  return v8(v9, v10, 1, v7);
}

_QWORD *sub_212E04894()
{
  swift_getObjCClassMetadata();
  return sub_212E03950();
}

uint64_t sub_212E0490C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v14;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B685E0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_212E07038();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_212E04780((uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_212E06738((uint64_t)v4);
    v9 = sub_212E070C8();
    sub_212E06778();
    swift_allocError();
    *v10 = 0x762E736B72617053;
    v10[1] = 0xEA00000000007866;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v10, *MEMORY[0x24BEBFA78], v9);
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    v11 = objc_msgSend(objc_allocWithZone((Class)sub_212E07158()), sel_init);
    v12 = sub_212E07140();
    if (!v0)
      v1 = v12;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  }
  return v1;
}

id sub_212E04AC4()
{
  return (id)sub_212E0490C();
}

id sub_212E04B34()
{
  sub_212E06700(0, &qword_254B685D8);
  return (id)sub_212E07188();
}

id sub_212E04B70()
{
  void *v0;

  sub_212E06394();
  sub_212E06700(0, &qword_254B685C0);
  v0 = (void *)sub_212E07164();
  swift_bridgeObjectRelease();
  return v0;
}

id sub_212E04BD4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Sparks();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t __vfx_get_effect_class_Sparks()
{
  type metadata accessor for Sparks();
  return swift_getObjCClassFromMetadata();
}

uint64_t __vfx_get_effect_class_Sparks()()
{
  return type metadata accessor for Sparks();
}

float sub_212E04C2C(float a1, uint64_t a2, float *a3, float *a4)
{
  double v7;
  float v8;
  float v9;
  float v10;
  float result;

  sub_212E07050();
  *(float *)&v7 = v7;
  v8 = *(float *)&v7 - a1;
  sub_212E0705C();
  sub_212E07074();
  v10 = v9;
  sub_212E07068();
  result = v10 * 2222.0;
  *a3 = v10 * 2222.0;
  *a4 = fminf(fmaxf(1.0 - fminf(fmaxf((float)(v8 + -2.8) / 1.2, 0.0), 1.0), 0.0), 1.0);
  return result;
}

uint64_t sub_212E04D08(float a1, float a2, uint64_t a3, uint64_t *a4)
{
  double v7;
  float v8;
  float v9;
  float v10;
  uint64_t result;
  float v12;
  float v13;
  uint64_t v14;

  sub_212E07050();
  *(float *)&v7 = v7;
  v8 = *(float *)&v7 - a2;
  sub_212E0705C();
  sub_212E07074();
  sub_212E07068();
  sub_212E0708C();
  v10 = v9;
  sub_212E0705C();
  result = sub_212E07074();
  v13 = (float)(a1 * 2000.0)
      * (float)((float)(v10 * v12) * fminf(fmaxf(1.0 - fminf(fmaxf((float)(v8 + -2.8) / 1.7, 0.0), 1.0), 0.0), 1.0));
  if ((~LODWORD(v13) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v13 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v13 < 9.2234e18)
  {
    v14 = (uint64_t)v13;
    result = sub_212E07068();
    *a4 = v14;
    a4[1] = v14;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

float sub_212E04E78(float a1, uint64_t a2, float *a3, float *a4)
{
  double v7;
  float v8;
  float v9;
  float v10;
  float result;

  sub_212E07050();
  *(float *)&v7 = v7;
  v8 = *(float *)&v7 - a1;
  sub_212E0705C();
  sub_212E07074();
  v10 = v9;
  sub_212E07068();
  result = (float)(v10 * 3333.0) + 1111.0;
  *a3 = result;
  *a4 = fminf(fmaxf(1.0 - fminf(fmaxf((float)(v8 + -2.8) / 1.2, 0.0), 1.0), 0.0), 1.0);
  return result;
}

__n128 sub_212E04F64(__n128 a1, uint64_t a2, char a3, char a4, __n128 *a5, __n128 *a6, _DWORD *a7, float *a8, float *a9, _DWORD *a10, float *a11)
{
  float v20;
  float v21;
  __n128 v22;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  __n128 result;
  simd_float4 v38;
  __n128 v39;

  v38 = _simd_cos_f4((simd_float4)0);
  _Q0 = (float32x4_t)_simd_sin_f4((simd_float4)0);
  _Q7 = v38;
  v20 = vmuls_lane_f32(v38.f32[1], (float32x4_t)v38, 2);
  v21 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  v22.n128_f32[0] = vmlas_n_f32(-(float)(v38.f32[0] * v21), v20, _Q0.f32[0]);
  _S3 = vmuls_lane_f32(v38.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S4, S3, V7.S[2] }
  _S3 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S5, S3, V0.S[2] }
  v22.n128_u32[1] = _S4;
  v22.n128_u64[1] = __PAIR64__(COERCE_UNSIGNED_INT(vmlas_n_f32(v21 * _Q0.f32[0], v20, v38.f32[0])), _S5);
  v39 = v22;
  sub_212E07050();
  if ((a3 & 1) != 0)
    v31 = 1.0;
  else
    v31 = 0.0;
  sub_212E0705C();
  sub_212E07074();
  v33 = (float)(fminf(fmaxf(v32, 0.0), 1.0) * -0.2) + 0.3;
  sub_212E07068();
  sub_212E0705C();
  sub_212E07074();
  v35 = v34 * 6.6;
  if ((a4 & 1) != 0)
    v36 = v35;
  else
    v36 = 0.0;
  sub_212E07068();
  *a5 = a1;
  result = v39;
  *a6 = v39;
  *a7 = 1096296694;
  *a8 = v31;
  *a9 = v33;
  *a10 = 1041865114;
  *a11 = v36;
  return result;
}

__n128 sub_212E05154(double a1, float a2, float32x4_t a3, float a4, uint64_t a5, float32x4_t *a6, float32x4_t *a7, __n128 *a8)
{
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  int32x4_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  simd_float4 v23;
  float v26;
  float v27;
  __n128 v28;
  __n128 result;
  simd_float4 x;
  simd_float4 v39;
  __n128 v40;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v46;

  sub_212E07050();
  sub_212E0705C();
  sub_212E07074();
  v13 = v12;
  sub_212E07068();
  sub_212E0705C();
  sub_212E07074();
  v15 = (float)(v13 * powf(a2, v14)) * 6.2832;
  v42 = (float32x4_t)(unint64_t)__sincosf_stret(v15);
  v16 = drand48();
  v46 = vaddq_f32(vmulq_n_f32(v42, (float)(1.0 - (float)(a4 * 0.5))+ (float)((float)((float)((float)(a4 * 0.5) + 1.0) - (float)(1.0 - (float)(a4 * 0.5))) * v16)), a3);
  v17 = (int32x4_t)vmlaq_f32(vmulq_f32(v42, (float32x4_t)xmmword_212E0AD60), (float32x4_t)xmmword_212E0A8B0, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v42, (int32x4_t)v42), (int8x16_t)v42, 0xCuLL));
  v43 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v17, v17), (int8x16_t)v17, 0xCuLL);
  sub_212E0705C();
  sub_212E07074();
  v19 = v18 * 6.0;
  sub_212E0705C();
  sub_212E07074();
  v21 = v20 * 6.0;
  v22 = drand48();
  v44 = vmulq_n_f32(v43, v19 + (float)((float)(v21 - v19) * v22));
  v23.i64[0] = 0;
  v23.i32[3] = 0;
  v23.f32[2] = (float)(1.5708 - v15) * 0.5;
  x = v23;
  v39 = _simd_cos_f4(v23);
  _Q0 = (float32x4_t)_simd_sin_f4(x);
  _Q7 = v39;
  v26 = vmuls_lane_f32(v39.f32[1], (float32x4_t)v39, 2);
  v27 = vmuls_lane_f32(_Q0.f32[1], _Q0, 2);
  v28.n128_f32[0] = vmlas_n_f32(-(float)(v39.f32[0] * v27), v26, _Q0.f32[0]);
  _S3 = vmuls_lane_f32(v39.f32[0], *(float32x2_t *)_Q0.f32, 1);
  __asm { FMLA            S4, S3, V7.S[2] }
  _S3 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
  __asm { FMLA            S5, S3, V0.S[2] }
  v28.n128_u32[1] = _S4;
  v28.n128_u64[1] = __PAIR64__(COERCE_UNSIGNED_INT(vmlas_n_f32(v27 * _Q0.f32[0], v26, v39.f32[0])), _S5);
  v40 = v28;
  sub_212E07068();
  sub_212E07068();
  sub_212E07068();
  *a6 = v46;
  *a7 = v44;
  result = v40;
  *a8 = v40;
  return result;
}

unint64_t sub_212E05414(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_212E071E8();
  sub_212E0717C();
  v4 = sub_212E071F4();
  return sub_212E05938(a1, a2, v4);
}

uint64_t sub_212E05478(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B685C8);
  v38 = a2;
  v6 = sub_212E071B8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_38;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1))
      goto LABEL_40;
    if (v14 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v14);
    if (!v24)
    {
      v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        v3 = v36;
        if ((v38 & 1) == 0)
          goto LABEL_38;
        goto LABEL_34;
      }
      v24 = *(_QWORD *)(v37 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          v14 = v25 + 1;
          if (__OFADD__(v25, 1))
            break;
          if (v14 >= v11)
            goto LABEL_31;
          v24 = *(_QWORD *)(v37 + 8 * v14);
          ++v25;
          if (v24)
            goto LABEL_20;
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    v26 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v30 = v29;
    }
    sub_212E071E8();
    sub_212E0717C();
    result = sub_212E071F4();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v33 = v17 == v32;
        if (v17 == v32)
          v17 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v34 == -1);
      v18 = __clz(__rbit64(~v34)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18) = v29;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_38;
LABEL_34:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_38:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_212E05764(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_212E07194();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_212E071E8();
        swift_bridgeObjectRetain();
        sub_212E0717C();
        v9 = sub_212E071F4();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_212E05938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_212E071C4() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_212E071C4() & 1) == 0);
    }
  }
  return v6;
}

id sub_212E05A18()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B685C8);
  v2 = *v0;
  v3 = sub_212E071AC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    if (!v23)
      break;
LABEL_23:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_212E05BB0(float32x4_t a1, uint64_t a2, uint64_t a3, float *a4)
{
  _OWORD *v5;
  float32x4_t v6;
  float v7;
  BOOL v8;
  _BOOL4 v9;

  sub_212E07098();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B685F0);
  v5 = (_OWORD *)swift_allocObject();
  v5[2] = xmmword_212E0A890;
  v5[3] = xmmword_212E0AD70;
  v5[4] = xmmword_212E0AD80;
  v5[5] = xmmword_212E0A890;
  sub_212E07098();
  swift_setDeallocating();
  swift_deallocClassInstance();
  v6 = vaddq_f32(a1, a1);
  if (v6.f32[0] > v6.f32[1])
  {
    if (v6.f32[1] > v6.f32[0])
      goto LABEL_5;
    v8 = v6.f32[2] <= v6.f32[0];
    sub_212E07044();
    v7 = 1.0;
    if (!v8)
      goto LABEL_10;
LABEL_9:
    v7 = 1.66;
    goto LABEL_10;
  }
  if (v6.f32[1] <= v6.f32[0])
  {
    v9 = v6.f32[2] <= v6.f32[0];
    sub_212E07044();
    v7 = 1.0;
    if (!v9)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_5:
  sub_212E07044();
  v7 = 1.0;
LABEL_10:
  sub_212E07080();
  sub_212E070A4();
  sub_212E070A4();
  sub_212E07080();
  *a4 = v7;
  return sub_212E070A4();
}

uint64_t sub_212E05DCC(float32x4_t a1, uint64_t a2, uint64_t a3, float *a4)
{
  float32x4_t v5;
  float v6;
  float v7;
  float v8;
  _OWORD *v9;

  sub_212E07098();
  v5 = vaddq_f32(a1, a1);
  if (v5.f32[2] > v5.f32[0])
    v6 = 1.0;
  else
    v6 = 2.0;
  if (v5.f32[1] > v5.f32[0])
    v6 = 1.0;
  if (v5.f32[2] > v5.f32[0])
    v7 = 1.0;
  else
    v7 = 2.0;
  if (v5.f32[1] > v5.f32[0])
    v7 = 1.0;
  if (v5.f32[0] <= v5.f32[1])
    v8 = v7;
  else
    v8 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B685F0);
  v9 = (_OWORD *)swift_allocObject();
  v9[2] = xmmword_212E0ADC0;
  v9[3] = xmmword_212E0ADD0;
  v9[4] = xmmword_212E0ADE0;
  v9[5] = xmmword_212E0ADF0;
  sub_212E07098();
  swift_setDeallocating();
  swift_deallocClassInstance();
  sub_212E07044();
  sub_212E07044();
  sub_212E07044();
  sub_212E07044();
  sub_212E07080();
  sub_212E070A4();
  sub_212E070A4();
  sub_212E070A4();
  sub_212E070A4();
  sub_212E070A4();
  sub_212E07080();
  *a4 = v8;
  return sub_212E070A4();
}

uint64_t sub_212E06090()
{
  _OWORD *v0;

  sub_212E07098();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B685F0);
  v0 = (_OWORD *)swift_allocObject();
  v0[2] = xmmword_212E0A890;
  v0[3] = xmmword_212E0ADD0;
  v0[4] = xmmword_212E0AEC0;
  v0[5] = xmmword_212E0A890;
  sub_212E07098();
  swift_setDeallocating();
  swift_deallocClassInstance();
  sub_212E07044();
  sub_212E07044();
  sub_212E07080();
  sub_212E070A4();
  sub_212E070A4();
  sub_212E070A4();
  sub_212E07080();
  return sub_212E070A4();
}

uint64_t type metadata accessor for Sparks()
{
  uint64_t result;

  result = qword_254B68570;
  if (!qword_254B68570)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_212E06350()
{
  return swift_initClassMetadata2();
}

uint64_t sub_212E0638C()
{
  return type metadata accessor for Sparks();
}

uint64_t sub_212E06394()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  char v26;
  char isUniquelyReferenced_nonNull_native;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t result;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  void (*v38)(char *, char *, uint64_t);
  id v39;
  uint64_t v40;
  _QWORD *v41;

  v0 = sub_212E07110();
  v40 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v34 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254B683B0 != -1)
LABEL_29:
    swift_once();
  v3 = (char *)off_254B68558;
  v4 = *((_QWORD *)off_254B68558 + 2);
  if (v4)
  {
    v5 = (void *)objc_opt_self();
    v6 = &v3[(*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80)];
    v36 = *(_QWORD *)(v40 + 72);
    v38 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
    v39 = v5;
    v34 = v3;
    swift_bridgeObjectRetain();
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    v35 = v0;
    v37 = v2;
    while (1)
    {
      v10 = v7;
      v38(v2, v6, v0);
      swift_bridgeObjectRetain();
      v11 = sub_212E070F8();
      v13 = v12;
      v14 = objc_msgSend(v39, sel_valueWithPointer_, sub_212E07104());
      if (!v14)
      {
        swift_bridgeObjectRetain();
        v24 = sub_212E05414(v11, v13);
        v26 = v25;
        swift_bridgeObjectRelease();
        if ((v26 & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v41 = v10;
          v7 = v10;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_212E05A18();
            v7 = v41;
          }
          swift_bridgeObjectRelease();
          v28 = *(void **)(v7[7] + 8 * v24);
          sub_212E05764(v24, (uint64_t)v7);
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          v7 = v10;
        }
        goto LABEL_6;
      }
      v15 = v14;
      v16 = swift_isUniquelyReferenced_nonNull_native();
      v41 = v10;
      v2 = (char *)v10;
      v18 = sub_212E05414(v11, v13);
      v19 = v10[2];
      v20 = (v17 & 1) == 0;
      v21 = v19 + v20;
      if (__OFADD__(v19, v20))
      {
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      v0 = v17;
      if (v10[3] >= v21)
      {
        if ((v16 & 1) != 0)
        {
          v7 = v41;
          if ((v17 & 1) == 0)
            goto LABEL_19;
        }
        else
        {
          v2 = (char *)&v41;
          sub_212E05A18();
          v7 = v41;
          if ((v0 & 1) == 0)
            goto LABEL_19;
        }
      }
      else
      {
        sub_212E05478(v21, v16);
        v2 = (char *)v41;
        v22 = sub_212E05414(v11, v13);
        if ((v0 & 1) != (v23 & 1))
        {
          result = sub_212E071D0();
          __break(1u);
          return result;
        }
        v18 = v22;
        v7 = v41;
        if ((v0 & 1) == 0)
        {
LABEL_19:
          v7[(v18 >> 6) + 8] |= 1 << v18;
          v29 = (uint64_t *)(v7[6] + 16 * v18);
          *v29 = v11;
          v29[1] = v13;
          *(_QWORD *)(v7[7] + 8 * v18) = v15;
          v30 = v7[2];
          v31 = __OFADD__(v30, 1);
          v32 = v30 + 1;
          if (v31)
            goto LABEL_28;
          v7[2] = v32;
          swift_bridgeObjectRetain();
          goto LABEL_5;
        }
      }
      v8 = v7[7];
      v9 = *(void **)(v8 + 8 * v18);
      *(_QWORD *)(v8 + 8 * v18) = v15;

LABEL_5:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v0 = v35;
LABEL_6:
      v2 = v37;
      (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v0);
      swift_bridgeObjectRelease();
      v6 += v36;
      if (!--v4)
      {
        swift_bridgeObjectRelease();
        return (uint64_t)v7;
      }
    }
  }
  return MEMORY[0x24BEE4B00];
}

uint64_t sub_212E06700(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_212E06738(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B685E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_212E06778()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B685E8;
  if (!qword_254B685E8)
  {
    v1 = sub_212E070C8();
    result = MEMORY[0x2199A6568](MEMORY[0x24BEBFA88], v1);
    atomic_store(result, (unint64_t *)&qword_254B685E8);
  }
  return result;
}

uint64_t sub_212E07014()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_212E07020()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_212E0702C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_212E07038()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_212E07044()
{
  return MEMORY[0x24BEBFA20]();
}

uint64_t sub_212E07050()
{
  return MEMORY[0x24BEBFA28]();
}

uint64_t sub_212E0705C()
{
  return MEMORY[0x24BEBFA30]();
}

uint64_t sub_212E07068()
{
  return MEMORY[0x24BEBFA38]();
}

uint64_t sub_212E07074()
{
  return MEMORY[0x24BEBFA40]();
}

uint64_t sub_212E07080()
{
  return MEMORY[0x24BEBFA48]();
}

uint64_t sub_212E0708C()
{
  return MEMORY[0x24BEBFA50]();
}

uint64_t sub_212E07098()
{
  return MEMORY[0x24BEBFA58]();
}

uint64_t sub_212E070A4()
{
  return MEMORY[0x24BEBFA60]();
}

uint64_t sub_212E070B0()
{
  return MEMORY[0x24BEBFA68]();
}

uint64_t sub_212E070BC()
{
  return MEMORY[0x24BEBFA70]();
}

uint64_t sub_212E070C8()
{
  return MEMORY[0x24BEBFA80]();
}

uint64_t sub_212E070D4()
{
  return MEMORY[0x24BEBFA90]();
}

uint64_t sub_212E070E0()
{
  return MEMORY[0x24BEBFA98]();
}

uint64_t sub_212E070EC()
{
  return MEMORY[0x24BEBFAA0]();
}

uint64_t sub_212E070F8()
{
  return MEMORY[0x24BEBFAA8]();
}

uint64_t sub_212E07104()
{
  return MEMORY[0x24BEBFAB0]();
}

uint64_t sub_212E07110()
{
  return MEMORY[0x24BEBFAB8]();
}

uint64_t sub_212E0711C()
{
  return MEMORY[0x24BEBFAD0]();
}

uint64_t sub_212E07128()
{
  return MEMORY[0x24BEBFAD8]();
}

uint64_t sub_212E07134()
{
  return MEMORY[0x24BEBFAE0]();
}

uint64_t sub_212E07140()
{
  return MEMORY[0x24BEBFAF0]();
}

uint64_t sub_212E0714C()
{
  return MEMORY[0x24BEBFAF8]();
}

uint64_t sub_212E07158()
{
  return MEMORY[0x24BEBFB00]();
}

uint64_t sub_212E07164()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_212E07170()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_212E0717C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_212E07188()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_212E07194()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_212E071A0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_212E071AC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_212E071B8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_212E071C4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_212E071D0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_212E071DC()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_212E071E8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_212E071F4()
{
  return MEMORY[0x24BEE4328]();
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE190](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

  MEMORY[0x24BDAC828]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
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

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

simd_float4 _simd_cos_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x24BDACCD8]((__n128)x);
  return result;
}

simd_float4 _simd_sin_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x24BDACE38]((__n128)x);
  return result;
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double cosh(long double __x)
{
  long double result;

  MEMORY[0x24BDADBF0](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

double drand48(void)
{
  double result;

  MEMORY[0x24BDAE0B0]();
  return result;
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

long double sinh(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE28](__x);
  return result;
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

