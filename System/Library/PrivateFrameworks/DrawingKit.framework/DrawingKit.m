double HW_NSTimeIntervalFromMillis(uint64_t a1)
{
  return (double)a1 / 1000.0;
}

uint64_t HW_MillisFromNSTimeInterval(double a1)
{
  return (uint64_t)(a1 * 1000.0);
}

double HW_CGSizeFromIntegralData(void *a1)
{
  id v1;
  _WORD *v2;
  double v3;

  v1 = a1;
  if (objc_msgSend(v1, "length") == 4)
  {
    v2 = (_WORD *)objc_msgSend(objc_retainAutorelease(v1), "bytes");
    v3 = 0.0;
    if (v2)
      v3 = (double)(__int16)(*v2 ^ 0x8000);
  }
  else
  {
    v3 = 0.0;
  }

  return v3;
}

id HW_DataFromIntegralCGSize(double a1, double a2)
{
  float v2;
  int v3;
  float v4;
  _WORD v6[2];

  v2 = a1;
  v3 = (int)(float)(roundf(v2) + 32768.0);
  v4 = a2;
  v6[0] = v3;
  v6[1] = (int)(float)(roundf(v4) + 32768.0);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v6, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

double HW_CGRectFromIntegralData(void *a1)
{
  id v1;
  _WORD *v2;
  double v3;

  v1 = a1;
  if (objc_msgSend(v1, "length") == 8)
  {
    v2 = (_WORD *)objc_msgSend(objc_retainAutorelease(v1), "bytes");
    v3 = 0.0;
    if (v2)
      v3 = (double)(__int16)(*v2 ^ 0x8000);
  }
  else
  {
    v3 = 0.0;
  }

  return v3;
}

id HW_DataFromIntegralCGRect(float64x2_t a1, float64_t a2, float64x2_t a3, float64_t a4)
{
  float32x4_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  a3.f64[1] = a4;
  a1.f64[1] = a2;
  v4.i64[0] = 0x4700000047000000;
  v4.i64[1] = 0x4700000047000000;
  v6[0] = vmovn_s32((int32x4_t)vcvtq_u32_f32(vaddq_f32(vrndaq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(a1), a3)), v4)));
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v6, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

double HW_FloatFromUInt16(unsigned int a1)
{
  return (float)((float)((float)a1 / 32767.0) + -1.0);
}

unsigned int HW_UInt16FromFloat(double a1)
{
  float v1;

  v1 = (a1 + 1.0) * 32767.0;
  return llroundf(v1);
}

double ClampToMinWidthCG(double result, double a2)
{
  if (result < a2)
    return a2;
  return result;
}

uint64_t NSStringFromVectorFloat4(__n128 a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("x: %f y: %f z: %f w: %f"), a1.n128_f32[0], a1.n128_f32[1], a1.n128_f32[2], a1.n128_f32[3]);
}

float DKRenderPointWidthForPoint(float32x4_t a1, float a2)
{
  return vmuls_lane_f32(a1.f32[3] + 1.0, a1, 2) * a2;
}

void sub_21DCAF63C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCAF6C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DCAF73C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)DKInkView;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_21DCAF93C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCAF9A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCAFA58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DCAFAD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCAFB60(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCAFBE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCAFDBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCAFE34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB0018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21DCB0160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

void sub_21DCB03CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21DCB0708(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB07EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB0AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DCB0BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21DCB0D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_21DCB0E68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21DCB0F90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21DCB1050(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DCB10DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DCB122C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB133C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB1390(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB1408(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DCB14E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB15B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21DCB19E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  void *v41;

  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_21DCB1B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DCB2194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,id location)
{
  void *v45;
  void *v46;
  void *v47;

  _Unwind_Resume(a1);
}

void sub_21DCB22D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21DCB2770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  void *v41;

  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_21DCB28CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DCB2C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void sub_21DCB2DE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB2E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21DCB3048(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DCB3264(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DCB3344(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB3530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{

  _Unwind_Resume(a1);
}

void sub_21DCB36E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB37A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB389C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DCB39C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21DCB3AD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DCB3BCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DCB3CFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB3E5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB3F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t CGRectIsUnrepresentable(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  char v8;
  BOOL IsInfinite;
  double v10;
  CGRect v12;
  CGRect v13;

  if (CGRectIsNull(*(CGRect *)&a1)
    || (v12.origin.x = a1, v12.origin.y = a2, v12.size.width = a3, v12.size.height = a4, CGRectIsEmpty(v12)))
  {
    v8 = 1;
  }
  else
  {
    v13.origin.x = a1;
    v13.origin.y = a2;
    v13.size.width = a3;
    v13.size.height = a4;
    IsInfinite = CGRectIsInfinite(v13);
    v10 = fabs(a2);
    v8 = fabs(a1) == INFINITY || IsInfinite;
    if (v10 == INFINITY)
      v8 = 1;
    if (fabs(a3) == INFINITY)
      v8 = 1;
    if (fabs(a4) == INFINITY)
      v8 = 1;
  }
  return v8 & 1;
}

BOOL CGPointIsUnrepresentable(double a1, double a2)
{
  _BOOL4 v2;

  v2 = fabs(a1) == INFINITY;
  if (fabs(a2) == INFINITY)
    return 1;
  return v2;
}

double DKDistanceBetweenPoints(double a1, double a2, double a3, double a4)
{
  return hypot(a1 - a3, a2 - a4);
}

BOOL DKIsDarkMode()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceStyle") == 2;

  return v1;
}

void sub_21DCB48CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_21DCB4B68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB4CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)DKInkRendererGL;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21DCB4DA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB4EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DCB4F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DCB5020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DCB509C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21DCB5184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DCB521C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DCB5300(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB53A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DCB54D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21DCB5644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21DCB5780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21DCB57F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

BOOL DKDrawingIsValid(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  _BOOL8 v11;

  v1 = a1;
  v2 = v1;
  v11 = 0;
  if (v1)
  {
    objc_msgSend(v1, "canvasBounds");
    v4 = *MEMORY[0x24BDBF148];
    v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
    if (v6 != *MEMORY[0x24BDBF148] || v3 != v5)
    {
      objc_msgSend(v2, "strokesFrame");
      if (v9 != v4 || v8 != v5)
        v11 = 1;
    }
  }

  return v11;
}

void sub_21DCB6BC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21DCB6C50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21DCB6CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)DKOpenGLRenderer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_21DCB7608(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<Page>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<Page>::__append((void **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 40 * a2;
  }
}

void std::vector<Vertex>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<Vertex>::__append((void **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 24 * a2;
  }
}

void sub_21DCB81F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_21DCB85E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21DCB8860(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21DCB892C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21DCB8F6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21DCB950C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21DCB999C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_21DCB9B20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<Page>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (0xCCCCCCCCCCCCCCCDLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      v13 = 40 * ((40 * a2 - 40) / 0x28) + 40;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - (_BYTE *)*a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0x666666666666666)
      std::vector<Page>::__throw_length_error[abi:ne180100]();
    v10 = 0xCCCCCCCCCCCCCCCDLL * ((v5 - (_BYTE *)*a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x333333333333333)
      v11 = 0x666666666666666;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Page>>(v4, v11);
    else
      v12 = 0;
    v14 = &v12[40 * v8];
    v15 = &v12[40 * v11];
    v16 = 40 * ((40 * a2 - 40) / 0x28) + 40;
    bzero(v14, v16);
    v17 = &v14[v16];
    v19 = (char *)*a1;
    v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        v20 = *(_OWORD *)(v18 - 40);
        v21 = *(_OWORD *)(v18 - 24);
        *((_QWORD *)v14 - 1) = *((_QWORD *)v18 - 1);
        *(_OWORD *)(v14 - 24) = v21;
        *(_OWORD *)(v14 - 40) = v20;
        v14 -= 40;
        v18 -= 40;
      }
      while (v18 != v19);
      v18 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
      operator delete(v18);
  }
}

void std::vector<Page>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24E1B0718, MEMORY[0x24BEDAAF0]);
}

void sub_21DCB9EA4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Page>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(40 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<VertexGroup>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

void std::vector<Vertex>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (_BYTE *)*a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL)
      std::vector<Page>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (_BYTE *)*a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Vertex>>(v4, v11);
    else
      v12 = 0;
    v14 = &v12[24 * v8];
    v15 = &v12[24 * v11];
    v16 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v14, v16);
    v17 = &v14[v16];
    v19 = (char *)*a1;
    v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        v20 = *(_OWORD *)(v18 - 24);
        *((_QWORD *)v14 - 1) = *((_QWORD *)v18 - 1);
        *(_OWORD *)(v14 - 24) = v20;
        v14 -= 24;
        v18 -= 24;
      }
      while (v18 != v19);
      v18 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
      operator delete(v18);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<Vertex>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

_QWORD *std::vector<Vertex>::__init_with_size[abi:ne180100]<std::__wrap_iter<Vertex*>,std::__wrap_iter<Vertex*>>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<Vertex>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21DCBA19C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<Vertex>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<Page>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Vertex>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

_QWORD *std::vector<Vertex>::__init_with_size[abi:ne180100]<Vertex*,Vertex*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<Vertex>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21DCBA298(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_21DCBB0DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DCBB27C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t HWPDrawingReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  id v23;
  void *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  void *v48;
  uint64_t v49;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 64) |= 0x10u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_63;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_65;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_63:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_65:
          v49 = 60;
          goto LABEL_82;
        case 2u:
          PBReaderReadData();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 24;
          goto LABEL_61;
        case 3u:
          PBReaderReadData();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 32;
          goto LABEL_61;
        case 4u:
          v28 = 0;
          v29 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 64) |= 8u;
          while (2)
          {
            v30 = *v3;
            v31 = *(_QWORD *)(a2 + v30);
            if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
              *(_QWORD *)(a2 + v30) = v31 + 1;
              v19 |= (unint64_t)(v32 & 0x7F) << v28;
              if (v32 < 0)
              {
                v28 += 7;
                v14 = v29++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_69;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_69:
          v49 = 56;
          goto LABEL_82;
        case 5u:
          v33 = 0;
          v34 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 64) |= 1u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v19 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                v14 = v34++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_73;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_73:
          v49 = 16;
          goto LABEL_82;
        case 6u:
          v38 = 0;
          v39 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 64) |= 2u;
          while (2)
          {
            v40 = *v3;
            v41 = *(_QWORD *)(a2 + v40);
            if (v41 == -1 || v41 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
              *(_QWORD *)(a2 + v40) = v41 + 1;
              v19 |= (unint64_t)(v42 & 0x7F) << v38;
              if (v42 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  LODWORD(v19) = 0;
                  goto LABEL_77;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_77:
          v49 = 20;
          goto LABEL_82;
        case 7u:
          v43 = 0;
          v44 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 64) |= 4u;
          break;
        case 8u:
          PBReaderReadData();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = 48;
LABEL_61:
          v48 = *(void **)(a1 + v27);
          *(_QWORD *)(a1 + v27) = v26;

          continue;
        default:
          if (!*(_QWORD *)(a1 + 8))
          {
            v23 = objc_alloc_init(MEMORY[0x24BE7AF28]);
            v24 = *(void **)(a1 + 8);
            *(_QWORD *)(a1 + 8) = v23;

          }
          result = PBUnknownFieldAdd();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v45 = *v3;
        v46 = *(_QWORD *)(a2 + v45);
        if (v46 == -1 || v46 >= *(_QWORD *)(a2 + *v4))
          break;
        v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
        *(_QWORD *)(a2 + v45) = v46 + 1;
        v19 |= (unint64_t)(v47 & 0x7F) << v43;
        if ((v47 & 0x80) == 0)
          goto LABEL_79;
        v43 += 7;
        v14 = v44++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_81;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_79:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_81:
      v49 = 40;
LABEL_82:
      *(_DWORD *)(a1 + v49) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HWPMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  BOOL v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  id v25;
  void *v26;
  uint64_t result;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          v15 = v9++ >= 9;
          if (v15)
          {
            v10 = 0;
            v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v10 = 0;
LABEL_14:
        if (v16)
          v17 = 1;
        else
          v17 = (v10 & 7) == 4;
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v18 = 0;
              v19 = 0;
              v20 = 0;
              *(_BYTE *)(a1 + 44) |= 2u;
              break;
            case 2u:
              *(_BYTE *)(a1 + 44) |= 1u;
              v28 = *v3;
              v29 = *(_QWORD *)(a2 + v28);
              if (v29 <= 0xFFFFFFFFFFFFFFF7 && (v30 = v29 + 8, v29 + 8 <= *(_QWORD *)(a2 + *v4)))
              {
                v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v29);
                *(_QWORD *)(a2 + v28) = v30;
              }
              else
              {
                v31 = 0;
                *(_BYTE *)(a2 + *v5) = 1;
              }
              *(_QWORD *)(a1 + 16) = v31;
              goto LABEL_42;
            case 3u:
              PBReaderReadString();
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = 32;
              goto LABEL_35;
            case 4u:
              PBReaderReadData();
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = 24;
LABEL_35:
              v34 = *(void **)(a1 + v33);
              *(_QWORD *)(a1 + v33) = v32;

              goto LABEL_42;
            default:
              if (!*(_QWORD *)(a1 + 8))
              {
                v25 = objc_alloc_init(MEMORY[0x24BE7AF28]);
                v26 = *(void **)(a1 + 8);
                *(_QWORD *)(a1 + 8) = v25;

              }
              result = PBUnknownFieldAdd();
              if (!(_DWORD)result)
                return result;
LABEL_42:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0)
              goto LABEL_37;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_39;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v20) = 0;
LABEL_39:
          *(_DWORD *)(a1 + 40) = v20;
          goto LABEL_42;
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE60](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDC0](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEF98]((__n128)point, *(__n128 *)&point.y);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEFD0]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x24BDBF068](dict, rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

NSRect NSIntegralRectWithOptions(NSRect aRect, NSAlignmentOptions opts)
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSRect result;

  MEMORY[0x24BDD0E00](opts, (__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BDF6668]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x24BE7AF88]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteSfixed64Field()
{
  return MEMORY[0x24BE7AFC0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x24BE7B028]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBUnknownFieldAdd()
{
  return MEMORY[0x24BE7B1E0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24E1B0730(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24E1B0738(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB988](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void glActiveTexture(GLenum texture)
{
  MEMORY[0x24BDE2820](*(_QWORD *)&texture);
}

void glAttachShader(GLuint program, GLuint shader)
{
  MEMORY[0x24BDE2828](*(_QWORD *)&program, *(_QWORD *)&shader);
}

void glBindAttribLocation(GLuint program, GLuint index, const GLchar *name)
{
  MEMORY[0x24BDE2830](*(_QWORD *)&program, *(_QWORD *)&index, name);
}

void glBindBuffer(GLenum target, GLuint buffer)
{
  MEMORY[0x24BDE2838](*(_QWORD *)&target, *(_QWORD *)&buffer);
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
  MEMORY[0x24BDE2840](*(_QWORD *)&target, *(_QWORD *)&framebuffer);
}

void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
{
  MEMORY[0x24BDE2848](*(_QWORD *)&target, *(_QWORD *)&renderbuffer);
}

void glBindTexture(GLenum target, GLuint texture)
{
  MEMORY[0x24BDE2850](*(_QWORD *)&target, *(_QWORD *)&texture);
}

uint64_t glBindVertexArrayOES()
{
  return MEMORY[0x24BDE2858]();
}

void glBlendFunc(GLenum sfactor, GLenum dfactor)
{
  MEMORY[0x24BDE2868](*(_QWORD *)&sfactor, *(_QWORD *)&dfactor);
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
  MEMORY[0x24BDE2880](*(_QWORD *)&target, size, data, *(_QWORD *)&usage);
}

void glBufferSubData(GLenum target, GLintptr offset, GLsizeiptr size, const GLvoid *data)
{
  MEMORY[0x24BDE2888](*(_QWORD *)&target, offset, size, data);
}

void glClear(GLbitfield mask)
{
  MEMORY[0x24BDE2898](*(_QWORD *)&mask);
}

void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
  MEMORY[0x24BDE28A0](red, green, blue, alpha);
}

void glCompileShader(GLuint shader)
{
  MEMORY[0x24BDE28C0](*(_QWORD *)&shader);
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x24BDE28D0]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x24BDE28D8](*(_QWORD *)&type);
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
  MEMORY[0x24BDE28E0](*(_QWORD *)&n, buffers);
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
  MEMORY[0x24BDE28E8](*(_QWORD *)&n, framebuffers);
}

void glDeleteRenderbuffers(GLsizei n, const GLuint *renderbuffers)
{
  MEMORY[0x24BDE28F8](*(_QWORD *)&n, renderbuffers);
}

void glDeleteTextures(GLsizei n, const GLuint *textures)
{
  MEMORY[0x24BDE2910](*(_QWORD *)&n, textures);
}

uint64_t glDeleteVertexArraysOES()
{
  return MEMORY[0x24BDE2918]();
}

void glDepthMask(GLBOOLean flag)
{
  MEMORY[0x24BDE2928](flag);
}

void glDisable(GLenum cap)
{
  MEMORY[0x24BDE2938](*(_QWORD *)&cap);
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
  MEMORY[0x24BDE2950](*(_QWORD *)&mode, *(_QWORD *)&first, *(_QWORD *)&count);
}

void glEnable(GLenum cap)
{
  MEMORY[0x24BDE2960](*(_QWORD *)&cap);
}

void glEnableVertexAttribArray(GLuint index)
{
  MEMORY[0x24BDE2968](*(_QWORD *)&index);
}

void glFinish(void)
{
  MEMORY[0x24BDE2978]();
}

void glFlush(void)
{
  MEMORY[0x24BDE2980]();
}

void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
{
  MEMORY[0x24BDE2988](*(_QWORD *)&target, *(_QWORD *)&attachment, *(_QWORD *)&renderbuffertarget, *(_QWORD *)&renderbuffer);
}

void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
{
  MEMORY[0x24BDE2990](*(_QWORD *)&target, *(_QWORD *)&attachment, *(_QWORD *)&textarget, *(_QWORD *)&texture, *(_QWORD *)&level);
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
  MEMORY[0x24BDE2998](*(_QWORD *)&n, buffers);
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
  MEMORY[0x24BDE29A0](*(_QWORD *)&n, framebuffers);
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
{
  MEMORY[0x24BDE29A8](*(_QWORD *)&n, renderbuffers);
}

void glGenTextures(GLsizei n, GLuint *textures)
{
  MEMORY[0x24BDE29B0](*(_QWORD *)&n, textures);
}

uint64_t glGenVertexArraysOES()
{
  return MEMORY[0x24BDE29B8]();
}

GLenum glGetError(void)
{
  return MEMORY[0x24BDE29D8]();
}

void glGetIntegerv(GLenum pname, GLint *params)
{
  MEMORY[0x24BDE29F0](*(_QWORD *)&pname, params);
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE2A00](*(_QWORD *)&program, *(_QWORD *)&pname, params);
}

void glGetShaderInfoLog(GLuint shader, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
  MEMORY[0x24BDE2A10](*(_QWORD *)&shader, *(_QWORD *)&bufsize, length, infolog);
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
  MEMORY[0x24BDE2A18](*(_QWORD *)&shader, *(_QWORD *)&pname, params);
}

int glGetUniformLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x24BDE2A30](*(_QWORD *)&program, name);
}

void glLinkProgram(GLuint program)
{
  MEMORY[0x24BDE2A48](*(_QWORD *)&program);
}

void glPixelStorei(GLenum pname, GLint param)
{
  MEMORY[0x24BDE2A60](*(_QWORD *)&pname, *(_QWORD *)&param);
}

void glPopGroupMarkerEXT(void)
{
  MEMORY[0x24BDE2A68]();
}

void glPushGroupMarkerEXT(GLsizei length, const char *marker)
{
  MEMORY[0x24BDE2A70](*(_QWORD *)&length, marker);
}

void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
{
  MEMORY[0x24BDE2A78](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&format, *(_QWORD *)&type, pixels);
}

void glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)
{
  MEMORY[0x24BDE2A80](*(_QWORD *)&target, *(_QWORD *)&internalformat, *(_QWORD *)&width, *(_QWORD *)&height);
}

void glScissor(GLint x, GLint y, GLsizei width, GLsizei height)
{
  MEMORY[0x24BDE2A98](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
  MEMORY[0x24BDE2AA0](*(_QWORD *)&shader, *(_QWORD *)&count, string, length);
}

void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
  MEMORY[0x24BDE2AC0](*(_QWORD *)&target, *(_QWORD *)&level, *(_QWORD *)&internalformat, *(_QWORD *)&width, *(_QWORD *)&height, *(_QWORD *)&border, *(_QWORD *)&format, *(_QWORD *)&type);
}

void glTexParameteri(GLenum target, GLenum pname, GLint param)
{
  MEMORY[0x24BDE2AD8](*(_QWORD *)&target, *(_QWORD *)&pname, *(_QWORD *)&param);
}

void glUniform1f(GLint location, GLfloat x)
{
  MEMORY[0x24BDE2AF0](*(_QWORD *)&location, x);
}

void glUniform1i(GLint location, GLint x)
{
  MEMORY[0x24BDE2B00](*(_QWORD *)&location, *(_QWORD *)&x);
}

void glUniform2fv(GLint location, GLsizei count, const GLfloat *v)
{
  MEMORY[0x24BDE2B18](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniform4fv(GLint location, GLsizei count, const GLfloat *v)
{
  MEMORY[0x24BDE2B58](*(_QWORD *)&location, *(_QWORD *)&count, v);
}

void glUniformMatrix4fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
  MEMORY[0x24BDE2B80](*(_QWORD *)&location, *(_QWORD *)&count, transpose, value);
}

void glUseProgram(GLuint program)
{
  MEMORY[0x24BDE2B98](*(_QWORD *)&program);
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
  MEMORY[0x24BDE2BB8](*(_QWORD *)&indx, *(_QWORD *)&size, *(_QWORD *)&type, normalized, *(_QWORD *)&stride, ptr);
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
  MEMORY[0x24BDE2BC0](*(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE838](__x, __y);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

