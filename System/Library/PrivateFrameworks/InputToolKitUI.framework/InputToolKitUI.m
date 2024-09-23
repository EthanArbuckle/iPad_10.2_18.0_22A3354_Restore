BOOL itk_isiPad()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 1;

  return v1;
}

BOOL itk_isiPhone()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom") == 0;

  return v1;
}

uint64_t ITKMNearlyEqualQuads(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "topLeft");
  objc_msgSend(v4, "topLeft");
  if (ITKNearlyEqualPoints()
    && (objc_msgSend(v3, "topRight"), objc_msgSend(v4, "topRight"), ITKNearlyEqualPoints())
    && (objc_msgSend(v3, "bottomRight"), objc_msgSend(v4, "bottomRight"), ITKNearlyEqualPoints()))
  {
    objc_msgSend(v3, "bottomLeft");
    objc_msgSend(v4, "bottomLeft");
    v5 = ITKNearlyEqualPoints();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

double ITKMultiplyQuadSideLengthScaler(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * a5;
}

double ITKMinimumQuadSideLength(double result, double a2, double a3, double a4)
{
  if (a3 >= a4)
    a3 = a4;
  if (a3 < result)
    result = a3;
  if (result >= a2)
    return a2;
  return result;
}

double computeCornerMatrix@<D0>(double *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double result;

  v6 = a1[2];
  v7 = a1[3];
  v9 = a1[4];
  v8 = a1[5];
  v10 = a1[6];
  v11 = a1[7];
  v12 = *a1;
  v13 = a1[1];
  v14 = v9 + *a1 - v6 - v10;
  v15 = v8 + v13 - v7 - v11;
  if (v14 == 0.0 && v15 == 0.0)
  {
    v16 = v6 - v12;
    v17 = v9 - v6;
    v18 = v7 - v13;
    v19 = v8 - v7;
    v20 = 0.0;
    v21 = 0.0;
  }
  else
  {
    v22 = v10 - v9;
    v23 = v7 - v8;
    v24 = v6 - v9;
    v25 = v24 * (v11 - v8) - (v7 - v8) * v22;
    v20 = (v14 * (v11 - v8) - v15 * v22) / v25;
    v21 = (v24 * v15 - v23 * v14) / v25;
    v16 = v6 - v12 + v20 * v6;
    v18 = v7 - v13 + v20 * v7;
    v17 = v10 - v12 + v21 * v10;
    v19 = v11 - v13 + v21 * v11;
  }
  v26 = 1.0 / a3;
  v27 = 1.0 / a4;
  *(double *)a2 = v26 * v16;
  *(double *)(a2 + 8) = v26 * v18;
  *(_QWORD *)(a2 + 16) = 0;
  *(double *)(a2 + 24) = v26 * v20;
  *(double *)(a2 + 32) = v27 * v17;
  *(double *)(a2 + 40) = v27 * v19;
  *(_QWORD *)(a2 + 48) = 0;
  *(double *)(a2 + 56) = v27 * v21;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_OWORD *)(a2 + 80) = xmmword_23F100030;
  *(_QWORD *)(a2 + 112) = 0;
  *(double *)(a2 + 96) = v12 + a6 * v17 + a5 * v16;
  *(double *)(a2 + 104) = v13 + a6 * v19 + a5 * v18;
  result = a6 * v21 + a5 * v20 + 1.0;
  *(double *)(a2 + 120) = result;
  return result;
}

void sub_23F0E2D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_23F0E2E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_23F0E2F68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23F0E30B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

void sub_23F0E32A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_23F0E33D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_23F0E34E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_23F0E3720(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23F0E3854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_23F0E3B84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23F0E3BF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23F0E3C5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23F0E3EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void **a28)
{
  void *v28;
  void *v29;
  uint64_t v30;

  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a28);
  a28 = (void **)(v30 - 72);
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a28);

  _Unwind_Resume(a1);
}

void ClipperLib::Clipper::~Clipper(ClipperLib::Clipper *this)
{
  void *v2;
  void *v3;
  void *v4;

  *(_QWORD *)this = &off_250FA1278;
  *((_QWORD *)this + 18) = &unk_250FA12C0;
  std::__list_imp<long long>::clear((_QWORD *)this + 11);
  v2 = (void *)*((_QWORD *)this + 7);
  if (v2)
  {
    *((_QWORD *)this + 8) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 4);
  if (v3)
  {
    *((_QWORD *)this + 5) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 1);
  if (v4)
  {
    *((_QWORD *)this + 2) = v4;
    operator delete(v4);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::Clipper *)((char *)this + 144));
}

{
  ClipperLib::ClipperBase *v2;
  void *v3;
  void *v4;
  void *v5;

  *(_QWORD *)this = &off_250FA1278;
  *((_QWORD *)this + 18) = &unk_250FA12C0;
  v2 = (ClipperLib::Clipper *)((char *)this + 144);
  std::__list_imp<long long>::clear((_QWORD *)this + 11);
  v3 = (void *)*((_QWORD *)this + 7);
  if (v3)
  {
    *((_QWORD *)this + 8) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 4);
  if (v4)
  {
    *((_QWORD *)this + 5) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 1);
  if (v5)
  {
    *((_QWORD *)this + 2) = v5;
    operator delete(v5);
  }
  ClipperLib::ClipperBase::~ClipperBase(v2);
  JUMPOUT(0x242665874);
}

void sub_23F0E4114(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_23F0E4414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void **a54)
{
  void *v54;
  ClipperLib::Clipper *v55;
  void *v56;
  void *v57;
  uint64_t v58;

  ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)&a16);
  _Block_object_dispose(&a54, 8);
  ClipperLib::Clipper::~Clipper(v55);
  a54 = (void **)(v58 - 168);
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a54);

  _Unwind_Resume(a1);
}

void sub_23F0E44B0()
{
  JUMPOUT(0x23F0E44A4);
}

void sub_23F0E44FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__15(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __n128 result;
  __int128 v6;

  v4 = a2 + 48;
  ClipperLib::ClipperBase::ClipperBase((ClipperLib::ClipperBase *)(a1 + 192), (const ClipperLib::ClipperBase *)(a2 + 48 + *(_QWORD *)(*(_QWORD *)(a2 + 48) - 24)));
  *(_QWORD *)(a1 + 192) = &unk_250FA12C0;
  *(_QWORD *)(a1 + 48) = &off_250FA1278;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(v4 + 8);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 8) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 24) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(v4 + 32);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(v4 + 48);
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 40) = 0;
  *(_QWORD *)(v4 + 48) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(v4 + 56);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(v4 + 72);
  *(_QWORD *)(v4 + 64) = 0;
  *(_QWORD *)(v4 + 72) = 0;
  *(_QWORD *)(v4 + 56) = 0;
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(v4 + 80);
  *(_QWORD *)(a1 + 136) = a1 + 136;
  *(_QWORD *)(a1 + 144) = a1 + 136;
  *(_QWORD *)(a1 + 152) = 0;
  std::list<long long>::splice(a1 + 136, (uint64_t *)(a1 + 136), (_QWORD *)(v4 + 88));
  result = *(__n128 *)(a2 + 160);
  v6 = *(_OWORD *)(a2 + 176);
  *(__n128 *)(a1 + 160) = result;
  *(_OWORD *)(a1 + 176) = v6;
  return result;
}

void __Block_byref_object_dispose__16(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;

  a1[6] = &off_250FA1278;
  v2 = a1 + 6;
  a1[24] = &unk_250FA12C0;
  std::__list_imp<long long>::clear(a1 + 17);
  v3 = (void *)v2[7];
  if (v3)
  {
    a1[14] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[10];
  if (v4)
  {
    a1[11] = v4;
    operator delete(v4);
  }
  v5 = (void *)a1[7];
  if (v5)
  {
    a1[8] = v5;
    operator delete(v5);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)(a1 + 24));
}

void sub_23F0E46F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23F0E47F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_23F0E48C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23F0E4D00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL ITKArcIsClockwiseForAngles(double a1, double a2)
{
  double v2;
  double v3;
  double v4;

  ITKNormalizeAngleInRadians();
  v3 = v2;
  ITKNormalizeAngleInRadians();
  return v3 >= v4;
}

void sub_23F0E4F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_23F0E5118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v31 = v30;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);

  _Unwind_Resume(a1);
}

void sub_23F0E525C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_23F0E5354(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23F0E557C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23F0E56B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23F0E5B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,void **a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  void *v60;
  ClipperLib::ClipperOffset *v61;
  void *v62;
  ClipperLib::ClipperOffset *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;

  v68 = v65;

  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a24);
  a24 = (void **)&a60;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a24);

  a24 = (void **)&STACK[0x228];
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a24);
  _Block_object_dispose(&STACK[0x240], 8);
  ClipperLib::ClipperOffset::~ClipperOffset(v63);
  _Block_object_dispose(&STACK[0x378], 8);
  _Block_object_dispose(&STACK[0x398], 8);
  ClipperLib::ClipperOffset::~ClipperOffset(v61);

  _Unwind_Resume(a1);
}

ClipperLib::ClipperOffset *__Block_byref_object_copy__24(uint64_t a1, uint64_t a2)
{
  return ClipperLib::ClipperOffset::ClipperOffset((ClipperLib::ClipperOffset *)(a1 + 48), (const ClipperLib::ClipperOffset *)(a2 + 48));
}

void __Block_byref_object_dispose__25(uint64_t a1)
{
  ClipperLib::ClipperOffset::~ClipperOffset((ClipperLib::ClipperOffset *)(a1 + 48));
}

void sub_23F0E5D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_23F0E5E18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23F0E5F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v11;

  _Unwind_Resume(a1);
}

void sub_23F0E60C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_23F0E61E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_23F0E6388(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

_QWORD *std::__list_imp<long long>::clear(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result[2])
  {
    v1 = result;
    result = (_QWORD *)result[1];
    v2 = *v1;
    v3 = *result;
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(*v1 + 8);
    **(_QWORD **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        operator delete(result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

_QWORD *std::vector<std::vector<ClipperLib::IntPoint>>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;
  size_t v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    v5 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_23F0E6554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_250FA0A28, MEMORY[0x24BEDAAF0]);
}

void sub_23F0E664C(_Unwind_Exception *a1)
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

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

ClipperLib::ClipperBase *ClipperLib::ClipperBase::ClipperBase(ClipperLib::ClipperBase *this, const ClipperLib::ClipperBase *a2)
{
  uint64_t v4;
  char v5;
  __int16 v6;
  uint64_t v7;

  v4 = *((_QWORD *)a2 + 1);
  *(_QWORD *)this = &off_250FA1220;
  *((_QWORD *)this + 1) = v4;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  std::vector<ClipperLib::LocalMinimum>::__init_with_size[abi:ne180100]<ClipperLib::LocalMinimum*,ClipperLib::LocalMinimum*>((_QWORD *)this + 2, *((const void **)a2 + 2), *((_QWORD *)a2 + 3), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 3) - *((_QWORD *)a2 + 2)) >> 3));
  v5 = *((_BYTE *)a2 + 40);
  *((_QWORD *)this + 6) = 0;
  *((_BYTE *)this + 40) = v5;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  std::vector<ClipperLib::TEdge *>::__init_with_size[abi:ne180100]<ClipperLib::TEdge **,ClipperLib::TEdge **>((_QWORD *)this + 6, *((const void **)a2 + 6), *((_QWORD *)a2 + 7), (uint64_t)(*((_QWORD *)a2 + 7) - *((_QWORD *)a2 + 6)) >> 3);
  v6 = *((_WORD *)a2 + 36);
  *((_QWORD *)this + 10) = 0;
  *((_WORD *)this + 36) = v6;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  std::vector<ClipperLib::OutRec *>::__init_with_size[abi:ne180100]<ClipperLib::OutRec **,ClipperLib::OutRec **>((_QWORD *)this + 10, *((const void **)a2 + 10), *((_QWORD *)a2 + 11), (uint64_t)(*((_QWORD *)a2 + 11) - *((_QWORD *)a2 + 10)) >> 3);
  v7 = *((_QWORD *)a2 + 13);
  *((_QWORD *)this + 14) = 0;
  *((_QWORD *)this + 13) = v7;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16) = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>((_QWORD *)this + 14, *((const void **)a2 + 14), *((_QWORD *)a2 + 15), (uint64_t)(*((_QWORD *)a2 + 15) - *((_QWORD *)a2 + 14)) >> 3);
  return this;
}

void sub_23F0E6798(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  void **v2;
  void **v3;
  void **v4;
  void *v6;
  void *v7;
  void *v8;

  v6 = *v4;
  if (*v4)
  {
    v1[11] = v6;
    operator delete(v6);
  }
  v7 = *v3;
  if (*v3)
  {
    v1[7] = v7;
    operator delete(v7);
  }
  v8 = *v2;
  if (*v2)
  {
    v1[3] = v8;
    operator delete(v8);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<ClipperLib::LocalMinimum>::__init_with_size[abi:ne180100]<ClipperLib::LocalMinimum*,ClipperLib::LocalMinimum*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_23F0E6840(_Unwind_Exception *exception_object)
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

_QWORD *std::vector<ClipperLib::TEdge *>::__init_with_size[abi:ne180100]<ClipperLib::TEdge **,ClipperLib::TEdge **>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_23F0E68B8(_Unwind_Exception *exception_object)
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

char *std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

_QWORD *std::vector<ClipperLib::OutRec *>::__init_with_size[abi:ne180100]<ClipperLib::OutRec **,ClipperLib::OutRec **>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_23F0E69A4(_Unwind_Exception *exception_object)
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

_QWORD *std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_23F0E6A1C(_Unwind_Exception *exception_object)
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

uint64_t std::list<long long>::splice(uint64_t result, uint64_t *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3[2];
  if (v3)
  {
    v5 = *a3;
    v4 = (uint64_t *)a3[1];
    v6 = *v4;
    *(_QWORD *)(v6 + 8) = *(_QWORD *)(*a3 + 8);
    **(_QWORD **)(v5 + 8) = v6;
    v7 = *a2;
    *(_QWORD *)(v7 + 8) = v4;
    *v4 = v7;
    *a2 = v5;
    *(_QWORD *)(v5 + 8) = a2;
    *(_QWORD *)(result + 16) += v3;
    a3[2] = 0;
  }
  return result;
}

ClipperLib::ClipperOffset *ClipperLib::ClipperOffset::ClipperOffset(ClipperLib::ClipperOffset *this, const ClipperLib::ClipperOffset *a2)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  *(_OWORD *)this = *(_OWORD *)a2;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  std::vector<std::vector<ClipperLib::IntPoint>>::__init_with_size[abi:ne180100]<std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>((_QWORD *)this + 2, *((_QWORD *)a2 + 2), *((_QWORD *)a2 + 3), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 3) - *((_QWORD *)a2 + 2)) >> 3));
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>((_QWORD *)this + 5, *((const void **)a2 + 5), *((_QWORD *)a2 + 6), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 6) - *((_QWORD *)a2 + 5)) >> 3));
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0;
  std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>((_QWORD *)this + 8, *((const void **)a2 + 8), *((_QWORD *)a2 + 9), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 9) - *((_QWORD *)a2 + 8)) >> 3));
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 13) = 0;
  std::vector<ClipperLib::DoublePoint>::__init_with_size[abi:ne180100]<ClipperLib::DoublePoint*,ClipperLib::DoublePoint*>((_QWORD *)this + 11, *((const void **)a2 + 11), *((_QWORD *)a2 + 12), (uint64_t)(*((_QWORD *)a2 + 12) - *((_QWORD *)a2 + 11)) >> 4);
  v4 = *((_OWORD *)a2 + 9);
  v5 = *((_OWORD *)a2 + 10);
  v6 = *((_QWORD *)a2 + 22);
  v8 = *((_OWORD *)a2 + 7);
  v7 = *((_OWORD *)a2 + 8);
  *((_QWORD *)this + 24) = 0;
  *((_OWORD *)this + 9) = v4;
  *((_OWORD *)this + 10) = v5;
  *((_OWORD *)this + 7) = v8;
  *((_OWORD *)this + 8) = v7;
  *((_QWORD *)this + 22) = v6;
  *((_QWORD *)this + 23) = &unk_250FA0FB8;
  *((_QWORD *)this + 25) = 0;
  *((_QWORD *)this + 26) = 0;
  std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>((_QWORD *)this + 24, *((const void **)a2 + 24), *((_QWORD *)a2 + 25), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 25) - *((_QWORD *)a2 + 24)) >> 3));
  *((_QWORD *)this + 27) = 0;
  *((_QWORD *)this + 28) = 0;
  *((_QWORD *)this + 29) = 0;
  std::vector<ClipperLib::PolyNode *>::__init_with_size[abi:ne180100]<ClipperLib::PolyNode **,ClipperLib::PolyNode **>((_QWORD *)this + 27, *((const void **)a2 + 27), *((_QWORD *)a2 + 28), (uint64_t)(*((_QWORD *)a2 + 28) - *((_QWORD *)a2 + 27)) >> 3);
  v9 = *((_OWORD *)a2 + 15);
  *((_QWORD *)this + 32) = *((_QWORD *)a2 + 32);
  *((_OWORD *)this + 15) = v9;
  return this;
}

void sub_23F0E6BE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  _QWORD *v2;
  void **v3;
  void **v4;
  void **v5;
  void **v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  va_list va;

  va_start(va, a2);
  v8 = *v6;
  if (*v6)
  {
    v2[25] = v8;
    operator delete(v8);
  }
  v9 = *v5;
  if (*v5)
  {
    v2[12] = v9;
    operator delete(v9);
  }
  v10 = *v4;
  if (*v4)
  {
    v2[9] = v10;
    operator delete(v10);
  }
  v11 = *v3;
  if (*v3)
  {
    v2[6] = v11;
    operator delete(v11);
  }
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<std::vector<ClipperLib::IntPoint>>::__init_with_size[abi:ne180100]<std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>((uint64_t)(v6 + 2), a2, a3, (_QWORD *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_23F0E6CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*,std::vector<ClipperLib::IntPoint>*>(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v4, *(const void **)v6, *(_QWORD *)(v6 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) >> 3));
      v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_23F0E6D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::vector<ClipperLib::IntPoint>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  if (v1 != v2)
  {
    v3 = **(_QWORD **)(a1 + 16);
    do
    {
      v5 = *(void **)(v3 - 24);
      v3 -= 24;
      v4 = v5;
      if (v5)
      {
        *(_QWORD *)(v1 - 16) = v4;
        operator delete(v4);
      }
      v1 = v3;
    }
    while (v3 != v2);
  }
}

_QWORD *std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_23F0E6E74(_Unwind_Exception *exception_object)
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

_QWORD *std::vector<ClipperLib::DoublePoint>::__init_with_size[abi:ne180100]<ClipperLib::DoublePoint*,ClipperLib::DoublePoint*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<ClipperLib::DoublePoint>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_23F0E6EEC(_Unwind_Exception *exception_object)
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

char *std::vector<ClipperLib::DoublePoint>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

void ClipperLib::PolyNode::~PolyNode(ClipperLib::PolyNode *this)
{
  ClipperLib::PolyNode::~PolyNode(this);
  JUMPOUT(0x242665874);
}

{
  void *v2;
  void *v3;

  *(_QWORD *)this = &unk_250FA0FB8;
  v2 = (void *)*((_QWORD *)this + 4);
  if (v2)
  {
    *((_QWORD *)this + 5) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 1);
  if (v3)
  {
    *((_QWORD *)this + 2) = v3;
    operator delete(v3);
  }
}

_QWORD *std::vector<ClipperLib::PolyNode *>::__init_with_size[abi:ne180100]<ClipperLib::PolyNode **,ClipperLib::PolyNode **>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<ClipperLib::TEdge *>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_23F0E7000(_Unwind_Exception *exception_object)
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

id itk_dataFromCGImage(CGImage *a1, void *a2, void *a3)
{
  __CFString *v5;
  const __CFDictionary *v6;
  __CFData *v7;
  CGImageDestination *v8;
  CGImageDestination *v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  v7 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v8 = CGImageDestinationCreateWithData(v7, v5, 1uLL, 0);
  if (!v8)
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v11)
      itk_dataFromCGImage_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_9;
  }
  v9 = v8;
  CGImageDestinationAddImage(v8, a1, v6);
  if (!CGImageDestinationFinalize(v9))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      itk_dataFromCGImage_cold_2((uint64_t)v5);
    CFRelease(v9);
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  CFRelease(v9);
  v10 = (void *)-[__CFData copy](v7, "copy");
LABEL_10:

  return v10;
}

void sub_23F0E9544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

CGImageRef itk_createResizedCGImage(CGImage *a1, size_t a2, size_t a3)
{
  size_t BitsPerComponent;
  size_t BytesPerRow;
  CGColorSpace *ColorSpace;
  uint32_t BitmapInfo;
  CGContext *v10;
  CGImageRef Image;
  CGRect v13;

  BitsPerComponent = CGImageGetBitsPerComponent(a1);
  BytesPerRow = CGImageGetBytesPerRow(a1);
  ColorSpace = CGImageGetColorSpace(a1);
  BitmapInfo = CGImageGetBitmapInfo(a1);
  v10 = CGBitmapContextCreate(0, a2, a3, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo);
  CGContextSetInterpolationQuality(v10, kCGInterpolationHigh);
  ITKRectWithSize();
  CGContextDrawImage(v10, v13, a1);
  Image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  return Image;
}

CGColorSpace *itk_newARGB8BitmapContextFromImage(CGImage *a1)
{
  size_t Width;
  size_t Height;
  CGColorSpace *result;

  Width = CGImageGetWidth(a1);
  Height = CGImageGetHeight(a1);
  result = CGImageGetColorSpace(a1);
  if (result)
    return CGBitmapContextCreate(0, Width, Height, 8uLL, 4 * Width, result, 2u);
  return result;
}

CVPixelBufferRef itk_pixelBufferFromCGImageWithAttributes(CGImage *a1, void *a2, CGColorSpace *a3)
{
  const __CFDictionary *v5;
  CGColorSpace *DeviceRGB;
  unint64_t Width;
  unint64_t Height;
  CVPixelBufferRef v9;
  void *BaseAddress;
  size_t BytesPerRow;
  CGContext *v13;
  CVPixelBufferRef pixelBufferOut;
  CGRect v15;

  v5 = a2;
  DeviceRGB = a3;
  if (!a3)
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  pixelBufferOut = 0;
  if (a1)
  {
    Width = CGImageGetWidth(a1);
    Height = CGImageGetHeight(a1);
    if (!CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], Width, Height, 0x42475241u, v5, &pixelBufferOut))
    {
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
      BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      v13 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
      v15.size.width = (double)Width;
      v15.size.height = (double)Height;
      v15.origin.x = 0.0;
      v15.origin.y = 0.0;
      CGContextDrawImage(v13, v15, a1);
      CGContextRelease(v13);
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
      if (a3)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  if (!a3)
LABEL_6:
    CGColorSpaceRelease(DeviceRGB);
LABEL_7:
  v9 = pixelBufferOut;

  return v9;
}

CVPixelBufferRef itk_ioSurfaceBackedPixelBufferFromCGImage(CGImage *a1, CGColorSpace *a2)
{
  CGColorSpace *DeviceRGB;
  uint64_t v5;
  void *v6;
  CVPixelBufferRef v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  DeviceRGB = a2;
  if (!a2)
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v5 = *MEMORY[0x24BDC55E8];
  v9[0] = *MEMORY[0x24BDC5668];
  v9[1] = v5;
  v10[0] = MEMORY[0x24BDBD1B8];
  v10[1] = MEMORY[0x24BDBD1C8];
  v9[2] = *MEMORY[0x24BDC55E0];
  v10[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = itk_pixelBufferFromCGImageWithAttributes(a1, v6, DeviceRGB);
  if (!a2)
    CGColorSpaceRelease(DeviceRGB);

  return v7;
}

CVPixelBufferRef itk_cgImageBackedPixelBufferFromCGImage(CGImage *a1, CGColorSpace *a2)
{
  CGColorSpace *DeviceRGB;
  CVPixelBufferRef v5;

  if (a2)
    return itk_pixelBufferFromCGImageWithAttributes(a1, 0, a2);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v5 = itk_pixelBufferFromCGImageWithAttributes(a1, 0, DeviceRGB);
  CGColorSpaceRelease(DeviceRGB);
  return v5;
}

__CVBuffer *itk_cgImageFromPixelBuffer(__CVBuffer *result)
{
  __CVBuffer *v1;
  void *v2;
  void *v3;
  CGImageRef imageOut;
  uint8_t buf[4];
  _BOOL4 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  imageOut = 0;
  if (result)
  {
    v1 = result;
    VTCreateCGImageFromCVPixelBuffer(result, 0, &imageOut);
    result = imageOut;
    if (!imageOut)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23F0DD000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "VT did not return a CGImage from a buffer, trying CI", buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BDBF660], "imageWithCVPixelBuffer:", v1);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF648]), "initWithOptions:", 0);
      CVPixelBufferGetHeight(v1);
      CVPixelBufferGetWidth(v1);
      ITKRectWithSize();
      imageOut = (CGImageRef)objc_msgSend(v3, "createCGImage:fromRect:", v2);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v6 = imageOut != 0;
        _os_log_impl(&dword_23F0DD000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "CGImage from CI has result: %d", buf, 8u);
      }

      return imageOut;
    }
  }
  return result;
}

id itk_pngDataFromCGImage(CGImage *a1)
{
  void *v2;
  void *v3;

  objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  itk_dataFromCGImage(a1, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void itk_cgImageCropZeroAlpha(CGImage *a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGColorSpace *v7;
  size_t Width;
  size_t Height;
  double v10;
  unsigned __int8 *Data;
  CGImage *Image;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned __int8 *v19;
  int v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void (**v26)(id, CGColorSpace *, double, double, double, double);
  CGRect v27;
  CGRect v28;

  v26 = a2;
  if (!a1)
    objc_msgSend(MEMORY[0x24BE51EB8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "imageRef", "void itk_cgImageCropZeroAlpha(CGImageRef _Nonnull, void (^ _Nonnull __strong)(CGImageRef _Nullable, CGRect))", 0, 0, CFSTR("Trying to crop a NULL image"));
  v4 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v7 = itk_newARGB8BitmapContextFromImage(a1);
  if (v7)
  {
    Width = CGImageGetWidth(a1);
    Height = CGImageGetHeight(a1);
    v10 = (double)Width;
    v27.size.height = (double)Height;
    v27.origin.x = 0.0;
    v27.origin.y = 0.0;
    v27.size.width = (double)Width;
    CGContextDrawImage(v7, v27, a1);
    Data = (unsigned __int8 *)CGBitmapContextGetData(v7);
    Image = CGBitmapContextCreateImage(v7);
    if (Data)
    {
      if (Height)
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = Height;
        v17 = Width;
        do
        {
          if (Width)
          {
            v18 = 0;
            v19 = Data;
            do
            {
              v21 = *v19;
              v19 += 4;
              v20 = v21;
              if (v17 >= v18)
                v22 = v18;
              else
                v22 = v17;
              if (v15 <= v18)
                v23 = v18;
              else
                v23 = v15;
              if (v16 >= v13)
                v24 = v13;
              else
                v24 = v16;
              if (v14 <= v13)
                v25 = v13;
              else
                v25 = v14;
              if (v20)
              {
                v17 = v22;
                v16 = v24;
                v15 = v23;
                v14 = v25;
              }
              ++v18;
            }
            while (Width != v18);
            Data += 4 * Width;
          }
          ++v13;
        }
        while (v13 != Height);
        v10 = (double)v17;
        Width = v17;
      }
      else
      {
        v16 = 0;
        v15 = 0;
        v14 = 0;
      }
      v3 = (double)v16;
      v5 = (double)(v15 - Width + 1);
      v6 = (double)(v14 - v16 + 1);
      v4 = v10;
    }
    CGContextRelease(v7);
    if (Image)
    {
      v28.origin.x = v4;
      v28.origin.y = v3;
      v28.size.width = v5;
      v28.size.height = v6;
      v7 = CGImageCreateWithImageInRect(Image, v28);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE51EB8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "context", "void itk_cgImageCropZeroAlpha(CGImageRef _Nonnull, void (^ _Nonnull __strong)(CGImageRef _Nullable, CGRect))", 0, 0, CFSTR("Couldn't create a bitmap context"));
    Image = 0;
  }
  CGImageRelease(Image);
  v26[2](v26, v7, v4, v3, v5, v6);
  CGImageRelease(v7);

}

BOOL itk_isPixelBufferTransparentAtPoint(__CVBuffer *a1, double a2, double a3, double a4)
{
  size_t v4;
  uint64_t v5;
  size_t BytesPerRow;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  _BOOL8 v14;

  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  LODWORD(v4) = llround(a2);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  if ((v4 & 0x80000000) != 0 || (LODWORD(v5) = llround(a3), (v5 & 0x80000000) != 0) || Width <= v4)
  {
    if (PixelFormatType == 1278226534)
      return 0;
LABEL_8:
    objc_msgSend(MEMORY[0x24BE51EB8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "BOOL itk_isPixelBufferTransparentAtPoint(CVPixelBufferRef _Nullable, CGPoint, CGFloat)", 0, 0, CFSTR("unsupported pixel format for itk_isPixelBufferTransparent"));
    return 0;
  }
  if (PixelFormatType != 1278226534)
    goto LABEL_8;
  if (Height <= v5)
    return 0;
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  v14 = *(float *)((char *)CVPixelBufferGetBaseAddress(a1) + 4 * v4 + BytesPerRow * v5) <= a4;
  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  return v14;
}

CGImageRef itk_createScaledCGImage(CGImage *a1, double a2)
{
  size_t v4;
  size_t v5;

  v4 = vcvtmd_u64_f64((double)CGImageGetWidth(a1) * a2);
  v5 = vcvtmd_u64_f64((double)CGImageGetHeight(a1) * a2);
  return itk_createResizedCGImage(a1, v4, v5);
}

double itk_sizeForPixelBuffer(__CVBuffer *a1)
{
  double Width;

  if (!a1)
    return *MEMORY[0x24BDBF148];
  Width = (double)CVPixelBufferGetWidth(a1);
  CVPixelBufferGetHeight(a1);
  return Width;
}

double itk_sizeForCGImage(CGImage *a1)
{
  double Width;

  if (!a1)
    return *MEMORY[0x24BDBF148];
  Width = (double)CGImageGetWidth(a1);
  CGImageGetHeight(a1);
  return Width;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void ClipperLib::PolyTree::Clear(ClipperLib::PolyTree *this)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  uint64_t v6;

  v2 = *((_QWORD *)this + 10);
  v3 = *((_QWORD *)this + 11);
  v4 = (char *)this + 80;
  if (v3 != v2)
  {
    v5 = 0;
    do
    {
      v6 = *(_QWORD *)(v2 + 8 * v5);
      if (v6)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
        v2 = *((_QWORD *)this + 10);
        v3 = *((_QWORD *)this + 11);
      }
      ++v5;
    }
    while (v5 < (v3 - v2) >> 3);
  }
  std::vector<ClipperLib::PolyNode *>::resize((uint64_t)v4, 0);
  std::vector<ClipperLib::PolyNode *>::resize((uint64_t)this + 32, 0);
}

void std::vector<ClipperLib::PolyNode *>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<ClipperLib::PolyNode *>::__append((void **)a1, a2 - v2);
  }
}

uint64_t ClipperLib::PolyTree::GetFirst(ClipperLib::PolyTree *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 4);
  if (v1 == *((_QWORD *)this + 5))
    return 0;
  else
    return *(_QWORD *)v1;
}

uint64_t ClipperLib::PolyTree::Total(ClipperLib::PolyTree *this)
{
  _QWORD *v2;
  uint64_t result;

  v2 = (_QWORD *)*((_QWORD *)this + 10);
  result = (*((_QWORD *)this + 11) - (_QWORD)v2) >> 3;
  if ((int)result >= 1)
    return result - (**((_QWORD **)this + 4) != *v2);
  return result;
}

double ClipperLib::PolyNode::PolyNode(ClipperLib::PolyNode *this)
{
  double result;

  *(_QWORD *)this = &unk_250FA0FB8;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 53) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)this = &unk_250FA0FB8;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 53) = 0u;
  return result;
}

uint64_t ClipperLib::PolyNode::ChildCount(ClipperLib::PolyNode *this)
{
  return (*((_QWORD *)this + 5) - *((_QWORD *)this + 4)) >> 3;
}

void ClipperLib::PolyNode::AddChild(ClipperLib::PolyNode *this, ClipperLib::PolyNode *a2)
{
  uint64_t v4;
  void **v5;
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;

  v4 = *((_QWORD *)this + 4);
  v6 = (_QWORD *)*((_QWORD *)this + 5);
  v5 = (void **)((char *)this + 32);
  v7 = (uint64_t)v6 - v4;
  v8 = (char *)this + 32;
  v11 = *((_QWORD *)v8 + 2);
  v9 = (uint64_t)(v8 + 16);
  v10 = v11;
  if ((unint64_t)v6 >= v11)
  {
    v13 = (v7 >> 3) + 1;
    if (v13 >> 61)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v14 = v10 - v4;
    v15 = v14 >> 2;
    if (v14 >> 2 <= v13)
      v15 = (v7 >> 3) + 1;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
      v16 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v16 = v15;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>(v9, v16);
    else
      v17 = 0;
    v18 = &v17[8 * (v7 >> 3)];
    v19 = &v17[8 * v16];
    *(_QWORD *)v18 = a2;
    v12 = v18 + 8;
    v21 = (char *)*((_QWORD *)this + 4);
    v20 = (char *)*((_QWORD *)this + 5);
    if (v20 != v21)
    {
      do
      {
        v22 = *((_QWORD *)v20 - 1);
        v20 -= 8;
        *((_QWORD *)v18 - 1) = v22;
        v18 -= 8;
      }
      while (v20 != v21);
      v20 = (char *)*v5;
    }
    *((_QWORD *)this + 4) = v18;
    *((_QWORD *)this + 5) = v12;
    *((_QWORD *)this + 6) = v19;
    if (v20)
      operator delete(v20);
  }
  else
  {
    *v6 = a2;
    v12 = v6 + 1;
  }
  *((_QWORD *)this + 5) = v12;
  *((_QWORD *)a2 + 7) = this;
  *((_DWORD *)a2 + 16) = (unint64_t)v7 >> 3;
}

uint64_t ClipperLib::PolyNode::GetNext(ClipperLib::PolyNode *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *((_QWORD *)this + 4);
  if (v1 == *((_QWORD *)this + 5))
  {
    do
    {
      v4 = *((_QWORD *)this + 7);
      if (!v4)
        return 0;
      v2 = *((unsigned int *)this + 16);
      v3 = *(_QWORD *)(v4 + 32);
      this = (ClipperLib::PolyNode *)*((_QWORD *)this + 7);
    }
    while (((*(_QWORD *)(v4 + 40) - v3) >> 3) - 1 == v2);
    v1 = v3 + 8 * (v2 + 1);
  }
  return *(_QWORD *)v1;
}

uint64_t ClipperLib::PolyNode::GetNextSiblingUp(ClipperLib::PolyNode *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  while (1)
  {
    v1 = *((_QWORD *)this + 7);
    if (!v1)
      break;
    v2 = *((unsigned int *)this + 16);
    v3 = *(_QWORD *)(v1 + 32);
    this = (ClipperLib::PolyNode *)*((_QWORD *)this + 7);
    if (((*(_QWORD *)(v1 + 40) - v3) >> 3) - 1 != v2)
      return *(_QWORD *)(v3 + 8 * (v2 + 1));
  }
  return 0;
}

uint64_t ClipperLib::PolyNode::IsHole(ClipperLib::PolyNode *this)
{
  int v1;
  char v2;

  v1 = 1;
  do
  {
    v2 = v1;
    this = (ClipperLib::PolyNode *)*((_QWORD *)this + 7);
    v1 ^= 1u;
  }
  while (this);
  return v2 & 1;
}

uint64_t ClipperLib::PolyNode::IsOpen(ClipperLib::PolyNode *this)
{
  return *((unsigned __int8 *)this + 68);
}

unint64_t ClipperLib::Int128Mul@<X0>(unint64_t this@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if ((this & 0x8000000000000000) == 0)
    v3 = this;
  else
    v3 = -(uint64_t)this;
  if (a2 >= 0)
    v4 = a2;
  else
    v4 = -a2;
  v5 = v4 * (unint64_t)v3;
  v6 = ((HIDWORD(v4) * (unint64_t)v3 + v4 * (unint64_t)HIDWORD(v3)) >> 32)
     + HIDWORD(v4) * (unint64_t)HIDWORD(v3);
  v7 = v4 * v3;
  *a3 = v7;
  a3[1] = v6;
  if (v7 < v5)
    a3[1] = ++v6;
  if (this >> 63 != (unint64_t)a2 >> 63)
  {
    v8 = -(uint64_t)v6;
    if (v7)
      v8 = ~v6;
    *a3 = -(uint64_t)v7;
    a3[1] = v8;
  }
  return this;
}

BOOL ClipperLib::Orientation(uint64_t *a1)
{
  return ClipperLib::Area(a1) >= 0.0;
}

double ClipperLib::Area(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;
  double result;
  uint64_t v4;
  int v5;
  uint64_t *v6;
  uint64_t *v7;
  double v8;
  uint64_t v9;

  v1 = *a1;
  v2 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  result = 0.0;
  if ((int)v2 >= 3)
  {
    v4 = 0;
    v5 = v2 - 1;
    v6 = (uint64_t *)(v1 + 8);
    do
    {
      v7 = (uint64_t *)(v1 + 24 * v5);
      v8 = (double)*v7 + (double)*(v6 - 1);
      v9 = *v6;
      v6 += 3;
      result = result + v8 * ((double)v7[1] - (double)v9);
      v5 = v4++;
    }
    while (-1431655765 * ((a1[1] - *a1) >> 3) != v4);
    return result * -0.5;
  }
  return result;
}

double ClipperLib::Area(_QWORD *a1)
{
  double result;
  _QWORD *v2;

  result = 0.0;
  if (a1)
  {
    v2 = a1;
    do
    {
      result = result
             + (double)(uint64_t)(v2[1] + *(_QWORD *)(v2[5] + 8))
             * (double)(uint64_t)(*(_QWORD *)(v2[5] + 16) - v2[2]);
      v2 = (_QWORD *)v2[4];
    }
    while (v2 != a1);
    return result * 0.5;
  }
  return result;
}

double ClipperLib::Area(uint64_t a1)
{
  _QWORD *v1;
  double v2;
  _QWORD *v3;

  v1 = *(_QWORD **)(a1 + 24);
  if (!v1)
    return 0.0;
  v2 = 0.0;
  v3 = *(_QWORD **)(a1 + 24);
  do
  {
    v2 = v2 + (double)(uint64_t)(v3[1] + *(_QWORD *)(v3[5] + 8)) * (double)(uint64_t)(*(_QWORD *)(v3[5] + 16) - v3[2]);
    v3 = (_QWORD *)v3[4];
  }
  while (v3 != v1);
  return v2 * 0.5;
}

uint64_t ClipperLib::PointIsVertex(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  BOOL v5;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = a2;
  do
  {
    v5 = v4[1] == v2 && v4[2] == v3;
    result = v5;
    if (v5)
      break;
    v4 = (_QWORD *)v4[4];
  }
  while (v4 != a2);
  return result;
}

uint64_t ClipperLib::PointInPolygon(_QWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  double v20;

  v2 = *(uint64_t **)a2;
  v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
  if (v3 < 3)
    return 0;
  result = 0;
  v6 = *v2;
  v7 = v2[1];
  v8 = 1;
  v11 = a1;
  v9 = *a1;
  v10 = v11[1];
  while (1)
  {
    v12 = v3 == v8 ? 0 : v8;
    v13 = &v2[3 * v12];
    v14 = *v13;
    v15 = v13[1];
    if (v15 == v10 && (v14 == v9 || v7 == v10 && v14 <= v9 != v6 < v9))
      return 0xFFFFFFFFLL;
    if (v7 >= v10 == v15 < v10)
    {
      v17 = __OFSUB__(v6, v9);
      v16 = v6 - v9 < 0;
      v18 = v6 - v9;
      if (v16 != v17)
      {
        v19 = v14 - v9;
        if (v14 <= v9)
          goto LABEL_22;
      }
      else
      {
        v19 = v14 - v9;
        if (v14 > v9)
        {
          result = (1 - result);
          goto LABEL_22;
        }
      }
      v20 = (double)v18 * (double)(v15 - v10) - (double)v19 * (double)(v7 - v10);
      if (v20 == 0.0)
        return 0xFFFFFFFFLL;
      if (v15 > v7 != v20 <= 0.0)
        result = (1 - result);
      else
        result = result;
    }
LABEL_22:
    ++v8;
    v6 = v14;
    v7 = v15;
    if (v8 > v3)
      return result;
  }
}

uint64_t ClipperLib::PointInPolygon(_QWORD *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  double v19;

  result = 0;
  v6 = a1;
  v4 = *a1;
  v5 = v6[1];
  v7 = a2;
  while (1)
  {
    v8 = v7;
    v7 = (_QWORD *)v7[4];
    v9 = v7[2];
    if (v9 != v5)
    {
      v11 = v8[2];
LABEL_9:
      if (v9 < v5 != v11 >= v5)
        goto LABEL_21;
      goto LABEL_10;
    }
    v10 = v7[1];
    if (v10 == v4)
      return 0xFFFFFFFFLL;
    v11 = v8[2];
    if (v11 != v5)
      goto LABEL_9;
    if (v10 <= v4 != v8[1] < v4)
      return 0xFFFFFFFFLL;
    v11 = v5;
    if (v9 >= v5)
      goto LABEL_21;
LABEL_10:
    v12 = v8[1];
    v13 = v7[1];
    v15 = __OFSUB__(v12, v4);
    v14 = v12 - v4 < 0;
    v16 = v12 - v4;
    if (v14 == v15)
      break;
    v15 = __OFSUB__(v13, v4);
    v17 = v13 == v4;
    v14 = v13 - v4 < 0;
    v18 = v13 - v4;
    if (!(v14 ^ v15 | v17))
      goto LABEL_17;
LABEL_21:
    if (v7 == a2)
      return result;
  }
  v15 = __OFSUB__(v13, v4);
  v17 = v13 == v4;
  v14 = v13 - v4 < 0;
  v18 = v13 - v4;
  if (!(v14 ^ v15 | v17))
  {
    result = (1 - result);
    goto LABEL_21;
  }
LABEL_17:
  v19 = (double)v16 * (double)(v9 - v5) - (double)v18 * (double)(v11 - v5);
  if (v19 != 0.0)
  {
    if (v9 > v11 != v19 <= 0.0)
      result = (1 - result);
    else
      result = result;
    goto LABEL_21;
  }
  return 0xFFFFFFFFLL;
}

BOOL ClipperLib::Poly2ContainsPoly1(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  int v5;

  v4 = a1;
  while (1)
  {
    v5 = ClipperLib::PointInPolygon((_QWORD *)(v4 + 8), a2);
    if ((v5 & 0x80000000) == 0)
      break;
    v4 = *(_QWORD *)(v4 + 32);
    if (v4 == a1)
      return 1;
  }
  return v5 != 0;
}

BOOL ClipperLib::SlopesEqual(_QWORD *a1, _QWORD *a2, int a3)
{
  unint64_t v7[2];
  unint64_t v8[2];

  if (a3)
  {
    ClipperLib::Int128Mul(a1[7] - a1[1], a2[6] - *a2, v8);
    ClipperLib::Int128Mul(a1[6] - *a1, a2[7] - a2[1], v7);
    return v8[1] == v7[1] && v8[0] == v7[0];
  }
  else
  {
    return (a2[6] - *a2) * (a1[7] - a1[1]) == (a2[7] - a2[1]) * (a1[6] - *a1);
  }
}

BOOL ClipperLib::SlopesEqual(_QWORD *a1, uint64_t *a2, _QWORD *a3, int a4)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v10[2];
  unint64_t v11[2];

  if (a4)
  {
    v7 = *a2;
    v6 = a2[1];
    ClipperLib::Int128Mul(a1[1] - v6, *a2 - *a3, v11);
    ClipperLib::Int128Mul(*a1 - v7, v6 - a3[1], v10);
    return v11[1] == v10[1] && v11[0] == v10[0];
  }
  else
  {
    return (*a2 - *a3) * (a1[1] - a2[1]) == (a2[1] - a3[1]) * (*a1 - *a2);
  }
}

BOOL ClipperLib::SlopesEqual(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, int a5)
{
  unint64_t v11[2];
  unint64_t v12[2];

  if (a5)
  {
    ClipperLib::Int128Mul(a1[1] - a2[1], *a3 - *a4, v12);
    ClipperLib::Int128Mul(*a1 - *a2, a3[1] - a4[1], v11);
    return v12[1] == v11[1] && v12[0] == v11[0];
  }
  else
  {
    return (*a3 - *a4) * (a1[1] - a2[1]) == (a3[1] - a4[1]) * (*a1 - *a2);
  }
}

uint64_t ClipperLib::IntersectPoint(uint64_t result, uint64_t a2, uint64_t *a3)
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;

  a3[2] = 0xBF800000BF800000;
  v3 = *(double *)(result + 72);
  v4 = *(double *)(a2 + 72);
  if (v3 == v4)
  {
    v5 = *(_QWORD *)(result + 32);
    a3[1] = v5;
    if (*(_QWORD *)(result + 56) != v5)
    {
      v11 = v3 * (double)(v5 - *(_QWORD *)(result + 8));
      v12 = 0.5;
      if (v11 < 0.0)
        v12 = -0.5;
      v6 = *(_QWORD *)result + (uint64_t)(v11 + v12);
      goto LABEL_55;
    }
    goto LABEL_3;
  }
  if (v3 == 0.0)
  {
    v7 = *(_QWORD *)result;
    *a3 = *(_QWORD *)result;
    v8 = *(_QWORD *)(a2 + 8);
    if (v4 != -1.0e40)
    {
      v9 = (double)v8 - (double)*(uint64_t *)a2 / v4;
      v10 = (double)v7 / v4;
LABEL_13:
      v14 = v10 + v9;
      v15 = 0.5;
      if (v14 < 0.0)
        v15 = -0.5;
      v8 = (uint64_t)(v14 + v15);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (v4 == 0.0)
  {
    v13 = *(_QWORD *)a2;
    *a3 = *(_QWORD *)a2;
    v8 = *(_QWORD *)(result + 8);
    if (v3 != -1.0e40)
    {
      v9 = (double)v8 - (double)*(uint64_t *)result / v3;
      v10 = (double)v13 / v3;
      goto LABEL_13;
    }
LABEL_16:
    a3[1] = v8;
    goto LABEL_17;
  }
  v20 = (double)*(uint64_t *)result - (double)*(uint64_t *)(result + 8) * v3;
  v21 = (double)*(uint64_t *)a2 - (double)*(uint64_t *)(a2 + 8) * v4;
  v22 = (v21 - v20) / (v3 - v4);
  if (v22 >= 0.0)
    v23 = 0.5;
  else
    v23 = -0.5;
  v8 = (uint64_t)(v22 + v23);
  v24 = v21 + v4 * v22;
  v25 = v20 + v3 * v22;
  if (fabs(v3) >= fabs(v4))
    v25 = v24;
  if (v25 >= 0.0)
    v26 = 0.5;
  else
    v26 = -0.5;
  *a3 = (uint64_t)(v25 + v26);
  a3[1] = v8;
LABEL_17:
  v16 = *(_QWORD *)(result + 56);
  v17 = *(_QWORD *)(a2 + 56);
  if (v8 < v16 || v8 < v17)
  {
    if (v16 <= v17)
      v8 = *(_QWORD *)(a2 + 56);
    else
      v8 = *(_QWORD *)(result + 56);
    a3[1] = v8;
    if (fabs(v3) >= fabs(v4))
    {
      if (*(_QWORD *)(a2 + 56) == v8)
      {
        v19 = *(_QWORD *)(a2 + 48);
        goto LABEL_44;
      }
      v27 = *(_QWORD *)a2;
      v28 = v4 * (double)(v8 - *(_QWORD *)(a2 + 8));
    }
    else
    {
      if (*(_QWORD *)(result + 56) == v8)
      {
        v19 = *(_QWORD *)(result + 48);
LABEL_44:
        *a3 = v19;
        goto LABEL_45;
      }
      v27 = *(_QWORD *)result;
      v28 = v3 * (double)(v8 - *(_QWORD *)(result + 8));
    }
    v29 = 0.5;
    if (v28 < 0.0)
      v29 = -0.5;
    v19 = v27 + (uint64_t)(v28 + v29);
    goto LABEL_44;
  }
LABEL_45:
  v30 = *(_QWORD *)(result + 32);
  if (v8 <= v30)
    return result;
  a3[1] = v30;
  if (fabs(v3) > fabs(v4))
  {
    if (*(_QWORD *)(a2 + 56) == v30)
    {
      v6 = *(_QWORD *)(a2 + 48);
      goto LABEL_55;
    }
    v31 = *(_QWORD *)a2;
    v32 = v4 * (double)(v30 - *(_QWORD *)(a2 + 8));
LABEL_52:
    v33 = 0.5;
    if (v32 < 0.0)
      v33 = -0.5;
    v6 = v31 + (uint64_t)(v32 + v33);
    goto LABEL_55;
  }
  if (*(_QWORD *)(result + 56) != v30)
  {
    v31 = *(_QWORD *)result;
    v32 = v3 * (double)(v30 - *(_QWORD *)(result + 8));
    goto LABEL_52;
  }
LABEL_3:
  v6 = *(_QWORD *)(result + 48);
LABEL_55:
  *a3 = v6;
  return result;
}

int8x16_t ClipperLib::ReversePolyPtLinks(__n128 *a1)
{
  __n128 *v1;
  int8x16_t result;

  if (a1)
  {
    v1 = a1;
    do
    {
      result = (int8x16_t)v1[2];
      v1[2] = (__n128)vextq_s8(result, result, 8uLL);
      v1 = (__n128 *)result.i64[0];
    }
    while ((__n128 *)result.i64[0] != a1);
  }
  return result;
}

_QWORD *ClipperLib::DisposeOutPts(_QWORD *result)
{
  _QWORD **v1;

  if (*result)
  {
    v1 = (_QWORD **)result;
    *(_QWORD *)(*(_QWORD *)(*result + 40) + 32) = 0;
    while (1)
    {
      result = *v1;
      if (!*v1)
        break;
      *v1 = (_QWORD *)result[4];
      MEMORY[0x242665874]();
    }
  }
  return result;
}

uint64_t ClipperLib::InitEdge2(uint64_t result, int a2)
{
  _OWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;

  v2 = (_OWORD *)(result + 24);
  v3 = *(_QWORD *)(result + 104);
  if (*(_QWORD *)(result + 32) >= *(_QWORD *)(v3 + 32))
  {
    *(_OWORD *)result = *v2;
    *(_QWORD *)(result + 16) = *(_QWORD *)(result + 40);
    v5 = *(_QWORD *)(v3 + 40);
    *(_OWORD *)(result + 48) = *(_OWORD *)(v3 + 24);
    *(_QWORD *)(result + 64) = v5;
  }
  else
  {
    *(_OWORD *)(result + 48) = *v2;
    *(_QWORD *)(result + 64) = *(_QWORD *)(result + 40);
    v4 = *(_QWORD *)(v3 + 40);
    *(_OWORD *)result = *(_OWORD *)(v3 + 24);
    *(_QWORD *)(result + 16) = v4;
  }
  v6 = *(_QWORD *)(result + 56) - *(_QWORD *)(result + 8);
  if (v6)
    v7 = (double)(uint64_t)(*(_QWORD *)(result + 48) - *(_QWORD *)result) / (double)v6;
  else
    v7 = -1.0e40;
  *(double *)(result + 72) = v7;
  *(_DWORD *)(result + 80) = a2;
  return result;
}

uint64_t ClipperLib::RemoveEdge(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(v1 + 104) = *(_QWORD *)(a1 + 104);
  v2 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(v2 + 112) = v1;
  *(_QWORD *)(a1 + 112) = 0;
  return v2;
}

__n128 ClipperLib::SwapPoints(__n128 *a1, __n128 *a2)
{
  unint64_t v2;
  __n128 result;
  unint64_t v4;

  v2 = a1[1].n128_u64[0];
  result = *a1;
  v4 = a2[1].n128_u64[0];
  *a1 = *a2;
  a1[1].n128_u64[0] = v4;
  *a2 = result;
  a2[1].n128_u64[0] = v2;
  return result;
}

BOOL ClipperLib::GetOverlapSegment(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  _QWORD *v17;
  __int128 v18;
  _QWORD *v19;
  __int128 v20;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  _QWORD *v29;
  __int128 v30;
  _QWORD *v31;
  __int128 v32;

  v6 = a1[1];
  v7 = a2[1];
  v8 = *a1 - *a2;
  if (v8 < 0)
    v8 = *a2 - *a1;
  v9 = v6 - v7;
  if (v6 - v7 < 0)
    v9 = v7 - v6;
  if (v8 <= v9)
  {
    if (v6 < v7)
    {
      v22 = a1[2];
      v23 = *(_OWORD *)a1;
      v24 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v24;
      *(_OWORD *)a2 = v23;
      a2[2] = v22;
    }
    v25 = a3[1];
    if (v25 < a4[1])
    {
      v26 = a3[2];
      v27 = *(_OWORD *)a3;
      v28 = a4[2];
      *(_OWORD *)a3 = *(_OWORD *)a4;
      a3[2] = v28;
      *(_OWORD *)a4 = v27;
      a4[2] = v26;
      v25 = a3[1];
    }
    if (a1[1] >= v25)
      v29 = a3;
    else
      v29 = a1;
    v30 = *(_OWORD *)v29;
    *(_QWORD *)(a5 + 16) = v29[2];
    *(_OWORD *)a5 = v30;
    if (a2[1] <= a4[1])
      v31 = a4;
    else
      v31 = a2;
    v32 = *(_OWORD *)v31;
    *(_QWORD *)(a6 + 16) = v31[2];
    *(_OWORD *)a6 = v32;
    return *(_QWORD *)(a5 + 8) > *(_QWORD *)(a6 + 8);
  }
  else
  {
    if (*a1 > *a2)
    {
      v10 = a1[2];
      v11 = *(_OWORD *)a1;
      v12 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v12;
      *(_OWORD *)a2 = v11;
      a2[2] = v10;
    }
    v13 = *a3;
    if (*a3 > *a4)
    {
      v14 = a3[2];
      v15 = *(_OWORD *)a3;
      v16 = a4[2];
      *(_OWORD *)a3 = *(_OWORD *)a4;
      a3[2] = v16;
      *(_OWORD *)a4 = v15;
      a4[2] = v14;
      v13 = *a3;
    }
    if (*a1 <= v13)
      v17 = a3;
    else
      v17 = a1;
    v18 = *(_OWORD *)v17;
    *(_QWORD *)(a5 + 16) = v17[2];
    *(_OWORD *)a5 = v18;
    if (*a2 >= *a4)
      v19 = a4;
    else
      v19 = a2;
    v20 = *(_OWORD *)v19;
    *(_QWORD *)(a6 + 16) = v19[2];
    *(_OWORD *)a6 = v20;
    return *(_QWORD *)a5 < *(_QWORD *)a6;
  }
}

uint64_t ClipperLib::FirstIsBottomPt(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  double v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  double v26;
  double v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _QWORD *v42;
  _BOOL4 v43;

  v2 = *(_QWORD *)(result + 8);
  v3 = *(_QWORD *)(result + 16);
  v4 = (_QWORD *)result;
  do
  {
    v4 = (_QWORD *)v4[5];
    v5 = v4[1];
    v6 = v4[2];
  }
  while (v4 != (_QWORD *)result && v5 == v2 && v6 == v3);
  v9 = v6 - v3;
  if (v9)
    v10 = (double)(v5 - v2) / (double)v9;
  else
    v10 = -1.0e40;
  v11 = (_QWORD *)result;
  do
  {
    v11 = (_QWORD *)v11[4];
    v12 = v11[1];
    v13 = v11[2];
  }
  while (v11 != (_QWORD *)result && v12 == v2 && v13 == v3);
  v16 = v13 - v3;
  if (v16)
    v17 = (double)(v12 - v2) / (double)v16;
  else
    v17 = -1.0e40;
  v18 = fabs(v10);
  v19 = a2[1];
  v20 = a2[2];
  v21 = a2;
  do
  {
    v21 = (_QWORD *)v21[5];
    v22 = v21[1];
    v23 = v21[2];
  }
  while (v21 != a2 && v22 == v19 && v23 == v20);
  if (v23 == v20)
    v26 = -1.0e40;
  else
    v26 = (double)(v22 - v19) / (double)(v23 - v20);
  v27 = fabs(v17);
  v28 = a2;
  do
  {
    v28 = (_QWORD *)v28[4];
    v29 = v28[1];
    v30 = v28[2];
  }
  while (v28 != a2 && v29 == v19 && v30 == v20);
  v33 = fabs(v26);
  v34 = v30 - v20;
  if (v34)
    v35 = (double)(v29 - v19) / (double)v34;
  else
    v35 = -1.0e40;
  v36 = fabs(v35);
  if (v18 >= v27)
    v37 = v18;
  else
    v37 = v27;
  if (v33 >= v36)
    v38 = v33;
  else
    v38 = v36;
  if (v37 == v38 && (v27 >= v18 ? (v39 = v18) : (v39 = v27), v36 >= v33 ? (v40 = v33) : (v40 = v36), v39 == v40))
  {
    if (result)
    {
      v41 = 0.0;
      v42 = (_QWORD *)result;
      do
      {
        v41 = v41
            + (double)(uint64_t)(v42[1] + *(_QWORD *)(v42[5] + 8))
            * (double)(uint64_t)(*(_QWORD *)(v42[5] + 16) - v42[2]);
        v42 = (_QWORD *)v42[4];
      }
      while (v42 != (_QWORD *)result);
      return v41 * 0.5 > 0.0;
    }
  }
  else
  {
    v43 = v27 >= v33;
    if (v27 < v36)
      v43 = 0;
    return v18 >= v33 && v18 >= v36 || v43;
  }
  return result;
}

uint64_t ClipperLib::GetBottomPt(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = (uint64_t)a1;
  v2 = (_QWORD *)a1[4];
  if (v2 == a1)
    return v1;
  v3 = 0;
  do
  {
    v4 = v2[2];
    v5 = *(_QWORD *)(v1 + 16);
    if (v4 > v5)
    {
LABEL_4:
      v3 = 0;
      v1 = (uint64_t)v2;
      goto LABEL_11;
    }
    if (v4 == v5)
    {
      v6 = v2[1];
      v7 = *(_QWORD *)(v1 + 8);
      if (v6 <= v7)
      {
        if (v6 < v7)
          goto LABEL_4;
        if (v2[4] != v1 && v2[5] != v1)
          v3 = v2;
      }
    }
LABEL_11:
    v2 = (_QWORD *)v2[4];
  }
  while (v2 != (_QWORD *)v1);
  if (!v3 || v3 == (_QWORD *)v1)
    return v1;
  v8 = (_QWORD *)v1;
  do
  {
    if (!ClipperLib::FirstIsBottomPt(v1, v3))
      v8 = v3;
    do
      v3 = (_QWORD *)v3[4];
    while (v3[1] != v8[1] || v3[2] != v8[2]);
  }
  while (v3 != (_QWORD *)v1);
  return (uint64_t)v8;
}

uint64_t ClipperLib::Pt2IsBetweenPt1AndPt3(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  unsigned int v12;
  unsigned int v13;

  v3 = *a1;
  v4 = a1[1];
  v5 = *a3;
  v6 = a3[1];
  if (*a1 == *a3 && v4 == v6)
    return 0;
  v8 = *a2;
  v9 = a2[1];
  if (v3 == *a2 && v4 == v9)
    return 0;
  if (v5 == v8 && v6 == v9)
    return 0;
  v12 = (v9 <= v4) ^ (v9 < v6);
  v13 = (v8 <= v3) ^ (v8 < v5);
  if (v3 == v5)
    return v12;
  else
    return v13;
}

BOOL ClipperLib::HorzSegmentsOverlap(ClipperLib *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  ClipperLib *v4;
  ClipperLib *v5;
  uint64_t v6;
  uint64_t v7;

  if ((uint64_t)this >= a2)
    v4 = (ClipperLib *)a2;
  else
    v4 = this;
  if ((uint64_t)this <= a2)
    v5 = (ClipperLib *)a2;
  else
    v5 = this;
  if (a3 >= a4)
    v6 = a4;
  else
    v6 = a3;
  if (a3 <= a4)
    v7 = a4;
  else
    v7 = a3;
  return (uint64_t)v4 < v7 && v6 < (uint64_t)v5;
}

double ClipperLib::ClipperBase::ClipperBase(ClipperLib::ClipperBase *this)
{
  double result;

  *(_QWORD *)this = &off_250FA1220;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 14) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_BYTE *)this + 40) = 0;
  return result;
}

{
  double result;

  *(_QWORD *)this = &off_250FA1220;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 14) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_BYTE *)this + 40) = 0;
  return result;
}

void ClipperLib::ClipperBase::~ClipperBase(ClipperLib::ClipperBase *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  *(_QWORD *)this = &off_250FA1220;
  ClipperLib::ClipperBase::Clear(this);
  v2 = (void *)*((_QWORD *)this + 14);
  if (v2)
  {
    *((_QWORD *)this + 15) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 10);
  if (v3)
  {
    *((_QWORD *)this + 11) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 6);
  if (v4)
  {
    *((_QWORD *)this + 7) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 2);
  if (v5)
  {
    *((_QWORD *)this + 3) = v5;
    operator delete(v5);
  }
}

{
  ClipperLib::ClipperBase::~ClipperBase(this);
  JUMPOUT(0x242665874);
}

uint64_t *ClipperLib::RangeTest(uint64_t *result, _BYTE *a2)
{
  uint64_t v2;
  BOOL v5;
  ClipperLib::clipperException *exception;

  v2 = *result;
  if (!*a2)
  {
    if (v2 <= 0x3FFFFFFF && v2 >= -1073741823 && (unint64_t)(result[1] - 0x40000000) >= 0xFFFFFFFF80000001)
      return result;
    *a2 = 1;
  }
  if (v2 > 0x3FFFFFFFFFFFFFFFLL
    || (v2 >= (uint64_t)0xC000000000000001
      ? (v5 = (unint64_t)(result[1] - 0x4000000000000000) > 0x8000000000000000)
      : (v5 = 0),
        !v5))
  {
    exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
    ClipperLib::clipperException::clipperException(exception, "Coordinate outside allowed range");
  }
  return result;
}

void sub_23F0EC6A8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ClipperLib::FindNextLocMin(uint64_t result)
{
  uint64_t v1;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  while (1)
  {
    while (1)
    {
      v1 = *(_QWORD *)(result + 112);
      if (*(_QWORD *)result == *(_QWORD *)v1
        && *(_QWORD *)(result + 8) == *(_QWORD *)(v1 + 8)
        && (*(_QWORD *)(result + 24) != *(_QWORD *)(result + 48) || *(_QWORD *)(result + 32) != *(_QWORD *)(result + 56)))
      {
        break;
      }
      result = *(_QWORD *)(result + 104);
    }
    if (*(double *)(result + 72) != -1.0e40 && *(double *)(v1 + 72) != -1.0e40)
      break;
    v4 = result;
    do
    {
      v5 = v4;
      v4 = *(_QWORD *)(v4 + 112);
    }
    while (*(double *)(v4 + 72) == -1.0e40);
    v6 = v4;
    result = v5;
    if (*(double *)(v5 + 72) == -1.0e40)
    {
      result = v5;
      do
        result = *(_QWORD *)(result + 104);
      while (*(double *)(result + 72) == -1.0e40);
      v6 = *(_QWORD *)(result + 112);
    }
    if (*(_QWORD *)(result + 56) != *(_QWORD *)(v6 + 8))
    {
      if (*(_QWORD *)v4 < *(_QWORD *)result)
        return v5;
      return result;
    }
  }
  return result;
}

uint64_t ClipperLib::ClipperBase::ProcessBound(_QWORD *a1, uint64_t *a2, int a3, __n128 a4)
{
  double *v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  double *v25;
  double *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  double *v35;
  double *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  __int128 v53;

  if (*((_DWORD *)a2 + 25) == -2)
  {
    v5 = (double *)a2;
    if ((a3 & 1) != 0)
    {
      do
      {
        v6 = v5;
        v7 = *((_QWORD *)v5 + 7);
        v5 = (double *)*((_QWORD *)v5 + 13);
      }
      while (v7 == *((_QWORD *)v5 + 1));
      if (v6 == (double *)a2)
        goto LABEL_27;
      a4.n128_u64[0] = 0xC83D6329F1C35CA5;
      while (v6[9] == -1.0e40)
      {
        v6 = (double *)*((_QWORD *)v6 + 14);
        if (v6 == (double *)a2)
          goto LABEL_27;
      }
    }
    else
    {
      do
      {
        v6 = v5;
        v8 = *((_QWORD *)v5 + 7);
        v5 = (double *)*((_QWORD *)v5 + 14);
      }
      while (v8 == *((_QWORD *)v5 + 1));
      if (v6 == (double *)a2)
        goto LABEL_27;
      a4.n128_u64[0] = 0xC83D6329F1C35CA5;
      while (v6[9] == -1.0e40)
      {
        v6 = (double *)*((_QWORD *)v6 + 13);
        if (v6 == (double *)a2)
          goto LABEL_27;
      }
    }
    if (v6 != (double *)a2)
    {
      v13 = 14;
      if (a3)
        v13 = 13;
      v14 = a2[v13];
      v15 = *(_QWORD *)(v14 + 8);
      *(_DWORD *)(v14 + 88) = 0;
      v16 = ClipperLib::ClipperBase::ProcessBound(a1, v14, a4);
      v17 = a1[4];
      v18 = (_QWORD *)a1[3];
      if ((unint64_t)v18 >= v17)
      {
        v43 = a1[2];
        v44 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v18 - v43) >> 3);
        v45 = v44 + 1;
        if (v44 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
        v46 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17 - v43) >> 3);
        if (2 * v46 > v45)
          v45 = 2 * v46;
        if (v46 >= 0x555555555555555)
          v47 = 0xAAAAAAAAAAAAAAALL;
        else
          v47 = v45;
        if (v47)
          v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)(a1 + 4), v47);
        else
          v48 = 0;
        v49 = &v48[24 * v44];
        v50 = &v48[24 * v47];
        *(_QWORD *)v49 = v15;
        *((_QWORD *)v49 + 1) = 0;
        *((_QWORD *)v49 + 2) = v14;
        v19 = v49 + 24;
        v52 = (char *)a1[2];
        v51 = (char *)a1[3];
        if (v51 != v52)
        {
          do
          {
            v53 = *(_OWORD *)(v51 - 24);
            *((_QWORD *)v49 - 1) = *((_QWORD *)v51 - 1);
            *(_OWORD *)(v49 - 24) = v53;
            v49 -= 24;
            v51 -= 24;
          }
          while (v51 != v52);
          v51 = (char *)a1[2];
        }
        a1[2] = v49;
        a1[3] = v19;
        a1[4] = v50;
        if (v51)
          operator delete(v51);
      }
      else
      {
        *v18 = v15;
        v18[1] = 0;
        v19 = v18 + 3;
        v18[2] = v14;
      }
      a1[3] = v19;
      return v16;
    }
LABEL_27:
    if (a3)
      return a2[13];
    else
      return a2[14];
  }
  if (*((double *)a2 + 9) == -1.0e40)
  {
    v9 = 13;
    if (a3)
      v9 = 14;
    v10 = (double *)a2[v9];
    v11 = *v10;
    v12 = *(double *)a2;
    if (v10[9] == -1.0e40)
    {
      if (*(_QWORD *)&v11 == *(_QWORD *)&v12 || *((_QWORD *)v10 + 6) == *(_QWORD *)&v12)
        goto LABEL_32;
      goto LABEL_31;
    }
    if (*(_QWORD *)&v11 != *(_QWORD *)&v12)
    {
LABEL_31:
      v20 = a2[6];
      *((double *)a2 + 6) = v12;
      *a2 = v20;
      v21 = a2[8];
      a2[8] = a2[2];
      a2[2] = v21;
    }
  }
LABEL_32:
  v22 = a2;
  if ((a3 & 1) != 0)
  {
    do
    {
      v23 = v22;
      v24 = v22[7];
      v22 = (uint64_t *)v22[13];
    }
    while (v24 == v22[1] && *((_DWORD *)v22 + 25) != -2);
    if (*((double *)v23 + 9) == -1.0e40 && *((_DWORD *)v22 + 25) != -2)
    {
      v25 = (double *)v23;
      do
        v25 = (double *)*((_QWORD *)v25 + 14);
      while (v25[9] == -1.0e40);
      if (*((_QWORD *)v25 + 6) > v22[6])
        v23 = (uint64_t *)v25;
    }
    if (v23 != a2)
    {
      v26 = (double *)a2;
      do
      {
        v27 = (uint64_t *)*((_QWORD *)v26 + 13);
        *((_QWORD *)v26 + 15) = v27;
        if (v26 != (double *)a2 && v26[9] == -1.0e40 && *(_QWORD *)v26 != *(_QWORD *)(*((_QWORD *)v26 + 14) + 48))
        {
          v28 = *((_QWORD *)v26 + 6);
          v26[6] = *v26;
          *(_QWORD *)v26 = v28;
          v29 = *((_QWORD *)v26 + 8);
          v26[8] = v26[2];
          *((_QWORD *)v26 + 2) = v29;
        }
        v26 = (double *)v27;
      }
      while (v27 != v23);
      if (v23 != a2 && *((double *)v23 + 9) == -1.0e40 && *v23 != *(_QWORD *)(v23[14] + 48))
      {
        v30 = v23[6];
        v23[6] = *v23;
        *v23 = v30;
        v31 = v23[8];
        v23[8] = v23[2];
        v23[2] = v31;
      }
    }
    v32 = v23 + 13;
  }
  else
  {
    do
    {
      v33 = v22;
      v34 = v22[7];
      v22 = (uint64_t *)v22[14];
    }
    while (v34 == v22[1] && *((_DWORD *)v22 + 25) != -2);
    if (*((double *)v33 + 9) == -1.0e40 && *((_DWORD *)v22 + 25) != -2)
    {
      v35 = (double *)v33;
      do
        v35 = (double *)*((_QWORD *)v35 + 13);
      while (v35[9] == -1.0e40);
      if (*((_QWORD *)v35 + 6) >= v22[6])
        v33 = (uint64_t *)v35;
    }
    if (v33 != a2)
    {
      v36 = (double *)a2;
      do
      {
        v37 = (uint64_t *)*((_QWORD *)v36 + 14);
        *((_QWORD *)v36 + 15) = v37;
        if (v36 != (double *)a2 && v36[9] == -1.0e40 && *(_QWORD *)v36 != *(_QWORD *)(*((_QWORD *)v36 + 13) + 48))
        {
          v38 = *((_QWORD *)v36 + 6);
          v36[6] = *v36;
          *(_QWORD *)v36 = v38;
          v39 = *((_QWORD *)v36 + 8);
          v36[8] = v36[2];
          *((_QWORD *)v36 + 2) = v39;
        }
        v36 = (double *)v37;
      }
      while (v37 != v33);
      if (v33 != a2 && *((double *)v33 + 9) == -1.0e40 && *v33 != *(_QWORD *)(v33[13] + 48))
      {
        v40 = v33[6];
        v33[6] = *v33;
        *v33 = v40;
        v41 = v33[8];
        v33[8] = v33[2];
        v33[2] = v41;
      }
    }
    v32 = v33 + 14;
  }
  return *v32;
}

uint64_t ClipperLib::ClipperBase::AddPath(uint64_t a1, uint64_t **a2, int a3, int a4)
{
  uint64_t *v6;
  int v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  int64x2_t *v14;
  int64x2_t v16;
  int32x2_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  __int128 *v47;
  uint64_t v49;
  _BOOL4 v50;
  char IsBetweenPt1AndPt3;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t NextLocMin;
  __n128 v80;
  uint64_t v81;
  char **v82;
  uint64_t v83;
  double v84;
  double v85;
  uint64_t v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  __n128 v90;
  uint64_t v91;
  __n128 v92;
  unint64_t v93;
  _QWORD *v94;
  _QWORD *v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  char *v100;
  char *v101;
  char *v102;
  char *v103;
  char *v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD *i;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  _QWORD *v114;
  _QWORD *v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  char *v121;
  char *v122;
  char *v123;
  char *v124;
  char *v125;
  __int128 v126;
  unint64_t v127;
  uint64_t *v128;
  _QWORD *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  char *v135;
  char *v136;
  char *v137;
  char *v138;
  char *v139;
  uint64_t v140;
  ClipperLib::clipperException *exception;
  uint64_t v144;
  _BYTE *v145;
  __int128 v147;
  uint64_t v148;
  __int128 v149;
  uint64_t v150;
  __int128 v151;
  uint64_t v152;
  __int128 v153;
  uint64_t v154;
  __int128 v155;
  uint64_t v156;
  __int128 v157;
  uint64_t v158;

  if (a3 == 1 && (a4 & 1) == 0)
  {
    exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
    ClipperLib::clipperException::clipperException(exception, "AddPath: Open paths must be subject.");
  }
  v6 = *a2;
  v7 = -1431655765 * ((unint64_t)((char *)a2[1] - (char *)*a2) >> 3);
  v8 = v7 - 1;
  if (a4 && v7 >= 2)
  {
    do
    {
      v9 = &v6[3 * --v7];
      v11 = *v9;
      v10 = v9[1];
      if (v11 != *v6 || v10 != v6[1])
      {
        v8 = v7;
        goto LABEL_12;
      }
    }
    while (v7 > 1);
    v8 = 0;
  }
LABEL_12:
  v13 = v8 & (v8 >> 31);
  v14 = (int64x2_t *)&v6[3 * v8];
  while (1)
  {
    _VF = __OFSUB__(v8--, 1);
    if (v8 < 0 != _VF)
      break;
    v16 = *v14;
    v14 = (int64x2_t *)((char *)v14 - 24);
    v17 = vmovn_s64(vceqq_s64(v16, *(int64x2_t *)&v6[3 * v8]));
    if ((v17.i32[0] & v17.i32[1] & 1) == 0)
    {
      v13 = v8 + 1;
      break;
    }
  }
  if (v13 <= a4)
    return 0;
  v18 = v13 + 1;
  is_mul_ok(v18, 0xA0uLL);
  v19 = operator new[]();
  v20 = v19;
  if (v13 != -1)
  {
    __asm { FMOV            V0.2S, #-1.0 }
    v24 = (_QWORD *)v19;
    do
    {
      *v24 = 0;
      v24[1] = 0;
      v24[2] = _D0;
      v24[3] = 0;
      v24[4] = 0;
      v24[5] = _D0;
      v24[6] = 0;
      v24[7] = 0;
      v24[8] = _D0;
      v24 += 20;
    }
    while (v24 != (_QWORD *)(v19 + 160 * (int)v18));
  }
  v25 = *a2;
  v26 = (*a2)[5];
  *(_OWORD *)(v20 + 184) = *(_OWORD *)(*a2 + 3);
  *(_QWORD *)(v20 + 200) = v26;
  v144 = v20;
  ClipperLib::RangeTest(v25, (_BYTE *)(a1 + 40));
  ClipperLib::RangeTest(&(*a2)[3 * v13], (_BYTE *)(a1 + 40));
  v145 = (_BYTE *)(a1 + 40);
  v27 = *a2;
  v28 = v20 + 160 * v13;
  *(_OWORD *)(v20 + 96) = 0u;
  *(_OWORD *)(v20 + 112) = 0u;
  *(_OWORD *)v20 = 0u;
  *(_OWORD *)(v20 + 16) = 0u;
  *(_OWORD *)(v20 + 32) = 0u;
  *(_OWORD *)(v20 + 48) = 0u;
  *(_OWORD *)(v20 + 64) = 0u;
  *(_OWORD *)(v20 + 80) = 0u;
  *(_OWORD *)(v20 + 128) = 0u;
  *(_OWORD *)(v20 + 144) = 0u;
  *(_QWORD *)(v20 + 104) = v20 + 160;
  *(_QWORD *)(v20 + 112) = v28;
  v29 = *(_OWORD *)v27;
  *(_QWORD *)(v20 + 40) = v27[2];
  *(_OWORD *)(v20 + 24) = v29;
  *(_DWORD *)(v20 + 100) = -1;
  v30 = (v13 - 1);
  v31 = &v27[3 * v13];
  *(_OWORD *)(v28 + 96) = 0u;
  *(_OWORD *)(v28 + 112) = 0u;
  *(_OWORD *)v28 = 0u;
  *(_OWORD *)(v28 + 16) = 0u;
  *(_OWORD *)(v28 + 32) = 0u;
  *(_OWORD *)(v28 + 48) = 0u;
  *(_OWORD *)(v28 + 64) = 0u;
  *(_OWORD *)(v28 + 80) = 0u;
  *(_OWORD *)(v28 + 128) = 0u;
  *(_OWORD *)(v28 + 144) = 0u;
  *(_QWORD *)(v28 + 104) = v20;
  *(_QWORD *)(v28 + 112) = v20 + 160 * (int)v30;
  v32 = v31[2];
  *(_OWORD *)(v28 + 24) = *(_OWORD *)v31;
  *(_QWORD *)(v28 + 40) = v32;
  v33 = (_QWORD *)v20;
  v34 = (_QWORD *)v20;
  *(_DWORD *)(v28 + 100) = -1;
  if (v13 >= 2)
  {
    v35 = v30 + 1;
    v36 = v20 + 160 * v30 + 160;
    v37 = 3 * (v13 - 1);
    do
    {
      ClipperLib::RangeTest(&v27[v37], v145);
      v27 = *a2;
      v38 = (uint64_t)&(*a2)[v37];
      *(_OWORD *)(v36 - 144) = 0u;
      *(_OWORD *)(v36 - 128) = 0u;
      *(_OWORD *)(v36 - 112) = 0u;
      *(_OWORD *)(v36 - 96) = 0u;
      *(_OWORD *)(v36 - 80) = 0u;
      *(_OWORD *)(v36 - 64) = 0u;
      *(_OWORD *)(v36 - 48) = 0u;
      *(_OWORD *)(v36 - 32) = 0u;
      *(_OWORD *)(v36 - 160) = 0u;
      *(_OWORD *)(v36 - 16) = 0u;
      *(_QWORD *)(v36 - 56) = v36;
      *(_QWORD *)(v36 - 48) = v20 + 160 * (v35 - 2);
      v39 = *(_OWORD *)v38;
      *(_QWORD *)(v36 - 120) = *(_QWORD *)(v38 + 16);
      *(_OWORD *)(v36 - 136) = v39;
      *(_DWORD *)(v36 - 60) = -1;
      --v35;
      v37 -= 3;
      v36 -= 160;
    }
    while (v35 > 1);
    v33 = (_QWORD *)v20;
    v34 = (_QWORD *)v20;
  }
LABEL_24:
  while (2)
  {
    v40 = v34[3];
    v41 = v34[4];
    v42 = v34;
    v43 = a4;
    while (1)
    {
      v44 = v40;
      v45 = v41;
      v46 = (_QWORD *)v42[13];
      v47 = (__int128 *)(v46 + 3);
      v40 = v46[3];
      v41 = v46[4];
      if (v44 == v40 && v45 == v41)
        break;
      v49 = v42[14];
      if ((_QWORD *)v49 == v46)
        goto LABEL_52;
      if (!v43)
      {
        if (v46 != v34)
          goto LABEL_42;
        v42 = v34;
LABEL_56:
        if (v42 == (_QWORD *)v42[13])
          goto LABEL_66;
        *(_BYTE *)(a1 + 73) = 1;
        *(_DWORD *)(v33[14] + 100) = -2;
        goto LABEL_58;
      }
      v157 = *(_OWORD *)(v49 + 24);
      v158 = *(_QWORD *)(v49 + 40);
      v155 = *(_OWORD *)(v42 + 3);
      v156 = v42[5];
      v153 = *v47;
      v154 = v46[5];
      v50 = ClipperLib::SlopesEqual(&v157, (uint64_t *)&v155, &v153, *v145);
      v43 = a4;
      if (v50)
      {
        if (!*(_BYTE *)(a1 + 72))
          goto LABEL_48;
        v151 = *(_OWORD *)(v49 + 24);
        v152 = *(_QWORD *)(v49 + 40);
        v149 = *(_OWORD *)(v42 + 3);
        v150 = v42[5];
        v147 = *v47;
        v148 = v46[5];
        IsBetweenPt1AndPt3 = ClipperLib::Pt2IsBetweenPt1AndPt3((uint64_t *)&v151, (uint64_t *)&v149, (uint64_t *)&v147);
        v43 = a4;
        if ((IsBetweenPt1AndPt3 & 1) == 0)
        {
LABEL_48:
          if (v42 == v33)
            v33 = v46;
          *(_QWORD *)(v49 + 104) = v46;
          v53 = v42[13];
          *(_QWORD *)(v53 + 112) = v49;
          v42[14] = 0;
          v34 = *(_QWORD **)(v53 + 112);
          goto LABEL_24;
        }
      }
LABEL_38:
      if (v46 == v34)
      {
        v42 = v34;
        goto LABEL_52;
      }
      v42 = v46;
      if ((v43 & 1) == 0)
      {
LABEL_42:
        v42 = v46;
        if ((_QWORD *)v46[13] == v33)
          goto LABEL_56;
      }
    }
    if ((v43 & 1) == 0 && v46 == v33)
    {
      if ((_QWORD *)v42[14] == v33)
        goto LABEL_56;
      goto LABEL_38;
    }
    if (v42 != v46)
    {
      if (v42 == v33)
        v33 = (_QWORD *)v42[13];
      v52 = v42[14];
      *(_QWORD *)(v52 + 104) = v46;
      v34 = (_QWORD *)v42[13];
      v34[14] = v52;
      v42[14] = 0;
      continue;
    }
    break;
  }
LABEL_52:
  if ((v43 & 1) == 0)
    goto LABEL_56;
  if (v42[14] != v42[13])
  {
LABEL_58:
    v54 = 1;
    v55 = (uint64_t)v33;
    do
    {
      while (1)
      {
        ClipperLib::InitEdge2(v55, a3);
        v55 = *(_QWORD *)(v55 + 104);
        if (v54)
          break;
        v54 = 0;
        if ((_QWORD *)v55 == v33)
          goto LABEL_68;
      }
      v56 = *(_QWORD *)(v55 + 32);
      v57 = v33[4];
      v54 = v56 == v57;
    }
    while ((_QWORD *)v55 != v33);
    if (v56 == v57)
    {
      if (a4)
        goto LABEL_66;
      v107 = v33[14];
      *(_DWORD *)(v107 + 100) = -2;
      v108 = v33[1];
      *(_QWORD *)((char *)v33 + 84) = 2;
      for (i = v33; ; i = (_QWORD *)v112)
      {
        if (*i != *(_QWORD *)(v107 + 48))
        {
          v110 = i[6];
          i[6] = *i;
          *i = v110;
          v111 = i[8];
          i[8] = i[2];
          i[2] = v111;
        }
        v112 = i[13];
        if (*(_DWORD *)(v112 + 100) == -2)
          break;
        i[15] = v112;
        v107 = *(_QWORD *)(v112 + 112);
      }
      v113 = *(_QWORD *)(a1 + 32);
      v114 = *(_QWORD **)(a1 + 24);
      if ((unint64_t)v114 >= v113)
      {
        v116 = *(_QWORD *)(a1 + 16);
        v117 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v114 - v116) >> 3);
        v118 = v117 + 1;
        if (v117 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
        v119 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v113 - v116) >> 3);
        if (2 * v119 > v118)
          v118 = 2 * v119;
        if (v119 >= 0x555555555555555)
          v120 = 0xAAAAAAAAAAAAAAALL;
        else
          v120 = v118;
        if (v120)
          v121 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(a1 + 32, v120);
        else
          v121 = 0;
        v122 = &v121[24 * v117];
        v123 = &v121[24 * v120];
        *(_QWORD *)v122 = v108;
        *((_QWORD *)v122 + 1) = 0;
        *((_QWORD *)v122 + 2) = v33;
        v115 = v122 + 24;
        v125 = *(char **)(a1 + 16);
        v124 = *(char **)(a1 + 24);
        if (v124 != v125)
        {
          do
          {
            v126 = *(_OWORD *)(v124 - 24);
            *((_QWORD *)v122 - 1) = *((_QWORD *)v124 - 1);
            *(_OWORD *)(v122 - 24) = v126;
            v122 -= 24;
            v124 -= 24;
          }
          while (v124 != v125);
          v124 = *(char **)(a1 + 16);
        }
        *(_QWORD *)(a1 + 16) = v122;
        *(_QWORD *)(a1 + 24) = v115;
        *(_QWORD *)(a1 + 32) = v123;
        if (v124)
          operator delete(v124);
      }
      else
      {
        *v114 = v108;
        v114[1] = 0;
        v115 = v114 + 3;
        v114[2] = v33;
      }
      v127 = *(_QWORD *)(a1 + 64);
      *(_QWORD *)(a1 + 24) = v115;
      v128 = *(uint64_t **)(a1 + 56);
      if ((unint64_t)v128 >= v127)
      {
        v130 = *(_QWORD *)(a1 + 48);
        v131 = ((uint64_t)v128 - v130) >> 3;
        if ((unint64_t)(v131 + 1) >> 61)
          std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
        v132 = v127 - v130;
        v133 = v132 >> 2;
        if (v132 >> 2 <= (unint64_t)(v131 + 1))
          v133 = v131 + 1;
        if ((unint64_t)v132 >= 0x7FFFFFFFFFFFFFF8)
          v134 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v134 = v133;
        if (v134)
          v135 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>(a1 + 64, v134);
        else
          v135 = 0;
        v136 = &v135[8 * v131];
        v137 = &v135[8 * v134];
        *(_QWORD *)v136 = v144;
        v129 = v136 + 8;
        v139 = *(char **)(a1 + 48);
        v138 = *(char **)(a1 + 56);
        if (v138 != v139)
        {
          do
          {
            v140 = *((_QWORD *)v138 - 1);
            v138 -= 8;
            *((_QWORD *)v136 - 1) = v140;
            v136 -= 8;
          }
          while (v138 != v139);
          v138 = *(char **)(a1 + 48);
        }
        *(_QWORD *)(a1 + 48) = v136;
        *(_QWORD *)(a1 + 56) = v129;
        *(_QWORD *)(a1 + 64) = v137;
        if (v138)
          operator delete(v138);
      }
      else
      {
        *v128 = v144;
        v129 = v128 + 1;
      }
      *(_QWORD *)(a1 + 56) = v129;
    }
    else
    {
LABEL_68:
      v59 = *(_QWORD *)(a1 + 64);
      v60 = *(uint64_t **)(a1 + 56);
      if ((unint64_t)v60 >= v59)
      {
        v62 = *(_QWORD *)(a1 + 48);
        v63 = ((uint64_t)v60 - v62) >> 3;
        if ((unint64_t)(v63 + 1) >> 61)
          std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
        v64 = v59 - v62;
        v65 = v64 >> 2;
        if (v64 >> 2 <= (unint64_t)(v63 + 1))
          v65 = v63 + 1;
        if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF8)
          v66 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v66 = v65;
        if (v66)
          v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>(a1 + 64, v66);
        else
          v67 = 0;
        v68 = &v67[8 * v63];
        v69 = &v67[8 * v66];
        *(_QWORD *)v68 = v144;
        v61 = v68 + 8;
        v71 = *(char **)(a1 + 48);
        v70 = *(char **)(a1 + 56);
        if (v70 != v71)
        {
          do
          {
            v72 = *((_QWORD *)v70 - 1);
            v70 -= 8;
            *((_QWORD *)v68 - 1) = v72;
            v68 -= 8;
          }
          while (v70 != v71);
          v70 = *(char **)(a1 + 48);
        }
        *(_QWORD *)(a1 + 48) = v68;
        *(_QWORD *)(a1 + 56) = v61;
        *(_QWORD *)(a1 + 64) = v69;
        if (v70)
          operator delete(v70);
      }
      else
      {
        *v60 = v144;
        v61 = v60 + 1;
      }
      *(_QWORD *)(a1 + 56) = v61;
      v73 = (uint64_t *)v33[14];
      v74 = *v73;
      v75 = v73[1];
      v77 = v73[6];
      v76 = v73[7];
      if (v74 == v77 && v75 == v76)
        v33 = (_QWORD *)v33[13];
      NextLocMin = ClipperLib::FindNextLocMin((uint64_t)v33);
      v58 = 1;
      if (!NextLocMin)
        return v58;
      v81 = 0;
      v82 = (char **)(a1 + 16);
      do
      {
        if (!v81)
          v81 = NextLocMin;
        v83 = *(_QWORD *)(NextLocMin + 8);
        v84 = *(double *)(NextLocMin + 72);
        v85 = *(double *)(*(_QWORD *)(NextLocMin + 112) + 72);
        if (v84 < v85)
          v86 = NextLocMin;
        else
          v86 = *(_QWORD *)(NextLocMin + 112);
        if (v84 < v85)
          v87 = *(_QWORD *)(NextLocMin + 112);
        else
          v87 = NextLocMin;
        if ((a4 & 1) != 0)
        {
          if (*(_QWORD *)(v87 + 104) == v86)
          {
            *(_DWORD *)(v87 + 88) = -1;
            v88 = 1;
          }
          else
          {
            *(_DWORD *)(v87 + 88) = 1;
            v88 = -1;
          }
        }
        else
        {
          v88 = 0;
          *(_DWORD *)(v87 + 88) = 0;
        }
        *(_DWORD *)(v86 + 88) = v88;
        v89 = ClipperLib::ClipperBase::ProcessBound((_QWORD *)a1, (uint64_t *)v87, v84 >= v85, v80);
        if (*(_DWORD *)(v89 + 100) == -2)
          v89 = ClipperLib::ClipperBase::ProcessBound((_QWORD *)a1, (uint64_t *)v89, v84 >= v85, v90);
        v91 = ClipperLib::ClipperBase::ProcessBound((_QWORD *)a1, (uint64_t *)v86, v84 < v85, v90);
        if (*(_DWORD *)(v91 + 100) == -2)
          v91 = ClipperLib::ClipperBase::ProcessBound((_QWORD *)a1, (uint64_t *)v91, v84 < v85, v92);
        if (*(_DWORD *)(v87 + 100) == -2)
        {
          v87 = 0;
        }
        else if (*(_DWORD *)(v86 + 100) == -2)
        {
          v86 = 0;
        }
        v94 = *(_QWORD **)(a1 + 24);
        v93 = *(_QWORD *)(a1 + 32);
        if ((unint64_t)v94 >= v93)
        {
          v96 = 0xAAAAAAAAAAAAAAABLL * (((char *)v94 - *v82) >> 3);
          v97 = v96 + 1;
          if (v96 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
          v98 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v93 - (_QWORD)*v82) >> 3);
          if (2 * v98 > v97)
            v97 = 2 * v98;
          if (v98 >= 0x555555555555555)
            v99 = 0xAAAAAAAAAAAAAAALL;
          else
            v99 = v97;
          if (v99)
            v100 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(a1 + 32, v99);
          else
            v100 = 0;
          v101 = &v100[24 * v96];
          *(_QWORD *)v101 = v83;
          *((_QWORD *)v101 + 1) = v87;
          *((_QWORD *)v101 + 2) = v86;
          v103 = *(char **)(a1 + 16);
          v102 = *(char **)(a1 + 24);
          v104 = v101;
          if (v102 != v103)
          {
            do
            {
              v105 = *(_OWORD *)(v102 - 24);
              *((_QWORD *)v104 - 1) = *((_QWORD *)v102 - 1);
              *(_OWORD *)(v104 - 24) = v105;
              v104 -= 24;
              v102 -= 24;
            }
            while (v102 != v103);
            v102 = *v82;
          }
          v95 = v101 + 24;
          *(_QWORD *)(a1 + 16) = v104;
          *(_QWORD *)(a1 + 24) = v101 + 24;
          *(_QWORD *)(a1 + 32) = &v100[24 * v99];
          if (v102)
            operator delete(v102);
        }
        else
        {
          *v94 = v83;
          v94[1] = v87;
          v95 = v94 + 3;
          v94[2] = v86;
        }
        *(_QWORD *)(a1 + 24) = v95;
        if (v84 < v85)
          v106 = v91;
        else
          v106 = v89;
        NextLocMin = ClipperLib::FindNextLocMin(v106);
      }
      while (NextLocMin != v81);
    }
    return 1;
  }
LABEL_66:
  MEMORY[0x24266585C](v144, 0x1020C80A8A5F671);
  return 0;
}

void sub_23F0ED690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v10;

  __cxa_free_exception(v10);
  _Unwind_Resume(a1);
}

uint64_t ClipperLib::ClipperBase::AddPaths(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  unint64_t v10;
  int v11;

  v4 = *a2;
  if (a2[1] == *a2)
  {
    LOBYTE(v11) = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    do
    {
      v11 |= (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 16))(a1, v4 + v9, a3, a4);
      ++v10;
      v4 = *a2;
      v9 += 24;
    }
    while (v10 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
  return v11 & 1;
}

_QWORD *ClipperLib::ClipperBase::Clear(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = this;
  v2 = this[2];
  this[3] = v2;
  this[1] = v2;
  v4 = this[6];
  v3 = this[7];
  if (v3 == v4)
  {
    v4 = this[7];
  }
  else
  {
    v5 = 0;
    do
    {
      this = *(_QWORD **)(v4 + 8 * v5);
      if (this)
      {
        this = (_QWORD *)MEMORY[0x24266585C](this, 0x1020C80A8A5F671);
        v4 = v1[6];
        v3 = v1[7];
      }
      ++v5;
    }
    while (v5 < (v3 - v4) >> 3);
  }
  v1[7] = v4;
  *((_BYTE *)v1 + 40) = 0;
  *((_BYTE *)v1 + 73) = 0;
  return this;
}

_QWORD *ClipperLib::ClipperBase::DisposeLocalMinimaList(_QWORD *this)
{
  uint64_t v1;

  v1 = this[2];
  this[3] = v1;
  this[1] = v1;
  return this;
}

void ClipperLib::ClipperBase::Reset(ClipperLib::ClipperBase *this)
{
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v2 = *((_QWORD *)this + 2);
  v3 = (char *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 1) = v2;
  if ((char *)v2 != v3)
  {
    std::__introsort<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,false>(v2, v3, (uint64_t)&v8, 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v3[-v2] >> 3)), 1);
    v4 = (void *)*((_QWORD *)this + 14);
    if (v4)
    {
      *((_QWORD *)this + 15) = v4;
      operator delete(v4);
    }
    *((_QWORD *)this + 14) = 0;
    *((_QWORD *)this + 15) = 0;
    *((_QWORD *)this + 16) = 0;
    v5 = (uint64_t *)*((_QWORD *)this + 2);
    if (v5 != *((uint64_t **)this + 3))
    {
      do
      {
        v9 = *v5;
        std::priority_queue<long long>::push((uint64_t)this + 112, &v9);
        v6 = v5[1];
        if (v6)
        {
          *(_OWORD *)(v6 + 24) = *(_OWORD *)v6;
          *(_QWORD *)(v6 + 40) = *(_QWORD *)(v6 + 16);
          *(_DWORD *)(v6 + 84) = 1;
          *(_DWORD *)(v6 + 100) = -1;
        }
        v7 = v5[2];
        if (v7)
        {
          *(_OWORD *)(v7 + 24) = *(_OWORD *)v7;
          *(_QWORD *)(v7 + 40) = *(_QWORD *)(v7 + 16);
          *(_DWORD *)(v7 + 84) = 2;
          *(_DWORD *)(v7 + 100) = -1;
        }
        v5 += 3;
      }
      while (v5 != *((uint64_t **)this + 3));
      v5 = (uint64_t *)*((_QWORD *)this + 2);
    }
    *((_QWORD *)this + 13) = 0;
    *((_QWORD *)this + 1) = v5;
  }
}

void ClipperLib::ClipperBase::InsertScanbeam(ClipperLib::ClipperBase *this, uint64_t a2)
{
  uint64_t v2;

  v2 = a2;
  std::priority_queue<long long>::push((uint64_t)this + 112, &v2);
}

uint64_t ClipperLib::ClipperBase::PopLocalMinima(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;

  v3 = *(_QWORD **)(a1 + 8);
  if (v3 == *(_QWORD **)(a1 + 24) || *v3 != a2)
    return 0;
  *a3 = v3;
  *(_QWORD *)(a1 + 8) += 24;
  return 1;
}

double ClipperLib::ClipperBase::GetBounds@<D0>(ClipperLib::ClipperBase *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  double result;

  v2 = *((_QWORD *)this + 2);
  v3 = *((_QWORD *)this + 3);
  if (v2 == v3)
  {
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    v4 = *(uint64_t **)(v2 + 8);
    v6 = *v4;
    v5 = v4[1];
    *(_QWORD *)a2 = v6;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
    v7 = v6;
    v8 = v5;
    do
    {
      v9 = *(uint64_t **)(v2 + 8);
      v10 = *(uint64_t **)(v2 + 16);
      if (v5 <= v9[1])
        v5 = v9[1];
      *(_QWORD *)(a2 + 24) = v5;
      v11 = v9;
      do
      {
        v12 = (uint64_t *)v11[15];
        if (v12)
        {
          v13 = v11;
          do
          {
            v14 = *v13;
            v13 = v12;
            if (v14 < v6)
            {
              *(_QWORD *)a2 = v14;
              v6 = v14;
            }
            if (v14 > v7)
            {
              *(_QWORD *)(a2 + 16) = v14;
              v7 = v14;
            }
            v12 = (uint64_t *)v12[15];
          }
          while (v12);
        }
        else
        {
          v13 = v11;
        }
        if (*v13 < v6)
          v6 = *v13;
        *(_QWORD *)a2 = v6;
        if (v7 <= *v13)
          v7 = *v13;
        *(_QWORD *)(a2 + 16) = v7;
        if (v13[6] < v6)
          v6 = v13[6];
        *(_QWORD *)a2 = v6;
        if (v7 <= v13[6])
          v7 = v13[6];
        *(_QWORD *)(a2 + 16) = v7;
        v15 = v13[7];
        if (v15 < v8)
          v8 = v15;
        *(_QWORD *)(a2 + 8) = v8;
        v16 = v11 == v9;
        v11 = v10;
      }
      while (v16);
      v2 += 24;
    }
    while (v2 != v3);
  }
  return result;
}

void std::priority_queue<long long>::push(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a1 + 16;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD **)(a1 + 8);
  if ((unint64_t)v6 >= v5)
  {
    v8 = *(_QWORD **)a1;
    v9 = ((uint64_t)v6 - *(_QWORD *)a1) >> 3;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v11 = v5 - (_QWORD)v8;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>(v4, v12);
      v8 = *(_QWORD **)a1;
      v6 = *(_QWORD **)(a1 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = *a2;
    v7 = v14 + 8;
    while (v6 != v8)
    {
      v16 = *--v6;
      *((_QWORD *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(_QWORD *)a1 = v14;
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v15;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *v6 = *a2;
    v7 = v6 + 1;
  }
  *(_QWORD *)(a1 + 8) = v7;
  v17 = *(_QWORD **)a1;
  v18 = (uint64_t)v7 - *(_QWORD *)a1;
  if (v18 >= 9)
  {
    v19 = (((unint64_t)v18 >> 3) - 2) >> 1;
    v20 = &v17[v19];
    v23 = *(v7 - 1);
    v22 = v7 - 1;
    v21 = v23;
    v24 = *v20;
    if (*v20 < v23)
    {
      do
      {
        *v22 = v24;
        v22 = v20;
        if (!v19)
          break;
        v19 = (v19 - 1) >> 1;
        v20 = &v17[v19];
        v24 = *v20;
      }
      while (*v20 < v21);
      *v22 = v21;
    }
  }
}

BOOL ClipperLib::ClipperBase::PopScanbeam(ClipperLib::ClipperBase *this, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v2 = (uint64_t *)*((_QWORD *)this + 14);
  v3 = (uint64_t *)*((_QWORD *)this + 15);
  if (v2 != v3)
  {
    *a2 = *v2;
    v4 = (char *)v3 - (char *)v2;
    if ((char *)v3 - (char *)v2 >= 9)
    {
      v5 = 0;
      v6 = v4 >> 3;
      v7 = *v2;
      v8 = (unint64_t)((v4 >> 3) - 2) >> 1;
      v9 = v2;
      do
      {
        v10 = &v9[v5 + 1];
        v11 = (2 * v5) | 1;
        v5 = 2 * v5 + 2;
        if (v5 >= v6)
        {
          v12 = *v10;
          v5 = v11;
        }
        else
        {
          v12 = *v10;
          v13 = v10[1];
          if (*v10 <= v13)
            v12 = v10[1];
          if (*v10 >= v13)
            v5 = v11;
          else
            ++v10;
        }
        *v9 = v12;
        v9 = v10;
      }
      while (v5 <= v8);
      v14 = v3 - 1;
      if (v10 == v3 - 1)
      {
        *v10 = v7;
      }
      else
      {
        *v10 = *v14;
        *v14 = v7;
        v15 = (char *)v10 - (char *)v2 + 8;
        if (v15 >= 9)
        {
          v16 = (((unint64_t)v15 >> 3) - 2) >> 1;
          v17 = &v2[v16];
          v18 = *v17;
          v19 = *v10;
          if (*v17 < *v10)
          {
            do
            {
              *v10 = v18;
              v10 = v17;
              if (!v16)
                break;
              v16 = (v16 - 1) >> 1;
              v17 = &v2[v16];
              v18 = *v17;
            }
            while (*v17 < v19);
            *v10 = v19;
          }
        }
      }
    }
    v20 = v3 - 1;
    if (v2 == v3 - 1)
    {
LABEL_40:
      v21 = v2;
    }
    else
    {
      v21 = v3;
      while (1)
      {
        v22 = v21;
        v21 = v20;
        v23 = *a2;
        if (*a2 != *v2)
          break;
        v24 = (char *)v20 - (char *)v2;
        if ((char *)v21 - (char *)v2 >= 9)
        {
          v25 = 0;
          v26 = v24 >> 3;
          v27 = (unint64_t)((v24 >> 3) - 2) >> 1;
          v28 = v2;
          do
          {
            v29 = &v28[v25 + 1];
            v30 = (2 * v25) | 1;
            v25 = 2 * v25 + 2;
            if (v25 >= v26)
            {
              v31 = *v29;
              v25 = v30;
            }
            else
            {
              v31 = *v29;
              v32 = v29[1];
              if (*v29 <= v32)
                v31 = v29[1];
              if (*v29 >= v32)
                v25 = v30;
              else
                ++v29;
            }
            *v28 = v31;
            v28 = v29;
          }
          while (v25 <= v27);
          v33 = v22 - 2;
          if (v29 == v33)
          {
            *v29 = v23;
          }
          else
          {
            *v29 = *v33;
            *v33 = v23;
            v34 = (char *)v29 - (char *)v2 + 8;
            if (v34 >= 9)
            {
              v35 = (((unint64_t)v34 >> 3) - 2) >> 1;
              v36 = &v2[v35];
              v37 = *v36;
              v38 = *v29;
              if (*v36 < *v29)
              {
                do
                {
                  *v29 = v37;
                  v29 = v36;
                  if (!v35)
                    break;
                  v35 = (v35 - 1) >> 1;
                  v36 = &v2[v35];
                  v37 = *v36;
                }
                while (*v36 < v38);
                *v29 = v38;
              }
            }
          }
        }
        v20 = v21 - 1;
        if (v2 == v21 - 1)
          goto LABEL_40;
      }
    }
    *((_QWORD *)this + 15) = v21;
  }
  return v2 != v3;
}

ClipperLib::ClipperBase *ClipperLib::ClipperBase::DisposeAllOutRecs(ClipperLib::ClipperBase *this)
{
  ClipperLib::ClipperBase *v1;
  uint64_t v2;
  unint64_t v3;

  v1 = this;
  v2 = *((_QWORD *)this + 11);
  if (v2 != *((_QWORD *)this + 10))
  {
    v3 = 0;
    do
    {
      this = (ClipperLib::ClipperBase *)ClipperLib::ClipperBase::DisposeOutRec(v1, v3++);
      v2 = *((_QWORD *)v1 + 10);
    }
    while (v3 < (*((_QWORD *)v1 + 11) - v2) >> 3);
  }
  *((_QWORD *)v1 + 11) = v2;
  return this;
}

uint64_t ClipperLib::ClipperBase::DisposeOutRec(ClipperLib::ClipperBase *this, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(*((_QWORD *)this + 10) + 8 * a2);
  if (*(_QWORD *)(v4 + 24))
    ClipperLib::DisposeOutPts((_QWORD *)(v4 + 24));
  result = MEMORY[0x242665874](v4, 0x1020C401FC46325);
  *(_QWORD *)(*((_QWORD *)this + 10) + 8 * a2) = 0;
  return result;
}

uint64_t ClipperLib::ClipperBase::DeleteFromAEL(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(a2 + 128);
  v3 = *(_QWORD *)(a2 + 136);
  if (*(_OWORD *)(a2 + 128) == 0)
  {
    if (*(_QWORD *)(result + 104) != a2)
      return result;
    goto LABEL_5;
  }
  if (!v3)
  {
LABEL_5:
    v4 = (_QWORD *)(result + 104);
    goto LABEL_6;
  }
  v4 = (_QWORD *)(v3 + 128);
LABEL_6:
  *v4 = v2;
  if (v2)
    *(_QWORD *)(v2 + 136) = v3;
  *(_QWORD *)(a2 + 128) = 0;
  *(_QWORD *)(a2 + 136) = 0;
  return result;
}

uint64_t ClipperLib::ClipperBase::CreateOutRec(ClipperLib::ClipperBase *this)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v2 = operator new();
  v3 = *((_QWORD *)this + 12);
  *(_WORD *)(v2 + 4) = 0;
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  v4 = (uint64_t *)*((_QWORD *)this + 11);
  if ((unint64_t)v4 >= v3)
  {
    v6 = *((_QWORD *)this + 10);
    v7 = ((uint64_t)v4 - v6) >> 3;
    if ((unint64_t)(v7 + 1) >> 61)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v8 = v3 - v6;
    v9 = v8 >> 2;
    if (v8 >> 2 <= (unint64_t)(v7 + 1))
      v9 = v7 + 1;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v10 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v10 = v9;
    if (v10)
      v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>((uint64_t)this + 96, v10);
    else
      v11 = 0;
    v12 = (uint64_t *)&v11[8 * v7];
    v13 = &v11[8 * v10];
    *v12 = v2;
    v5 = v12 + 1;
    v15 = (char *)*((_QWORD *)this + 10);
    v14 = (char *)*((_QWORD *)this + 11);
    if (v14 != v15)
    {
      do
      {
        v16 = *((_QWORD *)v14 - 1);
        v14 -= 8;
        *--v12 = v16;
      }
      while (v14 != v15);
      v14 = (char *)*((_QWORD *)this + 10);
    }
    *((_QWORD *)this + 10) = v12;
    *((_QWORD *)this + 11) = v5;
    *((_QWORD *)this + 12) = v13;
    if (v14)
      operator delete(v14);
  }
  else
  {
    *v4 = v2;
    v5 = v4 + 1;
  }
  *((_QWORD *)this + 11) = v5;
  *(_DWORD *)v2 = (((unint64_t)v5 - *((_QWORD *)this + 10)) >> 3) - 1;
  return v2;
}

uint64_t ClipperLib::ClipperBase::SwapPositionsInAEL(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 128);
  v3 = *(_QWORD *)(a2 + 136);
  if (v4 != v3)
  {
    v6 = *(_QWORD *)(a3 + 128);
    v5 = *(_QWORD *)(a3 + 136);
    if (v6 != v5)
    {
      if (v4 == a3)
      {
        if (v6)
        {
          *(_QWORD *)(v6 + 136) = a2;
          v3 = *(_QWORD *)(a2 + 136);
        }
        if (v3)
          *(_QWORD *)(v3 + 128) = a3;
        *(_QWORD *)(a3 + 128) = a2;
        *(_QWORD *)(a3 + 136) = v3;
        *(_QWORD *)(a2 + 128) = v6;
        *(_QWORD *)(a2 + 136) = a3;
        v3 = *(_QWORD *)(a3 + 136);
      }
      else
      {
        if (v6 == a2)
        {
          if (v4)
          {
            *(_QWORD *)(v4 + 136) = a3;
            v5 = *(_QWORD *)(a3 + 136);
          }
          if (v5)
            *(_QWORD *)(v5 + 128) = a2;
          *(_QWORD *)(a2 + 128) = a3;
          *(_QWORD *)(a2 + 136) = v5;
          v3 = a2;
          *(_QWORD *)(a3 + 128) = v4;
          *(_QWORD *)(a3 + 136) = a2;
        }
        else
        {
          *(_QWORD *)(a2 + 128) = v6;
          if (v6)
          {
            *(_QWORD *)(v6 + 136) = a2;
            v5 = *(_QWORD *)(a3 + 136);
          }
          *(_QWORD *)(a2 + 136) = v5;
          if (v5)
            *(_QWORD *)(v5 + 128) = a2;
          *(_QWORD *)(a3 + 128) = v4;
          if (v4)
            *(_QWORD *)(v4 + 136) = a3;
          *(_QWORD *)(a3 + 136) = v3;
          if (v3)
            *(_QWORD *)(v3 + 128) = a3;
        }
        if (!*(_QWORD *)(a2 + 136))
          goto LABEL_26;
      }
      a2 = a3;
      if (v3)
        return result;
LABEL_26:
      *(_QWORD *)(result + 104) = a2;
    }
  }
  return result;
}

void ClipperLib::ClipperBase::UpdateEdgeIntoAEL(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  ClipperLib::clipperException *exception;
  uint64_t v10;

  v2 = *a2;
  v3 = *(_QWORD *)(*a2 + 120);
  if (!v3)
  {
    exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
    ClipperLib::clipperException::clipperException(exception, "UpdateEdgeIntoAEL: invalid call");
  }
  *(_DWORD *)(v3 + 100) = *(_DWORD *)(v2 + 100);
  v6 = v2 + 128;
  v5 = *(_QWORD *)(v2 + 128);
  v4 = *(_QWORD *)(v6 + 8);
  v7 = (_QWORD *)(a1 + 104);
  if (v4)
    v7 = (_QWORD *)(v4 + 128);
  *v7 = v3;
  if (v5)
    *(_QWORD *)(v5 + 136) = *(_QWORD *)(*a2 + 120);
  v8 = *(_QWORD *)(*a2 + 120);
  *(_OWORD *)(v8 + 84) = *(_OWORD *)(*a2 + 84);
  *a2 = v8;
  *(_OWORD *)(v8 + 24) = *(_OWORD *)v8;
  *(_QWORD *)(v8 + 40) = *(_QWORD *)(v8 + 16);
  *(_QWORD *)(*a2 + 136) = v4;
  *(_QWORD *)(*a2 + 128) = v5;
  if (*(double *)(*a2 + 72) != -1.0e40)
  {
    v10 = *(_QWORD *)(*a2 + 56);
    std::priority_queue<long long>::push(a1 + 112, &v10);
  }
}

void sub_23F0EE1C0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL ClipperLib::ClipperBase::LocalMinimaPending(ClipperLib::ClipperBase *this)
{
  return *((_QWORD *)this + 1) != *((_QWORD *)this + 3);
}

double ClipperLib::Clipper::Clipper(ClipperLib::Clipper *this, uint64_t *a2, char a3)
{
  uint64_t v3;
  double result;
  uint64_t v5;

  v3 = *a2;
  *(_QWORD *)this = *a2;
  *(_QWORD *)((char *)this + *(_QWORD *)(v3 - 24)) = a2[1];
  *((_QWORD *)this + 9) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  *((_QWORD *)this + 11) = (char *)this + 88;
  *((_QWORD *)this + 12) = (char *)this + 88;
  *((_QWORD *)this + 13) = 0;
  *((_BYTE *)this + 120) = 0;
  v5 = *(_QWORD *)this;
  *((_BYTE *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 40) = 0;
  *((_BYTE *)this + 132) = a3 & 1;
  *((_BYTE *)this + 134) = (a3 & 2) != 0;
  *((_BYTE *)this + *(_QWORD *)(v5 - 24) + 72) = (a3 & 4) != 0;
  *((_BYTE *)this + *(_QWORD *)(v5 - 24) + 73) = 0;
  *((_QWORD *)this + 17) = 0;
  return result;
}

double ClipperLib::Clipper::Clipper(ClipperLib::Clipper *this, char a2)
{
  double result;

  *((_QWORD *)this + 24) = 0;
  *((_QWORD *)this + 25) = 0;
  *((_QWORD *)this + 26) = 0;
  *((_QWORD *)this + 29) = 0;
  *((_QWORD *)this + 30) = 0;
  *((_QWORD *)this + 28) = 0;
  *((_QWORD *)this + 33) = 0;
  *((_QWORD *)this + 34) = 0;
  *((_QWORD *)this + 32) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *((_QWORD *)this + 11) = (char *)this + 88;
  *((_QWORD *)this + 12) = (char *)this + 88;
  *((_BYTE *)this + 132) = a2 & 1;
  *((_BYTE *)this + 134) = (a2 & 2) != 0;
  *(_QWORD *)this = &off_250FA1278;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 13) = 0;
  *((_BYTE *)this + 120) = 0;
  *((_BYTE *)this + 184) = 0;
  *((_BYTE *)this + 216) = (a2 & 4) != 0;
  *((_BYTE *)this + 217) = 0;
  *((_QWORD *)this + 17) = 0;
  *((_QWORD *)this + 18) = &unk_250FA12C0;
  return result;
}

uint64_t ClipperLib::Clipper::ZFillFunction(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 136) = a2;
  return result;
}

uint64_t ClipperLib::Clipper::Execute(uint64_t a1, int a2, uint64_t *a3, int a4)
{
  return ClipperLib::Clipper::Execute(a1, a2, a3, a4, a4);
}

uint64_t ClipperLib::Clipper::Execute(uint64_t a1, int a2, uint64_t *a3, int a4, int a5)
{
  uint64_t v5;
  ClipperLib::clipperException *exception;

  if (*(_BYTE *)(a1 + 120))
    return 0;
  if (*(_BYTE *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24) + 73))
  {
    exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
    ClipperLib::clipperException::clipperException(exception, "Error: PolyTree struct is needed for open path clipping.");
  }
  *(_BYTE *)(a1 + 120) = 1;
  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a3, 0);
  *(_DWORD *)(a1 + 124) = a5;
  *(_DWORD *)(a1 + 128) = a4;
  *(_DWORD *)(a1 + 80) = a2;
  *(_BYTE *)(a1 + 133) = 0;
  v5 = (**(uint64_t (***)(uint64_t))a1)(a1);
  if ((_DWORD)v5)
    ClipperLib::Clipper::BuildResult((uint64_t *)a1, a3);
  ClipperLib::ClipperBase::DisposeAllOutRecs((ClipperLib::ClipperBase *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24)));
  *(_BYTE *)(a1 + 120) = 0;
  return v5;
}

void sub_23F0EE3E4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ClipperLib::Clipper::Execute(uint64_t a1, int a2, ClipperLib::PolyTree *a3, int a4)
{
  return ClipperLib::Clipper::Execute(a1, a2, a3, a4, a4);
}

uint64_t ClipperLib::Clipper::Execute(uint64_t a1, int a2, ClipperLib::PolyTree *a3, int a4, int a5)
{
  uint64_t v5;

  if (*(_BYTE *)(a1 + 120))
    return 0;
  *(_BYTE *)(a1 + 120) = 1;
  *(_DWORD *)(a1 + 124) = a5;
  *(_DWORD *)(a1 + 128) = a4;
  *(_DWORD *)(a1 + 80) = a2;
  *(_BYTE *)(a1 + 133) = 1;
  v5 = (**(uint64_t (***)(uint64_t))a1)(a1);
  if ((_DWORD)v5)
    ClipperLib::Clipper::BuildResult2((ClipperLib::Clipper *)a1, a3);
  ClipperLib::ClipperBase::DisposeAllOutRecs((ClipperLib::ClipperBase *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24)));
  *(_BYTE *)(a1 + 120) = 0;
  return v5;
}

void std::vector<std::vector<ClipperLib::IntPoint>>::resize(uint64_t *a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a1[1];
  v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  v5 = a2 >= v4;
  v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<std::vector<ClipperLib::IntPoint>>::__append(a1, v6);
  }
  else if (!v5)
  {
    v7 = *a1 + 24 * a2;
    if (v3 != v7)
    {
      v8 = a1[1];
      do
      {
        v10 = *(void **)(v8 - 24);
        v8 -= 24;
        v9 = v10;
        if (v10)
        {
          *(_QWORD *)(v3 - 16) = v9;
          operator delete(v9);
        }
        v3 = v8;
      }
      while (v8 != v7);
    }
    a1[1] = v7;
  }
}

void ClipperLib::Clipper::BuildResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  char *v13;
  __int128 *v14;
  __int128 v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  __int128 v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  _QWORD *v29;
  uint64_t *v30;
  void *__p;
  char *v32;
  char *v33;

  std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a2, (*(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 88) - *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 80)) >> 3);
  v4 = *a1;
  v29 = a1 + 10;
  v30 = a1;
  v5 = (_QWORD *)(*a1 - 24);
  v6 = *(uint64_t *)((char *)a1 + *v5 + 80);
  if (*(uint64_t *)((char *)a1 + *v5 + 88) != v6)
  {
    v7 = 0;
    v28 = a2;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)(v6 + 8 * v7) + 24))
      {
        __p = 0;
        v32 = 0;
        v33 = 0;
        v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)((char *)v29 + *v5) + 8 * v7) + 24);
        v9 = *(_QWORD *)(v8 + 40);
        if (v9)
        {
          v10 = 0;
          v11 = *(_QWORD *)(v8 + 40);
          do
          {
            v11 = *(_QWORD *)(v11 + 32);
            ++v10;
          }
          while (v11 != v9);
          if ((_DWORD)v10 != 1)
          {
            std::vector<ClipperLib::IntPoint>::reserve(&__p, v10);
            v12 = 0;
            v13 = v32;
            do
            {
              v14 = (__int128 *)(v9 + 8);
              if (v13 >= v33)
              {
                v16 = 0xAAAAAAAAAAAAAAABLL * ((v13 - (_BYTE *)__p) >> 3);
                v17 = v16 + 1;
                if (v16 + 1 > 0xAAAAAAAAAAAAAAALL)
                  std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
                if (0x5555555555555556 * ((v33 - (_BYTE *)__p) >> 3) > v17)
                  v17 = 0x5555555555555556 * ((v33 - (_BYTE *)__p) >> 3);
                if (0xAAAAAAAAAAAAAAABLL * ((v33 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
                  v18 = 0xAAAAAAAAAAAAAAALL;
                else
                  v18 = v17;
                if (v18)
                  v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)&v33, v18);
                else
                  v19 = 0;
                v20 = &v19[24 * v16];
                v21 = *v14;
                *((_QWORD *)v20 + 2) = *(_QWORD *)(v9 + 24);
                *(_OWORD *)v20 = v21;
                v23 = (char *)__p;
                v22 = v32;
                v24 = v20;
                if (v32 != __p)
                {
                  do
                  {
                    v25 = *(_OWORD *)(v22 - 24);
                    *((_QWORD *)v24 - 1) = *((_QWORD *)v22 - 1);
                    *(_OWORD *)(v24 - 24) = v25;
                    v24 -= 24;
                    v22 -= 24;
                  }
                  while (v22 != v23);
                  v22 = (char *)__p;
                }
                v13 = v20 + 24;
                __p = v24;
                v32 = v20 + 24;
                v33 = &v19[24 * v18];
                if (v22)
                  operator delete(v22);
              }
              else
              {
                v15 = *v14;
                *((_QWORD *)v13 + 2) = *(_QWORD *)(v9 + 24);
                *(_OWORD *)v13 = v15;
                v13 += 24;
              }
              v32 = v13;
              v9 = *(_QWORD *)(v9 + 40);
              ++v12;
            }
            while ((_DWORD)v10 != v12);
            v26 = v28[1];
            if (v26 >= v28[2])
            {
              v27 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v28, (uint64_t)&__p);
            }
            else
            {
              std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v28, (uint64_t)&__p);
              v27 = v26 + 24;
            }
            v28[1] = v27;
            if (__p)
            {
              v32 = (char *)__p;
              operator delete(__p);
            }
          }
        }
        v4 = *v30;
      }
      v5 = (_QWORD *)(v4 - 24);
      ++v7;
      v6 = *(uint64_t *)((char *)v30 + *(_QWORD *)(v4 - 24) + 80);
    }
    while (v7 < (*(uint64_t *)((char *)v30 + *(_QWORD *)(v4 - 24) + 88) - v6) >> 3);
  }
}

void sub_23F0EE7A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ClipperLib::Clipper::BuildResult2(ClipperLib::Clipper *this, ClipperLib::PolyTree *a2)
{
  ClipperLib::PolyTree *v2;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  unint64_t v16;
  uint64_t *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  _QWORD *v30;
  char *v31;
  __int128 *v32;
  __int128 v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  __int128 v38;
  char *v39;
  char *v40;
  char *v41;
  __int128 v42;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  ClipperLib::PolyNode *v49;
  ClipperLib::PolyNode *v50;
  uint64_t v51;
  uint64_t v52;
  char **v53;
  ClipperLib::PolyTree *v54;
  ClipperLib::Clipper *v55;

  v2 = a2;
  ClipperLib::PolyTree::Clear(a2);
  v53 = (char **)((char *)v2 + 80);
  std::vector<ClipperLib::PolyNode *>::reserve((void **)v2 + 10, (uint64_t)(*(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 88)- *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 80)) >> 3);
  v5 = *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 80);
  if (*(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 88) == v5)
  {
    v45 = 0;
  }
  else
  {
    v6 = 0;
    v54 = v2;
    v52 = (uint64_t)v2 + 96;
    v55 = this;
    do
    {
      v7 = *(_QWORD *)(v5 + 8 * v6);
      v8 = *(_QWORD *)(v7 + 24);
      if (v8)
      {
        v9 = 0;
        v10 = *(_QWORD *)(v7 + 24);
        do
        {
          v10 = *(_QWORD *)(v10 + 32);
          --v9;
        }
        while (v10 != v8);
        v11 = *(_BYTE *)(v7 + 5) ? 1 : 2;
        v12 = ~(_DWORD)v9;
        if (~(_DWORD)v9 >= v11)
        {
          ClipperLib::Clipper::FixHoleLinkage((uint64_t)v4, v7);
          v13 = operator new();
          v14 = v13;
          *(_QWORD *)v13 = &unk_250FA0FB8;
          *(_OWORD *)(v13 + 8) = 0u;
          v15 = (void **)(v13 + 8);
          *(_OWORD *)(v13 + 24) = 0u;
          *(_OWORD *)(v13 + 40) = 0u;
          *(_OWORD *)(v13 + 53) = 0u;
          v17 = (uint64_t *)*((_QWORD *)v54 + 11);
          v16 = *((_QWORD *)v54 + 12);
          if ((unint64_t)v17 >= v16)
          {
            v19 = ((char *)v17 - *v53) >> 3;
            if ((unint64_t)(v19 + 1) >> 61)
              std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
            v20 = v16 - (_QWORD)*v53;
            v21 = v20 >> 2;
            if (v20 >> 2 <= (unint64_t)(v19 + 1))
              v21 = v19 + 1;
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
              v22 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v22 = v21;
            if (v22)
              v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>(v52, v22);
            else
              v23 = 0;
            v24 = (uint64_t *)&v23[8 * v19];
            *v24 = v14;
            v18 = v24 + 1;
            v26 = (char *)*((_QWORD *)v54 + 10);
            v25 = (char *)*((_QWORD *)v54 + 11);
            if (v25 != v26)
            {
              do
              {
                v27 = *((_QWORD *)v25 - 1);
                v25 -= 8;
                *--v24 = v27;
              }
              while (v25 != v26);
              v25 = *v53;
            }
            *((_QWORD *)v54 + 10) = v24;
            *((_QWORD *)v54 + 11) = v18;
            *((_QWORD *)v54 + 12) = &v23[8 * v22];
            if (v25)
              operator delete(v25);
          }
          else
          {
            *v17 = v13;
            v18 = v17 + 1;
          }
          *((_QWORD *)v54 + 11) = v18;
          *(_QWORD *)(v7 + 16) = v14;
          *(_QWORD *)(v14 + 56) = 0;
          *(_DWORD *)(v14 + 64) = 0;
          std::vector<ClipperLib::IntPoint>::reserve(v15, -v9);
          v28 = 0;
          v29 = *(_QWORD *)(v7 + 24);
          v30 = (_QWORD *)(v14 + 24);
          v31 = *(char **)(v14 + 16);
          do
          {
            v29 = *(_QWORD *)(v29 + 40);
            v32 = (__int128 *)(v29 + 8);
            if ((unint64_t)v31 >= *v30)
            {
              v34 = 0xAAAAAAAAAAAAAAABLL * ((v31 - (_BYTE *)*v15) >> 3);
              v35 = v34 + 1;
              if (v34 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
              if (0x5555555555555556 * ((uint64_t)(*v30 - (_QWORD)*v15) >> 3) > v35)
                v35 = 0x5555555555555556 * ((uint64_t)(*v30 - (_QWORD)*v15) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v30 - (_QWORD)*v15) >> 3) >= 0x555555555555555)
                v36 = 0xAAAAAAAAAAAAAAALL;
              else
                v36 = v35;
              if (v36)
                v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(v14 + 24, v36);
              else
                v4 = 0;
              v37 = &v4[24 * v34];
              v38 = *v32;
              *((_QWORD *)v37 + 2) = *(_QWORD *)(v29 + 24);
              *(_OWORD *)v37 = v38;
              v40 = *(char **)(v14 + 8);
              v39 = *(char **)(v14 + 16);
              v41 = v37;
              if (v39 != v40)
              {
                do
                {
                  v42 = *(_OWORD *)(v39 - 24);
                  *((_QWORD *)v41 - 1) = *((_QWORD *)v39 - 1);
                  *(_OWORD *)(v41 - 24) = v42;
                  v41 -= 24;
                  v39 -= 24;
                }
                while (v39 != v40);
                v39 = (char *)*v15;
              }
              v31 = v37 + 24;
              *(_QWORD *)(v14 + 8) = v41;
              *(_QWORD *)(v14 + 16) = v37 + 24;
              *(_QWORD *)(v14 + 24) = &v4[24 * v36];
              if (v39)
                operator delete(v39);
            }
            else
            {
              v33 = *v32;
              *((_QWORD *)v31 + 2) = *(_QWORD *)(v29 + 24);
              *(_OWORD *)v31 = v33;
              v31 += 24;
            }
            *(_QWORD *)(v14 + 16) = v31;
          }
          while (v12 != v28++);
        }
      }
      ++v6;
      this = v55;
      v5 = *(_QWORD *)((char *)v55 + *(_QWORD *)(*(_QWORD *)v55 - 24) + 80);
      v44 = *(_QWORD *)((char *)v55 + *(_QWORD *)(*(_QWORD *)v55 - 24) + 88) - v5;
    }
    while (v6 < v44 >> 3);
    v45 = v44 >> 3;
    v2 = v54;
  }
  std::vector<ClipperLib::PolyNode *>::reserve((void **)v2 + 4, v45);
  v46 = *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 80);
  if (*(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 88) != v46)
  {
    v47 = 0;
    while (1)
    {
      v48 = *(_QWORD *)(v46 + 8 * v47);
      v49 = *(ClipperLib::PolyNode **)(v48 + 16);
      if (v49)
        break;
LABEL_55:
      ++v47;
      v46 = *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 80);
      if (v47 >= (*(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 88) - v46) >> 3)
        return;
    }
    if (*(_BYTE *)(v48 + 5))
    {
      *((_BYTE *)v49 + 68) = 1;
    }
    else
    {
      v51 = *(_QWORD *)(v48 + 8);
      if (v51)
      {
        v50 = *(ClipperLib::PolyNode **)(v51 + 16);
        if (v50)
          goto LABEL_54;
      }
    }
    v50 = v2;
LABEL_54:
    ClipperLib::PolyNode::AddChild(v50, v49);
    goto LABEL_55;
  }
}

void ClipperLib::Clipper::FixHoleLinkage(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;

  v2 = *(_QWORD *)(a2 + 8);
  if (v2)
  {
    v3 = *(unsigned __int8 *)(a2 + 4);
    if (v3 == *(unsigned __int8 *)(v2 + 4) || !*(_QWORD *)(v2 + 24))
    {
      do
      {
        if (*(unsigned __int8 *)(v2 + 4) != v3 && *(_QWORD *)(v2 + 24))
          break;
        v2 = *(_QWORD *)(v2 + 8);
      }
      while (v2);
      *(_QWORD *)(a2 + 8) = v2;
    }
  }
}

uint64_t ClipperLib::Clipper::ExecuteInternal(ClipperLib::Clipper *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int8x16_t *v9;
  int v10;
  int8x16_t *v11;
  int8x16_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18[3];

  (*(void (**)(char *))(*(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24)) + 32))((char *)this + *(_QWORD *)(*(_QWORD *)this - 24));
  v18[0] = (uint64_t)v18;
  v18[1] = (uint64_t)v18;
  v18[2] = 0;
  std::list<long long>::__move_assign((uint64_t *)this + 11, v18);
  std::__list_imp<long long>::clear(v18);
  *((_QWORD *)this + 14) = 0;
  v17 = 0;
  v18[0] = 0;
  if (!ClipperLib::ClipperBase::PopScanbeam((ClipperLib::Clipper *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24)), v18))return 0;
  ClipperLib::Clipper::InsertLocalMinimaIntoAEL(this, v18[0]);
  while (1)
  {
    v2 = ClipperLib::ClipperBase::PopScanbeam((ClipperLib::Clipper *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24)), &v17);
    if ((v2 & 1) == 0
      && *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 8) == *(_QWORD *)((char *)this
                                                                                          + *(_QWORD *)(*(_QWORD *)this - 24)
                                                                                          + 24))
    {
      break;
    }
    ClipperLib::Clipper::ProcessHorizontals(this);
    ClipperLib::Clipper::ClearGhostJoins(this);
    v3 = v17;
    if (!ClipperLib::Clipper::ProcessIntersections(this, v17))
    {
      v4 = 0;
      goto LABEL_30;
    }
    ClipperLib::Clipper::ProcessEdgesAtTopOfScanbeam(this, v3);
    ClipperLib::Clipper::InsertLocalMinimaIntoAEL(this, v3);
  }
  v5 = *(_QWORD *)this;
  v6 = *(_QWORD *)(*(_QWORD *)this - 24);
  v7 = *(_QWORD *)((char *)this + v6 + 80);
  if (*(_QWORD *)((char *)this + v6 + 88) != v7)
  {
    v8 = 0;
    do
    {
      v2 = *(_QWORD *)(v7 + 8 * v8);
      v9 = *(int8x16_t **)(v2 + 24);
      if (v9)
      {
        if (!*(_BYTE *)(v2 + 5))
        {
          v10 = *((unsigned __int8 *)this + 132) ^ *(unsigned __int8 *)(v2 + 4);
          if (v10 == ClipperLib::Area(v2) > 0.0)
          {
            v11 = v9;
            do
            {
              v12 = v11[2];
              v11[2] = vextq_s8(v12, v12, 8uLL);
              v11 = (int8x16_t *)v12.i64[0];
            }
            while ((int8x16_t *)v12.i64[0] != v9);
            v6 = *(_QWORD *)(v5 - 24);
          }
        }
      }
      ++v8;
      v7 = *(_QWORD *)((char *)this + v6 + 80);
    }
    while (v8 < (*(_QWORD *)((char *)this + v6 + 88) - v7) >> 3);
  }
  if (*((_QWORD *)this + 1) != *((_QWORD *)this + 2))
  {
    ClipperLib::Clipper::JoinCommonEdges(this);
    v6 = *(_QWORD *)(*(_QWORD *)this - 24);
  }
  v13 = *(_QWORD *)((char *)this + v6 + 80);
  if (*(_QWORD *)((char *)this + v6 + 88) != v13)
  {
    v14 = 0;
    do
    {
      v15 = *(_QWORD *)(v13 + 8 * v14);
      if (*(_QWORD *)(v15 + 24))
      {
        if (*(_BYTE *)(v15 + 5))
          v2 = (uint64_t)ClipperLib::Clipper::FixupOutPolyline(v2, v15);
        else
          v2 = ClipperLib::Clipper::FixupOutPolygon((uint64_t)this, v15);
      }
      ++v14;
      v13 = *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 80);
    }
    while (v14 < (*(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 88) - v13) >> 3);
  }
  if (*((_BYTE *)this + 134))
    ClipperLib::Clipper::DoSimplePolygons((uint64_t)this);
  v4 = 1;
LABEL_30:
  ClipperLib::Clipper::ClearJoins(this);
  ClipperLib::Clipper::ClearGhostJoins(this);
  return v4;
}

void ClipperLib::Clipper::InsertLocalMinimaIntoAEL(ClipperLib::Clipper *this, uint64_t a2)
{
  char *v2;
  char *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  __int128 *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _QWORD *v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;

  v2 = (char *)this + 40;
  v3 = (char *)this + *(_QWORD *)(*(_QWORD *)this - 24);
  v6 = (_QWORD *)*((_QWORD *)v3 + 1);
  v4 = v3 + 8;
  v5 = v6;
  if (v6 != (_QWORD *)v4[2])
  {
    v9 = (uint64_t *)((char *)this + 112);
    do
    {
      if (*v5 != a2)
        return;
      *v4 = v5 + 3;
      v10 = v5[1];
      v11 = v5[2];
      if (v10)
      {
        ClipperLib::Clipper::InsertEdgeIntoAEL((uint64_t *)this, v5[1], 0);
        if (!v11)
        {
          ClipperLib::Clipper::SetWindingCount((uint64_t)this, v10);
          if (ClipperLib::Clipper::IsContributing((uint64_t)this, (_DWORD *)v10))
            ClipperLib::Clipper::AddOutPt(this, (_DWORD *)v10, v10);
          v13 = *(_QWORD *)(*(_QWORD *)this - 24);
          v65 = *(_QWORD *)(v10 + 56);
          std::priority_queue<long long>::push((uint64_t)v9 + v13, &v65);
          goto LABEL_67;
        }
        ClipperLib::Clipper::InsertEdgeIntoAEL((uint64_t *)this, v11, v10);
        ClipperLib::Clipper::SetWindingCount((uint64_t)this, v10);
        *(_QWORD *)(v11 + 92) = *(_QWORD *)(v10 + 92);
        if (ClipperLib::Clipper::IsContributing((uint64_t)this, (_DWORD *)v10))
          v12 = ClipperLib::Clipper::AddLocalMinPoly(this, v10, v11, v10);
        else
          v12 = 0;
        v14 = *(_QWORD *)(*(_QWORD *)this - 24);
        v65 = *(_QWORD *)(v10 + 56);
        std::priority_queue<long long>::push((uint64_t)v9 + v14, &v65);
      }
      else
      {
        ClipperLib::Clipper::InsertEdgeIntoAEL((uint64_t *)this, v5[2], 0);
        ClipperLib::Clipper::SetWindingCount((uint64_t)this, v11);
        v12 = 0;
        if (ClipperLib::Clipper::IsContributing((uint64_t)this, (_DWORD *)v11))
          v12 = ClipperLib::Clipper::AddOutPt(this, (_DWORD *)v11, v11);
        if (!v11)
          goto LABEL_67;
      }
      if (*(double *)(v11 + 72) == -1.0e40)
      {
        v15 = *v9;
        *(_QWORD *)(v11 + 152) = 0;
        if (v15)
          *(_QWORD *)(v15 + 152) = v11;
        *v9 = v11;
        *(_QWORD *)(v11 + 144) = v15;
        v16 = *(_QWORD *)(v11 + 120);
        if (!v16)
          goto LABEL_24;
        v17 = *(_QWORD *)(*(_QWORD *)this - 24);
        v65 = *(_QWORD *)(v16 + 56);
        v18 = (uint64_t)v9 + v17;
      }
      else
      {
        v19 = *(_QWORD *)(*(_QWORD *)this - 24);
        v65 = *(_QWORD *)(v11 + 56);
        v18 = (uint64_t)v9 + v19;
      }
      std::priority_queue<long long>::push(v18, &v65);
LABEL_24:
      if (v10)
      {
        if (v12)
        {
          if (*(double *)(v11 + 72) == -1.0e40)
          {
            v21 = *((_QWORD *)this + 4);
            v20 = *((_QWORD *)this + 5);
            if (v20 != v21)
            {
              if (*(_DWORD *)(v11 + 88))
              {
                v22 = 0;
                do
                {
                  v23 = *(uint64_t **)(v21 + 8 * v22);
                  v24 = *v23;
                  v25 = *(_QWORD *)(*v23 + 8);
                  v28 = v23[2];
                  v26 = v23 + 2;
                  v27 = v28;
                  v29 = *(_QWORD *)v11;
                  v30 = *(_QWORD *)(v11 + 48);
                  v31 = v25 <= v28;
                  if (v25 >= v28)
                    v32 = v27;
                  else
                    v32 = v25;
                  if (v31)
                    v25 = v27;
                  if (v29 >= v30)
                    v33 = *(_QWORD *)(v11 + 48);
                  else
                    v33 = *(_QWORD *)v11;
                  if (v29 <= v30)
                    v29 = *(_QWORD *)(v11 + 48);
                  if (v32 < v29 && v33 < v25)
                  {
                    v63 = *(_OWORD *)v26;
                    v64 = v26[2];
                    ClipperLib::Clipper::AddJoin(this, v24, v12, (uint64_t)&v63);
                    v21 = *((_QWORD *)this + 4);
                    v20 = *((_QWORD *)this + 5);
                  }
                  ++v22;
                }
                while (v22 < (v20 - v21) >> 3);
              }
            }
          }
        }
        if ((*(_DWORD *)(v10 + 100) & 0x80000000) == 0)
        {
          v35 = *(__int128 **)(v10 + 136);
          if (v35)
          {
            if (*((_QWORD *)v35 + 3) == *(_QWORD *)v10 && (*((_DWORD *)v35 + 25) & 0x80000000) == 0)
            {
              v61 = *v35;
              v62 = *((_QWORD *)v35 + 2);
              v59 = v35[3];
              v60 = *((_QWORD *)v35 + 8);
              v57 = *(_OWORD *)(v10 + 24);
              v58 = *(_QWORD *)(v10 + 40);
              v56 = *(_QWORD *)(v10 + 64);
              v55 = *(_OWORD *)(v10 + 48);
              if (ClipperLib::SlopesEqual(&v61, &v59, &v57, &v55, v2[*(_QWORD *)(*(_QWORD *)this - 24)])&& *(_DWORD *)(v10 + 88)&& *((_DWORD *)v35 + 22))
              {
                v36 = ClipperLib::Clipper::AddOutPt(this, v35, v10);
                v53 = *(_OWORD *)(v10 + 48);
                v54 = *(_QWORD *)(v10 + 64);
                ClipperLib::Clipper::AddJoin(this, v12, v36, (uint64_t)&v53);
              }
            }
          }
        }
        v37 = *(_QWORD *)(v10 + 128);
        if (v37 != v11)
        {
          if ((*(_DWORD *)(v11 + 100) & 0x80000000) == 0)
          {
            v38 = *(_QWORD *)(v11 + 136);
            if ((*(_DWORD *)(v38 + 100) & 0x80000000) == 0)
            {
              v51 = *(_OWORD *)(v38 + 24);
              v52 = *(_QWORD *)(v38 + 40);
              v49 = *(_OWORD *)(v38 + 48);
              v50 = *(_QWORD *)(v38 + 64);
              v47 = *(_OWORD *)(v11 + 24);
              v48 = *(_QWORD *)(v11 + 40);
              v46 = *(_QWORD *)(v11 + 64);
              v45 = *(_OWORD *)(v11 + 48);
              if (ClipperLib::SlopesEqual(&v51, &v49, &v47, &v45, v2[*(_QWORD *)(*(_QWORD *)this - 24)])&& *(_DWORD *)(v11 + 88)&& *(_DWORD *)(v38 + 88))
              {
                v39 = ClipperLib::Clipper::AddOutPt(this, (_DWORD *)v38, v11);
                v43 = *(_OWORD *)(v11 + 48);
                v44 = *(_QWORD *)(v11 + 64);
                ClipperLib::Clipper::AddJoin(this, v12, v39, (uint64_t)&v43);
                v37 = *(_QWORD *)(v10 + 128);
              }
            }
          }
          if (v37 && v37 != v11)
          {
            v40 = v10 + 24;
            do
            {
              ClipperLib::Clipper::IntersectEdges((uint64_t)this, (_DWORD *)v11, (_DWORD *)v37, v40);
              v37 = *(_QWORD *)(v37 + 128);
            }
            while (v37 != v11);
          }
        }
      }
LABEL_67:
      v41 = (char *)this + *(_QWORD *)(*(_QWORD *)this - 24);
      v42 = (_QWORD *)*((_QWORD *)v41 + 1);
      v4 = v41 + 8;
      v5 = v42;
    }
    while (v42 != (_QWORD *)v4[2]);
  }
}

void ClipperLib::Clipper::ProcessHorizontals(ClipperLib::Clipper *this)
{
  uint64_t *i;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  v2 = (uint64_t *)((char *)this + 112);
  for (i = (uint64_t *)*((_QWORD *)this + 14); i; i = (uint64_t *)*((_QWORD *)this + 14))
  {
    v4 = i[18];
    v5 = i[19];
    if (*((_OWORD *)i + 9) == 0)
    {
      *v2 = 0;
    }
    else
    {
      v6 = (uint64_t *)(v5 + 144);
      if (!v5)
        v6 = v2;
      *v6 = v4;
      if (v4)
        *(_QWORD *)(v4 + 152) = v5;
    }
    i[18] = 0;
    i[19] = 0;
    ClipperLib::Clipper::ProcessHorizontal(this, i);
  }
}

void ClipperLib::Clipper::ClearGhostJoins(ClipperLib::Clipper *this)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v5;
  uint64_t v6;

  v1 = *((_QWORD *)this + 4);
  v2 = *((_QWORD *)this + 5);
  v3 = (char *)this + 32;
  if (v2 != v1)
  {
    v5 = 0;
    do
    {
      v6 = *(_QWORD *)(v1 + 8 * v5);
      if (v6)
      {
        MEMORY[0x242665874](v6, 0x1020C40E349F4B1);
        v1 = *((_QWORD *)this + 4);
        v2 = *((_QWORD *)this + 5);
      }
      ++v5;
    }
    while (v5 < (v2 - v1) >> 3);
  }
  std::vector<ClipperLib::PolyNode *>::resize((uint64_t)v3, 0);
}

BOOL ClipperLib::Clipper::ProcessIntersections(ClipperLib::Clipper *this, uint64_t a2)
{
  uint64_t v3;
  _BOOL8 result;

  if (!*(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 104))
    return 1;
  ClipperLib::Clipper::BuildIntersectList(this, a2);
  v3 = (uint64_t)(*((_QWORD *)this + 8) - *((_QWORD *)this + 7)) >> 3;
  if (!v3)
    return 1;
  if (v3 == 1 || (result = ClipperLib::Clipper::FixupIntersectionOrder(this)))
  {
    ClipperLib::Clipper::ProcessIntersectList(this);
    *((_QWORD *)this + 14) = 0;
    return 1;
  }
  return result;
}

void sub_23F0EF428(void *a1)
{
  uint64_t v1;
  ClipperLib::clipperException *exception;

  __cxa_begin_catch(a1);
  *(_QWORD *)(v1 + 112) = 0;
  ClipperLib::Clipper::DisposeIntersectNodes(v1);
  exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
  ClipperLib::clipperException::clipperException(exception, "ProcessIntersections error");
}

void sub_23F0EF470(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void ClipperLib::Clipper::ProcessEdgesAtTopOfScanbeam(ClipperLib::Clipper *this, uint64_t a2)
{
  _QWORD *v4;
  _DWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, _DWORD *, _DWORD *, __int128 *);
  uint64_t v14;
  uint64_t v15;
  _DWORD **v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _DWORD *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  __int128 *v30;
  uint64_t v31;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  _DWORD *v57;

  v4 = (_QWORD *)((char *)this + 104);
  v5 = *(_DWORD **)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 104);
  v57 = v5;
  if (v5)
  {
    v6 = (uint64_t *)((char *)this + 88);
    while (*((_QWORD *)v5 + 7) == a2)
    {
      if (*((_QWORD *)v5 + 15) || (ClipperLib::GetMaximaPairEx(v5), v17) && *(double *)(v17 + 72) == -1.0e40)
      {
        v7 = *((_QWORD *)v5 + 15);
        if (v7 && *(double *)(v7 + 72) == -1.0e40)
        {
          ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)this + *(_QWORD *)(*(_QWORD *)this - 24), (uint64_t *)&v57);
          v5 = v57;
          if ((v57[25] & 0x80000000) == 0)
            ClipperLib::Clipper::AddOutPt(this, v57, (uint64_t)v57);
          v8 = *((_QWORD *)this + 14);
          *((_QWORD *)v5 + 19) = 0;
          if (v8)
            *(_QWORD *)(v8 + 152) = v5;
          *((_QWORD *)this + 14) = v5;
          *((_QWORD *)v5 + 18) = v8;
          goto LABEL_18;
        }
        v11 = *((_QWORD *)v5 + 6);
LABEL_17:
        *((_QWORD *)v5 + 3) = v11;
        *((_QWORD *)v5 + 4) = a2;
LABEL_18:
        if (*((_BYTE *)this + 134))
        {
          if ((v5[25] & 0x80000000) == 0)
          {
            if (v5[22])
            {
              v12 = *((_QWORD *)v5 + 17);
              if (v12)
              {
                if ((*(_DWORD *)(v12 + 100) & 0x80000000) == 0
                  && *(_QWORD *)(v12 + 24) == *((_QWORD *)v5 + 3)
                  && *(_DWORD *)(v12 + 88))
                {
                  v55 = *(_OWORD *)(v5 + 6);
                  v56 = *((_QWORD *)v5 + 5);
                  v13 = (void (*)(uint64_t, uint64_t, _DWORD *, _DWORD *, __int128 *))*((_QWORD *)this + 17);
                  if (v13)
                    v13(v12, v12 + 48, v5, v5 + 12, &v55);
                  v14 = ClipperLib::Clipper::AddOutPt(this, (_DWORD *)v12, (uint64_t)&v55);
                  v15 = ClipperLib::Clipper::AddOutPt(this, v5, (uint64_t)&v55);
                  v53 = v55;
                  v54 = v56;
                  ClipperLib::Clipper::AddJoin(this, v14, v15, (uint64_t)&v53);
                  v5 = v57;
                }
              }
            }
          }
        }
        v16 = (_DWORD **)(v5 + 32);
        goto LABEL_29;
      }
      if (*((_BYTE *)this + 134))
      {
        v18 = operator new(0x18uLL);
        v19 = *((_QWORD *)v5 + 6);
        v18[1] = v6;
        v18[2] = v19;
        v20 = *v6;
        *v18 = *v6;
        *(_QWORD *)(v20 + 8) = v18;
        *v6 = (uint64_t)v18;
        ++*v4;
      }
      v21 = *((_QWORD *)v5 + 17);
      ClipperLib::Clipper::DoMaxima(this, (uint64_t)v5);
      if (v21)
        v16 = (_DWORD **)(v21 + 128);
      else
        v16 = (_DWORD **)((char *)v4 + *(_QWORD *)(*(_QWORD *)this - 24));
LABEL_29:
      v57 = *v16;
      v5 = v57;
      if (!v57)
        goto LABEL_38;
    }
    v9 = *((double *)v5 + 9) * (double)(a2 - *((_QWORD *)v5 + 1));
    if (v9 >= 0.0)
      v10 = 0.5;
    else
      v10 = -0.5;
    v11 = *(_QWORD *)v5 + (uint64_t)(v9 + v10);
    goto LABEL_17;
  }
LABEL_38:
  std::list<long long>::__sort<std::__less<void,void>>(*((uint64_t **)this + 12), (uint64_t *)this + 11, *((_QWORD *)this + 13), (uint64_t)&v55);
  ClipperLib::Clipper::ProcessHorizontals(this);
  std::__list_imp<long long>::clear((_QWORD *)this + 11);
  v22 = *(_DWORD **)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 104);
  v57 = v22;
  if (v22)
  {
    v23 = (char *)this + 40;
    do
    {
      if (*((_QWORD *)v22 + 7) == a2 && *((_QWORD *)v22 + 15))
      {
        if ((v22[25] & 0x80000000) != 0)
          v24 = 0;
        else
          v24 = ClipperLib::Clipper::AddOutPt(this, v22, (uint64_t)(v22 + 12));
        ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)this + *(_QWORD *)(*(_QWORD *)this - 24), (uint64_t *)&v57);
        v22 = v57;
        v25 = *((_QWORD *)v57 + 16);
        v26 = *((_QWORD *)v57 + 17);
        if (!v26 || *(_QWORD *)(v26 + 24) != *(_QWORD *)v57)
          goto LABEL_73;
        v27 = *(_QWORD *)(v26 + 32);
        if (v27 != *((_QWORD *)v57 + 1) || v24 == 0)
          goto LABEL_73;
        if ((*(_DWORD *)(v26 + 100) & 0x80000000) != 0)
          goto LABEL_73;
        if (v27 <= *(_QWORD *)(v26 + 56))
          goto LABEL_73;
        v51 = *(_OWORD *)(v57 + 6);
        v52 = *((_QWORD *)v57 + 5);
        v49 = *((_OWORD *)v57 + 3);
        v50 = *((_QWORD *)v57 + 8);
        v47 = *(_OWORD *)(v26 + 24);
        v48 = *(_QWORD *)(v26 + 40);
        v46 = *(_QWORD *)(v26 + 64);
        v45 = *(_OWORD *)(v26 + 48);
        if (!ClipperLib::SlopesEqual(&v51, &v49, &v47, &v45, v23[*(_QWORD *)(*(_QWORD *)this - 24)]))
          goto LABEL_73;
        if (v22[22] && *(_DWORD *)(v26 + 88))
        {
          v29 = ClipperLib::Clipper::AddOutPt(this, (_DWORD *)v26, (uint64_t)v22);
          v43 = *((_OWORD *)v22 + 3);
          v44 = *((_QWORD *)v22 + 8);
          v30 = &v43;
        }
        else
        {
LABEL_73:
          if (!v25 || *(_QWORD *)(v25 + 24) != *(_QWORD *)v22)
            goto LABEL_70;
          v31 = *(_QWORD *)(v25 + 32);
          if (v31 != *((_QWORD *)v22 + 1) || v24 == 0)
            goto LABEL_70;
          if ((*(_DWORD *)(v25 + 100) & 0x80000000) != 0)
            goto LABEL_70;
          if (v31 <= *(_QWORD *)(v25 + 56))
            goto LABEL_70;
          v41 = *(_OWORD *)(v22 + 6);
          v42 = *((_QWORD *)v22 + 5);
          v39 = *((_OWORD *)v22 + 3);
          v40 = *((_QWORD *)v22 + 8);
          v37 = *(_OWORD *)(v25 + 24);
          v38 = *(_QWORD *)(v25 + 40);
          v36 = *(_QWORD *)(v25 + 64);
          v35 = *(_OWORD *)(v25 + 48);
          if (!ClipperLib::SlopesEqual(&v41, &v39, &v37, &v35, v23[*(_QWORD *)(*(_QWORD *)this - 24)])|| !v22[22]|| !*(_DWORD *)(v25 + 88))
          {
            goto LABEL_70;
          }
          v29 = ClipperLib::Clipper::AddOutPt(this, (_DWORD *)v25, (uint64_t)v22);
          v33 = *((_OWORD *)v22 + 3);
          v34 = *((_QWORD *)v22 + 8);
          v30 = &v33;
        }
        ClipperLib::Clipper::AddJoin(this, v24, v29, (uint64_t)v30);
      }
LABEL_70:
      v22 = (_DWORD *)*((_QWORD *)v22 + 16);
      v57 = v22;
    }
    while (v22);
  }
}

void ClipperLib::Clipper::JoinCommonEdges(ClipperLib::Clipper *this)
{
  uint64_t v1;
  unint64_t v3;
  char *v4;
  int **v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t LowermostRec;
  uint64_t v14;
  uint64_t OutRec;
  int *v17;
  int v18;
  int *v19;
  _QWORD *v20;
  _QWORD *v21;
  int *v22;
  int v23;
  unsigned __int8 v24;
  int v25;
  uint64_t v26;
  int8x16_t *v27;
  int8x16_t v28;
  int v29;
  char v30;
  unsigned __int8 v31;
  int v32;
  uint64_t v33;
  int8x16_t *v34;
  int8x16_t v35;

  v1 = *((_QWORD *)this + 1);
  if (*((_QWORD *)this + 2) != v1)
  {
    v3 = 0;
    v4 = (char *)this + 80;
    do
    {
      v5 = *(int ***)(v1 + 8 * v3);
      v6 = *(_QWORD *)&v4[*(_QWORD *)(*(_QWORD *)this - 24)];
      v7 = *(int **)(v6 + 8 * **v5);
      do
      {
        v8 = (uint64_t)v7;
        v7 = *(int **)(v6 + 8 * *v7);
      }
      while ((int *)v8 != v7);
      v9 = *(int **)(v6 + 8 * *v5[1]);
      do
      {
        v10 = (uint64_t)v9;
        v9 = *(int **)(v6 + 8 * *v9);
      }
      while ((int *)v10 != v9);
      if (*(_QWORD *)(v8 + 24) && *(_QWORD *)(v10 + 24) && !*(_BYTE *)(v8 + 5) && !*(_BYTE *)(v10 + 5))
      {
        if (v8 == v10)
        {
          if (ClipperLib::Clipper::JoinPoints(this, v5, v8, v8))
          {
            *(_QWORD *)(v8 + 24) = *v5;
            *(_QWORD *)(v8 + 32) = 0;
            OutRec = ClipperLib::ClipperBase::CreateOutRec((ClipperLib::Clipper *)((char *)this
                                                                                 + *(_QWORD *)(*(_QWORD *)this - 24)));
            v17 = v5[1];
            *(_QWORD *)(OutRec + 24) = v17;
            v18 = *(_DWORD *)OutRec;
            v19 = v17;
            do
            {
              *v19 = v18;
              v19 = (int *)*((_QWORD *)v19 + 5);
            }
            while (v19 != v17);
            v20 = *(_QWORD **)(v8 + 24);
            v21 = v20;
            v22 = v17;
            while (1)
            {
              v23 = ClipperLib::PointInPolygon((_QWORD *)v22 + 1, v20);
              if ((v23 & 0x80000000) == 0)
                break;
              v22 = (int *)*((_QWORD *)v22 + 4);
              if (v22 == v17)
                goto LABEL_42;
            }
            if (v23)
            {
LABEL_42:
              v24 = *(_BYTE *)(v8 + 4) ^ 1;
              *(_BYTE *)(OutRec + 4) = v24;
              *(_QWORD *)(OutRec + 8) = v8;
              if (*((_BYTE *)this + 133))
              {
                ClipperLib::Clipper::FixupFirstLefts2((uint64_t)this, OutRec, v8);
                v24 = *(_BYTE *)(OutRec + 4);
              }
              v25 = *((unsigned __int8 *)this + 132) ^ v24;
              if (v25 == ClipperLib::Area(OutRec) > 0.0)
              {
                v26 = *(_QWORD *)(OutRec + 24);
                if (v26)
                {
                  v27 = *(int8x16_t **)(OutRec + 24);
                  do
                  {
                    v28 = v27[2];
                    v27[2] = vextq_s8(v28, v28, 8uLL);
                    v27 = (int8x16_t *)v28.i64[0];
                  }
                  while (v28.i64[0] != v26);
                }
              }
              goto LABEL_11;
            }
            while (1)
            {
              v29 = ClipperLib::PointInPolygon(v21 + 1, v17);
              if ((v29 & 0x80000000) == 0)
                break;
              v21 = (_QWORD *)v21[4];
              if (v21 == v20)
                goto LABEL_53;
            }
            if (v29)
            {
LABEL_53:
              v30 = *(_BYTE *)(v8 + 4);
              *(_BYTE *)(OutRec + 4) = v30;
              v31 = v30 ^ 1;
              *(_BYTE *)(v8 + 4) = v31;
              *(_QWORD *)(OutRec + 8) = *(_QWORD *)(v8 + 8);
              *(_QWORD *)(v8 + 8) = OutRec;
              if (*((_BYTE *)this + 133))
              {
                ClipperLib::Clipper::FixupFirstLefts2((uint64_t)this, v8, OutRec);
                v31 = *(_BYTE *)(v8 + 4);
              }
              v32 = *((unsigned __int8 *)this + 132) ^ v31;
              if (v32 == ClipperLib::Area(v8) > 0.0)
              {
                v33 = *(_QWORD *)(v8 + 24);
                if (v33)
                {
                  v34 = *(int8x16_t **)(v8 + 24);
                  do
                  {
                    v35 = v34[2];
                    v34[2] = vextq_s8(v35, v35, 8uLL);
                    v34 = (int8x16_t *)v35.i64[0];
                  }
                  while (v35.i64[0] != v33);
                }
              }
              goto LABEL_11;
            }
            *(_BYTE *)(OutRec + 4) = *(_BYTE *)(v8 + 4);
            *(_QWORD *)(OutRec + 8) = *(_QWORD *)(v8 + 8);
            if (*((_BYTE *)this + 133))
              ClipperLib::Clipper::FixupFirstLefts1((uint64_t)this, v8, OutRec);
          }
        }
        else
        {
          v11 = v8;
          do
            v11 = *(_QWORD *)(v11 + 8);
          while (v11 != v10 && v11 != 0);
          LowermostRec = v10;
          if (v11 != v10)
          {
            v14 = v10;
            do
              v14 = *(_QWORD *)(v14 + 8);
            while (v14 != v8 && v14 != 0);
            LowermostRec = v8;
            if (v14 != v8)
              LowermostRec = ClipperLib::GetLowermostRec(v8, v10);
          }
          if ((ClipperLib::Clipper::JoinPoints(this, v5, v8, v10) & 1) != 0)
          {
            *(_QWORD *)(v10 + 24) = 0;
            *(_QWORD *)(v10 + 32) = 0;
            *(_DWORD *)v10 = *(_DWORD *)v8;
            *(_BYTE *)(v8 + 4) = *(_BYTE *)(LowermostRec + 4);
            if (LowermostRec == v10)
              *(_QWORD *)(v8 + 8) = *(_QWORD *)(v10 + 8);
            *(_QWORD *)(v10 + 8) = v8;
            if (*((_BYTE *)this + 133))
              ClipperLib::Clipper::FixupFirstLefts3((uint64_t *)this, v10, v8);
          }
        }
      }
LABEL_11:
      ++v3;
      v1 = *((_QWORD *)this + 1);
    }
    while (v3 < (*((_QWORD *)this + 2) - v1) >> 3);
  }
}

_QWORD *ClipperLib::Clipper::FixupOutPolyline(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v7;
  _QWORD *v8;

  result = *(_QWORD **)(a2 + 24);
  v4 = (_QWORD *)result[5];
  if (result == v4)
  {
    v8 = *(_QWORD **)(a2 + 24);
LABEL_14:
    result = ClipperLib::DisposeOutPts(&v8);
    *(_QWORD *)(a2 + 24) = 0;
    return result;
  }
  do
  {
    result = (_QWORD *)result[4];
    v5 = (_QWORD *)result[5];
    if (result[1] == v5[1] && result[2] == v5[2])
    {
      if (result == v4)
        v4 = (_QWORD *)result[5];
      v5[4] = result[4];
      *(_QWORD *)(result[4] + 40) = v5;
      MEMORY[0x242665874]();
      result = v5;
    }
  }
  while (result != v4);
  v7 = (_QWORD *)result[5];
  v8 = result;
  if (result == v7)
    goto LABEL_14;
  return result;
}

uint64_t ClipperLib::Clipper::FixupOutPolygon(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _BOOL4 v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  __int128 *v13;
  __int128 *v15;
  __int128 v17;
  uint64_t result;
  __int128 v19;
  _BOOL4 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  _QWORD *v34;

  *(_QWORD *)(a2 + 32) = 0;
  v4 = *(_QWORD **)(a2 + 24);
  if (*(_BYTE *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24) + 72))
    v5 = 1;
  else
    v5 = *(_BYTE *)(a1 + 134) != 0;
  v20 = v5;
  v6 = v4 + 5;
  v7 = (_QWORD *)v4[5];
  if (v7 != v4)
  {
    v8 = 0;
    v21 = a1 + 40;
    while (1)
    {
      v9 = (_QWORD *)v4[4];
      if (v7 == v9)
        break;
      v10 = v4[1];
      v11 = v4[2];
      v12 = (__int128 *)(v4 + 1);
      v13 = (__int128 *)(v9 + 1);
      if (v10 == v9[1] && v11 == v9[2])
        goto LABEL_22;
      v15 = (__int128 *)(v7 + 1);
      if (v10 == v7[1] && v11 == v7[2])
        goto LABEL_22;
      v33 = v7[3];
      v32 = *v15;
      v17 = *v12;
      v31 = v4[3];
      v30 = v17;
      v28 = *v13;
      v29 = v9[3];
      result = ClipperLib::SlopesEqual(&v32, (uint64_t *)&v30, &v28, *(unsigned __int8 *)(v21 + *(_QWORD *)(*(_QWORD *)a1 - 24)));
      if (!(_DWORD)result)
        goto LABEL_18;
      if (!v20)
        goto LABEL_22;
      v27 = v7[3];
      v26 = *v15;
      v19 = *v12;
      v25 = v4[3];
      v24 = v19;
      v22 = *v13;
      v23 = v9[3];
      result = ClipperLib::Pt2IsBetweenPt1AndPt3((uint64_t *)&v26, (uint64_t *)&v24, (uint64_t *)&v22);
      if ((result & 1) == 0)
      {
LABEL_22:
        v7[4] = v9;
        *(_QWORD *)(v4[4] + 40) = v7;
        v9 = (_QWORD *)*v6;
        MEMORY[0x242665874](v4, 0x1020C404ACFEA97);
        v8 = 0;
      }
      else
      {
LABEL_18:
        if (v4 == v8)
          goto LABEL_27;
        if (!v8)
          v8 = v4;
      }
      v6 = v9 + 5;
      v7 = (_QWORD *)v9[5];
      v4 = v9;
      if (v7 == v9)
        goto LABEL_26;
    }
  }
  v9 = v4;
LABEL_26:
  v34 = v9;
  result = (uint64_t)ClipperLib::DisposeOutPts(&v34);
  v8 = 0;
LABEL_27:
  *(_QWORD *)(a2 + 24) = v8;
  return result;
}

uint64_t ClipperLib::Clipper::DoSimplePolygons(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v9;
  uint64_t v10;
  uint64_t OutRec;
  int v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v1 = *(_QWORD *)this;
  v2 = *(_QWORD *)(this + *(_QWORD *)(*(_QWORD *)this - 24) + 80);
  if (*(_QWORD *)(this + *(_QWORD *)(*(_QWORD *)this - 24) + 88) != v2)
  {
    v3 = this;
    v4 = 0;
    do
    {
      v5 = *(_QWORD *)(v2 + 8 * v4);
      v6 = *(_QWORD **)(v5 + 24);
      if (v6 && !*(_BYTE *)(v5 + 5))
      {
        v7 = *(_QWORD **)(v5 + 24);
        do
        {
          if ((_QWORD *)v7[4] == v6)
            break;
          v6 = (_QWORD *)v7[4];
          do
          {
            if (v7[1] == v6[1] && v7[2] == v6[2] && (_QWORD *)v6[4] != v7)
            {
              v9 = (_QWORD *)v6[5];
              if (v9 != v7)
              {
                v10 = v7[5];
                v7[5] = v9;
                v9[4] = v7;
                v6[5] = v10;
                *(_QWORD *)(v10 + 32) = v6;
                *(_QWORD *)(v5 + 24) = v7;
                OutRec = ClipperLib::ClipperBase::CreateOutRec((ClipperLib::ClipperBase *)(v3
                                                                                         + *(_QWORD *)(*(_QWORD *)v3 - 24)));
                *(_QWORD *)(OutRec + 24) = v6;
                v12 = *(_DWORD *)OutRec;
                v13 = v6;
                do
                {
                  *(_DWORD *)v13 = v12;
                  v13 = (_QWORD *)v13[5];
                }
                while (v13 != v6);
                v14 = *(_QWORD **)(v5 + 24);
                v15 = v14;
                v16 = v6;
                while (1)
                {
                  this = ClipperLib::PointInPolygon(v16 + 1, v14);
                  if ((this & 0x80000000) == 0)
                    break;
                  v16 = (_QWORD *)v16[4];
                  if (v16 == v6)
                    goto LABEL_22;
                }
                if (!(_DWORD)this)
                {
                  while (1)
                  {
                    this = ClipperLib::PointInPolygon(v15 + 1, v6);
                    if ((this & 0x80000000) == 0)
                      break;
                    v15 = (_QWORD *)v15[4];
                    if (v15 == v14)
                      goto LABEL_32;
                  }
                  if ((_DWORD)this)
                  {
LABEL_32:
                    v20 = *(_BYTE *)(v5 + 4);
                    *(_BYTE *)(OutRec + 4) = v20;
                    *(_BYTE *)(v5 + 4) = v20 ^ 1;
                    *(_QWORD *)(OutRec + 8) = *(_QWORD *)(v5 + 8);
                    *(_QWORD *)(v5 + 8) = OutRec;
                    v6 = v7;
                    if (!*(_BYTE *)(v3 + 133))
                      goto LABEL_26;
                    v17 = v3;
                    v18 = v5;
                    v19 = OutRec;
                    goto LABEL_24;
                  }
                  *(_BYTE *)(OutRec + 4) = *(_BYTE *)(v5 + 4);
                  *(_QWORD *)(OutRec + 8) = *(_QWORD *)(v5 + 8);
                  v6 = v7;
                  if (!*(_BYTE *)(v3 + 133))
                    goto LABEL_26;
                  this = ClipperLib::Clipper::FixupFirstLefts1(v3, v5, OutRec);
                  goto LABEL_25;
                }
LABEL_22:
                *(_BYTE *)(OutRec + 4) = *(_BYTE *)(v5 + 4) ^ 1;
                *(_QWORD *)(OutRec + 8) = v5;
                v6 = v7;
                if (!*(_BYTE *)(v3 + 133))
                  goto LABEL_26;
                v17 = v3;
                v18 = OutRec;
                v19 = v5;
LABEL_24:
                this = ClipperLib::Clipper::FixupFirstLefts2(v17, v18, v19);
LABEL_25:
                v6 = v7;
              }
            }
LABEL_26:
            v6 = (_QWORD *)v6[4];
          }
          while (v6 != *(_QWORD **)(v5 + 24));
          v7 = (_QWORD *)v7[4];
        }
        while (v7 != v6);
        v1 = *(_QWORD *)v3;
      }
      ++v4;
      v2 = *(_QWORD *)(v3 + *(_QWORD *)(v1 - 24) + 80);
    }
    while (v4 < (*(_QWORD *)(v3 + *(_QWORD *)(v1 - 24) + 88) - v2) >> 3);
  }
  return this;
}

void ClipperLib::Clipper::ClearJoins(ClipperLib::Clipper *this)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v5;
  uint64_t v6;

  v1 = *((_QWORD *)this + 1);
  v2 = *((_QWORD *)this + 2);
  v3 = (char *)this + 8;
  if (v2 != v1)
  {
    v5 = 0;
    do
    {
      v6 = *(_QWORD *)(v1 + 8 * v5);
      if (v6)
      {
        MEMORY[0x242665874](v6, 0x1020C40E349F4B1);
        v1 = *((_QWORD *)this + 1);
        v2 = *((_QWORD *)this + 2);
      }
      ++v5;
    }
    while (v5 < (v2 - v1) >> 3);
  }
  std::vector<ClipperLib::PolyNode *>::resize((uint64_t)v3, 0);
}

uint64_t ClipperLib::Clipper::SetWindingCount(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t *v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  char i;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v2 = *(_QWORD *)(a2 + 136);
  if (v2)
  {
    v3 = *(_DWORD *)(a2 + 80);
    while (1)
    {
      if (*(_DWORD *)(v2 + 80) == v3)
      {
        v4 = *(_DWORD *)(v2 + 88);
        if (v4)
          break;
      }
      v2 = *(_QWORD *)(v2 + 136);
      if (!v2)
        goto LABEL_6;
    }
    v9 = *(_DWORD *)(a2 + 88);
    if (v9)
    {
      v10 = 124;
      if (!v3)
        v10 = 128;
      if (!*(_DWORD *)(result + v10))
        goto LABEL_46;
      v11 = *(_DWORD *)(v2 + 92);
      if (((v11 * v4) & 0x80000000) == 0)
      {
        if (((v9 * v4) & 0x80000000) == 0)
          v12 = *(_DWORD *)(a2 + 88);
        else
          v12 = 0;
        v9 = v11 + v12;
        goto LABEL_46;
      }
LABEL_29:
      if (v11 >= 0)
        v14 = v11;
      else
        v14 = -v11;
      if (v9 <= 1)
        v15 = 1;
      else
        v15 = *(_DWORD *)(a2 + 88);
      if (((v9 * v4) & 0x80000000) == 0)
        v16 = *(_DWORD *)(a2 + 88);
      else
        v16 = 0;
      v17 = v11 + v16;
      if (v14 >= 2)
        v9 = v17;
      else
        v9 = v15;
      goto LABEL_46;
    }
    if (*(_DWORD *)(result + 80) == 1)
    {
      v13 = 124;
      if (!v3)
        v13 = 128;
      if (!*(_DWORD *)(result + v13))
      {
        v18 = *(_QWORD *)(v2 + 136);
        for (i = 1; v18; v18 = *(_QWORD *)(v18 + 136))
        {
          if (*(_DWORD *)(v18 + 80) == v3)
            i ^= *(_DWORD *)(v18 + 88) != 0;
        }
        v9 = (i & 1) == 0;
        goto LABEL_46;
      }
      v11 = *(_DWORD *)(v2 + 92);
      if (v11 * v4 < 0)
        goto LABEL_29;
      v9 = ((v11 >> 31) | 1) + v11;
    }
    else
    {
      v9 = 1;
    }
LABEL_46:
    v7 = *(_DWORD *)(v2 + 96);
    *(_DWORD *)(a2 + 92) = v9;
    *(_DWORD *)(a2 + 96) = v7;
    v8 = (uint64_t *)(v2 + 128);
    goto LABEL_47;
  }
LABEL_6:
  v5 = *(_DWORD *)(a2 + 88);
  v3 = *(_DWORD *)(a2 + 80);
  if (!v5)
  {
    v6 = 124;
    if (!v3)
      v6 = 128;
    if (*(_DWORD *)(result + v6) == 3)
      v5 = -1;
    else
      v5 = 1;
  }
  v7 = 0;
  *(_DWORD *)(a2 + 92) = v5;
  *(_DWORD *)(a2 + 96) = 0;
  v8 = (uint64_t *)(result + *(_QWORD *)(*(_QWORD *)result - 24) + 104);
LABEL_47:
  v20 = *v8;
  v21 = v3 == 0;
  v22 = 128;
  if (v21)
    v22 = 124;
  if (*(_DWORD *)(result + v22))
  {
    if (v20 != a2)
    {
      do
      {
        v7 += *(_DWORD *)(v20 + 88);
        v20 = *(_QWORD *)(v20 + 128);
      }
      while (v20 != a2);
      *(_DWORD *)(a2 + 96) = v7;
    }
  }
  else
  {
    while (v20 != a2)
    {
      if (*(_DWORD *)(v20 + 88))
      {
        v7 = v7 == 0;
        *(_DWORD *)(a2 + 96) = v7;
      }
      v20 = *(_QWORD *)(v20 + 128);
    }
  }
  return result;
}

BOOL ClipperLib::Clipper::IsEvenOddFillType(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = 124;
  if (!*(_DWORD *)(a2 + 80))
    v2 = 128;
  return *(_DWORD *)(a1 + v2) == 0;
}

BOOL ClipperLib::Clipper::IsEvenOddAltFillType(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = 128;
  if (!*(_DWORD *)(a2 + 80))
    v2 = 124;
  return *(_DWORD *)(a1 + v2) == 0;
}

uint64_t ClipperLib::Clipper::IsContributing(uint64_t a1, _DWORD *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;
  BOOL v8;
  uint64_t result;
  unsigned int v10;

  v2 = a2[20];
  v3 = 124;
  if (v2)
    v4 = 124;
  else
    v4 = 128;
  if (v2)
    v3 = 128;
  v5 = *(_DWORD *)(a1 + v3);
  v6 = *(_DWORD *)(a1 + v4);
  switch(v6)
  {
    case 2:
LABEL_10:
      v7 = a2[23];
      goto LABEL_13;
    case 1:
      v7 = a2[23];
      if (v7 < 0)
        v7 = -v7;
LABEL_13:
      if (v7 == 1)
        goto LABEL_14;
      return 0;
    case 0:
      if (a2[22])
        goto LABEL_14;
      goto LABEL_10;
  }
  if (a2[23] != -1)
    return 0;
LABEL_14:
  switch(*(_DWORD *)(a1 + 80))
  {
    case 0:
      v8 = v5 == 2;
      if (v5 >= 2)
        goto LABEL_21;
      return a2[24] != 0;
    case 1:
      goto LABEL_26;
    case 2:
      v8 = v5 == 2;
      if (v2)
      {
        if (v5 < 2)
          return a2[24] != 0;
LABEL_21:
        if (v8)
          return a2[24] > 0;
        v10 = a2[24];
      }
      else
      {
        if (v5 < 2)
          return a2[24] == 0;
LABEL_29:
        if (v8)
          return a2[24] < 1;
        v10 = ~a2[24];
      }
      result = v10 >> 31;
      break;
    case 3:
      if (a2[22])
        return 1;
LABEL_26:
      v8 = v5 == 2;
      if (v5 < 2)
        return a2[24] == 0;
      goto LABEL_29;
    default:
      return 1;
  }
  return result;
}

uint64_t ClipperLib::Clipper::AddLocalMinPoly(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v24;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  _QWORD v30[3];
  __int128 v31;
  uint64_t v32;
  _QWORD v33[3];

  v6 = a2;
  v8 = *(double *)(a3 + 72);
  if (v8 != -1.0e40 && *(double *)(a2 + 72) <= v8)
  {
    v9 = ClipperLib::Clipper::AddOutPt(a1, (_DWORD *)a3, a4);
    *(_DWORD *)(v6 + 100) = *(_DWORD *)(a3 + 100);
    *(_DWORD *)(v6 + 84) = 2;
    *(_DWORD *)(a3 + 84) = 1;
    v10 = *(_QWORD *)(a3 + 136);
    v11 = v6;
    _ZF = v10 == v6;
    v6 = a3;
    if (!_ZF)
      goto LABEL_5;
    goto LABEL_4;
  }
  v9 = ClipperLib::Clipper::AddOutPt(a1, (_DWORD *)a2, a4);
  *(_DWORD *)(a3 + 100) = *(_DWORD *)(v6 + 100);
  *(_DWORD *)(v6 + 84) = 1;
  *(_DWORD *)(a3 + 84) = 2;
  v10 = *(_QWORD *)(v6 + 136);
  v11 = a3;
  if (v10 == a3)
LABEL_4:
    v10 = *(_QWORD *)(v11 + 136);
LABEL_5:
  if (v10 && (*(_DWORD *)(v10 + 100) & 0x80000000) == 0)
  {
    v12 = *(_QWORD *)(a4 + 8);
    if (*(_QWORD *)(v10 + 56) == v12)
    {
      v13 = *(_QWORD *)(v10 + 48);
    }
    else
    {
      v14 = *(double *)(v10 + 72) * (double)(v12 - *(_QWORD *)(v10 + 8));
      v15 = 0.5;
      if (v14 < 0.0)
        v15 = -0.5;
      v13 = *(_QWORD *)v10 + (uint64_t)(v14 + v15);
    }
    if (*(_QWORD *)(v6 + 56) == v12)
    {
      v16 = *(_QWORD *)(v6 + 48);
    }
    else
    {
      v17 = *(double *)(v6 + 72) * (double)(v12 - *(_QWORD *)(v6 + 8));
      v18 = 0.5;
      if (v17 < 0.0)
        v18 = -0.5;
      v16 = *(_QWORD *)v6 + (uint64_t)(v17 + v18);
    }
    if (v13 == v16)
    {
      if (*(_DWORD *)(v6 + 88))
      {
        if (*(_DWORD *)(v10 + 88))
        {
          v33[0] = v13;
          v33[1] = v12;
          __asm { FMOV            V0.2S, #-1.0 }
          v33[2] = _D0;
          v31 = *(_OWORD *)(v10 + 48);
          v32 = *(_QWORD *)(v10 + 64);
          v30[0] = v13;
          v30[1] = v12;
          v30[2] = _D0;
          v28 = *(_OWORD *)(v6 + 48);
          v29 = *(_QWORD *)(v6 + 64);
          if (ClipperLib::SlopesEqual(v33, &v31, v30, &v28, *((unsigned __int8 *)a1 + *(_QWORD *)(*a1 - 24) + 40)))
          {
            v24 = ClipperLib::Clipper::AddOutPt(a1, (_DWORD *)v10, a4);
            v26 = *(_OWORD *)(v6 + 48);
            v27 = *(_QWORD *)(v6 + 64);
            ClipperLib::Clipper::AddJoin(a1, v9, v24, (uint64_t)&v26);
          }
        }
      }
    }
  }
  return v9;
}

uint64_t ClipperLib::Clipper::AddOutPt(_QWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v6;
  ClipperLib::ClipperBase *v7;
  uint64_t v8;
  _QWORD *v9;
  int v10;
  uint64_t v12;
  uint64_t OutRec;
  int v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a2[25];
  v7 = (ClipperLib::ClipperBase *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  if ((v6 & 0x80000000) != 0)
  {
    OutRec = ClipperLib::ClipperBase::CreateOutRec(v7);
    *(_BYTE *)(OutRec + 5) = a2[22] == 0;
    v12 = operator new();
    *(_QWORD *)(OutRec + 24) = v12;
    v14 = *(_DWORD *)OutRec;
    *(_DWORD *)v12 = *(_DWORD *)OutRec;
    v15 = *(_QWORD *)(a3 + 16);
    *(_OWORD *)(v12 + 8) = *(_OWORD *)a3;
    *(_QWORD *)(v12 + 24) = v15;
    *(_QWORD *)(v12 + 32) = v12;
    *(_QWORD *)(v12 + 40) = v12;
    if (!*(_BYTE *)(OutRec + 5))
    {
      ClipperLib::Clipper::SetHoleState(a1, (uint64_t)a2, OutRec);
      v14 = *(_DWORD *)OutRec;
    }
    a2[25] = v14;
  }
  else
  {
    v8 = *(_QWORD *)(*((_QWORD *)v7 + 10) + 8 * v6);
    v9 = *(_QWORD **)(v8 + 24);
    v10 = a2[21];
    if (v10 == 1)
    {
      if (*(_QWORD *)a3 == v9[1] && *(_QWORD *)(a3 + 8) == v9[2])
        return *(_QWORD *)(v8 + 24);
      goto LABEL_16;
    }
    v12 = v9[5];
    if (*(_QWORD *)a3 != *(_QWORD *)(v12 + 8) || *(_QWORD *)(a3 + 8) != *(_QWORD *)(v12 + 16))
    {
LABEL_16:
      v17 = operator new();
      v12 = v17;
      *(_DWORD *)v17 = *(_DWORD *)v8;
      v18 = *(_QWORD *)(a3 + 16);
      *(_OWORD *)(v17 + 8) = *(_OWORD *)a3;
      *(_QWORD *)(v17 + 24) = v18;
      *(_QWORD *)(v17 + 32) = v9;
      v19 = v9[5];
      *(_QWORD *)(v17 + 40) = v19;
      *(_QWORD *)(v19 + 32) = v17;
      v9[5] = v17;
      if (v10 == 1)
        *(_QWORD *)(v8 + 24) = v17;
    }
  }
  return v12;
}

void ClipperLib::Clipper::AddJoin(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;

  v8 = operator new();
  *(_QWORD *)v8 = a2;
  *(_QWORD *)(v8 + 8) = a3;
  *(_OWORD *)(v8 + 16) = *(_OWORD *)a4;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(a4 + 16);
  v9 = a1[3];
  v10 = (uint64_t *)a1[2];
  if ((unint64_t)v10 >= v9)
  {
    v12 = a1[1];
    v13 = ((uint64_t)v10 - v12) >> 3;
    if ((unint64_t)(v13 + 1) >> 61)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v14 = v9 - v12;
    v15 = v14 >> 2;
    if (v14 >> 2 <= (unint64_t)(v13 + 1))
      v15 = v13 + 1;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
      v16 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v16 = v15;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>((uint64_t)(a1 + 3), v16);
    else
      v17 = 0;
    v18 = (uint64_t *)&v17[8 * v13];
    v19 = &v17[8 * v16];
    *v18 = v8;
    v11 = v18 + 1;
    v21 = (char *)a1[1];
    v20 = (char *)a1[2];
    if (v20 != v21)
    {
      do
      {
        v22 = *((_QWORD *)v20 - 1);
        v20 -= 8;
        *--v18 = v22;
      }
      while (v20 != v21);
      v20 = (char *)a1[1];
    }
    a1[1] = v18;
    a1[2] = v11;
    a1[3] = v19;
    if (v20)
      operator delete(v20);
  }
  else
  {
    *v10 = v8;
    v11 = v10 + 1;
  }
  a1[2] = v11;
}

uint64_t ClipperLib::Clipper::AddLocalMaxPoly(_QWORD *a1, _DWORD *a2, _DWORD *a3, uint64_t a4)
{
  uint64_t result;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  result = ClipperLib::Clipper::AddOutPt(a1, a2, a4);
  if (!a3[22])
    result = ClipperLib::Clipper::AddOutPt(a1, a3, a4);
  v9 = a2[25];
  v10 = a3[25];
  if (v9 == v10)
  {
    a2[25] = -1;
    a3[25] = -1;
  }
  else
  {
    if (v9 < v10)
    {
      v11 = (uint64_t)a2;
      v12 = (uint64_t)a3;
    }
    else
    {
      v11 = (uint64_t)a3;
      v12 = (uint64_t)a2;
    }
    return ClipperLib::Clipper::AppendPolygon(a1, v11, v12);
  }
  return result;
}

uint64_t ClipperLib::Clipper::AppendPolygon(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int8x16_t *v20;
  int8x16_t v21;
  int8x16_t *v22;
  int8x16_t v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;

  v6 = *(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 80);
  v7 = *(_QWORD *)(v6 + 8 * *(int *)(a2 + 100));
  v8 = *(_QWORD *)(v6 + 8 * *(int *)(a3 + 100));
  v9 = v7;
  do
    v9 = *(_QWORD *)(v9 + 8);
  while (v9 != v8 && v9 != 0);
  result = v8;
  if (v9 != v8)
  {
    v12 = v8;
    do
      v12 = *(_QWORD *)(v12 + 8);
    while (v12 != v7 && v12 != 0);
    result = v7;
    if (v12 != v7)
      result = ClipperLib::GetLowermostRec(v7, v8);
  }
  v14 = *(_QWORD *)(v7 + 24);
  v15 = *(_QWORD *)(v14 + 40);
  v16 = *(_QWORD *)(v8 + 24);
  v17 = *(_QWORD *)(v16 + 40);
  v18 = *(_DWORD *)(a2 + 84);
  v19 = *(_DWORD *)(a3 + 84);
  if (v18 == 1)
  {
    if (v19 == 1)
    {
      v20 = *(int8x16_t **)(v8 + 24);
      do
      {
        v21 = v20[2];
        v20[2] = vextq_s8(v21, v21, 8uLL);
        v20 = (int8x16_t *)v21.i64[0];
      }
      while (v21.i64[0] != v16);
      *(_QWORD *)(v16 + 32) = v14;
      *(_QWORD *)(v14 + 40) = v16;
      *(_QWORD *)(v15 + 32) = v17;
      *(_QWORD *)(v17 + 40) = v15;
      *(_QWORD *)(v7 + 24) = v17;
    }
    else
    {
      *(_QWORD *)(v17 + 32) = v14;
      *(_QWORD *)(v14 + 40) = v17;
      *(_QWORD *)(v16 + 40) = v15;
      *(_QWORD *)(v15 + 32) = v16;
      *(_QWORD *)(v7 + 24) = v16;
    }
  }
  else if (v19 == 2)
  {
    v22 = *(int8x16_t **)(v8 + 24);
    do
    {
      v23 = v22[2];
      v22[2] = vextq_s8(v23, v23, 8uLL);
      v22 = (int8x16_t *)v23.i64[0];
    }
    while (v23.i64[0] != v16);
    *(_QWORD *)(v15 + 32) = v17;
    *(_QWORD *)(v17 + 40) = v15;
    *(_QWORD *)(v16 + 32) = v14;
    *(_QWORD *)(v14 + 40) = v16;
  }
  else
  {
    *(_QWORD *)(v15 + 32) = v16;
    *(_QWORD *)(v16 + 40) = v15;
    *(_QWORD *)(v14 + 40) = v17;
    *(_QWORD *)(v17 + 32) = v14;
  }
  *(_QWORD *)(v7 + 32) = 0;
  if (result == v8)
  {
    v24 = *(_QWORD *)(v8 + 8);
    if (v24 != v7)
      *(_QWORD *)(v7 + 8) = v24;
    *(_BYTE *)(v7 + 4) = *(_BYTE *)(v8 + 4);
  }
  *(_QWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 32) = 0;
  *(_QWORD *)(v8 + 8) = v7;
  v25 = *(_DWORD *)(a2 + 100);
  v26 = *(_DWORD *)(a3 + 100);
  *(_DWORD *)(a2 + 100) = -1;
  *(_DWORD *)(a3 + 100) = -1;
  v27 = *(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 104);
  if (v27)
  {
    while (*(_DWORD *)(v27 + 100) != v26)
    {
      v27 = *(_QWORD *)(v27 + 128);
      if (!v27)
        goto LABEL_36;
    }
    *(_DWORD *)(v27 + 100) = v25;
    *(_DWORD *)(v27 + 84) = v18;
  }
LABEL_36:
  *(_DWORD *)v8 = *(_DWORD *)v7;
  return result;
}

uint64_t ClipperLib::Clipper::AddEdgeToSEL(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 112);
  *(_QWORD *)(a2 + 152) = 0;
  if (v2)
    *(_QWORD *)(v2 + 152) = a2;
  *(_QWORD *)(result + 112) = a2;
  *(_QWORD *)(a2 + 144) = v2;
  return result;
}

BOOL ClipperLib::Clipper::PopEdgeFromSEL(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(a1 + 112);
  v2 = (_QWORD *)(a1 + 112);
  v3 = v4;
  if (v4)
  {
    *a2 = v3;
    v6 = *(_QWORD *)(*v2 + 144);
    v7 = *(_QWORD *)(*v2 + 152);
    v5 = *v2 + 144;
    if (*(_OWORD *)v5 == 0)
    {
      *v2 = 0;
    }
    else
    {
      v8 = (_QWORD *)(v7 + 144);
      if (!v7)
        v8 = v2;
      *v8 = v6;
      if (v6)
        *(_QWORD *)(v6 + 152) = v7;
    }
    *(_QWORD *)v5 = 0;
    *(_QWORD *)(v5 + 8) = 0;
  }
  return v3 != 0;
}

uint64_t ClipperLib::Clipper::DeleteFromSEL(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(a2 + 144);
  v3 = *(_QWORD *)(a2 + 152);
  if (*(_OWORD *)(a2 + 144) == 0)
  {
    if (*(_QWORD *)(result + 112) != a2)
      return result;
    goto LABEL_5;
  }
  if (!v3)
  {
LABEL_5:
    v4 = (_QWORD *)(result + 112);
    goto LABEL_6;
  }
  v4 = (_QWORD *)(v3 + 144);
LABEL_6:
  *v4 = v2;
  if (v2)
    *(_QWORD *)(v2 + 152) = v3;
  *(_QWORD *)(a2 + 144) = 0;
  *(_QWORD *)(a2 + 152) = 0;
  return result;
}

__n128 ClipperLib::Clipper::CopyAELToSEL(ClipperLib::Clipper *this)
{
  __n128 *v1;
  __n128 result;

  v1 = *(__n128 **)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 104);
  *((_QWORD *)this + 14) = v1;
  if (v1)
  {
    do
    {
      result = v1[8];
      v1[9] = result;
      v1 = (__n128 *)result.n128_u64[0];
    }
    while (result.n128_u64[0]);
  }
  return result;
}

void ClipperLib::Clipper::AddGhostJoin(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;

  v6 = operator new();
  *(_QWORD *)v6 = a2;
  *(_QWORD *)(v6 + 8) = 0;
  *(_OWORD *)(v6 + 16) = *(_OWORD *)a3;
  *(_QWORD *)(v6 + 32) = *(_QWORD *)(a3 + 16);
  v7 = a1[6];
  v8 = (uint64_t *)a1[5];
  if ((unint64_t)v8 >= v7)
  {
    v10 = a1[4];
    v11 = ((uint64_t)v8 - v10) >> 3;
    if ((unint64_t)(v11 + 1) >> 61)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v12 = v7 - v10;
    v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>((uint64_t)(a1 + 6), v14);
    else
      v15 = 0;
    v16 = (uint64_t *)&v15[8 * v11];
    v17 = &v15[8 * v14];
    *v16 = v6;
    v9 = v16 + 1;
    v19 = (char *)a1[4];
    v18 = (char *)a1[5];
    if (v18 != v19)
    {
      do
      {
        v20 = *((_QWORD *)v18 - 1);
        v18 -= 8;
        *--v16 = v20;
      }
      while (v18 != v19);
      v18 = (char *)a1[4];
    }
    a1[4] = v16;
    a1[5] = v9;
    a1[6] = v17;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *v8 = v6;
    v9 = v8 + 1;
  }
  a1[5] = v9;
}

uint64_t *ClipperLib::Clipper::InsertEdgeIntoAEL(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;

  v3 = *result;
  if (!*(uint64_t *)((char *)result + *(_QWORD *)(*result - 24) + 104))
  {
    *(_QWORD *)(a2 + 128) = 0;
    *(_QWORD *)(a2 + 136) = 0;
LABEL_43:
    v16 = (uint64_t *)((char *)result + *(_QWORD *)(v3 - 24) + 104);
    goto LABEL_44;
  }
  if (!a3)
  {
    a3 = *(uint64_t *)((char *)result + *(_QWORD *)(*result - 24) + 104);
    v18 = *(_QWORD *)(a2 + 24);
    v19 = *(_QWORD *)(a3 + 24);
    v20 = v18 < v19;
    if (v18 == v19)
    {
      v21 = *(_QWORD *)(a2 + 56);
      v22 = *(_QWORD *)(a3 + 56);
      if (v21 <= v22)
      {
        if (v21 == v22)
        {
          v25 = *(_QWORD *)(a2 + 48);
        }
        else
        {
          v26 = *(double *)(a2 + 72) * (double)(v22 - *(_QWORD *)(a2 + 8));
          v27 = 0.5;
          if (v26 < 0.0)
            v27 = -0.5;
          v25 = *(_QWORD *)a2 + (uint64_t)(v26 + v27);
        }
        if (*(_QWORD *)(a3 + 48) <= v25)
          goto LABEL_3;
LABEL_42:
        *(_QWORD *)(a2 + 136) = 0;
        *(_QWORD *)(a2 + 128) = *(uint64_t *)((char *)result + *(_QWORD *)(v3 - 24) + 104);
        *(_QWORD *)(*(uint64_t *)((char *)result + *(_QWORD *)(v3 - 24) + 104) + 136) = a2;
        goto LABEL_43;
      }
      v23 = *(double *)(a3 + 72) * (double)(v21 - *(_QWORD *)(a3 + 8));
      v24 = 0.5;
      if (v23 < 0.0)
        v24 = -0.5;
      v20 = *(_QWORD *)(a2 + 48) < *(_QWORD *)a3 + (uint64_t)(v23 + v24);
    }
    if (!v20)
      goto LABEL_3;
    goto LABEL_42;
  }
LABEL_3:
  v4 = *(_QWORD *)(a3 + 128);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 24);
    v6 = a3;
    while (1)
    {
      a3 = v6;
      v6 = v4;
      v7 = *(_QWORD *)(v4 + 24);
      v8 = v5 < v7;
      if (v5 == v7)
      {
        v9 = *(_QWORD *)(a2 + 56);
        v10 = *(_QWORD *)(v6 + 56);
        if (v9 <= v10)
        {
          if (v9 == v10)
          {
            v13 = *(_QWORD *)(a2 + 48);
          }
          else
          {
            v14 = *(double *)(a2 + 72) * (double)(v10 - *(_QWORD *)(a2 + 8));
            if (v14 >= 0.0)
              v15 = 0.5;
            else
              v15 = -0.5;
            v13 = *(_QWORD *)a2 + (uint64_t)(v14 + v15);
          }
          if (*(_QWORD *)(v6 + 48) > v13)
            goto LABEL_24;
          goto LABEL_21;
        }
        v11 = *(double *)(v6 + 72) * (double)(v9 - *(_QWORD *)(v6 + 8));
        if (v11 >= 0.0)
          v12 = 0.5;
        else
          v12 = -0.5;
        v8 = *(_QWORD *)(a2 + 48) < *(_QWORD *)v6 + (uint64_t)(v11 + v12);
      }
      if (v8)
        goto LABEL_24;
LABEL_21:
      v4 = *(_QWORD *)(v6 + 128);
      if (!v4)
      {
        a3 = v6;
        break;
      }
    }
  }
  v6 = 0;
LABEL_24:
  *(_QWORD *)(a2 + 128) = v6;
  v16 = (_QWORD *)(a3 + 128);
  v17 = *(_QWORD *)(a3 + 128);
  if (v17)
    *(_QWORD *)(v17 + 136) = a2;
  *(_QWORD *)(a2 + 136) = a3;
LABEL_44:
  *v16 = a2;
  return result;
}

uint64_t ClipperLib::Clipper::IntersectEdges(uint64_t result, _DWORD *a2, _DWORD *a3, uint64_t a4)
{
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(_DWORD *, _DWORD *, _DWORD *, _DWORD *, uint64_t);
  int v11;
  int v12;
  int v13;
  int v14;
  int *v15;
  int v16;
  int v17;
  int v18;
  _DWORD *v19;
  int v20;
  int v21;
  _BOOL4 v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int *v28;
  int v29;
  int *v30;
  int *v31;
  int v32;
  unint64_t v33;
  unint64_t v34;
  int v35;
  int v36;
  _QWORD *v37;
  _DWORD *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  int v42;

  v7 = result;
  v8 = a2[25];
  v9 = a3[25];
  v10 = *(uint64_t (**)(_DWORD *, _DWORD *, _DWORD *, _DWORD *, uint64_t))(result + 136);
  if (v10)
    result = v10(a2, a2 + 12, a3, a3 + 12, a4);
  v11 = a2[22];
  v12 = a3[22];
  if (!v11)
  {
    if (!v12)
      return result;
    if (a2[20] == a3[20])
    {
      if (*(_DWORD *)(v7 + 80) != 1 || v9 < 0)
        return result;
    }
    else
    {
      v25 = a3[23];
      if (v25 < 0)
        v25 = -v25;
      if (v25 != 1 || *(_DWORD *)(v7 + 80) == 1 && a3[24])
        return result;
    }
    result = ClipperLib::Clipper::AddOutPt((_QWORD *)v7, a2, a4);
    if ((v8 & 0x80000000) == 0)
      a2[25] = -1;
    return result;
  }
  v13 = a2[20];
  v14 = a3[20];
  if (!v12)
  {
    if (v13 == v14)
    {
      if (*(_DWORD *)(v7 + 80) != 1 || v8 < 0)
        return result;
    }
    else
    {
      v26 = a2[23];
      if (v26 < 0)
        v26 = -v26;
      if (v26 != 1 || *(_DWORD *)(v7 + 80) == 1 && a2[24])
        return result;
    }
    result = ClipperLib::Clipper::AddOutPt((_QWORD *)v7, a3, a4);
    if (v9 < 0)
      return result;
    v27 = -1;
    goto LABEL_90;
  }
  if (v13 == v14)
  {
    if (v13)
      v15 = (int *)(v7 + 124);
    else
      v15 = (int *)(v7 + 128);
    v16 = a2[23];
    if (*v15)
    {
      v17 = v16 + v12;
      if (!v17)
        v17 = -v16;
      a2[23] = v17;
      v18 = a3[23] - v11;
      if (v18)
        a3[23] = v18;
      else
        a3[23] = -v11;
    }
    else
    {
      a2[23] = a3[23];
      a3[23] = v16;
    }
  }
  else
  {
    if (v14)
      v19 = (_DWORD *)(v7 + 124);
    else
      v19 = (_DWORD *)(v7 + 128);
    v20 = a2[24];
    v21 = v20 + v12;
    if (*v19)
      v22 = v21;
    else
      v22 = v20 == 0;
    a2[24] = v22;
    if (v13)
      v15 = (int *)(v7 + 124);
    else
      v15 = (int *)(v7 + 128);
    v23 = a3[24];
    if (*v15)
      v24 = v23 - v11;
    else
      v24 = v23 == 0;
    a3[24] = v24;
  }
  if (v13)
    v28 = (int *)(v7 + 128);
  else
    v28 = (int *)(v7 + 124);
  v29 = *v15;
  if (v14)
    v30 = (int *)(v7 + 124);
  else
    v30 = (int *)(v7 + 128);
  if (v14)
    v31 = (int *)(v7 + 128);
  else
    v31 = (int *)(v7 + 124);
  v32 = *v30;
  if (v29 == 3)
  {
    v33 = -(uint64_t)(int)a2[23];
  }
  else if (v29 == 2)
  {
    v33 = (int)a2[23];
  }
  else
  {
    LODWORD(v33) = a2[23];
    if ((v33 & 0x80000000) == 0)
      v33 = v33;
    else
      v33 = -(int)v33;
  }
  if (v32 == 3)
  {
    v34 = -(uint64_t)(int)a3[23];
  }
  else if (v32 == 2)
  {
    v34 = (int)a3[23];
  }
  else
  {
    LODWORD(v34) = a3[23];
    if ((v34 & 0x80000000) == 0)
      v34 = v34;
    else
      v34 = -(int)v34;
  }
  v35 = *v28;
  v36 = *v31;
  if ((v8 & 0x80000000) == 0 && (v9 & 0x80000000) == 0)
  {
    if (v33 > 1 || v34 > 1 || v13 != v14 && *(_DWORD *)(v7 + 80) != 3)
      return ClipperLib::Clipper::AddLocalMaxPoly((_QWORD *)v7, a2, a3, a4);
    ClipperLib::Clipper::AddOutPt((_QWORD *)v7, a2, a4);
LABEL_88:
    v37 = (_QWORD *)v7;
    v38 = a3;
LABEL_89:
    result = ClipperLib::Clipper::AddOutPt(v37, v38, a4);
    v39 = a2[21];
    a2[21] = a3[21];
    a3[21] = v39;
    v27 = a2[25];
    a2[25] = a3[25];
LABEL_90:
    a3[25] = v27;
    return result;
  }
  if ((v8 & 0x80000000) == 0)
  {
    if (v34 > 1)
      return result;
    v37 = (_QWORD *)v7;
    v38 = a2;
    goto LABEL_89;
  }
  if ((v9 & 0x80000000) == 0)
  {
    if (v33 > 1)
      return result;
    goto LABEL_88;
  }
  if (v33 <= 1 && v34 <= 1)
  {
    if (v35 == 3)
    {
      v40 = -(uint64_t)(int)a2[24];
    }
    else if (v35 == 2)
    {
      v40 = (int)a2[24];
    }
    else
    {
      LODWORD(v40) = a2[24];
      if ((int)v40 >= 0)
        v40 = v40;
      else
        v40 = -(int)v40;
    }
    if (v36 == 3)
    {
      v41 = -(uint64_t)(int)a3[24];
    }
    else if (v36 == 2)
    {
      v41 = (int)a3[24];
    }
    else
    {
      LODWORD(v41) = a3[24];
      if ((int)v41 >= 0)
        v41 = v41;
      else
        v41 = -(int)v41;
    }
    if (v13 == v14)
    {
      if (v33 == 1 && v34 == 1)
      {
        switch(*(_DWORD *)(v7 + 80))
        {
          case 0:
            if (v40 >= 1 && v41 >= 1)
              return ClipperLib::Clipper::AddLocalMinPoly((_QWORD *)v7, (uint64_t)a2, (uint64_t)a3, a4);
            return result;
          case 1:
            goto LABEL_120;
          case 2:
            if (v13 == 1 && v40 >= 1 && v41 > 0)
              return ClipperLib::Clipper::AddLocalMinPoly((_QWORD *)v7, (uint64_t)a2, (uint64_t)a3, a4);
            if (v13)
              return result;
LABEL_120:
            if (v40 <= 0 && v41 <= 0)
              return ClipperLib::Clipper::AddLocalMinPoly((_QWORD *)v7, (uint64_t)a2, (uint64_t)a3, a4);
            return result;
          case 3:
            return ClipperLib::Clipper::AddLocalMinPoly((_QWORD *)v7, (uint64_t)a2, (uint64_t)a3, a4);
          default:
            return result;
        }
      }
      v42 = a2[21];
      a2[21] = a3[21];
      a3[21] = v42;
    }
    else
    {
      return ClipperLib::Clipper::AddLocalMinPoly((_QWORD *)v7, (uint64_t)a2, (uint64_t)a3, a4);
    }
  }
  return result;
}

uint64_t ClipperLib::Clipper::SetZ(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 136);
  if (v4)
    return v4(a3, a3 + 48, a4, a4 + 48, a2);
  return result;
}

_QWORD *ClipperLib::Clipper::SetHoleState(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  v3 = *(_QWORD *)(a2 + 136);
  if (v3)
  {
    v4 = 0;
    do
    {
      v5 = v4;
      v6 = *(_DWORD *)(v3 + 100);
      if ((v6 & 0x80000000) == 0)
      {
        if (*(_DWORD *)(v3 + 88))
        {
          v4 = v3;
          if (v5)
          {
            if (*(_DWORD *)(v5 + 100) == v6)
              v4 = 0;
            else
              v4 = v5;
          }
        }
      }
      v3 = *(_QWORD *)(v3 + 136);
    }
    while (v3);
    if (v4)
    {
      v3 = *(_QWORD *)(*(_QWORD *)((char *)result + *(_QWORD *)(*result - 24) + 80) + 8 * *(int *)(v4 + 100));
      LOBYTE(v4) = *(_BYTE *)(v3 + 4) ^ 1;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  *(_QWORD *)(a3 + 8) = v3;
  *(_BYTE *)(a3 + 4) = v4;
  return result;
}

uint64_t ClipperLib::GetLowermostRec(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *BottomPt;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  BottomPt = *(_QWORD **)(a1 + 32);
  if (!BottomPt)
  {
    BottomPt = (_QWORD *)ClipperLib::GetBottomPt(*(_QWORD **)(v3 + 24));
    *(_QWORD *)(v3 + 32) = BottomPt;
  }
  v5 = *(_QWORD **)(a2 + 32);
  if (!v5)
  {
    v5 = (_QWORD *)ClipperLib::GetBottomPt(*(_QWORD **)(a2 + 24));
    *(_QWORD *)(a2 + 32) = v5;
    BottomPt = *(_QWORD **)(v3 + 32);
  }
  v6 = BottomPt[2];
  v7 = v5[2];
  if (v6 <= v7)
  {
    if (v6 < v7)
      return a2;
    v8 = BottomPt[1];
    v9 = v5[1];
    if (v8 < v9)
      return v3;
    if (v8 > v9 || (_QWORD *)BottomPt[4] == BottomPt)
    {
      return a2;
    }
    else if ((_QWORD *)v5[4] != v5 && !ClipperLib::FirstIsBottomPt((uint64_t)BottomPt, v5))
    {
      return a2;
    }
  }
  return v3;
}

BOOL ClipperLib::OutRec1RightOfOutRec2(uint64_t a1, uint64_t a2)
{
  do
    a1 = *(_QWORD *)(a1 + 8);
  while (a1 != a2 && a1 != 0);
  return a1 == a2;
}

int *ClipperLib::Clipper::GetOutRec(ClipperLib::Clipper *this, int a2)
{
  uint64_t v2;
  int *v3;
  int *result;

  v2 = *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 80);
  v3 = *(int **)(v2 + 8 * a2);
  do
  {
    result = v3;
    v3 = *(int **)(v2 + 8 * *v3);
  }
  while (result != v3);
  return result;
}

uint64_t ClipperLib::Clipper::GetLastOutPt(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 80) + 8 * *(int *)(a2 + 100)) + 24;
  if (*(_DWORD *)(a2 + 84) != 1)
    v2 = *(_QWORD *)v2 + 40;
  return *(_QWORD *)v2;
}

void ClipperLib::Clipper::ProcessHorizontal(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD *MaximaPair;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *i;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _DWORD *v46;
  _DWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t *j;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int128 *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  _QWORD *v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  _DWORD *v94;
  _QWORD *v95;
  _QWORD *v96;
  __int128 v97;
  uint64_t v98;
  __int128 v99;
  uint64_t v100;
  __int128 v101;
  uint64_t v102;
  __int128 v103;
  uint64_t v104;
  __int128 v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _QWORD *v112[2];

  v2 = a2;
  v112[0] = a2;
  v4 = *((_DWORD *)a2 + 22);
  v5 = *a2;
  v6 = a2[6];
  v7 = *a2 < v6;
  if (*a2 >= v6)
    v8 = a2[6];
  else
    v8 = *a2;
  if (*a2 < v6)
    v9 = a2[6];
  else
    v9 = *a2;
  v92 = v9;
  v93 = v8;
  v10 = a2;
  while (1)
  {
    v11 = v10;
    v10 = (uint64_t *)v10[15];
    if (!v10)
      break;
    if (*((double *)v10 + 9) != -1.0e40)
    {
      MaximaPair = 0;
      goto LABEL_12;
    }
  }
  MaximaPair = ClipperLib::GetMaximaPair(v11);
LABEL_12:
  v13 = a1 + 11;
  v91 = MaximaPair;
  if (a1[13])
  {
    v14 = (_QWORD *)a1[12];
    if (v5 < v6)
    {
      while (1)
      {
        if (v14 == v13)
        {
          v14 = 0;
          v16 = a1 + 11;
          goto LABEL_30;
        }
        v15 = v14[2];
        if (v15 > v5)
          break;
        v14 = (_QWORD *)v14[1];
      }
      if (v15 >= v11[6])
        v16 = a1 + 11;
      else
        v16 = v14;
      v14 = 0;
      goto LABEL_30;
    }
    v17 = a1 + 11;
    while (v17 != v14)
    {
      v18 = v17;
      v17 = (_QWORD *)*v17;
      v19 = v17[2];
      if (v19 <= v5)
      {
        v16 = 0;
        if (v19 > v11[6])
          v14 = v18;
        goto LABEL_30;
      }
    }
  }
  else
  {
    v14 = 0;
  }
  v16 = 0;
LABEL_30:
  v94 = v11;
  v20 = 0;
  v96 = a1 + 10;
  __asm { FMOV            V9.2S, #-1.0 }
  while (1)
  {
    v90 = v2 + 16;
    v26 = 17;
    if (v7)
      v26 = 16;
    v27 = v2[v26];
    if (v27)
    {
      v95 = v2 + 6;
      do
      {
        if (a1[13])
        {
          if (v7)
          {
            if (v16 == v13)
            {
              v16 = a1 + 11;
              goto LABEL_55;
            }
            while (v16[2] < *(_QWORD *)(v27 + 24))
            {
              if ((*((_DWORD *)v2 + 25) & 0x80000000) == 0 && v4)
              {
                v28 = v2[1];
                v109 = v16[2];
                v110 = v28;
                v111 = _D9;
                ClipperLib::Clipper::AddOutPt(a1, v2, (uint64_t)&v109);
              }
              v16 = (_QWORD *)v16[1];
              if (v16 == v13)
              {
                v16 = a1 + 11;
                break;
              }
            }
          }
          else
          {
            v29 = (_QWORD *)a1[12];
            if (v14 == v29)
              goto LABEL_52;
            while (1)
            {
              v30 = (_QWORD *)*v14;
              if (*(_QWORD *)(*v14 + 16) <= *(_QWORD *)(v27 + 24))
                break;
              if ((*((_DWORD *)v2 + 25) & 0x80000000) == 0 && v4)
              {
                v31 = v2[1];
                v109 = *(_QWORD *)(*v14 + 16);
                v110 = v31;
                v111 = _D9;
                ClipperLib::Clipper::AddOutPt(a1, v2, (uint64_t)&v109);
                v30 = (_QWORD *)*v14;
                v29 = (_QWORD *)a1[12];
              }
              v14 = v30;
              if (v30 == v29)
              {
                v14 = v29;
                break;
              }
            }
          }
        }
        if (!v7)
        {
LABEL_52:
          v32 = *(_QWORD *)(v27 + 24);
          if (v32 < v93)
            break;
          goto LABEL_56;
        }
LABEL_55:
        v32 = *(_QWORD *)(v27 + 24);
        if (v32 > v92)
          break;
LABEL_56:
        if (v32 == *v95)
        {
          v33 = v2[15];
          if (v33)
          {
            if (*(double *)(v27 + 72) < *(double *)(v33 + 72))
              break;
          }
        }
        if ((*((_DWORD *)v2 + 25) & 0x80000000) == 0 && v4)
        {
          v20 = ClipperLib::Clipper::AddOutPt(a1, v2, v27 + 24);
          for (i = (uint64_t *)a1[14]; i; i = (uint64_t *)i[18])
          {
            v35 = *((unsigned int *)i + 25);
            if ((v35 & 0x80000000) == 0)
            {
              v36 = *v2;
              v37 = v2[6];
              v38 = *i;
              v39 = i[6];
              if (*v2 >= v37)
                v40 = v2[6];
              else
                v40 = *v2;
              if (*v2 <= v37)
                v36 = v2[6];
              if (v38 >= v39)
                v41 = i[6];
              else
                v41 = *i;
              if (v38 <= v39)
                v38 = i[6];
              if (v40 < v38 && v41 < v36)
              {
                v43 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)((char *)v96 + *(_QWORD *)(*a1 - 24)) + 8 * v35) + 24);
                if (*((_DWORD *)i + 21) != 1)
                  v43 = (uint64_t *)(*v43 + 40);
                v44 = *v43;
                v107 = *((_OWORD *)i + 3);
                v108 = i[8];
                ClipperLib::Clipper::AddJoin(a1, v44, v20, (uint64_t)&v107);
              }
            }
          }
          v105 = *(_OWORD *)v2;
          v106 = v2[2];
          ClipperLib::Clipper::AddGhostJoin(a1, v20, (uint64_t)&v105);
        }
        if (v2 == (_QWORD *)v94 && (_QWORD *)v27 == v91)
        {
          if ((v94[25] & 0x80000000) == 0)
            ClipperLib::Clipper::AddLocalMaxPoly(a1, v94, v91, (uint64_t)v95);
          v54 = *(_QWORD *)(*a1 - 24);
          v55 = (char *)a1 + v54;
          v57 = v2[16];
          v56 = v2[17];
          if (*((_OWORD *)v2 + 8) == 0)
          {
            if (*((_DWORD **)v55 + 13) == v94)
              goto LABEL_107;
          }
          else
          {
            if (v56)
            {
              v58 = (_QWORD *)(v56 + 128);
              goto LABEL_108;
            }
LABEL_107:
            v58 = v55 + 104;
LABEL_108:
            *v58 = v57;
            if (v57)
              *(_QWORD *)(v57 + 136) = v56;
            *v90 = 0;
            v2[17] = 0;
            v54 = *(_QWORD *)(*a1 - 24);
          }
          v59 = (char *)a1 + v54;
          v60 = v91[16];
          v61 = v91[17];
          if (*((_OWORD *)v91 + 8) == 0)
          {
            if (*((_QWORD **)v59 + 13) == v91)
              goto LABEL_115;
          }
          else
          {
            if (v61)
            {
              v62 = (_QWORD *)(v61 + 128);
              goto LABEL_116;
            }
LABEL_115:
            v62 = v59 + 104;
LABEL_116:
            *v62 = v60;
            if (v60)
              *(_QWORD *)(v60 + 136) = v61;
            v91[16] = 0;
            v91[17] = 0;
          }
          return;
        }
        v45 = v2[4];
        v109 = *(_QWORD *)(v27 + 24);
        v110 = v45;
        v111 = _D9;
        if (v7)
        {
          v46 = v2;
          v47 = (_DWORD *)v27;
        }
        else
        {
          v46 = (_DWORD *)v27;
          v47 = v2;
        }
        ClipperLib::Clipper::IntersectEdges((uint64_t)a1, v46, v47, (uint64_t)&v109);
        v48 = 136;
        if (v7)
          v48 = 128;
        v49 = *(_QWORD *)(v27 + v48);
        ClipperLib::ClipperBase::SwapPositionsInAEL((uint64_t)a1 + *(_QWORD *)(*a1 - 24), (uint64_t)v2, v27);
        v27 = v49;
      }
      while (v49);
    }
    v50 = v2[15];
    if (!v50 || *(double *)(v50 + 72) != -1.0e40)
      break;
    ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)a1 + *(_QWORD *)(*a1 - 24), (uint64_t *)v112);
    v2 = v112[0];
    if ((*((_DWORD *)v112[0] + 25) & 0x80000000) == 0)
      ClipperLib::Clipper::AddOutPt(a1, (_DWORD *)v112[0], (uint64_t)v112[0]);
    v51 = *v2;
    v52 = v2[6];
    v7 = *v2 < v52;
    if (*v2 >= v52)
      v53 = v2[6];
    else
      v53 = *v2;
    if (*v2 < v52)
      v51 = v2[6];
    v92 = v51;
    v93 = v53;
  }
  v63 = *((unsigned int *)v2 + 25);
  if ((v63 & 0x80000000) == 0 && !v20)
  {
    v64 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 80) + 8 * v63) + 24);
    if (*((_DWORD *)v2 + 21) != 1)
      v64 = (uint64_t *)(*v64 + 40);
    v65 = *v64;
    for (j = (uint64_t *)a1[14]; j; j = (uint64_t *)j[18])
    {
      v67 = *((unsigned int *)j + 25);
      if ((v67 & 0x80000000) == 0)
      {
        v68 = *v2;
        v69 = v2[6];
        v70 = *j;
        v71 = j[6];
        if (*v2 >= v69)
          v72 = v2[6];
        else
          v72 = *v2;
        if (*v2 <= v69)
          v68 = v2[6];
        if (v70 >= v71)
          v73 = j[6];
        else
          v73 = *j;
        if (v70 <= v71)
          v70 = j[6];
        if (v72 < v70 && v73 < v68)
        {
          v75 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)((char *)v96 + *(_QWORD *)(*a1 - 24)) + 8 * v67) + 24);
          if (*((_DWORD *)j + 21) != 1)
            v75 = (uint64_t *)(*v75 + 40);
          v76 = *v75;
          v103 = *((_OWORD *)j + 3);
          v104 = j[8];
          ClipperLib::Clipper::AddJoin(a1, v76, v65, (uint64_t)&v103);
        }
      }
    }
    v101 = *((_OWORD *)v2 + 3);
    v102 = v2[8];
    ClipperLib::Clipper::AddGhostJoin(a1, v65, (uint64_t)&v101);
    v50 = v2[15];
  }
  v77 = *((_DWORD *)v2 + 25);
  if (!v50)
  {
    if ((v77 & 0x80000000) == 0)
      ClipperLib::Clipper::AddOutPt(a1, v2, (uint64_t)(v2 + 6));
    v85 = (char *)a1 + *(_QWORD *)(*a1 - 24);
    v87 = v2[16];
    v86 = v2[17];
    if (*((_OWORD *)v2 + 8) == 0)
    {
      if (*((_QWORD **)v85 + 13) != v2)
        return;
    }
    else if (v86)
    {
      v88 = (_QWORD *)(v86 + 128);
LABEL_174:
      *v88 = v87;
      if (v87)
        *(_QWORD *)(v87 + 136) = v86;
      *v90 = 0;
      v2[17] = 0;
      return;
    }
    v88 = v85 + 104;
    goto LABEL_174;
  }
  if (v77 < 0)
  {
    ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)a1 + *(_QWORD *)(*a1 - 24), (uint64_t *)v112);
    return;
  }
  v78 = ClipperLib::Clipper::AddOutPt(a1, v2, (uint64_t)(v2 + 6));
  ClipperLib::ClipperBase::UpdateEdgeIntoAEL((uint64_t)a1 + *(_QWORD *)(*a1 - 24), (uint64_t *)v112);
  v79 = v112[0];
  if (*((_DWORD *)v112[0] + 22))
  {
    v80 = v112[0][16];
    v81 = v112[0][17];
    if (v81
      && *(_QWORD *)(v81 + 24) == *v112[0]
      && (v82 = *(_QWORD *)(v81 + 32), v82 == v112[0][1])
      && *(_DWORD *)(v81 + 88)
      && (*(_DWORD *)(v81 + 100) & 0x80000000) == 0
      && v82 > *(_QWORD *)(v81 + 56)
      && ClipperLib::SlopesEqual(v112[0], *((_QWORD **)v112[0] + 17), *((unsigned __int8 *)a1 + *(_QWORD *)(*a1 - 24) + 40)))
    {
      v83 = ClipperLib::Clipper::AddOutPt(a1, (_DWORD *)v81, (uint64_t)v79);
      v99 = *((_OWORD *)v79 + 3);
      v100 = v79[8];
      v84 = &v99;
    }
    else
    {
      if (!v80)
        return;
      if (*(_QWORD *)(v80 + 24) != *v79)
        return;
      v89 = *(_QWORD *)(v80 + 32);
      if (v89 != v79[1]
        || !*(_DWORD *)(v80 + 88)
        || (*(_DWORD *)(v80 + 100) & 0x80000000) != 0
        || v89 <= *(_QWORD *)(v80 + 56)
        || !ClipperLib::SlopesEqual(v79, (_QWORD *)v80, *((unsigned __int8 *)a1 + *(_QWORD *)(*a1 - 24) + 40)))
      {
        return;
      }
      v83 = ClipperLib::Clipper::AddOutPt(a1, (_DWORD *)v80, (uint64_t)v79);
      v97 = *((_OWORD *)v79 + 3);
      v98 = v79[8];
      v84 = &v97;
    }
    ClipperLib::Clipper::AddJoin(a1, v78, v83, (uint64_t)v84);
  }
}

_QWORD *ClipperLib::GetMaximaPair(_QWORD *a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;

  result = (_QWORD *)a1[13];
  v4 = a1[6];
  v3 = a1[7];
  v5 = result[6] == v4 && result[7] == v3;
  if (!v5 || result[15])
  {
    result = (_QWORD *)a1[14];
    v6 = result[6] == v4 && result[7] == v3;
    if (!v6 || result[15])
      return 0;
  }
  return result;
}

double ClipperLib::GetMaximaPairEx(_QWORD *a1)
{
  double *MaximaPair;
  double result;

  MaximaPair = (double *)ClipperLib::GetMaximaPair(a1);
  if (MaximaPair && *((_DWORD *)MaximaPair + 25) != -2 && *((_QWORD *)MaximaPair + 16) == *((_QWORD *)MaximaPair + 17))
    return MaximaPair[9];
  return result;
}

uint64_t ClipperLib::Clipper::SwapPositionsInSEL(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a2 + 144);
  if (!v3 && !*(_QWORD *)(a2 + 152))
    return result;
  v4 = *(_QWORD *)(a3 + 144);
  if (!v4)
  {
    v6 = (_QWORD *)(a3 + 152);
    v7 = *(_QWORD *)(a3 + 152);
    if (!v7)
      return result;
    if (v3 != a3)
    {
      v5 = *(_QWORD *)(a2 + 152);
      *(_QWORD *)(a2 + 144) = 0;
      *(_QWORD *)(a2 + 152) = v7;
LABEL_11:
      *(_QWORD *)(v7 + 144) = a2;
      goto LABEL_12;
    }
LABEL_17:
    v8 = *(_QWORD *)(a2 + 152);
    if (v8)
      *(_QWORD *)(v8 + 144) = a3;
    *(_QWORD *)(a3 + 144) = a2;
    *(_QWORD *)(a3 + 152) = v8;
    *(_QWORD *)(a2 + 144) = v4;
    *(_QWORD *)(a2 + 152) = a3;
    goto LABEL_25;
  }
  if (v3 == a3)
  {
    *(_QWORD *)(v4 + 152) = a2;
    goto LABEL_17;
  }
  if (v4 == a2)
  {
    if (v3)
      *(_QWORD *)(v3 + 152) = a3;
    v9 = *(_QWORD *)(a3 + 152);
    if (v9)
      *(_QWORD *)(v9 + 144) = a2;
    *(_QWORD *)(a2 + 144) = a3;
    *(_QWORD *)(a2 + 152) = v9;
    *(_QWORD *)(a3 + 144) = v3;
    *(_QWORD *)(a3 + 152) = a2;
    goto LABEL_25;
  }
  v5 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(v4 + 152) = a2;
  v6 = (_QWORD *)(a3 + 152);
  v7 = *(_QWORD *)(a3 + 152);
  *(_QWORD *)(a2 + 144) = v4;
  *(_QWORD *)(a2 + 152) = v7;
  if (v7)
    goto LABEL_11;
LABEL_12:
  *(_QWORD *)(a3 + 144) = v3;
  if (v3)
    *(_QWORD *)(v3 + 152) = a3;
  *v6 = v5;
  if (v5)
    *(_QWORD *)(v5 + 144) = a3;
LABEL_25:
  if (!*(_QWORD *)(a2 + 152) || (a2 = a3, !*(_QWORD *)(a3 + 152)))
    *(_QWORD *)(result + 112) = a2;
  return result;
}

uint64_t ClipperLib::GetNextInAEL(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = 136;
  if (a2 == 1)
    v2 = 128;
  return *(_QWORD *)(a1 + v2);
}

uint64_t *ClipperLib::GetHorzDirection(uint64_t *result, int *a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v4 = *result;
  v5 = result[6];
  v6 = *result < v5;
  if (*result >= v5)
    v4 = result[6];
  *a3 = v4;
  if (v6)
    v7 = result + 6;
  else
    v7 = result;
  v8 = *v7;
  v9 = v6;
  *a4 = v8;
  *a2 = v9;
  return result;
}

_QWORD *ClipperLib::Clipper::BuildIntersectList(_QWORD *this, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  __int128 v5;
  uint64_t v6;
  double v7;
  double v8;
  char **v9;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;

  v2 = *(_QWORD *)((char *)this + *(_QWORD *)(*this - 24) + 104);
  if (v2)
  {
    v4 = this;
    this[14] = v2;
    do
    {
      v5 = *(_OWORD *)(v2 + 128);
      *(_OWORD *)(v2 + 144) = v5;
      if (*(_QWORD *)(v2 + 56) == a2)
      {
        v6 = *(_QWORD *)(v2 + 48);
      }
      else
      {
        v7 = *(double *)(v2 + 72) * (double)(a2 - *(_QWORD *)(v2 + 8));
        if (v7 >= 0.0)
          v8 = 0.5;
        else
          v8 = -0.5;
        v6 = *(_QWORD *)v2 + (uint64_t)(v7 + v8);
      }
      *(_QWORD *)(v2 + 24) = v6;
      v2 = v5;
    }
    while ((_QWORD)v5);
    v9 = (char **)(this + 7);
    __asm { FMOV            V8.2S, #-1.0 }
    while (1)
    {
      v15 = v4[14];
      v16 = *(_QWORD *)(v15 + 144);
      if (!v16)
        break;
      v17 = 0;
      do
      {
        v37 = 0uLL;
        v38 = _D8;
        if (*(_QWORD *)(v15 + 24) <= *(_QWORD *)(v16 + 24))
        {
          v15 = v16;
        }
        else
        {
          ClipperLib::IntersectPoint(v15, v16, (uint64_t *)&v37);
          if (*((uint64_t *)&v37 + 1) < a2)
          {
            if (*(_QWORD *)(v15 + 56) == a2)
            {
              v18 = *(_QWORD *)(v15 + 48);
            }
            else
            {
              v19 = *(double *)(v15 + 72) * (double)(a2 - *(_QWORD *)(v15 + 8));
              if (v19 >= 0.0)
                v20 = 0.5;
              else
                v20 = -0.5;
              v18 = *(_QWORD *)v15 + (uint64_t)(v19 + v20);
            }
            *(_QWORD *)&v37 = v18;
            *((_QWORD *)&v37 + 1) = a2;
            v38 = _D8;
          }
          v21 = operator new();
          v22 = v21;
          *(_QWORD *)v21 = v15;
          *(_QWORD *)(v21 + 8) = v16;
          *(_OWORD *)(v21 + 16) = v37;
          *(_QWORD *)(v21 + 32) = v38;
          v24 = (uint64_t *)v4[8];
          v23 = v4[9];
          if ((unint64_t)v24 >= v23)
          {
            v26 = ((char *)v24 - *v9) >> 3;
            if ((unint64_t)(v26 + 1) >> 61)
              std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
            v27 = v23 - (_QWORD)*v9;
            v28 = v27 >> 2;
            if (v27 >> 2 <= (unint64_t)(v26 + 1))
              v28 = v26 + 1;
            if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
              v29 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v29 = v28;
            if (v29)
              v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>((uint64_t)(v4 + 9), v29);
            else
              v30 = 0;
            v31 = (uint64_t *)&v30[8 * v26];
            *v31 = v22;
            v25 = v31 + 1;
            v33 = (char *)v4[7];
            v32 = (char *)v4[8];
            if (v32 != v33)
            {
              do
              {
                v34 = *((_QWORD *)v32 - 1);
                v32 -= 8;
                *--v31 = v34;
              }
              while (v32 != v33);
              v32 = *v9;
            }
            v4[7] = v31;
            v4[8] = v25;
            v4[9] = &v30[8 * v29];
            if (v32)
              operator delete(v32);
          }
          else
          {
            *v24 = v21;
            v25 = v24 + 1;
          }
          v4[8] = v25;
          this = (_QWORD *)ClipperLib::Clipper::SwapPositionsInSEL((uint64_t)v4, v15, v16);
          v17 = 1;
        }
        v16 = *(_QWORD *)(v15 + 144);
      }
      while (v16);
      v35 = *(_QWORD *)(v15 + 152);
      if (v35)
      {
        *(_QWORD *)(v35 + 144) = 0;
        if ((v17 & 1) != 0)
          continue;
      }
      goto LABEL_46;
    }
    v36 = *(_QWORD *)(v15 + 152);
    if (v36)
      *(_QWORD *)(v36 + 144) = 0;
LABEL_46:
    v4[14] = 0;
  }
  return this;
}

BOOL ClipperLib::Clipper::FixupIntersectionOrder(ClipperLib::Clipper *this)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  BOOL (*v27)(uint64_t, uint64_t);

  v2 = *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24) + 104);
  *((_QWORD *)this + 14) = v2;
  if (v2)
  {
    do
    {
      v3 = *(_OWORD *)(v2 + 128);
      *(_OWORD *)(v2 + 144) = v3;
      v2 = v3;
    }
    while ((_QWORD)v3);
  }
  v4 = *((_QWORD *)this + 7);
  v5 = (uint64_t *)*((_QWORD *)this + 8);
  v6 = 126 - 2 * __clz(((uint64_t)v5 - v4) >> 3);
  v27 = ClipperLib::IntersectListSort;
  if (v5 == (uint64_t *)v4)
    v7 = 0;
  else
    v7 = v6;
  v8 = 1;
  std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,false>(v4, v5, (uint64_t (**)(uint64_t, uint64_t))&v27, v7, 1);
  v9 = *((_QWORD *)this + 8) - *((_QWORD *)this + 7);
  if (v9)
  {
    v8 = 0;
    v10 = 0;
    v11 = v9 >> 3;
    if ((unint64_t)(v9 >> 3) <= 1)
      v12 = 1;
    else
      v12 = v9 >> 3;
    v13 = 1;
    do
    {
      if (v11 <= v13)
        v14 = v13;
      else
        v14 = v11;
      v15 = *((_QWORD *)this + 7);
      v16 = *(uint64_t **)(v15 + 8 * v10);
      v17 = *v16;
      v18 = v16[1];
      v19 = *(_QWORD *)(*v16 + 144);
      if (v19 != v18)
      {
        if (*(_QWORD *)(v17 + 152) == v18)
        {
          v19 = v16[1];
        }
        else
        {
          v20 = v13;
          v21 = v10;
          while (1)
          {
            if (v20 >= v11)
            {
              v21 = v14;
              goto LABEL_24;
            }
            v22 = *(uint64_t **)(v15 + 8 * v20);
            v24 = *v22;
            v23 = v22[1];
            if (*(_QWORD *)(v24 + 144) == v23)
              break;
            ++v20;
            ++v21;
            if (*(_QWORD *)(v24 + 152) == v23)
              goto LABEL_24;
          }
          v21 = v20;
LABEL_24:
          if (v21 == v11)
            return v8;
          *(_QWORD *)(v15 + 8 * v10) = *(_QWORD *)(v15 + 8 * v21);
          *(_QWORD *)(v15 + 8 * v21) = v16;
          v25 = *(uint64_t **)(*((_QWORD *)this + 7) + 8 * v10);
          v17 = *v25;
          v19 = v25[1];
        }
      }
      ClipperLib::Clipper::SwapPositionsInSEL((uint64_t)this, v17, v19);
      v8 = ++v10 >= v11;
      ++v13;
    }
    while (v10 != v12);
  }
  return v8;
}

_QWORD *ClipperLib::Clipper::ProcessIntersectList(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t *v4;

  v1 = this;
  v2 = this[8];
  if (v2 != this[7])
  {
    v3 = 0;
    v2 = this[7];
    do
    {
      v4 = *(uint64_t **)(v2 + 8 * v3);
      ClipperLib::Clipper::IntersectEdges((uint64_t)v1, (_DWORD *)*v4, (_DWORD *)v4[1], (uint64_t)(v4 + 2));
      ClipperLib::ClipperBase::SwapPositionsInAEL((uint64_t)v1 + *(_QWORD *)(*v1 - 24), *v4, v4[1]);
      this = (_QWORD *)MEMORY[0x242665874](v4, 0x1020C40E349F4B1);
      ++v3;
      v2 = v1[7];
    }
    while (v3 < (v1[8] - v2) >> 3);
  }
  v1[8] = v2;
  return this;
}

uint64_t ClipperLib::Clipper::DisposeIntersectNodes(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v1 = this;
  v3 = *(_QWORD *)(this + 56);
  v2 = *(_QWORD *)(this + 64);
  if (v2 == v3)
  {
    v3 = *(_QWORD *)(this + 64);
  }
  else
  {
    v4 = 0;
    do
    {
      this = *(_QWORD *)(v3 + 8 * v4);
      if (this)
      {
        this = MEMORY[0x242665874](this, 0x1020C40E349F4B1);
        v3 = *(_QWORD *)(v1 + 56);
        v2 = *(_QWORD *)(v1 + 64);
      }
      ++v4;
    }
    while (v4 < (v2 - v3) >> 3);
  }
  *(_QWORD *)(v1 + 64) = v3;
  return this;
}

BOOL ClipperLib::IntersectListSort(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24) < *(_QWORD *)(a1 + 24);
}

void ClipperLib::Clipper::DoMaxima(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _BOOL4 v8;
  BOOL v9;
  BOOL v10;
  int v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t *v23;
  char *v24;
  uint64_t v25;
  char v26;
  uint64_t *v27;
  _QWORD *v28;
  ClipperLib::clipperException *exception;

  ClipperLib::GetMaximaPairEx((_QWORD *)a2);
  if (v4)
  {
    v5 = v4;
    v7 = (_QWORD *)(a2 + 128);
    v6 = *(_QWORD *)(a2 + 128);
    v8 = v6 != 0;
    if (v6)
      v9 = v6 == v4;
    else
      v9 = 1;
    if (!v9)
    {
      do
      {
        ClipperLib::Clipper::IntersectEdges((uint64_t)a1, (_DWORD *)a2, (_DWORD *)v6, a2 + 48);
        ClipperLib::ClipperBase::SwapPositionsInAEL((uint64_t)a1 + *(_QWORD *)(*a1 - 24), a2, v6);
        v6 = *(_QWORD *)(a2 + 128);
        v8 = v6 != 0;
        if (v6)
          v10 = v6 == v5;
        else
          v10 = 1;
      }
      while (!v10);
    }
    v11 = *(_DWORD *)(a2 + 100);
    if (v11 != -1)
    {
      if ((v11 & 0x80000000) == 0)
      {
        if ((*(_DWORD *)(v5 + 100) & 0x80000000) == 0)
        {
          ClipperLib::Clipper::AddLocalMaxPoly(a1, (_DWORD *)a2, (_DWORD *)v5, a2 + 48);
          v12 = *(_QWORD *)(*a1 - 24);
          v13 = (char *)a1 + v12;
          v15 = *(_QWORD *)(a2 + 128);
          v14 = *(_QWORD *)(a2 + 136);
          if (*(_OWORD *)(a2 + 128) != 0)
          {
            if (v14)
            {
              v16 = (_QWORD *)(v14 + 128);
              goto LABEL_46;
            }
LABEL_45:
            v16 = v13 + 104;
LABEL_46:
            *v16 = v15;
            if (v15)
              *(_QWORD *)(v15 + 136) = v14;
LABEL_52:
            *v7 = 0;
            *(_QWORD *)(a2 + 136) = 0;
            v12 = *(_QWORD *)(*a1 - 24);
            goto LABEL_53;
          }
          if (*((_QWORD *)v13 + 13) == a2)
            goto LABEL_45;
LABEL_53:
          v17 = (char *)a1 + v12;
          goto LABEL_54;
        }
        if (!*(_DWORD *)(a2 + 88))
        {
          ClipperLib::Clipper::AddOutPt(a1, (_DWORD *)a2, a2 + 48);
          *(_DWORD *)(a2 + 100) = -1;
          v6 = *(_QWORD *)(a2 + 128);
LABEL_27:
          v21 = (char *)a1 + *(_QWORD *)(*a1 - 24);
          v22 = *(_QWORD *)(a2 + 136);
          if (v22 | v6)
          {
            if (v22)
            {
              v23 = (uint64_t *)(v22 + 128);
LABEL_32:
              *v23 = v6;
              if (v6)
                *(_QWORD *)(v6 + 136) = v22;
              *v7 = 0;
              *(_QWORD *)(a2 + 136) = 0;
              goto LABEL_35;
            }
          }
          else if (*((_QWORD *)v21 + 13) != a2)
          {
LABEL_35:
            if ((*(_DWORD *)(v5 + 100) & 0x80000000) == 0)
            {
              ClipperLib::Clipper::AddOutPt(a1, (_DWORD *)v5, a2 + 48);
              *(_DWORD *)(v5 + 100) = -1;
            }
            v17 = (char *)a1 + *(_QWORD *)(*a1 - 24);
LABEL_54:
            v19 = *(_QWORD *)(v5 + 128);
            v20 = *(_QWORD *)(v5 + 136);
            v18 = (_QWORD *)(v5 + 128);
            if (*(_OWORD *)(v5 + 128) == 0)
            {
              if (*((_QWORD *)v17 + 13) != v5)
                return;
              goto LABEL_58;
            }
            goto LABEL_55;
          }
          v23 = (uint64_t *)(v21 + 104);
          goto LABEL_32;
        }
LABEL_63:
        exception = (ClipperLib::clipperException *)__cxa_allocate_exception(0x20uLL);
        ClipperLib::clipperException::clipperException(exception, "DoMaxima error");
      }
LABEL_23:
      if (!*(_DWORD *)(a2 + 88))
        goto LABEL_27;
      goto LABEL_63;
    }
    if (*(_DWORD *)(v5 + 100) != -1)
      goto LABEL_23;
    v12 = *(_QWORD *)(*a1 - 24);
    v24 = (char *)a1 + v12;
    v25 = *(_QWORD *)(a2 + 136);
    if (v25)
      v26 = 1;
    else
      v26 = v8;
    if ((v26 & 1) != 0)
    {
      if (v25)
      {
        v27 = (uint64_t *)(v25 + 128);
        goto LABEL_50;
      }
    }
    else if (*((_QWORD *)v24 + 13) != a2)
    {
      goto LABEL_53;
    }
    v27 = (uint64_t *)(v24 + 104);
LABEL_50:
    *v27 = v6;
    if (v8)
      *(_QWORD *)(v6 + 136) = v25;
    goto LABEL_52;
  }
  if ((*(_DWORD *)(a2 + 100) & 0x80000000) == 0)
    ClipperLib::Clipper::AddOutPt(a1, (_DWORD *)a2, a2 + 48);
  v17 = (char *)a1 + *(_QWORD *)(*a1 - 24);
  v19 = *(_QWORD *)(a2 + 128);
  v20 = *(_QWORD *)(a2 + 136);
  v18 = (_QWORD *)(a2 + 128);
  if (*(_OWORD *)(a2 + 128) == 0)
  {
    if (*((_QWORD *)v17 + 13) != a2)
      return;
    goto LABEL_58;
  }
LABEL_55:
  if (!v20)
  {
LABEL_58:
    v28 = v17 + 104;
    goto LABEL_59;
  }
  v28 = (_QWORD *)(v20 + 128);
LABEL_59:
  *v28 = v19;
  if (v19)
    *(_QWORD *)(v19 + 136) = v20;
  *v18 = 0;
  v18[1] = 0;
}

void sub_23F0F27CC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t ClipperLib::PointCount(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 0;
  if (a1)
  {
    v2 = a1;
    do
    {
      v1 = (v1 + 1);
      v2 = *(_QWORD *)(v2 + 32);
    }
    while (v2 != a1);
  }
  return v1;
}

uint64_t std::vector<std::vector<ClipperLib::IntPoint>>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 24 * v6;
    std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_23F0F28A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<ClipperLib::IntPoint>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 24;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(v3, a2);
    v7 = &v6[24 * v5];
    v9 = &v6[24 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void std::vector<ClipperLib::PolyNode *>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

__n128 ClipperLib::SwapIntersectNodes(__int128 *a1, __int128 *a2)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __n128 result;

  v2 = *((_QWORD *)a1 + 4);
  v4 = *a1;
  v3 = a1[1];
  *a1 = *a2;
  result = (__n128)a2[1];
  *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
  a1[1] = (__int128)result;
  *a2 = v4;
  a2[1] = v3;
  *((_QWORD *)a2 + 4) = v2;
  return result;
}

BOOL ClipperLib::GetOverlap(ClipperLib *this, uint64_t a2, uint64_t a3, uint64_t a4, ClipperLib **a5, ClipperLib **a6, uint64_t *a7)
{
  ClipperLib *v7;
  ClipperLib *v8;
  uint64_t v9;
  ClipperLib *v10;
  uint64_t v11;

  if ((uint64_t)this >= a2)
  {
    if (a3 >= a4)
    {
      if (a2 <= a4)
        v11 = a4;
      else
        v11 = a2;
      *a5 = (ClipperLib *)v11;
      if (a3 >= (uint64_t)this)
        v8 = this;
      else
        v8 = (ClipperLib *)a3;
    }
    else
    {
      if (a2 <= a3)
        v9 = a3;
      else
        v9 = a2;
      *a5 = (ClipperLib *)v9;
      if (a4 >= (uint64_t)this)
        v8 = this;
      else
        v8 = (ClipperLib *)a4;
    }
  }
  else if (a3 >= a4)
  {
    if ((uint64_t)this <= a4)
      v10 = (ClipperLib *)a4;
    else
      v10 = this;
    *a5 = v10;
    if (a3 >= a2)
      v8 = (ClipperLib *)a2;
    else
      v8 = (ClipperLib *)a3;
  }
  else
  {
    if ((uint64_t)this <= a3)
      v7 = (ClipperLib *)a3;
    else
      v7 = this;
    *a5 = v7;
    if (a4 >= a2)
      v8 = (ClipperLib *)a2;
    else
      v8 = (ClipperLib *)a4;
  }
  *a6 = v8;
  return (uint64_t)*a5 < (uint64_t)v8;
}

uint64_t ClipperLib::DupOutPt(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;

  result = operator new();
  *(_OWORD *)(result + 8) = *(_OWORD *)(a1 + 8);
  *(_QWORD *)(result + 24) = *(_QWORD *)(a1 + 24);
  *(_DWORD *)result = *(_DWORD *)a1;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = (uint64_t *)(a1 + 32);
    *(_QWORD *)(result + 32) = v6;
    *(_QWORD *)(result + 40) = a1;
    v7 = (uint64_t *)(v6 + 40);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    v5 = (uint64_t *)(a1 + 40);
    *(_QWORD *)(result + 32) = a1;
    *(_QWORD *)(result + 40) = v8;
    v7 = (uint64_t *)(v8 + 32);
  }
  *v7 = result;
  *v5 = result;
  return result;
}

uint64_t ClipperLib::JoinHorz(_QWORD *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t *a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  int v23;
  uint64_t v24;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  __int128 v34;
  int v35;
  uint64_t v36;
  __int128 v38;
  uint64_t *v39;
  unsigned int v41;

  v6 = a1[1];
  v7 = *(_QWORD *)(a2 + 8);
  v8 = v6 <= v7;
  v9 = a3[1];
  v10 = *(_QWORD *)(a4 + 8);
  v11 = v9 <= v10;
  v12 = v8 ^ v11;
  if (v8 == v11)
    return v12;
  v15 = a3;
  v41 = v8 ^ v11;
  v16 = *a5;
  if (v6 > v7)
  {
    do
    {
      v17 = (uint64_t)a1;
      a1 = (_QWORD *)a1[4];
      v24 = a1[1];
    }
    while (v24 >= v16 && v24 <= *(_QWORD *)(v17 + 8) && a1[2] == a5[1]);
    if ((a6 & 1) == 0 && *(_QWORD *)(v17 + 8) != v16)
      v17 = (uint64_t)a1;
    v19 = ClipperLib::DupOutPt(v17, a6);
    v20 = v19;
    if (*(_QWORD *)(v19 + 8) != *a5 || *(_QWORD *)(v19 + 16) != a5[1])
    {
      v26 = *(_OWORD *)a5;
      *(_QWORD *)(v19 + 24) = a5[2];
      *(_OWORD *)(v19 + 8) = v26;
      v23 = a6;
      goto LABEL_25;
    }
  }
  else
  {
    do
    {
      v17 = (uint64_t)a1;
      a1 = (_QWORD *)a1[4];
      v18 = a1[1];
    }
    while (v18 <= v16 && v18 >= *(_QWORD *)(v17 + 8) && a1[2] == a5[1]);
    if (a6 && *(_QWORD *)(v17 + 8) != v16)
      v17 = (uint64_t)a1;
    v19 = ClipperLib::DupOutPt(v17, a6 ^ 1u);
    v20 = v19;
    if (*(_QWORD *)(v19 + 8) != *a5 || *(_QWORD *)(v19 + 16) != a5[1])
    {
      v22 = *(_OWORD *)a5;
      *(_QWORD *)(v19 + 24) = a5[2];
      *(_OWORD *)(v19 + 8) = v22;
      v23 = a6 ^ 1;
LABEL_25:
      v27 = ClipperLib::DupOutPt(v19, v23);
      goto LABEL_27;
    }
  }
  v27 = v20;
  v20 = v17;
LABEL_27:
  v28 = *a5;
  if (v9 > v10)
  {
    do
    {
      v29 = v15;
      v15 = (_QWORD *)v15[4];
      v36 = v15[1];
    }
    while (v36 >= v28 && v36 <= v29[1] && v15[2] == a5[1]);
    if ((a6 & 1) == 0 && v29[1] != v28)
      v29 = v15;
    v31 = (_QWORD *)ClipperLib::DupOutPt((uint64_t)v29, a6);
    v32 = (uint64_t)v31;
    if (v31[1] == *a5 && v31[2] == a5[1])
      goto LABEL_51;
    v38 = *(_OWORD *)a5;
    v31[3] = a5[2];
    *(_OWORD *)(v31 + 1) = v38;
    v35 = a6;
  }
  else
  {
    do
    {
      v29 = v15;
      v15 = (_QWORD *)v15[4];
      v30 = v15[1];
    }
    while (v30 <= v28 && v30 >= v29[1] && v15[2] == a5[1]);
    if (a6 && v29[1] != v28)
      v29 = v15;
    v31 = (_QWORD *)ClipperLib::DupOutPt((uint64_t)v29, a6 ^ 1u);
    v32 = (uint64_t)v31;
    if (v31[1] == *a5 && v31[2] == a5[1])
      goto LABEL_51;
    v34 = *(_OWORD *)a5;
    v31[3] = a5[2];
    *(_OWORD *)(v31 + 1) = v34;
    v35 = a6 ^ 1;
  }
  v29 = (_QWORD *)v32;
  v32 = ClipperLib::DupOutPt((uint64_t)v31, v35);
LABEL_51:
  v12 = v41;
  if ((((v6 <= v7) ^ a6) & 1) != 0)
  {
    *(_QWORD *)(v20 + 32) = v29;
    v29[5] = v20;
    v39 = (uint64_t *)(v32 + 32);
    *(_QWORD *)(v27 + 40) = v32;
  }
  else
  {
    *(_QWORD *)(v20 + 40) = v29;
    v29[4] = v20;
    v39 = (uint64_t *)(v32 + 40);
    *(_QWORD *)(v27 + 32) = v32;
  }
  *v39 = v27;
  return v12;
}

uint64_t ClipperLib::Clipper::JoinPoints(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 *v13;
  BOOL v14;
  _QWORD *v15;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v28;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int *v47;
  int *v48;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  int v56;
  uint64_t v57;
  int v60;
  uint64_t result;
  uint64_t v62;
  __int128 *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  int v71;
  uint64_t v72;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  __int128 v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  __int128 v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  int v106;
  int v107;
  int v108;
  __int128 v111;
  uint64_t v112;
  __int128 v113;
  uint64_t v114;
  __int128 v115;
  uint64_t v116;
  __int128 v117;
  uint64_t v118;
  __int128 v119;
  uint64_t v120;
  __int128 v121;
  uint64_t v122;
  __int128 v123;
  uint64_t v124;
  __int128 v125;
  uint64_t v126;
  __int128 v127;
  uint64_t v128;
  __int128 v129;
  uint64_t v130;
  __int128 v131;
  uint64_t v132;
  __int128 v133;
  uint64_t v134;
  uint64_t v135[2];
  int v136;
  int v137;

  v6 = (_QWORD *)*a2;
  v5 = (_QWORD *)a2[1];
  v8 = (uint64_t *)(*a2 + 8);
  v7 = *v8;
  v9 = *(_QWORD *)(*a2 + 16);
  v10 = a2 + 2;
  if (v9 != a2[3])
  {
    v50 = (uint64_t)(v6 + 4);
    do
    {
      v51 = *(_QWORD **)v50;
      v53 = *(_QWORD *)(*(_QWORD *)v50 + 8);
      v52 = *(_QWORD *)(*(_QWORD *)v50 + 16);
      v50 = *(_QWORD *)v50 + 32;
    }
    while (v51 != v6 && v53 == v7 && v52 == v9);
    if (v52 <= v9
      && (v133 = *(_OWORD *)v8,
          v134 = v8[2],
          v131 = *(_OWORD *)(v51 + 1),
          v132 = v51[3],
          v129 = *(_OWORD *)v10,
          v130 = a2[4],
          v56 = *((unsigned __int8 *)a1 + *(_QWORD *)(*a1 - 24) + 40),
          ClipperLib::SlopesEqual(&v133, (uint64_t *)&v131, &v129, v56)))
    {
      v107 = 0;
      v108 = v56;
    }
    else
    {
      v51 = v6;
      do
      {
        v51 = (_QWORD *)v51[5];
        v57 = v51[2];
      }
      while (v51 != v6 && v51[1] == v7 && v57 == v9);
      if (v57 > v9)
        return 0;
      v127 = *(_OWORD *)v8;
      v128 = v8[2];
      v125 = *(_OWORD *)(v51 + 1);
      v126 = v51[3];
      v123 = *(_OWORD *)v10;
      v124 = v10[2];
      v60 = *((unsigned __int8 *)a1 + *(_QWORD *)(*a1 - 24) + 40);
      result = ClipperLib::SlopesEqual(&v127, (uint64_t *)&v125, &v123, v60);
      if (!(_DWORD)result)
        return result;
      v107 = 1;
      v108 = v60;
    }
    v63 = (__int128 *)(v5 + 1);
    v62 = v5[1];
    v64 = (uint64_t)(v5 + 4);
    v65 = v5[2];
    do
    {
      v66 = *(_QWORD **)v64;
      v68 = *(_QWORD *)(*(_QWORD *)v64 + 8);
      v67 = *(_QWORD *)(*(_QWORD *)v64 + 16);
      v64 = *(_QWORD *)v64 + 32;
    }
    while (v68 == v62 && v67 == v65 && v66 != v5);
    if (v67 <= v65
      && (v121 = *v63,
          v122 = v5[3],
          v119 = *(_OWORD *)(v66 + 1),
          v120 = v66[3],
          v117 = *(_OWORD *)v10,
          v118 = v10[2],
          ClipperLib::SlopesEqual(&v121, (uint64_t *)&v119, &v117, v108 != 0)))
    {
      v71 = 0;
    }
    else
    {
      v66 = v5;
      do
      {
        v66 = (_QWORD *)v66[5];
        v72 = v66[2];
      }
      while (v66[1] == v62 && v72 == v65 && v66 != v5);
      if (v72 > v65)
        return 0;
      v115 = *v63;
      v116 = v5[3];
      v113 = *(_OWORD *)(v66 + 1);
      v114 = v66[3];
      v111 = *(_OWORD *)v10;
      v112 = v10[2];
      result = ClipperLib::SlopesEqual(&v115, (uint64_t *)&v113, &v111, v108 != 0);
      if (!(_DWORD)result)
        return result;
      v71 = 1;
    }
    result = 0;
    if (v51 == v66 || v51 == v6 || v66 == v5)
      return result;
    if (a3 != a4 || v107 != v71)
    {
      v75 = operator new();
      v76 = v75;
      v77 = *(_OWORD *)v8;
      *(_QWORD *)(v75 + 24) = v8[2];
      *(_OWORD *)(v75 + 8) = v77;
      *(_DWORD *)v75 = *(_DWORD *)v6;
      if (v107)
      {
        v78 = v6[5];
        *(_QWORD *)(v75 + 32) = v6;
        *(_QWORD *)(v75 + 40) = v78;
        *(_QWORD *)(v78 + 32) = v75;
        v6[5] = v75;
        v79 = operator new();
        v80 = *v63;
        *(_QWORD *)(v79 + 24) = v5[3];
        *(_OWORD *)(v79 + 8) = v80;
        *(_DWORD *)v79 = *(_DWORD *)v5;
        v81 = v5[4];
        *(_QWORD *)(v79 + 32) = v81;
        *(_QWORD *)(v81 + 40) = v79;
        v6[5] = v5;
        v5[4] = v6;
        *(_QWORD *)(v76 + 32) = v79;
        *(_QWORD *)(v79 + 40) = v76;
      }
      else
      {
        v96 = v6[4];
        *(_QWORD *)(v75 + 32) = v96;
        *(_QWORD *)(v75 + 40) = v6;
        *(_QWORD *)(v96 + 40) = v75;
        v6[4] = v75;
        v97 = operator new();
        v98 = *v63;
        *(_QWORD *)(v97 + 24) = v5[3];
        *(_OWORD *)(v97 + 8) = v98;
        *(_DWORD *)v97 = *(_DWORD *)v5;
        v99 = v5[5];
        *(_QWORD *)(v97 + 40) = v99;
        *(_QWORD *)(v99 + 32) = v97;
        v6[4] = v5;
        v5[5] = v6;
        *(_QWORD *)(v76 + 40) = v97;
        *(_QWORD *)(v97 + 32) = v76;
      }
      *a2 = v6;
      a2[1] = v76;
      return 1;
    }
    return 0;
  }
  v11 = *v10;
  v12 = (_QWORD *)*a2;
  if (*v10 != v7
    || ((v13 = (__int128 *)(v5 + 1), v11 == v5[1]) ? (v14 = v9 == v5[2]) : (v14 = 0), v12 = (_QWORD *)*a2, !v14))
  {
    do
    {
      v15 = v12;
      v12 = (_QWORD *)v12[5];
    }
    while (v12 != v6 && v12[2] == v9 && v12 != v5);
    v18 = v15 + 2;
    do
    {
      v19 = (uint64_t)v6;
      v6 = (_QWORD *)v6[4];
    }
    while (v6 != v15 && v6[2] == v9 && v6 != v5);
    if (v6 != v15 && v6 != v5)
    {
      v23 = v5[2];
      v24 = v5;
      do
      {
        v25 = v24;
        v24 = (_QWORD *)v24[5];
      }
      while (v24 != (_QWORD *)v19 && v24[2] == v23 && v24 != v5);
      do
      {
        v28 = (uint64_t)v5;
        v5 = (_QWORD *)v5[4];
      }
      while (v5 != v15 && v5 != v25 && v5[2] == v23);
      if (v5 != v25 && v5 != v15)
      {
        v32 = v15[1];
        v33 = *(_QWORD *)(v19 + 8);
        v34 = v25[1];
        v35 = *(_QWORD *)(v28 + 8);
        v36 = v34 < v35;
        v37 = v33 <= v35 ? *(_QWORD *)(v28 + 8) : *(_QWORD *)(v19 + 8);
        v38 = v34 >= v32 ? v15[1] : v25[1];
        v39 = v33 <= v34 ? v25[1] : *(_QWORD *)(v19 + 8);
        v40 = v35 >= v32 ? v15[1] : *(_QWORD *)(v28 + 8);
        if (v34 >= v35)
          v40 = v38;
        else
          v37 = v39;
        v41 = v32 <= v35 ? *(_QWORD *)(v28 + 8) : v15[1];
        v42 = v34 >= v33 ? *(_QWORD *)(v19 + 8) : v25[1];
        v43 = v32 <= v34 ? v25[1] : v15[1];
        v44 = v35 >= v33 ? *(_QWORD *)(v19 + 8) : *(_QWORD *)(v28 + 8);
        if (v34 >= v35)
        {
          v45 = v42;
        }
        else
        {
          v41 = v43;
          v45 = v44;
        }
        if (v32 < v33)
        {
          v46 = v45;
        }
        else
        {
          v41 = v37;
          v46 = v40;
        }
        if (v41 < v46)
        {
          if (v32 < v41 || v32 > v46)
          {
            if (v34 < v41 || v34 > v46)
            {
              if (v33 < v41 || v33 > v46)
              {
                v18 = (uint64_t *)(v28 + 16);
                v47 = (int *)(v28 + 24);
                v48 = (int *)(v28 + 28);
              }
              else
              {
                v47 = (int *)(v19 + 24);
                v48 = (int *)(v19 + 28);
                v18 = (uint64_t *)(v19 + 16);
                v35 = *(_QWORD *)(v19 + 8);
                v36 = v32 < v33;
              }
            }
            else
            {
              v47 = (int *)(v25 + 3);
              v48 = (int *)v25 + 7;
              v36 = v34 > v35;
              v18 = v25 + 2;
              v35 = v25[1];
            }
          }
          else
          {
            v47 = (int *)(v15 + 3);
            v48 = (int *)v15 + 7;
            v36 = v32 > v33;
            v35 = v15[1];
          }
          v104 = *v18;
          v105 = *v47;
          v106 = *v48;
          *a2 = v15;
          a2[1] = v25;
          v135[0] = v35;
          v135[1] = v104;
          v136 = v105;
          v137 = v106;
          return ClipperLib::JoinHorz(v15, v19, v25, v28, v135, v36);
        }
      }
    }
    return 0;
  }
  if (a3 != a4)
    return 0;
  v82 = (_QWORD *)*a2;
  while (1)
  {
    v82 = (_QWORD *)v82[4];
    if (v82 == v6)
      break;
    v83 = v82[2];
    if (v82[1] != v11 || v83 != v9)
      goto LABEL_152;
  }
  v83 = *(_QWORD *)(*a2 + 16);
LABEL_152:
  v85 = (_QWORD *)a2[1];
  while (1)
  {
    v85 = (_QWORD *)v85[4];
    if (v85 == v5)
      break;
    v86 = v85[2];
    if (v85[1] != v11 || v86 != v9)
    {
      if (v83 > v9 != v86 <= v9)
        return 0;
      goto LABEL_161;
    }
  }
  if (v83 <= v9)
    return 0;
LABEL_161:
  v88 = operator new();
  v89 = v88;
  v90 = *(_OWORD *)v8;
  *(_QWORD *)(v88 + 24) = v8[2];
  *(_OWORD *)(v88 + 8) = v90;
  *(_DWORD *)v88 = *(_DWORD *)v6;
  if (v83 <= v9)
  {
    v100 = v6[4];
    *(_QWORD *)(v88 + 32) = v100;
    *(_QWORD *)(v88 + 40) = v6;
    *(_QWORD *)(v100 + 40) = v88;
    v6[4] = v88;
    v101 = operator new();
    v102 = *v13;
    *(_QWORD *)(v101 + 24) = v5[3];
    *(_OWORD *)(v101 + 8) = v102;
    *(_DWORD *)v101 = *(_DWORD *)v5;
    v103 = v5[5];
    *(_QWORD *)(v101 + 40) = v103;
    v95 = (uint64_t *)(v101 + 32);
    *(_QWORD *)(v103 + 32) = v101;
    v6[4] = v5;
    v5[5] = v6;
    *(_QWORD *)(v89 + 40) = v101;
  }
  else
  {
    v91 = v6[5];
    *(_QWORD *)(v88 + 32) = v6;
    *(_QWORD *)(v88 + 40) = v91;
    *(_QWORD *)(v91 + 32) = v88;
    v6[5] = v88;
    v92 = operator new();
    v93 = *v13;
    *(_QWORD *)(v92 + 24) = v5[3];
    *(_OWORD *)(v92 + 8) = v93;
    *(_DWORD *)v92 = *(_DWORD *)v5;
    v94 = v5[4];
    *(_QWORD *)(v92 + 32) = v94;
    v95 = (uint64_t *)(v92 + 40);
    *(_QWORD *)(v94 + 40) = v92;
    v6[5] = v5;
    v5[4] = v6;
    *(_QWORD *)(v89 + 32) = v92;
  }
  *v95 = v89;
  result = 1;
  *a2 = v6;
  a2[1] = v89;
  return result;
}

uint64_t ClipperLib::Clipper::FixupFirstLefts1(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;

  v3 = *(_QWORD *)result;
  v4 = *(_QWORD *)(*(_QWORD *)result - 24);
  v5 = *(_QWORD *)(result + v4 + 80);
  if (*(_QWORD *)(result + v4 + 88) != v5)
  {
    v8 = result;
    v9 = 0;
    do
    {
      v10 = *(_QWORD *)(v5 + 8 * v9);
      for (i = *(_QWORD *)(v10 + 8); i; i = *(_QWORD *)(i + 8))
      {
        if (*(_QWORD *)(i + 24))
          break;
      }
      if (i == a2)
      {
        v12 = *(_QWORD *)(v10 + 24);
        if (v12)
        {
          v13 = *(_QWORD **)(a3 + 24);
          v14 = *(_QWORD *)(v10 + 24);
          while (1)
          {
            result = ClipperLib::PointInPolygon((_QWORD *)(v14 + 8), v13);
            if ((result & 0x80000000) == 0)
              break;
            v14 = *(_QWORD *)(v14 + 32);
            if (v14 == v12)
              goto LABEL_13;
          }
          if (!(_DWORD)result)
            goto LABEL_14;
LABEL_13:
          *(_QWORD *)(v10 + 8) = a3;
          v4 = *(_QWORD *)(v3 - 24);
        }
      }
LABEL_14:
      ++v9;
      v5 = *(_QWORD *)(v8 + v4 + 80);
    }
    while (v9 < (*(_QWORD *)(v8 + v4 + 88) - v5) >> 3);
  }
  return result;
}

uint64_t ClipperLib::Clipper::FixupFirstLefts2(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = *(_QWORD *)result;
  v4 = *(_QWORD *)(result + *(_QWORD *)(*(_QWORD *)result - 24) + 80);
  if (*(_QWORD *)(result + *(_QWORD *)(*(_QWORD *)result - 24) + 88) != v4)
  {
    v7 = result;
    v8 = 0;
    v20 = *(_QWORD *)(a3 + 8);
    do
    {
      v9 = *(_QWORD *)(v4 + 8 * v8);
      v10 = *(_QWORD *)(v9 + 24);
      if (v9 != a2 && v9 != a3 && v10 != 0)
      {
        v13 = *(_QWORD *)(v9 + 8);
        if (v13)
        {
          v14 = *(_QWORD *)(v9 + 8);
          do
          {
            if (*(_QWORD *)(v14 + 24))
              break;
            v14 = *(_QWORD *)(v14 + 8);
          }
          while (v14);
        }
        else
        {
          v14 = 0;
        }
        if (v14 == a3 || v14 == v20 || v14 == a2)
        {
          v15 = *(_QWORD **)(a2 + 24);
          v16 = *(_QWORD *)(v9 + 24);
          while (1)
          {
            result = ClipperLib::PointInPolygon((_QWORD *)(v16 + 8), v15);
            if ((result & 0x80000000) == 0)
              break;
            v16 = *(_QWORD *)(v16 + 32);
            if (v16 == v10)
            {
              v17 = a2;
LABEL_29:
              *(_QWORD *)(v9 + 8) = v17;
              goto LABEL_30;
            }
          }
          v17 = a2;
          if ((_DWORD)result)
            goto LABEL_29;
          v18 = *(_QWORD **)(a3 + 24);
          v19 = v10;
          while (1)
          {
            result = ClipperLib::PointInPolygon((_QWORD *)(v19 + 8), v18);
            if ((result & 0x80000000) == 0)
              break;
            v19 = *(_QWORD *)(v19 + 32);
            if (v19 == v10)
            {
              v17 = a3;
              goto LABEL_29;
            }
          }
          v17 = a3;
          if ((_DWORD)result)
            goto LABEL_29;
          v17 = v20;
          if (v13 == a2)
            goto LABEL_29;
          v17 = v20;
          if (v13 == a3)
            goto LABEL_29;
        }
      }
LABEL_30:
      ++v8;
      v4 = *(_QWORD *)(v7 + *(_QWORD *)(v3 - 24) + 80);
    }
    while (v8 < (*(_QWORD *)(v7 + *(_QWORD *)(v3 - 24) + 88) - v4) >> 3);
  }
  return result;
}

uint64_t *ClipperLib::Clipper::FixupFirstLefts3(uint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = *result;
  v4 = *(_QWORD *)(*result - 24);
  v5 = *(uint64_t *)((char *)result + v4 + 80);
  if (*(uint64_t *)((char *)result + v4 + 88) != v5)
  {
    v6 = 0;
    do
    {
      v7 = *(_QWORD *)(v5 + 8 * v6);
      if (*(_QWORD *)(v7 + 8) == a2 && *(_QWORD *)(v7 + 24) != 0)
      {
        *(_QWORD *)(v7 + 8) = a3;
        v4 = *(_QWORD *)(v3 - 24);
      }
      ++v6;
      v5 = *(uint64_t *)((char *)result + v4 + 80);
    }
    while (v6 < (*(uint64_t *)((char *)result + v4 + 88) - v5) >> 3);
  }
  return result;
}

double ClipperLib::GetUnitNormal(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  double result;

  v2 = a2[1];
  v3 = a1[1];
  v4 = *a2 == *a1 && v2 == v3;
  result = 0.0;
  if (!v4)
    return 1.0
         / sqrt((double)(v2 - v3) * (double)(v2 - v3) + (double)(uint64_t)(*a2 - *a1) * (double)(uint64_t)(*a2 - *a1))
         * (double)(v2 - v3);
  return result;
}

double ClipperLib::ClipperOffset::ClipperOffset(ClipperLib::ClipperOffset *this, double a2, double a3)
{
  double result;

  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  __asm { FMOV            V3.2S, #-1.0 }
  *((_QWORD *)this + 22) = _D3;
  *((_QWORD *)this + 23) = &unk_250FA0FB8;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 237) = 0u;
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  result = NAN;
  *((_OWORD *)this + 10) = xmmword_23F100220;
  return result;
}

{
  double result;

  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  __asm { FMOV            V3.2S, #-1.0 }
  *((_QWORD *)this + 22) = _D3;
  *((_QWORD *)this + 23) = &unk_250FA0FB8;
  *((_OWORD *)this + 12) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 237) = 0u;
  *(double *)this = a2;
  *((double *)this + 1) = a3;
  result = NAN;
  *((_OWORD *)this + 10) = xmmword_23F100220;
  return result;
}

void ClipperLib::ClipperOffset::~ClipperOffset(ClipperLib::ClipperOffset *this)
{
  void *v2;
  void *v3;
  void *v4;
  void **v5;

  ClipperLib::ClipperOffset::Clear(this);
  ClipperLib::PolyNode::~PolyNode((ClipperLib::ClipperOffset *)((char *)this + 184));
  v2 = (void *)*((_QWORD *)this + 11);
  if (v2)
  {
    *((_QWORD *)this + 12) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 8);
  if (v3)
  {
    *((_QWORD *)this + 9) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 5);
  if (v4)
  {
    *((_QWORD *)this + 6) = v4;
    operator delete(v4);
  }
  v5 = (void **)((char *)this + 16);
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100](&v5);
}

_QWORD *ClipperLib::ClipperOffset::Clear(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = this;
  v2 = this[27];
  v3 = this[28];
  if ((int)((unint64_t)(v3 - v2) >> 3) >= 1)
  {
    v4 = 0;
    do
    {
      this = *(_QWORD **)(v2 + 8 * v4);
      if (this)
      {
        this = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
        v2 = v1[27];
        v3 = v1[28];
      }
      ++v4;
    }
    while (v4 < (int)((unint64_t)(v3 - v2) >> 3));
  }
  v1[28] = v2;
  v1[20] = -1;
  return this;
}

double ClipperLib::ClipperOffset::AddPath(uint64_t a1, _QWORD *a2, int a3, unsigned int a4)
{
  int v4;
  int v5;
  uint64_t v10;
  ClipperLib::PolyNode *v11;
  char **v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v17;
  __int128 *v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  __int128 v22;
  int64x2_t *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  __int128 v31;
  char *v32;
  char *v33;
  __int128 v34;
  int v35;
  int v36;
  char *v37;
  __int128 *v38;
  uint64_t v39;
  int64x2_t *v40;
  int32x2_t v41;
  int64x2_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  int64x2_t *v48;
  int64x2_t v49;
  char *v50;
  char *v51;
  int64x2_t *v52;
  int64x2_t v53;
  _QWORD *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  double result;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v70;
  unsigned int v71;
  char **v72;

  v4 = -1431655765 * ((a2[1] - *a2) >> 3);
  v5 = v4 - 1;
  if (v4 >= 1)
  {
    v10 = operator new();
    v11 = (ClipperLib::PolyNode *)v10;
    *(_QWORD *)v10 = &unk_250FA0FB8;
    *(_OWORD *)(v10 + 8) = 0u;
    v12 = (char **)(v10 + 8);
    *(_OWORD *)(v10 + 24) = 0u;
    *(_OWORD *)(v10 + 40) = 0u;
    *(_OWORD *)(v10 + 53) = 0u;
    *(_DWORD *)(v10 + 72) = a3;
    *(_DWORD *)(v10 + 76) = a4;
    if (a4 <= 1 && v4 != 1)
    {
      do
      {
        v13 = (uint64_t *)(*a2 + 24 * --v4);
        v15 = *v13;
        v14 = v13[1];
        if (*(_QWORD *)*a2 != v15 || *(_QWORD *)(*a2 + 8) != v14)
        {
          v5 = v4;
          goto LABEL_11;
        }
      }
      while (v4 > 1);
      v5 = 0;
    }
LABEL_11:
    v17 = (v5 + 1);
    std::vector<ClipperLib::IntPoint>::reserve((void **)(v10 + 8), v17);
    v18 = (__int128 *)*a2;
    v20 = (_QWORD *)((char *)v11 + 24);
    v19 = *((_QWORD *)v11 + 3);
    v21 = *((_QWORD *)v11 + 2);
    if (v21 >= v19)
    {
      v24 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v21 - (_QWORD)*v12) >> 3);
      v25 = v24 + 1;
      if (v24 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
      v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v19 - (_QWORD)*v12) >> 3);
      if (2 * v26 > v25)
        v25 = 2 * v26;
      if (v26 >= 0x555555555555555)
        v27 = 0xAAAAAAAAAAAAAAALL;
      else
        v27 = v25;
      if (v27)
        v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)v11 + 24, v27);
      else
        v28 = 0;
      v29 = &v28[24 * v24];
      v30 = &v28[24 * v27];
      v31 = *v18;
      *((_QWORD *)v29 + 2) = *((_QWORD *)v18 + 2);
      *(_OWORD *)v29 = v31;
      v23 = (int64x2_t *)(v29 + 24);
      v33 = (char *)*((_QWORD *)v11 + 1);
      v32 = (char *)*((_QWORD *)v11 + 2);
      if (v32 != v33)
      {
        do
        {
          v34 = *(_OWORD *)(v32 - 24);
          *((_QWORD *)v29 - 1) = *((_QWORD *)v32 - 1);
          *(_OWORD *)(v29 - 24) = v34;
          v29 -= 24;
          v32 -= 24;
        }
        while (v32 != v33);
        v32 = *v12;
      }
      *((_QWORD *)v11 + 1) = v29;
      *((_QWORD *)v11 + 2) = v23;
      *((_QWORD *)v11 + 3) = v30;
      if (v32)
        operator delete(v32);
    }
    else
    {
      v22 = *v18;
      *(_QWORD *)(v21 + 16) = *((_QWORD *)v18 + 2);
      *(_OWORD *)v21 = v22;
      v23 = (int64x2_t *)(v21 + 24);
    }
    v72 = v12;
    v71 = a4;
    v70 = a1;
    *((_QWORD *)v11 + 2) = v23;
    if (v5 < 1)
    {
      v36 = 0;
      v35 = 0;
    }
    else
    {
      v35 = 0;
      v36 = 0;
      v37 = *v72;
      v38 = (__int128 *)*a2;
      v39 = 1;
      do
      {
        v40 = (int64x2_t *)((char *)v38 + 24 * v39);
        v41 = vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vceqq_s64(*(int64x2_t *)&v37[24 * v35], *v40)));
        if (((v41.i32[0] | v41.i32[1]) & 1) != 0)
        {
          if ((unint64_t)v23 >= *v20)
          {
            v43 = 0xAAAAAAAAAAAAAAABLL * (((char *)v23 - v37) >> 3);
            if (v43 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
            v44 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v20 - (_QWORD)v37) >> 3);
            v45 = 2 * v44;
            if (2 * v44 <= v43 + 1)
              v45 = v43 + 1;
            if (v44 >= 0x555555555555555)
              v46 = 0xAAAAAAAAAAAAAAALL;
            else
              v46 = v45;
            if (v46)
              v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)v11 + 24, v46);
            else
              v47 = 0;
            v48 = (int64x2_t *)&v47[24 * v43];
            v49 = *v40;
            v48[1].i64[0] = v40[1].i64[0];
            *v48 = v49;
            v51 = (char *)*((_QWORD *)v11 + 1);
            v50 = (char *)*((_QWORD *)v11 + 2);
            v52 = v48;
            if (v50 != v51)
            {
              do
              {
                v53 = *(int64x2_t *)(v50 - 24);
                v52[-1].i64[1] = *((_QWORD *)v50 - 1);
                *(int64x2_t *)((char *)v52 - 24) = v53;
                v52 = (int64x2_t *)((char *)v52 - 24);
                v50 -= 24;
              }
              while (v50 != v51);
              v50 = *v72;
            }
            v23 = (int64x2_t *)((char *)v48 + 24);
            *((_QWORD *)v11 + 1) = v52;
            *((_QWORD *)v11 + 2) = (char *)v48 + 24;
            *((_QWORD *)v11 + 3) = &v47[24 * v46];
            if (v50)
              operator delete(v50);
          }
          else
          {
            v42 = *v40;
            v23[1].i64[0] = v40[1].i64[0];
            *v23 = v42;
            v23 = (int64x2_t *)((char *)v23 + 24);
          }
          ++v35;
          *((_QWORD *)v11 + 2) = v23;
          v38 = (__int128 *)*a2;
          v54 = (_QWORD *)(*a2 + 24 * v39);
          v55 = v54[1];
          v37 = (char *)*((_QWORD *)v11 + 1);
          v56 = &v37[24 * v36];
          v57 = *((_QWORD *)v56 + 1);
          if (v55 > v57 || v55 == v57 && *v54 < *(_QWORD *)v56)
            v36 = v35;
        }
        ++v39;
      }
      while (v39 != v17);
    }
    if (!v71 && v35 < 2)
    {
      (*(void (**)(ClipperLib::PolyNode *))(*(_QWORD *)v11 + 8))(v11);
      return result;
    }
    ClipperLib::PolyNode::AddChild((ClipperLib::PolyNode *)(v70 + 184), v11);
    if (!v71)
    {
      v59 = *(_QWORD *)(v70 + 160);
      v60 = *(_QWORD *)(v70 + 216);
      if (v59 < 0)
      {
        v66 = (((*(_QWORD *)(v70 + 224) - v60) << 29) - 0x100000000) >> 32;
        v65 = v36;
        goto LABEL_63;
      }
      v61 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v60 + 8 * (int)v59) + 8) + 24 * *(int *)(v70 + 168));
      v62 = v61[1];
      v63 = &(*v72)[24 * v36];
      v64 = *((_QWORD *)v63 + 1);
      if (v64 > v62 || v64 == v62 && *(_QWORD *)v63 < *v61)
      {
        v65 = v36;
        v66 = (((*(_QWORD *)(v70 + 224) - v60) << 29) - 0x100000000) >> 32;
LABEL_63:
        *(_QWORD *)(v70 + 160) = v66;
        *(_QWORD *)(v70 + 168) = v65;
        __asm { FMOV            V0.2S, #-1.0 }
        *(double *)(v70 + 176) = result;
      }
    }
  }
  return result;
}

void ClipperLib::ClipperOffset::AddPaths(uint64_t a1, uint64_t *a2, int a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v9;
  unint64_t v10;

  v4 = *a2;
  if (a2[1] != *a2)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      ClipperLib::ClipperOffset::AddPath(a1, (_QWORD *)(v4 + v9), a3, a4);
      ++v10;
      v4 = *a2;
      v9 += 24;
    }
    while (v10 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
}

void ClipperLib::ClipperOffset::FixOrientations(ClipperLib::ClipperOffset *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v2 = *((_QWORD *)this + 20);
  if (v2 < 0)
  {
    v3 = *((_QWORD *)this + 27);
  }
  else
  {
    v3 = *((_QWORD *)this + 27);
    if (ClipperLib::Area((uint64_t *)(*(_QWORD *)(v3 + 8 * (int)v2) + 8)) < 0.0)
    {
      v4 = *((_QWORD *)this + 28);
      if ((int)((unint64_t)(v4 - v3) >> 3) >= 1)
      {
        v5 = 0;
        do
        {
          v6 = *(_QWORD *)(v3 + 8 * v5);
          v7 = *(_DWORD *)(v6 + 76);
          if (!v7 || v7 == 1 && ClipperLib::Area((uint64_t *)(v6 + 8)) >= 0.0)
          {
            v8 = *(_QWORD *)(v6 + 8);
            v9 = *(_QWORD *)(v6 + 16);
            v10 = v9 - 24;
            if (v8 != v9 && v10 > v8)
            {
              v12 = v8 + 24;
              do
              {
                v13 = *(_QWORD *)(v12 - 8);
                v14 = *(_OWORD *)(v12 - 24);
                v15 = *(_QWORD *)(v10 + 16);
                *(_OWORD *)(v12 - 24) = *(_OWORD *)v10;
                *(_QWORD *)(v12 - 8) = v15;
                *(_OWORD *)v10 = v14;
                *(_QWORD *)(v10 + 16) = v13;
                v10 -= 24;
                v16 = v12 >= v10;
                v12 += 24;
              }
              while (!v16);
              v3 = *((_QWORD *)this + 27);
              v4 = *((_QWORD *)this + 28);
            }
          }
          ++v5;
        }
        while (v5 < (int)((unint64_t)(v4 - v3) >> 3));
      }
      return;
    }
  }
  v17 = *((_QWORD *)this + 28);
  if ((int)((unint64_t)(v17 - v3) >> 3) >= 1)
  {
    v18 = 0;
    do
    {
      v19 = *(_QWORD *)(v3 + 8 * v18);
      if (*(_DWORD *)(v19 + 76) == 1 && ClipperLib::Area((uint64_t *)(v19 + 8)) < 0.0)
      {
        v20 = *(_QWORD *)(v19 + 8);
        v21 = *(_QWORD *)(v19 + 16);
        v22 = v21 - 24;
        if (v20 != v21 && v22 > v20)
        {
          v24 = v20 + 24;
          do
          {
            v25 = *(_QWORD *)(v24 - 8);
            v26 = *(_OWORD *)(v24 - 24);
            v27 = *(_QWORD *)(v22 + 16);
            *(_OWORD *)(v24 - 24) = *(_OWORD *)v22;
            *(_QWORD *)(v24 - 8) = v27;
            *(_OWORD *)v22 = v26;
            *(_QWORD *)(v22 + 16) = v25;
            v22 -= 24;
            v16 = v24 >= v22;
            v24 += 24;
          }
          while (!v16);
          v3 = *((_QWORD *)this + 27);
          v17 = *((_QWORD *)this + 28);
        }
      }
      ++v18;
    }
    while (v18 < (int)((unint64_t)(v17 - v3) >> 3));
  }
}

__n128 ClipperLib::ReversePath(unint64_t *a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v5;
  uint64_t v6;
  __n128 result;
  uint64_t v8;
  BOOL v9;

  v1 = *a1;
  v2 = a1[1];
  v3 = v2 - 24;
  if (*a1 != v2 && v3 > v1)
  {
    v5 = v1 + 24;
    do
    {
      v6 = *(_QWORD *)(v5 - 8);
      result = *(__n128 *)(v5 - 24);
      v8 = *(_QWORD *)(v3 + 16);
      *(_OWORD *)(v5 - 24) = *(_OWORD *)v3;
      *(_QWORD *)(v5 - 8) = v8;
      *(__n128 *)v3 = result;
      *(_QWORD *)(v3 + 16) = v6;
      v3 -= 24;
      v9 = v5 >= v3;
      v5 += 24;
    }
    while (!v9);
  }
  return result;
}

void ClipperLib::ClipperOffset::Execute(uint64_t *a1, uint64_t *a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __n128 *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *__p[3];
  __int128 v24;
  __int128 v25;
  uint64_t (**v26)(ClipperLib::Clipper *__hidden);
  void *v27[2];
  void *v28[2];
  __int128 v29;
  void *v30[2];
  uint64_t v31;
  _QWORD v32[4];
  char v33;
  char v34;
  char v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100](a2);
  ClipperLib::ClipperOffset::FixOrientations((ClipperLib::ClipperOffset *)a1);
  ClipperLib::ClipperOffset::DoOffset((ClipperLib::ClipperOffset *)a1, a3);
  v41 = 0;
  v42 = 0;
  v43 = 0;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v48 = 0;
  v49 = 0;
  v50 = 0;
  v38 = 0u;
  v39 = 0u;
  v26 = &off_250FA1278;
  *(_OWORD *)v27 = 0u;
  *(_OWORD *)v28 = 0u;
  v29 = 0u;
  *(_OWORD *)v30 = 0u;
  v31 = 0;
  v32[0] = v32;
  v32[1] = v32;
  v32[2] = 0;
  v33 = 0;
  v40 = 0;
  v34 = 0;
  v35 = 0;
  v44 = 0;
  v36 = 0;
  v37 = &unk_250FA12C0;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v37, a1 + 2, 0, 1);
  if (a3 <= 0.0)
  {
    v24 = 0u;
    v25 = 0u;
    ClipperLib::ClipperBase::GetBounds((ClipperLib::ClipperBase *)((char *)&v27[-1] + (_QWORD)*(v26 - 3)), (uint64_t)&v24);
    std::vector<ClipperLib::IntPoint>::vector(__p, 4uLL);
    v6 = *((_QWORD *)&v24 + 1);
    v7 = v24 - 10;
    v8 = v25;
    v9 = *((_QWORD *)&v25 + 1) + 10;
    v10 = __p[0];
    *(_QWORD *)__p[0] = v24 - 10;
    v10[1] = v9;
    v8 += 10;
    v10[3] = v8;
    v10[4] = v9;
    __asm { FMOV            V0.2S, #-1.0 }
    v10[2] = _D0;
    v10[5] = _D0;
    v6 -= 10;
    v10[6] = v8;
    v10[7] = v6;
    v10[8] = _D0;
    v10[9] = v7;
    v10[10] = v6;
    v10[11] = _D0;
    ClipperLib::ClipperBase::AddPath((uint64_t)&v27[-1] + (_QWORD)*(v26 - 3), (uint64_t **)__p, 0, 1);
    v34 = 1;
    ClipperLib::Clipper::Execute((uint64_t)&v26, 1, a2, 3, 3);
    v16 = (__n128 *)a2[1];
    if (v16 != (__n128 *)*a2)
    {
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *,0>((__n128 *)(*a2 + 24), v16, *a2);
      v18 = v17;
      v19 = a2[1];
      if (v19 != v17)
      {
        v20 = a2[1];
        do
        {
          v22 = *(void **)(v20 - 24);
          v20 -= 24;
          v21 = v22;
          if (v22)
          {
            *(_QWORD *)(v19 - 16) = v21;
            operator delete(v21);
          }
          v19 = v20;
        }
        while (v20 != v18);
      }
      a2[1] = v18;
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  else
  {
    ClipperLib::Clipper::Execute((uint64_t)&v26, 1, a2, 2, 2);
  }
  v26 = &off_250FA1278;
  v37 = &unk_250FA12C0;
  std::__list_imp<long long>::clear(v32);
  if (v30[0])
  {
    v30[1] = v30[0];
    operator delete(v30[0]);
  }
  if (v28[1])
  {
    *(void **)&v29 = v28[1];
    operator delete(v28[1]);
  }
  if (v27[0])
  {
    v27[1] = v27[0];
    operator delete(v27[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v37);
}

void sub_23F0F43A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (__p)
    operator delete(__p);
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a17);
  _Unwind_Resume(a1);
}

unint64_t ClipperLib::ClipperOffset::DoOffset(ClipperLib::ClipperOffset *this, double a2)
{
  uint64_t *v3;
  unint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __double2 v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  int64x2_t **v22;
  void **v23;
  int64x2_t **v24;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  int64x2_t *v35;
  uint64_t v36;
  float64x2_t v37;
  float64x2_t v38;
  int64x2_t v39;
  int64x2_t *v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  int64x2_t *v46;
  int64x2_t *v47;
  int64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  uint64_t v51;
  uint64_t v52;
  double *v53;
  double UnitNormal;
  uint64_t v55;
  double v56;
  uint64_t v57;
  float64x2_t *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  double v66;
  float64_t v67;
  double v68;
  float64_t v69;
  unint64_t v70;
  float64x2_t *v71;
  uint64_t v72;
  float64x2_t *v73;
  unint64_t v74;
  _QWORD *f64;
  int v76;
  double v77;
  double v78;
  double v79;
  double v80;
  uint64_t v81;
  double v82;
  double v83;
  uint64_t v84;
  int64x2_t *v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  char *v89;
  uint64_t *v90;
  uint64_t *v91;
  __int128 v92;
  double v93;
  double v94;
  float64x2_t *v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  char *v105;
  char *v106;
  char *v107;
  char *v108;
  float64x2_t *v109;
  float64x2_t *v110;
  char *v111;
  int v112;
  int v113;
  unint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  int v117;
  unint64_t v118;
  unint64_t v119;
  int v120;
  float64x2_t v121;
  int64x2_t v122;
  int64x2_t *v123;
  int64x2_t *v124;
  int64x2_t *v125;
  float64x2_t *v126;
  float64x2_t v127;
  unint64_t v128;
  BOOL v129;
  int v130;
  int64x2_t *v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  char *v136;
  char *v137;
  int64x2_t *v138;
  int64x2_t *v139;
  int64x2_t v140;
  float64x2_t v141;
  int64x2_t v142;
  __int8 *v143;
  int64x2_t *v144;
  unint64_t v145;
  unint64_t v146;
  unint64_t v147;
  unint64_t v148;
  char *v149;
  char *v150;
  int64x2_t *v151;
  int64x2_t *v152;
  int64x2_t v153;
  float64x2_t *v154;
  unint64_t v155;
  int v156;
  float64x2_t v157;
  int64x2_t v158;
  int64x2_t *v159;
  int64x2_t *v160;
  uint64_t *v161;
  int64x2_t *v162;
  int64x2_t *v163;
  unint64_t v164;
  unint64_t v165;
  unint64_t v166;
  unint64_t v167;
  char *v168;
  char *v169;
  int64x2_t *v170;
  int64x2_t *v171;
  int64x2_t v172;
  float64x2_t v173;
  int64x2_t v174;
  __int8 *v175;
  int64x2_t *v176;
  unint64_t v177;
  unint64_t v178;
  unint64_t v179;
  unint64_t v180;
  char *v181;
  char *v182;
  int64x2_t *v183;
  int64x2_t *v184;
  int64x2_t v185;
  uint64_t *v186;
  int64x2_t v187;
  int v188[4];
  int v189;
  int v190[4];
  int v191[4];
  int v192[4];
  int v193[4];
  int8x16_t v194;
  int8x16_t v195;
  float64x2_t v196;
  void **v197;
  float64x2_t **v199;
  _QWORD *v200;
  _OWORD v201[2];

  v3 = (uint64_t *)((char *)this + 16);
  std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100]((uint64_t *)this + 2);
  *((double *)this + 14) = a2;
  if (a2 > -1.0e-20 && a2 < 1.0e-20)
  {
    result = std::vector<std::vector<ClipperLib::IntPoint>>::reserve(v3, (int)((uint64_t)(*((_QWORD *)this + 28) - *((_QWORD *)this + 27)) >> 3));
    v6 = *((_QWORD *)this + 27);
    v5 = *((_QWORD *)this + 28);
    if ((int)((unint64_t)(v5 - v6) >> 3) >= 1)
    {
      v7 = 0;
      do
      {
        v8 = *(_QWORD *)(v6 + 8 * v7);
        if (!*(_DWORD *)(v8 + 76))
        {
          v9 = v8 + 8;
          v10 = *((_QWORD *)this + 3);
          if (v10 >= *((_QWORD *)this + 4))
          {
            result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v3, v9);
          }
          else
          {
            std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v3, v9);
            result = v10 + 24;
          }
          *((_QWORD *)this + 3) = result;
          v6 = *((_QWORD *)this + 27);
          v5 = *((_QWORD *)this + 28);
        }
        ++v7;
      }
      while (v7 < (int)((unint64_t)(v5 - v6) >> 3));
    }
    return result;
  }
  v11 = 0.5;
  if (*(double *)this > 2.0)
    v11 = 2.0 / (*(double *)this * *(double *)this);
  *((double *)this + 18) = v11;
  v12 = *((double *)this + 1);
  v13 = fabs(a2);
  v14 = v13 * 0.25;
  if (v12 <= v13 * 0.25)
    v14 = *((double *)this + 1);
  if (v12 <= 0.0)
    v15 = 0.25;
  else
    v15 = v14;
  v16 = 3.14159265 / acos(1.0 - v15 / v13);
  if (v16 <= v13 * 3.14159265)
    v17 = v16;
  else
    v17 = v13 * 3.14159265;
  v18 = __sincos_stret(6.28318531 / v17);
  *((__double2 *)this + 8) = v18;
  *((double *)this + 19) = v17 / 6.28318531;
  if (a2 < 0.0)
    *((double *)this + 16) = -v18.__sinval;
  result = std::vector<std::vector<ClipperLib::IntPoint>>::reserve(v3, (int)((uint64_t)(*((_QWORD *)this + 28) - *((_QWORD *)this + 27)) >> 2) & 0xFFFFFFFFFFFFFFFELL);
  v19 = *((_QWORD *)this + 27);
  v20 = a2;
  if ((int)((unint64_t)(*((_QWORD *)this + 28) - v19) >> 3) >= 1)
  {
    v21 = 0;
    v22 = (int64x2_t **)((char *)this + 40);
    v23 = (void **)((char *)this + 64);
    v199 = (float64x2_t **)((char *)this + 88);
    v200 = (_QWORD *)((char *)this + 104);
    v196 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0);
    v24 = (int64x2_t **)((char *)this + 80);
    __asm
    {
      FMOV            V1.2D, #0.5
      FMOV            V0.2D, #-0.5
    }
    v194 = _Q0;
    v195 = _Q1;
    __asm { FMOV            V12.2S, #-1.0 }
    v186 = v3;
    v197 = (void **)((char *)this + 64);
    do
    {
      v32 = *(_QWORD *)(v19 + 8 * v21);
      if (v22 != (int64x2_t **)(v32 + 8))
      {
        result = (unint64_t)std::vector<ClipperLib::IntPoint>::__assign_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>((char *)this + 40, *(char **)(v32 + 8), *(_QWORD *)(v32 + 16), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(_QWORD *)(v32 + 16) - *(_QWORD *)(v32 + 8)) >> 3));
        v20 = a2;
      }
      v33 = (uint64_t)(*((_QWORD *)this + 6) - *((_QWORD *)this + 5)) >> 3;
      v34 = 0xAAAAAAAAAAAAAAABLL * v33;
      if (!(-1431655765 * (_DWORD)v33))
        goto LABEL_259;
      if (v20 <= 0.0)
      {
        if ((int)v34 < 3 || *(_DWORD *)(v32 + 76))
          goto LABEL_259;
        *((_QWORD *)this + 9) = *((_QWORD *)this + 8);
      }
      else
      {
        v35 = (int64x2_t *)*((_QWORD *)this + 8);
        *((_QWORD *)this + 9) = v35;
        if ((_DWORD)v34 == 1)
        {
          if (*(_DWORD *)(v32 + 72) == 1)
          {
            if (v17 >= 1.0)
            {
              v36 = 1;
              v37 = (float64x2_t)xmmword_23F100030;
              do
              {
                v38 = vmlaq_f64(vcvtq_f64_s64(**v22), v196, v37);
                v39 = vcvtq_s64_f64(vaddq_f64(v38, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v38), v194, v195)));
                if (v35 >= *v24)
                {
                  v40 = (int64x2_t *)*v23;
                  v41 = 0xAAAAAAAAAAAAAAABLL * (((char *)v35 - (_BYTE *)*v23) >> 3);
                  v42 = v41 + 1;
                  if (v41 + 1 > 0xAAAAAAAAAAAAAAALL)
                    goto LABEL_263;
                  *(float64x2_t *)v188 = v37;
                  if (0x5555555555555556 * (((char *)*v24 - (char *)v40) >> 3) > v42)
                    v42 = 0x5555555555555556 * (((char *)*v24 - (char *)v40) >> 3);
                  if (0xAAAAAAAAAAAAAAABLL * (((char *)*v24 - (char *)v40) >> 3) >= 0x555555555555555)
                    v43 = 0xAAAAAAAAAAAAAAALL;
                  else
                    v43 = v42;
                  if (v43)
                  {
                    v187 = v39;
                    v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v43);
                    v39 = v187;
                    v45 = v44;
                    v40 = (int64x2_t *)*((_QWORD *)this + 8);
                    v35 = (int64x2_t *)*((_QWORD *)this + 9);
                  }
                  else
                  {
                    v45 = 0;
                  }
                  v46 = (int64x2_t *)&v45[24 * v41];
                  *v46 = v39;
                  v46[1].i64[0] = _D12;
                  v47 = v46;
                  if (v35 != v40)
                  {
                    do
                    {
                      v48 = *(int64x2_t *)((char *)v35 - 24);
                      v47[-1].i64[1] = v35[-1].i64[1];
                      *(int64x2_t *)((char *)v47 - 24) = v48;
                      v47 = (int64x2_t *)((char *)v47 - 24);
                      v35 = (int64x2_t *)((char *)v35 - 24);
                    }
                    while (v35 != v40);
                    v40 = (int64x2_t *)*v23;
                  }
                  v35 = (int64x2_t *)((char *)v46 + 24);
                  *((_QWORD *)this + 8) = v47;
                  *((_QWORD *)this + 9) = (char *)v46 + 24;
                  *((_QWORD *)this + 10) = &v45[24 * v43];
                  if (v40)
                    operator delete(v40);
                  v37 = *(float64x2_t *)v188;
                }
                else
                {
                  *v35 = v39;
                  v35[1].i64[0] = _D12;
                  v35 = (int64x2_t *)((char *)v35 + 24);
                }
                *((_QWORD *)this + 9) = v35;
                v49 = *((float64x2_t *)this + 8);
                v50 = (float64x2_t)vextq_s8((int8x16_t)v49, (int8x16_t)v49, 8uLL);
                v49.f64[0] = -v49.f64[0];
                ++v36;
                v37 = vmlaq_n_f64(vmulq_laneq_f64(v49, v37, 1), v50, v37.f64[0]);
              }
              while (v17 >= (double)v36);
            }
          }
          else
          {
            v76 = 0;
            v77 = -1.0;
            v78 = -1.0;
            do
            {
              v79 = (double)(*v22)->i64[0] + v77 * v20;
              if (v79 >= 0.0)
                v80 = 0.5;
              else
                v80 = -0.5;
              v81 = (uint64_t)(v79 + v80);
              v82 = (double)(*v22)->i64[1] + v78 * v20;
              if (v82 >= 0.0)
                v83 = 0.5;
              else
                v83 = -0.5;
              v84 = (uint64_t)(v82 + v83);
              if (v35 >= *v24)
              {
                v85 = (int64x2_t *)*v23;
                v86 = 0xAAAAAAAAAAAAAAABLL * (((char *)v35 - (_BYTE *)*v23) >> 3);
                v87 = v86 + 1;
                if (v86 + 1 > 0xAAAAAAAAAAAAAAALL)
                  goto LABEL_262;
                if (0x5555555555555556 * (((char *)*v24 - (char *)v85) >> 3) > v87)
                  v87 = 0x5555555555555556 * (((char *)*v24 - (char *)v85) >> 3);
                if (0xAAAAAAAAAAAAAAABLL * (((char *)*v24 - (char *)v85) >> 3) >= 0x555555555555555)
                  v88 = 0xAAAAAAAAAAAAAAALL;
                else
                  v88 = v87;
                if (v88)
                {
                  v89 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v88);
                  v85 = (int64x2_t *)*((_QWORD *)this + 8);
                  v35 = (int64x2_t *)*((_QWORD *)this + 9);
                }
                else
                {
                  v89 = 0;
                }
                v90 = (uint64_t *)&v89[24 * v86];
                *v90 = v81;
                v90[1] = v84;
                v90[2] = _D12;
                v91 = v90;
                if (v35 == v85)
                {
                  v23 = (void **)((char *)this + 64);
                }
                else
                {
                  v23 = (void **)((char *)this + 64);
                  do
                  {
                    v92 = *(__int128 *)((char *)&v35[-2] + 8);
                    *(v91 - 1) = v35[-1].i64[1];
                    *(_OWORD *)(v91 - 3) = v92;
                    v91 -= 3;
                    v35 = (int64x2_t *)((char *)v35 - 24);
                  }
                  while (v35 != v85);
                  v85 = (int64x2_t *)*v197;
                }
                v35 = (int64x2_t *)(v90 + 3);
                *((_QWORD *)this + 8) = v91;
                *((_QWORD *)this + 9) = v90 + 3;
                *((_QWORD *)this + 10) = &v89[24 * v88];
                if (v85)
                  operator delete(v85);
                v20 = a2;
              }
              else
              {
                v35->i64[0] = v81;
                v35->i64[1] = v84;
                v35[1].i64[0] = _D12;
                v35 = (int64x2_t *)((char *)v35 + 24);
              }
              *((_QWORD *)this + 9) = v35;
              if (v78 >= 0.0)
                v93 = v78;
              else
                v93 = 1.0;
              if (v78 >= 0.0)
                v94 = -1.0;
              else
                v94 = v77;
              if (v77 < 0.0)
              {
                v77 = 1.0;
              }
              else
              {
                v78 = v93;
                v77 = v94;
              }
              ++v76;
            }
            while (v76 != 4);
          }
          goto LABEL_152;
        }
      }
      *((_QWORD *)this + 12) = *((_QWORD *)this + 11);
      std::vector<ClipperLib::DoublePoint>::reserve((void **)v199, (int)v34);
      v51 = (v34 - 1);
      v189 = v34 - 2;
      if ((int)v34 >= 2)
      {
        v52 = 0;
        v53 = (double *)*((_QWORD *)this + 12);
        do
        {
          UnitNormal = ClipperLib::GetUnitNormal(&(*v22)->i64[3 * v52], &(*v22)[1].i64[3 * v52 + 1]);
          v56 = UnitNormal;
          v57 = v55;
          if ((unint64_t)v53 >= *v200)
          {
            v58 = *v199;
            v59 = ((char *)v53 - (char *)*v199) >> 4;
            v60 = v59 + 1;
            if ((unint64_t)(v59 + 1) >> 60)
              goto LABEL_261;
            v61 = *v200 - (_QWORD)v58;
            if (v61 >> 3 > v60)
              v60 = v61 >> 3;
            if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0)
              v62 = 0xFFFFFFFFFFFFFFFLL;
            else
              v62 = v60;
            if (v62)
            {
              v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)v200, v62);
              v58 = (float64x2_t *)*((_QWORD *)this + 11);
              v53 = (double *)*((_QWORD *)this + 12);
            }
            else
            {
              v63 = 0;
            }
            v64 = &v63[16 * v59];
            *(double *)v64 = v56;
            *((_QWORD *)v64 + 1) = v57;
            v65 = v64;
            if (v53 != (double *)v58)
            {
              do
              {
                *((_OWORD *)v65 - 1) = *((_OWORD *)v53 - 1);
                v65 -= 16;
                v53 -= 2;
              }
              while (v53 != (double *)v58);
              v58 = *v199;
            }
            v53 = (double *)(v64 + 16);
            *((_QWORD *)this + 11) = v65;
            *((_QWORD *)this + 12) = v64 + 16;
            *((_QWORD *)this + 13) = &v63[16 * v62];
            if (v58)
              operator delete(v58);
          }
          else
          {
            *v53 = UnitNormal;
            *((_QWORD *)v53 + 1) = v55;
            v53 += 2;
          }
          ++v52;
          *((_QWORD *)this + 12) = v53;
        }
        while (v52 != v51);
      }
      if (*(_DWORD *)(v32 + 76) >= 2u)
      {
        v72 = *((_QWORD *)this + 11);
        v71 = (float64x2_t *)*((_QWORD *)this + 12);
        v73 = (float64x2_t *)(v72 + ((uint64_t)((v34 << 32) - 0x200000000) >> 28));
        v201[0] = *v73;
        v74 = *((_QWORD *)this + 13);
        if ((unint64_t)v71 >= v74)
        {
          v101 = ((uint64_t)v71 - v72) >> 4;
          v102 = v101 + 1;
          if ((unint64_t)(v101 + 1) >> 60)
LABEL_261:
            std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
          v103 = v74 - v72;
          if (v103 >> 3 > v102)
            v102 = v103 >> 3;
          if ((unint64_t)v103 >= 0x7FFFFFFFFFFFFFF0)
            v104 = 0xFFFFFFFFFFFFFFFLL;
          else
            v104 = v102;
          if (v104)
            v105 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)v200, v104);
          else
            v105 = 0;
          v108 = &v105[16 * v101];
          *(_OWORD *)v108 = v201[0];
          v110 = (float64x2_t *)*((_QWORD *)this + 11);
          v109 = (float64x2_t *)*((_QWORD *)this + 12);
          v111 = v108;
          if (v109 != v110)
          {
            do
            {
              *((float64x2_t *)v111 - 1) = v109[-1];
              v111 -= 16;
              --v109;
            }
            while (v109 != v110);
            v109 = *v199;
          }
          f64 = v108 + 16;
          *((_QWORD *)this + 11) = v111;
          *((_QWORD *)this + 12) = v108 + 16;
          *((_QWORD *)this + 13) = &v105[16 * v104];
          if (!v109)
            goto LABEL_147;
          v95 = v109;
LABEL_146:
          operator delete(v95);
          goto LABEL_147;
        }
        *v71 = *v73;
      }
      else
      {
        v66 = ClipperLib::GetUnitNormal((_QWORD *)(*((_QWORD *)this + 5) + 24 * (int)v51), *((_QWORD **)this + 5));
        v68 = v66;
        v69 = v67;
        v71 = (float64x2_t *)*((_QWORD *)this + 12);
        v70 = *((_QWORD *)this + 13);
        if ((unint64_t)v71 >= v70)
        {
          v95 = *v199;
          v96 = v71 - *v199;
          v97 = v96 + 1;
          if ((unint64_t)(v96 + 1) >> 60)
            goto LABEL_261;
          v98 = v70 - (_QWORD)v95;
          if (v98 >> 3 > v97)
            v97 = v98 >> 3;
          if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFF0)
            v99 = 0xFFFFFFFFFFFFFFFLL;
          else
            v99 = v97;
          if (v99)
          {
            v100 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)v200, v99);
            v95 = (float64x2_t *)*((_QWORD *)this + 11);
            v71 = (float64x2_t *)*((_QWORD *)this + 12);
          }
          else
          {
            v100 = 0;
          }
          v106 = &v100[16 * v96];
          *(double *)v106 = v68;
          *((float64_t *)v106 + 1) = v69;
          v107 = v106;
          if (v71 != v95)
          {
            do
            {
              *((float64x2_t *)v107 - 1) = v71[-1];
              v107 -= 16;
              --v71;
            }
            while (v71 != v95);
            v95 = *v199;
          }
          f64 = v106 + 16;
          *((_QWORD *)this + 11) = v107;
          *((_QWORD *)this + 12) = v106 + 16;
          *((_QWORD *)this + 13) = &v100[16 * v99];
          if (!v95)
            goto LABEL_147;
          goto LABEL_146;
        }
        v71->f64[0] = v66;
        v71->f64[1] = v67;
      }
      f64 = (_QWORD *)v71[1].f64;
LABEL_147:
      *((_QWORD *)this + 12) = f64;
      v112 = *(_DWORD *)(v32 + 76);
      if (v112 == 1)
      {
        LODWORD(v201[0]) = v34 - 1;
        if ((int)v34 >= 1)
        {
          v117 = 0;
          do
            ClipperLib::ClipperOffset::OffsetPoint(this, v117++, (int *)v201, *(_DWORD *)(v32 + 72));
          while ((_DWORD)v34 != v117);
        }
        v118 = *((_QWORD *)this + 3);
        if (v118 >= *((_QWORD *)this + 4))
        {
          v119 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v186, (uint64_t)v197);
        }
        else
        {
          std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v186, (uint64_t)v197);
          v119 = v118 + 24;
        }
        *((_QWORD *)this + 3) = v119;
        *((_QWORD *)this + 9) = *((_QWORD *)this + 8);
        v126 = (float64x2_t *)*((_QWORD *)this + 11);
        v127 = v126[(int)v51];
        if ((int)v34 > 1)
        {
          v128 = (v34 - 1);
          do
          {
            v129 = v128 > 1;
            v126[v128] = vnegq_f64(v126[(v128 - 1)]);
            --v128;
          }
          while (v129);
        }
        *v126 = vnegq_f64(v127);
        LODWORD(v201[0]) = 0;
        if ((int)v34 >= 1)
        {
          do
          {
            ClipperLib::ClipperOffset::OffsetPoint(this, v51, (int *)v201, *(_DWORD *)(v32 + 72));
            LODWORD(v51) = v51 - 1;
          }
          while ((_DWORD)v51 != -1);
          v119 = *((_QWORD *)this + 3);
        }
        v23 = (void **)((char *)this + 64);
        if (v119 >= *((_QWORD *)this + 4))
        {
          result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v186, (uint64_t)v197);
        }
        else
        {
          std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v186, (uint64_t)v197);
          result = v119 + 24;
        }
        goto LABEL_258;
      }
      if (v112)
      {
        LODWORD(v201[0]) = 0;
        v23 = (void **)((char *)this + 64);
        if ((int)v34 >= 3)
        {
          v120 = 2;
          do
            ClipperLib::ClipperOffset::OffsetPoint(this, v120++ - 1, (int *)v201, *(_DWORD *)(v32 + 72));
          while ((_DWORD)v34 != v120);
          v112 = *(_DWORD *)(v32 + 76);
        }
        if (v112 == 2)
        {
          v121 = vmlaq_f64(vcvtq_f64_s64(*(int64x2_t *)(*((_QWORD *)this + 5) + 24 * (int)v51)), v196, *(float64x2_t *)(*((_QWORD *)this + 11) + 16 * (int)v51));
          v122 = vcvtq_s64_f64(vaddq_f64(v121, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v121), v194, v195)));
          v124 = (int64x2_t *)*((_QWORD *)this + 9);
          v123 = (int64x2_t *)*((_QWORD *)this + 10);
          if (v124 >= v123)
          {
            v131 = (int64x2_t *)*v197;
            v132 = 0xAAAAAAAAAAAAAAABLL * (((char *)v124 - (_BYTE *)*v197) >> 3);
            v133 = v132 + 1;
            if (v132 + 1 > 0xAAAAAAAAAAAAAAALL)
              goto LABEL_263;
            v134 = 0xAAAAAAAAAAAAAAABLL * (((char *)v123 - (char *)v131) >> 3);
            if (2 * v134 > v133)
              v133 = 2 * v134;
            if (v134 >= 0x555555555555555)
              v135 = 0xAAAAAAAAAAAAAAALL;
            else
              v135 = v133;
            if (v135)
            {
              *(int64x2_t *)v190 = v122;
              v136 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v135);
              v122 = *(int64x2_t *)v190;
              v137 = v136;
              v131 = (int64x2_t *)*((_QWORD *)this + 8);
              v124 = (int64x2_t *)*((_QWORD *)this + 9);
            }
            else
            {
              v137 = 0;
            }
            v138 = (int64x2_t *)&v137[24 * v132];
            *v138 = v122;
            v138[1].i64[0] = _D12;
            v139 = v138;
            if (v124 != v131)
            {
              do
              {
                v140 = *(int64x2_t *)((char *)v124 - 24);
                v139[-1].i64[1] = v124[-1].i64[1];
                *(int64x2_t *)((char *)v139 - 24) = v140;
                v139 = (int64x2_t *)((char *)v139 - 24);
                v124 = (int64x2_t *)((char *)v124 - 24);
              }
              while (v124 != v131);
              v131 = (int64x2_t *)*v197;
            }
            v123 = (int64x2_t *)&v137[24 * v135];
            v125 = (int64x2_t *)((char *)v138 + 24);
            *((_QWORD *)this + 8) = v139;
            *((_QWORD *)this + 9) = (char *)v138 + 24;
            *((_QWORD *)this + 10) = v123;
            if (v131)
            {
              operator delete(v131);
              v123 = *v24;
            }
          }
          else
          {
            *v124 = v122;
            v124[1].i64[0] = _D12;
            v125 = (int64x2_t *)((char *)v124 + 24);
          }
          *((_QWORD *)this + 9) = v125;
          v141 = vmlsq_f64(vcvtq_f64_s64(*(int64x2_t *)(*((_QWORD *)this + 5) + 24 * (int)v51)), v196, *(float64x2_t *)(*((_QWORD *)this + 11) + 16 * (int)v51));
          v142 = vcvtq_s64_f64(vaddq_f64(v141, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v141), v194, v195)));
          if (v125 >= v123)
          {
            v144 = (int64x2_t *)*v197;
            v145 = 0xAAAAAAAAAAAAAAABLL * (((char *)v125 - (_BYTE *)*v197) >> 3);
            v146 = v145 + 1;
            if (v145 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_262:
              std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
            v147 = 0xAAAAAAAAAAAAAAABLL * (((char *)v123 - (char *)v144) >> 3);
            if (2 * v147 > v146)
              v146 = 2 * v147;
            if (v147 >= 0x555555555555555)
              v148 = 0xAAAAAAAAAAAAAAALL;
            else
              v148 = v146;
            if (v148)
            {
              *(int64x2_t *)v191 = v142;
              v149 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v148);
              v142 = *(int64x2_t *)v191;
              v150 = v149;
              v144 = (int64x2_t *)*((_QWORD *)this + 8);
              v125 = (int64x2_t *)*((_QWORD *)this + 9);
            }
            else
            {
              v150 = 0;
            }
            v151 = (int64x2_t *)&v150[24 * v145];
            *v151 = v142;
            v151[1].i64[0] = _D12;
            v152 = v151;
            if (v125 == v144)
            {
              v23 = (void **)((char *)this + 64);
            }
            else
            {
              v23 = (void **)((char *)this + 64);
              do
              {
                v153 = *(int64x2_t *)((char *)v125 - 24);
                v152[-1].i64[1] = v125[-1].i64[1];
                *(int64x2_t *)((char *)v152 - 24) = v153;
                v152 = (int64x2_t *)((char *)v152 - 24);
                v125 = (int64x2_t *)((char *)v125 - 24);
              }
              while (v125 != v144);
              v144 = (int64x2_t *)*v197;
            }
            v143 = &v151[1].i8[8];
            *((_QWORD *)this + 8) = v152;
            *((_QWORD *)this + 9) = (char *)v151 + 24;
            *((_QWORD *)this + 10) = &v150[24 * v148];
            if (v144)
              operator delete(v144);
          }
          else
          {
            *v125 = v142;
            v125[1].i64[0] = _D12;
            v143 = &v125[1].i8[8];
          }
          *((_QWORD *)this + 9) = v143;
        }
        else
        {
          *((_QWORD *)this + 15) = 0;
          *(float64x2_t *)(*((_QWORD *)this + 11) + 16 * (int)v51) = vnegq_f64(*(float64x2_t *)(*((_QWORD *)this + 11)
                                                                                                + 16 * (int)v51));
          v130 = v34 - 1;
          if (v112 == 3)
            ClipperLib::ClipperOffset::DoSquare(this, v130, v189);
          else
            ClipperLib::ClipperOffset::DoRound(this, v130, v189);
        }
        if ((int)v34 >= 2)
        {
          v154 = *v199;
          v155 = (v34 - 1);
          do
          {
            v129 = v155 > 1;
            v154[v155] = vnegq_f64(v154[(v155 - 1)]);
            --v155;
          }
          while (v129);
        }
        **v199 = vnegq_f64((*v199)[1]);
        LODWORD(v201[0]) = v34 - 1;
        if ((int)v34 > 2)
        {
          do
          {
            LODWORD(v51) = v51 - 1;
            ClipperLib::ClipperOffset::OffsetPoint(this, v51, (int *)v201, *(_DWORD *)(v32 + 72));
          }
          while (v51 > 1);
        }
        v156 = *(_DWORD *)(v32 + 76);
        if (v156 == 2)
        {
          v157 = vmlsq_f64(vcvtq_f64_s64(*(int64x2_t *)*((_QWORD *)this + 5)), v196, *(float64x2_t *)*((_QWORD *)this + 11));
          v158 = vcvtq_s64_f64(vaddq_f64(v157, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v157), v194, v195)));
          v160 = (int64x2_t *)*((_QWORD *)this + 9);
          v159 = (int64x2_t *)*((_QWORD *)this + 10);
          v161 = v186;
          if (v160 >= v159)
          {
            v163 = (int64x2_t *)*v23;
            v164 = 0xAAAAAAAAAAAAAAABLL * (((char *)v160 - (_BYTE *)*v23) >> 3);
            v165 = v164 + 1;
            if (v164 + 1 > 0xAAAAAAAAAAAAAAALL)
              goto LABEL_263;
            v166 = 0xAAAAAAAAAAAAAAABLL * (((char *)v159 - (char *)v163) >> 3);
            if (2 * v166 > v165)
              v165 = 2 * v166;
            if (v166 >= 0x555555555555555)
              v167 = 0xAAAAAAAAAAAAAAALL;
            else
              v167 = v165;
            if (v167)
            {
              *(int64x2_t *)v192 = v158;
              v168 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v167);
              v158 = *(int64x2_t *)v192;
              v169 = v168;
              v163 = (int64x2_t *)*((_QWORD *)this + 8);
              v160 = (int64x2_t *)*((_QWORD *)this + 9);
            }
            else
            {
              v169 = 0;
            }
            v170 = (int64x2_t *)&v169[24 * v164];
            *v170 = v158;
            v170[1].i64[0] = _D12;
            v171 = v170;
            if (v160 != v163)
            {
              do
              {
                v172 = *(int64x2_t *)((char *)v160 - 24);
                v171[-1].i64[1] = v160[-1].i64[1];
                *(int64x2_t *)((char *)v171 - 24) = v172;
                v171 = (int64x2_t *)((char *)v171 - 24);
                v160 = (int64x2_t *)((char *)v160 - 24);
              }
              while (v160 != v163);
              v163 = (int64x2_t *)*v23;
            }
            v159 = (int64x2_t *)&v169[24 * v167];
            v162 = (int64x2_t *)((char *)v170 + 24);
            *((_QWORD *)this + 8) = v171;
            *((_QWORD *)this + 9) = (char *)v170 + 24;
            *((_QWORD *)this + 10) = v159;
            if (v163)
            {
              operator delete(v163);
              v159 = *v24;
            }
          }
          else
          {
            *v160 = v158;
            v160[1].i64[0] = _D12;
            v162 = (int64x2_t *)((char *)v160 + 24);
          }
          *((_QWORD *)this + 9) = v162;
          v173 = vmlaq_f64(vcvtq_f64_s64(*(int64x2_t *)*((_QWORD *)this + 5)), v196, *(float64x2_t *)*((_QWORD *)this + 11));
          v174 = vcvtq_s64_f64(vaddq_f64(v173, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v173), v194, v195)));
          if (v162 >= v159)
          {
            v176 = (int64x2_t *)*v23;
            v177 = 0xAAAAAAAAAAAAAAABLL * (((char *)v162 - (_BYTE *)*v23) >> 3);
            v178 = v177 + 1;
            if (v177 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_263:
              std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
            v179 = 0xAAAAAAAAAAAAAAABLL * (((char *)v159 - (char *)v176) >> 3);
            if (2 * v179 > v178)
              v178 = 2 * v179;
            if (v179 >= 0x555555555555555)
              v180 = 0xAAAAAAAAAAAAAAALL;
            else
              v180 = v178;
            if (v180)
            {
              *(int64x2_t *)v193 = v174;
              v181 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v180);
              v174 = *(int64x2_t *)v193;
              v182 = v181;
              v176 = (int64x2_t *)*((_QWORD *)this + 8);
              v162 = (int64x2_t *)*((_QWORD *)this + 9);
            }
            else
            {
              v182 = 0;
            }
            v183 = (int64x2_t *)&v182[24 * v177];
            *v183 = v174;
            v183[1].i64[0] = _D12;
            v184 = v183;
            if (v162 != v176)
            {
              do
              {
                v185 = *(int64x2_t *)((char *)v162 - 24);
                v184[-1].i64[1] = v162[-1].i64[1];
                *(int64x2_t *)((char *)v184 - 24) = v185;
                v184 = (int64x2_t *)((char *)v184 - 24);
                v162 = (int64x2_t *)((char *)v162 - 24);
              }
              while (v162 != v176);
              v176 = (int64x2_t *)*v23;
            }
            v175 = &v183[1].i8[8];
            *((_QWORD *)this + 8) = v184;
            *((_QWORD *)this + 9) = (char *)v183 + 24;
            *((_QWORD *)this + 10) = &v182[24 * v180];
            if (v176)
              operator delete(v176);
          }
          else
          {
            *v162 = v174;
            v162[1].i64[0] = _D12;
            v175 = &v162[1].i8[8];
          }
          *((_QWORD *)this + 9) = v175;
        }
        else
        {
          *((_QWORD *)this + 15) = 0;
          v161 = v186;
          if (v156 == 3)
            ClipperLib::ClipperOffset::DoSquare(this, 0, 1);
          else
            ClipperLib::ClipperOffset::DoRound(this, 0, 1);
        }
        v114 = *((_QWORD *)this + 3);
        v115 = v161;
        v116 = (uint64_t)v23;
        if (v114 >= *((_QWORD *)this + 4))
          goto LABEL_257;
        goto LABEL_256;
      }
      LODWORD(v201[0]) = v34 - 1;
      v23 = (void **)((char *)this + 64);
      if ((int)v34 >= 1)
      {
        v113 = 0;
        do
          ClipperLib::ClipperOffset::OffsetPoint(this, v113++, (int *)v201, *(_DWORD *)(v32 + 72));
        while ((_DWORD)v34 != v113);
      }
LABEL_152:
      v114 = *((_QWORD *)this + 3);
      if (v114 >= *((_QWORD *)this + 4))
      {
        v115 = v186;
        v116 = (uint64_t)v23;
LABEL_257:
        result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(v115, v116);
        goto LABEL_258;
      }
      v115 = v186;
      v116 = (uint64_t)v23;
LABEL_256:
      std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)v115, v116);
      result = v114 + 24;
LABEL_258:
      *((_QWORD *)this + 3) = result;
      v20 = a2;
LABEL_259:
      ++v21;
      v19 = *((_QWORD *)this + 27);
    }
    while (v21 < (int)((unint64_t)(*((_QWORD *)this + 28) - v19) >> 3));
  }
  return result;
}

void ClipperLib::ClipperOffset::Execute(ClipperLib::ClipperOffset *this, void **a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _BYTE *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *__p[3];
  __int128 v23;
  __int128 v24;
  uint64_t (**v25)(ClipperLib::Clipper *__hidden);
  void *v26[2];
  void *v27[2];
  __int128 v28;
  void *v29[2];
  uint64_t v30;
  _QWORD v31[4];
  char v32;
  char v33;
  char v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  ClipperLib::PolyTree::Clear((ClipperLib::PolyTree *)a2);
  ClipperLib::ClipperOffset::FixOrientations(this);
  ClipperLib::ClipperOffset::DoOffset(this, a3);
  v40 = 0;
  v41 = 0;
  v42 = 0;
  v44 = 0;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v48 = 0;
  v49 = 0;
  v37 = 0u;
  v38 = 0u;
  v25 = &off_250FA1278;
  *(_OWORD *)v26 = 0u;
  *(_OWORD *)v27 = 0u;
  v28 = 0u;
  *(_OWORD *)v29 = 0u;
  v30 = 0;
  v31[0] = v31;
  v31[1] = v31;
  v31[2] = 0;
  v32 = 0;
  v39 = 0;
  v33 = 0;
  v34 = 0;
  v43 = 0;
  v35 = 0;
  v36 = &unk_250FA12C0;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v36, (uint64_t *)this + 2, 0, 1);
  if (a3 <= 0.0)
  {
    v23 = 0u;
    v24 = 0u;
    ClipperLib::ClipperBase::GetBounds((ClipperLib::ClipperBase *)((char *)&v26[-1] + (_QWORD)*(v25 - 3)), (uint64_t)&v23);
    std::vector<ClipperLib::IntPoint>::vector(__p, 4uLL);
    v6 = *((_QWORD *)&v23 + 1);
    v7 = v23 - 10;
    v8 = v24;
    v9 = *((_QWORD *)&v24 + 1) + 10;
    v10 = __p[0];
    *(_QWORD *)__p[0] = v23 - 10;
    v10[1] = v9;
    v8 += 10;
    v10[3] = v8;
    v10[4] = v9;
    __asm { FMOV            V0.2S, #-1.0 }
    v10[2] = _D0;
    v10[5] = _D0;
    v6 -= 10;
    v10[6] = v8;
    v10[7] = v6;
    v10[8] = _D0;
    v10[9] = v7;
    v10[10] = v6;
    v10[11] = _D0;
    ClipperLib::ClipperBase::AddPath((uint64_t)&v26[-1] + (_QWORD)*(v25 - 3), (uint64_t **)__p, 0, 1);
    v33 = 1;
    ClipperLib::Clipper::Execute((uint64_t)&v25, 1, (ClipperLib::PolyTree *)a2, 3, 3);
    v16 = a2[4];
    v17 = (char *)(a2 + 4);
    if ((((_BYTE *)a2[5] - v16) & 0x7FFFFFFF8) == 8
      && (v18 = *(_QWORD *)v16,
          v19 = *(_QWORD *)(*(_QWORD *)v16 + 40) - *(_QWORD *)(*(_QWORD *)v16 + 32),
          (int)(v19 >> 3) >= 1))
    {
      std::vector<ClipperLib::PolyNode *>::reserve(a2 + 4, (v19 >> 3));
      **(_QWORD **)v17 = **(_QWORD **)(v18 + 32);
      *(_QWORD *)(**(_QWORD **)v17 + 56) = *(_QWORD *)(v18 + 56);
      v20 = *(_QWORD *)(v18 + 32);
      if ((int)((unint64_t)(*(_QWORD *)(v18 + 40) - v20) >> 3) >= 2)
      {
        v21 = 1;
        do
        {
          ClipperLib::PolyNode::AddChild((ClipperLib::PolyNode *)a2, *(ClipperLib::PolyNode **)(v20 + 8 * v21++));
          v20 = *(_QWORD *)(v18 + 32);
        }
        while (v21 < (int)((unint64_t)(*(_QWORD *)(v18 + 40) - v20) >> 3));
      }
    }
    else
    {
      ClipperLib::PolyTree::Clear((ClipperLib::PolyTree *)a2);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  else
  {
    ClipperLib::Clipper::Execute((uint64_t)&v25, 1, (ClipperLib::PolyTree *)a2, 2, 2);
  }
  v25 = &off_250FA1278;
  v36 = &unk_250FA12C0;
  std::__list_imp<long long>::clear(v31);
  if (v29[0])
  {
    v29[1] = v29[0];
    operator delete(v29[0]);
  }
  if (v27[1])
  {
    *(void **)&v28 = v27[1];
    operator delete(v27[1]);
  }
  if (v26[0])
  {
    v26[1] = v26[0];
    operator delete(v26[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v36);
}

void sub_23F0F56CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (__p)
    operator delete(__p);
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a17);
  _Unwind_Resume(a1);
}

void std::vector<ClipperLib::DoublePoint>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    v9 = &v6[16 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void ClipperLib::ClipperOffset::OffsetPoint(ClipperLib::ClipperOffset *this, int a2, int *a3, int a4)
{
  int *v4;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  double v10;
  double v11;
  float64x2_t v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  float64x2_t v17;
  int64x2_t v24;
  int64x2_t *v25;
  int64x2_t *v27;
  void **v28;
  float64x2_t v29;
  int64x2_t v32;
  int64x2_t *v33;
  __int8 *v35;
  double v36;
  int64x2_t *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  int64x2_t *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  int64x2_t *v51;
  int64x2_t v53;
  uint64_t v54;
  __int128 v55;
  int64x2_t *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  __int128 v64;
  char *v65;
  char *v66;
  __int128 v67;
  unint64_t v68;
  float64x2_t v69;
  int64x2_t v70;
  __int8 *v72;
  int64x2_t *v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  char *v78;
  char *v79;
  int64x2_t *v80;
  char *v81;
  int64x2_t v83;
  int64x2_t *v84;
  char *v85;
  __int8 *v87;
  int64x2_t v88;
  int64x2_t v89;
  int8x16_t v90;
  int8x16_t v91;
  int64x2_t v92;
  int64x2_t v93;

  v4 = a3;
  v7 = *((_QWORD *)this + 11);
  v8 = a2;
  v9 = (double *)(v7 + 16 * a2);
  v11 = *v9;
  v10 = v9[1];
  v12 = *(float64x2_t *)(v7 + 16 * *a3);
  v13 = vmlad_n_f64(vmuld_lane_f64(-*v9, v12, 1), v10, v12.f64[0]);
  *((double *)this + 15) = v13;
  v14 = *((double *)this + 14);
  v15 = 1.0;
  if (fabs(v13 * v14) >= 1.0)
  {
    if (v13 > 1.0 || (v15 = -1.0, v13 < -1.0))
    {
      *((double *)this + 15) = v15;
      v13 = v15;
    }
LABEL_8:
    if (v13 * v14 < 0.0)
    {
      v27 = (int64x2_t *)*((_QWORD *)this + 10);
      v28 = (void **)((char *)this + 64);
      v29 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((_QWORD *)this + 5) + 24 * a2)), *(float64x2_t *)(*((_QWORD *)this + 11) + 16 * *a3), v14);
      __asm
      {
        FMOV            V3.2D, #0.5
        FMOV            V4.2D, #-0.5
      }
      v32 = vcvtq_s64_f64(vaddq_f64(v29, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v29), _Q4, _Q3)));
      v33 = (int64x2_t *)*((_QWORD *)this + 9);
      v90 = _Q4;
      v91 = _Q3;
      if (v33 >= v27)
      {
        v37 = (int64x2_t *)*v28;
        v38 = 0xAAAAAAAAAAAAAAABLL * (((char *)v33 - (_BYTE *)*v28) >> 3);
        v39 = v38 + 1;
        if (v38 + 1 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_84;
        v40 = 0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (char *)v37) >> 3);
        if (2 * v40 > v39)
          v39 = 2 * v40;
        if (v40 >= 0x555555555555555)
          v41 = 0xAAAAAAAAAAAAAAALL;
        else
          v41 = v39;
        if (v41)
        {
          v89 = v32;
          v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v41);
          v32 = v89;
          v43 = v42;
          v37 = (int64x2_t *)*((_QWORD *)this + 8);
          v33 = (int64x2_t *)*((_QWORD *)this + 9);
        }
        else
        {
          v43 = 0;
        }
        v51 = (int64x2_t *)&v43[24 * v38];
        v27 = (int64x2_t *)&v43[24 * v41];
        *v51 = v32;
        __asm { FMOV            V0.2S, #-1.0 }
        v51[1].i64[0] = _D0;
        v35 = &v51[1].i8[8];
        if (v33 != v37)
        {
          do
          {
            v53 = *(int64x2_t *)((char *)v33 - 24);
            v51[-1].i64[1] = v33[-1].i64[1];
            *(int64x2_t *)((char *)v51 - 24) = v53;
            v51 = (int64x2_t *)((char *)v51 - 24);
            v33 = (int64x2_t *)((char *)v33 - 24);
          }
          while (v33 != v37);
          v37 = (int64x2_t *)*v28;
        }
        *((_QWORD *)this + 8) = v51;
        *((_QWORD *)this + 9) = v35;
        *((_QWORD *)this + 10) = v27;
        if (v37)
        {
          operator delete(v37);
          v27 = (int64x2_t *)*((_QWORD *)this + 10);
        }
        _Q4 = v90;
        _Q3 = v91;
      }
      else
      {
        *v33 = v32;
        __asm { FMOV            V0.2S, #-1.0 }
        v33[1].i64[0] = _D0;
        v35 = &v33[1].i8[8];
      }
      *((_QWORD *)this + 9) = v35;
      v54 = *((_QWORD *)this + 5) + 24 * (int)v8;
      if (v35 >= (__int8 *)v27)
      {
        v57 = 0xAAAAAAAAAAAAAAABLL * ((v35 - (_BYTE *)*v28) >> 3);
        if (v57 + 1 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_84;
        v58 = 0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (_BYTE *)*v28) >> 3);
        v59 = 2 * v58;
        if (2 * v58 <= v57 + 1)
          v59 = v57 + 1;
        if (v58 >= 0x555555555555555)
          v60 = 0xAAAAAAAAAAAAAAALL;
        else
          v60 = v59;
        if (v60)
          v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v60);
        else
          v61 = 0;
        v62 = &v61[24 * v57];
        v63 = &v61[24 * v60];
        v64 = *(_OWORD *)v54;
        *((_QWORD *)v62 + 2) = *(_QWORD *)(v54 + 16);
        *(_OWORD *)v62 = v64;
        v56 = (int64x2_t *)(v62 + 24);
        v66 = (char *)*((_QWORD *)this + 8);
        v65 = (char *)*((_QWORD *)this + 9);
        if (v65 != v66)
        {
          do
          {
            v67 = *(_OWORD *)(v65 - 24);
            *((_QWORD *)v62 - 1) = *((_QWORD *)v65 - 1);
            *(_OWORD *)(v62 - 24) = v67;
            v62 -= 24;
            v65 -= 24;
          }
          while (v65 != v66);
          v65 = (char *)*v28;
        }
        *((_QWORD *)this + 8) = v62;
        *((_QWORD *)this + 9) = v56;
        *((_QWORD *)this + 10) = v63;
        if (v65)
          operator delete(v65);
        _Q4 = v90;
        _Q3 = v91;
      }
      else
      {
        v55 = *(_OWORD *)v54;
        *((_QWORD *)v35 + 2) = *(_QWORD *)(v54 + 16);
        *(_OWORD *)v35 = v55;
        v56 = (int64x2_t *)(v35 + 24);
      }
      *((_QWORD *)this + 9) = v56;
      v68 = *((_QWORD *)this + 10);
      v69 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((_QWORD *)this + 5) + 24 * (int)v8)), *(float64x2_t *)(*((_QWORD *)this + 11) + 16 * v8), *((double *)this + 14));
      v70 = vcvtq_s64_f64(vaddq_f64(v69, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v69), _Q4, _Q3)));
      if ((unint64_t)v56 < v68)
      {
        *v56 = v70;
        __asm { FMOV            V0.2S, #-1.0 }
        v56[1].i64[0] = _D0;
        v72 = &v56[1].i8[8];
LABEL_75:
        *((_QWORD *)this + 9) = v72;
        goto LABEL_76;
      }
      v73 = (int64x2_t *)*v28;
      v74 = 0xAAAAAAAAAAAAAAABLL * (((char *)v56 - (_BYTE *)*v28) >> 3);
      v75 = v74 + 1;
      if (v74 + 1 <= 0xAAAAAAAAAAAAAAALL)
      {
        v76 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v68 - (_QWORD)v73) >> 3);
        if (2 * v76 > v75)
          v75 = 2 * v76;
        if (v76 >= 0x555555555555555)
          v77 = 0xAAAAAAAAAAAAAAALL;
        else
          v77 = v75;
        if (v77)
        {
          v93 = v70;
          v78 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v77);
          v70 = v93;
          v79 = v78;
          v73 = (int64x2_t *)*((_QWORD *)this + 8);
          v56 = (int64x2_t *)*((_QWORD *)this + 9);
        }
        else
        {
          v79 = 0;
        }
        v80 = (int64x2_t *)&v79[24 * v74];
        v81 = &v79[24 * v77];
        *v80 = v70;
        __asm { FMOV            V0.2S, #-1.0 }
        v80[1].i64[0] = _D0;
        v72 = &v80[1].i8[8];
        if (v56 != v73)
        {
          do
          {
            v83 = *(int64x2_t *)((char *)v56 - 24);
            v80[-1].i64[1] = v56[-1].i64[1];
            *(int64x2_t *)((char *)v80 - 24) = v83;
            v80 = (int64x2_t *)((char *)v80 - 24);
            v56 = (int64x2_t *)((char *)v56 - 24);
          }
          while (v56 != v73);
          v73 = (int64x2_t *)*v28;
        }
        *((_QWORD *)this + 8) = v80;
        *((_QWORD *)this + 9) = v72;
        *((_QWORD *)this + 10) = v81;
        if (v73)
          operator delete(v73);
        goto LABEL_75;
      }
LABEL_84:
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    }
    if (a4)
    {
      if (a4 == 1)
      {
        ClipperLib::ClipperOffset::DoRound(this, a2, *a3);
        goto LABEL_76;
      }
      if (a4 != 2)
      {
LABEL_76:
        *v4 = a2;
        return;
      }
      a3 = (int *)*a3;
      v36 = *(double *)(*((_QWORD *)this + 11) + 16 * a2 + 8)
          * *(double *)(*((_QWORD *)this + 11) + 16 * (_QWORD)a3 + 8)
          + *(double *)(*((_QWORD *)this + 11) + 16 * a2) * *(double *)(*((_QWORD *)this + 11) + 16 * (_QWORD)a3)
          + 1.0;
      if (v36 >= *((double *)this + 18))
      {
        ClipperLib::ClipperOffset::DoMiter(this, a2, (int)a3, v36);
        goto LABEL_76;
      }
    }
    else
    {
      LODWORD(a3) = *a3;
    }
    ClipperLib::ClipperOffset::DoSquare(this, a2, (int)a3);
    goto LABEL_76;
  }
  if (v10 * v12.f64[1] + v12.f64[0] * v11 <= 0.0)
    goto LABEL_8;
  v16 = *((_QWORD *)this + 10);
  v17 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((_QWORD *)this + 5) + 24 * a2)), v12, v14);
  __asm
  {
    FMOV            V1.2D, #0.5
    FMOV            V3.2D, #-0.5
  }
  v24 = vcvtq_s64_f64(vaddq_f64(v17, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v17), _Q3, _Q1)));
  v25 = (int64x2_t *)*((_QWORD *)this + 9);
  if ((unint64_t)v25 >= v16)
  {
    v44 = (int64x2_t *)*((_QWORD *)this + 8);
    v45 = 0xAAAAAAAAAAAAAAABLL * (((char *)v25 - (char *)v44) >> 3);
    v46 = v45 + 1;
    if (v45 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v47 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - (_QWORD)v44) >> 3);
    if (2 * v47 > v46)
      v46 = 2 * v47;
    if (v47 >= 0x555555555555555)
      v48 = 0xAAAAAAAAAAAAAAALL;
    else
      v48 = v46;
    if (v48)
    {
      v92 = v24;
      v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v48);
      v24 = v92;
      v50 = v49;
      v44 = (int64x2_t *)*((_QWORD *)this + 8);
      v25 = (int64x2_t *)*((_QWORD *)this + 9);
    }
    else
    {
      v50 = 0;
    }
    v84 = (int64x2_t *)&v50[24 * v45];
    v85 = &v50[24 * v48];
    *v84 = v24;
    __asm { FMOV            V0.2S, #-1.0 }
    v84[1].i64[0] = _D0;
    v87 = &v84[1].i8[8];
    if (v25 != v44)
    {
      do
      {
        v88 = *(int64x2_t *)((char *)v25 - 24);
        v84[-1].i64[1] = v25[-1].i64[1];
        *(int64x2_t *)((char *)v84 - 24) = v88;
        v84 = (int64x2_t *)((char *)v84 - 24);
        v25 = (int64x2_t *)((char *)v25 - 24);
      }
      while (v25 != v44);
      v44 = (int64x2_t *)*((_QWORD *)this + 8);
    }
    *((_QWORD *)this + 8) = v84;
    *((_QWORD *)this + 9) = v87;
    *((_QWORD *)this + 10) = v85;
    if (v44)
      operator delete(v44);
    *((_QWORD *)this + 9) = v87;
  }
  else
  {
    *v25 = v24;
    __asm { FMOV            V0.2S, #-1.0 }
    v25[1].i64[0] = _D0;
    *((_QWORD *)this + 9) = (char *)v25 + 24;
  }
}

void ClipperLib::ClipperOffset::DoSquare(ClipperLib::ClipperOffset *this, int a2, int a3)
{
  uint64_t v5;
  double *v6;
  double v7;
  double v8;
  long double v9;
  double v10;
  int64x2_t *v11;
  uint64_t *v12;
  double v13;
  double v14;
  double v15;
  void **v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t *v21;
  int64x2_t *v27;
  uint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t *v34;
  __int128 v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  int64x2_t v42;
  __int8 *v44;
  int64x2_t *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  char *v50;
  char *v51;
  int64x2_t *v52;
  char *v53;
  int64x2_t v55;
  double v56;
  int64x2_t v57;

  v5 = *((_QWORD *)this + 11);
  v6 = (double *)(v5 + 16 * a3);
  v7 = *v6;
  v8 = v6[1];
  v9 = atan2(*((long double *)this + 15), v8 * *(double *)(v5 + 16 * a2 + 8) + *v6 * *(double *)(v5 + 16 * a2));
  v10 = tan(v9 * 0.25);
  v11 = (int64x2_t *)*((_QWORD *)this + 10);
  v12 = (uint64_t *)(*((_QWORD *)this + 5) + 24 * a2);
  v13 = *((double *)this + 14);
  v14 = (double)*v12 + v13 * (v7 - v8 * v10);
  if (v14 >= 0.0)
    v15 = 0.5;
  else
    v15 = -0.5;
  v16 = (void **)((char *)this + 64);
  v17 = (uint64_t)(v14 + v15);
  v18 = (double)v12[1] + v13 * (v8 + v7 * v10);
  if (v18 >= 0.0)
    v19 = 0.5;
  else
    v19 = -0.5;
  v20 = (uint64_t)(v18 + v19);
  v21 = (uint64_t *)*((_QWORD *)this + 9);
  if (v21 >= (uint64_t *)v11)
  {
    v28 = (uint64_t *)*v16;
    v29 = 0xAAAAAAAAAAAAAAABLL * (((char *)v21 - (_BYTE *)*v16) >> 3);
    v30 = v29 + 1;
    if (v29 + 1 > 0xAAAAAAAAAAAAAAALL)
      goto LABEL_41;
    v56 = v10;
    v31 = 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)v28) >> 3);
    if (2 * v31 > v30)
      v30 = 2 * v31;
    if (v31 >= 0x555555555555555)
      v32 = 0xAAAAAAAAAAAAAAALL;
    else
      v32 = v30;
    if (v32)
    {
      v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v32);
      v28 = (uint64_t *)*((_QWORD *)this + 8);
      v21 = (uint64_t *)*((_QWORD *)this + 9);
    }
    else
    {
      v33 = 0;
    }
    v34 = (uint64_t *)&v33[24 * v29];
    v11 = (int64x2_t *)&v33[24 * v32];
    *v34 = v17;
    v34[1] = v20;
    __asm { FMOV            V0.2S, #-1.0 }
    v34[2] = _D0;
    v27 = (int64x2_t *)(v34 + 3);
    if (v21 != v28)
    {
      do
      {
        v36 = *(_OWORD *)(v21 - 3);
        *(v34 - 1) = *(v21 - 1);
        *(_OWORD *)(v34 - 3) = v36;
        v34 -= 3;
        v21 -= 3;
      }
      while (v21 != v28);
      v28 = (uint64_t *)*v16;
    }
    *((_QWORD *)this + 8) = v34;
    *((_QWORD *)this + 9) = v27;
    *((_QWORD *)this + 10) = v11;
    if (v28)
    {
      operator delete(v28);
      v11 = (int64x2_t *)*((_QWORD *)this + 10);
    }
    v10 = v56;
  }
  else
  {
    *v21 = v17;
    v21[1] = v20;
    __asm { FMOV            V1.2S, #-1.0 }
    v21[2] = _D1;
    v27 = (int64x2_t *)(v21 + 3);
  }
  *((_QWORD *)this + 9) = v27;
  v37 = *(float64x2_t *)(*((_QWORD *)this + 11) + 16 * a2);
  *(_QWORD *)&v38.f64[0] = vdupq_laneq_s64((int64x2_t)v37, 1).u64[0];
  v38.f64[1] = -v37.f64[0];
  v39 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((_QWORD *)this + 5) + 24 * a2)), vmlaq_n_f64(v37, v38, v10), *((double *)this + 14));
  __asm
  {
    FMOV            V1.2D, #0.5
    FMOV            V3.2D, #-0.5
  }
  v42 = vcvtq_s64_f64(vaddq_f64(v39, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v39), _Q3, _Q1)));
  if (v27 < v11)
  {
    *v27 = v42;
    __asm { FMOV            V0.2S, #-1.0 }
    v27[1].i64[0] = _D0;
    v44 = &v27[1].i8[8];
    goto LABEL_40;
  }
  v45 = (int64x2_t *)*v16;
  v46 = 0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (_BYTE *)*v16) >> 3);
  v47 = v46 + 1;
  if (v46 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_41:
    std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
  v48 = 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)v45) >> 3);
  if (2 * v48 > v47)
    v47 = 2 * v48;
  if (v48 >= 0x555555555555555)
    v49 = 0xAAAAAAAAAAAAAAALL;
  else
    v49 = v47;
  if (v49)
  {
    v57 = v42;
    v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v49);
    v42 = v57;
    v51 = v50;
    v45 = (int64x2_t *)*((_QWORD *)this + 8);
    v27 = (int64x2_t *)*((_QWORD *)this + 9);
  }
  else
  {
    v51 = 0;
  }
  v52 = (int64x2_t *)&v51[24 * v46];
  v53 = &v51[24 * v49];
  *v52 = v42;
  __asm { FMOV            V0.2S, #-1.0 }
  v52[1].i64[0] = _D0;
  v44 = &v52[1].i8[8];
  if (v27 != v45)
  {
    do
    {
      v55 = *(int64x2_t *)((char *)v27 - 24);
      v52[-1].i64[1] = v27[-1].i64[1];
      *(int64x2_t *)((char *)v52 - 24) = v55;
      v52 = (int64x2_t *)((char *)v52 - 24);
      v27 = (int64x2_t *)((char *)v27 - 24);
    }
    while (v27 != v45);
    v45 = (int64x2_t *)*v16;
  }
  *((_QWORD *)this + 8) = v52;
  *((_QWORD *)this + 9) = v44;
  *((_QWORD *)this + 10) = v53;
  if (v45)
    operator delete(v45);
LABEL_40:
  *((_QWORD *)this + 9) = v44;
}

void ClipperLib::ClipperOffset::DoRound(ClipperLib::ClipperOffset *this, int a2, int a3)
{
  uint64_t v4;
  double *v5;
  uint64_t v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  int v12;
  void **v13;
  uint64_t *v14;
  uint64_t *v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t *v35;
  uint64_t *v36;
  __int128 v37;
  double v38;
  double v39;
  double v40;
  unint64_t v41;
  float64x2_t v42;
  int64x2_t v45;
  uint64_t *v46;
  uint64_t *v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  char *v52;
  char *v53;
  int64x2_t *v54;
  char *v55;
  int64x2_t v56;
  int64x2_t v57;

  v4 = *((_QWORD *)this + 11);
  v5 = (double *)(v4 + 16 * a3);
  v6 = a2;
  v8 = *v5;
  v7 = v5[1];
  v9 = 0;
  v10 = *((double *)this + 19)
      * fabs(atan2(*((long double *)this + 15), v7 * *(double *)(v4 + 16 * a2 + 8) + *v5 * *(double *)(v4 + 16 * a2)));
  if (v10 >= 0.0)
    v11 = 0.5;
  else
    v11 = -0.5;
  if ((int)(uint64_t)(v10 + v11) <= 1)
    v12 = 1;
  else
    v12 = (uint64_t)(v10 + v11);
  v13 = (void **)((char *)this + 64);
  v14 = (uint64_t *)*((_QWORD *)this + 9);
  __asm { FMOV            V8.2S, #-1.0 }
  do
  {
    v20 = (uint64_t *)(*((_QWORD *)this + 5) + 24 * (int)v6);
    v21 = *((double *)this + 14);
    v22 = (double)*v20 + v8 * v21;
    if (v22 >= 0.0)
      v23 = 0.5;
    else
      v23 = -0.5;
    v24 = (uint64_t)(v22 + v23);
    v25 = (double)v20[1] + v7 * v21;
    if (v25 >= 0.0)
      v26 = 0.5;
    else
      v26 = -0.5;
    v27 = (uint64_t)(v25 + v26);
    v28 = *((_QWORD *)this + 10);
    if ((unint64_t)v14 >= v28)
    {
      v29 = (uint64_t *)*v13;
      v30 = 0xAAAAAAAAAAAAAAABLL * (((char *)v14 - (_BYTE *)*v13) >> 3);
      v31 = v30 + 1;
      if (v30 + 1 > 0xAAAAAAAAAAAAAAALL)
        goto LABEL_48;
      v32 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - (_QWORD)v29) >> 3);
      if (2 * v32 > v31)
        v31 = 2 * v32;
      if (v32 >= 0x555555555555555)
        v33 = 0xAAAAAAAAAAAAAAALL;
      else
        v33 = v31;
      if (v33)
      {
        v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v33);
        v29 = (uint64_t *)*((_QWORD *)this + 8);
        v14 = (uint64_t *)*((_QWORD *)this + 9);
      }
      else
      {
        v34 = 0;
      }
      v35 = (uint64_t *)&v34[24 * v30];
      *v35 = v24;
      v35[1] = v27;
      v35[2] = _D8;
      v36 = v35;
      if (v14 != v29)
      {
        do
        {
          v37 = *(_OWORD *)(v14 - 3);
          *(v36 - 1) = *(v14 - 1);
          *(_OWORD *)(v36 - 3) = v37;
          v36 -= 3;
          v14 -= 3;
        }
        while (v14 != v29);
        v29 = (uint64_t *)*v13;
      }
      v14 = v35 + 3;
      *((_QWORD *)this + 8) = v36;
      *((_QWORD *)this + 9) = v35 + 3;
      *((_QWORD *)this + 10) = &v34[24 * v33];
      if (v29)
        operator delete(v29);
    }
    else
    {
      *v14 = v24;
      v14[1] = v27;
      v14[2] = _D8;
      v14 += 3;
    }
    *((_QWORD *)this + 9) = v14;
    v39 = *((double *)this + 16);
    v38 = *((double *)this + 17);
    v40 = -(v39 * v7);
    v7 = v7 * v38 + v8 * v39;
    v8 = v40 + v8 * v38;
    ++v9;
  }
  while (v9 != v12);
  v41 = *((_QWORD *)this + 10);
  v42 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((_QWORD *)this + 5) + 24 * (int)v6)), *(float64x2_t *)(*((_QWORD *)this + 11) + 16 * v6), *((double *)this + 14));
  __asm
  {
    FMOV            V2.2D, #0.5
    FMOV            V3.2D, #-0.5
  }
  v45 = vcvtq_s64_f64(vaddq_f64(v42, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v42), _Q3, _Q2)));
  if ((unint64_t)v14 >= v41)
  {
    v47 = (uint64_t *)*v13;
    v48 = 0xAAAAAAAAAAAAAAABLL * (((char *)v14 - (_BYTE *)*v13) >> 3);
    v49 = v48 + 1;
    if (v48 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_48:
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v50 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v41 - (_QWORD)v47) >> 3);
    if (2 * v50 > v49)
      v49 = 2 * v50;
    if (v50 >= 0x555555555555555)
      v51 = 0xAAAAAAAAAAAAAAALL;
    else
      v51 = v49;
    if (v51)
    {
      v57 = v45;
      v52 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)this + 80, v51);
      v45 = v57;
      v53 = v52;
      v47 = (uint64_t *)*((_QWORD *)this + 8);
      v14 = (uint64_t *)*((_QWORD *)this + 9);
    }
    else
    {
      v53 = 0;
    }
    v54 = (int64x2_t *)&v53[24 * v48];
    v55 = &v53[24 * v51];
    *v54 = v45;
    v54[1].i64[0] = _D8;
    v46 = &v54[1].i64[1];
    if (v14 != v47)
    {
      do
      {
        v56 = *(int64x2_t *)(v14 - 3);
        v54[-1].i64[1] = *(v14 - 1);
        *(int64x2_t *)((char *)v54 - 24) = v56;
        v54 = (int64x2_t *)((char *)v54 - 24);
        v14 -= 3;
      }
      while (v14 != v47);
      v47 = (uint64_t *)*v13;
    }
    *((_QWORD *)this + 8) = v54;
    *((_QWORD *)this + 9) = v46;
    *((_QWORD *)this + 10) = v55;
    if (v47)
      operator delete(v47);
  }
  else
  {
    *(int64x2_t *)v14 = v45;
    v14[2] = _D8;
    v46 = v14 + 3;
  }
  *((_QWORD *)this + 9) = v46;
}

void ClipperLib::ClipperOffset::DoMiter(ClipperLib::ClipperOffset *this, int a2, int a3, double a4)
{
  char *v5;
  unint64_t v6;
  float64x2_t v7;
  int64x2_t v14;
  int64x2_t *v15;
  __int8 *v17;
  void **v18;
  int64x2_t *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  int64x2_t *v26;
  char *v27;
  int64x2_t v29;
  int64x2_t v30;

  v5 = (char *)this + 80;
  v6 = *((_QWORD *)this + 10);
  v7 = vmlaq_n_f64(vcvtq_f64_s64(*(int64x2_t *)(*((_QWORD *)this + 5) + 24 * a2)), vaddq_f64(*(float64x2_t *)(*((_QWORD *)this + 11) + 16 * a3), *(float64x2_t *)(*((_QWORD *)this + 11) + 16 * a2)), *((double *)this + 14) / a4);
  __asm
  {
    FMOV            V2.2D, #0.5
    FMOV            V3.2D, #-0.5
  }
  v14 = vcvtq_s64_f64(vaddq_f64(v7, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(v7), _Q3, _Q2)));
  v15 = (int64x2_t *)*((_QWORD *)this + 9);
  if ((unint64_t)v15 >= v6)
  {
    v18 = (void **)((char *)this + 64);
    v19 = (int64x2_t *)*((_QWORD *)this + 8);
    v20 = 0xAAAAAAAAAAAAAAABLL * (((char *)v15 - (char *)v19) >> 3);
    v21 = v20 + 1;
    if (v20 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - (_QWORD)v19) >> 3);
    if (2 * v22 > v21)
      v21 = 2 * v22;
    if (v22 >= 0x555555555555555)
      v23 = 0xAAAAAAAAAAAAAAALL;
    else
      v23 = v21;
    if (v23)
    {
      v30 = v14;
      v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)v5, v23);
      v14 = v30;
      v25 = v24;
      v19 = (int64x2_t *)*((_QWORD *)this + 8);
      v15 = (int64x2_t *)*((_QWORD *)this + 9);
    }
    else
    {
      v25 = 0;
    }
    v26 = (int64x2_t *)&v25[24 * v20];
    v27 = &v25[24 * v23];
    *v26 = v14;
    __asm { FMOV            V0.2S, #-1.0 }
    v26[1].i64[0] = _D0;
    v17 = &v26[1].i8[8];
    if (v15 != v19)
    {
      do
      {
        v29 = *(int64x2_t *)((char *)v15 - 24);
        v26[-1].i64[1] = v15[-1].i64[1];
        *(int64x2_t *)((char *)v26 - 24) = v29;
        v26 = (int64x2_t *)((char *)v26 - 24);
        v15 = (int64x2_t *)((char *)v15 - 24);
      }
      while (v15 != v19);
      v19 = (int64x2_t *)*v18;
    }
    *((_QWORD *)this + 8) = v26;
    *((_QWORD *)this + 9) = v17;
    *((_QWORD *)this + 10) = v27;
    if (v19)
      operator delete(v19);
  }
  else
  {
    *v15 = v14;
    __asm { FMOV            V0.2S, #-1.0 }
    v15[1].i64[0] = _D0;
    v17 = &v15[1].i8[8];
  }
  *((_QWORD *)this + 9) = v17;
}

uint64_t *ClipperLib::ReversePaths(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;

  v2 = *result;
  v1 = result[1];
  if (v1 != *result)
  {
    v3 = 0;
    do
    {
      v4 = (unint64_t *)(v2 + 24 * v3);
      v5 = *v4;
      v6 = v4[1];
      v7 = v6 - 24;
      if (v5 != v6 && v7 > v5)
      {
        v9 = v5 + 24;
        do
        {
          v10 = *(_QWORD *)(v9 - 8);
          v11 = *(_OWORD *)(v9 - 24);
          v12 = *(_QWORD *)(v7 + 16);
          *(_OWORD *)(v9 - 24) = *(_OWORD *)v7;
          *(_QWORD *)(v9 - 8) = v12;
          *(_OWORD *)v7 = v11;
          *(_QWORD *)(v7 + 16) = v10;
          v7 -= 24;
          v13 = v9 >= v7;
          v9 += 24;
        }
        while (!v13);
        v2 = *result;
        v1 = result[1];
      }
      ++v3;
    }
    while (v3 < 0xAAAAAAAAAAAAAAABLL * ((v1 - v2) >> 3));
  }
  return result;
}

void ClipperLib::SimplifyPolygon(uint64_t **a1, uint64_t *a2, int a3)
{
  uint64_t (**v5)(ClipperLib::Clipper *__hidden);
  void *v6[2];
  void *v7[2];
  __int128 v8;
  void *__p[2];
  uint64_t v10;
  _QWORD v11[4];
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v20 = 0;
  v21 = 0;
  v22 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v17 = 0u;
  v18 = 0u;
  v5 = &off_250FA1278;
  *(_OWORD *)v6 = 0u;
  *(_OWORD *)v7 = 0u;
  v8 = 0u;
  *(_OWORD *)__p = 0u;
  v10 = 0;
  v11[0] = v11;
  v11[1] = v11;
  v11[2] = 0;
  v12 = 0;
  v19 = 0;
  v13 = 0;
  v23 = 0;
  v15 = 0;
  v16 = &unk_250FA12C0;
  v14 = 1;
  ClipperLib::ClipperBase::AddPath((uint64_t)&v16, a1, 0, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v5, 1, a2, a3, a3);
  v5 = &off_250FA1278;
  v16 = &unk_250FA12C0;
  std::__list_imp<long long>::clear(v11);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v7[1])
  {
    *(void **)&v8 = v7[1];
    operator delete(v7[1]);
  }
  if (v6[0])
  {
    v6[1] = v6[0];
    operator delete(v6[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v16);
}

void sub_23F0F6734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a9);
  _Unwind_Resume(a1);
}

void ClipperLib::SimplifyPolygons(uint64_t *a1, uint64_t *a2, int a3)
{
  uint64_t (**v5)(ClipperLib::Clipper *__hidden);
  void *v6[2];
  void *v7[2];
  __int128 v8;
  void *__p[2];
  uint64_t v10;
  _QWORD v11[4];
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v20 = 0;
  v21 = 0;
  v22 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v17 = 0u;
  v18 = 0u;
  v5 = &off_250FA1278;
  *(_OWORD *)v6 = 0u;
  *(_OWORD *)v7 = 0u;
  v8 = 0u;
  *(_OWORD *)__p = 0u;
  v10 = 0;
  v11[0] = v11;
  v11[1] = v11;
  v11[2] = 0;
  v12 = 0;
  v19 = 0;
  v13 = 0;
  v23 = 0;
  v15 = 0;
  v16 = &unk_250FA12C0;
  v14 = 1;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v16, a1, 0, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v5, 1, a2, a3, a3);
  v5 = &off_250FA1278;
  v16 = &unk_250FA12C0;
  std::__list_imp<long long>::clear(v11);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v7[1])
  {
    *(void **)&v8 = v7[1];
    operator delete(v7[1]);
  }
  if (v6[0])
  {
    v6[1] = v6[0];
    operator delete(v6[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v16);
}

void sub_23F0F6870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a9);
  _Unwind_Resume(a1);
}

void ClipperLib::SimplifyPolygons(uint64_t *a1, int a2)
{
  ClipperLib::SimplifyPolygons(a1, a1, a2);
}

double ClipperLib::DistanceFromLineSqrd(uint64_t *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  double v6;

  v3 = a2[1];
  v4 = (double)(v3 - a3[1]);
  v5 = *a3 - *a2;
  v6 = (double)v5 * (double)a1[1] + v4 * (double)*a1 - ((double)v3 * (double)v5 + v4 * (double)*a2);
  return v6 * v6 / ((double)v5 * (double)v5 + v4 * v4);
}

BOOL ClipperLib::SlopesNearCollinear(uint64_t *a1, uint64_t *a2, uint64_t *a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;

  v5 = *a1;
  v4 = a1[1];
  v7 = *a2;
  v6 = a2[1];
  if (*a1 - *a2 >= 0)
    v8 = *a1 - *a2;
  else
    v8 = *a2 - *a1;
  v9 = v4 - v6;
  if (v4 - v6 >= 0)
    v10 = v4 - v6;
  else
    v10 = v6 - v4;
  if (v8 <= v10)
  {
    v14 = a3[1];
    if (v4 <= v6 != v4 < v14)
    {
      v12 = (double)(v6 - v14);
      v13 = *a3 - v7;
      goto LABEL_12;
    }
    if (v4 >= v6 != v6 < v14)
    {
      v12 = (double)(v4 - v14);
      v15 = (double)(*a3 - v5);
      goto LABEL_17;
    }
    v12 = (double)v9;
    v15 = (double)(v7 - v5);
    v16 = (double)v4 * v15 + (double)v9 * (double)v5;
    v17 = (double)*a3;
    v21 = (double)v14;
LABEL_21:
    v20 = v15 * v21;
    return (v20 + v12 * v17 - v16) * (v20 + v12 * v17 - v16) / (v15 * v15 + v12 * v12) < a4;
  }
  v11 = *a3;
  if (v7 >= v5 == *a3 > v5)
  {
    v19 = v7 - v5;
    if (v7 <= v5 != v11 > v7)
    {
      v12 = (double)(v4 - a3[1]);
      v15 = (double)(*a3 - v5);
LABEL_17:
      v16 = (double)v4 * v15 + v12 * (double)v5;
      v17 = (double)v7;
      v18 = (double)v6;
      goto LABEL_18;
    }
    v12 = (double)v9;
    v15 = (double)v19;
    v16 = (double)v4 * (double)v19 + (double)v9 * (double)v5;
    v17 = (double)v11;
    v21 = (double)a3[1];
    goto LABEL_21;
  }
  v12 = (double)(v6 - a3[1]);
  v13 = v11 - v7;
LABEL_12:
  v15 = (double)v13;
  v16 = (double)v6 * (double)v13 + v12 * (double)v7;
  v17 = (double)v5;
  v18 = (double)v4;
LABEL_18:
  v20 = v18 * v15;
  return (v20 + v12 * v17 - v16) * (v20 + v12 * v17 - v16) / (v15 * v15 + v12 * v12) < a4;
}

BOOL ClipperLib::PointsAreClose(uint64_t *a1, uint64_t *a2, double a3)
{
  double v3;
  double v4;

  v3 = (double)*a1 - (double)*a2;
  v4 = (double)a1[1] - (double)a2[1];
  return v4 * v4 + v3 * v3 <= a3;
}

uint64_t ClipperLib::ExcludeOp(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(v1 + 32) = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = v1;
  *(_DWORD *)v1 = 0;
  return v1;
}

uint64_t *ClipperLib::CleanPolygon(uint64_t *result, _QWORD *a2, double a3)
{
  uint64_t v4;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  unint64_t v10;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _DWORD *v24;
  int *v25;
  double v26;
  int *v27;
  int *v28;
  double v29;
  double v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;

  v4 = result[1] - *result;
  if (v4)
  {
    v6 = result;
    v7 = v4 / 24;
    v8 = 48 * (v4 / 24);
    is_mul_ok(v4 / 24, 0x30uLL);
    v9 = (_DWORD *)operator new[]();
    v10 = 0;
    __asm { FMOV            V0.2S, #-1.0 }
    do
    {
      v16 = &v9[v10 / 4];
      v16[1] = 0;
      v16[2] = 0;
      v16[3] = _D0;
      v10 += 48;
    }
    while (v8 != v10);
    if (v7 <= 1)
      v17 = 1;
    else
      v17 = v7;
    v18 = *v6;
    v19 = -v17;
    v20 = 1;
    v21 = v9;
    do
    {
      v22 = *(_QWORD *)(v18 + 16);
      *(_OWORD *)(v21 + 2) = *(_OWORD *)v18;
      if (v7 == v20)
        v23 = 0;
      else
        v23 = v20;
      v24 = &v9[12 * v23];
      *((_QWORD *)v21 + 3) = v22;
      *((_QWORD *)v21 + 4) = v24;
      *((_QWORD *)v24 + 5) = v21;
      *v21 = 0;
      v21 += 12;
      ++v20;
      v18 += 24;
    }
    while (v19 + v20 != 1);
    if (*v9)
    {
      v25 = v9;
      goto LABEL_26;
    }
    v26 = a3 * a3;
    v27 = v9;
    while (1)
    {
      v28 = (int *)*((_QWORD *)v27 + 4);
      v25 = (int *)*((_QWORD *)v27 + 5);
      if (v28 == v25)
      {
        v25 = v27;
LABEL_26:
        if (v7 >= 3)
          v33 = v7;
        else
          v33 = 0;
        std::vector<ClipperLib::IntPoint>::resize((uint64_t)a2, v33);
        if (v7 >= 3)
        {
          v34 = 0;
          do
          {
            v35 = *a2 + v34;
            v36 = *(_OWORD *)(v25 + 2);
            *(_QWORD *)(v35 + 16) = *((_QWORD *)v25 + 3);
            *(_OWORD *)v35 = v36;
            v25 = (int *)*((_QWORD *)v25 + 4);
            v34 += 24;
            --v7;
          }
          while (v7);
        }
        JUMPOUT(0x24266585CLL);
      }
      v29 = (double)*((uint64_t *)v25 + 1);
      v30 = (double)*((uint64_t *)v25 + 2);
      if (((double)*((uint64_t *)v27 + 2) - v30) * ((double)*((uint64_t *)v27 + 2) - v30)
         + ((double)*((uint64_t *)v27 + 1) - v29) * ((double)*((uint64_t *)v27 + 1) - v29) > v26)
      {
        if ((v30 - (double)*((uint64_t *)v28 + 2)) * (v30 - (double)*((uint64_t *)v28 + 2))
           + (v29 - (double)*((uint64_t *)v28 + 1)) * (v29 - (double)*((uint64_t *)v28 + 1)) <= v26)
        {
          v31 = 0;
          v32 = *((_QWORD *)v28 + 5);
          *(_QWORD *)(v32 + 32) = *((_QWORD *)v28 + 4);
          *(_QWORD *)(*((_QWORD *)v28 + 4) + 40) = v32;
          *(_DWORD *)v32 = 0;
          v25 = (int *)*((_QWORD *)v27 + 5);
          *((_QWORD *)v25 + 4) = *((_QWORD *)v27 + 4);
          *(_QWORD *)(*((_QWORD *)v27 + 4) + 40) = v25;
          *v25 = 0;
          v7 -= 2;
          goto LABEL_23;
        }
        if (!ClipperLib::SlopesNearCollinear((uint64_t *)v25 + 1, (uint64_t *)v27 + 1, (uint64_t *)v28 + 1, v26))
        {
          *v27 = 1;
          v31 = *v28;
          v25 = v28;
          goto LABEL_23;
        }
      }
      v31 = 0;
      *((_QWORD *)v25 + 4) = v28;
      *(_QWORD *)(*((_QWORD *)v27 + 4) + 40) = v25;
      *v25 = 0;
      --v7;
LABEL_23:
      v27 = v25;
      if (v31)
        goto LABEL_26;
    }
  }
  a2[1] = *a2;
  return result;
}

void std::vector<ClipperLib::IntPoint>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<ClipperLib::IntPoint>::__append((void **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 24 * a2;
  }
}

uint64_t *ClipperLib::CleanPolygon(uint64_t *a1, double a2)
{
  return ClipperLib::CleanPolygon(a1, a1, a2);
}

void ClipperLib::CleanPolygons(uint64_t *a1, uint64_t *a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a2, 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
  v6 = *a1;
  if (a1[1] != *a1)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      ClipperLib::CleanPolygon((uint64_t *)(v6 + v7), (_QWORD *)(*a2 + v7), a3);
      ++v8;
      v6 = *a1;
      v7 += 24;
    }
    while (v8 < 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
  }
}

void ClipperLib::CleanPolygons(uint64_t *a1, double a2)
{
  ClipperLib::CleanPolygons(a1, a1, a2);
}

void ClipperLib::Minkowski(uint64_t *a1, _QWORD *a2, uint64_t *a3, char a4, unsigned int a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  int64x2_t v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  __int128 v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  int64x2_t v40;
  char *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  __int128 v48;
  _QWORD *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  _OWORD *v57;
  __int128 v58;
  char *v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  __int128 v65;
  char *v66;
  char *v67;
  char *v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  char *v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  char *v76;
  char *v77;
  __int128 v78;
  char *v79;
  char *v80;
  char *v81;
  __int128 v82;
  uint64_t v83;
  __int128 v84;
  char *v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  char *v89;
  char *v90;
  __int128 v91;
  char *v92;
  char *v93;
  char *v94;
  __int128 v95;
  uint64_t v96;
  __int128 v97;
  char *v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  char *v102;
  char *v103;
  __int128 v104;
  char *v105;
  char *v106;
  char *v107;
  __int128 v108;
  char *v109;
  char *v110;
  __int128 v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unsigned int v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  int64x2_t v120;
  int64x2_t v121;
  unint64_t v122;
  void *v124;
  char *v125;
  char *v126;
  uint64_t v127;
  _QWORD *v128;
  unint64_t v129;
  void *__p[2];
  _QWORD v131[2];

  v7 = *a1;
  v6 = a1[1];
  v8 = a2[1] - *a2;
  if (v8)
    _ZF = v6 == v7;
  else
    _ZF = 1;
  if (_ZF)
  {
    std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100](a3);
  }
  else
  {
    v13 = v8 / 24;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    std::vector<std::vector<ClipperLib::IntPoint>>::reserve(&v127, v8 / 24);
    v116 = a5;
    v14 = (v6 - v7) / 24;
    if (v13 <= 1)
      v15 = 1;
    else
      v15 = v13;
    v117 = v15;
    __asm { FMOV            V8.2S, #-1.0 }
    v20 = 0;
    if ((a4 & 1) != 0)
    {
      v21 = a2;
      do
      {
        __p[0] = 0;
        __p[1] = 0;
        v131[0] = 0;
        std::vector<ClipperLib::IntPoint>::reserve(__p, v14);
        v22 = *a1;
        if (a1[1] != *a1)
        {
          v23 = 0;
          v24 = (char *)__p[1];
          do
          {
            v25 = vaddq_s64(*(int64x2_t *)(v22 + 24 * v23), *(int64x2_t *)(*v21 + 24 * v20));
            if ((unint64_t)v24 >= v131[0])
            {
              v120 = v25;
              v26 = (char *)__p[0];
              v27 = 0xAAAAAAAAAAAAAAABLL * ((v24 - (char *)__p[0]) >> 3);
              v28 = v27 + 1;
              if (v27 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
              if (0x5555555555555556 * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3) > v28)
                v28 = 0x5555555555555556 * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3) >= 0x555555555555555)
                v29 = 0xAAAAAAAAAAAAAAALL;
              else
                v29 = v28;
              if (v29)
              {
                v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)v131, v29);
                v26 = (char *)__p[0];
                v24 = (char *)__p[1];
              }
              else
              {
                v30 = 0;
              }
              v31 = &v30[24 * v27];
              *(int64x2_t *)v31 = v120;
              *((_QWORD *)v31 + 2) = _D8;
              v32 = v31;
              if (v24 == v26)
              {
                v21 = a2;
              }
              else
              {
                v21 = a2;
                do
                {
                  v33 = *(_OWORD *)(v24 - 24);
                  *((_QWORD *)v32 - 1) = *((_QWORD *)v24 - 1);
                  *(_OWORD *)(v32 - 24) = v33;
                  v32 -= 24;
                  v24 -= 24;
                }
                while (v24 != v26);
                v26 = (char *)__p[0];
              }
              v24 = v31 + 24;
              __p[0] = v32;
              __p[1] = v31 + 24;
              v131[0] = &v30[24 * v29];
              if (v26)
                operator delete(v26);
            }
            else
            {
              *(int64x2_t *)v24 = v25;
              *((_QWORD *)v24 + 2) = _D8;
              v24 += 24;
            }
            __p[1] = v24;
            ++v23;
            v22 = *a1;
          }
          while (v23 < 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
        }
        v34 = v128;
        if ((unint64_t)v128 >= v129)
        {
          v35 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(&v127, (uint64_t)__p);
        }
        else
        {
          *v128 = 0;
          v34[1] = 0;
          v34[2] = 0;
          std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v34, __p[0], (uint64_t)__p[1], 0xAAAAAAAAAAAAAAABLL * (((char *)__p[1] - (char *)__p[0]) >> 3));
          v35 = (uint64_t)(v34 + 3);
        }
        v128 = (_QWORD *)v35;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        ++v20;
      }
      while (v20 != v117);
    }
    else
    {
      v36 = a2;
      do
      {
        __p[0] = 0;
        __p[1] = 0;
        v131[0] = 0;
        std::vector<ClipperLib::IntPoint>::reserve(__p, v14);
        v37 = *a1;
        if (a1[1] != *a1)
        {
          v38 = 0;
          v39 = (char *)__p[1];
          do
          {
            v40 = vsubq_s64(*(int64x2_t *)(*v36 + 24 * v20), *(int64x2_t *)(v37 + 24 * v38));
            if ((unint64_t)v39 >= v131[0])
            {
              v121 = v40;
              v41 = (char *)__p[0];
              v42 = 0xAAAAAAAAAAAAAAABLL * ((v39 - (char *)__p[0]) >> 3);
              v43 = v42 + 1;
              if (v42 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
              if (0x5555555555555556 * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3) > v43)
                v43 = 0x5555555555555556 * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v131[0] - (unint64_t)__p[0]) >> 3) >= 0x555555555555555)
                v44 = 0xAAAAAAAAAAAAAAALL;
              else
                v44 = v43;
              if (v44)
              {
                v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)v131, v44);
                v41 = (char *)__p[0];
                v39 = (char *)__p[1];
              }
              else
              {
                v45 = 0;
              }
              v46 = &v45[24 * v42];
              *(int64x2_t *)v46 = v121;
              *((_QWORD *)v46 + 2) = _D8;
              v47 = v46;
              if (v39 == v41)
              {
                v36 = a2;
              }
              else
              {
                v36 = a2;
                do
                {
                  v48 = *(_OWORD *)(v39 - 24);
                  *((_QWORD *)v47 - 1) = *((_QWORD *)v39 - 1);
                  *(_OWORD *)(v47 - 24) = v48;
                  v47 -= 24;
                  v39 -= 24;
                }
                while (v39 != v41);
                v41 = (char *)__p[0];
              }
              v39 = v46 + 24;
              __p[0] = v47;
              __p[1] = v46 + 24;
              v131[0] = &v45[24 * v44];
              if (v41)
                operator delete(v41);
            }
            else
            {
              *(int64x2_t *)v39 = v40;
              *((_QWORD *)v39 + 2) = _D8;
              v39 += 24;
            }
            __p[1] = v39;
            ++v38;
            v37 = *a1;
          }
          while (v38 < 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3));
        }
        v49 = v128;
        if ((unint64_t)v128 >= v129)
        {
          v50 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(&v127, (uint64_t)__p);
        }
        else
        {
          *v128 = 0;
          v49[1] = 0;
          v49[2] = 0;
          std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v49, __p[0], (uint64_t)__p[1], 0xAAAAAAAAAAAAAAABLL * (((char *)__p[1] - (char *)__p[0]) >> 3));
          v50 = (uint64_t)(v49 + 3);
        }
        v128 = (_QWORD *)v50;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        ++v20;
      }
      while (v20 != v117);
    }
    std::vector<std::vector<ClipperLib::IntPoint>>::__clear[abi:ne180100](a3);
    v51 = v13 + v116;
    std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a3, v51 + v51 * v14);
    v118 = v51 - 1;
    if (v51 != 1)
    {
      v52 = 0;
      if (v14 <= 1)
        v53 = 1;
      else
        v53 = v14;
      v119 = v53;
      do
      {
        v54 = 0;
        v122 = v52;
        v55 = v52 + 1;
        do
        {
          v124 = 0;
          v125 = 0;
          v126 = 0;
          std::vector<ClipperLib::IntPoint>::reserve(&v124, 4uLL);
          v56 = *(_QWORD *)(v127 + 24 * (v122 % v13)) + 24 * (v54 % v14);
          v57 = v125;
          if (v125 >= v126)
          {
            v60 = 0xAAAAAAAAAAAAAAABLL * ((v125 - (_BYTE *)v124) >> 3);
            v61 = v60 + 1;
            if (v60 + 1 > 0xAAAAAAAAAAAAAAALL)
              goto LABEL_152;
            if (0x5555555555555556 * ((v126 - (_BYTE *)v124) >> 3) > v61)
              v61 = 0x5555555555555556 * ((v126 - (_BYTE *)v124) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((v126 - (_BYTE *)v124) >> 3) >= 0x555555555555555)
              v62 = 0xAAAAAAAAAAAAAAALL;
            else
              v62 = v61;
            if (v62)
              v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)&v126, v62);
            else
              v63 = 0;
            v64 = &v63[24 * v60];
            v65 = *(_OWORD *)v56;
            *((_QWORD *)v64 + 2) = *(_QWORD *)(v56 + 16);
            *(_OWORD *)v64 = v65;
            v67 = (char *)v124;
            v66 = v125;
            v68 = v64;
            if (v125 != v124)
            {
              do
              {
                v69 = *(_OWORD *)(v66 - 24);
                *((_QWORD *)v68 - 1) = *((_QWORD *)v66 - 1);
                *(_OWORD *)(v68 - 24) = v69;
                v68 -= 24;
                v66 -= 24;
              }
              while (v66 != v67);
              v66 = (char *)v124;
            }
            v59 = v64 + 24;
            v124 = v68;
            v125 = v64 + 24;
            v126 = &v63[24 * v62];
            if (v66)
              operator delete(v66);
          }
          else
          {
            v58 = *(_OWORD *)v56;
            *((_QWORD *)v125 + 2) = *(_QWORD *)(v56 + 16);
            *v57 = v58;
            v59 = (char *)v57 + 24;
          }
          v125 = v59;
          v70 = *(_QWORD *)(v127 + 24 * (v55 % v13)) + 24 * (v54 % v14);
          if (v59 >= v126)
          {
            v73 = 0xAAAAAAAAAAAAAAABLL * ((v59 - (_BYTE *)v124) >> 3);
            v74 = v73 + 1;
            if (v73 + 1 > 0xAAAAAAAAAAAAAAALL)
              goto LABEL_152;
            if (0x5555555555555556 * ((v126 - (_BYTE *)v124) >> 3) > v74)
              v74 = 0x5555555555555556 * ((v126 - (_BYTE *)v124) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((v126 - (_BYTE *)v124) >> 3) >= 0x555555555555555)
              v75 = 0xAAAAAAAAAAAAAAALL;
            else
              v75 = v74;
            if (v75)
              v76 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)&v126, v75);
            else
              v76 = 0;
            v77 = &v76[24 * v73];
            v78 = *(_OWORD *)v70;
            *((_QWORD *)v77 + 2) = *(_QWORD *)(v70 + 16);
            *(_OWORD *)v77 = v78;
            v80 = (char *)v124;
            v79 = v125;
            v81 = v77;
            if (v125 != v124)
            {
              do
              {
                v82 = *(_OWORD *)(v79 - 24);
                *((_QWORD *)v81 - 1) = *((_QWORD *)v79 - 1);
                *(_OWORD *)(v81 - 24) = v82;
                v81 -= 24;
                v79 -= 24;
              }
              while (v79 != v80);
              v79 = (char *)v124;
            }
            v72 = v77 + 24;
            v124 = v81;
            v125 = v77 + 24;
            v126 = &v76[24 * v75];
            if (v79)
              operator delete(v79);
          }
          else
          {
            v71 = *(_OWORD *)v70;
            *((_QWORD *)v59 + 2) = *(_QWORD *)(v70 + 16);
            *(_OWORD *)v59 = v71;
            v72 = v59 + 24;
          }
          v125 = v72;
          v83 = *(_QWORD *)(v127 + 24 * (v55 % v13)) + 24 * (++v54 % v14);
          if (v72 >= v126)
          {
            v86 = 0xAAAAAAAAAAAAAAABLL * ((v72 - (_BYTE *)v124) >> 3);
            v87 = v86 + 1;
            if (v86 + 1 > 0xAAAAAAAAAAAAAAALL)
              goto LABEL_152;
            if (0x5555555555555556 * ((v126 - (_BYTE *)v124) >> 3) > v87)
              v87 = 0x5555555555555556 * ((v126 - (_BYTE *)v124) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((v126 - (_BYTE *)v124) >> 3) >= 0x555555555555555)
              v88 = 0xAAAAAAAAAAAAAAALL;
            else
              v88 = v87;
            if (v88)
              v89 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)&v126, v88);
            else
              v89 = 0;
            v90 = &v89[24 * v86];
            v91 = *(_OWORD *)v83;
            *((_QWORD *)v90 + 2) = *(_QWORD *)(v83 + 16);
            *(_OWORD *)v90 = v91;
            v93 = (char *)v124;
            v92 = v125;
            v94 = v90;
            if (v125 != v124)
            {
              do
              {
                v95 = *(_OWORD *)(v92 - 24);
                *((_QWORD *)v94 - 1) = *((_QWORD *)v92 - 1);
                *(_OWORD *)(v94 - 24) = v95;
                v94 -= 24;
                v92 -= 24;
              }
              while (v92 != v93);
              v92 = (char *)v124;
            }
            v85 = v90 + 24;
            v124 = v94;
            v125 = v90 + 24;
            v126 = &v89[24 * v88];
            if (v92)
              operator delete(v92);
          }
          else
          {
            v84 = *(_OWORD *)v83;
            *((_QWORD *)v72 + 2) = *(_QWORD *)(v83 + 16);
            *(_OWORD *)v72 = v84;
            v85 = v72 + 24;
          }
          v125 = v85;
          v96 = *(_QWORD *)(v127 + 24 * (v122 % v13)) + 24 * (v54 % v14);
          if (v85 >= v126)
          {
            v99 = 0xAAAAAAAAAAAAAAABLL * ((v85 - (_BYTE *)v124) >> 3);
            v100 = v99 + 1;
            if (v99 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_152:
              std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * ((v126 - (_BYTE *)v124) >> 3) > v100)
              v100 = 0x5555555555555556 * ((v126 - (_BYTE *)v124) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((v126 - (_BYTE *)v124) >> 3) >= 0x555555555555555)
              v101 = 0xAAAAAAAAAAAAAAALL;
            else
              v101 = v100;
            if (v101)
              v102 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)&v126, v101);
            else
              v102 = 0;
            v103 = &v102[24 * v99];
            v104 = *(_OWORD *)v96;
            *((_QWORD *)v103 + 2) = *(_QWORD *)(v96 + 16);
            *(_OWORD *)v103 = v104;
            v106 = (char *)v124;
            v105 = v125;
            v107 = v103;
            if (v125 != v124)
            {
              do
              {
                v108 = *(_OWORD *)(v105 - 24);
                *((_QWORD *)v107 - 1) = *((_QWORD *)v105 - 1);
                *(_OWORD *)(v107 - 24) = v108;
                v107 -= 24;
                v105 -= 24;
              }
              while (v105 != v106);
              v105 = (char *)v124;
            }
            v98 = v103 + 24;
            v124 = v107;
            v125 = v103 + 24;
            v126 = &v102[24 * v101];
            if (v105)
              operator delete(v105);
          }
          else
          {
            v97 = *(_OWORD *)v96;
            *((_QWORD *)v85 + 2) = *(_QWORD *)(v96 + 16);
            *(_OWORD *)v85 = v97;
            v98 = v85 + 24;
          }
          v125 = v98;
          if (ClipperLib::Area((uint64_t *)&v124) < 0.0 && v124 != v98)
          {
            v109 = v98 - 24;
            if (v98 - 24 > v124)
            {
              v110 = (char *)v124 + 24;
              do
              {
                *(_OWORD *)__p = *(_OWORD *)(v110 - 24);
                v111 = *(_OWORD *)__p;
                v131[0] = *((_QWORD *)v110 - 1);
                v112 = v131[0];
                v113 = *((_QWORD *)v109 + 2);
                *(_OWORD *)(v110 - 24) = *(_OWORD *)v109;
                *((_QWORD *)v110 - 1) = v113;
                *((_QWORD *)v109 + 2) = v112;
                *(_OWORD *)v109 = v111;
                v109 -= 24;
                _CF = v110 >= v109;
                v110 += 24;
              }
              while (!_CF);
            }
          }
          v114 = a3[1];
          if (v114 >= a3[2])
          {
            v115 = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(a3, (uint64_t)&v124);
          }
          else
          {
            std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)a3, (uint64_t)&v124);
            v115 = v114 + 24;
          }
          a3[1] = v115;
          if (v124)
          {
            v125 = (char *)v124;
            operator delete(v124);
          }
        }
        while (v54 != v119);
        v52 = v55;
      }
      while (v55 != v118);
    }
    __p[0] = &v127;
    std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  }
}

void sub_23F0F786C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,char *__p,uint64_t a24)
{
  __p = &a20;
  std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void ClipperLib::MinkowskiSum(uint64_t *a1, _QWORD *a2, uint64_t *a3, unsigned int a4)
{
  uint64_t (**v5)(ClipperLib::Clipper *__hidden);
  void *v6[2];
  void *v7[2];
  __int128 v8;
  void *__p[2];
  uint64_t v10;
  _QWORD v11[4];
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  ClipperLib::Minkowski(a1, a2, a3, 1, a4);
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v17 = 0u;
  v18 = 0u;
  v5 = &off_250FA1278;
  *(_OWORD *)v6 = 0u;
  *(_OWORD *)v7 = 0u;
  v8 = 0u;
  *(_OWORD *)__p = 0u;
  v10 = 0;
  v11[0] = v11;
  v11[1] = v11;
  v11[2] = 0;
  v12 = 0;
  v19 = 0;
  v13 = 0;
  v14 = 0;
  v23 = 0;
  v15 = 0;
  v16 = &unk_250FA12C0;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v16, a3, 0, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v5, 1, a3, 1, 1);
  v5 = &off_250FA1278;
  v16 = &unk_250FA12C0;
  std::__list_imp<long long>::clear(v11);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v7[1])
  {
    *(void **)&v8 = v7[1];
    operator delete(v7[1]);
  }
  if (v6[0])
  {
    v6[1] = v6[0];
    operator delete(v6[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v16);
}

void sub_23F0F7A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a9);
  _Unwind_Resume(a1);
}

void ClipperLib::TranslatePath(_QWORD *a1, int64x2_t **a2, int64x2_t *a3)
{
  _OWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64x2_t *v9;
  int64x2_t v15;

  std::vector<ClipperLib::IntPoint>::resize((uint64_t)a2, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3));
  v6 = (_OWORD *)*a1;
  v7 = a1[1] - *a1;
  if (v7)
  {
    v8 = v7 / 24;
    if (v8 <= 1)
      v8 = 1;
    v9 = *a2 + 1;
    __asm { FMOV            V0.2S, #-1.0 }
    do
    {
      v15 = *(int64x2_t *)v6;
      v6 = (_OWORD *)((char *)v6 + 24);
      v9[-1] = vaddq_s64(*a3, v15);
      v9->i64[0] = _D0;
      v9 = (int64x2_t *)((char *)v9 + 24);
      --v8;
    }
    while (v8);
  }
}

void ClipperLib::MinkowskiSum(uint64_t *a1, uint64_t *a2, uint64_t *a3, unsigned int a4)
{
  uint64_t v4;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  int64x2_t v16;
  uint64_t v17;
  void *__p;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (**v24)(ClipperLib::Clipper *__hidden);
  void *v25[2];
  void *v26[2];
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _QWORD v30[4];
  char v31;
  char v32;
  char v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v39 = 0;
  v40 = 0;
  v41 = 0;
  v43 = 0;
  v44 = 0;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v48 = 0;
  v36 = 0u;
  v37 = 0u;
  v24 = &off_250FA1278;
  *(_OWORD *)v25 = 0u;
  *(_OWORD *)v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0;
  v30[0] = v30;
  v30[1] = v30;
  v30[2] = 0;
  v31 = 0;
  v38 = 0;
  v32 = 0;
  v33 = 0;
  v42 = 0;
  v34 = 0;
  v35 = &unk_250FA12C0;
  v4 = *a2;
  if (a2[1] != *a2)
  {
    v8 = 0;
    do
    {
      v21 = 0;
      v22 = 0;
      v23 = 0;
      ClipperLib::Minkowski(a1, (_QWORD *)(v4 + 24 * v8), &v21, 1, a4);
      v9 = v21;
      if (v22 != v21)
      {
        v10 = 0;
        v11 = 0;
        v12 = (char *)&v25[-1] + (_QWORD)*(v24 - 3);
        do
        {
          (*(void (**)(char *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)v12 + 16))(v12, v9 + v10, 0, 1);
          ++v11;
          v9 = v21;
          v10 += 24;
        }
        while (v11 < 0xAAAAAAAAAAAAAAABLL * ((v22 - v21) >> 3));
      }
      if (a4)
      {
        __p = 0;
        v19 = 0;
        v20 = 0;
        v13 = (_QWORD *)(*a2 + 24 * v8);
        v14 = *a1;
        v16 = *(int64x2_t *)*a1;
        v17 = *(_QWORD *)(v14 + 16);
        ClipperLib::TranslatePath(v13, (int64x2_t **)&__p, &v16);
        ClipperLib::ClipperBase::AddPath((uint64_t)&v25[-1] + (_QWORD)*(v24 - 3), (uint64_t **)&__p, 1, 1);
        if (__p)
        {
          v19 = __p;
          operator delete(__p);
        }
      }
      __p = &v21;
      std::vector<std::vector<ClipperLib::IntPoint>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      ++v8;
      v4 = *a2;
    }
    while (v8 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
  ClipperLib::Clipper::Execute((uint64_t)&v24, 1, a3, 1, 1);
  v24 = &off_250FA1278;
  v35 = &unk_250FA12C0;
  std::__list_imp<long long>::clear(v30);
  if ((_QWORD)v28)
  {
    *((_QWORD *)&v28 + 1) = v28;
    operator delete((void *)v28);
  }
  if (v26[1])
  {
    *(void **)&v27 = v26[1];
    operator delete(v26[1]);
  }
  if (v25[0])
  {
    v25[1] = v25[0];
    operator delete(v25[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v35);
}

void sub_23F0F7D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,char a21)
{
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a21);
  _Unwind_Resume(a1);
}

void ClipperLib::MinkowskiDiff(uint64_t *a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t (**v4)(ClipperLib::Clipper *__hidden);
  void *v5[2];
  void *v6[2];
  __int128 v7;
  void *__p[2];
  uint64_t v9;
  _QWORD v10[4];
  char v11;
  char v12;
  char v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  ClipperLib::Minkowski(a1, a2, a3, 0, 1u);
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v16 = 0u;
  v17 = 0u;
  v4 = &off_250FA1278;
  *(_OWORD *)v5 = 0u;
  *(_OWORD *)v6 = 0u;
  v7 = 0u;
  *(_OWORD *)__p = 0u;
  v9 = 0;
  v10[0] = v10;
  v10[1] = v10;
  v10[2] = 0;
  v11 = 0;
  v18 = 0;
  v12 = 0;
  v13 = 0;
  v22 = 0;
  v14 = 0;
  v15 = &unk_250FA12C0;
  ClipperLib::ClipperBase::AddPaths((uint64_t)&v15, a3, 0, 1);
  ClipperLib::Clipper::Execute((uint64_t)&v4, 1, a3, 1, 1);
  v4 = &off_250FA1278;
  v15 = &unk_250FA12C0;
  std::__list_imp<long long>::clear(v10);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v6[1])
  {
    *(void **)&v7 = v6[1];
    operator delete(v6[1]);
  }
  if (v5[0])
  {
    v5[1] = v5[0];
    operator delete(v5[0]);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)&v15);
}

void sub_23F0F7E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ClipperLib::Clipper::~Clipper((ClipperLib::Clipper *)&a9);
  _Unwind_Resume(a1);
}

uint64_t ClipperLib::AddPolyNodeToPaths(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((_DWORD)a2 != 1)
  {
    v5 = result;
    if ((_DWORD)a2 != 2 || !*(_BYTE *)(result + 68))
    {
      v6 = result + 8;
      if (*(_QWORD *)(result + 8) != *(_QWORD *)(result + 16))
      {
        v7 = a3[1];
        if (v7 >= a3[2])
        {
          result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(a3, v6);
        }
        else
        {
          std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)a3, v6);
          result = v7 + 24;
        }
        a3[1] = result;
      }
    }
    v8 = *(_QWORD *)(v5 + 32);
    if ((int)((unint64_t)(*(_QWORD *)(v5 + 40) - v8) >> 3) >= 1)
    {
      v9 = 0;
      do
      {
        result = ClipperLib::AddPolyNodeToPaths(*(_QWORD *)(v8 + 8 * v9++), a2, a3);
        v8 = *(_QWORD *)(v5 + 32);
      }
      while (v9 < (int)((unint64_t)(*(_QWORD *)(v5 + 40) - v8) >> 3));
    }
  }
  return result;
}

uint64_t ClipperLib::PolyTreeToPaths(uint64_t a1, uint64_t *a2)
{
  _QWORD *v4;
  uint64_t v5;

  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a2, 0);
  v4 = *(_QWORD **)(a1 + 80);
  v5 = (*(_QWORD *)(a1 + 88) - (_QWORD)v4) >> 3;
  if ((int)v5 >= 1)
    LODWORD(v5) = v5 - (**(_QWORD **)(a1 + 32) != *v4);
  std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a2, (int)v5);
  return ClipperLib::AddPolyNodeToPaths(a1, 0, a2);
}

uint64_t ClipperLib::ClosedPathsFromPolyTree(uint64_t a1, uint64_t *a2)
{
  _QWORD *v4;
  uint64_t v5;

  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a2, 0);
  v4 = *(_QWORD **)(a1 + 80);
  v5 = (*(_QWORD *)(a1 + 88) - (_QWORD)v4) >> 3;
  if ((int)v5 >= 1)
    LODWORD(v5) = v5 - (**(_QWORD **)(a1 + 32) != *v4);
  std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a2, (int)v5);
  return ClipperLib::AddPolyNodeToPaths(a1, 2, a2);
}

uint64_t ClipperLib::OpenPathsFromPolyTree(uint64_t a1, uint64_t *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  std::vector<std::vector<ClipperLib::IntPoint>>::resize(a2, 0);
  v4 = *(_QWORD **)(a1 + 80);
  v5 = (*(_QWORD *)(a1 + 88) - (_QWORD)v4) >> 3;
  if ((int)v5 >= 1)
    LODWORD(v5) = v5 - (**(_QWORD **)(a1 + 32) != *v4);
  result = std::vector<std::vector<ClipperLib::IntPoint>>::reserve(a2, (int)v5);
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if ((int)((unint64_t)(v7 - v8) >> 3) >= 1)
  {
    v9 = 0;
    do
    {
      v10 = *(_QWORD *)(v8 + 8 * v9);
      if (*(_BYTE *)(v10 + 68))
      {
        v11 = v10 + 8;
        v12 = a2[1];
        if (v12 >= a2[2])
        {
          result = std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(a2, v11);
        }
        else
        {
          std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>((uint64_t)a2, v11);
          result = v12 + 24;
        }
        a2[1] = result;
        v8 = *(_QWORD *)(a1 + 32);
        v7 = *(_QWORD *)(a1 + 40);
      }
      ++v9;
    }
    while (v9 < (int)((unint64_t)(v7 - v8) >> 3));
  }
  return result;
}

_QWORD *ClipperLib::operator<<(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"(", 1);
  v2 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)",", 1);
  v3 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)")", 1);
  return a1;
}

_QWORD *ClipperLib::operator<<(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;

  v3 = a2[1];
  if (*a2 != v3)
  {
    v4 = (v3 - *a2) >> 3;
    if (0xAAAAAAAAAAAAAAABLL * v4 != 1)
    {
      v5 = 0;
      v6 = 0xAAAAAAAAAAAAAAABLL * v4 - 1;
      do
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"(", 1);
        v7 = (_QWORD *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)",", 1);
        v8 = (_QWORD *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"), ", 3);
        v5 += 24;
        --v6;
      }
      while (v6);
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"(", 1);
    v9 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)",", 1);
    v10 = (_QWORD *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)")\n", 2);
  }
  return a1;
}

_QWORD *ClipperLib::operator<<(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;

  v3 = *a2;
  if (a2[1] != *a2)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      ClipperLib::operator<<(a1, (_QWORD *)(v3 + v5));
      ++v6;
      v3 = *a2;
      v5 += 24;
    }
    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3));
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"\n", 1);
  return a1;
}

void `virtual thunk to'ClipperLib::Clipper::~Clipper(ClipperLib::Clipper *this)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24));
  *v1 = &off_250FA1278;
  v1[18] = &unk_250FA12C0;
  std::__list_imp<long long>::clear(v1 + 11);
  v2 = (void *)v1[7];
  if (v2)
  {
    v1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)v1[4];
  if (v3)
  {
    v1[5] = v3;
    operator delete(v3);
  }
  v4 = (void *)v1[1];
  if (v4)
  {
    v1[2] = v4;
    operator delete(v4);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)(v1 + 18));
}

{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 24));
  *v1 = &off_250FA1278;
  v1[18] = &unk_250FA12C0;
  std::__list_imp<long long>::clear(v1 + 11);
  v2 = (void *)v1[7];
  if (v2)
  {
    v1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)v1[4];
  if (v3)
  {
    v1[5] = v3;
    operator delete(v3);
  }
  v4 = (void *)v1[1];
  if (v4)
  {
    v1[2] = v4;
    operator delete(v4);
  }
  ClipperLib::ClipperBase::~ClipperBase((ClipperLib::ClipperBase *)(v1 + 18));
  JUMPOUT(0x242665874);
}

void std::vector<ClipperLib::PolyNode *>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 3);
    if (v9 >> 61)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 3;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 2 > v9)
      v9 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::TEdge *>>(v4, v12);
    else
      v13 = 0;
    v14 = &v13[8 * v10];
    v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    v16 = &v14[8 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        v19 = *((_QWORD *)v17 - 1);
        v17 -= 8;
        *((_QWORD *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

ClipperLib::clipperException *ClipperLib::clipperException::clipperException(ClipperLib::clipperException *this, char *a2)
{
  *(_QWORD *)this = &unk_250FA1340;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)this + 1, a2);
  return this;
}

void sub_23F0F8604(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void ClipperLib::clipperException::~clipperException(std::exception *this)
{
  ClipperLib::clipperException::~clipperException(this);
  JUMPOUT(0x242665874);
}

{
  this->__vftable = (std::exception_vtbl *)&unk_250FA1340;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
}

uint64_t ClipperLib::clipperException::what(ClipperLib::clipperException *this)
{
  uint64_t result;

  result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0)
    return *(_QWORD *)result;
  return result;
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__introsort<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,false>(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, char a5)
{
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  __int128 *v18;
  uint64_t *v19;
  __int128 v20;
  uint64_t *v21;
  char v22;
  BOOL v23;
  char *v24;
  uint64_t v25;
  __int128 v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;

LABEL_1:
  v9 = (char *)a1;
LABEL_2:
  v10 = 1 - a4;
  while (2)
  {
    a1 = (uint64_t)v9;
    v11 = v10;
    v12 = a2 - v9;
    v13 = 0xAAAAAAAAAAAAAAABLL * ((a2 - v9) >> 3);
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v25 = *((_QWORD *)a2 - 3);
        v24 = a2 - 24;
        if (*(_QWORD *)v9 < v25)
        {
          v36 = *((_QWORD *)v9 + 2);
          v33 = *(_OWORD *)v9;
          v26 = *(_OWORD *)v24;
          *((_QWORD *)v9 + 2) = *((_QWORD *)v24 + 2);
          *(_OWORD *)v9 = v26;
          *(_OWORD *)v24 = v33;
          *((_QWORD *)v24 + 2) = v36;
        }
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__int128 *)v9, (uint64_t *)v9 + 3, (uint64_t *)a2 - 3);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)v9, (uint64_t *)v9 + 3, (uint64_t *)v9 + 6, (uint64_t)(a2 - 24));
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__n128 *)v9, (uint64_t *)v9 + 3, (uint64_t *)v9 + 6, (__n128 *)(v9 + 72), (__n128 *)(a2 - 24));
        return;
      default:
        if (v12 > 575)
        {
          if (v11 == 1)
          {
            if (v9 != a2)
              std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,ClipperLib::LocalMinimum *>(v9, a2, a2, a3);
            return;
          }
          v14 = v13 >> 1;
          v15 = (uint64_t *)&v9[24 * (v13 >> 1)];
          if ((unint64_t)v12 < 0xC01)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__int128 *)&v9[24 * v14], (uint64_t *)v9, (uint64_t *)a2 - 3);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__int128 *)v9, (uint64_t *)&v9[24 * v14], (uint64_t *)a2 - 3);
            v16 = 3 * v14;
            v17 = (uint64_t *)&v9[24 * v14 - 24];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__int128 *)(v9 + 24), v17, (uint64_t *)a2 - 6);
            v18 = (__int128 *)(v9 + 48);
            v19 = (uint64_t *)&v9[8 * v16 + 24];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(v18, v19, (uint64_t *)a2 - 9);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__int128 *)v17, v15, v19);
            v35 = *(_QWORD *)(a1 + 16);
            v32 = *(_OWORD *)a1;
            v20 = *(_OWORD *)v15;
            *(_QWORD *)(a1 + 16) = v15[2];
            *(_OWORD *)a1 = v20;
            v15[2] = v35;
            *(_OWORD *)v15 = v32;
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          if (*(_QWORD *)a1 >= *(_QWORD *)(a1 - 24))
          {
            v9 = (char *)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocalMinimum *,ClipperLib::LocMinSorter &>((_QWORD *)a1, (unint64_t)a2);
            goto LABEL_16;
          }
LABEL_11:
          v21 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocalMinimum *,ClipperLib::LocMinSorter &>((uint64_t *)a1, (unint64_t)a2);
          if ((v22 & 1) == 0)
            goto LABEL_14;
          v23 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(a1, (uint64_t)v21);
          v9 = (char *)(v21 + 3);
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)(v21 + 3), (uint64_t)a2))
          {
            v10 = v11 + 1;
            if (v23)
              continue;
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,false>(a1, v21, a3, -v11, a5 & 1);
            v9 = (char *)(v21 + 3);
LABEL_16:
            a5 = 0;
            a4 = -v11;
            goto LABEL_2;
          }
          a4 = -v11;
          a2 = (char *)v21;
          if (v23)
            return;
          goto LABEL_1;
        }
        if ((a5 & 1) != 0)
        {
          std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)v9, (uint64_t)a2);
        }
        else if (v9 != a2)
        {
          v27 = v9 + 24;
          while (v27 != a2)
          {
            v28 = (uint64_t)v27;
            v29 = *(_QWORD *)(a1 + 24);
            if (*(_QWORD *)a1 < v29)
            {
              v34 = *(_OWORD *)(a1 + 32);
              v30 = v28;
              do
              {
                *(_OWORD *)v30 = *(_OWORD *)(v30 - 24);
                *(_QWORD *)(v30 + 16) = *(_QWORD *)(v30 - 8);
                v31 = *(_QWORD *)(v30 - 48);
                v30 -= 24;
              }
              while (v31 < v29);
              *(_QWORD *)v30 = v29;
              *(_OWORD *)(v30 + 8) = v34;
            }
            v27 = (char *)(v28 + 24);
            a1 = v28;
          }
        }
        return;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  if (result != a2)
  {
    v2 = result + 24;
    if (result + 24 != a2)
    {
      v3 = 0;
      v4 = result;
      do
      {
        v5 = v2;
        v6 = *(_QWORD *)(v4 + 24);
        if (*(_QWORD *)v4 < v6)
        {
          v10 = *(_OWORD *)(v4 + 32);
          v7 = v3;
          while (1)
          {
            v8 = result + v7;
            *(_OWORD *)(v8 + 24) = *(_OWORD *)(result + v7);
            *(_QWORD *)(v8 + 40) = *(_QWORD *)(result + v7 + 16);
            if (!v7)
              break;
            v7 -= 24;
            if (*(_QWORD *)(v8 - 24) >= v6)
            {
              v9 = result + v7 + 24;
              goto LABEL_10;
            }
          }
          v9 = result;
LABEL_10:
          *(_QWORD *)v9 = v6;
          *(_OWORD *)(v9 + 8) = v10;
        }
        v2 = v5 + 24;
        v3 += 24;
        v4 = v5;
      }
      while (v5 + 24 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(__int128 *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v3 = *a2;
  v4 = *a3;
  if (*(_QWORD *)a1 < *a2)
  {
    if (v3 < v4)
    {
      v5 = *((_QWORD *)a1 + 2);
      v6 = *a1;
      v7 = a3[2];
      *a1 = *(_OWORD *)a3;
      *((_QWORD *)a1 + 2) = v7;
      *(_OWORD *)a3 = v6;
      a3[2] = v5;
      return 1;
    }
    v14 = *((_QWORD *)a1 + 2);
    v15 = *a1;
    v16 = a2[2];
    *a1 = *(_OWORD *)a2;
    *((_QWORD *)a1 + 2) = v16;
    *(_OWORD *)a2 = v15;
    a2[2] = v14;
    if (*a2 >= *a3)
      return 1;
    v17 = a2[2];
    v18 = *(_OWORD *)a2;
    v19 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v19;
    *(_OWORD *)a3 = v18;
    a3[2] = v17;
    return 2;
  }
  if (v3 < v4)
  {
    v8 = a2[2];
    v9 = *(_OWORD *)a2;
    v10 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v10;
    *(_OWORD *)a3 = v9;
    a3[2] = v8;
    if (*(_QWORD *)a1 >= *a2)
      return 1;
    v11 = *((_QWORD *)a1 + 2);
    v12 = *a1;
    v13 = a2[2];
    *a1 = *(_OWORD *)a2;
    *((_QWORD *)a1 + 2) = v13;
    *(_OWORD *)a2 = v12;
    a2[2] = v11;
    return 2;
  }
  return 0;
}

_QWORD *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocalMinimum *,ClipperLib::LocMinSorter &>(_QWORD *a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v2 = *a1;
  if (*(_QWORD *)(a2 - 24) >= *a1)
  {
    v5 = a1 + 3;
    do
    {
      v3 = v5;
      if ((unint64_t)v5 >= a2)
        break;
      v5 += 3;
    }
    while (*v3 >= v2);
  }
  else
  {
    v3 = a1;
    do
    {
      v4 = v3[3];
      v3 += 3;
    }
    while (v4 >= v2);
  }
  if ((unint64_t)v3 < a2)
  {
    do
    {
      v6 = *(_QWORD *)(a2 - 24);
      a2 -= 24;
    }
    while (v6 < v2);
  }
  while ((unint64_t)v3 < a2)
  {
    v14 = v3[2];
    v13 = *(_OWORD *)v3;
    v7 = *(_OWORD *)a2;
    v3[2] = *(_QWORD *)(a2 + 16);
    *(_OWORD *)v3 = v7;
    *(_QWORD *)(a2 + 16) = v14;
    *(_OWORD *)a2 = v13;
    do
    {
      v8 = v3[3];
      v3 += 3;
    }
    while (v8 >= v2);
    do
    {
      v9 = *(_QWORD *)(a2 - 24);
      a2 -= 24;
    }
    while (v9 < v2);
  }
  if (v3 - 3 != a1)
  {
    v10 = *(_OWORD *)(v3 - 3);
    a1[2] = *(v3 - 1);
    *(_OWORD *)a1 = v10;
  }
  *(v3 - 3) = v2;
  *((_OWORD *)v3 - 1) = v12;
  return v3;
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocalMinimum *,ClipperLib::LocMinSorter &>(uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v17;

  v2 = 0;
  v3 = *a1;
  do
  {
    v4 = a1[v2 + 3];
    v2 += 3;
  }
  while (v3 < v4);
  v5 = &a1[v2];
  if (v2 == 3)
  {
    do
    {
      if ((unint64_t)v5 >= a2)
        break;
      v7 = *(_QWORD *)(a2 - 24);
      a2 -= 24;
    }
    while (v3 >= v7);
  }
  else
  {
    do
    {
      v6 = *(_QWORD *)(a2 - 24);
      a2 -= 24;
    }
    while (v3 >= v6);
  }
  v8 = &a1[v2];
  if ((unint64_t)v5 < a2)
  {
    v9 = a2;
    do
    {
      v10 = *(_OWORD *)v8;
      v11 = v8[2];
      v12 = *(_QWORD *)(v9 + 16);
      *(_OWORD *)v8 = *(_OWORD *)v9;
      v8[2] = v12;
      *(_QWORD *)(v9 + 16) = v11;
      *(_OWORD *)v9 = v10;
      do
      {
        v13 = v8[3];
        v8 += 3;
      }
      while (v3 < v13);
      do
      {
        v14 = *(_QWORD *)(v9 - 24);
        v9 -= 24;
      }
      while (v3 >= v14);
    }
    while ((unint64_t)v8 < v9);
  }
  if (v8 - 3 != a1)
  {
    v15 = *(_OWORD *)(v8 - 3);
    a1[2] = *(v8 - 1);
    *(_OWORD *)a1 = v15;
  }
  *(v8 - 3) = v3;
  *((_OWORD *)v8 - 1) = v17;
  return v8 - 3;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  __int128 *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v4 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = (__int128 *)(a2 - 24);
      if (*(_QWORD *)a1 < *(_QWORD *)(a2 - 24))
      {
        v7 = *(_QWORD *)(a1 + 16);
        v8 = *(_OWORD *)a1;
        v9 = *(_QWORD *)(a2 - 8);
        *(_OWORD *)a1 = *v6;
        *(_QWORD *)(a1 + 16) = v9;
        *v6 = v8;
        *(_QWORD *)(a2 - 8) = v7;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__int128 *)a1, (uint64_t *)(a1 + 24), (uint64_t *)(a2 - 24));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(a1, (uint64_t *)(a1 + 24), (uint64_t *)(a1 + 48), a2 - 24);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__n128 *)a1, (uint64_t *)(a1 + 24), (uint64_t *)(a1 + 48), (__n128 *)(a1 + 72), (__n128 *)(a2 - 24));
      return 1;
    default:
      v10 = (_QWORD *)(a1 + 48);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__int128 *)a1, (uint64_t *)(a1 + 24), (uint64_t *)(a1 + 48));
      v11 = a1 + 72;
      if (a1 + 72 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = *(_QWORD *)v11;
    if (*v10 < *(_QWORD *)v11)
    {
      v18 = *(_OWORD *)(v11 + 8);
      v15 = v12;
      while (1)
      {
        v16 = a1 + v15;
        *(_OWORD *)(v16 + 72) = *(_OWORD *)(a1 + v15 + 48);
        *(_QWORD *)(v16 + 88) = *(_QWORD *)(a1 + v15 + 64);
        if (v15 == -48)
          break;
        v15 -= 24;
        if (*(_QWORD *)(v16 + 24) >= v14)
        {
          v17 = a1 + v15 + 72;
          goto LABEL_12;
        }
      }
      v17 = a1;
LABEL_12:
      *(_QWORD *)v17 = v14;
      *(_OWORD *)(v17 + 8) = v18;
      if (++v13 == 8)
        return v11 + 24 == a2;
    }
    v10 = (_QWORD *)v11;
    v12 += 24;
    v11 += 24;
    if (v11 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  __n128 result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((__int128 *)a1, a2, a3);
  if (*a3 < *(_QWORD *)a4)
  {
    v9 = a3[2];
    result = *(__n128 *)a3;
    v10 = *(_QWORD *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    a3[2] = v10;
    *(__n128 *)a4 = result;
    *(_QWORD *)(a4 + 16) = v9;
    if (*a2 < *a3)
    {
      v11 = a2[2];
      result = *(__n128 *)a2;
      v12 = a3[2];
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v12;
      *(__n128 *)a3 = result;
      a3[2] = v11;
      if (*(_QWORD *)a1 < *a2)
      {
        v13 = *(_QWORD *)(a1 + 16);
        result = *(__n128 *)a1;
        v14 = a2[2];
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_QWORD *)(a1 + 16) = v14;
        *(__n128 *)a2 = result;
        a2[2] = v13;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(__n128 *a1, uint64_t *a2, uint64_t *a3, __n128 *a4, __n128 *a5)
{
  __n128 result;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)a1, a2, a3, (uint64_t)a4).n128_u64[0];
  if ((int64_t)a4->n128_u64[0] < (int64_t)a5->n128_u64[0])
  {
    v11 = a4[1].n128_u64[0];
    result = *a4;
    v12 = a5[1].n128_u64[0];
    *a4 = *a5;
    a4[1].n128_u64[0] = v12;
    *a5 = result;
    a5[1].n128_u64[0] = v11;
    if (*a3 < (int64_t)a4->n128_u64[0])
    {
      v13 = a3[2];
      result = *(__n128 *)a3;
      v14 = a4[1].n128_i64[0];
      *(__n128 *)a3 = *a4;
      a3[2] = v14;
      *a4 = result;
      a4[1].n128_u64[0] = v13;
      if (*a2 < *a3)
      {
        v15 = a2[2];
        result = *(__n128 *)a2;
        v16 = a3[2];
        *(_OWORD *)a2 = *(_OWORD *)a3;
        a2[2] = v16;
        *(__n128 *)a3 = result;
        a3[2] = v15;
        if ((int64_t)a1->n128_u64[0] < *a2)
        {
          v17 = a1[1].n128_i64[0];
          result = *a1;
          v18 = a2[2];
          *a1 = *(__n128 *)a2;
          a1[1].n128_u64[0] = v18;
          *(__n128 *)a2 = result;
          a2[2] = v17;
        }
      }
    }
  }
  return result;
}

char *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *,ClipperLib::LocalMinimum *>(char *a1, char *a2, char *a3, uint64_t a4)
{
  char *v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v28;
  uint64_t v29;

  if (a1 != a2)
  {
    v6 = a2;
    v8 = a2 - a1;
    v9 = (a2 - a1) / 24;
    if (a2 - a1 >= 25)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[24 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)a1, a4, v9, v12);
        v12 -= 24;
        --v11;
      }
      while (v11);
    }
    v13 = v6;
    if (v6 != a3)
    {
      v14 = v6;
      do
      {
        if (*(_QWORD *)a1 < *(_QWORD *)v14)
        {
          v15 = *((_QWORD *)v14 + 2);
          v16 = *(_OWORD *)v14;
          v17 = *((_QWORD *)a1 + 2);
          *(_OWORD *)v14 = *(_OWORD *)a1;
          *((_QWORD *)v14 + 2) = v17;
          *(_OWORD *)a1 = v16;
          *((_QWORD *)a1 + 2) = v15;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)a1, a4, v9, a1);
        }
        v14 += 24;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 25)
    {
      v18 = v8 / 0x18uLL;
      do
      {
        v19 = 0;
        v28 = *(_OWORD *)a1;
        v29 = *((_QWORD *)a1 + 2);
        v20 = a1;
        do
        {
          v21 = &v20[24 * v19 + 24];
          v22 = (2 * v19) | 1;
          v23 = 2 * v19 + 2;
          if (v23 < v18 && *((_QWORD *)v21 + 3) < *(_QWORD *)v21)
          {
            v21 += 24;
            v22 = v23;
          }
          v24 = *(_OWORD *)v21;
          *((_QWORD *)v20 + 2) = *((_QWORD *)v21 + 2);
          *(_OWORD *)v20 = v24;
          v20 = v21;
          v19 = v22;
        }
        while (v22 <= (uint64_t)((unint64_t)(v18 - 2) >> 1));
        v6 -= 24;
        if (v21 == v6)
        {
          *((_QWORD *)v21 + 2) = v29;
          *(_OWORD *)v21 = v28;
        }
        else
        {
          v25 = *(_OWORD *)v6;
          *((_QWORD *)v21 + 2) = *((_QWORD *)v6 + 2);
          *(_OWORD *)v21 = v25;
          *(_OWORD *)v6 = v28;
          *((_QWORD *)v6 + 2) = v29;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>((uint64_t)a1, (uint64_t)(v21 + 24), a4, 0xAAAAAAAAAAAAAAABLL * ((v21 + 24 - a1) >> 3));
        }
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  _QWORD *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  __n128 result;
  __n128 v18;

  if (a3 >= 2)
  {
    v4 = (unint64_t)(a3 - 2) >> 1;
    if (v4 >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 3)))
    {
      v5 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3)) | 1;
      v6 = (_QWORD *)(a1 + 24 * v5);
      if (0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2 >= a3)
      {
        v7 = *v6;
      }
      else
      {
        v7 = v6[3];
        v9 = __OFSUB__(v7, *v6);
        v8 = v7 - *v6 < 0;
        if (v7 >= *v6)
          v7 = *v6;
        if (v8 != v9)
        {
          v6 += 3;
          v5 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 3) + 2;
        }
      }
      v10 = *a4;
      if (*a4 >= v7)
      {
        v18 = *(__n128 *)(a4 + 1);
        do
        {
          v11 = a4;
          a4 = v6;
          v12 = *(_OWORD *)v6;
          v11[2] = v6[2];
          *(_OWORD *)v11 = v12;
          if (v4 < v5)
            break;
          v13 = (2 * v5) | 1;
          v6 = (_QWORD *)(a1 + 24 * v13);
          v5 = 2 * v5 + 2;
          if (v5 >= a3)
          {
            v14 = *v6;
            v5 = v13;
          }
          else
          {
            v14 = v6[3];
            v16 = __OFSUB__(v14, *v6);
            v15 = v14 - *v6 < 0;
            if (v14 >= *v6)
              v14 = *v6;
            if (v15 != v16)
              v6 += 3;
            else
              v5 = v13;
          }
        }
        while (v10 >= v14);
        *a4 = v10;
        result = v18;
        *(__n128 *)(a4 + 1) = v18;
      }
    }
  }
  return result;
}

__n128 std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::LocMinSorter &,ClipperLib::LocalMinimum *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  __int128 *v5;
  __int128 *v6;
  uint64_t v7;
  __int128 *v8;
  __int128 v9;
  __n128 result;
  __n128 v11;

  if (a4 >= 2)
  {
    v4 = (unint64_t)(a4 - 2) >> 1;
    v5 = (__int128 *)(a1 + 24 * v4);
    v6 = (__int128 *)(a2 - 24);
    v7 = *(_QWORD *)(a2 - 24);
    if (v7 < *(_QWORD *)v5)
    {
      v11 = *(__n128 *)(a2 - 16);
      do
      {
        v8 = v6;
        v6 = v5;
        v9 = *v5;
        *((_QWORD *)v8 + 2) = *((_QWORD *)v5 + 2);
        *v8 = v9;
        if (!v4)
          break;
        v4 = (v4 - 1) >> 1;
        v5 = (__int128 *)(a1 + 24 * v4);
      }
      while (v7 < *(_QWORD *)v5);
      *(_QWORD *)v6 = v7;
      result = v11;
      *(__int128 *)((char *)v6 + 8) = (__int128)v11;
    }
  }
  return result;
}

void std::vector<std::vector<ClipperLib::IntPoint>>::__append(uint64_t *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  size_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
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
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    v19 = v4;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(v4, v11);
    else
      v12 = 0;
    v15 = v12;
    v16 = &v12[24 * v8];
    v18 = &v12[24 * v11];
    v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    v17 = &v16[v14];
    std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(a1, &v15);
    std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)&v15);
  }
}

void sub_23F0F9740(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<ClipperLib::IntPoint>>,std::reverse_iterator<std::vector<ClipperLib::IntPoint>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::vector<ClipperLib::IntPoint>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,false>(uint64_t result, uint64_t *a2, uint64_t (**a3)(uint64_t, uint64_t), uint64_t a4, char a5)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  char v18;
  BOOL v19;
  uint64_t v20;

  v8 = (uint64_t *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = a2 - v9;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        result = (*a3)(*(a2 - 1), *v9);
        if ((_DWORD)result)
        {
          v20 = *v9;
          *v9 = *(a2 - 1);
          *(a2 - 1) = v20;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v9, v9 + 1, a2 - 1, (unsigned int (**)(_QWORD))a3);
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v9, v9 + 1, v9 + 2, a2 - 1, (unsigned int (**)(_QWORD))a3);
      case 5uLL:
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1, (unsigned int (**)(_QWORD))a3);
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
            return std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)v9, a2, a3);
          else
            return std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)v9, a2, a3);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(&v9[v13 >> 1], v9, a2 - 1, (unsigned int (**)(_QWORD))a3);
            if ((a5 & 1) != 0)
              goto LABEL_12;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v9, &v9[v13 >> 1], a2 - 1, (unsigned int (**)(_QWORD))a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v9 + 1, v15 - 1, a2 - 2, (unsigned int (**)(_QWORD))a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v9 + 2, &v9[v14 + 1], a2 - 3, (unsigned int (**)(_QWORD))a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v15 - 1, v15, &v9[v14 + 1], (unsigned int (**)(_QWORD))a3);
            v16 = *v9;
            *v9 = *v15;
            *v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_12;
          }
          if (((*a3)(*(v9 - 1), *v9) & 1) == 0)
          {
            result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::IntersectNode **,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *)>(v9, a2, a3);
            v9 = (uint64_t *)result;
            goto LABEL_17;
          }
LABEL_12:
          v17 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::IntersectNode **,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *)>(v9, a2, a3);
          if ((v18 & 1) == 0)
            goto LABEL_15;
          v19 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v9, v17, (unsigned int (**)(_QWORD))a3);
          v9 = v17 + 1;
          result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(v17 + 1, a2, (unsigned int (**)(_QWORD))a3);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v19)
              continue;
LABEL_15:
            result = std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,false>(v8, v17, a3, -v11, a5 & 1);
            v9 = v17 + 1;
LABEL_17:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v17;
          if (v19)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,ClipperLib::IntersectNode **>((char *)v9, (char *)a2, a2, a3);
        return result;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(uint64_t result, uint64_t *a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  _QWORD *v4;
  uint64_t *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  if ((uint64_t *)result != a2)
  {
    v4 = (_QWORD *)result;
    v5 = (uint64_t *)(result + 8);
    if ((uint64_t *)(result + 8) != a2)
    {
      v7 = 0;
      v8 = (uint64_t *)result;
      do
      {
        v10 = *v8;
        v9 = v8[1];
        v8 = v5;
        result = (*a3)(v9, v10);
        if ((_DWORD)result)
        {
          v11 = *v8;
          v12 = v7;
          while (1)
          {
            *(_QWORD *)((char *)v4 + v12 + 8) = *(_QWORD *)((char *)v4 + v12);
            if (!v12)
              break;
            result = (*a3)(v11, *(_QWORD *)((char *)v4 + v12 - 8));
            v12 -= 8;
            if ((result & 1) == 0)
            {
              v13 = (_QWORD *)((char *)v4 + v12 + 8);
              goto LABEL_10;
            }
          }
          v13 = v4;
LABEL_10:
          *v13 = v11;
        }
        v5 = v8 + 1;
        v7 += 8;
      }
      while (v8 + 1 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(uint64_t result, _QWORD *a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  _QWORD *v4;
  _QWORD *i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  if ((_QWORD *)result != a2)
  {
    v4 = (_QWORD *)result;
    for (i = (_QWORD *)(result + 8); v4 + 1 != a2; i = v4 + 1)
    {
      v8 = *v4;
      v7 = v4[1];
      v4 = i;
      result = (*a3)(v7, v8);
      if ((_DWORD)result)
      {
        v9 = *v4;
        v10 = v4;
        do
        {
          v11 = v10;
          v12 = *--v10;
          *v11 = v12;
          result = (*a3)(v9, *(v11 - 2));
        }
        while ((result & 1) != 0);
        *v10 = v9;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(_QWORD *a1, _QWORD *a2, _QWORD *a3, unsigned int (**a4)(_QWORD))
{
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = ((uint64_t (*)(_QWORD, _QWORD))*a4)(*a2, *a1);
  result = ((uint64_t (*)(_QWORD, _QWORD))*a4)(*a3, *a2);
  if ((v8 & 1) == 0)
  {
    if (!(_DWORD)result)
      return result;
    v11 = *a2;
    *a2 = *a3;
    *a3 = v11;
    if (!((unsigned int (*)(_QWORD, _QWORD))*a4)(*a2, *a1))
      return 1;
    v12 = *a1;
    *a1 = *a2;
    *a2 = v12;
    return 2;
  }
  v10 = *a1;
  if (!(_DWORD)result)
  {
    *a1 = *a2;
    *a2 = v10;
    if (!(*a4)(*a3))
      return 1;
    v13 = *a2;
    *a2 = *a3;
    *a3 = v13;
    return 2;
  }
  *a1 = *a3;
  *a3 = v10;
  return 1;
}

uint64_t *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::IntersectNode **,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *)>(uint64_t *a1, uint64_t *a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2;
  v6 = *a1;
  if (((*a3)(*a1, *(a2 - 1)) & 1) != 0)
  {
    v7 = a1;
    do
    {
      v8 = v7[1];
      ++v7;
    }
    while (((*a3)(v6, v8) & 1) == 0);
  }
  else
  {
    v9 = a1 + 1;
    do
    {
      v7 = v9;
      if (v9 >= v4)
        break;
      ++v9;
    }
    while (!(*a3)(v6, *v7));
  }
  if (v7 < v4)
  {
    do
      v10 = *--v4;
    while (((*a3)(v6, v10) & 1) != 0);
  }
  while (v7 < v4)
  {
    v11 = *v7;
    *v7 = *v4;
    *v4 = v11;
    do
    {
      v12 = v7[1];
      ++v7;
    }
    while (!(*a3)(v6, v12));
    do
      v13 = *--v4;
    while (((*a3)(v6, v13) & 1) != 0);
  }
  if (v7 - 1 != a1)
    *a1 = *(v7 - 1);
  *(v7 - 1) = v6;
  return v7;
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ClipperLib::IntersectNode **,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *)>(uint64_t *a1, uint64_t *a2, uint64_t (**a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = 0;
  v7 = *a1;
  do
    v8 = (*a3)(a1[++v6], v7);
  while ((v8 & 1) != 0);
  v9 = &a1[v6];
  v10 = &a1[v6 - 1];
  if (v6 == 1)
  {
    do
    {
      if (v9 >= a2)
        break;
      v12 = *--a2;
    }
    while (((*a3)(v12, v7) & 1) == 0);
  }
  else
  {
    do
      v11 = *--a2;
    while (!(*a3)(v11, v7));
  }
  if (v9 < a2)
  {
    v13 = &a1[v6];
    v14 = a2;
    do
    {
      v15 = *v13;
      *v13 = *v14;
      *v14 = v15;
      do
      {
        v16 = v13[1];
        ++v13;
      }
      while (((*a3)(v16, v7) & 1) != 0);
      do
        v17 = *--v14;
      while (!(*a3)(v17, v7));
    }
    while (v13 < v14);
    v10 = v13 - 1;
  }
  if (v10 != a1)
    *a1 = *v10;
  *v10 = v7;
  return v10;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(_QWORD *a1, _QWORD *a2, unsigned int (**a3)(_QWORD))
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;

  v6 = a2 - a1;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (((unsigned int (*)(_QWORD, _QWORD))*a3)(*(a2 - 1), *a1))
      {
        v8 = *a1;
        *a1 = *(a2 - 1);
        *(a2 - 1) = v8;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      v9 = a1 + 2;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a1 + 1, a1 + 2, a3);
      v10 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v11 = 0;
      v12 = 0;
      break;
  }
  while (1)
  {
    if (((unsigned int (*)(_QWORD, _QWORD))*a3)(*v10, *v9))
    {
      v13 = *v10;
      v14 = v11;
      while (1)
      {
        v15 = (char *)a1 + v14;
        *(_QWORD *)((char *)a1 + v14 + 24) = *(_QWORD *)((char *)a1 + v14 + 16);
        if (v14 == -16)
          break;
        v14 -= 8;
        if ((((uint64_t (*)(uint64_t, _QWORD))*a3)(v13, *((_QWORD *)v15 + 1)) & 1) == 0)
        {
          v16 = (_QWORD *)((char *)a1 + v14 + 24);
          goto LABEL_12;
        }
      }
      v16 = a1;
LABEL_12:
      *v16 = v13;
      if (++v12 == 8)
        return v10 + 1 == a2;
    }
    v9 = v10;
    v11 += 8;
    if (++v10 == a2)
      return 1;
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, unsigned int (**a5)(_QWORD))
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a2, a3, a5);
  result = ((uint64_t (*)(_QWORD, _QWORD))*a5)(*a4, *a3);
  if ((_DWORD)result)
  {
    v11 = *a3;
    *a3 = *a4;
    *a4 = v11;
    result = ((uint64_t (*)(_QWORD, _QWORD))*a5)(*a3, *a2);
    if ((_DWORD)result)
    {
      v12 = *a2;
      *a2 = *a3;
      *a3 = v12;
      result = ((uint64_t (*)(_QWORD, _QWORD))*a5)(*a2, *a1);
      if ((_DWORD)result)
      {
        v13 = *a1;
        *a1 = *a2;
        *a2 = v13;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, unsigned int (**a6)(_QWORD))
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, a2, a3, a4, a6);
  result = ((uint64_t (*)(_QWORD, _QWORD))*a6)(*a5, *a4);
  if ((_DWORD)result)
  {
    v13 = *a4;
    *a4 = *a5;
    *a5 = v13;
    result = ((uint64_t (*)(_QWORD, _QWORD))*a6)(*a4, *a3);
    if ((_DWORD)result)
    {
      v14 = *a3;
      *a3 = *a4;
      *a4 = v14;
      result = ((uint64_t (*)(_QWORD, _QWORD))*a6)(*a3, *a2);
      if ((_DWORD)result)
      {
        v15 = *a2;
        *a2 = *a3;
        *a3 = v15;
        result = ((uint64_t (*)(_QWORD, _QWORD))*a6)(*a2, *a1);
        if ((_DWORD)result)
        {
          v16 = *a1;
          *a1 = *a2;
          *a2 = v16;
        }
      }
    }
  }
  return result;
}

uint64_t *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **,ClipperLib::IntersectNode **>(char *a1, char *a2, uint64_t *a3, uint64_t (**a4)(uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;

  if (a1 != a2)
  {
    v8 = a2 - a1;
    v9 = (a2 - a1) >> 3;
    if (a2 - a1 >= 9)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[8 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)a1, (unsigned int (**)(_QWORD, _QWORD))a4, v9, v12);
        v12 -= 8;
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != (char *)a3)
    {
      v14 = (uint64_t *)a2;
      do
      {
        if ((*a4)(*v14, *(_QWORD *)a1))
        {
          v15 = *v14;
          *v14 = *(_QWORD *)a1;
          *(_QWORD *)a1 = v15;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)a1, (unsigned int (**)(_QWORD, _QWORD))a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      v13 = (char *)a3;
    }
    if (v8 >= 9)
    {
      v16 = (unint64_t)v8 >> 3;
      v17 = a2 - 8;
      do
      {
        v18 = *(_QWORD *)a1;
        v19 = (char *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(a1, (unsigned int (**)(_QWORD, _QWORD))a4, v16);
        if (v17 == v19)
        {
          *(_QWORD *)v19 = v18;
        }
        else
        {
          *(_QWORD *)v19 = *(_QWORD *)v17;
          *(_QWORD *)v17 = v18;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>((uint64_t)a1, (uint64_t)(v19 + 8), a4, (v19 + 8 - a1) >> 3);
        }
        v17 -= 8;
      }
      while (v16-- > 2);
    }
    return (uint64_t *)v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(uint64_t result, unsigned int (**a2)(_QWORD, _QWORD), uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;

  v4 = a3 - 2;
  if (a3 >= 2)
  {
    v5 = a4;
    v6 = result;
    v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 3)
    {
      v10 = ((uint64_t)a4 - result) >> 2;
      v11 = v10 + 1;
      v12 = (_QWORD *)(result + 8 * (v10 + 1));
      v13 = v10 + 2;
      if (v10 + 2 < a3 && (*a2)(*v12, v12[1]))
      {
        ++v12;
        v11 = v13;
      }
      result = ((uint64_t (*)(_QWORD, _QWORD))*a2)(*v12, *v5);
      if ((result & 1) == 0)
      {
        v14 = *v5;
        do
        {
          v15 = v12;
          *v5 = *v12;
          if (v7 < v11)
            break;
          v16 = (2 * v11) | 1;
          v12 = (_QWORD *)(v6 + 8 * v16);
          if (2 * v11 + 2 < a3)
          {
            if ((*a2)(*v12, v12[1]))
            {
              ++v12;
              v16 = 2 * v11 + 2;
            }
          }
          result = ((uint64_t (*)(_QWORD, uint64_t))*a2)(*v12, v14);
          v5 = v15;
          v11 = v16;
        }
        while (!(_DWORD)result);
        *v15 = v14;
      }
    }
  }
  return result;
}

_QWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(_QWORD *a1, unsigned int (**a2)(_QWORD, _QWORD), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = 0;
  v7 = a3 - 2;
  if (a3 < 2)
    v7 = a3 - 1;
  v8 = v7 >> 1;
  do
  {
    v9 = &a1[v6 + 1];
    v10 = (2 * v6) | 1;
    v11 = 2 * v6 + 2;
    if (v11 < a3 && (*a2)(a1[v6 + 1], a1[v6 + 2]))
    {
      ++v9;
      v10 = v11;
    }
    *a1 = *v9;
    a1 = v9;
    v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(ClipperLib::IntersectNode *,ClipperLib::IntersectNode *),ClipperLib::IntersectNode **>(uint64_t result, uint64_t a2, uint64_t (**a3)(uint64_t, uint64_t), uint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v6 = result;
    v7 = v4 >> 1;
    v8 = (uint64_t *)(result + 8 * (v4 >> 1));
    v9 = (uint64_t *)(a2 - 8);
    result = (*a3)(*v8, *(_QWORD *)(a2 - 8));
    if ((_DWORD)result)
    {
      v10 = *v9;
      do
      {
        v11 = v8;
        *v9 = *v8;
        if (!v7)
          break;
        v7 = (v7 - 1) >> 1;
        v8 = (uint64_t *)(v6 + 8 * v7);
        result = (*a3)(*v8, v10);
        v9 = v11;
      }
      while ((result & 1) != 0);
      *v11 = v10;
    }
  }
  return result;
}

_QWORD *std::vector<std::vector<ClipperLib::IntPoint>>::__construct_one_at_end[abi:ne180100]<std::vector<ClipperLib::IntPoint> const&>(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *result;

  v3 = *(_QWORD **)(a1 + 8);
  *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  result = std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v3, *(const void **)a2, *(_QWORD *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3));
  *(_QWORD *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_23F0FA84C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<ClipperLib::IntPoint>>::__push_back_slow_path<std::vector<ClipperLib::IntPoint> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v15 = v11;
  v16 = &v10[24 * v9];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  std::vector<ClipperLib::IntPoint>::__init_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(v11, *(const void **)a2, *(_QWORD *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3));
  v15 += 24;
  std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(a1, v14);
  v12 = a1[1];
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_23F0FA960(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<ClipperLib::IntPoint>::vector(_QWORD *a1, unint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](a1, a2);
    v4 = (_QWORD *)a1[1];
    v5 = &v4[3 * a2];
    __asm { FMOV            V0.2S, #-1.0 }
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = _D0;
      v4 += 3;
    }
    while (v4 != v5);
    a1[1] = v5;
  }
  return a1;
}

void sub_23F0FA9D4(_Unwind_Exception *exception_object)
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

__n128 *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *,std::vector<ClipperLib::IntPoint> *,0>(__n128 *a1, __n128 *a2, uint64_t a3)
{
  __n128 *v4;

  v4 = a1;
  if (a1 != a2)
  {
    do
    {
      std::vector<ClipperLib::IntPoint>::__move_assign(a3, v4);
      v4 = (__n128 *)((char *)v4 + 24);
      a3 += 24;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

__n128 std::vector<ClipperLib::IntPoint>::__move_assign(uint64_t a1, __n128 *a2)
{
  void *v4;
  __n128 result;

  v4 = *(void **)a1;
  if (v4)
  {
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v4);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  result = *a2;
  *(__n128 *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

char *std::vector<ClipperLib::IntPoint>::__assign_with_size[abi:ne180100]<ClipperLib::IntPoint*,ClipperLib::IntPoint*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void **v13;
  char *v14;
  _BYTE *v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(_QWORD *)result) >> 3) < a4)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v11;
    result = std::vector<std::vector<ClipperLib::IntPoint>>::__vallocate[abi:ne180100](v7, v12);
    v14 = (char *)v7[1];
    v13 = (void **)(v7 + 1);
    v9 = v14;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v13 = (void **)(result + 8);
  v15 = (_BYTE *)*((_QWORD *)result + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 3) >= a4)
    goto LABEL_16;
  v16 = &__src[8 * ((v15 - v9) >> 3)];
  if (v15 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v15 - v9);
    v9 = (char *)*v13;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v13 = &v9[v17];
  return result;
}

void std::vector<ClipperLib::IntPoint>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  _QWORD *v13;
  char *v19;
  char *v20;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  __int128 v26;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (_BYTE *)v7) >> 3) >= a2)
  {
    if (a2)
    {
      v13 = &v7[3 * a2];
      __asm { FMOV            V0.2S, #-1.0 }
      do
      {
        *v7 = 0;
        v7[1] = 0;
        v7[2] = _D0;
        v7 += 3;
      }
      while (v7 != v13);
      v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (_BYTE *)*a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (_BYTE *)*a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>(v4, v11);
    else
      v12 = 0;
    v19 = &v12[24 * v8];
    v20 = &v19[24 * a2];
    __asm { FMOV            V0.2S, #-1.0 }
    v22 = v19;
    do
    {
      *(_QWORD *)v22 = 0;
      *((_QWORD *)v22 + 1) = 0;
      *((_QWORD *)v22 + 2) = _D0;
      v22 += 24;
    }
    while (v22 != v20);
    v23 = &v12[24 * v11];
    v25 = (char *)*a1;
    v24 = (char *)a1[1];
    if (v24 != *a1)
    {
      do
      {
        v26 = *(_OWORD *)(v24 - 24);
        *((_QWORD *)v19 - 1) = *((_QWORD *)v24 - 1);
        *(_OWORD *)(v19 - 24) = v26;
        v19 -= 24;
        v24 -= 24;
      }
      while (v24 != v25);
      v24 = (char *)*a1;
    }
    *a1 = v19;
    a1[1] = v20;
    a1[2] = v23;
    if (v24)
      operator delete(v24);
  }
}

uint64_t std::list<long long>::__move_assign(uint64_t *a1, _QWORD *a2)
{
  std::__list_imp<long long>::clear(a1);
  return std::list<long long>::splice((uint64_t)a1, a1, a2);
}

uint64_t *std::list<long long>::__sort<std::__less<void,void>>(uint64_t *result, uint64_t *a2, unint64_t a3, uint64_t a4)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *i;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *j;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  if (a3 >= 2)
  {
    if (a3 == 2)
    {
      v5 = (uint64_t *)*a2;
      if (*(_QWORD *)(*a2 + 16) < result[2])
      {
        v6 = *v5;
        *(_QWORD *)(v6 + 8) = v5[1];
        *(_QWORD *)v5[1] = v6;
        v7 = *result;
        *(_QWORD *)(v7 + 8) = v5;
        *v5 = v7;
        *result = (uint64_t)v5;
        v5[1] = (uint64_t)result;
        return v5;
      }
    }
    else
    {
      v10 = a3 >> 1;
      v11 = (a3 >> 1) + 1;
      v12 = result;
      do
      {
        v12 = (uint64_t *)v12[1];
        --v11;
      }
      while (v11 > 1);
      v13 = (uint64_t *)std::list<long long>::__sort<std::__less<void,void>>(result, v12, a3 >> 1, a4);
      result = (uint64_t *)std::list<long long>::__sort<std::__less<void,void>>(v12, a2, a3 - v10, a4);
      v14 = v13[2];
      if (result[2] >= v14)
      {
        v16 = (uint64_t *)v13[1];
        i = result;
        result = v13;
      }
      else
      {
        for (i = (uint64_t *)result[1]; i != a2; i = (uint64_t *)i[1])
        {
          if (i[2] >= v14)
            goto LABEL_14;
        }
        i = a2;
LABEL_14:
        v17 = *i;
        v18 = *result;
        *(_QWORD *)(v18 + 8) = *(_QWORD *)(*i + 8);
        **(_QWORD **)(v17 + 8) = v18;
        v19 = *v13;
        v16 = (uint64_t *)v13[1];
        *(_QWORD *)(v19 + 8) = result;
        *result = v19;
        *v13 = v17;
        *(_QWORD *)(v17 + 8) = v13;
      }
      if (v16 != i && i != a2)
      {
        v20 = i;
        do
        {
          v21 = v16[2];
          if (i[2] >= v21)
          {
            v16 = (uint64_t *)v16[1];
          }
          else
          {
            for (j = (uint64_t *)i[1]; j != a2; j = (uint64_t *)j[1])
            {
              if (j[2] >= v21)
                goto LABEL_25;
            }
            j = a2;
LABEL_25:
            v23 = *j;
            v24 = *i;
            *(_QWORD *)(v24 + 8) = *(_QWORD *)(*j + 8);
            **(_QWORD **)(v23 + 8) = v24;
            if (v20 == i)
              v20 = j;
            v26 = *v16;
            v25 = (uint64_t *)v16[1];
            *(_QWORD *)(v26 + 8) = i;
            *i = v26;
            *v16 = v23;
            *(_QWORD *)(v23 + 8) = v16;
            v16 = v25;
            i = j;
          }
        }
        while (v16 != v20 && i != a2);
      }
    }
  }
  return result;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x2426657FC](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x242665808](v13);
  return a1;
}

void sub_23F0FB044(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x242665808](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x23F0FB024);
}

void sub_23F0FB08C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_23F0FB1C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

uint64_t ITKDeviceRGBColorSpace()
{
  if (ITKDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1)
    dispatch_once(&ITKDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
  return ITKDeviceRGBColorSpace_sDeviceRGBColorSpace;
}

uint64_t ITKDeviceCMYKColorSpace()
{
  if (ITKDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce != -1)
    dispatch_once(&ITKDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce, &__block_literal_global_1);
  return ITKDeviceCMYKColorSpace_sDeviceCMYKColorSpace;
}

uint64_t ITKDeviceGrayColorSpace()
{
  if (ITKDeviceGrayColorSpace_sDeviceGrayDispatchOnce != -1)
    dispatch_once(&ITKDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_2);
  return ITKDeviceGrayColorSpace_sDeviceGrayColorSpace;
}

CGColorRef ITKCGColorCreateDeviceRGB(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  if (ITKDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1)
    dispatch_once(&ITKDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
  return CGColorCreate((CGColorSpaceRef)ITKDeviceRGBColorSpace_sDeviceRGBColorSpace, components);
}

CGColorRef ITKCGColorCreateDeviceGray(CGFloat a1, CGFloat a2)
{
  CGFloat components[3];

  components[2] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  components[0] = a1;
  components[1] = a2;
  if (ITKDeviceGrayColorSpace_sDeviceGrayDispatchOnce != -1)
    dispatch_once(&ITKDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_2);
  return CGColorCreate((CGColorSpaceRef)ITKDeviceGrayColorSpace_sDeviceGrayColorSpace, components);
}

CGPatternRef ITKCGPatternCreateWithImageAndTransform(CGImageRef image, __int128 *a2)
{
  CGFloat v4;
  CGFloat v5;
  size_t Width;
  size_t Height;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGAffineTransform v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGRect v16;

  if (!image)
    objc_msgSend(MEMORY[0x24BE51EB8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "image != ((void *)0)", "CGPatternRef ITKCGPatternCreateWithImageAndTransform(CGImageRef, const CGAffineTransform *)", 0, 0, CFSTR("can't create an image pattern without an image"));
  CGImageRetain(image);
  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  Width = CGImageGetWidth(image);
  Height = CGImageGetHeight(image);
  if (a2)
  {
    v8 = a2[1];
    v13 = *a2;
    v14 = v8;
    v9 = a2[2];
  }
  else
  {
    v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v13 = *MEMORY[0x24BDBD8B8];
    v14 = v10;
    v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  }
  v15 = v9;
  v16.size.height = (double)Height;
  v16.size.width = (double)Width;
  *(_OWORD *)&v12.a = v13;
  *(_OWORD *)&v12.c = v14;
  *(_OWORD *)&v12.tx = v9;
  v16.origin.x = v4;
  v16.origin.y = v5;
  return CGPatternCreate(image, v16, &v12, (double)Width, v16.size.height, kCGPatternTilingConstantSpacing, 1, &ITKCGPatternCreateWithImageAndTransform_sCallbacks);
}

void ITKDrawImageAtOriginInContext(CGImage *a1, CGContext *a2)
{
  CGFloat v4;
  CGFloat v5;
  CGFloat Width;
  CGRect v7;

  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  Width = (double)CGImageGetWidth(a1);
  v7.size.height = (double)CGImageGetHeight(a1);
  v7.origin.x = v4;
  v7.origin.y = v5;
  v7.size.width = Width;
  CGContextDrawImage(a2, v7, a1);
}

CGPatternRef ITKCGPatternCreateWithImage(CGImage *a1)
{
  return ITKCGPatternCreateWithImageAndTransform(a1, 0);
}

CGColorRef ITKCGColorCreatePatternWithImageAndTransform(CGImage *a1, __int128 *a2)
{
  CGPattern *v2;
  CGColorSpace *Pattern;
  CGColorRef v4;
  CGFloat v6[2];

  v6[1] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  v2 = ITKCGPatternCreateWithImageAndTransform(a1, a2);
  Pattern = CGColorSpaceCreatePattern(0);
  v6[0] = 1.0;
  v4 = CGColorCreateWithPattern(Pattern, v2, v6);
  CGColorSpaceRelease(Pattern);
  CGPatternRelease(v2);
  return v4;
}

CGColorRef ITKCGColorCreatePatternWithImage(CGImage *a1)
{
  return ITKCGColorCreatePatternWithImageAndTransform(a1, 0);
}

uint64_t ITKHSBFromCGColorRef(CGColorRef color, double *a2, double *a3, double *a4, CGFloat *a5)
{
  CGColorSpace *ColorSpace;
  const CGFloat *Components;

  *a5 = 0.0;
  *a4 = 0.0;
  *a3 = 0.0;
  *a2 = 0.0;
  if (!color)
    objc_msgSend(MEMORY[0x24BE51EB8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "color", "BOOL ITKHSBFromCGColorRef(CGColorRef, CGFloat *, CGFloat *, CGFloat *, CGFloat *)", 0, 0, CFSTR("NULL color"));
  ColorSpace = CGColorGetColorSpace(color);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB || CGColorGetNumberOfComponents(color) != 4)
    return 0;
  *a5 = CGColorGetAlpha(color);
  Components = CGColorGetComponents(color);
  ITKRGBToHSB(a2, a3, a4, *Components, Components[1], Components[2]);
  return 1;
}

double ITKRGBToHSB(double *a1, double *a2, double *a3, double a4, double a5, double a6)
{
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double result;
  BOOL v18;
  double v19;

  if (a4 < a5 || a4 < a6)
  {
    if (a5 >= a4)
      v7 = a4;
    else
      v7 = a5;
    if (a4 >= a6)
      v8 = a6;
    else
      v8 = a4;
    v9 = a5 < a4 || a5 < a6;
    if (v9)
      v10 = a6;
    else
      v10 = a5;
    if (v9)
      v11 = v7;
    else
      v11 = v8;
  }
  else
  {
    if (a5 >= a6)
      v11 = a6;
    else
      v11 = a5;
    v10 = a4;
  }
  v12 = 0.0;
  if (v10 <= 0.0)
  {
    v14 = 0.0;
  }
  else
  {
    v13 = v10 - v11;
    v14 = (v10 - v11) / v10;
    if (v14 != 0.0)
    {
      v15 = (v10 - a5) / v13;
      v16 = (v10 - a6) / v13;
      if (v10 == a4)
      {
        if (v11 == a5)
          v12 = v16 + 5.0;
        else
          v12 = 1.0 - v15;
      }
      else
      {
        v18 = v10 == a5;
        v19 = (v10 - a4) / v13;
        if (v18)
        {
          if (v11 == a6)
            v12 = v19 + 1.0;
          else
            v12 = 3.0 - v16;
        }
        else if (v11 == a4)
        {
          v12 = v15 + 3.0;
        }
        else
        {
          v12 = 5.0 - v19;
        }
      }
    }
  }
  *a3 = v10;
  result = v12 / 6.0;
  *a1 = v12 / 6.0;
  *a2 = v14;
  return result;
}

double *ITKHSBToRGB(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6;
  BOOL v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v6 = a4 * 6.0;
  v7 = a4 == 1.0;
  v8 = 0.0;
  if (!v7)
    v8 = v6;
  v9 = (uint64_t)v8;
  v10 = v8 - (double)(uint64_t)v8;
  v11 = (1.0 - a5) * a6;
  v12 = (1.0 - a5 * v10) * a6;
  v13 = (1.0 - a5 * (1.0 - v10)) * a6;
  v14 = a6;
  v15 = v13;
  switch(v9)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v14 = v12;
      v15 = a6;
      goto LABEL_10;
    case 2:
      v14 = v11;
      v15 = a6;
      v11 = v13;
      goto LABEL_10;
    case 3:
      v14 = v11;
      v15 = v12;
      goto LABEL_8;
    case 4:
      v14 = v13;
      v15 = v11;
LABEL_8:
      v11 = a6;
      goto LABEL_10;
    case 5:
      v14 = a6;
      v15 = v11;
      v11 = v12;
LABEL_10:
      *result = v14;
      *a2 = v15;
      *a3 = v11;
      break;
    default:
      return result;
  }
  return result;
}

double ITKCMYKToRGB(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7)
{
  double result;

  *a1 = 1.0 - fmin(a7 + a4 * (1.0 - a7), 1.0);
  *a2 = 1.0 - fmin(a7 + a5 * (1.0 - a7), 1.0);
  result = 1.0 - fmin(a7 + a6 * (1.0 - a7), 1.0);
  *a3 = result;
  return result;
}

BOOL ITKColorIsBlack(CGColor *a1)
{
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  const CGFloat *Components;
  double v5;

  ColorSpace = CGColorGetColorSpace(a1);
  Model = CGColorSpaceGetModel(ColorSpace);
  Components = CGColorGetComponents(a1);
  v5 = 0.0;
  if (Model)
  {
    if (Model == kCGColorSpaceModelCMYK)
    {
      Components += 3;
      v5 = 1.0;
    }
    else
    {
      if (Model != kCGColorSpaceModelRGB || *Components != 0.0 || Components[1] != 0.0)
        return 0;
      Components += 2;
    }
  }
  return *Components == v5;
}

CGFloat ITKColorLightness(CGColor *a1)
{
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  const CGFloat *v4;
  double v5;
  const CGFloat *Components;
  double v8;
  double v9;
  double v10;
  double v11;

  ColorSpace = CGColorGetColorSpace(a1);
  Model = CGColorSpaceGetModel(ColorSpace);
  switch(Model)
  {
    case kCGColorSpaceModelMonochrome:
      return *CGColorGetComponents(a1);
    case kCGColorSpaceModelCMYK:
      Components = CGColorGetComponents(a1);
      v8 = Components[3];
      v9 = 1.0 - fmin(v8 + *Components * (1.0 - v8), 1.0);
      v10 = 1.0 - fmin(v8 + Components[1] * (1.0 - v8), 1.0);
      v11 = 1.0 - fmin(v8 + Components[2] * (1.0 - v8), 1.0);
      v5 = fmax(fmax(v9, v10), v11) + fmin(fmin(v9, v10), v11);
      return v5 * 0.5;
    case kCGColorSpaceModelRGB:
      v4 = CGColorGetComponents(a1);
      v5 = fmax(fmax(*v4, v4[1]), v4[2]) + fmin(fmin(*v4, v4[1]), v4[2]);
      return v5 * 0.5;
  }
  NSLog(CFSTR("WARNING: Testing lightness of unsupported color model"));
  return 0.0;
}

CGContext *ITKCreateRGBABitmapContext(int a1, double a2, CGFloat a3, CGFloat a4)
{
  CGContext *v8;
  CGAffineTransform v10;
  CGAffineTransform transform;

  if (ITKDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1)
    dispatch_once(&ITKDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_3);
  v8 = CGBitmapContextCreate(0, (unint64_t)(a2 * a4), (unint64_t)(a3 * a4), 8uLL, (4 * (unint64_t)(a2 * a4) + 31) & 0xFFFFFFFFFFFFFFE0, (CGColorSpaceRef)ITKDeviceRGBColorSpace_sDeviceRGBColorSpace, 0x2002u);
  CGAffineTransformMakeScale(&transform, a4, a4);
  CGContextConcatCTM(v8, &transform);
  if (a1)
  {
    CGContextTranslateCTM(v8, 0.0, a3);
    CGAffineTransformMakeScale(&v10, 1.0, -1.0);
    CGContextConcatCTM(v8, &v10);
  }
  return v8;
}

unint64_t ITKBitmapGetAlignedBytesPerRow(uint64_t a1)
{
  return (a1 + 31) & 0xFFFFFFFFFFFFFFE0;
}

CGColorRef ITKCreateCheckerBoardColor(CGColor *a1, CGColor *a2, CGFloat a3, CGFloat a4)
{
  double v8;
  double v9;
  CGContext *v10;
  CGContext *v11;
  CGImage *Image;
  CGColorRef PatternWithImageAndTransform;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v8 = a3 + a3;
  v9 = a4 + a4;
  v10 = ITKCreateRGBABitmapContext(0, a3 + a3, a4 + a4, 1.0);
  if (!v10)
    return 0;
  v11 = v10;
  CGContextSetFillColorWithColor(v10, a1);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = v8;
  v15.size.height = v9;
  CGContextFillRect(v11, v15);
  CGContextSetFillColorWithColor(v11, a2);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = a3;
  v16.size.height = a4;
  CGContextFillRect(v11, v16);
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a3;
  v17.size.height = a4;
  CGContextFillRect(v11, v17);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  if (!Image)
    return 0;
  PatternWithImageAndTransform = ITKCGColorCreatePatternWithImageAndTransform(Image, 0);
  CGImageRelease(Image);
  return PatternWithImageAndTransform;
}

uint64_t ITKVNBaselineAngles(void *a1, const char *a2)
{
  return objc_msgSend(a1, "itk_map:", &__block_literal_global_4);
}

double ITKVNGlobalBaselineAngleFromAngles(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  double v4;
  double v5;

  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "sortedArrayUsingSelector:", sel_compare_);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v2, "count") >> 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v5 = v4;

  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

id ITKVNRectClosestToPoint(void *a1, double a2, double a3)
{
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __ITKVNRectClosestToPoint_block_invoke;
  v6[3] = &__block_descriptor_48_e59_q24__0__VNRectangleObservation_8__VNRectangleObservation_16l;
  *(double *)&v6[4] = a2;
  *(double *)&v6[5] = a3;
  objc_msgSend(a1, "sortedArrayUsingComparator:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t itk_orientationByRotatingLeft(unint64_t a1)
{
  if (a1 > 7)
    return 0;
  else
    return qword_23F100258[a1];
}

uint64_t itk_orientationByRotatingRight(unint64_t a1)
{
  if (a1 > 7)
    return 0;
  else
    return qword_23F100298[a1];
}

void itk_orientationApplyToRectAtPoint(CGAffineTransform *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGAffineTransform v14;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGRect v19;

  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -a6, -a7);
  _transformFromImageOrientation(a1, 0, (uint64_t)&t2);
  t1 = v18;
  CGAffineTransformConcat(&v17, &t1, &t2);
  v18 = v17;
  CGAffineTransformMakeTranslation(&v14, a6, a7);
  t1 = v18;
  CGAffineTransformConcat(&v17, &t1, &v14);
  v18 = v17;
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  CGRectApplyAffineTransform(v19, &v17);
}

CGAffineTransform *itk_transformToImageOrientation@<X0>(CGAffineTransform *a1@<X0>, uint64_t a2@<X8>)
{
  return _transformFromImageOrientation(a1, 0, a2);
}

uint64_t itk_clockwiseRotationsFromUpToMatchOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return 0;
  else
    return qword_23F1002D8[a1 - 1];
}

uint64_t itk_counterClockwiseRotationsFromUpToMatchOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return 0;
  else
    return qword_23F100310[a1 - 1];
}

CGAffineTransform *_transformFromImageOrientation@<X0>(CGAffineTransform *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform t2;
  CGAffineTransform v16;

  v4 = MEMORY[0x24BDBD8B8];
  v5 = *MEMORY[0x24BDBD8B8];
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)a3 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)(a3 + 16) = v6;
  v7 = *(_OWORD *)(v4 + 32);
  *(_OWORD *)(a3 + 32) = v7;
  v9 = 0.0;
  v10 = 3.14159265;
  switch((unint64_t)result)
  {
    case 1uLL:
      goto LABEL_8;
    case 2uLL:
      v10 = -1.57079633;
      goto LABEL_8;
    case 3uLL:
      v10 = 1.57079633;
      goto LABEL_8;
    case 4uLL:
      goto LABEL_7;
    case 5uLL:
      v9 = 3.14159265;
      goto LABEL_7;
    case 6uLL:
      v9 = -1.57079633;
      goto LABEL_7;
    case 7uLL:
      v9 = 1.57079633;
LABEL_7:
      *(_OWORD *)&v16.a = v5;
      *(_OWORD *)&v16.c = v6;
      *(_OWORD *)&v16.tx = v7;
      result = CGAffineTransformScale((CGAffineTransform *)a3, &v16, -1.0, 1.0);
      v10 = v9;
      if (v9 != 0.0)
      {
LABEL_8:
        v11 = -v10;
        if (!a2)
          v11 = v10;
        CGAffineTransformMakeRotation(&t2, v11);
        v12 = *(_OWORD *)(a3 + 16);
        *(_OWORD *)&v14.a = *(_OWORD *)a3;
        *(_OWORD *)&v14.c = v12;
        *(_OWORD *)&v14.tx = *(_OWORD *)(a3 + 32);
        result = CGAffineTransformConcat(&v16, &v14, &t2);
        v13 = *(_OWORD *)&v16.c;
        *(_OWORD *)a3 = *(_OWORD *)&v16.a;
        *(_OWORD *)(a3 + 16) = v13;
        *(_OWORD *)(a3 + 32) = *(_OWORD *)&v16.tx;
      }
      break;
    default:
      return result;
  }
  return result;
}

CGAffineTransform *itk_transformFromImageOrientation@<X0>(CGAffineTransform *a1@<X0>, uint64_t a2@<X8>)
{
  return _transformFromImageOrientation(a1, 1, a2);
}

uint64_t itk_cgImagePropertyOrientationFromITKOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return 1;
  else
    return dword_23F100348[a1 - 1];
}

uint64_t itk_imageOrientationFromTransform(__int128 *a1)
{
  __int128 v1;
  __int128 v2;
  uint64_t v3;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v11 = 0x2020000000;
  v5[1] = 3221225472;
  v1 = a1[1];
  v6 = *a1;
  v9 = 0;
  v10 = &v9;
  v12 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[2] = __itk_imageOrientationFromTransform_block_invoke;
  v5[3] = &unk_250FA1458;
  v2 = a1[2];
  v7 = v1;
  v8 = v2;
  v5[4] = &v9;
  objc_msgSend(&unk_250FA36D8, "enumerateObjectsUsingBlock:", v5);
  v3 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v3;
}

void sub_23F0FC5D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

CGAffineTransform *__itk_imageOrientationFromTransform_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  CGAffineTransform *v6;
  CGAffineTransform *result;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v6 = (CGAffineTransform *)objc_msgSend(a2, "integerValue");
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  result = _transformFromImageOrientation(v6, 0, (uint64_t)&v8);
  if (vabdd_f64(*(double *)(a1 + 40), *(double *)&v8) < 0.00999999978
    && vabdd_f64(*(double *)(a1 + 48), *((double *)&v8 + 1)) < 0.00999999978
    && vabdd_f64(*(double *)(a1 + 56), *(double *)&v9) < 0.00999999978
    && vabdd_f64(*(double *)(a1 + 64), *((double *)&v9 + 1)) < 0.00999999978)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
    *a4 = 1;
  }
  return result;
}

unint64_t itk_swapLeftAndRightImageOrientation(unint64_t result)
{
  if (result <= 7)
    return qword_23F100368[result];
  return result;
}

uint64_t itk_orientationFromCGImagePropertyOrientation(int a1)
{
  if ((a1 - 2) > 6)
    return 0;
  else
    return qword_23F1003A8[a1 - 2];
}

uint64_t *ITKClipperPathsFromCGPath(const CGPath *a1, double a2)
{
  uint64_t *v3;
  _BYTE v5[24];
  void **v6;

  CGPathRandomAccess::CGPathRandomAccess((CGPathRandomAccess *)v5, a1);
  v3 = CGPathRandomAccess::clipperPaths((CGPathRandomAccess *)v5, a2);
  v6 = (void **)v5;
  std::vector<CGPathRandomAccessSubpath>::__destroy_vector::operator()[abi:ne180100](&v6);
  return v3;
}

void sub_23F0FC744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::vector<CGPathRandomAccessSubpath>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t *CGPathRandomAccess::clipperPaths(CGPathRandomAccess *this, double a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  char **v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  _QWORD v19[5];

  v4 = (uint64_t *)operator new();
  v4[1] = 0;
  v4[2] = 0;
  *v4 = 0;
  v5 = *((_QWORD *)this + 1) - *(_QWORD *)this;
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = v5 / 0x30uLL;
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = v7;
    do
    {
      v10 = (_QWORD *)v4[1];
      v9 = v4[2];
      if ((unint64_t)v10 >= v9)
      {
        v12 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v10 - *v4) >> 3);
        v13 = v12 + 1;
        if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
        v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - *v4) >> 3);
        if (2 * v14 > v13)
          v13 = 2 * v14;
        if (v14 >= 0x555555555555555)
          v15 = 0xAAAAAAAAAAAAAAALL;
        else
          v15 = v13;
        v19[4] = v4 + 2;
        if (v15)
          v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)(v4 + 2), v15);
        else
          v16 = 0;
        v17 = &v16[24 * v12];
        v19[0] = v16;
        v19[1] = v17;
        v19[3] = &v16[24 * v15];
        *(_QWORD *)v17 = 0;
        *((_QWORD *)v17 + 1) = 0;
        *((_QWORD *)v17 + 2) = 0;
        v19[2] = v17 + 24;
        std::vector<std::vector<ClipperLib::IntPoint>>::__swap_out_circular_buffer(v4, v19);
        v11 = (char **)v4[1];
        std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)v19);
      }
      else
      {
        *v10 = 0;
        v10[1] = 0;
        v10[2] = 0;
        v11 = (char **)(v10 + 3);
        v4[1] = (uint64_t)(v10 + 3);
      }
      v4[1] = (uint64_t)v11;
      CGPathRandomAccessSubpath::clipperPath((uint64_t *)(*(_QWORD *)this + v6), v11 - 3, a2);
      v6 += 48;
      --v8;
    }
    while (v8);
  }
  return v4;
}

void sub_23F0FC8F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<ClipperLib::IntPoint>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void CGPathRandomAccess::CGPathRandomAccess(CGPathRandomAccess *this, const CGPath *a2)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  CGPathRandomAccess::addPath(this, a2);
}

void sub_23F0FC938(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<CGPathRandomAccessSubpath>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

unint64_t CGPathRandomAccess::addPath(CGPathRandomAccess *this, CGPathRef path)
{
  uint64_t v4;
  unint64_t v5;
  _QWORD v7[8];
  _QWORD v8[6];
  __int128 v9;
  _QWORD block[5];
  _QWORD v11[6];
  void *v12;
  void *v13;
  uint64_t v14;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4812000000;
  v11[3] = __Block_byref_object_copy__1;
  v11[4] = __Block_byref_object_dispose__1;
  v11[5] = &unk_23F102635;
  v12 = 0;
  v4 = MEMORY[0x24BDAC760];
  v13 = 0;
  v14 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZN18CGPathRandomAccess7addPathEPK6CGPath_block_invoke;
  block[3] = &unk_250FA0EC0;
  block[4] = v11;
  CGPathApplyWithBlock(path, block);
  v5 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 4);
  v8[0] = 0;
  v8[1] = v8;
  v8[3] = __Block_byref_object_copy__1;
  v8[4] = __Block_byref_object_dispose__2;
  v8[2] = 0x4012000000;
  v8[5] = &unk_23F102635;
  v9 = *MEMORY[0x24BDBEFB0];
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = ___ZN18CGPathRandomAccess7addPathEPK6CGPath_block_invoke_4;
  v7[3] = &unk_250FA1480;
  v7[6] = this;
  v7[7] = v5;
  v7[4] = v11;
  v7[5] = v8;
  CGPathApplyWithBlock(path, v7);
  CGPathRandomAccessSubpath::closeIfNeeded((CGPathRandomAccessSubpath *)(*((_QWORD *)this + 1) - 48));
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v11, 8);
  if (v12)
  {
    v13 = v12;
    operator delete(v12);
  }
  return v5;
}

void sub_23F0FCAE4(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v3;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  v3 = *(void **)(v1 - 88);
  if (v3)
  {
    *(_QWORD *)(v1 - 80) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__1(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void ___ZN18CGPathRandomAccess7addPathEPK6CGPath_block_invoke(uint64_t a1, int *a2)
{
  int v2;
  _QWORD *v3;
  int64x2_t *v4;
  unint64_t v5;
  int64x2_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64x2_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  int64x2_t *v17;
  char *v18;

  v2 = *a2;
  if ((*a2 - 2) < 2)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
    ++*(_QWORD *)(v7 - 16);
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
    v9 = *(_QWORD *)(v8 - 8) + 3;
LABEL_8:
    *(_QWORD *)(v8 - 8) = v9;
    return;
  }
  if (v2 == 1)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
    ++*(_QWORD *)(v10 - 16);
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56);
    v9 = *(_QWORD *)(v8 - 8) + 1;
    goto LABEL_8;
  }
  if (!v2)
  {
    v3 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v4 = (int64x2_t *)v3[7];
    v5 = v3[8];
    if ((unint64_t)v4 >= v5)
    {
      v11 = (int64x2_t *)v3[6];
      v12 = v4 - v11;
      v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 60)
        std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
      v14 = v5 - (_QWORD)v11;
      if (v14 >> 3 > v13)
        v13 = v14 >> 3;
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
        v15 = 0xFFFFFFFFFFFFFFFLL;
      else
        v15 = v13;
      if (v15)
      {
        v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)(v3 + 8), v15);
        v11 = (int64x2_t *)v3[6];
        v4 = (int64x2_t *)v3[7];
      }
      else
      {
        v16 = 0;
      }
      v17 = (int64x2_t *)&v16[16 * v12];
      v18 = &v16[16 * v15];
      *v17 = vdupq_n_s64(1uLL);
      v6 = v17 + 1;
      if (v4 != v11)
      {
        do
        {
          v17[-1] = v4[-1];
          --v17;
          --v4;
        }
        while (v4 != v11);
        v11 = (int64x2_t *)v3[6];
      }
      v3[6] = v17;
      v3[7] = v6;
      v3[8] = v18;
      if (v11)
        operator delete(v11);
    }
    else
    {
      *v4 = vdupq_n_s64(1uLL);
      v6 = v4 + 1;
    }
    v3[7] = v6;
  }
}

void ___ZN18CGPathRandomAccess7addPathEPK6CGPath_block_invoke_4(_QWORD *a1, uint64_t a2)
{
  uint64_t *v4;
  _OWORD *v5;
  unint64_t v6;
  char **v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  char *v36;
  _BYTE *v37;
  _BYTE *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  _OWORD *v42;
  _OWORD *v43;
  unint64_t v44;
  void **v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  _BYTE *v61;
  _BYTE *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  float64x2_t *v66;
  float64x2_t v67;
  unint64_t v68;
  _OWORD *f64;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  char *v76;
  uint64_t v77;
  char *v78;
  _BYTE *v79;
  _BYTE *v80;
  uint64_t v81;
  char v82;
  float64x2_t *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  char *v89;
  char *v90;
  unint64_t *v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  char *v99;
  char *v100;
  char *v101;
  _OWORD *v102;
  char *v103;
  char *v104;
  float64x2_t *v105;
  char *v106;
  uint64_t v107;
  float64x2_t v108;
  char *v109;
  unint64_t v110;
  _OWORD *v111;
  char *v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  unint64_t v116;
  char *v117;
  char *v118;
  char *v119;
  float64x2_t *v120;
  char *v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  unint64_t v127;
  char *v128;
  char *v129;
  float64x2_t v130;
  float64x2_t v131;
  _QWORD v132[5];

  v4 = (uint64_t *)a1[6];
  switch(*(_DWORD *)a2)
  {
    case 0:
      v5 = (_OWORD *)v4[1];
      if (v5 != (_OWORD *)*v4)
      {
        CGPathRandomAccessSubpath::closeIfNeeded((CGPathRandomAccessSubpath *)(v5 - 3));
        v5 = (_OWORD *)v4[1];
      }
      v6 = v4[2];
      if ((unint64_t)v5 >= v6)
      {
        v23 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v5 - *v4) >> 4);
        v24 = v23 + 1;
        if (v23 + 1 > 0x555555555555555)
          std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
        v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - *v4) >> 4);
        if (2 * v25 > v24)
          v24 = 2 * v25;
        if (v25 >= 0x2AAAAAAAAAAAAAALL)
          v26 = 0x555555555555555;
        else
          v26 = v24;
        v132[4] = v4 + 2;
        if (v26)
          v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessSubpath>>((uint64_t)(v4 + 2), v26);
        else
          v27 = 0;
        v90 = &v27[48 * v23];
        v132[0] = v27;
        v132[1] = v90;
        v132[3] = &v27[48 * v26];
        *(_OWORD *)v90 = 0u;
        *((_OWORD *)v90 + 1) = 0u;
        *((_OWORD *)v90 + 2) = 0u;
        v132[2] = v90 + 48;
        std::vector<CGPathRandomAccessSubpath>::__swap_out_circular_buffer(v4, v132);
        v7 = (char **)v4[1];
        std::__split_buffer<CGPathRandomAccessSubpath>::~__split_buffer((uint64_t)v132);
      }
      else
      {
        v5[1] = 0u;
        v5[2] = 0u;
        *v5 = 0u;
        v7 = (char **)(v5 + 3);
        v4[1] = (uint64_t)(v5 + 3);
      }
      v4[1] = (uint64_t)v7;
      v91 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 48)
                               + 16 * (~a1[7] - 0x5555555555555555 * (((unint64_t)v7 - *v4) >> 4)));
      v92 = v91[1];
      std::vector<CGPathRandomAccessElement>::reserve(v7 - 6, *v91);
      std::vector<ClipperLib::DoublePoint>::reserve((void **)(v4[1] - 24), v92);
      *(_OWORD *)(*(_QWORD *)(a1[5] + 8) + 48) = *(_OWORD *)*(_QWORD *)(a2 + 8);
      v41 = v4[1];
      v42 = (_OWORD *)(*(_QWORD *)(a1[5] + 8) + 48);
      v43 = *(_OWORD **)(v41 - 16);
      v93 = *(_QWORD *)(v41 - 8);
      if ((unint64_t)v43 < v93)
        goto LABEL_115;
      v45 = (void **)(v41 - 24);
      v94 = *(_QWORD *)(v41 - 24);
      v95 = ((uint64_t)v43 - v94) >> 4;
      v96 = v95 + 1;
      if ((unint64_t)(v95 + 1) >> 60)
        goto LABEL_132;
      v97 = v93 - v94;
      if (v97 >> 3 > v96)
        v96 = v97 >> 3;
      if ((unint64_t)v97 >= 0x7FFFFFFFFFFFFFF0)
        v98 = 0xFFFFFFFFFFFFFFFLL;
      else
        v98 = v96;
      if (v98)
        v99 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v41 - 8, v98);
      else
        v99 = 0;
      v100 = &v99[16 * v95];
      v101 = &v99[16 * v98];
      *(_OWORD *)v100 = *v42;
      v102 = v100 + 16;
      v119 = *(char **)(v41 - 24);
      v103 = *(char **)(v41 - 16);
      if (v103 == v119)
        goto LABEL_128;
      do
      {
        *((_OWORD *)v100 - 1) = *((_OWORD *)v103 - 1);
        v100 -= 16;
        v103 -= 16;
      }
      while (v103 != v119);
      goto LABEL_127;
    case 1:
      v8 = v4[1];
      v9 = ((uint64_t)(*(_QWORD *)(v8 - 16) - *(_QWORD *)(v8 - 24)) >> 4) - 1;
      v10 = *(_QWORD *)(v8 - 40);
      v11 = *(_QWORD *)(v8 - 32);
      if (v10 < v11)
      {
        *(_QWORD *)v10 = v9;
        *(_BYTE *)(v10 + 8) = 0;
        v12 = (char *)(v10 + 16);
        goto LABEL_31;
      }
      v28 = *(_QWORD *)(v8 - 48);
      v29 = (uint64_t)(v10 - v28) >> 4;
      v30 = v29 + 1;
      if (!((unint64_t)(v29 + 1) >> 60))
      {
        v31 = v11 - v28;
        if (v31 >> 3 > v30)
          v30 = v31 >> 3;
        if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF0)
          v32 = 0xFFFFFFFFFFFFFFFLL;
        else
          v32 = v30;
        v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v8 - 32, v32);
        v34 = &v33[16 * v29];
        v36 = &v33[16 * v35];
        *(_QWORD *)v34 = v9;
        v34[8] = 0;
        v12 = v34 + 16;
        v38 = *(_BYTE **)(v8 - 48);
        v37 = *(_BYTE **)(v8 - 40);
        if (v37 != v38)
        {
          do
          {
            v39 = *((_QWORD *)v37 - 2);
            v37 -= 16;
            v40 = v37[8];
            *((_QWORD *)v34 - 2) = v39;
            v34 -= 16;
            v34[8] = v40;
          }
          while (v37 != v38);
          v37 = *(_BYTE **)(v8 - 48);
        }
        *(_QWORD *)(v8 - 48) = v34;
        *(_QWORD *)(v8 - 40) = v12;
        *(_QWORD *)(v8 - 32) = v36;
        if (v37)
          operator delete(v37);
LABEL_31:
        *(_QWORD *)(v8 - 40) = v12;
        v41 = v4[1];
        v42 = *(_OWORD **)(a2 + 8);
        v43 = *(_OWORD **)(v41 - 16);
        v44 = *(_QWORD *)(v41 - 8);
        if ((unint64_t)v43 >= v44)
        {
          v45 = (void **)(v41 - 24);
          v46 = *(_QWORD *)(v41 - 24);
          v47 = ((uint64_t)v43 - v46) >> 4;
          v48 = v47 + 1;
          if (!((unint64_t)(v47 + 1) >> 60))
          {
            v49 = v44 - v46;
            if (v49 >> 3 > v48)
              v48 = v49 >> 3;
            if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF0)
              v50 = 0xFFFFFFFFFFFFFFFLL;
            else
              v50 = v48;
            if (v50)
              v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v41 - 8, v50);
            else
              v51 = 0;
            v100 = &v51[16 * v47];
            v101 = &v51[16 * v50];
            *(_OWORD *)v100 = *v42;
            v102 = v100 + 16;
            v104 = *(char **)(v41 - 24);
            v103 = *(char **)(v41 - 16);
            if (v103 == v104)
              goto LABEL_128;
            do
            {
              *((_OWORD *)v100 - 1) = *((_OWORD *)v103 - 1);
              v100 -= 16;
              v103 -= 16;
            }
            while (v103 != v104);
LABEL_127:
            v103 = (char *)*v45;
LABEL_128:
            *(_QWORD *)(v41 - 24) = v100;
            *(_QWORD *)(v41 - 16) = v102;
            *(_QWORD *)(v41 - 8) = v101;
            if (v103)
              operator delete(v103);
            goto LABEL_130;
          }
          goto LABEL_132;
        }
        goto LABEL_115;
      }
      goto LABEL_131;
    case 2:
      v13 = v4[1];
      v14 = ((uint64_t)(*(_QWORD *)(v13 - 16) - *(_QWORD *)(v13 - 24)) >> 4) - 1;
      v15 = *(_QWORD *)(v13 - 40);
      v16 = *(_QWORD *)(v13 - 32);
      if (v15 < v16)
      {
        *(_QWORD *)v15 = v14;
        *(_BYTE *)(v15 + 8) = 1;
        v17 = (char *)(v15 + 16);
        goto LABEL_51;
      }
      v52 = *(_QWORD *)(v13 - 48);
      v53 = (uint64_t)(v15 - v52) >> 4;
      v54 = v53 + 1;
      if ((unint64_t)(v53 + 1) >> 60)
        goto LABEL_131;
      v55 = v16 - v52;
      if (v55 >> 3 > v54)
        v54 = v55 >> 3;
      if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0)
        v56 = 0xFFFFFFFFFFFFFFFLL;
      else
        v56 = v54;
      v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v13 - 32, v56);
      v58 = &v57[16 * v53];
      v60 = &v57[16 * v59];
      *(_QWORD *)v58 = v14;
      v58[8] = 1;
      v17 = v58 + 16;
      v62 = *(_BYTE **)(v13 - 48);
      v61 = *(_BYTE **)(v13 - 40);
      if (v61 != v62)
      {
        do
        {
          v63 = *((_QWORD *)v61 - 2);
          v61 -= 16;
          v64 = v61[8];
          *((_QWORD *)v58 - 2) = v63;
          v58 -= 16;
          v58[8] = v64;
        }
        while (v61 != v62);
        v61 = *(_BYTE **)(v13 - 48);
      }
      *(_QWORD *)(v13 - 48) = v58;
      *(_QWORD *)(v13 - 40) = v17;
      *(_QWORD *)(v13 - 32) = v60;
      if (v61)
        operator delete(v61);
LABEL_51:
      *(_QWORD *)(v13 - 40) = v17;
      v65 = v4[1];
      v66 = *(float64x2_t **)(v65 - 16);
      v67 = vmlaq_f64(v66[-1], (float64x2_t)vdupq_n_s64(0x3FE5555555555555uLL), vsubq_f64(*(float64x2_t *)*(_QWORD *)(a2 + 8), v66[-1]));
      v68 = *(_QWORD *)(v65 - 8);
      if ((unint64_t)v66 >= v68)
      {
        v83 = *(float64x2_t **)(v65 - 24);
        v84 = v66 - v83;
        v85 = v84 + 1;
        if ((unint64_t)(v84 + 1) >> 60)
          goto LABEL_133;
        v86 = v68 - (_QWORD)v83;
        if (v86 >> 3 > v85)
          v85 = v86 >> 3;
        if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFF0)
          v87 = 0xFFFFFFFFFFFFFFFLL;
        else
          v87 = v85;
        if (v87)
        {
          v130 = v67;
          v88 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v65 - 8, v87);
          v67 = v130;
          v89 = v88;
          v83 = *(float64x2_t **)(v65 - 24);
          v66 = *(float64x2_t **)(v65 - 16);
        }
        else
        {
          v89 = 0;
        }
        v105 = (float64x2_t *)&v89[16 * v84];
        v106 = &v89[16 * v87];
        *v105 = v67;
        f64 = (_OWORD *)v105[1].f64;
        if (v66 != v83)
        {
          do
          {
            v105[-1] = v66[-1];
            --v105;
            --v66;
          }
          while (v66 != v83);
          v83 = *(float64x2_t **)(v65 - 24);
        }
        *(_QWORD *)(v65 - 24) = v105;
        *(_QWORD *)(v65 - 16) = f64;
        *(_QWORD *)(v65 - 8) = v106;
        if (v83)
          operator delete(v83);
      }
      else
      {
        *v66 = v67;
        f64 = (_OWORD *)v66[1].f64;
      }
      *(_QWORD *)(v65 - 16) = f64;
      v107 = v4[1];
      v108 = vmlaq_f64(*(float64x2_t *)(*(_QWORD *)(a2 + 8) + 16), (float64x2_t)vdupq_n_s64(0x3FE5555555555555uLL), vsubq_f64(*(float64x2_t *)*(_QWORD *)(a2 + 8), *(float64x2_t *)(*(_QWORD *)(a2 + 8) + 16)));
      v109 = *(char **)(v107 - 16);
      v110 = *(_QWORD *)(v107 - 8);
      if ((unint64_t)v109 < v110)
      {
        *(float64x2_t *)v109 = v108;
        v111 = v109 + 16;
        goto LABEL_114;
      }
      v112 = *(char **)(v107 - 24);
      v113 = (v109 - v112) >> 4;
      v114 = v113 + 1;
      if ((unint64_t)(v113 + 1) >> 60)
LABEL_133:
        std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
      v115 = v110 - (_QWORD)v112;
      if (v115 >> 3 > v114)
        v114 = v115 >> 3;
      if ((unint64_t)v115 >= 0x7FFFFFFFFFFFFFF0)
        v116 = 0xFFFFFFFFFFFFFFFLL;
      else
        v116 = v114;
      if (v116)
      {
        v131 = v108;
        v117 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v107 - 8, v116);
        v108 = v131;
        v118 = v117;
        v112 = *(char **)(v107 - 24);
        v109 = *(char **)(v107 - 16);
      }
      else
      {
        v118 = 0;
      }
      v120 = (float64x2_t *)&v118[16 * v113];
      v121 = &v118[16 * v116];
      *v120 = v108;
      v111 = (_OWORD *)v120[1].f64;
      if (v109 != v112)
      {
        do
        {
          v120[-1] = *((float64x2_t *)v109 - 1);
          --v120;
          v109 -= 16;
        }
        while (v109 != v112);
        v112 = *(char **)(v107 - 24);
      }
      *(_QWORD *)(v107 - 24) = v120;
      *(_QWORD *)(v107 - 16) = v111;
      *(_QWORD *)(v107 - 8) = v121;
      if (v112)
        operator delete(v112);
LABEL_114:
      *(_QWORD *)(v107 - 16) = v111;
      v41 = v4[1];
      v42 = (_OWORD *)(*(_QWORD *)(a2 + 8) + 16);
      v43 = *(_OWORD **)(v41 - 16);
      v122 = *(_QWORD *)(v41 - 8);
      if ((unint64_t)v43 >= v122)
      {
        v45 = (void **)(v41 - 24);
        v123 = *(_QWORD *)(v41 - 24);
        v124 = ((uint64_t)v43 - v123) >> 4;
        v125 = v124 + 1;
        if (!((unint64_t)(v124 + 1) >> 60))
        {
          v126 = v122 - v123;
          if (v126 >> 3 > v125)
            v125 = v126 >> 3;
          if ((unint64_t)v126 >= 0x7FFFFFFFFFFFFFF0)
            v127 = 0xFFFFFFFFFFFFFFFLL;
          else
            v127 = v125;
          if (v127)
            v128 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v41 - 8, v127);
          else
            v128 = 0;
          v100 = &v128[16 * v124];
          v101 = &v128[16 * v127];
          *(_OWORD *)v100 = *v42;
          v102 = v100 + 16;
          v129 = *(char **)(v41 - 24);
          v103 = *(char **)(v41 - 16);
          if (v103 == v129)
            goto LABEL_128;
          do
          {
            *((_OWORD *)v100 - 1) = *((_OWORD *)v103 - 1);
            v100 -= 16;
            v103 -= 16;
          }
          while (v103 != v129);
          goto LABEL_127;
        }
LABEL_132:
        std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
      }
LABEL_115:
      *v43 = *v42;
      v102 = v43 + 1;
LABEL_130:
      *(_QWORD *)(v41 - 16) = v102;
      return;
    case 3:
      v18 = v4[1];
      v19 = ((uint64_t)(*(_QWORD *)(v18 - 16) - *(_QWORD *)(v18 - 24)) >> 4) - 1;
      v20 = *(_QWORD *)(v18 - 40);
      v21 = *(_QWORD *)(v18 - 32);
      if (v20 >= v21)
      {
        v70 = *(_QWORD *)(v18 - 48);
        v71 = (uint64_t)(v20 - v70) >> 4;
        v72 = v71 + 1;
        if ((unint64_t)(v71 + 1) >> 60)
LABEL_131:
          std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
        v73 = v21 - v70;
        if (v73 >> 3 > v72)
          v72 = v73 >> 3;
        if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF0)
          v74 = 0xFFFFFFFFFFFFFFFLL;
        else
          v74 = v72;
        v75 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v18 - 32, v74);
        v76 = &v75[16 * v71];
        v78 = &v75[16 * v77];
        *(_QWORD *)v76 = v19;
        v76[8] = 1;
        v22 = v76 + 16;
        v80 = *(_BYTE **)(v18 - 48);
        v79 = *(_BYTE **)(v18 - 40);
        if (v79 != v80)
        {
          do
          {
            v81 = *((_QWORD *)v79 - 2);
            v79 -= 16;
            v82 = v79[8];
            *((_QWORD *)v76 - 2) = v81;
            v76 -= 16;
            v76[8] = v82;
          }
          while (v79 != v80);
          v79 = *(_BYTE **)(v18 - 48);
        }
        *(_QWORD *)(v18 - 48) = v76;
        *(_QWORD *)(v18 - 40) = v22;
        *(_QWORD *)(v18 - 32) = v78;
        if (v79)
          operator delete(v79);
      }
      else
      {
        *(_QWORD *)v20 = v19;
        *(_BYTE *)(v20 + 8) = 1;
        v22 = (char *)(v20 + 16);
      }
      *(_QWORD *)(v18 - 40) = v22;
      std::vector<CGPoint>::__insert_with_size[abi:ne180100]<CGPoint*,CGPoint*>(v4[1] - 24, *(_QWORD *)(v4[1] - 16), *(char **)(a2 + 8), (char *)(*(_QWORD *)(a2 + 8) + 48), 3);
      return;
    default:
      return;
  }
}

void sub_23F0FD558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::__split_buffer<CGPathRandomAccessSubpath>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void CGPathRandomAccessSubpath::closeIfNeeded(CGPathRandomAccessSubpath *this)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  double *v5;
  uint64_t v6;
  uint64_t v7;
  char *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  _BYTE *v20;
  _BYTE *v21;
  uint64_t v22;
  char v23;

  v1 = *(_QWORD *)this;
  v2 = *((_QWORD *)this + 1);
  v3 = v2 - *(_QWORD *)this;
  if ((unint64_t)v3 >= 0x20)
  {
    v5 = (double *)*((_QWORD *)this + 3);
    v6 = *((_QWORD *)this + 4);
    v7 = ((v6 - (uint64_t)v5) >> 4) - 1;
    if (*(_QWORD *)(v2 - 16) != v7 && (*(double *)(v6 - 16) != *v5 || *(double *)(v6 - 8) != v5[1]))
    {
      v9 = (char *)this + 16;
      v10 = *((_QWORD *)this + 2);
      if (v2 >= v10)
      {
        v12 = v3 >> 4;
        v13 = (v3 >> 4) + 1;
        if (v13 >> 60)
          std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
        v14 = v10 - v1;
        if (v14 >> 3 > v13)
          v13 = v14 >> 3;
        if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
          v15 = 0xFFFFFFFFFFFFFFFLL;
        else
          v15 = v13;
        v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>((uint64_t)v9, v15);
        v17 = &v16[16 * v12];
        v19 = &v16[16 * v18];
        *(_QWORD *)v17 = v7;
        v17[8] = 0;
        v11 = v17 + 16;
        v21 = *(_BYTE **)this;
        v20 = (_BYTE *)*((_QWORD *)this + 1);
        if (v20 != *(_BYTE **)this)
        {
          do
          {
            v22 = *((_QWORD *)v20 - 2);
            v20 -= 16;
            v23 = v20[8];
            *((_QWORD *)v17 - 2) = v22;
            v17 -= 16;
            v17[8] = v23;
          }
          while (v20 != v21);
          v20 = *(_BYTE **)this;
        }
        *(_QWORD *)this = v17;
        *((_QWORD *)this + 1) = v11;
        *((_QWORD *)this + 2) = v19;
        if (v20)
          operator delete(v20);
      }
      else
      {
        *(_QWORD *)v2 = v7;
        *(_BYTE *)(v2 + 8) = 0;
        v11 = (char *)(v2 + 16);
      }
      *((_QWORD *)this + 1) = v11;
    }
  }
}

void std::vector<CGPathRandomAccessElement>::reserve(char **a1, unint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char v14;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v3, a2);
    v7 = &v6[v5];
    v9 = &v6[16 * v8];
    v11 = *a1;
    v10 = a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 2);
        v10 -= 16;
        v14 = v10[8];
        *((_QWORD *)v12 - 2) = v13;
        v12 -= 16;
        v12[8] = v14;
      }
      while (v10 != v11);
      v10 = *a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void std::vector<CGPathRandomAccessSubpath>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CGPathRandomAccessSubpath>,std::reverse_iterator<CGPathRandomAccessSubpath*>,std::reverse_iterator<CGPathRandomAccessSubpath*>,std::reverse_iterator<CGPathRandomAccessSubpath*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CGPathRandomAccessSubpath>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

__n128 std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<CGPathRandomAccessSubpath>,std::reverse_iterator<CGPathRandomAccessSubpath*>,std::reverse_iterator<CGPathRandomAccessSubpath*>,std::reverse_iterator<CGPathRandomAccessSubpath*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __n128 result;

  if (a3 != a5)
  {
    v7 = 0;
    do
    {
      v8 = a7 + v7;
      v9 = a3 + v7;
      *(_QWORD *)(v8 - 48) = 0;
      *(_QWORD *)(v8 - 40) = 0;
      *(_QWORD *)(v8 - 32) = 0;
      *(_OWORD *)(v8 - 48) = *(_OWORD *)(a3 + v7 - 48);
      *(_QWORD *)(v8 - 32) = *(_QWORD *)(a3 + v7 - 32);
      *(_QWORD *)(v9 - 48) = 0;
      *(_QWORD *)(v9 - 40) = 0;
      *(_QWORD *)(v9 - 32) = 0;
      *(_QWORD *)(v8 - 24) = 0;
      *(_QWORD *)(v8 - 16) = 0;
      *(_QWORD *)(v8 - 8) = 0;
      result = *(__n128 *)(a3 + v7 - 24);
      *(__n128 *)(v8 - 24) = result;
      *(_QWORD *)(v8 - 8) = *(_QWORD *)(a3 + v7 - 8);
      *(_QWORD *)(v9 - 24) = 0;
      *(_QWORD *)(v9 - 16) = 0;
      *(_QWORD *)(v9 - 8) = 0;
      v7 -= 48;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

void std::__destroy_at[abi:ne180100]<CGPathRandomAccessSubpath,0>(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
  v3 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v3;
    operator delete(v3);
  }
}

uint64_t std::__split_buffer<CGPathRandomAccessSubpath>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 48;
    std::__destroy_at[abi:ne180100]<CGPathRandomAccessSubpath,0>(i - 48);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

char *std::vector<CGPoint>::__insert_with_size[abi:ne180100]<CGPoint*,CGPoint*>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  char *v5;
  char *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  __int128 v27;
  char *v28;
  uint64_t v29;
  char *v30;
  __int128 v31;
  void *__p;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;

  v5 = (char *)__dst;
  if (a5 < 1)
    return v5;
  v7 = __src;
  v11 = *(_QWORD *)(a1 + 16);
  v9 = a1 + 16;
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 4)
  {
    v13 = *(void **)a1;
    v14 = a5 + ((uint64_t)(v12 - *(_QWORD *)a1) >> 4);
    if (v14 >> 60)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v15 = (__dst - (uint64_t)v13) >> 4;
    v16 = v10 - (_QWORD)v13;
    if (v16 >> 3 > v14)
      v14 = v16 >> 3;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0)
      v17 = 0xFFFFFFFFFFFFFFFLL;
    else
      v17 = v14;
    v37 = v9;
    if (v17)
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ClipperLib::DoublePoint>>(v9, v17);
    else
      v18 = 0;
    v28 = &v18[16 * v15];
    __p = v18;
    v34 = v28;
    v36 = &v18[16 * v17];
    v29 = 16 * a5;
    v30 = &v28[16 * a5];
    do
    {
      v31 = *(_OWORD *)v7;
      v7 += 16;
      *(_OWORD *)v28 = v31;
      v28 += 16;
      v29 -= 16;
    }
    while (v29);
    v35 = v30;
    v5 = (char *)std::vector<CGPoint>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34)
      v35 += (v34 - v35 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (__p)
      operator delete(__p);
    return v5;
  }
  v19 = v12 - __dst;
  v20 = (uint64_t)(v12 - __dst) >> 4;
  if (v20 >= a5)
  {
    v21 = &__src[16 * a5];
    v23 = *(char **)(v9 - 8);
LABEL_17:
    v24 = &v5[16 * a5];
    v25 = &v23[-16 * a5];
    v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      v26 = v23;
      do
      {
        v27 = *(_OWORD *)v25;
        v25 += 16;
        *(_OWORD *)v26 = v27;
        v26 += 16;
      }
      while ((unint64_t)v25 < v12);
    }
    *(_QWORD *)(a1 + 8) = v26;
    if (v23 != v24)
      memmove(&v23[-16 * ((v23 - v24) >> 4)], v5, v23 - v24);
    if (v21 != v7)
      memmove(v5, v7, v21 - v7);
    return v5;
  }
  v21 = &__src[16 * v20];
  v22 = a4 - v21;
  if (a4 != v21)
    memmove(*(void **)(v9 - 8), &__src[16 * v20], a4 - v21);
  v23 = (char *)(v12 + v22);
  *(_QWORD *)(a1 + 8) = v12 + v22;
  if (v19 >= 1)
    goto LABEL_17;
  return v5;
}

void sub_23F0FDAA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void *std::vector<CGPoint>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  void *v5;
  char *v6;
  void *v7;
  char *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  int64_t v12;
  char *v13;
  void *v14;
  void *v15;

  v5 = *(void **)(a2 + 8);
  v6 = (char *)*a1;
  v7 = v5;
  if (*a1 != __src)
  {
    v8 = __src;
    v9 = *(_QWORD *)(a2 + 8);
    do
    {
      v7 = (void *)(v9 - 16);
      *(_OWORD *)(v9 - 16) = *((_OWORD *)v8 - 1);
      v8 -= 16;
      v9 -= 16;
    }
    while (v8 != v6);
  }
  *(_QWORD *)(a2 + 8) = v7;
  v10 = a1[1];
  v11 = *(_QWORD *)(a2 + 16);
  v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    v7 = *(void **)(a2 + 8);
  }
  *(_QWORD *)(a2 + 16) = v11 + v12;
  v13 = (char *)*a1;
  *a1 = v7;
  *(_QWORD *)(a2 + 8) = v13;
  v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v14;
  v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = v15;
  *(_QWORD *)a2 = *(_QWORD *)(a2 + 8);
  return v5;
}

void std::vector<CGPathRandomAccessSubpath>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::__destroy_at[abi:ne180100]<CGPathRandomAccessSubpath,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void CGPathRandomAccessSubpath::clipperPath(uint64_t *a1, char **a2, double a3)
{
  uint64_t v4;
  unint64_t v6;
  int32x2_t v15;
  unint64_t v16;
  unint64_t v17;
  __int128 v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  __int128 v27;
  char *v28;
  char *v29;
  char *v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  __n128 v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  __n128 v45;
  double v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  uint64_t v51;
  uint64_t v52;
  int32x2_t v53;
  unint64_t v54;
  unint64_t v55;
  __int128 v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  char *v64;
  __int128 v65;
  char *v66;
  char *v67;
  char *v68;
  __int128 v69;
  char *v70;
  char *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  _QWORD v88[2];
  void (*v89)(uint64_t, double, double);
  void *v90;
  _QWORD *v91;
  char **v92;
  double v93;
  _QWORD v94[8];

  v4 = *a1;
  if (a1[1] != *a1)
  {
    v6 = 0;
    __asm
    {
      FMOV            V1.2D, #3.0
      FMOV            V0.2D, #6.0
    }
    v81 = _Q0;
    v82 = _Q1;
    __asm
    {
      FMOV            V1.2D, #0.125
      FMOV            V0.2D, #0.25
    }
    v79 = _Q0;
    v80 = _Q1;
    __asm { FMOV            V0.2D, #0.5 }
    v78 = _Q0;
    do
    {
      if (!v6)
      {
        v15 = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64(*(float64x2_t *)a1[3], a3)));
        v16 = (unint64_t)a2[1];
        v17 = (unint64_t)a2[2];
        if (v16 >= v17)
        {
          v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - (_QWORD)*a2) >> 3);
          v21 = v20 + 1;
          if (v20 + 1 > 0xAAAAAAAAAAAAAAALL)
            goto LABEL_53;
          v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17 - (_QWORD)*a2) >> 3);
          if (2 * v22 > v21)
            v21 = 2 * v22;
          if (v22 >= 0x555555555555555)
            v23 = 0xAAAAAAAAAAAAAAALL;
          else
            v23 = v21;
          v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)(a2 + 2), v23);
          v26 = &v24[24 * v20];
          *(_QWORD *)&v27 = v15.i32[0];
          *((_QWORD *)&v27 + 1) = v15.i32[1];
          *(_OWORD *)v26 = v27;
          *((_QWORD *)v26 + 2) = 0;
          v29 = *a2;
          v28 = a2[1];
          v30 = v26;
          if (v28 != *a2)
          {
            do
            {
              v31 = *(_OWORD *)(v28 - 24);
              *((_QWORD *)v30 - 1) = *((_QWORD *)v28 - 1);
              *(_OWORD *)(v30 - 24) = v31;
              v30 -= 24;
              v28 -= 24;
            }
            while (v28 != v29);
            v28 = *a2;
          }
          v19 = v26 + 24;
          *a2 = v30;
          a2[1] = v26 + 24;
          a2[2] = &v24[24 * v25];
          if (v28)
            operator delete(v28);
        }
        else
        {
          *(_QWORD *)&v18 = v15.i32[0];
          *((_QWORD *)&v18 + 1) = v15.i32[1];
          *(_OWORD *)v16 = v18;
          *(_QWORD *)(v16 + 16) = 0;
          v19 = (char *)(v16 + 24);
        }
        a2[1] = v19;
        v4 = *a1;
      }
      v32 = v4 + 16 * v6;
      if (*(_BYTE *)(v32 + 8))
      {
        v94[0] = 0;
        v94[1] = v94;
        v94[2] = 0x3812000000;
        v94[3] = __Block_byref_object_copy__6;
        v94[4] = __Block_byref_object_dispose__7;
        v94[5] = &unk_23F102635;
        v94[6] = 0;
        v33 = a1[3] + 16 * *(_QWORD *)v32;
        v88[0] = MEMORY[0x24BDAC760];
        v88[1] = 3221225472;
        v89 = ___ZNK25CGPathRandomAccessSubpath11clipperPathEdRNSt3__16vectorIN10ClipperLib8IntPointENS0_9allocatorIS3_EEEE_block_invoke;
        v90 = &unk_250FA14A8;
        v93 = a3;
        v91 = v94;
        v92 = a2;
        v34 = v88;
        v36 = *(float64x2_t *)v33;
        v35 = *(float64x2_t *)(v33 + 16);
        v37 = vsubq_f64(v35, *(float64x2_t *)v33);
        v39 = *(float64x2_t *)(v33 + 32);
        v38 = *(__n128 *)(v33 + 48);
        v40 = vsubq_f64(v39, v35);
        v41 = vsubq_f64(v40, v37);
        v42 = vsubq_f64(vsubq_f64((float64x2_t)v38, v39), v40);
        v43 = (float64x2_t)vzip2q_s64((int64x2_t)v41, (int64x2_t)v42);
        v44 = (float64x2_t)vzip1q_s64((int64x2_t)v41, (int64x2_t)v42);
        v45 = (__n128)vmlaq_f64(vmulq_f64(v43, v43), v44, v44);
        if (v45.n128_f64[0] <= v45.n128_f64[1])
          v45.n128_f64[0] = v45.n128_f64[1];
        v46 = v45.n128_f64[0] * 9.0 * 0.0625;
        v45.n128_u64[0] = *(_QWORD *)(v33 + 56);
        if (v46 > 0.04)
        {
          v47 = vsubq_f64(v42, v41);
          v48 = vmulq_f64(v47, v81);
          v49 = vmlaq_f64(v47, v82, vaddq_f64(v37, v41));
          v50 = vmulq_f64(vaddq_f64(v41, v47), v81);
          v51 = 1;
          do
          {
            v48 = vmulq_f64(v48, v80);
            v50 = vsubq_f64(vmulq_f64(v50, v79), v48);
            v49 = vsubq_f64(vmulq_f64(v49, v78), vmulq_f64(v50, v78));
            v51 *= 2;
            v46 = v46 * 0.0625;
          }
          while (v46 > 0.04 && v51 <= 0x10000);
          if (v51 >= 2)
          {
            v52 = 1;
            v84 = v48;
            do
            {
              v85 = v49;
              v86 = v50;
              v87 = vaddq_f64(v36, v49);
              ((void (*)(_QWORD *, double, double, double))v89)(v34, v87.f64[0], v87.f64[1], (double)(int)v52 / (double)v51);
              v45.n128_u64[1] = *(_QWORD *)&v85.f64[1];
              v38.n128_u64[1] = *(_QWORD *)&v86.f64[1];
              v49 = vaddq_f64(v85, v86);
              v50 = vaddq_f64(v84, v86);
              ++v52;
              v36 = v87;
            }
            while (v51 != v52);
            v38.n128_u64[0] = *(_QWORD *)(v33 + 48);
            v45.n128_u64[0] = *(_QWORD *)(v33 + 56);
          }
        }
        ((void (*)(_QWORD *, __n128, __n128, double))v89)(v34, v38, v45, 1.0);

        _Block_object_dispose(v94, 8);
      }
      else
      {
        v53 = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64(*(float64x2_t *)(a1[3] + 16 * ((*(_QWORD *)v32 + 1) % (unint64_t)((a1[4] - a1[3]) >> 4))), a3)));
        v54 = (unint64_t)a2[1];
        v55 = (unint64_t)a2[2];
        if (v54 >= v55)
        {
          v58 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v54 - (_QWORD)*a2) >> 3);
          v59 = v58 + 1;
          if (v58 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_53:
            std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
          v60 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v55 - (_QWORD)*a2) >> 3);
          if (2 * v60 > v59)
            v59 = 2 * v60;
          if (v60 >= 0x555555555555555)
            v61 = 0xAAAAAAAAAAAAAAALL;
          else
            v61 = v59;
          v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)(a2 + 2), v61);
          v64 = &v62[24 * v58];
          *(_QWORD *)&v65 = v53.i32[0];
          *((_QWORD *)&v65 + 1) = v53.i32[1];
          *(_OWORD *)v64 = v65;
          *((_QWORD *)v64 + 2) = 0;
          v67 = *a2;
          v66 = a2[1];
          v68 = v64;
          if (v66 != *a2)
          {
            do
            {
              v69 = *(_OWORD *)(v66 - 24);
              *((_QWORD *)v68 - 1) = *((_QWORD *)v66 - 1);
              *(_OWORD *)(v68 - 24) = v69;
              v68 -= 24;
              v66 -= 24;
            }
            while (v66 != v67);
            v66 = *a2;
          }
          v57 = v64 + 24;
          *a2 = v68;
          a2[1] = v64 + 24;
          a2[2] = &v62[24 * v63];
          if (v66)
            operator delete(v66);
        }
        else
        {
          *(_QWORD *)&v56 = v53.i32[0];
          *((_QWORD *)&v56 + 1) = v53.i32[1];
          *(_OWORD *)v54 = v56;
          *(_QWORD *)(v54 + 16) = 0;
          v57 = (char *)(v54 + 24);
        }
        a2[1] = v57;
      }
      ++v6;
      v4 = *a1;
    }
    while (v6 < (a1[1] - *a1) >> 4);
  }
  v71 = *a2;
  v70 = a2[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v70 - *a2) >> 3) > 1)
  {
    v73 = *((_QWORD *)v70 - 3);
    v74 = *((_QWORD *)v70 - 2);
    v72 = v70 - 24;
    v76 = *(_QWORD *)v71;
    v75 = *((_QWORD *)v71 + 1);
    if (v73 == v76 && v74 == v75)
      a2[1] = v72;
  }
}

void sub_23F0FE10C(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  _Block_object_dispose((const void *)(v2 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 48) = *(_QWORD *)(a2 + 48);
  return result;
}

void ___ZNK25CGPathRandomAccessSubpath11clipperPathEdRNSt3__16vectorIN10ClipperLib8IntPointENS0_9allocatorIS3_EEEE_block_invoke(uint64_t a1, double a2, double a3)
{
  double v3;
  int v4;
  int v5;
  void **v6;
  uint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  __int128 v21;

  v3 = *(double *)(a1 + 48);
  v4 = (int)(a2 * v3);
  v5 = (int)(a3 * v3);
  v6 = *(void ***)(a1 + 40);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = v6[1];
  v9 = (unint64_t)v6[2];
  if ((unint64_t)v8 >= v9)
  {
    v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (_BYTE *)*v6) >> 3);
    v12 = v11 + 1;
    if (v11 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::vector<ClipperLib::IntPoint>>::__throw_length_error[abi:ne180100]();
    v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - (_QWORD)*v6) >> 3);
    if (2 * v13 > v12)
      v12 = 2 * v13;
    if (v13 >= 0x555555555555555)
      v14 = 0xAAAAAAAAAAAAAAALL;
    else
      v14 = v12;
    v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<ClipperLib::IntPoint>>>((uint64_t)(v6 + 2), v14);
    v16 = &v15[24 * v11];
    v18 = &v15[24 * v17];
    *(_QWORD *)v16 = v4;
    *((_QWORD *)v16 + 1) = v5;
    *((_QWORD *)v16 + 2) = *(_QWORD *)(v7 + 48);
    v10 = v16 + 24;
    v20 = (char *)*v6;
    v19 = (char *)v6[1];
    if (v19 != *v6)
    {
      do
      {
        v21 = *(_OWORD *)(v19 - 24);
        *((_QWORD *)v16 - 1) = *((_QWORD *)v19 - 1);
        *(_OWORD *)(v16 - 24) = v21;
        v16 -= 24;
        v19 -= 24;
      }
      while (v19 != v20);
      v19 = (char *)*v6;
    }
    *v6 = v16;
    v6[1] = v10;
    v6[2] = v18;
    if (v19)
      operator delete(v19);
  }
  else
  {
    *v8 = v4;
    v8[1] = v5;
    v8[2] = *(_QWORD *)(v7 + 48);
    v10 = v8 + 3;
  }
  v6[1] = v10;
}

uint64_t *UIViewAutoresizing.itk_flexibleWidth.unsafeMutableAddressor()
{
  return &static UIViewAutoresizing.itk_flexibleWidth;
}

uint64_t static UIViewAutoresizing.itk_flexibleWidth.getter()
{
  swift_beginAccess();
  return static UIViewAutoresizing.itk_flexibleWidth;
}

uint64_t static UIViewAutoresizing.itk_flexibleWidth.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static UIViewAutoresizing.itk_flexibleWidth = a1;
  return result;
}

uint64_t (*static UIViewAutoresizing.itk_flexibleWidth.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t *UIViewAutoresizing.itk_flexibleHeight.unsafeMutableAddressor()
{
  return &static UIViewAutoresizing.itk_flexibleHeight;
}

uint64_t static UIViewAutoresizing.itk_flexibleHeight.getter()
{
  swift_beginAccess();
  return static UIViewAutoresizing.itk_flexibleHeight;
}

uint64_t static UIViewAutoresizing.itk_flexibleHeight.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static UIViewAutoresizing.itk_flexibleHeight = a1;
  return result;
}

uint64_t (*static UIViewAutoresizing.itk_flexibleHeight.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

CGRect __swiftcall CGRect.init(itk_point1:point2:)(CGPoint itk_point1, CGPoint point2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Swift::Bool __swiftcall CGRect.itk_isEqualToRect(_:)(CGRect a1)
{
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v10;
  CGRect v11;

  height = a1.size.height;
  width = a1.size.width;
  y = a1.origin.y;
  x = a1.origin.x;
  v10.origin.x = v1;
  v10.origin.y = v2;
  v10.size.width = v3;
  v10.size.height = v4;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  return CGRectEqualToRect(v10, v11);
}

Swift::Bool __swiftcall CGRect.itk_isNearlyEqualToRect(_:)(CGRect a1)
{
  double v1;
  double v2;
  double v3;
  double v4;

  return sub_23F0FE568((uint64_t (*)(double, double, double, double, double, double, double, double))MEMORY[0x24BE51E10], a1.origin.x, a1.origin.y, a1.size.width, a1.size.height, v1, v2, v3, v4);
}

Swift::Bool __swiftcall CGRect.itk_isNearlyEqualToRect(_:threshold:)(CGRect _, Swift::Double threshold)
{
  return sub_23F0FE50C();
}

Swift::Bool __swiftcall CGRect.itk_nearlyContainsRect(_:)(CGRect a1)
{
  double v1;
  double v2;
  double v3;
  double v4;

  return sub_23F0FE568(MEMORY[0x24BE51DF8], a1.origin.x, a1.origin.y, a1.size.width, a1.size.height, v1, v2, v3, v4);
}

BOOL static CGRect.== infix(_:_:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  _BOOL4 v8;

  v8 = a1 == a5;
  if (a2 != a6)
    v8 = 0;
  if (a3 != a7)
    v8 = 0;
  return a4 == a8 && v8;
}

BOOL static CGPoint.== infix(_:_:)(double a1, double a2, double a3, double a4)
{
  return a2 == a4 && a1 == a3;
}

Swift::Bool __swiftcall CGRect.isNearlyEqualToRect(_:)(CGRect a1)
{
  double v1;
  double v2;
  double v3;
  double v4;

  return sub_23F0FE568((uint64_t (*)(double, double, double, double, double, double, double, double))MEMORY[0x24BE51E10], a1.origin.x, a1.origin.y, a1.size.width, a1.size.height, v1, v2, v3, v4);
}

Swift::Bool __swiftcall CGRect.isNearlyEqualToRect(_:threshold:)(CGRect _, Swift::Double threshold)
{
  return sub_23F0FE50C();
}

uint64_t sub_23F0FE50C()
{
  return ITKNearlyEqualRectsWithThreshold();
}

Swift::Bool __swiftcall CGRect.nearlyContainsRect(_:)(CGRect a1)
{
  double v1;
  double v2;
  double v3;
  double v4;

  return sub_23F0FE568(MEMORY[0x24BE51DF8], a1.origin.x, a1.origin.y, a1.size.width, a1.size.height, v1, v2, v3, v4);
}

uint64_t sub_23F0FE568(uint64_t (*a1)(double, double, double, double, double, double, double, double), double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1(a6, a7, a8, a9, a2, a3, a4, a5);
}

Swift::Bool __swiftcall CGPoint.itk_isEqualToPoint(_:)(CGPoint a1)
{
  CGFloat v1;
  CGFloat v2;
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGPoint v7;

  y = a1.y;
  x = a1.x;
  v6.x = v1;
  v6.y = v2;
  v7.x = x;
  v7.y = y;
  return CGPointEqualToPoint(v6, v7);
}

CGPoint __swiftcall CGPoint.itk_addPoint(_:)(CGPoint a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGPoint result;

  sub_23F0FE5F4((uint64_t (*)(double, double, double, double))MEMORY[0x24BE51D20], a1.x, a1.y, v1, v2);
  result.y = v4;
  result.x = v3;
  return result;
}

CGPoint __swiftcall CGPoint.itk_subtractPoint(_:)(CGPoint a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGPoint result;

  sub_23F0FE5F4((uint64_t (*)(double, double, double, double))MEMORY[0x24BE51EA8], a1.x, a1.y, v1, v2);
  result.y = v4;
  result.x = v3;
  return result;
}

uint64_t sub_23F0FE5F4(uint64_t (*a1)(double, double, double, double), double a2, double a3, double a4, double a5)
{
  return a1(a4, a5, a2, a3);
}

Swift::Bool __swiftcall CGPoint.itk_isCollinearWithPoints(p1:p2:)(CGPoint p1, CGPoint p2)
{
  double v2;
  double v3;

  return sub_23F0FE6F8(MEMORY[0x24BE51D60], p1.x, p1.y, p2.x, p2.y, v2, v3);
}

Swift::Double __swiftcall CGPoint.itk_distance(toPoint:)(CGPoint toPoint)
{
  Swift::Double result;

  ITKDistance();
  return result;
}

Swift::Bool __swiftcall CGPoint.itk_isNearlyCollinearWithPoints(p1:p2:)(CGPoint p1, CGPoint p2)
{
  double v2;
  double v3;

  return sub_23F0FE6F8(MEMORY[0x24BE51DF0], p1.x, p1.y, p2.x, p2.y, v2, v3);
}

uint64_t static CGPoint.+ infix(_:_:)()
{
  return sub_23F0FE660(MEMORY[0x24BE51D20]);
}

uint64_t static CGPoint.- infix(_:_:)()
{
  return sub_23F0FE660(MEMORY[0x24BE51EA8]);
}

Swift::Bool __swiftcall CGPoint.isNearlyEqualToPoint(_:)(CGPoint a1)
{
  return ITKNearlyEqualPoints();
}

uint64_t _sSo7CGPointV14InputToolKitUIE24itk_isNearlyEqualToPoint_9thresholdSbAB_SdtF_0()
{
  return ITKNearlyEqualPointsWithThreshold();
}

Swift::Bool __swiftcall CGPoint.isCollinearWithPoints(p1:p2:)(CGPoint p1, CGPoint p2)
{
  double v2;
  double v3;

  return sub_23F0FE6F8(MEMORY[0x24BE51D60], p1.x, p1.y, p2.x, p2.y, v2, v3);
}

Swift::Double __swiftcall CGPoint.distanceSquared(toPoint:)(CGPoint toPoint)
{
  Swift::Double result;

  ITKDistanceSquared();
  return result;
}

Swift::Bool __swiftcall CGPoint.isNearlyCollinearWithPoints(p1:p2:)(CGPoint p1, CGPoint p2)
{
  double v2;
  double v3;

  return sub_23F0FE6F8(MEMORY[0x24BE51DF0], p1.x, p1.y, p2.x, p2.y, v2, v3);
}

uint64_t sub_23F0FE6F8(uint64_t (*a1)(double, double, double, double, double, double), double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a1(a6, a7, a2, a3, a4, a5);
}

void itk_dataFromCGImage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23F0DD000, MEMORY[0x24BDACB70], a3, "Failed to create CGImageDestinationRef", a5, a6, a7, a8, 0);
}

void itk_dataFromCGImage_cold_2(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136315394;
  v2 = "NSData * _Nullable itk_dataFromCGImage(CGImageRef _Nullable, NSString *__strong _Nonnull, NSDictionary * _Nullable __strong)";
  v3 = 2112;
  v4 = a1;
  _os_log_error_impl(&dword_23F0DD000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s -- Failed to finalize image with type '%@'.", (uint8_t *)&v1, 0x16u);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDAB8](space, pattern, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x24BDBDAE8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x24BDBDB08](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB78]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB80]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBA0](baseSpace);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC10](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x24BDBEDA8](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
  MEMORY[0x24BDBEE10](path, block);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEE60](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x24BDBEF58](info, matrix, *(_QWORD *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

void CGPatternRelease(CGPatternRef pattern)
{
  MEMORY[0x24BDBEF88](pattern);
}

BOOL CGPointEqualToPoint(CGPoint point1, CGPoint point2)
{
  return MEMORY[0x24BDBEFA0]((__n128)point1, *(__n128 *)&point1.y, (__n128)point2, *(__n128 *)&point2.y);
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t ITKAddPoints()
{
  return MEMORY[0x24BE51D20]();
}

uint64_t ITKAngleBetweenPoints()
{
  return MEMORY[0x24BE51D28]();
}

uint64_t ITKAngleOfLine()
{
  return MEMORY[0x24BE51D30]();
}

uint64_t ITKAveragePoints()
{
  return MEMORY[0x24BE51D40]();
}

uint64_t ITKCenterOfRect()
{
  return MEMORY[0x24BE51D48]();
}

uint64_t ITKClampSizeToMaxLength()
{
  return MEMORY[0x24BE51D58]();
}

uint64_t ITKCrossPoints()
{
  return MEMORY[0x24BE51D68]();
}

uint64_t ITKDistance()
{
  return MEMORY[0x24BE51D70]();
}

uint64_t ITKDistanceSquared()
{
  return MEMORY[0x24BE51D78]();
}

uint64_t ITKDynamicCast()
{
  return MEMORY[0x24BE51D80]();
}

uint64_t ITKFitOrFillSizeInRect()
{
  return MEMORY[0x24BE51D88]();
}

uint64_t ITKFlipPoint()
{
  return MEMORY[0x24BE51D98]();
}

uint64_t ITKFlipRect()
{
  return MEMORY[0x24BE51DA0]();
}

uint64_t ITKIntersectionOfLines()
{
  return MEMORY[0x24BE51DB8]();
}

uint64_t ITKIntersectsLine()
{
  return MEMORY[0x24BE51DC0]();
}

uint64_t ITKMultiplyPointBySize()
{
  return MEMORY[0x24BE51DD0]();
}

uint64_t ITKMultiplyPointScalar()
{
  return MEMORY[0x24BE51DD8]();
}

uint64_t ITKMultiplySizeScalar()
{
  return MEMORY[0x24BE51DE0]();
}

uint64_t ITKNearestPointOnLineSegmentToPoint()
{
  return MEMORY[0x24BE51DE8]();
}

uint64_t ITKNearlyEqualPoints()
{
  return MEMORY[0x24BE51E00]();
}

uint64_t ITKNearlyEqualPointsWithThreshold()
{
  return MEMORY[0x24BE51E08]();
}

uint64_t ITKNearlyEqualRects()
{
  return MEMORY[0x24BE51E10]();
}

uint64_t ITKNearlyEqualRectsWithThreshold()
{
  return MEMORY[0x24BE51E18]();
}

uint64_t ITKNormalizeAngleInRadians()
{
  return MEMORY[0x24BE51E20]();
}

uint64_t ITKNormalizedPointInRect()
{
  return MEMORY[0x24BE51E28]();
}

uint64_t ITKPointFromNormalizedRect()
{
  return MEMORY[0x24BE51E30]();
}

uint64_t ITKPointIsFinite()
{
  return MEMORY[0x24BE51E40]();
}

uint64_t ITKRectFromNormalizedSubrect()
{
  return MEMORY[0x24BE51E48]();
}

uint64_t ITKRectWithCenterAndSize()
{
  return MEMORY[0x24BE51E60]();
}

uint64_t ITKRectWithOriginAndSize()
{
  return MEMORY[0x24BE51E68]();
}

uint64_t ITKRectWithPoints()
{
  return MEMORY[0x24BE51E70]();
}

uint64_t ITKRectWithSize()
{
  return MEMORY[0x24BE51E78]();
}

uint64_t ITKSizeIsEmptyOrHasNanOrInf()
{
  return MEMORY[0x24BE51E90]();
}

uint64_t ITKSizeRatioFromSizes()
{
  return MEMORY[0x24BE51E98]();
}

uint64_t ITKSlopeOfLine()
{
  return MEMORY[0x24BE51EA0]();
}

uint64_t ITKSubtractPoints()
{
  return MEMORY[0x24BE51EA8]();
}

uint64_t ITKVertexCentroidOfQuad()
{
  return MEMORY[0x24BE51EB0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BEBD2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BEBE278]((__n128)size, *(__n128 *)&size.height);
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

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x24BDF9020](pixelBuffer, options, imageOut);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF78]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_250FA0A40();
}

void operator delete(void *__p)
{
  off_250FA0A48(__p);
}

uint64_t operator delete()
{
  return off_250FA0A50();
}

uint64_t operator new[]()
{
  return off_250FA0A58();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250FA0A60(__sz);
}

uint64_t operator new()
{
  return off_250FA0A68();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint64_t itk_dispatchMainAfterDelay()
{
  return MEMORY[0x24BE51ED8]();
}

uint64_t itk_isiOS()
{
  return MEMORY[0x24BE51EF8]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

