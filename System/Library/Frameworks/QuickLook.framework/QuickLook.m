_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BA458C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

void sub_20D4F869C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D4F87C8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D4F88E0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D4F8A0C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D4F8B68(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20D4F8C94(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D4F8DCC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D4F8F28(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D4F9044(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D4F9108(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D4F9450(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D4F95DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D4F9974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D4FA530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D4FACF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  id *v35;

  objc_destroyWeak(v35);
  _Block_object_dispose(&a35, 8);
  objc_destroyWeak(&location);
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

void sub_20D4FB47C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D4FBA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D4FBBAC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D4FBC74(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D4FBDE0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D4FC0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D4FC22C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D4FDCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;
  uint64_t v10;

  objc_destroyWeak(location);
  objc_destroyWeak(v9);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

void sub_20D4FE8E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D50018C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D500254(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D500798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20D5015E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_20D502000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D5024AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D5046DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D50557C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D505654(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D506BEC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20D506D7C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void QLPXAffineTransformDecomposeTranslationScaleRotation(uint64_t a1, _QWORD *a2, double *a3, double *a4, double *a5)
{
  uint64_t v10;
  uint64_t v11;
  long double v12;
  double v13;
  double v14;
  __double2 v15;
  double v16;
  double v17;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13 = *(double *)a1;
  v12 = *(double *)(a1 + 8);
  v14 = atan2(v12, *(long double *)a1);
  v15 = __sincos_stret(v14);
  if (fabs(v15.__cosval) <= fabs(v15.__sinval))
  {
    v16 = v12 / v15.__sinval;
    v17 = -*(double *)(a1 + 16) / v15.__sinval;
    if (!a2)
      goto LABEL_6;
    goto LABEL_5;
  }
  v16 = v13 / v15.__cosval;
  v17 = *(double *)(a1 + 24) / v15.__cosval;
  if (a2)
  {
LABEL_5:
    *a2 = v10;
    a2[1] = v11;
  }
LABEL_6:
  if (a3)
    *a3 = v16;
  if (a4)
    *a4 = v17;
  if (a5)
    *a5 = v14;
}

double QLPXDerivative(_QWORD *a1, double a2)
{
  double v4;
  double (*v5)(double);
  _QWORD *v6;
  double v7;
  double v8;

  v4 = a2 + 0.03125;
  v5 = (double (*)(double))a1[2];
  v6 = a1;
  v7 = v5(v4);
  v8 = ((double (*)(id, double))a1[2])(v6, a2 + -0.03125);

  return (v7 - v8) * 16.0;
}

void sub_20D50C2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

double maxLoadingItemForItem(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  v2 = 0.0;
  if (objc_msgSend(v1, "useLoadingTimeout"))
  {
    objc_msgSend(v1, "maxLoadingTime");
    if (v3 <= 0.0)
      v2 = 0.75;
    else
      v2 = v3;
  }

  return v2;
}

void sub_20D50EB00(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_20D50EDE4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D50EECC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D50F480(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D50FBBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 192));
  objc_destroyWeak((id *)(v1 - 184));
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_20D50FE40(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D510EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D511010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D511194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D511280(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D5113D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D5114BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D5126C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D512788(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D51299C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D512D2C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D513720(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D5137F0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D517A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_20D517CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D51A724(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_20D51A848(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D51A9FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D51AAA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D51C06C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

float64_t QLConvertPointFromAnchorPointToNewAnchorPoint(float64x2_t *a1, float64x2_t a2, float64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  a2.f64[1] = a3;
  *(_QWORD *)&a2.f64[0] = *(_OWORD *)&vaddq_f64(vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a7 * a13), *a1, a6 * a12)), vsubq_f64(a2, vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a5 * a13), *a1, a4 * a12))));
  return a2.f64[0];
}

BOOL QLSizeAspectRatioEqualToSizeAspectRatioWithTolerance(double a1, double a2, double a3, double a4)
{
  return vabdd_f64(a1 / a2, a3 / a4) <= 0.01;
}

void sub_20D521D10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D521DC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D527984(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D527B20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D529058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_20D529F78(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&STACK[0x258], 8);
  _Block_object_dispose(&STACK[0x278], 8);
  _Unwind_Resume(a1);
}

void sub_20D52A86C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

id QLWaveformWithPowerLevels(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  unint64_t v12;
  uint64_t v13;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD618]), "initWithSize:", (double)a2 * 3.0, 30.0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __QLWaveformWithPowerLevels_block_invoke;
  v10[3] = &unk_24C725D50;
  v11 = v5;
  v12 = a2;
  v13 = a1;
  v7 = v5;
  objc_msgSend(v6, "imageWithActions:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_20D52C384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D52D5B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D52E0CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D5307C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_20D531084(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D531260(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D53178C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D531D40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _QLShouldNotify()
{
  void *v0;
  void *v1;
  NSObject **v2;
  NSObject *v3;
  const __CFString *v4;
  int v6;
  void *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if ((_QLShouldNotify___QLDidDetermineShouldNotify & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "bundleIdentifier");
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    _QLShouldNotify___QLShouldNotifyFlag = objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.quicklook"));
    _QLShouldNotify___QLDidDetermineShouldNotify = 1;
    v2 = (NSObject **)MEMORY[0x24BE7BF48];
    v3 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = CFSTR("YES");
      if (!_QLShouldNotify___QLShouldNotifyFlag)
        v4 = CFSTR("NO");
      v6 = 138412546;
      v7 = v1;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_20D4F5000, v3, OS_LOG_TYPE_DEBUG, "Determining if should notify: Bundle identifier = %@, Should notify = %@ #Testing", (uint8_t *)&v6, 0x16u);
    }

  }
  return _QLShouldNotify___QLShouldNotifyFlag;
}

void QLNotifySelector(const char *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  NSStringFromSelector(a1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  QLNotify(v4, v3);

}

void QLNotify(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  NSObject **v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (_QLShouldNotify())
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = v8 * 1000.0;
    *(float *)&v9 = v9;
    objc_msgSend(v6, "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("_timestamp"));

    v11 = (NSObject **)MEMORY[0x24BE7BF48];
    v12 = *MEMORY[0x24BE7BF48];
    if (!*MEMORY[0x24BE7BF48])
    {
      QLSInitLogging();
      v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412546;
      v15 = v3;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_20D4F5000, v12, OS_LOG_TYPE_DEBUG, "Sending notification %@ with context %@. #Testing", (uint8_t *)&v14, 0x16u);
    }
    +[QLNotificationCenter sharedInstance](QLNotificationCenter, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:userInfo:", v3, v5);

  }
}

void sub_20D533528(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

id QLSLogHandle()
{
  void **v0;
  void *v1;

  v0 = (void **)MEMORY[0x24BE7BF48];
  v1 = (void *)*MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v1 = *v0;
  }
  return v1;
}

void sub_20D53388C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D5339AC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D534434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D536CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D537FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20D5381E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_20D539ED0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D53A050(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D53A188(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D53A218(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D53A2A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D53A31C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D53A470(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D53A60C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D53BB8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

__SecTask *_QLGetStringEntitlement(const __CFString *a1)
{
  __SecTask *v1;
  CFTypeID TypeID;

  v1 = _QLCopyEntitlementValue(a1);
  if (v1)
  {
    TypeID = CFStringGetTypeID();
    if (TypeID != CFGetTypeID(v1))
    {
      CFRelease(v1);
      v1 = 0;
    }
  }
  return v1;
}

__SecTask *_QLCopyEntitlementValue(const __CFString *a1)
{
  __SecTask *result;
  __SecTask *v3;
  CFTypeRef v4;

  result = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  if (result)
  {
    v3 = result;
    v4 = SecTaskCopyValueForEntitlement(result, a1, 0);
    CFRelease(v3);
    return (__SecTask *)v4;
  }
  return result;
}

BOOL _QLGetBoolEntitlement(const __CFString *a1)
{
  __SecTask *v1;
  __SecTask *v2;
  CFTypeID TypeID;
  _BOOL8 v4;

  v1 = _QLCopyEntitlementValue(a1);
  if (!v1)
    return 0;
  v2 = v1;
  TypeID = CFBooleanGetTypeID();
  v4 = TypeID == CFGetTypeID(v2) && CFEqual(v2, (CFTypeRef)*MEMORY[0x24BDBD270]) != 0;
  CFRelease(v2);
  return v4;
}

id _QLGetOpenInAppClaimBindingForDocumentProxy(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject **v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject **v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject **v21;
  NSObject *v22;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = *MEMORY[0x24BDC1620];
    v27 = 0;
    objc_msgSend(v1, "availableClaimBindingsForMode:handlerRank:error:", 0, v3, &v27);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v27;
    if (!v4 || !objc_msgSend(v4, "count"))
    {
      v16 = (NSObject **)MEMORY[0x24BE7BF48];
      v17 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v17 = *v16;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = v17;
        objc_msgSend(v2, "typeIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v19;
        v30 = 2112;
        v31 = v5;
        _os_log_impl(&dword_20D4F5000, v18, OS_LOG_TYPE_ERROR, "Could not obtain Open In app for document proxy of content type %@. Error: %@ #Generic", buf, 0x16u);

      }
      v20 = 0;
      goto LABEL_24;
    }
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "supportsOpenInPlace"))
    {
      objc_msgSend(v7, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[QLUtilitiesInternal getCurrentApplicationBundleIdentifierUsingEntitlement](QLUtilitiesInternal, "getCurrentApplicationBundleIdentifierUsingEntitlement");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      v11 = (NSObject **)MEMORY[0x24BE7BF48];
      v12 = *MEMORY[0x24BE7BF48];
      if ((v10 & 1) == 0)
      {
        if (!v12)
        {
          QLSInitLogging();
          v12 = *v11;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v24 = v12;
          objc_msgSend(v7, "bundleIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "typeIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v29 = v25;
          v30 = 2112;
          v31 = v2;
          v32 = 2112;
          v33 = v26;
          _os_log_impl(&dword_20D4F5000, v24, OS_LOG_TYPE_INFO, "First owner app: %@ for document proxy: %@ of type: %@ supports Open In, returning it. #Generic", buf, 0x20u);

        }
        v20 = v6;
        goto LABEL_23;
      }
      if (!v12)
      {
        QLSInitLogging();
        v12 = *v11;
      }
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
LABEL_22:
        v20 = 0;
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      v13 = v12;
      objc_msgSend(v7, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "typeIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = v14;
      v30 = 2112;
      v31 = v2;
      v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_20D4F5000, v13, OS_LOG_TYPE_INFO, "First owner app: %@ for document proxy: %@ of type: %@ supports Open In but is the current app, returning nil. #Generic", buf, 0x20u);

    }
    else
    {
      v21 = (NSObject **)MEMORY[0x24BE7BF48];
      v22 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v22 = *v21;
      }
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        goto LABEL_22;
      v13 = v22;
      objc_msgSend(v2, "typeIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v2;
      v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_20D4F5000, v13, OS_LOG_TYPE_INFO, "First owner app for document proxy: %@ of type: %@ does not support Open In, returning nil. #Generic", buf, 0x16u);
    }

    goto LABEL_22;
  }
  v20 = 0;
LABEL_25:

  return v20;
}

id _QLGetOpenInAppClaimBindingForContentType(void *a1)
{
  id v1;
  id v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__8;
  v8 = __Block_byref_object_dispose__8;
  v9 = 0;
  v3 = a1;
  QLRunInMainThreadSync();
  v1 = (id)v5[5];

  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20D53D244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

id _QLGetOpenInAppClaimBindingForItem(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "previewItemType") == 2 || objc_msgSend(v1, "previewItemType") == 3)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(v1, "previewItemContentType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _QLGetOpenInAppClaimBindingForContentType(v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void sub_20D53F40C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D541FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D5420CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D545254(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x360], 8);
  _Unwind_Resume(a1);
}

void sub_20D546AE0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D546C60(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t QLGetScaleForAnimatedImageWithSize()
{
  return QLImageWithSizeShouldNotBeScaled();
}

void sub_20D54C4AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D54E154(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20D54E7EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20D54F1E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D54F32C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D550FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D5510FC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D551798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D552370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 232));
  _Unwind_Resume(a1);
}

void sub_20D5524BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D552908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D552AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D5537C4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_20D553A40(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20D553CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D5541D0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_20D555AC8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 48));
  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_20D555BC0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D556114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_20D557DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D557E80(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D557F04(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D558034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D558134(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D558340(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D5583CC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D55889C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D558940(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D558E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v21);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D558FB8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D559D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D55A0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D55A24C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20D55A310(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D55A984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;
  id *v30;
  uint64_t v31;

  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v31 - 248));
  _Unwind_Resume(a1);
}

void sub_20D55AC40(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D55F3BC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20D55FA8C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D560690(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_20D562C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D563D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v20);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D563E1C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D563F40(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D5660FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20D567AE0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20D569DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak((id *)(v19 - 120));
  _Unwind_Resume(a1);
}

void sub_20D569EDC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D56AE48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20D56AF9C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D56B260(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20D56D638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20D56D6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t sub_20D56EBA8()
{
  uint64_t v0;

  v0 = sub_20D5A67E0();
  __swift_allocate_value_buffer(v0, qword_2549B7EE8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2549B7EE8);
  return sub_20D5A67D4();
}

uint64_t QLAccessoryViewWrapper.hostProxy.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  sub_20D5A6A38();
  return v1;
}

uint64_t sub_20D56EC54@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  result = sub_20D5A6A38();
  *a1 = v3;
  return result;
}

uint64_t sub_20D56EC98()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  return sub_20D5A6A44();
}

uint64_t QLAccessoryViewWrapper.hostProxy.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  return sub_20D5A6A44();
}

void (*QLAccessoryViewWrapper.hostProxy.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  v2[4] = sub_20D5A6A2C();
  return sub_20D56ED6C;
}

void sub_20D56ED6C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t QLAccessoryViewWrapper.$hostProxy.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  return sub_20D5A6A50();
}

uint64_t QLAccessoryViewWrapper.init(hostProxy:)()
{
  type metadata accessor for QLAccessoryAppExtensionSceneProxy(0);
  sub_20D570178(&qword_2549B7F78, type metadata accessor for QLAccessoryAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAccessoryAppExtensionSceneProxy);
  return sub_20D5A6A5C();
}

id QLAccessoryViewWrapper.makeUIViewController(context:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t KeyPath;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD v30[4];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v1 = v0;
  v2 = type metadata accessor for QLAccessoryViewWrapper();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v31 = (uint64_t)v30 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v30 - v8;
  if (qword_2549B7EE0 != -1)
    swift_once();
  v10 = sub_20D5A67E0();
  v11 = __swift_project_value_buffer(v10, (uint64_t)qword_2549B7EE8);
  sub_20D56FA74(v1, (uint64_t)v9);
  v30[3] = v11;
  v12 = sub_20D5A67C8();
  v13 = sub_20D5A6CFC();
  v14 = os_log_type_enabled(v12, v13);
  v30[2] = v2;
  if (v14)
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v33 = v16;
    *(_DWORD *)v15 = 136315138;
    v30[1] = v15 + 4;
    sub_20D56FA74((uint64_t)v9, v31);
    v17 = sub_20D5A6B4C();
    v32 = sub_20D56FB0C(v17, v18, &v33);
    sub_20D5A6DB0();
    swift_bridgeObjectRelease();
    sub_20D56FAB8((uint64_t)v9);
    _os_log_impl(&dword_20D4F5000, v12, v13, "Configuring %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v16, -1, -1);
    MEMORY[0x212BA4658](v15, -1, -1);
  }
  else
  {
    sub_20D56FAB8((uint64_t)v9);
  }

  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB08]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  sub_20D5A6A38();
  v20 = v33;
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  v30[-2] = v20;
  v30[-1] = v19;
  v33 = v20;
  sub_20D570178(&qword_2549B7F78, type metadata accessor for QLAccessoryAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAccessoryAppExtensionSceneProxy);
  v22 = v19;
  sub_20D5A6678();
  swift_release();
  swift_release();

  sub_20D56FA74(v1, (uint64_t)v5);
  v23 = sub_20D5A67C8();
  v24 = sub_20D5A6CFC();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v33 = v26;
    *(_DWORD *)v25 = 136315138;
    sub_20D56FA74((uint64_t)v5, v31);
    v27 = sub_20D5A6B4C();
    v32 = sub_20D56FB0C(v27, v28, &v33);
    sub_20D5A6DB0();
    swift_bridgeObjectRelease();
    sub_20D56FAB8((uint64_t)v5);
    _os_log_impl(&dword_20D4F5000, v23, v24, "Configured %s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v26, -1, -1);
    MEMORY[0x212BA4658](v25, -1, -1);
  }
  else
  {
    sub_20D56FAB8((uint64_t)v5);
  }

  return v22;
}

uint64_t type metadata accessor for QLAccessoryViewWrapper()
{
  uint64_t result;

  result = qword_2549B8100;
  if (!qword_2549B8100)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20D56F2D0()
{
  return sub_20D5A6900();
}

uint64_t sub_20D56F308()
{
  sub_20D570178(&qword_2549B81C8, (uint64_t (*)(uint64_t))type metadata accessor for QLAccessoryViewWrapper, (uint64_t)&protocol conformance descriptor for QLAccessoryViewWrapper);
  return sub_20D5A693C();
}

uint64_t sub_20D56F370()
{
  sub_20D570178(&qword_2549B81C8, (uint64_t (*)(uint64_t))type metadata accessor for QLAccessoryViewWrapper, (uint64_t)&protocol conformance descriptor for QLAccessoryViewWrapper);
  return sub_20D5A690C();
}

uint64_t sub_20D56F3D8()
{
  return sub_20D5A69C0();
}

void sub_20D56F3F0()
{
  sub_20D570178(&qword_2549B81C8, (uint64_t (*)(uint64_t))type metadata accessor for QLAccessoryViewWrapper, (uint64_t)&protocol conformance descriptor for QLAccessoryViewWrapper);
  sub_20D5A6930();
  __break(1u);
}

uint64_t sub_20D56F42C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D570178(&qword_2549B7F78, type metadata accessor for QLAccessoryAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAccessoryAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v3 + 16);
  *a2 = result;
  return result;
}

void sub_20D56F4BC(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  sub_20D570178(&qword_2549B7F78, type metadata accessor for QLAccessoryAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAccessoryAppExtensionSceneProxy);
  v2 = v1;
  sub_20D5A6678();
  swift_release();

}

_QWORD *sub_20D56F570@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_20D56F580(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_20D56F58C(uint64_t a1, uint64_t a2)
{
  return sub_20D56F8E8(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_20D56F5AC(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_20D5A6AE0();
  *a2 = 0;
  return result;
}

uint64_t sub_20D56F620(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_20D5A6AEC();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_20D56F69C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_20D5A6AF8();
  v2 = sub_20D5A6AD4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20D56F6E4()
{
  sub_20D570178(&qword_2549B81B8, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAttributeKey, (uint64_t)&unk_20D5B1D38);
  sub_20D570178(&qword_2549B81C0, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAttributeKey, (uint64_t)&unk_20D5B1B1C);
  return sub_20D5A6EDC();
}

uint64_t sub_20D56F768@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_20D5A6AF8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20D56F790()
{
  sub_20D570178(&qword_2549B81A8, (uint64_t (*)(uint64_t))type metadata accessor for DocumentType, (uint64_t)&unk_20D5B1C74);
  sub_20D570178(&qword_2549B81B0, (uint64_t (*)(uint64_t))type metadata accessor for DocumentType, (uint64_t)&unk_20D5B1C1C);
  return sub_20D5A6EDC();
}

uint64_t sub_20D56F814@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_20D5A6AD4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20D56F858()
{
  sub_20D570178(&qword_2549B8200, (uint64_t (*)(uint64_t))type metadata accessor for DocumentReadingOptionKey, (uint64_t)&unk_20D5B1EEC);
  sub_20D570178(&qword_2549B8208, (uint64_t (*)(uint64_t))type metadata accessor for DocumentReadingOptionKey, (uint64_t)&unk_20D5B1E4C);
  return sub_20D5A6EDC();
}

uint64_t sub_20D56F8DC(uint64_t a1, uint64_t a2)
{
  return sub_20D56F8E8(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_20D56F8E8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_20D5A6AF8();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_20D56F924()
{
  sub_20D5A6AF8();
  sub_20D5A6B64();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D56F964()
{
  uint64_t v0;

  sub_20D5A6AF8();
  sub_20D5A6F60();
  sub_20D5A6B64();
  v0 = sub_20D5A6F78();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_20D56F9D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_20D5A6AF8();
  v2 = v1;
  if (v0 == sub_20D5A6AF8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_20D5A6F0C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_20D56FA74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for QLAccessoryViewWrapper();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D56FAB8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for QLAccessoryViewWrapper();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20D56FAF4()
{
  return sub_20D576960();
}

uint64_t sub_20D56FB0C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_20D56FBDC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_20D570648((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_20D570648((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_20D56FBDC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_20D5A6DBC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_20D56FD94(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_20D5A6E40();
  if (!v8)
  {
    sub_20D5A6E88();
    __break(1u);
LABEL_17:
    result = sub_20D5A6ED0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_20D56FD94(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_20D56FE28(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_20D570000(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_20D570000(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_20D56FE28(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_20D56FF9C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_20D5A6E28();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_20D5A6E88();
      __break(1u);
LABEL_10:
      v2 = sub_20D5A6B94();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_20D5A6ED0();
    __break(1u);
LABEL_14:
    result = sub_20D5A6E88();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_20D56FF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B81D0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_20D570000(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549B81D0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_20D5A6ED0();
  __break(1u);
  return result;
}

uint64_t sub_20D57014C()
{
  return sub_20D570178(&qword_2549B80A0, (uint64_t (*)(uint64_t))type metadata accessor for QLAccessoryViewWrapper, (uint64_t)&protocol conformance descriptor for QLAccessoryViewWrapper);
}

uint64_t sub_20D570178(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212BA45A4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20D5701B8()
{
  return MEMORY[0x24BDF5560];
}

uint64_t initializeBufferWithCopyOfBuffer for QLAccessoryViewWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for QLAccessoryViewWrapper(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for QLAccessoryViewWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for QLAccessoryViewWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for QLAccessoryViewWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for QLAccessoryViewWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for QLAccessoryViewWrapper()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D570368(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for QLAccessoryViewWrapper()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D5703B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B7F70);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_20D5703F8()
{
  unint64_t v0;

  sub_20D570460();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20D570460()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549B8110)
  {
    type metadata accessor for QLAccessoryAppExtensionSceneProxy(255);
    v0 = sub_20D5A6A68();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2549B8110);
  }
}

void type metadata accessor for QLPreviewItemEditingMode(uint64_t a1)
{
  sub_20D5706F0(a1, &qword_2549B8140);
}

void type metadata accessor for QLPreviewItemType(uint64_t a1)
{
  sub_20D5706F0(a1, &qword_2549B8148);
}

void type metadata accessor for QLVisibilityState(uint64_t a1)
{
  sub_20D5706F0(a1, &qword_2549B8150);
}

void type metadata accessor for QLPreviewControllerFirstTimeAppearanceActions(uint64_t a1)
{
  sub_20D5706F0(a1, &qword_2549B8158);
}

void type metadata accessor for DocumentType(uint64_t a1)
{
  sub_20D5706F0(a1, &qword_2549B8160);
}

void type metadata accessor for DocumentAttributeKey(uint64_t a1)
{
  sub_20D5706F0(a1, &qword_2549B8168);
}

void type metadata accessor for CGContext(uint64_t a1)
{
  sub_20D5706F0(a1, &qword_2549B8170);
}

uint64_t sub_20D570540()
{
  return sub_20D570178(&qword_2549B8178, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAttributeKey, (uint64_t)&unk_20D5B1AE4);
}

uint64_t sub_20D57056C()
{
  return sub_20D570178(&qword_2549B8180, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAttributeKey, (uint64_t)&unk_20D5B1ABC);
}

uint64_t sub_20D570598()
{
  return sub_20D570178(&qword_2549B8188, (uint64_t (*)(uint64_t))type metadata accessor for DocumentType, (uint64_t)&unk_20D5B1BE4);
}

uint64_t sub_20D5705C4()
{
  return sub_20D570178(&qword_2549B8190, (uint64_t (*)(uint64_t))type metadata accessor for DocumentType, (uint64_t)&unk_20D5B1BBC);
}

uint64_t sub_20D5705F0()
{
  return sub_20D570178(&qword_2549B8198, (uint64_t (*)(uint64_t))type metadata accessor for DocumentType, (uint64_t)&unk_20D5B1C4C);
}

uint64_t sub_20D57061C()
{
  return sub_20D570178(&qword_2549B81A0, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAttributeKey, (uint64_t)&unk_20D5B1B4C);
}

uint64_t sub_20D570648(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void type metadata accessor for CGColor(uint64_t a1)
{
  sub_20D5706F0(a1, &qword_2549B81D8);
}

void type metadata accessor for DocumentReadingOptionKey(uint64_t a1)
{
  sub_20D5706F0(a1, &qword_2549B81E0);
}

void sub_20D5706F0(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_20D570734()
{
  return sub_20D570178(&qword_2549B81E8, (uint64_t (*)(uint64_t))type metadata accessor for DocumentReadingOptionKey, (uint64_t)&unk_20D5B1E14);
}

uint64_t sub_20D570760()
{
  return sub_20D570178(&qword_2549B81F0, (uint64_t (*)(uint64_t))type metadata accessor for DocumentReadingOptionKey, (uint64_t)&unk_20D5B1DEC);
}

uint64_t sub_20D57078C()
{
  return sub_20D570178(&qword_2549B81F8, (uint64_t (*)(uint64_t))type metadata accessor for DocumentReadingOptionKey, (uint64_t)&unk_20D5B1E7C);
}

uint64_t sub_20D5707C0()
{
  return sub_20D56FAF4();
}

uint64_t sub_20D5707D4()
{
  uint64_t v0;

  v0 = sub_20D5A67E0();
  __swift_allocate_value_buffer(v0, qword_2549B82D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2549B82D0);
  return sub_20D5A67D4();
}

id sub_20D570850()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_mapTableWithKeyOptions_valueOptions_, 0, 5);
  qword_2549B82E8 = (uint64_t)result;
  return result;
}

void sub_20D570890()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;

  swift_getKeyPath();
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  if (MEMORY[0x212BA4700](v0 + 16))
  {
    objc_opt_self();
    v1 = swift_dynamicCastObjCClass();
    if (v1)
    {
      v2 = (void *)v1;
      if (qword_2549B7F08 != -1)
        swift_once();
      v3 = (id)qword_2549B82E8;
      swift_unknownObjectRetain();
      v4 = objc_msgSend(v2, sel_uuid);
      if (v4)
      {
        v5 = v4;
        objc_msgSend(v3, sel_setObject_forKey_, v2, v4);

        swift_unknownObjectRelease_n();
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_20D5709DC()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  return MEMORY[0x212BA4700](v0 + 16);
}

uint64_t sub_20D570A64@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v3 + 16);
  *a2 = result;
  return result;
}

uint64_t sub_20D570AF4()
{
  swift_getKeyPath();
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  swift_unknownObjectRetain();
  sub_20D5A6678();
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t sub_20D570BAC()
{
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRetain();
  sub_20D570890();
  return swift_unknownObjectRelease();
}

uint64_t sub_20D570BF8()
{
  swift_getKeyPath();
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  return swift_unknownObjectRetain();
}

uint64_t sub_20D570C80@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 24);
  return swift_unknownObjectRetain();
}

uint64_t sub_20D570D10()
{
  swift_getKeyPath();
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  swift_unknownObjectRetain();
  sub_20D5A6678();
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t QLAppExtensionSceneProxy.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v0 + 24) = 0;
  sub_20D5A66A8();
  return v0;
}

uint64_t QLAppExtensionSceneProxy.init()()
{
  uint64_t v0;

  swift_unknownObjectWeakInit();
  *(_QWORD *)(v0 + 24) = 0;
  sub_20D5A66A8();
  return v0;
}

uint64_t sub_20D570E64(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 32) = a1;
  return swift_task_switch();
}

void *sub_20D570E80()
{
  uint64_t v0;
  uint64_t v1;
  void *result;

  v1 = *(_QWORD *)(v0 + 24);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v1;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = (void *)MEMORY[0x212BA4700](v1 + 16);
  if (result)
  {
    objc_msgSend(result, sel_setAllowInteractiveTransitions_, *(unsigned __int8 *)(v0 + 32));
    swift_unknownObjectRelease();
    return (void *)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for QLAppExtensionSceneProxy(uint64_t a1)
{
  return sub_20D576D9C(a1, (uint64_t *)&unk_2549B8380);
}

uint64_t sub_20D571084(char a1, void *aBlock, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v6;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  swift_retain();
  v6 = swift_task_alloc();
  v3[4] = v6;
  *(_QWORD *)v6 = v3;
  *(_QWORD *)(v6 + 8) = sub_20D577D3C;
  *(_QWORD *)(v6 + 24) = a3;
  *(_BYTE *)(v6 + 32) = a1;
  return swift_task_switch();
}

uint64_t sub_20D571110()
{
  uint64_t v0;
  uint64_t result;
  void *v2;
  void *v3;

  swift_getKeyPath();
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v0 + 16);
  if (result)
  {
    v2 = (void *)result;
    v3 = (void *)sub_20D5A6AD4();
    objc_msgSend(v2, sel_setHostApplicationBundleIdentifier_, v3);

    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_20D5711F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t KeyPath;
  void *result;
  char v21;
  uint64_t v23;

  v6 = v5;
  if (qword_2549B7F00 != -1)
    swift_once();
  v11 = sub_20D5A67E0();
  __swift_project_value_buffer(v11, (uint64_t)qword_2549B82D0);
  v12 = sub_20D5A67C8();
  v13 = sub_20D5A6D08();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v21 = a5;
    v15 = a2;
    v16 = a4;
    v17 = swift_slowAlloc();
    v23 = v17;
    *(_DWORD *)v14 = 136315138;
    sub_20D56FB0C(0xD00000000000005ALL, 0x800000020D5BF2A0, &v23);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v12, v13, "Service side: %s", v14, 0xCu);
    swift_arrayDestroy();
    v18 = v17;
    a4 = v16;
    a2 = v15;
    a5 = v21;
    MEMORY[0x212BA4658](v18, -1, -1);
    MEMORY[0x212BA4658](v14, -1, -1);
  }

  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  v23 = v6;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  swift_unknownObjectRetain();
  sub_20D5A6678();
  swift_unknownObjectRelease();
  swift_release();
  swift_getKeyPath();
  v23 = v6;
  sub_20D5A6684();
  swift_release();
  result = (void *)MEMORY[0x212BA4700](v6 + 16);
  if (result)
  {
    objc_msgSend(result, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen_, a1, a2, a3, a4, a5 & 1);
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D5714B4()
{
  return sub_20D577CD8();
}

void *sub_20D571550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t KeyPath;
  void *result;
  uint64_t v17;

  v5 = v4;
  if (qword_2549B7F00 != -1)
    swift_once();
  v10 = sub_20D5A67E0();
  __swift_project_value_buffer(v10, (uint64_t)qword_2549B82D0);
  v11 = sub_20D5A67C8();
  v12 = sub_20D5A6D08();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v17 = v14;
    *(_DWORD *)v13 = 136315138;
    sub_20D56FB0C(0xD00000000000004FLL, 0x800000020D5BF300, &v17);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v11, v12, "Service side: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v14, -1, -1);
    MEMORY[0x212BA4658](v13, -1, -1);
  }

  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  v17 = v5;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  swift_unknownObjectRetain();
  sub_20D5A6678();
  swift_unknownObjectRelease();
  swift_release();
  swift_getKeyPath();
  v17 = v5;
  sub_20D5A6684();
  swift_release();
  result = (void *)MEMORY[0x212BA4700](v5 + 16);
  if (result)
  {
    objc_msgSend(result, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_, a1, a2, a3, a4);
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_20D57188C(uint64_t a1, char a2)
{
  return sub_20D574774(a1, a2, 0xD000000000000027, 0x800000020D5BF350, (SEL *)&selRef_setCurrentPreviewItemIndex_animated_);
}

void *sub_20D5718BC(char a1)
{
  return sub_20D575BD0(a1, 0xD000000000000025, 0x800000020D5BF380, (SEL *)&selRef_hostApplicationDidEnterBackground_);
}

void *sub_20D5718EC()
{
  return sub_20D575160(0xD000000000000020, 0x800000020D5BF3B0, (SEL *)&selRef_hostApplicationDidBecomeActive);
}

uint64_t sub_20D57191C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 136) = a1;
  *(_QWORD *)(v2 + 144) = v1;
  return swift_task_switch();
}

uint64_t sub_20D571934()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (qword_2549B7F00 != -1)
    swift_once();
  v1 = sub_20D5A67E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_2549B82D0);
  v2 = sub_20D5A67C8();
  v3 = sub_20D5A6D08();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v10 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[10] = sub_20D56FB0C(0xD000000000000014, 0x800000020D5BF400, &v10);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v5, -1, -1);
    MEMORY[0x212BA4658](v4, -1, -1);
  }

  v6 = v0[18];
  swift_getKeyPath();
  v0[10] = v6;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v6 + 16);
  v0[19] = result;
  if (result)
  {
    v8 = (void *)result;
    v9 = v0[17];
    v0[7] = v0 + 15;
    v0[2] = v0;
    v0[3] = sub_20D571B8C;
    v0[14] = swift_continuation_init();
    v0[10] = MEMORY[0x24BDAC760];
    v0[11] = 0x40000000;
    v0[12] = sub_20D571C14;
    v0[13] = &block_descriptor;
    objc_msgSend(v8, sel_toolbarButtonsForTraitCollection_withCompletionHandler_, v9, v0 + 10);
    return swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D571B8C()
{
  return swift_task_switch();
}

uint64_t sub_20D571BD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_20D571C14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v1 = *(_QWORD *)(a1 + 32);
  sub_20D577BD0(0, &qword_2549BA720);
  v2 = sub_20D5A6BE8();
  v3 = sub_20D5A6BE8();
  v4 = *(uint64_t **)(*(_QWORD *)(v1 + 64) + 40);
  *v4 = v2;
  v4[1] = v3;
  return swift_continuation_resume();
}

uint64_t sub_20D571DBC(void *a1, void *aBlock, uint64_t a3)
{
  _QWORD *v3;
  id v6;
  _QWORD *v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  v3[5] = v7;
  *v7 = v3;
  v7[1] = sub_20D571E4C;
  v7[17] = v6;
  v7[18] = a3;
  return swift_task_switch();
}

uint64_t sub_20D571E4C()
{
  uint64_t *v0;
  void (**v1)(_QWORD, _QWORD, _QWORD);
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v1 = *(void (***)(_QWORD, _QWORD, _QWORD))(*v0 + 32);
  v2 = *(void **)(*v0 + 16);
  v6 = *v0;
  swift_task_dealloc();
  swift_release();

  sub_20D577BD0(0, &qword_2549BA720);
  v3 = (void *)sub_20D5A6BDC();
  v4 = (void *)sub_20D5A6BDC();
  ((void (**)(_QWORD, void *, void *))v1)[2](v1, v3, v4);

  _Block_release(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_20D571F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[16] = a2;
  v3[17] = v2;
  v3[15] = a1;
  return swift_task_switch();
}

uint64_t sub_20D571F48()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (qword_2549B7F00 != -1)
    swift_once();
  v1 = sub_20D5A67E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_2549B82D0);
  v2 = sub_20D5A67C8();
  v3 = sub_20D5A6D08();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v10 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[10] = sub_20D56FB0C(0xD000000000000025, 0x800000020D5BF420, &v10);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v5, -1, -1);
    MEMORY[0x212BA4658](v4, -1, -1);
  }

  v6 = v0[17];
  swift_getKeyPath();
  v0[10] = v6;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v6 + 16);
  v0[18] = result;
  if (result)
  {
    v8 = (void *)result;
    v9 = sub_20D5A6AD4();
    v0[19] = v9;
    v0[2] = v0;
    v0[3] = sub_20D5721A4;
    v0[14] = swift_continuation_init();
    v0[10] = MEMORY[0x24BDAC760];
    v0[11] = 0x40000000;
    v0[12] = sub_20D572224;
    v0[13] = &block_descriptor_6;
    objc_msgSend(v8, sel_toolbarButtonPressedWithIdentifier_completionHandler_, v9, v0 + 10);
    return swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D5721A4()
{
  return swift_task_switch();
}

uint64_t sub_20D5721F0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 152);
  swift_unknownObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D572224()
{
  return swift_continuation_resume();
}

uint64_t sub_20D572360(int a1, void *aBlock, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  v5 = sub_20D5A6AF8();
  v7 = v6;
  v3[4] = v6;
  swift_retain();
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_20D572400;
  v8[16] = v7;
  v8[17] = a3;
  v8[15] = v5;
  return swift_task_switch();
}

uint64_t sub_20D572400()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  uint64_t v3;

  v1 = *(void (***)(_QWORD))(*v0 + 24);
  v3 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_20D572478()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_20D572490()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  uint64_t v9;

  if (qword_2549B7F00 != -1)
    swift_once();
  v1 = sub_20D5A67E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_2549B82D0);
  v2 = sub_20D5A67C8();
  v3 = sub_20D5A6D08();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[10] = sub_20D56FB0C(0xD00000000000001BLL, 0x800000020D5BF450, &v9);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v5, -1, -1);
    MEMORY[0x212BA4658](v4, -1, -1);
  }

  v6 = v0[15];
  swift_getKeyPath();
  v0[10] = v6;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v6 + 16);
  v0[16] = result;
  if (result)
  {
    v8 = (void *)result;
    v0[7] = v0 + 17;
    v0[2] = v0;
    v0[3] = sub_20D5726E0;
    v0[14] = swift_continuation_init();
    v0[10] = MEMORY[0x24BDAC760];
    v0[11] = 0x40000000;
    v0[12] = sub_20D572764;
    v0[13] = &block_descriptor_7;
    objc_msgSend(v8, sel_shouldDisplayLockActivityWithCompletionHandler_, v0 + 10);
    return swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D5726E0()
{
  return swift_task_switch();
}

uint64_t sub_20D57272C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(v0 + 136);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_20D572764(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t sub_20D572898(const void *a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_20D572910;
  v4[15] = a2;
  return swift_task_switch();
}

uint64_t sub_20D572910(char a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v5;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 24);
  v5 = *v1;
  swift_task_dealloc();
  swift_release();
  v3[2](v3, a1 & 1);
  _Block_release(v3);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

void *sub_20D572988()
{
  return sub_20D575160(0xD00000000000001BLL, 0x800000020D5BF470, (SEL *)&selRef_requestLockForCurrentItem);
}

uint64_t sub_20D5729B8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  v4 = swift_retain();
  a3(v4);
  return swift_release();
}

uint64_t sub_20D5729E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = v0;
  return swift_task_switch();
}

uint64_t sub_20D5729FC()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  uint64_t v9;

  if (qword_2549B7F00 != -1)
    swift_once();
  v1 = sub_20D5A67E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_2549B82D0);
  v2 = sub_20D5A67C8();
  v3 = sub_20D5A6D08();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[10] = sub_20D56FB0C(0x616D6D6F4379656BLL, 0xED0000292873646ELL, &v9);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v5, -1, -1);
    MEMORY[0x212BA4658](v4, -1, -1);
  }

  v6 = v0[16];
  swift_getKeyPath();
  v0[10] = v6;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v6 + 16);
  v0[17] = result;
  if (result)
  {
    v8 = (void *)result;
    v0[7] = v0 + 15;
    v0[2] = v0;
    v0[3] = sub_20D572C54;
    v0[14] = swift_continuation_init();
    v0[10] = MEMORY[0x24BDAC760];
    v0[11] = 0x40000000;
    v0[12] = sub_20D572CD8;
    v0[13] = &block_descriptor_8;
    objc_msgSend(v8, sel_keyCommandsWithCompletionHandler_, v0 + 10);
    return swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D572C54()
{
  return swift_task_switch();
}

uint64_t sub_20D572CA0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_20D572CD8(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  sub_20D577BD0(0, &qword_2549BA6B0);
  **(_QWORD **)(*(_QWORD *)(v1 + 64) + 40) = sub_20D5A6BE8();
  return swift_continuation_resume();
}

uint64_t sub_20D572E4C(const void *a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_20D572EC4;
  v4[16] = a2;
  return swift_task_switch();
}

uint64_t sub_20D572EC4()
{
  uint64_t *v0;
  void (**v1)(_QWORD, _QWORD);
  void *v2;
  uint64_t v4;

  v1 = *(void (***)(_QWORD, _QWORD))(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc();
  swift_release();
  sub_20D577BD0(0, &qword_2549BA6B0);
  v2 = (void *)sub_20D5A6BDC();
  swift_bridgeObjectRelease();
  ((void (**)(_QWORD, void *))v1)[2](v1, v2);

  _Block_release(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

void *sub_20D572F70(uint64_t a1)
{
  return sub_20D573038(a1, 0xD00000000000001ALL, 0x800000020D5BF4B0, (SEL *)&selRef_keyCommandWasPerformed_);
}

void *sub_20D572FA0(uint64_t a1, char a2)
{
  return sub_20D574774(a1, a2, 0xD00000000000001ALL, 0x800000020D5BF4D0, (SEL *)&selRef_setAppearance_animated_);
}

void *sub_20D573014(uint64_t a1)
{
  return sub_20D573038(a1, 0xD000000000000020, 0x800000020D5BF4F0, (SEL *)&selRef_notifyFirstTimeAppearanceWithActions_);
}

void *sub_20D573038(uint64_t a1, uint64_t a2, unint64_t a3, SEL *a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint8_t *v16;
  void *result;
  SEL *v18;
  uint64_t v19;

  v8 = v4;
  if (qword_2549B7F00 != -1)
    swift_once();
  v10 = sub_20D5A67E0();
  __swift_project_value_buffer(v10, (uint64_t)qword_2549B82D0);
  v11 = sub_20D5A67C8();
  v12 = sub_20D5A6D08();
  if (os_log_type_enabled(v11, v12))
  {
    v18 = a4;
    v13 = a1;
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v19 = v15;
    *(_DWORD *)v14 = 136315138;
    sub_20D56FB0C(a2, a3, &v19);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v11, v12, "Service side: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v15, -1, -1);
    v16 = v14;
    a1 = v13;
    a4 = v18;
    MEMORY[0x212BA4658](v16, -1, -1);
  }

  swift_getKeyPath();
  v19 = v8;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = (void *)MEMORY[0x212BA4700](v8 + 16);
  if (result)
  {
    objc_msgSend(result, *a4, a1);
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D573270(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t result;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = v1;
  if (qword_2549B7F00 != -1)
    swift_once();
  v4 = sub_20D5A67E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_2549B82D0);
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D08();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136315138;
    v11 = sub_20D56FB0C(0xD000000000000022, 0x800000020D5BF520, &v12);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v5, v6, "Service side: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v8, -1, -1);
    MEMORY[0x212BA4658](v7, -1, -1);
  }

  swift_getKeyPath();
  v12 = v2;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v2 + 16);
  if (result)
  {
    v10 = (void *)result;
    if (a1)
      a1 = (void *)sub_20D5A6A98();
    objc_msgSend(v10, sel_notifyStateRestorationUserInfo_, a1, v11);

    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D57350C(_QWORD *a1, uint64_t a2)
{
  return sub_20D574A0C(a1, a2, 0xD00000000000002ELL, 0x800000020D5BF550, (SEL *)&selRef_previewItemDisplayState_wasAppliedToItemAtIndex_);
}

uint64_t sub_20D57353C(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 128) = a2;
  *(_QWORD *)(v5 + 136) = v4;
  *(_BYTE *)(v5 + 153) = a4;
  *(_BYTE *)(v5 + 152) = a3;
  *(_QWORD *)(v5 + 120) = a1;
  return swift_task_switch();
}

uint64_t sub_20D573560()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_2549B7F00 != -1)
    swift_once();
  v1 = sub_20D5A67E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_2549B82D0);
  v2 = sub_20D5A67C8();
  v3 = sub_20D5A6D08();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v13 = v5;
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v0 + 80) = sub_20D56FB0C(0xD000000000000061, 0x800000020D5BF580, &v13);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v5, -1, -1);
    MEMORY[0x212BA4658](v4, -1, -1);
  }

  v6 = *(_QWORD *)(v0 + 136);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = v6;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v6 + 16);
  *(_QWORD *)(v0 + 144) = result;
  if (result)
  {
    v8 = (void *)result;
    v9 = *(unsigned __int8 *)(v0 + 153);
    v10 = *(unsigned __int8 *)(v0 + 152);
    v12 = *(_QWORD *)(v0 + 120);
    v11 = *(_QWORD *)(v0 + 128);
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_20D5737C4;
    *(_QWORD *)(v0 + 112) = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 88) = 0x40000000;
    *(_QWORD *)(v0 + 96) = sub_20D572224;
    *(_QWORD *)(v0 + 104) = &block_descriptor_9;
    objc_msgSend(v8, sel_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler_, v12, v11, v10, v9, v0 + 80);
    return swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D5737C4()
{
  return swift_task_switch();
}

uint64_t sub_20D573810()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D573998(void *a1, uint64_t a2, char a3, char a4, void *aBlock, uint64_t a6)
{
  _QWORD *v6;
  id v12;
  uint64_t v13;

  v6[3] = a2;
  v6[4] = a6;
  v6[2] = a1;
  v6[5] = _Block_copy(aBlock);
  v12 = a1;
  swift_unknownObjectRetain();
  swift_retain();
  v13 = swift_task_alloc();
  v6[6] = v13;
  *(_QWORD *)v13 = v6;
  *(_QWORD *)(v13 + 8) = sub_20D573A54;
  *(_QWORD *)(v13 + 128) = a2;
  *(_QWORD *)(v13 + 136) = a6;
  *(_BYTE *)(v13 + 153) = a4;
  *(_BYTE *)(v13 + 152) = a3;
  *(_QWORD *)(v13 + 120) = v12;
  return swift_task_switch();
}

uint64_t sub_20D573A54()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  uint64_t v4;

  v1 = *(void (***)(_QWORD))(*v0 + 40);
  v2 = *(void **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_unknownObjectRelease();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

void *sub_20D573AD4(char a1)
{
  return sub_20D575BD0(a1, 0xD000000000000016, 0x800000020D5BF5F0, (SEL *)&selRef_tearDownTransition_);
}

uint64_t sub_20D573B04(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_retain();
  a4(a3);
  return swift_release();
}

uint64_t sub_20D573B44(uint64_t a1, uint64_t a2)
{
  return sub_20D573BF8(a1, a2, 0x6964616F4C746573, 0xEE00293A5F28676ELL, (SEL *)&selRef_setLoadingString_);
}

uint64_t sub_20D573B7C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = sub_20D5A6AF8();
  v7 = v6;
  swift_retain();
  a4(v5, v7);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_20D573BD4(uint64_t a1, uint64_t a2)
{
  return sub_20D573BF8(a1, a2, 0xD00000000000003BLL, 0x800000020D5BF610, (SEL *)&selRef_overrideParentApplicationDisplayIdentifierWithIdentifier_);
}

uint64_t sub_20D573BF8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, SEL *a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  unint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t result;
  void *v18;
  void *v19;
  uint64_t v20;

  v9 = v5;
  if (qword_2549B7F00 != -1)
    swift_once();
  v10 = sub_20D5A67E0();
  __swift_project_value_buffer(v10, (uint64_t)qword_2549B82D0);
  v11 = sub_20D5A67C8();
  v12 = sub_20D5A6D08();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = a3;
    v14 = a4;
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v20 = v16;
    *(_DWORD *)v15 = 136315138;
    sub_20D56FB0C(v13, v14, &v20);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v11, v12, "Service side: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v16, -1, -1);
    MEMORY[0x212BA4658](v15, -1, -1);
  }

  swift_getKeyPath();
  v20 = v9;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v9 + 16);
  if (result)
  {
    v18 = (void *)result;
    v19 = (void *)sub_20D5A6AD4();
    objc_msgSend(v18, *a5, v19);

    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D573E30()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_20D573E48()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  uint64_t v9;

  if (qword_2549B7F00 != -1)
    swift_once();
  v1 = sub_20D5A67E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_2549B82D0);
  v2 = sub_20D5A67C8();
  v3 = sub_20D5A6D08();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[10] = sub_20D56FB0C(0xD000000000000029, 0x800000020D5BF650, &v9);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v5, -1, -1);
    MEMORY[0x212BA4658](v4, -1, -1);
  }

  v6 = v0[15];
  swift_getKeyPath();
  v0[10] = v6;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v6 + 16);
  v0[16] = result;
  if (result)
  {
    v8 = (void *)result;
    v0[2] = v0;
    v0[3] = sub_20D574090;
    v0[14] = swift_continuation_init();
    v0[10] = MEMORY[0x24BDAC760];
    v0[11] = 0x40000000;
    v0[12] = sub_20D572224;
    v0[13] = &block_descriptor_10;
    objc_msgSend(v8, sel_preparePreviewCollectionForInvalidationWithCompletionHandler_, v0 + 10);
    return swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D574090()
{
  return swift_task_switch();
}

uint64_t sub_20D5741FC(const void *a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_20D577D3C;
  v4[15] = a2;
  return swift_task_switch();
}

uint64_t sub_20D574274()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_20D57428C()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  uint64_t v9;

  if (qword_2549B7F00 != -1)
    swift_once();
  v1 = sub_20D5A67E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_2549B82D0);
  v2 = sub_20D5A67C8();
  v3 = sub_20D5A6D08();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[10] = sub_20D56FB0C(0xD000000000000013, 0x800000020D5BF680, &v9);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v5, -1, -1);
    MEMORY[0x212BA4658](v4, -1, -1);
  }

  v6 = v0[15];
  swift_getKeyPath();
  v0[10] = v6;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v6 + 16);
  v0[16] = result;
  if (result)
  {
    v8 = (void *)result;
    v0[2] = v0;
    v0[3] = sub_20D5744D4;
    v0[14] = swift_continuation_init();
    v0[10] = MEMORY[0x24BDAC760];
    v0[11] = 0x40000000;
    v0[12] = sub_20D572224;
    v0[13] = &block_descriptor_11;
    objc_msgSend(v8, sel_invalidateServiceWithCompletionHandler_, v0 + 10);
    return swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D5744D4()
{
  return swift_task_switch();
}

uint64_t sub_20D574520()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D574670(const void *a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_20D5746E8;
  v4[15] = a2;
  return swift_task_switch();
}

uint64_t sub_20D5746E8()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  uint64_t v3;

  v1 = *(void (***)(_QWORD))(*v0 + 24);
  v3 = *v0;
  swift_task_dealloc();
  swift_release();
  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

void *sub_20D574750(uint64_t a1, char a2)
{
  return sub_20D574774(a1, a2, 0xD000000000000029, 0x800000020D5BF6A0, (SEL *)&selRef_hostViewControlerTransitionToState_animated_);
}

void *sub_20D574774(uint64_t a1, char a2, uint64_t a3, unint64_t a4, SEL *a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  unint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  void *result;
  char v20;
  uint64_t v21;

  v9 = v5;
  if (qword_2549B7F00 != -1)
    swift_once();
  v12 = sub_20D5A67E0();
  __swift_project_value_buffer(v12, (uint64_t)qword_2549B82D0);
  v13 = sub_20D5A67C8();
  v14 = sub_20D5A6D08();
  if (os_log_type_enabled(v13, v14))
  {
    v20 = a2;
    v15 = a3;
    v16 = a4;
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v21 = v18;
    *(_DWORD *)v17 = 136315138;
    sub_20D56FB0C(v15, v16, &v21);
    a2 = v20;
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v13, v14, "Service side: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v18, -1, -1);
    MEMORY[0x212BA4658](v17, -1, -1);
  }

  swift_getKeyPath();
  v21 = v9;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = (void *)MEMORY[0x212BA4700](v9 + 16);
  if (result)
  {
    objc_msgSend(result, *a5, a1, a2 & 1);
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D5749A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  swift_retain();
  a5(a3, a4);
  return swift_release();
}

uint64_t sub_20D5749E8(_QWORD *a1, uint64_t a2)
{
  return sub_20D574A0C(a1, a2, 0xD000000000000027, 0x800000020D5BF6D0, (SEL *)&selRef_setPreviewItemDisplayState_onItemAtIndex_);
}

uint64_t sub_20D574A0C(_QWORD *a1, uint64_t a2, uint64_t a3, unint64_t a4, SEL *a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _QWORD *v15;
  unint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t result;
  void *v21;
  SEL *v22;
  uint64_t v23;

  v9 = v5;
  if (qword_2549B7F00 != -1)
    swift_once();
  v12 = sub_20D5A67E0();
  __swift_project_value_buffer(v12, (uint64_t)qword_2549B82D0);
  v13 = sub_20D5A67C8();
  v14 = sub_20D5A6D08();
  if (os_log_type_enabled(v13, v14))
  {
    v22 = a5;
    v15 = a1;
    v16 = a4;
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v23 = v18;
    *(_DWORD *)v17 = 136315138;
    v19 = v16;
    a1 = v15;
    sub_20D56FB0C(a3, v19, &v23);
    a5 = v22;
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v13, v14, "Service side: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v18, -1, -1);
    MEMORY[0x212BA4658](v17, -1, -1);
  }

  swift_getKeyPath();
  v23 = v9;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v9 + 16);
  if (result)
  {
    v21 = (void *)result;
    __swift_project_boxed_opaque_existential_0(a1, a1[3]);
    objc_msgSend(v21, *a5, sub_20D5A6F00(), a2);
    swift_unknownObjectRelease();
    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D574C54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_BYTE *, uint64_t))
{
  _BYTE v8[32];

  swift_unknownObjectRetain();
  swift_retain();
  sub_20D5A6DC8();
  swift_unknownObjectRelease();
  a5(v8, a4);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
}

uint64_t sub_20D574CD0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_20D574CE8()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  uint64_t v9;

  if (qword_2549B7F00 != -1)
    swift_once();
  v1 = sub_20D5A67E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_2549B82D0);
  v2 = sub_20D5A67C8();
  v3 = sub_20D5A6D08();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[10] = sub_20D56FB0C(0xD000000000000023, 0x800000020D5BF700, &v9);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v5, -1, -1);
    MEMORY[0x212BA4658](v4, -1, -1);
  }

  v6 = v0[15];
  swift_getKeyPath();
  v0[10] = v6;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v6 + 16);
  v0[16] = result;
  if (result)
  {
    v8 = (void *)result;
    v0[2] = v0;
    v0[3] = sub_20D574090;
    v0[14] = swift_continuation_init();
    v0[10] = MEMORY[0x24BDAC760];
    v0[11] = 0x40000000;
    v0[12] = sub_20D572224;
    v0[13] = &block_descriptor_12;
    objc_msgSend(v8, sel_prepareForActionSheetPresentationWithCompletionHandler_, v0 + 10);
    return swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D575050(const void *a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  swift_retain();
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_20D5750C8;
  v4[15] = a2;
  return swift_task_switch();
}

uint64_t sub_20D5750C8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (**v4)(_QWORD);

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 24);
  v3 = *v0;
  swift_task_dealloc();
  swift_release();
  if (v2)
  {
    v4 = *(void (***)(_QWORD))(v1 + 24);
    v4[2](v4);
    _Block_release(v4);
  }
  return (*(uint64_t (**)(void))(v3 + 8))();
}

void *sub_20D57513C()
{
  return sub_20D575160(0xD000000000000017, 0x800000020D5BF730, (SEL *)&selRef_actionSheetDidDismiss);
}

void *sub_20D575160(uint64_t a1, unint64_t a2, SEL *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  void *result;
  uint64_t v14;

  v7 = v3;
  if (qword_2549B7F00 != -1)
    swift_once();
  v8 = sub_20D5A67E0();
  __swift_project_value_buffer(v8, (uint64_t)qword_2549B82D0);
  v9 = sub_20D5A67C8();
  v10 = sub_20D5A6D08();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v14 = v12;
    *(_DWORD *)v11 = 136315138;
    sub_20D56FB0C(a1, a2, &v14);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v9, v10, "Service side: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v12, -1, -1);
    MEMORY[0x212BA4658](v11, -1, -1);
  }

  swift_getKeyPath();
  v14 = v7;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = (void *)MEMORY[0x212BA4700](v7 + 16);
  if (result)
  {
    objc_msgSend(result, *a3);
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_20D57535C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  void *result;
  void *v8;
  uint64_t v9;

  v1 = v0;
  if (qword_2549B7F00 != -1)
    swift_once();
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549B82D0);
  v3 = sub_20D5A67C8();
  v4 = sub_20D5A6D08();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v9 = v6;
    *(_DWORD *)v5 = 136315138;
    sub_20D56FB0C(0xD00000000000001DLL, 0x800000020D5BF750, &v9);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v3, v4, "Service side: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v6, -1, -1);
    MEMORY[0x212BA4658](v5, -1, -1);
  }

  swift_getKeyPath();
  v9 = v1;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = (void *)MEMORY[0x212BA4700](v1 + 16);
  if (result)
  {
    v8 = result;
    if ((objc_msgSend(result, sel_respondsToSelector_, sel_documentMenuActionWillBegin) & 1) != 0)
      objc_msgSend(v8, sel_documentMenuActionWillBegin);
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_20D575570(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  void *result;
  void *v10;
  uint64_t v11;

  v2 = v1;
  if (qword_2549B7F00 != -1)
    swift_once();
  v4 = sub_20D5A67E0();
  __swift_project_value_buffer(v4, (uint64_t)qword_2549B82D0);
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D08();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v11 = v8;
    *(_DWORD *)v7 = 136315138;
    sub_20D56FB0C(0xD00000000000002CLL, 0x800000020D5BF770, &v11);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v5, v6, "Service side: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v8, -1, -1);
    MEMORY[0x212BA4658](v7, -1, -1);
  }

  swift_getKeyPath();
  v11 = v2;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = (void *)MEMORY[0x212BA4700](v2 + 16);
  if (result)
  {
    v10 = result;
    if ((objc_msgSend(result, sel_respondsToSelector_, sel_hostViewControllerBackgroundColorChanged_) & 1) != 0)
      objc_msgSend(v10, sel_hostViewControllerBackgroundColorChanged_, a1);
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_20D57578C(uint64_t a1, uint64_t a2, void *a3, void (*a4)(id))
{
  id v5;

  v5 = a3;
  swift_retain();
  a4(v5);
  swift_release();

}

void *sub_20D5757D8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint8_t *v17;
  void *result;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t aBlock[6];

  v5 = v4;
  if (qword_2549B7F00 != -1)
    swift_once();
  v10 = sub_20D5A67E0();
  __swift_project_value_buffer(v10, (uint64_t)qword_2549B82D0);
  v11 = sub_20D5A67C8();
  v12 = sub_20D5A6D08();
  if (os_log_type_enabled(v11, v12))
  {
    v20 = a4;
    v13 = a1;
    v14 = a2;
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    aBlock[0] = v16;
    *(_DWORD *)v15 = 136315138;
    v21 = sub_20D56FB0C(0xD000000000000042, 0x800000020D5BF7C0, aBlock);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v11, v12, "Service side: %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v16, -1, -1);
    v17 = v15;
    a2 = v14;
    a1 = v13;
    a4 = v20;
    MEMORY[0x212BA4658](v17, -1, -1);
  }

  swift_getKeyPath();
  aBlock[0] = v5;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = (void *)MEMORY[0x212BA4700](v5 + 16);
  if (result)
  {
    v19 = result;
    if ((objc_msgSend(result, sel_respondsToSelector_, sel_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler_) & 1) != 0)
    {
      if (a3)
      {
        aBlock[4] = (uint64_t)a3;
        aBlock[5] = a4;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_20D575A98;
        aBlock[3] = (uint64_t)&block_descriptor_13;
        a3 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
      }
      objc_msgSend(v19, sel_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler_, a1, a2, a3, v20, v21);
      _Block_release(a3);
      return (void *)swift_unknownObjectRelease();
    }
    else
    {
      result = (void *)swift_unknownObjectRelease();
      if (a3)
        return (void *)((uint64_t (*)(_QWORD, _QWORD))a3)(0, 0);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_20D575A98(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void *sub_20D575BAC(char a1)
{
  return sub_20D575BD0(a1, 0xD000000000000017, 0x800000020D5BF810, (SEL *)&selRef_setIsContentManaged_);
}

void *sub_20D575BD0(char a1, uint64_t a2, unint64_t a3, SEL *a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  SEL *v13;
  uint8_t *v14;
  uint64_t v15;
  uint8_t *v16;
  void *result;
  char v18;
  uint64_t v19;

  v8 = v4;
  if (qword_2549B7F00 != -1)
    swift_once();
  v10 = sub_20D5A67E0();
  __swift_project_value_buffer(v10, (uint64_t)qword_2549B82D0);
  v11 = sub_20D5A67C8();
  v12 = sub_20D5A6D08();
  if (os_log_type_enabled(v11, v12))
  {
    v18 = a1;
    v13 = a4;
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v19 = v15;
    *(_DWORD *)v14 = 136315138;
    sub_20D56FB0C(a2, a3, &v19);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v11, v12, "Service side: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v15, -1, -1);
    v16 = v14;
    a4 = v13;
    a1 = v18;
    MEMORY[0x212BA4658](v16, -1, -1);
  }

  swift_getKeyPath();
  v19 = v8;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = (void *)MEMORY[0x212BA4700](v8 + 16);
  if (result)
  {
    objc_msgSend(result, *a4, a1 & 1);
    return (void *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D575DE4(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 136) = v1;
  *(_BYTE *)(v2 + 152) = a1;
  return swift_task_switch();
}

uint64_t sub_20D575E00()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (qword_2549B7F00 != -1)
    swift_once();
  v1 = sub_20D5A67E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_2549B82D0);
  v2 = sub_20D5A67C8();
  v3 = sub_20D5A6D08();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v10 = v5;
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v0 + 80) = sub_20D56FB0C(0xD000000000000028, 0x800000020D5BF860, &v10);
    sub_20D5A6DB0();
    _os_log_impl(&dword_20D4F5000, v2, v3, "Service side: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v5, -1, -1);
    MEMORY[0x212BA4658](v4, -1, -1);
  }

  v6 = *(_QWORD *)(v0 + 136);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = v6;
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v6 + 16);
  *(_QWORD *)(v0 + 144) = result;
  if (result)
  {
    v8 = (void *)result;
    v9 = *(unsigned __int8 *)(v0 + 152);
    *(_QWORD *)(v0 + 56) = v0 + 120;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_20D576058;
    *(_QWORD *)(v0 + 112) = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    *(_QWORD *)(v0 + 88) = 0x40000000;
    *(_QWORD *)(v0 + 96) = sub_20D5760E0;
    *(_QWORD *)(v0 + 104) = &block_descriptor_14;
    objc_msgSend(v8, sel_saveCurrentPreviewEditsSynchronously_withCompletionHandler_, v9, v0 + 80);
    return swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D576058()
{
  return swift_task_switch();
}

uint64_t sub_20D5760A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_20D5760E0(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v3;
  id v4;

  v3 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40);
  *v3 = a2;
  v3[1] = a3;
  v4 = a3;
  return swift_continuation_resume();
}

uint64_t sub_20D576240(char a1, void *aBlock, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v6;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  swift_retain();
  v6 = swift_task_alloc();
  v3[4] = v6;
  *(_QWORD *)v6 = v3;
  *(_QWORD *)(v6 + 8) = sub_20D5762CC;
  *(_QWORD *)(v6 + 136) = a3;
  *(_BYTE *)(v6 + 152) = a1;
  return swift_task_switch();
}

uint64_t sub_20D5762CC(uint64_t a1, void *a2)
{
  uint64_t *v2;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;

  v5 = *(void (***)(_QWORD, _QWORD, _QWORD))(*v2 + 24);
  v7 = *v2;
  swift_task_dealloc();
  swift_release();
  ((void (**)(_QWORD, uint64_t, void *))v5)[2](v5, a1, a2);
  _Block_release(v5);

  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t QLAppExtensionSceneProxy.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_20D576D5C(v0 + 16);
  swift_unknownObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC9QuickLook24QLAppExtensionSceneProxy___observationRegistrar;
  v2 = sub_20D5A66B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t QLAppExtensionSceneProxy.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_20D576D5C(v0 + 16);
  swift_unknownObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC9QuickLook24QLAppExtensionSceneProxy___observationRegistrar;
  v2 = sub_20D5A66B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

void QLAppExtensionSceneProxy.getPreviewCollectionUUIDWithCompletionHandler(completionHandler:)(void (*a1)(id))
{
  uint64_t v1;
  void *v3;
  id v4;

  swift_getKeyPath();
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  v3 = (void *)MEMORY[0x212BA4700](v1 + 16);
  if (v3)
  {
    v4 = objc_msgSend(v3, sel_uuid);
    swift_unknownObjectRelease();
    a1(v4);

  }
  else
  {
    __break(1u);
  }
}

void QLAppExtensionSceneProxy.setNotificationCenter(_:)(uint64_t a1)
{
  id v2;
  id v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_setRemoteNotificationCenter_, a1);

  }
}

void QLAppExtensionSceneProxy.getNetworkObserverWithCompletionBlock(_:)(void (*a1)(void))
{
  id v2;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  a1();

}

uint64_t QLAppExtensionSceneProxy.preparePreviewCollectionForInvalidationWithCompletionHandler(completionHandler:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  void *v6;
  void *v7;
  _QWORD v8[6];

  swift_getKeyPath();
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](v2 + 16);
  if (result)
  {
    v6 = (void *)result;
    v8[4] = a1;
    v8[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = sub_20D57683C;
    v8[3] = &block_descriptor_17;
    v7 = _Block_copy(v8);
    swift_retain();
    swift_release();
    objc_msgSend(v6, sel_preparePreviewCollectionForInvalidationWithCompletionHandler_, v7);
    _Block_release(v7);
    return swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D57683C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_20D5768D8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D570178(&qword_2549B7F78, type metadata accessor for QLAccessoryAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAccessoryAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  return MEMORY[0x212BA4700](v0 + 16);
}

uint64_t sub_20D576960()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t QLAccessoryAppExtensionSceneProxy.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_20D5A66A8();
  return v0;
}

uint64_t QLAccessoryAppExtensionSceneProxy.init()()
{
  uint64_t v0;

  swift_unknownObjectWeakInit();
  sub_20D5A66A8();
  return v0;
}

void sub_20D5769F4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  NSObject *v13;

  swift_getKeyPath();
  sub_20D570178(&qword_2549B7F78, type metadata accessor for QLAccessoryAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAccessoryAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  v3 = MEMORY[0x212BA4700](v1 + 16);
  if (v3)
  {
    v4 = (void *)v3;
    if (qword_2549B7F08 != -1)
      swift_once();
    v5 = objc_msgSend((id)qword_2549B82E8, sel_objectForKey_, a1);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v4, sel_view);
      objc_msgSend(v6, sel_setRemoteAccessoryContainer_, v7);

      goto LABEL_12;
    }

  }
  if (qword_2549B7F00 != -1)
    swift_once();
  v8 = sub_20D5A67E0();
  __swift_project_value_buffer(v8, (uint64_t)qword_2549B82D0);
  v9 = a1;
  v7 = sub_20D5A67C8();
  v10 = sub_20D5A6D14();
  if (os_log_type_enabled(v7, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    v13 = v9;
    sub_20D5A6DB0();
    *v12 = v9;

    _os_log_impl(&dword_20D4F5000, v7, v10, "Cannot configure accessory view container, no preview collection with UUID %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v12, -1, -1);
    MEMORY[0x212BA4658](v11, -1, -1);
  }
  else
  {

    v7 = v9;
  }
LABEL_12:

}

uint64_t QLAccessoryAppExtensionSceneProxy.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_unknownObjectWeakDestroy();
  v1 = v0 + OBJC_IVAR____TtC9QuickLook33QLAccessoryAppExtensionSceneProxy___observationRegistrar;
  v2 = sub_20D5A66B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t QLAccessoryAppExtensionSceneProxy.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_unknownObjectWeakDestroy();
  v1 = v0 + OBJC_IVAR____TtC9QuickLook33QLAccessoryAppExtensionSceneProxy___observationRegistrar;
  v2 = sub_20D5A66B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_20D576D5C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t type metadata accessor for QLAccessoryAppExtensionSceneProxy(uint64_t a1)
{
  return sub_20D576D9C(a1, qword_2549B8608);
}

uint64_t sub_20D576D9C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20D576DD0()
{
  return type metadata accessor for QLAppExtensionSceneProxy(0);
}

uint64_t sub_20D576DD8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20D5A66B4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for QLAppExtensionSceneProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.crash(reply:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setAllowInteractiveTransitions(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 216) + *(_QWORD *)(*(_QWORD *)v1 + 216));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_20D577D2C;
  return v6(a1);
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setHostApplicationBundleIdentifier(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.configure(withNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.configure(withNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setCurrentPreviewItemIndex(_:animated:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.hostApplicationDidEnterBackground(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.hostApplicationDidBecomeActive()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.toolbarButtons(for:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 272) + *(_QWORD *)(*(_QWORD *)v1 + 272));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_20D576F88;
  return v6(a1);
}

uint64_t sub_20D576F88(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.toolbarButtonPressed(withIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 280) + *(_QWORD *)(*(_QWORD *)v2 + 280));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_20D577D2C;
  return v8(a1, a2);
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.shouldDisplayLockActivity()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 288) + *(_QWORD *)(*(_QWORD *)v0 + 288));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_20D5770A8;
  return v4();
}

uint64_t sub_20D5770A8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.requestLockForCurrentItem()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.keyCommands()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 304) + *(_QWORD *)(*(_QWORD *)v0 + 304));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_20D5770A8;
  return v4();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.keyCommandWasPerformed(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setAppearance(_:animated:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.notifyFirstTimeAppearance(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.notifyStateRestorationUserInfo(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.previewItemDisplayState(_:wasAppliedToItemAt:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.startTransition(withSourceViewProvider:transitionController:presenting:useInteractiveTransition:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v4 + 352)
                                                                   + *(_QWORD *)(*(_QWORD *)v4 + 352));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_20D577D2C;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.tearDownTransition(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setLoading(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.overrideParentApplicationDisplayIdentifier(withIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.preparePreviewCollectionForInvalidation()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 384) + *(_QWORD *)(*(_QWORD *)v0 + 384));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_20D577D2C;
  return v4();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.invalidateService()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 392) + *(_QWORD *)(*(_QWORD *)v0 + 392));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_20D577D2C;
  return v4();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.hostViewControlerTransition(to:animated:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setPreviewItemDisplayState(_:onItemAt:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.prepareForActionSheetPresentation()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 416) + *(_QWORD *)(*(_QWORD *)v0 + 416));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_20D577D2C;
  return v4();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.actionSheetDidDismiss()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.documentMenuActionWillBegin()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.hostViewControllerBackgroundColorChanged(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.saveIntoPhotoLibraryMedia(with:previewItemType:completionHandler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.setIsContentManaged(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of QLAppExtensionSceneProxy.saveCurrentPreviewEditsSynchronously(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 464) + *(_QWORD *)(*(_QWORD *)v1 + 464));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_20D577D40;
  return v6(a1);
}

uint64_t sub_20D577404()
{
  return type metadata accessor for QLAccessoryAppExtensionSceneProxy(0);
}

uint64_t sub_20D57740C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20D5A66B4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for QLAccessoryAppExtensionSceneProxy()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QLAccessoryAppExtensionSceneProxy.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of QLAccessoryAppExtensionSceneProxy.configureAsAccessoryViewContainerForPreviewCollection(previewCollectionUUID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t sub_20D5774A4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_20D5774C8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_20D5774D4(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  void *v4;
  id v5;

  swift_getKeyPath();
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  sub_20D5A6684();
  swift_release();
  v4 = (void *)MEMORY[0x212BA4700](a1 + 16);
  if (v4)
  {
    v5 = objc_msgSend(v4, sel_uuid);
    swift_unknownObjectRelease();
    ((void (**)(_QWORD, id))a2)[2](a2, v5);

  }
  else
  {
    _Block_release(a2);
    __break(1u);
  }
}

uint64_t sub_20D5775AC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  v2 = *(_BYTE *)(v0 + 16);
  v4 = *(void **)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_20D577D2C;
  return ((uint64_t (*)(char, void *, uint64_t))((char *)&dword_2549B86E0 + dword_2549B86E0))(v2, v4, v3);
}

uint64_t sub_20D57761C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_20D577D2C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2549BA570 + dword_2549BA570))(v2, v3, v4);
}

uint64_t sub_20D577698(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20D577D2C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2549BA580 + dword_2549BA580))(a1, v4, v5, v6);
}

uint64_t sub_20D57771C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void sub_20D57772C(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_20D592B2C(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_20D577738()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_20D577D2C;
  return ((uint64_t (*)(const void *, uint64_t))((char *)&dword_2549B8700 + dword_2549B8700))(v2, v3);
}

uint64_t sub_20D5777A8()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_20D577D2C;
  return ((uint64_t (*)(const void *, uint64_t))((char *)&dword_2549B8720 + dword_2549B8720))(v2, v3);
}

uint64_t sub_20D577818()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_20D577D2C;
  return ((uint64_t (*)(const void *, uint64_t))((char *)&dword_2549B8740 + dword_2549B8740))(v2, v3);
}

uint64_t sub_20D577884()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  _Block_release(*(const void **)(v0 + 40));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D5778C0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;

  v2 = *(void **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_BYTE *)(v0 + 32);
  v5 = *(_BYTE *)(v0 + 33);
  v7 = *(void **)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 48);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_20D577D2C;
  return ((uint64_t (*)(void *, uint64_t, char, char, void *, uint64_t))((char *)&dword_2549B8760
                                                                               + dword_2549B8760))(v2, v3, v4, v5, v7, v6);
}

uint64_t sub_20D57795C()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_20D5779C0;
  return ((uint64_t (*)(const void *, uint64_t))((char *)&dword_2549B8780 + dword_2549B8780))(v2, v3);
}

uint64_t sub_20D5779C0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t objectdestroy_51Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D577A40()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_20D577D2C;
  return ((uint64_t (*)(const void *, uint64_t))((char *)&dword_2549B87A0 + dword_2549B87A0))(v2, v3);
}

uint64_t sub_20D577AB0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_20D577D2C;
  return ((uint64_t (*)(int, void *, uint64_t))((char *)&dword_2549B87C0 + dword_2549B87C0))(v2, v3, v4);
}

uint64_t objectdestroy_141Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D577B5C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_20D577D2C;
  return ((uint64_t (*)(void *, void *, uint64_t))((char *)&dword_2549B87E0 + dword_2549B87E0))(v2, v3, v4);
}

uint64_t sub_20D577BD0(uint64_t a1, unint64_t *a2)
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

uint64_t objectdestroy_35Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D577C38()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  v2 = *(_BYTE *)(v0 + 16);
  v4 = *(void **)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_20D577D2C;
  return ((uint64_t (*)(char, void *, uint64_t))((char *)&dword_2549B8800 + dword_2549B8800))(v2, v4, v3);
}

uint64_t objectdestroy_39Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D577CD8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24) = *(_QWORD *)(v0 + 24);
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t sub_20D577D10()
{
  return sub_20D570BAC();
}

uint64_t sub_20D577D44()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20D578748();
  sub_20D5A6684();
  swift_release();
  v1 = *(_QWORD *)(v0 + 16);
  sub_20D57828C(v1);
  return v1;
}

uint64_t sub_20D577DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = a3;
  sub_20D57828C(a2);
  return sub_20D5782B8(v3);
}

void sub_20D577E0C(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8920);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  aBlock[4] = sub_20D57824C;
  aBlock[5] = v8;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20D57683C;
  aBlock[3] = &block_descriptor_0;
  v9 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_crashWithReply_, v9);
  _Block_release(v9);
}

uint64_t sub_20D577F3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_20D5782B8(*(_QWORD *)(v0 + 16));
  v1 = v0 + OBJC_IVAR____TtC9QuickLook43QLHostPrimaryViewControllerWrapperViewModel___observationRegistrar;
  v2 = sub_20D5A66B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_20D577F94()
{
  return type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel();
}

uint64_t type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel()
{
  uint64_t result;

  result = qword_2549B8850;
  if (!qword_2549B8850)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20D577FD8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20D5A66B4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t destroy for QLHostPrimaryViewControllerWrapperViewModel.Session()
{
  swift_release();
  return swift_release();
}

_QWORD *_s9QuickLook43QLHostPrimaryViewControllerWrapperViewModelC7SessionVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for QLHostPrimaryViewControllerWrapperViewModel.Session(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for QLHostPrimaryViewControllerWrapperViewModel.Session(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for QLHostPrimaryViewControllerWrapperViewModel.Session(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for QLHostPrimaryViewControllerWrapperViewModel.Session(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel.Session()
{
  return &type metadata for QLHostPrimaryViewControllerWrapperViewModel.Session;
}

uint64_t sub_20D5781E8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8920);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_20D57824C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8920);
  return sub_20D5A6C30();
}

uint64_t sub_20D57828C(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_20D5782B8(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_20D5782E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[15] = a4;
  v5[16] = a5;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  v6 = sub_20D5A6774();
  v5[17] = v6;
  v5[18] = *(_QWORD *)(v6 - 8);
  v5[19] = swift_task_alloc();
  v7 = sub_20D5A6D68();
  v5[20] = v7;
  v5[21] = *(_QWORD *)(v7 - 8);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20D578384()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0[23];
  v8 = v0[21];
  v2 = v0[19];
  v9 = v0[20];
  v10 = v0[22];
  v4 = v0[17];
  v3 = v0[18];
  v5 = v0[12];
  swift_retain();
  sub_20D5A6D5C();
  v0[24] = sub_20D5A6D8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v10, v1, v9);
  v6 = (_QWORD *)swift_task_alloc();
  v0[25] = v6;
  *v6 = v0;
  v6[1] = sub_20D578478;
  return sub_20D5A6D80();
}

uint64_t sub_20D578478(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 208) = a1;
  *(_QWORD *)(v3 + 216) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D5784E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 208);
  v1 = *(_QWORD *)(v0 + 192);
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = &off_24C728C00;
  type metadata accessor for QLUIExtensionProxy();
  v2 = swift_allocObject();
  v3 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 16, v1);
  v4 = *(_QWORD *)(v1 - 8);
  v5 = (_QWORD *)swift_task_alloc();
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v4 + 16))(v5, v3, v1);
  *(_QWORD *)(v0 + 56) = *v5;
  *(_QWORD *)(v0 + 80) = v1;
  *(_QWORD *)(v0 + 88) = &off_24C728C00;
  v6 = qword_2549B7F20;
  swift_retain_n();
  if (v6 != -1)
    swift_once();
  v7 = *(_QWORD *)(v0 + 184);
  v15 = *(_QWORD *)(v0 + 160);
  v8 = *(_QWORD *)(v0 + 144);
  v13 = *(_QWORD *)(v0 + 136);
  v14 = *(_QWORD *)(v0 + 168);
  v9 = *(_QWORD *)(v0 + 96);
  v10 = (void *)qword_2549BCF18;
  *(_QWORD *)(v2 + 16) = qword_2549BCF18;
  *(_QWORD *)(v2 + 64) = 0;
  sub_20D578728((__int128 *)(v0 + 56), v2 + 24);
  v11 = v10;
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_release();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v13);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v7, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(*(_QWORD *)(v0 + 208), v2);
}

uint64_t sub_20D578680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 168);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 136));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_20D578728(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

unint64_t sub_20D578748()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549B9F30;
  if (!qword_2549B9F30)
  {
    v1 = type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel();
    result = MEMORY[0x212BA45A4](&unk_20D5B2150, v1);
    atomic_store(result, (unint64_t *)&qword_2549B9F30);
  }
  return result;
}

uint64_t sub_20D578790()
{
  uint64_t v0;

  v0 = sub_20D5A67E0();
  __swift_allocate_value_buffer(v0, qword_2549B8930);
  __swift_project_value_buffer(v0, (uint64_t)qword_2549B8930);
  return sub_20D5A67D4();
}

id sub_20D578808(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *ObjCClassFromMetadata;
  id result;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  v2 = sub_20D5A67E0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v32 - v7;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  result = objc_msgSend(ObjCClassFromMetadata, sel_applicationIdentifierEntitlementKey);
  if (!result)
  {
    __break(1u);
    goto LABEL_20;
  }
  v11 = result;
  v12 = objc_msgSend(a1, sel_valueForEntitlement_, result);

  if (!v12)
  {
    if (qword_2549B7F10 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v2, (uint64_t)qword_2549B8930);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v14, v2);
    v15 = sub_20D5A67C8();
    v16 = sub_20D5A6CFC();
    if (!os_log_type_enabled(v15, v16))
      goto LABEL_10;
    v17 = (uint8_t *)swift_slowAlloc();
    v33 = swift_slowAlloc();
    *(_QWORD *)&v36[0] = v33;
    *(_DWORD *)v17 = 136315138;
    result = objc_msgSend(ObjCClassFromMetadata, sel_applicationIdentifierEntitlementKey);
    if (result)
    {
      v18 = result;
      v19 = sub_20D5A6AF8();
      v21 = v20;

      *(_QWORD *)&v35[0] = sub_20D56FB0C(v19, v21, (uint64_t *)v36);
      sub_20D5A6DB0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_20D4F5000, v15, v16, "No value returned for the %s entitlement", v17, 0xCu);
      v22 = v33;
      swift_arrayDestroy();
      MEMORY[0x212BA4658](v22, -1, -1);
      MEMORY[0x212BA4658](v17, -1, -1);
LABEL_10:

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
      return 0;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  sub_20D5A6DC8();
  swift_unknownObjectRelease();
  sub_20D578C6C(v35, v36);
  sub_20D570648((uint64_t)v36, (uint64_t)v35);
  if (swift_dynamicCast())
  {
    v13 = v34;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
    return (id)v13;
  }
  if (qword_2549B7F10 != -1)
    swift_once();
  v23 = __swift_project_value_buffer(v2, (uint64_t)qword_2549B8930);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v23, v2);
  v24 = sub_20D5A67C8();
  v25 = sub_20D5A6CFC();
  if (!os_log_type_enabled(v24, v25))
    goto LABEL_16;
  v26 = (uint8_t *)swift_slowAlloc();
  v33 = swift_slowAlloc();
  *(_QWORD *)&v35[0] = v33;
  *(_DWORD *)v26 = 136315138;
  result = objc_msgSend(ObjCClassFromMetadata, sel_applicationIdentifierEntitlementKey);
  if (result)
  {
    v27 = result;
    v28 = sub_20D5A6AF8();
    v30 = v29;

    v34 = sub_20D56FB0C(v28, v30, (uint64_t *)v35);
    sub_20D5A6DB0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20D4F5000, v24, v25, "Value for %s entitlement could not be converted to String", v26, 0xCu);
    v31 = v33;
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v31, -1, -1);
    MEMORY[0x212BA4658](v26, -1, -1);
LABEL_16:

    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
    return 0;
  }
LABEL_21:
  __break(1u);
  return result;
}

_OWORD *sub_20D578C6C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_20D578C7C()
{
  uint64_t v0;

  v0 = sub_20D5A67E0();
  __swift_allocate_value_buffer(v0, qword_2549BCF00);
  __swift_project_value_buffer(v0, (uint64_t)qword_2549BCF00);
  return sub_20D5A67D4();
}

BOOL sub_20D578CFC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_20D578D14()
{
  sub_20D5A6F60();
  sub_20D5A6F6C();
  return sub_20D5A6F78();
}

uint64_t sub_20D578D58()
{
  return sub_20D5A6F6C();
}

uint64_t sub_20D578D80()
{
  sub_20D5A6F60();
  sub_20D5A6F6C();
  return sub_20D5A6F78();
}

uint64_t sub_20D578DD0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = v0;
  sub_20D5A6C54();
  *(_QWORD *)(v1 + 72) = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D578E3C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t (*v13)(id);

  v1 = v0[8];
  swift_release();
  v2 = *(void **)(v1 + 64);
  if (v2)
  {
    v3 = *(id *)(v1 + 64);
  }
  else
  {
    __swift_project_boxed_opaque_existential_0((_QWORD *)(v0[8] + 24), *(_QWORD *)(v0[8] + 48));
    v6 = (void *)sub_20D5A6D74();
    objc_msgSend(v6, sel_setRemoteObjectInterface_, *(_QWORD *)(v0[8] + 16));
    v7 = swift_allocObject();
    swift_weakInit();
    v0[6] = sub_20D579914;
    v0[7] = v7;
    v8 = MEMORY[0x24BDAC760];
    v0[2] = MEMORY[0x24BDAC760];
    v0[3] = 1107296256;
    v0[4] = sub_20D57683C;
    v0[5] = &block_descriptor_16;
    v9 = _Block_copy(v0 + 2);
    swift_release();
    objc_msgSend(v6, sel_setInvalidationHandler_, v9);
    _Block_release(v9);
    v10 = swift_allocObject();
    swift_weakInit();
    v0[6] = sub_20D57991C;
    v0[7] = v10;
    v0[2] = v8;
    v0[3] = 1107296256;
    v0[4] = sub_20D57683C;
    v0[5] = &block_descriptor_20;
    v11 = _Block_copy(v0 + 2);
    swift_release();
    objc_msgSend(v6, sel_setInterruptionHandler_, v11);
    _Block_release(v11);
    objc_msgSend(v6, sel_resume);
    v12 = *(void **)(v1 + 64);
    *(_QWORD *)(v1 + 64) = v6;
    v3 = v6;

    v2 = 0;
  }
  v13 = (uint64_t (*)(id))v0[1];
  v4 = v2;
  return v13(v3);
}

uint64_t sub_20D579048(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  _QWORD v6[6];

  sub_20D579890();
  v2 = sub_20D5A6D38();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_20D5798CC;
  *(_QWORD *)(v3 + 24) = a1;
  v6[4] = sub_20D579AEC;
  v6[5] = v3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_20D579168;
  v6[3] = &block_descriptor_28;
  v4 = _Block_copy(v6);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v2, v4);

  _Block_release(v4);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v2 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_20D579168(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_20D579188()
{
  uint64_t result;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (qword_2549B7F18 != -1)
      swift_once();
    v1 = sub_20D5A67E0();
    __swift_project_value_buffer(v1, (uint64_t)qword_2549BCF00);
    v2 = sub_20D5A67C8();
    v3 = sub_20D5A6D14();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_20D4F5000, v2, v3, "Connection to appex interrupted", v4, 2u);
      MEMORY[0x212BA4658](v4, -1, -1);
    }

    return swift_release();
  }
  return result;
}

uint64_t type metadata accessor for QLUIExtensionProxy()
{
  return objc_opt_self();
}

uint64_t sub_20D5792B0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = v0;
  sub_20D5A6C54();
  *(_QWORD *)(v1 + 72) = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D57931C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t (*v12)(id);

  v1 = v0[8];
  swift_release();
  v2 = *(void **)(v1 + 64);
  if (v2)
  {
    v3 = *(id *)(v1 + 64);
  }
  else
  {
    __swift_project_boxed_opaque_existential_0((_QWORD *)(v0[8] + 24), *(_QWORD *)(v0[8] + 48));
    v6 = (void *)sub_20D5A6D74();
    objc_msgSend(v6, sel_setRemoteObjectInterface_, *(_QWORD *)(v0[8] + 16));
    v7 = swift_allocObject();
    swift_weakInit();
    v0[6] = sub_20D579888;
    v0[7] = v7;
    v8 = MEMORY[0x24BDAC760];
    v0[2] = MEMORY[0x24BDAC760];
    v0[3] = 1107296256;
    v0[4] = sub_20D57683C;
    v0[5] = &block_descriptor_1;
    v9 = _Block_copy(v0 + 2);
    swift_release();
    objc_msgSend(v6, sel_setInvalidationHandler_, v9);
    _Block_release(v9);
    v0[6] = sub_20D579744;
    v0[7] = 0;
    v0[2] = v8;
    v0[3] = 1107296256;
    v0[4] = sub_20D57683C;
    v0[5] = &block_descriptor_3;
    v10 = _Block_copy(v0 + 2);
    objc_msgSend(v6, sel_setInterruptionHandler_, v10);
    _Block_release(v10);
    objc_msgSend(v6, sel_resume);
    v11 = *(void **)(v1 + 64);
    *(_QWORD *)(v1 + 64) = v6;
    v3 = v6;

    v2 = 0;
  }
  v12 = (uint64_t (*)(id))v0[1];
  v4 = v2;
  return v12(v3);
}

uint64_t sub_20D5794F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;
  _QWORD v6[6];

  sub_20D579890();
  v2 = sub_20D5A6D38();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_20D5798CC;
  *(_QWORD *)(v3 + 24) = a1;
  v6[4] = sub_20D5798F4;
  v6[5] = v3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_20D579168;
  v6[3] = &block_descriptor_10_0;
  v4 = _Block_copy(v6);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v2, v4);

  _Block_release(v4);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v2 & 1) != 0)
    __break(1u);
  return result;
}

void sub_20D579610()
{
  uint64_t Strong;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v1 = Strong;
    if (qword_2549B7F18 != -1)
      swift_once();
    v2 = sub_20D5A67E0();
    __swift_project_value_buffer(v2, (uint64_t)qword_2549BCF00);
    v3 = sub_20D5A67C8();
    v4 = sub_20D5A6D14();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20D4F5000, v3, v4, "Connection to appex invalidated", v5, 2u);
      MEMORY[0x212BA4658](v5, -1, -1);
    }

    __swift_project_boxed_opaque_existential_0((_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 48));
    sub_20D5A6D44();
    objc_msgSend(*(id *)(v1 + 64), sel_invalidate);
    v6 = *(void **)(v1 + 64);
    *(_QWORD *)(v1 + 64) = 0;
    swift_release();

  }
}

void sub_20D579744()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_2549B7F18 != -1)
    swift_once();
  v0 = sub_20D5A67E0();
  __swift_project_value_buffer(v0, (uint64_t)qword_2549BCF00);
  oslog = sub_20D5A67C8();
  v1 = sub_20D5A6D14();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_20D4F5000, oslog, v1, "Connection to appex interrupted", v2, 2u);
    MEMORY[0x212BA4658](v2, -1, -1);
  }

}

uint64_t sub_20D579810()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for QLAccessoryExtensionProxy()
{
  return objc_opt_self();
}

uint64_t sub_20D579864()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_20D579888()
{
  uint64_t v0;

  return sub_20D5794F0(v0);
}

unint64_t sub_20D579890()
{
  unint64_t result;

  result = qword_2549B8B88;
  if (!qword_2549B8B88)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549B8B88);
  }
  return result;
}

void sub_20D5798CC()
{
  sub_20D579610();
}

uint64_t sub_20D5798E4()
{
  return swift_deallocObject();
}

uint64_t sub_20D5798F4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_20D579914()
{
  uint64_t v0;

  return sub_20D579048(v0);
}

uint64_t sub_20D57991C()
{
  return sub_20D579188();
}

uint64_t sub_20D579924()
{
  return swift_deallocObject();
}

uint64_t getEnumTagSinglePayload for ProxyError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ProxyError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_20D579A10 + 4 * byte_20D5B21A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20D579A44 + 4 * byte_20D5B21A0[v4]))();
}

uint64_t sub_20D579A44(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D579A4C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20D579A54);
  return result;
}

uint64_t sub_20D579A60(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20D579A68);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20D579A6C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D579A74(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D579A80(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_20D579A88(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ProxyError()
{
  return &type metadata for ProxyError;
}

unint64_t sub_20D579AA8()
{
  unint64_t result;

  result = qword_2549B8B90;
  if (!qword_2549B8B90)
  {
    result = MEMORY[0x212BA45A4](&unk_20D5B229C, &type metadata for ProxyError);
    atomic_store(result, (unint64_t *)&qword_2549B8B90);
  }
  return result;
}

id sub_20D579B1C()
{
  id result;

  result = sub_20D579B38();
  qword_2549BCF18 = (uint64_t)result;
  return result;
}

id sub_20D579B38()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;

  v0 = (void *)objc_opt_self();
  v64 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_2549F05B0);
  v63 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_254A1AB18);
  v62 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_254A1ABD0);
  v59 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_2549FF218);
  v61 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_254A1AC80);
  objc_msgSend(v61, sel_setInterface_forSelector_argumentIndex_ofReply_, v62, sel_getURLWithDownloadTracker_completionHandler_, 0, 0);
  v1 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_2549D26F0);
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_encodedClasses);
  sub_20D5A6CE4();

  v4 = (void *)sub_20D5A6CCC();
  swift_bridgeObjectRelease();
  v65 = v1;
  objc_msgSend(v1, sel_setClasses_forSelector_argumentIndex_ofReply_, v4, sel_previewItemAtIndex_withCompletionHandler_, 0, 1);

  objc_msgSend(v1, sel_setInterface_forSelector_argumentIndex_ofReply_, v61, sel_previewItemAtIndex_withCompletionHandler_, 1, 1);
  v60 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_2549E0228);
  v5 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_2549CA2E0);
  objc_msgSend(v5, sel_setInterface_forSelector_argumentIndex_ofReply_, v60, sel_setPrinter_, 0, 0);
  objc_msgSend(v5, sel_setInterface_forSelector_argumentIndex_ofReply_, v59, sel_showShareSheetWithPopoverTracker_customSharedURL_dismissCompletion_, 0, 0);
  v6 = objc_msgSend(v2, sel_customExtensionCommunicationEncodedClasses);
  sub_20D5A6CE4();

  v7 = (void *)sub_20D5A6CCC();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setClasses_forSelector_argumentIndex_ofReply_, v7, sel_forwardMessage_toItemAtIndex_withUUID_completionHandler_, 0, 0);

  v8 = objc_msgSend(v2, sel_customExtensionCommunicationEncodedClasses);
  sub_20D5A6CE4();

  v9 = (void *)sub_20D5A6CCC();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setClasses_forSelector_argumentIndex_ofReply_, v9, sel_forwardMessage_toItemAtIndex_withUUID_completionHandler_, 0, 1);

  v57 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_2549D96E8);
  v10 = objc_msgSend(v0, sel_interfaceWithProtocol_, &unk_254A05928);
  objc_msgSend(v10, sel_setInterface_forSelector_argumentIndex_ofReply_, v1, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_, 2, 0);
  v58 = v5;
  objc_msgSend(v10, sel_setInterface_forSelector_argumentIndex_ofReply_, v5, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_, 3, 0);
  objc_msgSend(v10, sel_setInterface_forSelector_argumentIndex_ofReply_, v1, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen_, 2, 0);
  objc_msgSend(v10, sel_setInterface_forSelector_argumentIndex_ofReply_, v5, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen_, 3, 0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B8E40);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_20D5B2360;
  v12 = sub_20D577BD0(0, &qword_2549BA720);
  *(_QWORD *)(v11 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8E50);
  *(_QWORD *)(v11 + 32) = v12;
  v13 = sub_20D577BD0(0, &qword_2549B8E58);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8E60);
  *(_QWORD *)(v11 + 88) = v14;
  v15 = v14;
  v54 = v14;
  *(_QWORD *)(v11 + 64) = v13;
  v16 = sub_20D577BD0(0, &qword_2549B8E68);
  *(_QWORD *)(v11 + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8E70);
  *(_QWORD *)(v11 + 96) = v16;
  v17 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
  v18 = (void *)sub_20D5A6BDC();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v17, sel_initWithArray_, v18);

  sub_20D577BD0(0, &qword_2549B8E78);
  sub_20D57AAF0();
  v20 = sub_20D5A6CE4();

  sub_20D57A680(v20);
  swift_bridgeObjectRelease();
  v21 = (void *)sub_20D5A6CCC();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setClasses_forSelector_argumentIndex_ofReply_, v21, sel_toolbarButtonsForTraitCollection_withCompletionHandler_, 0, 1);

  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_20D5B2370;
  *(_QWORD *)(v22 + 56) = v15;
  v23 = v13;
  *(_QWORD *)(v22 + 32) = v13;
  v56 = sub_20D577BD0(0, &qword_2549B8E88);
  v55 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B8E90);
  *(_QWORD *)(v22 + 88) = v55;
  *(_QWORD *)(v22 + 64) = v56;
  v24 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
  v25 = (void *)sub_20D5A6BDC();
  swift_bridgeObjectRelease();
  v26 = objc_msgSend(v24, sel_initWithArray_, v25);

  v27 = sub_20D5A6CE4();
  sub_20D57A680(v27);
  swift_bridgeObjectRelease();
  v28 = (void *)sub_20D5A6CCC();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setClasses_forSelector_argumentIndex_ofReply_, v28, sel_toolbarButtonsForTraitCollection_withCompletionHandler_, 1, 1);

  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_20D5B2370;
  *(_QWORD *)(v29 + 56) = v54;
  *(_QWORD *)(v29 + 32) = v23;
  v30 = sub_20D577BD0(0, &qword_2549BA6B0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8EA0);
  *(_QWORD *)(v29 + 88) = v31;
  *(_QWORD *)(v29 + 64) = v30;
  v32 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
  v33 = (void *)sub_20D5A6BDC();
  swift_bridgeObjectRelease();
  v34 = objc_msgSend(v32, sel_initWithArray_, v33);

  v35 = sub_20D5A6CE4();
  sub_20D57A680(v35);
  swift_bridgeObjectRelease();
  v36 = (void *)sub_20D5A6CCC();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setClasses_forSelector_argumentIndex_ofReply_, v36, sel_keyCommandsWithCompletionHandler_, 0, 1);

  v37 = swift_allocObject();
  *(_OWORD *)(v37 + 16) = xmmword_20D5B2370;
  *(_QWORD *)(v37 + 32) = v23;
  *(_QWORD *)(v37 + 88) = v31;
  *(_QWORD *)(v37 + 56) = v54;
  *(_QWORD *)(v37 + 64) = v30;
  v38 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
  v39 = (void *)sub_20D5A6BDC();
  swift_bridgeObjectRelease();
  v40 = objc_msgSend(v38, sel_initWithArray_, v39);

  v41 = sub_20D5A6CE4();
  sub_20D57A680(v41);
  swift_bridgeObjectRelease();
  v42 = (void *)sub_20D5A6CCC();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setClasses_forSelector_argumentIndex_ofReply_, v42, sel_keyCommandWasPerformed_, 0, 0);

  v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_20D5B2380;
  v44 = sub_20D577BD0(0, &qword_2549B8EA8);
  *(_QWORD *)(v43 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8EB0);
  *(_QWORD *)(v43 + 32) = v44;
  v45 = sub_20D577BD0(0, &qword_2549B8EB8);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8EC0);
  *(_QWORD *)(v43 + 64) = v45;
  *(_QWORD *)(v43 + 120) = v55;
  *(_QWORD *)(v43 + 88) = v46;
  *(_QWORD *)(v43 + 96) = v56;
  v47 = sub_20D577BD0(0, &qword_2549B8EC8);
  *(_QWORD *)(v43 + 152) = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8ED0);
  *(_QWORD *)(v43 + 128) = v47;
  v48 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
  v49 = (void *)sub_20D5A6BDC();
  swift_bridgeObjectRelease();
  v50 = objc_msgSend(v48, sel_initWithArray_, v49);

  v51 = sub_20D5A6CE4();
  sub_20D57A680(v51);
  swift_bridgeObjectRelease();
  v52 = (void *)sub_20D5A6CCC();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setClasses_forSelector_argumentIndex_ofReply_, v52, sel_setPreviewItemDisplayState_onItemAtIndex_, 0, 0);

  objc_msgSend(v10, sel_setInterface_forSelector_argumentIndex_ofReply_, v57, sel_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler_, 1, 0);
  objc_msgSend(v10, sel_setInterface_forSelector_argumentIndex_ofReply_, v64, sel_setNotificationCenter_, 0, 0);
  objc_msgSend(v10, (SEL)&selRef_requestPoliciesForCategoryIdentifiers_completionHandler_ + 2, v63, sel_getNetworkObserverWithCompletionBlock_, 0, 1);

  return v10;
}

uint64_t sub_20D57A680(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;

  v1 = a1;
  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_20D5A6DEC())
      goto LABEL_3;
LABEL_6:
    v3 = MEMORY[0x24BEE4B08];
    if (v2)
      goto LABEL_4;
LABEL_7:
    v8 = -1 << *(_BYTE *)(v1 + 32);
    v30 = v1 + 56;
    v5 = ~v8;
    v9 = -v8;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v7 = v10 & *(_QWORD *)(v1 + 56);
    swift_bridgeObjectRetain();
    result = swift_retain();
    v6 = 0;
    goto LABEL_11;
  }
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_6;
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8ED8);
  v3 = sub_20D5A6E10();
  if (!v2)
    goto LABEL_7;
LABEL_4:
  swift_bridgeObjectRetain();
  swift_retain();
  sub_20D5A6DE0();
  sub_20D577BD0(0, &qword_2549B8E78);
  sub_20D57AAF0();
  result = sub_20D5A6CF0();
  v1 = v34;
  v30 = v35;
  v5 = v36;
  v6 = v37;
  v7 = v38;
LABEL_11:
  v29 = (unint64_t)(v5 + 64) >> 6;
  v11 = v3 + 56;
  while (v1 < 0)
  {
    v16 = sub_20D5A6DF8();
    if (!v16)
      goto LABEL_45;
    *(_QWORD *)&v31 = v16;
    sub_20D577BD0(0, &qword_2549B8E78);
    swift_dynamicCast();
LABEL_36:
    sub_20D577BD0(0, &qword_2549B8E78);
    swift_dynamicCast();
    result = sub_20D5A6E04();
    v22 = -1 << *(_BYTE *)(v3 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_46;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = *(_QWORD *)(v3 + 48) + 40 * v12;
    *(_OWORD *)v13 = v31;
    *(_OWORD *)(v13 + 16) = v32;
    *(_QWORD *)(v13 + 32) = v33;
    ++*(_QWORD *)(v3 + 16);
  }
  if (v7)
  {
    v14 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v15 = v14 | (v6 << 6);
LABEL_35:
    v21 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v15);
    goto LABEL_36;
  }
  v17 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v17 >= v29)
      goto LABEL_45;
    v18 = *(_QWORD *)(v30 + 8 * v17);
    v19 = v6 + 1;
    if (!v18)
    {
      v19 = v6 + 2;
      if (v6 + 2 >= v29)
        goto LABEL_45;
      v18 = *(_QWORD *)(v30 + 8 * v19);
      if (!v18)
      {
        v19 = v6 + 3;
        if (v6 + 3 >= v29)
          goto LABEL_45;
        v18 = *(_QWORD *)(v30 + 8 * v19);
        if (!v18)
        {
          v19 = v6 + 4;
          if (v6 + 4 >= v29)
            goto LABEL_45;
          v18 = *(_QWORD *)(v30 + 8 * v19);
          if (!v18)
          {
            v19 = v6 + 5;
            if (v6 + 5 >= v29)
              goto LABEL_45;
            v18 = *(_QWORD *)(v30 + 8 * v19);
            if (!v18)
            {
              v20 = v6 + 6;
              while (v29 != v20)
              {
                v18 = *(_QWORD *)(v30 + 8 * v20++);
                if (v18)
                {
                  v19 = v20 - 1;
                  goto LABEL_34;
                }
              }
LABEL_45:
              swift_release();
              sub_20D57AB48();
              return v3;
            }
          }
        }
      }
    }
LABEL_34:
    v7 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v19 << 6);
    v6 = v19;
    goto LABEL_35;
  }
LABEL_46:
  __break(1u);
  return result;
}

id sub_20D57AAA4()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_254A059F8);
  qword_2549BCF20 = (uint64_t)result;
  return result;
}

unint64_t sub_20D57AAF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549B8E80;
  if (!qword_2549B8E80)
  {
    v1 = sub_20D577BD0(255, &qword_2549B8E78);
    result = MEMORY[0x212BA45A4](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2549B8E80);
  }
  return result;
}

uint64_t sub_20D57AB48()
{
  return swift_release();
}

uint64_t sub_20D57AB50()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D57C038();
  sub_20D5A6684();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_20D57ABBC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D57C038();
  sub_20D5A6684();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 16);
  return result;
}

uint64_t sub_20D57AC30()
{
  swift_getKeyPath();
  sub_20D57C038();
  sub_20D5A6678();
  return swift_release();
}

uint64_t sub_20D57ACC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC9QuickLookP33_CA8240D53F8462069CDA31A2DF9EC6E212HostingState___observationRegistrar;
  v2 = sub_20D5A66B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_20D57AD10()
{
  return type metadata accessor for HostingState();
}

uint64_t type metadata accessor for HostingState()
{
  uint64_t result;

  result = qword_2549B8F10;
  if (!qword_2549B8F10)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20D57AD54()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20D5A66B4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_20D57ADCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v21;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9058);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9060);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9068);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v6 = sub_20D5A68C4();
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9070);
  sub_20D57AFD0(a1, (uint64_t)&v6[*(int *)(v13 + 44)]);
  v14 = sub_20D5A6810();
  v15 = sub_20D5A696C();
  sub_20D57C228((uint64_t)v6, (uint64_t)v9, &qword_2549B9058);
  v16 = &v9[*(int *)(v7 + 36)];
  *(_QWORD *)v16 = v14;
  v16[8] = v15;
  sub_20D57C26C((uint64_t)v6, &qword_2549B9058);
  sub_20D5A6A8C();
  sub_20D57B600(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v12, 0.0, 1, INFINITY, 0);
  sub_20D57C26C((uint64_t)v9, &qword_2549B9060);
  v17 = sub_20D5A69D8();
  v18 = sub_20D5A696C();
  sub_20D57C228((uint64_t)v12, a2, &qword_2549B9068);
  v19 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9078) + 36);
  *(_QWORD *)v19 = v17;
  *(_BYTE *)(v19 + 8) = v18;
  return sub_20D57C26C((uint64_t)v12, &qword_2549B9068);
}

uint64_t sub_20D57AFD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t KeyPath;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v35 = a2;
  v3 = sub_20D5A67EC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9080);
  v29 = *(_QWORD *)(v7 - 8);
  v30 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9088);
  v10 = MEMORY[0x24BDAC7A8](v34);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v31 = (uint64_t)&v29 - v13;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9090);
  MEMORY[0x24BDAC7A8](v32);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9098);
  MEMORY[0x24BDAC7A8](v33);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v36 = a1;
  sub_20D57C038();
  sub_20D5A6684();
  swift_release();
  if (*(_BYTE *)(a1 + 16) == 1)
  {
    *(_QWORD *)v17 = sub_20D5A68A0();
    *((_QWORD *)v17 + 1) = 0;
    v17[16] = 1;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B90C8);
    sub_20D57B35C((uint64_t)&v17[*(int *)(v18 + 44)]);
    v19 = &qword_2549B9098;
    sub_20D57C228((uint64_t)v17, (uint64_t)v15, &qword_2549B9098);
    swift_storeEnumTagMultiPayload();
    sub_20D57C440(&qword_2549B90A8, &qword_2549B9098, MEMORY[0x24BDF4498]);
    sub_20D57C18C();
    sub_20D5A68DC();
    v20 = (uint64_t)v17;
  }
  else
  {
    sub_20D5A67F8();
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDEB490], v3);
    KeyPath = swift_getKeyPath();
    v22 = (uint64_t *)&v12[*(int *)(v34 + 36)];
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B90A0);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v22 + *(int *)(v23 + 28), v6, v3);
    *v22 = KeyPath;
    v25 = v29;
    v24 = v30;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v12, v9, v30);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v24);
    v26 = (uint64_t)v12;
    v27 = v31;
    sub_20D57C100(v26, v31);
    v19 = &qword_2549B9088;
    sub_20D57C228(v27, (uint64_t)v15, &qword_2549B9088);
    swift_storeEnumTagMultiPayload();
    sub_20D57C440(&qword_2549B90A8, &qword_2549B9098, MEMORY[0x24BDF4498]);
    sub_20D57C18C();
    sub_20D5A68DC();
    v20 = v27;
  }
  return sub_20D57C26C(v20, v19);
}

uint64_t sub_20D57B35C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t KeyPath;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = sub_20D5A67EC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9080);
  v32 = *(_QWORD *)(v6 - 8);
  v33 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9088);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v29 - v13;
  sub_20D5A68AC();
  v15 = sub_20D5A699C();
  v29 = v16;
  v30 = v15;
  v31 = v17;
  v19 = v18 & 1;
  sub_20D5A67F8();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDEB490], v2);
  KeyPath = swift_getKeyPath();
  v21 = (uint64_t *)&v12[*(int *)(v9 + 36)];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B90A0);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))((char *)v21 + *(int *)(v22 + 28), v5, v2);
  *v21 = KeyPath;
  v24 = v32;
  v23 = v33;
  (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v12, v8, v33);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v23);
  sub_20D57C100((uint64_t)v12, (uint64_t)v14);
  sub_20D57C228((uint64_t)v14, (uint64_t)v12, &qword_2549B9088);
  v26 = v29;
  v25 = v30;
  *(_QWORD *)a1 = v30;
  *(_QWORD *)(a1 + 8) = v26;
  *(_BYTE *)(a1 + 16) = v19;
  *(_QWORD *)(a1 + 24) = v31;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B90D0);
  sub_20D57C228((uint64_t)v12, a1 + *(int *)(v27 + 48), &qword_2549B9088);
  sub_20D57C2A8(v25, v26, v19);
  swift_bridgeObjectRetain();
  sub_20D57C26C((uint64_t)v14, &qword_2549B9088);
  sub_20D57C26C((uint64_t)v12, &qword_2549B9088);
  sub_20D57C2B8(v25, v26, v19);
  return swift_bridgeObjectRelease();
}

__n128 sub_20D57B600@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  _OWORD *v24;
  __n128 result;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __n128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_20D5A6D20();
    v23 = (void *)sub_20D5A6960();
    sub_20D5A67BC();

  }
  sub_20D5A681C();
  sub_20D57C228(v13, a9, &qword_2549B9060);
  v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9068) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *v24 = v26;
  v24[1] = v27;
  result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_20D57B7C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_20D57ADCC(*v1, a1);
}

id sub_20D57B7CC(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  objc_super v33;

  v9 = OBJC_IVAR____TtC9QuickLook23QLHostPlaceholderUIView_hostingState;
  type metadata accessor for HostingState();
  v10 = swift_allocObject();
  *(_BYTE *)(v10 + 16) = 0;
  v11 = v4;
  sub_20D5A66A8();
  *(_QWORD *)&v4[v9] = v10;

  v33.receiver = v11;
  v33.super_class = (Class)type metadata accessor for QLHostPlaceholderUIView();
  v12 = objc_msgSendSuper2(&v33, sel_initWithFrame_, a1, a2, a3, a4);
  v13 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B9040));
  v14 = v12;
  swift_retain();
  v15 = (void *)sub_20D5A6804();
  v16 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v15, sel_setBackgroundColor_, v16);

  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v14, sel_addSubview_, v15);
  v17 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA7C0);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_20D5B2390;
  v19 = objc_msgSend(v14, sel_leadingAnchor);
  v20 = objc_msgSend(v15, sel_leadingAnchor);
  v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v20);

  *(_QWORD *)(v18 + 32) = v21;
  v22 = objc_msgSend(v14, sel_trailingAnchor);
  v23 = objc_msgSend(v15, sel_trailingAnchor);
  v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_, v23);

  *(_QWORD *)(v18 + 40) = v24;
  v25 = objc_msgSend(v14, sel_topAnchor);
  v26 = objc_msgSend(v15, sel_topAnchor);
  v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_, v26);

  *(_QWORD *)(v18 + 48) = v27;
  v28 = objc_msgSend(v14, sel_bottomAnchor);
  v29 = objc_msgSend(v15, sel_bottomAnchor);
  v30 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v29);

  *(_QWORD *)(v18 + 56) = v30;
  sub_20D5A6BF4();
  sub_20D57C080();
  v31 = (void *)sub_20D5A6BDC();
  swift_bridgeObjectRelease();
  objc_msgSend(v17, sel_activateConstraints_, v31);

  return v14;
}

id sub_20D57BD40()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLHostPlaceholderUIView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for QLHostPlaceholderUIView()
{
  return objc_opt_self();
}

uint64_t storeEnumTagSinglePayload for HostingState.State(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_20D57BDEC + 4 * byte_20D5B23A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20D57BE20 + 4 * byte_20D5B23A0[v4]))();
}

uint64_t sub_20D57BE20(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D57BE28(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20D57BE30);
  return result;
}

uint64_t sub_20D57BE3C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20D57BE44);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20D57BE48(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D57BE50(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HostingState.State()
{
  return &type metadata for HostingState.State;
}

unint64_t sub_20D57BE70()
{
  unint64_t result;

  result = qword_2549B9030;
  if (!qword_2549B9030)
  {
    result = MEMORY[0x212BA45A4](&unk_20D5B2450, &type metadata for HostingState.State);
    atomic_store(result, (unint64_t *)&qword_2549B9030);
  }
  return result;
}

uint64_t sub_20D57BEB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_20D5A67EC();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return MEMORY[0x212BA308C](v4);
}

uint64_t sub_20D57BF30()
{
  swift_getKeyPath();
  sub_20D57C038();
  swift_retain();
  sub_20D5A6678();
  swift_release();
  return swift_release();
}

void sub_20D57C028()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 16) = *(_BYTE *)(v0 + 24);
}

unint64_t sub_20D57C038()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549B9038;
  if (!qword_2549B9038)
  {
    v1 = type metadata accessor for HostingState();
    result = MEMORY[0x212BA45A4](&unk_20D5B2478, v1);
    atomic_store(result, (unint64_t *)&qword_2549B9038);
  }
  return result;
}

unint64_t sub_20D57C080()
{
  unint64_t result;

  result = qword_2549B9050;
  if (!qword_2549B9050)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549B9050);
  }
  return result;
}

ValueMetadata *type metadata accessor for InnerView()
{
  return &type metadata for InnerView;
}

uint64_t sub_20D57C0CC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D57C0DC()
{
  return sub_20D5A6828();
}

uint64_t sub_20D57C100(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9088);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BA4598](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_20D57C18C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549B90B0;
  if (!qword_2549B90B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549B9088);
    v2[0] = sub_20D57C440(&qword_2549B90B8, &qword_2549B9080, MEMORY[0x24BDEBC00]);
    v2[1] = sub_20D57C440(&qword_2549B90C0, &qword_2549B90A0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x212BA45A4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549B90B0);
  }
  return result;
}

uint64_t sub_20D57C228(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20D57C26C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20D57C2A8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_20D57C2B8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_20D57C2CC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549B90D8;
  if (!qword_2549B90D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549B9078);
    v2[0] = sub_20D57C350();
    v2[1] = sub_20D57C440(&qword_2549B90F8, (uint64_t *)&unk_2549B9100, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x212BA45A4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549B90D8);
  }
  return result;
}

unint64_t sub_20D57C350()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549B90E0;
  if (!qword_2549B90E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549B9068);
    v2[0] = sub_20D57C3BC();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x212BA45A4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549B90E0);
  }
  return result;
}

unint64_t sub_20D57C3BC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549B90E8;
  if (!qword_2549B90E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549B9060);
    v2[0] = sub_20D57C440(&qword_2549B90F0, &qword_2549B9058, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDF1050];
    result = MEMORY[0x212BA45A4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549B90E8);
  }
  return result;
}

uint64_t sub_20D57C440(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x212BA45A4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_20D57C480()
{
  sub_20D57C028();
}

uint64_t QLPreviewReply.stringEncoding.getter()
{
  void *v0;

  objc_msgSend(v0, sel_stringEncoding);
  return sub_20D5A6B28();
}

uint64_t sub_20D57C4C4(uint64_t a1, id *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_20D5A6B40();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  objc_msgSend(*a2, sel_setStringEncoding_, sub_20D5A6B34());
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t QLPreviewReply.stringEncoding.setter(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;

  v2 = v1;
  objc_msgSend(v2, sel_setStringEncoding_, sub_20D5A6B34());
  v4 = sub_20D5A6B40();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
}

void (*QLPreviewReply.stringEncoding.modify(_QWORD *a1))(void ***a1, char a2)
{
  void *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = sub_20D5A6B40();
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  objc_msgSend(v1, sel_stringEncoding);
  sub_20D5A6B28();
  return sub_20D57C654;
}

void sub_20D57C654(void ***a1, char a2)
{
  void **v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void *, void *, void *);
  void *v7;
  void (*v8)(void *, void *, void *);

  v2 = *a1;
  v3 = (*a1)[3];
  v4 = (*a1)[4];
  v5 = (*a1)[1];
  v6 = (void (**)(void *, void *, void *))(*a1)[2];
  v7 = **a1;
  if ((a2 & 1) != 0)
  {
    v6[2]((*a1)[3], v4, v5);
    objc_msgSend(v7, sel_setStringEncoding_, sub_20D5A6B34());
    v8 = v6[1];
    ((void (*)(void *, void *))v8)(v3, v5);
  }
  else
  {
    objc_msgSend(v7, sel_setStringEncoding_, sub_20D5A6B34());
    v8 = v6[1];
  }
  ((void (*)(void *, void *))v8)(v4, v5);
  free(v4);
  free(v3);
  free(v2);
}

id QLPreviewReply.init(contextSize:isBitmap:drawUsing:)(char a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[6];

  v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a2;
  *(_QWORD *)(v11 + 24) = a3;
  v15[4] = sub_20D57C8E0;
  v15[5] = v11;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1107296256;
  v15[2] = sub_20D57C8E8;
  v15[3] = &block_descriptor_2;
  v12 = _Block_copy(v15);
  swift_retain();
  swift_release();
  v13 = objc_msgSend(v10, sel_initWithContextSize_isBitmap_drawingBlock_, a1 & 1, v12, a4, a5);
  swift_release();
  _Block_release(v12);
  return v13;
}

uint64_t sub_20D57C820(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  return 1;
}

uint64_t sub_20D57C8BC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D57C8E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_20D57C820(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_20D57C8E8(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t (*v7)(id, id, uint64_t);
  id v8;
  id v9;

  v7 = *(uint64_t (**)(id, id, uint64_t))(a1 + 32);
  swift_retain();
  v8 = a2;
  v9 = a3;
  LOBYTE(a4) = v7(v8, v9, a4);
  swift_release();

  return a4 & 1;
}

id QLPreviewReply.init(forPDFWithPageSize:createDocumentUsing:)(uint64_t a1, uint64_t a2, double a3, double a4)
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[6];

  v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  v13[4] = sub_20D57CAF0;
  v13[5] = v9;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_20D57CAF8;
  v13[3] = &block_descriptor_6_0;
  v10 = _Block_copy(v13);
  swift_retain();
  swift_release();
  v11 = objc_msgSend(v8, sel_initForPDFWithPageSize_documentCreationBlock_, v10, a3, a4);
  swift_release();
  _Block_release(v10);
  return v11;
}

uint64_t sub_20D57CA58(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_20D57CAF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_20D57CA58(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

id sub_20D57CAF8(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  void *v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = (void *)v3();
  swift_release();

  return v5;
}

id QLPreviewReply.init(dataOfContentType:contentSize:createDataUsing:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v17[6];

  v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v11 = (void *)sub_20D5A6798();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  v17[4] = sub_20D57CD28;
  v17[5] = v12;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 1107296256;
  v17[2] = sub_20D57CD30;
  v17[3] = &block_descriptor_12_0;
  v13 = _Block_copy(v17);
  swift_retain();
  swift_release();
  v14 = objc_msgSend(v10, sel_initWithDataOfContentType_contentSize_dataCreationBlock_, v11, v13, a4, a5);
  _Block_release(v13);
  swift_release();

  v15 = sub_20D5A67B0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a1, v15);
  return v14;
}

uint64_t sub_20D57CC8C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_20D57CD28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_20D57CC8C(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

id sub_20D57CD30(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = v3();
  v7 = v6;
  swift_release();

  if (v7 >> 60 == 15)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)sub_20D5A6624();
    sub_20D57CDFC(v5, v7);
  }
  return v8;
}

uint64_t sub_20D57CDC8(id *a1)
{
  objc_msgSend(*a1, sel_stringEncoding);
  return sub_20D5A6B28();
}

uint64_t sub_20D57CDFC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_20D57CE10(a1, a2);
  return a1;
}

uint64_t sub_20D57CE10(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

unint64_t sub_20D57CE54()
{
  unint64_t result;

  result = qword_2549B9110;
  if (!qword_2549B9110)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549B9110);
  }
  return result;
}

uint64_t sub_20D57CE9C()
{
  uint64_t v0;

  v0 = sub_20D5A67E0();
  __swift_allocate_value_buffer(v0, qword_2549B9118);
  __swift_project_value_buffer(v0, (uint64_t)qword_2549B9118);
  return sub_20D5A67D4();
}

uint64_t QLPrimaryAppExtensionScene.init(content:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = 0x7972616D697270;
  a3[1] = 0xE700000000000000;
  a3[2] = result;
  a3[3] = a2;
  return result;
}

uint64_t QLPrimaryAppExtensionScene.body.getter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *v1;
  v4 = v1[3];
  type metadata accessor for QLAppExtensionSceneProxy(0);
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v5 + 24) = 0;
  sub_20D5A66A8();
  v6 = swift_allocObject();
  v8 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(v6 + 16) = v8;
  *(_QWORD *)(v6 + 24) = v7;
  *(_QWORD *)(v6 + 32) = v3;
  *(_OWORD *)(v6 + 40) = *(_OWORD *)(v1 + 1);
  *(_QWORD *)(v6 + 56) = v4;
  *(_QWORD *)(v6 + 64) = v5;
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_retain();
  return sub_20D5A66C0();
}

uint64_t sub_20D57D02C@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(uint64_t);
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v5 = *(_QWORD *)(a2 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v15 - v10;
  v12(v9);
  sub_20D58F5BC((uint64_t)v8, a2, (uint64_t)v11);
  v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v8, a2);
  sub_20D58F27C((uint64_t)v11, a2, a3);
  return ((uint64_t (*)(char *, uint64_t))v13)(v11, a2);
}

uint64_t sub_20D57D108()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D57D13C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20D57D02C(*(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_20D57D150(id a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  if (qword_2549B7F20 != -1)
    swift_once();
  objc_msgSend(a1, sel_setExportedInterface_, qword_2549BCF18);
  objc_msgSend(a1, sel_setExportedObject_, a2);
  objc_msgSend(a1, sel_resume);
  sub_20D57D5C0();
  sub_20D578808(a1);
  if (!v4)
  {
    if (qword_2549B7F30 != -1)
      swift_once();
    v8 = sub_20D5A67E0();
    __swift_project_value_buffer(v8, (uint64_t)qword_2549B9118);
    v9 = sub_20D5A67C8();
    v10 = sub_20D5A6D14();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_20D4F5000, v9, v10, "Failed to set hostApplicationBundleIdentifier on proxy", v11, 2u);
      MEMORY[0x212BA4658](v11, -1, -1);
    }

    return 1;
  }
  swift_getKeyPath();
  sub_20D57D604();
  sub_20D5A6684();
  swift_release();
  result = MEMORY[0x212BA4700](a2 + 16);
  if (result)
  {
    v6 = (void *)result;
    v7 = (void *)sub_20D5A6AD4();
    objc_msgSend(v6, sel_setHostApplicationBundleIdentifier_, v7);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

    return 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_20D57D34C(void *a1)
{
  uint64_t v1;

  return sub_20D57D150(a1, v1);
}

uint64_t sub_20D57D354(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x212BA45A4](&protocol conformance descriptor for QLPrimaryAppExtensionScene<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_20D57D380()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D57D3BC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t initializeBufferWithCopyOfBuffer for PreviewApplication.PreviewConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_20D57D3F4()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_20D57D41C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *sub_20D57D464(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_20D57D4D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t sub_20D57D520(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_20D57D568(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for QLPrimaryAppExtensionScene(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for QLPrimaryAppExtensionScene);
}

uint64_t sub_20D57D5B4()
{
  return MEMORY[0x24BDC7A50];
}

unint64_t sub_20D57D5C0()
{
  unint64_t result;

  result = qword_2549B91B0;
  if (!qword_2549B91B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549B91B0);
  }
  return result;
}

unint64_t sub_20D57D604()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549B8300;
  if (!qword_2549B8300)
  {
    v1 = type metadata accessor for QLAppExtensionSceneProxy(255);
    result = MEMORY[0x212BA45A4](&protocol conformance descriptor for QLAppExtensionSceneProxy, v1);
    atomic_store(result, &qword_2549B8300);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x212BA4538](a1, v6, a5);
}

uint64_t static QLWebLocationBarViewInterface.makeLocationBarUI(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v12;

  v2 = type metadata accessor for QLWebLocationBarView();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v12 - v6;
  v8 = sub_20D5A6618();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v7, a1, v8);
  sub_20D57D74C((uint64_t)v7, (uint64_t)v5);
  v9 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2549B91B8));
  v10 = sub_20D5A68D0();
  sub_20D57D790((uint64_t)v7);
  return v10;
}

uint64_t sub_20D57D74C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for QLWebLocationBarView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D57D790(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for QLWebLocationBarView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id QLWebLocationBarViewInterface.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id QLWebLocationBarViewInterface.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLWebLocationBarViewInterface();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for QLWebLocationBarViewInterface()
{
  return objc_opt_self();
}

id QLWebLocationBarViewInterface.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLWebLocationBarViewInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t QLHostRemoteView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B91E8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *v1;
  v6 = v1[1];
  *v5 = sub_20D5A6A8C();
  v5[1] = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B91F0);
  sub_20D57DAAC(v7, v6, (uint64_t *)((char *)v5 + *(int *)(v9 + 44)));
  v10 = sub_20D5A6810();
  LOBYTE(v7) = sub_20D5A696C();
  sub_20D57C228((uint64_t)v5, a1, &qword_2549B91E8);
  v11 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B91F8) + 36);
  *(_QWORD *)v11 = v10;
  *(_BYTE *)(v11 + 8) = v7;
  return sub_20D57C26C((uint64_t)v5, &qword_2549B91E8);
}

uint64_t sub_20D57DAAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v20 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9210);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - v9;
  v21 = a1;
  v22 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9218);
  sub_20D5A6A08();
  v11 = v23;
  swift_getKeyPath();
  v21 = v11;
  sub_20D57DF28();
  sub_20D5A6684();
  swift_release();
  v12 = *(_QWORD *)(v11 + 40);
  swift_retain();
  swift_release();
  v21 = a1;
  v22 = a2;
  sub_20D5A6A08();
  v13 = v23;
  swift_getKeyPath();
  v21 = v13;
  sub_20D5A6684();
  swift_release();
  v14 = *(unsigned __int8 *)(v13 + 16);
  swift_release();
  if (v14 == 1)
  {
    v21 = a1;
    v22 = a2;
    sub_20D5A6A08();
    type metadata accessor for QLHostRemoteViewModel();
    sub_20D5A6A5C();
    v15 = type metadata accessor for QLHostDebugView();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v10, 0, 1, v15);
  }
  else
  {
    v16 = type metadata accessor for QLHostDebugView();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v10, 1, 1, v16);
  }
  sub_20D57C228((uint64_t)v10, (uint64_t)v8, &qword_2549B9210);
  v17 = v20;
  *v20 = v12;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9220);
  sub_20D57C228((uint64_t)v8, (uint64_t)v17 + *(int *)(v18 + 48), &qword_2549B9210);
  swift_retain();
  sub_20D57C26C((uint64_t)v10, &qword_2549B9210);
  sub_20D57C26C((uint64_t)v8, &qword_2549B9210);
  return swift_release();
}

uint64_t sub_20D57DD08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D57DD18@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B91E8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *v1;
  v6 = v1[1];
  *v5 = sub_20D5A6A8C();
  v5[1] = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B91F0);
  sub_20D57DAAC(v7, v6, (uint64_t *)((char *)v5 + *(int *)(v9 + 44)));
  v10 = sub_20D5A6810();
  LOBYTE(v7) = sub_20D5A696C();
  sub_20D57C228((uint64_t)v5, a1, &qword_2549B91E8);
  v11 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B91F8) + 36);
  *(_QWORD *)v11 = v10;
  *(_BYTE *)(v11 + 8) = v7;
  return sub_20D57C26C((uint64_t)v5, &qword_2549B91E8);
}

_QWORD *assignWithCopy for QLHostRemoteView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for QLHostRemoteView()
{
  return &type metadata for QLHostRemoteView;
}

unint64_t sub_20D57DE68()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549B9200;
  if (!qword_2549B9200)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549B91F8);
    v2[0] = sub_20D57DED4();
    v2[1] = MEMORY[0x24BDF1050];
    result = MEMORY[0x212BA45A4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549B9200);
  }
  return result;
}

unint64_t sub_20D57DED4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549B9208;
  if (!qword_2549B9208)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549B91E8);
    result = MEMORY[0x212BA45A4](MEMORY[0x24BDF4750], v1);
    atomic_store(result, (unint64_t *)&qword_2549B9208);
  }
  return result;
}

unint64_t sub_20D57DF28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549BA2C0;
  if (!qword_2549BA2C0)
  {
    v1 = type metadata accessor for QLHostRemoteViewModel();
    result = MEMORY[0x212BA45A4](&unk_20D5B3220, v1);
    atomic_store(result, (unint64_t *)&qword_2549BA2C0);
  }
  return result;
}

uint64_t sub_20D57DF78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4[8] = a3;
  v4[9] = v3;
  v4[6] = a1;
  v4[7] = a2;
  v5 = sub_20D5A672C();
  v4[10] = v5;
  v4[11] = *(_QWORD *)(v5 - 8);
  v4[12] = swift_task_alloc();
  v6 = sub_20D5A6660();
  v4[13] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v4[14] = v7;
  v4[15] = *(_QWORD *)(v7 + 64);
  v4[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9368);
  v4[17] = swift_task_alloc();
  v4[18] = swift_task_alloc();
  v4[19] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_2549B9F50);
  v4[20] = swift_task_alloc();
  v8 = sub_20D5A6780();
  v4[21] = v8;
  v4[22] = *(_QWORD *)(v8 - 8);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v9 = sub_20D5A6708();
  v4[25] = v9;
  v4[26] = *(_QWORD *)(v9 - 8);
  v4[27] = swift_task_alloc();
  v10 = sub_20D5A6714();
  v4[28] = v10;
  v4[29] = *(_QWORD *)(v10 - 8);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20D57E104()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[30];
  v1 = v0[31];
  v3 = v0[28];
  v4 = v0[29];
  v0[32] = OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_quickLookPreviewAppExtensionPointQuery;
  sub_20D5A6720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  sub_20D570178((unint64_t *)&unk_2549BA2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7820], MEMORY[0x24BDC7830]);
  sub_20D5A6CC0();
  sub_20D570178(&qword_2549B9370, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7808], MEMORY[0x24BDC7810]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[33] = v5;
  *v5 = v0;
  v5[1] = sub_20D57E208;
  return sub_20D5A6C3C();
}

uint64_t sub_20D57E208()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 272) = v0;
  swift_task_dealloc();
  if (v0)
    (*(void (**)(_QWORD, _QWORD))(v2[26] + 8))(v2[27], v2[25]);
  return swift_task_switch();
}

uint64_t sub_20D57E27C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = v0[5];
  v3 = v0[26];
  v2 = v0[27];
  v4 = v0[25];
  if (!v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
LABEL_8:
    v10 = v0[11];
    v9 = v0[12];
    v11 = v0[10];
    v12 = v0[9] + v0[32];
    sub_20D5A6E1C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    sub_20D5A6B4C();
    sub_20D5A6B88();
    swift_bridgeObjectRelease();
    sub_20D5A6B88();
    return sub_20D5A6E94();
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (*(_QWORD *)(v1 + 16))
  {
    (*(void (**)(_QWORD, unint64_t, _QWORD))(v0[22] + 16))(v0[20], v1 + ((*(unsigned __int8 *)(v0[22] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[22] + 80)), v0[21]);
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  v6 = v0[21];
  v7 = v0[22];
  v8 = v0[20];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v8, v5, 1, v6);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v8, 1, v6) == 1)
  {
    sub_20D57C26C(v0[20], qword_2549B9F50);
    goto LABEL_8;
  }
  v14 = v0[23];
  v15 = v0[24];
  v17 = v0[21];
  v16 = v0[22];
  v29 = v0[19];
  v30 = v0[18];
  v18 = v0[16];
  v32 = v0[17];
  v19 = v0[14];
  v20 = v0[13];
  v21 = v0[8];
  v31 = v0[9];
  v22 = v0[7];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 32))(v15, v0[20], v17);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v14, v15, v17);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v18, v21, v20);
  v23 = (*(unsigned __int8 *)(v19 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v22;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v19 + 32))(v24 + v23, v18, v20);
  swift_unknownObjectRetain();
  sub_20D5A6738();
  v25 = sub_20D5A6750();
  v26 = *(_QWORD *)(v25 - 8);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v26 + 56))(v29, 0, 1, v25);
  sub_20D57F334(v29, v30, &qword_2549B9368);
  v27 = v31 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_config;
  swift_beginAccess();
  sub_20D57F378(v30, v27, &qword_2549B9368);
  swift_endAccess();
  sub_20D57F3BC(v27, v32);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v32, 1, v25);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v28 = (_QWORD *)swift_task_alloc();
    v0[35] = v28;
    *v28 = v0;
    v28[1] = sub_20D57E6E0;
    return sub_20D5A675C();
  }
  return result;
}

uint64_t sub_20D57E604()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 232) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 224));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D57E6E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 288) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D57E744()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 248);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 232);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 168));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D57E834()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 168));
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 232) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 224));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D57E920(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3[16] = a1;
  v3[17] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9348);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  v6 = sub_20D5A6774();
  v3[20] = v6;
  v3[21] = *(_QWORD *)(v6 - 8);
  v7 = swift_task_alloc();
  v3[22] = v7;
  v3[23] = sub_20D5A6C54();
  v3[24] = sub_20D5A6C48();
  v8 = (_QWORD *)swift_task_alloc();
  v3[25] = v8;
  *v8 = v3;
  v8[1] = sub_20D57EA10;
  return sub_20D57DF78(v7, a1, a2);
}

uint64_t sub_20D57EA10()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D57EA98()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;

  v1 = v0[26];
  v3 = v0[21];
  v2 = v0[22];
  v5 = v0[19];
  v4 = v0[20];
  v7 = v0[17];
  v6 = v0[18];
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v5, v2, v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v5, 0, 1, v4);
  sub_20D57F334(v5, v6, &qword_2549B9348);
  v8 = v7 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_previewApplicationProcess;
  swift_beginAccess();
  sub_20D57F378(v6, v8, &qword_2549B9348);
  swift_endAccess();
  v9 = (void *)sub_20D5A6768();
  if (v1)
    return swift_unexpectedError();
  v11 = v9;
  objc_msgSend(v9, sel_setExportedObject_, v0[16]);
  v12 = (void *)objc_opt_self();
  v13 = objc_msgSend(v12, sel_interfaceWithProtocol_, &unk_254A05DB0);
  objc_msgSend(v11, sel_setExportedInterface_, v13);

  v14 = objc_msgSend(v12, sel_interfaceWithProtocol_, &unk_254A1B1A8);
  objc_msgSend(v11, sel_setRemoteObjectInterface_, v14);

  objc_msgSend(v11, sel_resume);
  if (objc_msgSend(v11, sel_remoteObjectInterface))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B8E40);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_20D5B2370;
    v16 = sub_20D577BD0(0, &qword_2549B8E58);
    *(_QWORD *)(v15 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8E60);
    *(_QWORD *)(v15 + 32) = v16;
    v17 = sub_20D577BD0(0, (unint64_t *)&qword_2549B9350);
    *(_QWORD *)(v15 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9358);
    *(_QWORD *)(v15 + 64) = v17;
    v18 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
    v19 = (void *)sub_20D5A6BDC();
    swift_bridgeObjectRelease();
    objc_msgSend(v18, sel_initWithArray_, v19);

    result = sub_20D5A6CD8();
    __break(1u);
  }
  else
  {
    if (!objc_msgSend(v11, sel_remoteObjectInterface))
    {
      v25 = v0[21];
      v26 = v0[22];
      v27 = v0[20];
      v0[6] = QLPHDisplayVelocityFromQLPXDisplayVelocity;
      v0[7] = 0;
      v0[2] = MEMORY[0x24BDAC760];
      v0[3] = 1107296256;
      v0[4] = sub_20D5A3B6C;
      v0[5] = &block_descriptor_3;
      v28 = _Block_copy(v0 + 2);
      v29 = objc_msgSend(v11, sel_synchronousRemoteObjectProxyWithErrorHandler_, v28);
      _Block_release(v28);
      sub_20D5A6DC8();
      swift_unknownObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v26, v27);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9360);
      swift_dynamicCast();
      v30 = v0[15];
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return ((uint64_t (*)(uint64_t))v0[1])(v30);
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B8E40);
    v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_20D5B2370;
    v21 = sub_20D577BD0(0, &qword_2549B8E58);
    *(_QWORD *)(v20 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8E60);
    *(_QWORD *)(v20 + 32) = v21;
    v22 = sub_20D577BD0(0, (unint64_t *)&qword_2549B9350);
    *(_QWORD *)(v20 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9358);
    *(_QWORD *)(v20 + 64) = v22;
    v23 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
    v24 = (void *)sub_20D5A6BDC();
    swift_bridgeObjectRelease();
    objc_msgSend(v23, sel_initWithArray_, v24);

    result = sub_20D5A6CD8();
  }
  __break(1u);
  return result;
}

uint64_t sub_20D57F034()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D57F090()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_quickLookPreviewAppExtensionPointQuery;
  v2 = sub_20D5A672C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_20D57C26C(v0 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_previewApplicationProcess, &qword_2549B9348);
  sub_20D57C26C(v0 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_config, &qword_2549B9368);
  return swift_deallocClassInstance();
}

uint64_t sub_20D57F110()
{
  return type metadata accessor for QLHostRemotePreviewModel();
}

uint64_t type metadata accessor for QLHostRemotePreviewModel()
{
  uint64_t result;

  result = qword_2549B9258;
  if (!qword_2549B9258)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20D57F154()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_20D5A672C();
  if (v0 <= 0x3F)
  {
    sub_20D57F214(319, (unint64_t *)&qword_2549BA070, (void (*)(uint64_t))MEMORY[0x24BDC78A8]);
    if (v1 <= 0x3F)
    {
      sub_20D57F214(319, qword_2549B9278, (void (*)(uint64_t))MEMORY[0x24BDC7870]);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_20D57F214(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_20D5A6DA4();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_20D57F260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_20D5A6660();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_20D57F2D4()
{
  uint64_t v0;
  void *v1;
  id v2;

  sub_20D5A6660();
  v1 = *(void **)(v0 + 16);
  v2 = (id)sub_20D5A663C();
  objc_msgSend(v1, sel_previewTerminatedWithSessionUUID_, v2);

}

uint64_t sub_20D57F334(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_20D57F378(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_20D57F3BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9368);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D57F404()
{
  uint64_t v0;

  v0 = sub_20D5A67E0();
  __swift_allocate_value_buffer(v0, qword_2549B9378);
  __swift_project_value_buffer(v0, (uint64_t)qword_2549B9378);
  return sub_20D5A67D4();
}

id sub_20D57F484(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)sub_20D5A65E8();
  v13[0] = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_wrapperWithURL_readonly_error_, v4, a2 & 1, v13);

  v6 = v13[0];
  if (v5)
  {
    v7 = sub_20D5A6618();
    v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v9 = v6;
    v8(a1, v7);
  }
  else
  {
    v10 = v13[0];
    sub_20D5A65D0();

    swift_willThrow();
    v11 = sub_20D5A6618();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

uint64_t sub_20D57F5A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = a5;
  sub_20D5A6C54();
  v5[4] = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D57F6CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = a5;
  sub_20D5A6C54();
  v5[4] = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D57F738()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 16);
  swift_release();
  v3 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v4 = objc_msgSend(v3, sel_connectedScenes);

  sub_20D577BD0(0, &qword_2549B94B8);
  sub_20D582D34();
  v5 = sub_20D5A6CE4();

  swift_bridgeObjectRetain();
  sub_20D5820A8(v5, v2, v1);
  v7 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
    objc_opt_self();

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D57F844(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = sub_20D5A6660();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6648();
  a4(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_20D57F958(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94C8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v12 + 48))(a1, 1) == 1)
  {
    sub_20D582E08(a1);
    sub_20D580084(a2, (uint64_t)v8);
    v13 = sub_20D5A6660();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a2, v13);
    return sub_20D582E08((uint64_t)v8);
  }
  else
  {
    sub_20D582C38(a1, (uint64_t)v11);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v3;
    *v3 = 0x8000000000000000;
    sub_20D580B84((uint64_t)v11, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v18;
    swift_bridgeObjectRelease();
    v16 = sub_20D5A6660();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a2, v16);
  }
}

uint64_t sub_20D57FB44()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for HostHandler()
{
  return objc_opt_self();
}

uint64_t sub_20D57FB74()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_20D57FB7C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_20D5A6CB4();
  if (v1 <= 0x3F)
  {
    result = sub_20D5A6CA8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_20D57FC0C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20D5A6CB4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 28);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_20D5A6CA8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_20D57FCC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_20D5A6CB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 28);
  v6 = sub_20D5A6CA8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_20D57FD30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_20D5A6CB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_20D5A6CA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_20D57FDB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_20D5A6CB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_20D5A6CA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_20D57FE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_20D5A6CB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_20D5A6CA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_20D57FEC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_20D5A6CB4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_20D5A6CA8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_20D57FF50()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D57FF5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_20D5A6CB4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_20D5A6CA8();
    v10 = a1 + *(int *)(a3 + 28);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_20D57FFDC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D57FFE8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_20D5A6CB4();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_20D5A6CA8();
    v12 = a1 + *(int *)(a4 + 28);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for DataProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DataProvider);
}

uint64_t sub_20D580084@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_20D5883EC(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v17 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_20D580F4C();
      v9 = v17;
    }
    v10 = *(_QWORD *)(v9 + 48);
    v11 = sub_20D5A6660();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v6, v11);
    v12 = *(_QWORD *)(v9 + 56);
    v13 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
    v14 = *(_QWORD *)(v13 - 8);
    sub_20D582C38(v12 + *(_QWORD *)(v14 + 72) * v6, a2);
    sub_20D5808B0(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a2, 0, 1, v13);
  }
  else
  {
    v16 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 1, 1, v16);
  }
}

uint64_t sub_20D5801B8(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t result;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  uint64_t i;
  uint64_t v47;
  int v48;
  uint64_t v49;

  v3 = v2;
  v5 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  v47 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v49 = (uint64_t)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20D5A6660();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94F0);
  v48 = a2;
  v12 = v11;
  v13 = sub_20D5A6EB8();
  v14 = v13;
  if (!*(_QWORD *)(v12 + 16))
    goto LABEL_41;
  v15 = 1 << *(_BYTE *)(v12 + 32);
  v16 = *(_QWORD *)(v12 + 64);
  v45 = (_QWORD *)(v12 + 64);
  if (v15 < 64)
    v17 = ~(-1 << v15);
  else
    v17 = -1;
  v18 = v17 & v16;
  v43 = v2;
  v44 = (unint64_t)(v15 + 63) >> 6;
  v19 = v13 + 64;
  result = swift_retain();
  v21 = 0;
  for (i = v12; ; v12 = i)
  {
    if (v18)
    {
      v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v44)
      break;
    v26 = v45;
    v27 = v45[v25];
    ++v21;
    if (!v27)
    {
      v21 = v25 + 1;
      if (v25 + 1 >= v44)
        goto LABEL_34;
      v27 = v45[v21];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v44)
        {
LABEL_34:
          swift_release();
          v3 = v43;
          if ((v48 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v27 = v45[v28];
        if (!v27)
        {
          while (1)
          {
            v21 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v21 >= v44)
              goto LABEL_34;
            v27 = v45[v21];
            ++v28;
            if (v27)
              goto LABEL_21;
          }
        }
        v21 = v28;
      }
    }
LABEL_21:
    v18 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    v29 = *(_QWORD *)(v8 + 72);
    v30 = *(_QWORD *)(v12 + 48) + v29 * v24;
    if ((v48 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 32))(v10, v30, v7);
      v31 = *(_QWORD *)(v12 + 56);
      v32 = *(_QWORD *)(v47 + 72);
      sub_20D582C38(v31 + v32 * v24, v49);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, v30, v7);
      v33 = *(_QWORD *)(v12 + 56);
      v32 = *(_QWORD *)(v47 + 72);
      sub_20D582F34(v33 + v32 * v24, v49, type metadata accessor for PreviewApplication.PreviewSessionMap);
    }
    sub_20D570178(&qword_2549B9880, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_20D5A6AB0();
    v34 = -1 << *(_BYTE *)(v14 + 32);
    v35 = result & ~v34;
    v36 = v35 >> 6;
    if (((-1 << v35) & ~*(_QWORD *)(v19 + 8 * (v35 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v19 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v37 = 0;
      v38 = (unint64_t)(63 - v34) >> 6;
      do
      {
        if (++v36 == v38 && (v37 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v39 = v36 == v38;
        if (v36 == v38)
          v36 = 0;
        v37 |= v39;
        v40 = *(_QWORD *)(v19 + 8 * v36);
      }
      while (v40 == -1);
      v22 = __clz(__rbit64(~v40)) + (v36 << 6);
    }
    *(_QWORD *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v14 + 48) + v29 * v22, v10, v7);
    result = sub_20D582C38(v49, *(_QWORD *)(v14 + 56) + v32 * v22);
    ++*(_QWORD *)(v14 + 16);
  }
  swift_release();
  v3 = v43;
  v26 = v45;
  if ((v48 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v41 = 1 << *(_BYTE *)(v12 + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(v12 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v14;
  return result;
}

uint64_t sub_20D5805B4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9508);
  v6 = sub_20D5A6EB8();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_20D578C6C(v24, v35);
      }
      else
      {
        sub_20D570648((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_20D5A6F60();
      sub_20D5A6B64();
      result = sub_20D5A6F78();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_20D578C6C(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_20D5808B0(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  unint64_t v36;
  uint64_t v37;

  v4 = sub_20D5A6660();
  v37 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_20D5A6DD4();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v36 = (result + 1) & v11;
      v12 = *(_QWORD *)(v37 + 72);
      v35 = *(void (**)(char *, unint64_t, uint64_t))(v37 + 16);
      v13 = v11;
      do
      {
        v14 = v8;
        v15 = v12;
        v16 = v12 * v10;
        v17 = v13;
        v35(v7, *(_QWORD *)(a2 + 48) + v12 * v10, v4);
        sub_20D570178(&qword_2549B9880, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        v18 = sub_20D5A6AB0();
        result = (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v7, v4);
        v13 = v17;
        v19 = v18 & v17;
        if (a1 >= (uint64_t)v36)
        {
          if (v19 >= v36 && a1 >= (uint64_t)v19)
          {
LABEL_16:
            v8 = v14;
            if (v15 * a1 < v16
              || *(_QWORD *)(a2 + 48) + v15 * a1 >= (unint64_t)(*(_QWORD *)(a2 + 48) + v16 + v15))
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v15 * a1 != v16)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v22 = *(_QWORD *)(a2 + 56);
            v23 = *(_QWORD *)(*(_QWORD *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8)
                            + 72);
            v24 = v23 * a1;
            result = v22 + v23 * a1;
            v25 = v23 * v10;
            v26 = v22 + v23 * v10 + v23;
            if (v24 < v25 || result >= v26)
            {
              result = swift_arrayInitWithTakeFrontToBack();
              a1 = v10;
              v13 = v17;
            }
            else
            {
              a1 = v10;
              v13 = v17;
              if (v24 != v25)
              {
                result = swift_arrayInitWithTakeBackToFront();
                v13 = v17;
                a1 = v10;
              }
            }
            goto LABEL_5;
          }
        }
        else if (v19 >= v36 || a1 >= (uint64_t)v19)
        {
          goto LABEL_16;
        }
        v8 = v14;
LABEL_5:
        v10 = (v10 + 1) & v13;
        v12 = v15;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v29 = *v28;
    v30 = (-1 << a1) - 1;
  }
  else
  {
    v28 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v30 = *v28;
    v29 = (-1 << a1) - 1;
  }
  *v28 = v30 & v29;
  v31 = *(_QWORD *)(a2 + 16);
  v32 = __OFSUB__(v31, 1);
  v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v33;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_20D580B84(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = sub_20D5A6660();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_20D5883EC(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        v22 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
        return sub_20D582E48(a1, v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_20D580F4C();
      goto LABEL_7;
    }
    sub_20D5801B8(v17, a3 & 1);
    v24 = sub_20D5883EC(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_20D580E34(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_20D5A6F24();
  __break(1u);
  return result;
}

_OWORD *sub_20D580D04(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_20D588458(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_20D578C6C(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_20D5811CC();
      goto LABEL_7;
    }
    sub_20D5805B4(v15, a4 & 1);
    v21 = sub_20D588458(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_20D580EE4(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_20D5A6F24();
  __break(1u);
  return result;
}

uint64_t sub_20D580E34(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_20D5A6660();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  result = sub_20D582C38(a3, v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

_OWORD *sub_20D580EE4(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_20D578C6C(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_20D580F4C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *result;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;

  v1 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  v27 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_20D5A6660();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94F0);
  v24 = v0;
  v8 = *v0;
  v9 = sub_20D5A6EAC();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
  {
LABEL_23:
    result = (void *)swift_release();
    *v24 = v10;
    return result;
  }
  result = (void *)(v9 + 64);
  v12 = (unint64_t)((1 << *(_BYTE *)(v10 + 32)) + 63) >> 6;
  if (v10 != v8 || (unint64_t)result >= v8 + 64 + 8 * v12)
    result = memmove(result, (const void *)(v8 + 64), 8 * v12);
  v13 = 0;
  *(_QWORD *)(v10 + 16) = *(_QWORD *)(v8 + 16);
  v14 = 1 << *(_BYTE *)(v8 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v8 + 64);
  v25 = v8 + 64;
  v26 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v18 = v17 | (v13 << 6);
      goto LABEL_9;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v26)
      goto LABEL_23;
    v22 = *(_QWORD *)(v25 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v26)
        goto LABEL_23;
      v22 = *(_QWORD *)(v25 + 8 * v13);
      if (!v22)
        break;
    }
LABEL_22:
    v16 = (v22 - 1) & v22;
    v18 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_9:
    v19 = *(_QWORD *)(v5 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v8 + 48) + v19, v4);
    v20 = *(_QWORD *)(v27 + 72) * v18;
    sub_20D582F34(*(_QWORD *)(v8 + 56) + v20, (uint64_t)v3, type metadata accessor for PreviewApplication.PreviewSessionMap);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v10 + 48) + v19, v7, v4);
    result = (void *)sub_20D582C38((uint64_t)v3, *(_QWORD *)(v10 + 56) + v20);
  }
  v23 = v21 + 2;
  if (v23 >= v26)
    goto LABEL_23;
  v22 = *(_QWORD *)(v25 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v26)
      goto LABEL_23;
    v22 = *(_QWORD *)(v25 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_20D5811CC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9508);
  v2 = *v0;
  v3 = sub_20D5A6EAC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_20D570648(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_20D578C6C(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_20D5813B0(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  char *v27;
  id v28;
  char *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void (*v38)(char *, uint64_t);
  void *v39;
  uint64_t v40;
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  void *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  os_log_type_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72[2];

  v2 = sub_20D5A6618();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v67 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v65 = (char *)&v64 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v64 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v64 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v64 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v64 - v17;
  v19 = type metadata accessor for PreviewItem.Source(0);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = (char *)a1[1];
  v66 = *a1;
  v69 = a1[2];
  v23 = type metadata accessor for PreviewItem(0);
  sub_20D582F34((uint64_t)a1 + *(int *)(v23 + 24), (uint64_t)v21, type metadata accessor for PreviewItem.Source);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v18, v21, v2);
  sub_20D577BD0(0, &qword_2549B9510);
  v68 = v3;
  v24 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  v25 = v2;
  v70 = v18;
  v26 = v18;
  v27 = v22;
  v24(v16, v26, v2);
  swift_bridgeObjectRetain();
  v28 = sub_20D57F484((uint64_t)v16, 0);
  v39 = v28;
  if (v28)
  {
    if (qword_2549B7F38 != -1)
      swift_once();
    v40 = sub_20D5A67E0();
    __swift_project_value_buffer(v40, (uint64_t)qword_2549B9378);
    v41 = v13;
    v24(v13, v70, v25);
    v42 = sub_20D5A67C8();
    v43 = sub_20D5A6D2C();
    if (!os_log_type_enabled(v42, v43))
    {
      v38 = *(void (**)(char *, uint64_t))(v68 + 8);
      v38(v41, v25);
      goto LABEL_25;
    }
    v44 = (uint8_t *)swift_slowAlloc();
    v45 = swift_slowAlloc();
    v67 = v22;
    v46 = v45;
    v72[0] = v45;
    *(_DWORD *)v44 = 136315138;
    sub_20D570178(&qword_2549B9518, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v47 = sub_20D5A6EE8();
    v71 = sub_20D56FB0C(v47, v48, v72);
    sub_20D5A6DB0();
    swift_bridgeObjectRelease();
    v38 = *(void (**)(char *, uint64_t))(v68 + 8);
    v38(v41, v25);
    _os_log_impl(&dword_20D4F5000, v42, v43, "Readwrite sandbox wrapper created for PreviewItem %s", v44, 0xCu);
    swift_arrayDestroy();
    v49 = v46;
    v27 = v67;
LABEL_20:
    MEMORY[0x212BA4658](v49, -1, -1);
    MEMORY[0x212BA4658](v44, -1, -1);
LABEL_25:

    v50 = v70;
    if (v27)
    {
      v51 = (void *)sub_20D5A6AD4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v51 = 0;
    }
    v61 = objc_allocWithZone(MEMORY[0x24BE7BF88]);
    v60 = objc_msgSend(v61, sel_initWithURLSandboxWrapper_previewTitle_editingMode_, v39, v51, v69);
    goto LABEL_29;
  }
  v29 = v70;
  v24(v10, v70, v25);
  v30 = sub_20D57F484((uint64_t)v10, 1);
  v39 = v30;
  v52 = v67;
  if (v30)
  {
    if (qword_2549B7F38 != -1)
      swift_once();
    v53 = sub_20D5A67E0();
    __swift_project_value_buffer(v53, (uint64_t)qword_2549B9378);
    v54 = v65;
    v24(v65, v29, v25);
    v42 = sub_20D5A67C8();
    v55 = sub_20D5A6D2C();
    if (!os_log_type_enabled(v42, v55))
    {
      v38 = *(void (**)(char *, uint64_t))(v68 + 8);
      v38(v54, v25);
      goto LABEL_25;
    }
    v44 = (uint8_t *)swift_slowAlloc();
    v56 = swift_slowAlloc();
    v72[0] = v56;
    *(_DWORD *)v44 = 136315138;
    sub_20D570178(&qword_2549B9518, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v57 = sub_20D5A6EE8();
    v71 = sub_20D56FB0C(v57, v58, v72);
    sub_20D5A6DB0();
    swift_bridgeObjectRelease();
    v38 = *(void (**)(char *, uint64_t))(v68 + 8);
    v38(v65, v25);
    _os_log_impl(&dword_20D4F5000, v42, v55, "Readonly sandbox wrapper created for PreviewItem %s", v44, 0xCu);
    swift_arrayDestroy();
    v49 = v56;
    goto LABEL_20;
  }
  if (qword_2549B7F38 != -1)
    swift_once();
  v31 = sub_20D5A67E0();
  __swift_project_value_buffer(v31, (uint64_t)qword_2549B9378);
  v24(v52, v29, v25);
  v32 = sub_20D5A67C8();
  v33 = sub_20D5A6D14();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    v72[0] = v35;
    *(_DWORD *)v34 = 136315138;
    sub_20D570178(&qword_2549B9518, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v36 = sub_20D5A6EE8();
    v71 = sub_20D56FB0C(v36, v37, v72);
    sub_20D5A6DB0();
    swift_bridgeObjectRelease();
    v38 = *(void (**)(char *, uint64_t))(v68 + 8);
    v38(v52, v25);
    _os_log_impl(&dword_20D4F5000, v32, v33, "Couod not create sandbox wrapper created for PreviewItem %s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v35, -1, -1);
    MEMORY[0x212BA4658](v34, -1, -1);
  }
  else
  {
    v38 = *(void (**)(char *, uint64_t))(v68 + 8);
    v38(v52, v25);
  }

  v50 = v70;
  v51 = (void *)sub_20D5A65E8();
  if (v27)
  {
    v39 = (void *)sub_20D5A6AD4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v39 = 0;
  }
  v59 = objc_allocWithZone(MEMORY[0x24BE7BF88]);
  v60 = objc_msgSend(v59, sel_initWithURL_previewTitle_editingMode_, v51, v39, v69);
LABEL_29:
  v62 = v60;

  v38(v50, v25);
  return v62;
}

uint64_t sub_20D581B54(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  if (a1 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    v2 = sub_20D5A6EA0();
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      v3 = 4;
      do
      {
        v4 = v3 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          MEMORY[0x212BA368C](v3 - 4, a1);
          v5 = v3 - 3;
          if (__OFADD__(v4, 1))
            goto LABEL_24;
        }
        else
        {
          swift_unknownObjectRetain();
          v5 = v3 - 3;
          if (__OFADD__(v4, 1))
          {
LABEL_24:
            __break(1u);
            goto LABEL_25;
          }
        }
        objc_opt_self();
        v6 = swift_dynamicCastObjCClass();
        if (v6)
        {
          v7 = (void *)v6;
          swift_unknownObjectRetain();
          if (objc_msgSend(v7, sel_previewItemDataProvider))
          {
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease();
            if (qword_2549B7F38 != -1)
              swift_once();
            v9 = sub_20D5A67E0();
            __swift_project_value_buffer(v9, (uint64_t)qword_2549B9378);
            v10 = sub_20D5A67C8();
            v11 = sub_20D5A6D14();
            if (os_log_type_enabled(v10, v11))
            {
              v12 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v12 = 0;
              v13 = "Invalid QLItem dataProvider found in preview items.";
              goto LABEL_22;
            }
LABEL_23:

            swift_unknownObjectRelease_n();
            return 0;
          }
          v8 = objc_msgSend(v7, sel_previewItemData);
          if (v8)
          {
            v14 = v8;
            v15 = sub_20D5A6630();
            v17 = v16;

            sub_20D57CE10(v15, v17);
            swift_bridgeObjectRelease();
            if (qword_2549B7F38 != -1)
              swift_once();
            v18 = sub_20D5A67E0();
            __swift_project_value_buffer(v18, (uint64_t)qword_2549B9378);
            v10 = sub_20D5A67C8();
            v11 = sub_20D5A6D14();
            if (os_log_type_enabled(v10, v11))
            {
              v12 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v12 = 0;
              v13 = "Invalid QLItem data found in preview items.";
LABEL_22:
              _os_log_impl(&dword_20D4F5000, v10, v11, v13, v12, 2u);
              MEMORY[0x212BA4658](v12, -1, -1);
            }
            goto LABEL_23;
          }
          swift_unknownObjectRelease();
        }
        swift_unknownObjectRelease();
        ++v3;
      }
      while (v5 != v2);
    }
  }
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_20D581E28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD v27[4];

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v27 - v14;
  if (qword_2549B7F48 != -1)
    swift_once();
  swift_beginAccess();
  v16 = qword_2549BCF38;
  if (!*(_QWORD *)(qword_2549BCF38 + 16))
    return swift_endAccess();
  v17 = sub_20D5883EC(a1);
  if ((v18 & 1) == 0)
    return swift_endAccess();
  sub_20D582F34(*(_QWORD *)(v16 + 56) + *(_QWORD *)(v10 + 72) * v17, (uint64_t)v13, type metadata accessor for PreviewApplication.PreviewSessionMap);
  sub_20D582C38((uint64_t)v13, (uint64_t)v15);
  swift_endAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800);
  v27[1] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  sub_20D5A6C90();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v19 = &v15[*(int *)(v9 + 24)];
  v20 = *((_QWORD *)v19 + 1);
  if (v20)
  {
    v21 = *(_QWORD *)v19;
    v22 = sub_20D5A6C78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v4, 1, 1, v22);
    sub_20D5A6C54();
    swift_bridgeObjectRetain();
    v23 = sub_20D5A6C48();
    v24 = (_QWORD *)swift_allocObject();
    v25 = MEMORY[0x24BEE6930];
    v24[2] = v23;
    v24[3] = v25;
    v24[4] = v21;
    v24[5] = v20;
    sub_20D592B84((uint64_t)v4, (uint64_t)&unk_2549B9500, (uint64_t)v24);
    swift_release();
  }
  return sub_20D582C7C((uint64_t)v15);
}

void sub_20D5820A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  unint64_t v35;
  void *v36;

  v5 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_20D5A6DE0();
    sub_20D577BD0(0, &qword_2549B94B8);
    sub_20D582D34();
    sub_20D5A6CF0();
    v5 = v31;
    v28 = v32;
    v6 = v33;
    v7 = v34;
    v8 = v35;
  }
  else
  {
    v9 = -1 << *(_BYTE *)(a1 + 32);
    v28 = a1 + 56;
    v10 = ~v9;
    v11 = -v9;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v8 = v12 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v6 = v10;
    v7 = 0;
  }
  v26 = v6;
  v27 = (unint64_t)(v6 + 64) >> 6;
  v29 = v7;
  v30 = v8;
  if (v5 < 0)
    goto LABEL_10;
LABEL_8:
  if (v8)
  {
    v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v14 = v13 | (v7 << 6);
    goto LABEL_29;
  }
  v16 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v16 < v27)
    {
      v17 = *(_QWORD *)(v28 + 8 * v16);
      ++v7;
      if (v17)
        goto LABEL_28;
      v7 = v16 + 1;
      if (v16 + 1 >= v27)
        goto LABEL_36;
      v17 = *(_QWORD *)(v28 + 8 * v7);
      if (v17)
        goto LABEL_28;
      v7 = v16 + 2;
      if (v16 + 2 >= v27)
        goto LABEL_36;
      v17 = *(_QWORD *)(v28 + 8 * v7);
      if (v17)
        goto LABEL_28;
      v7 = v16 + 3;
      if (v16 + 3 >= v27)
        goto LABEL_36;
      v17 = *(_QWORD *)(v28 + 8 * v7);
      if (v17)
      {
LABEL_28:
        v8 = (v17 - 1) & v17;
        v14 = __clz(__rbit64(v17)) + (v7 << 6);
LABEL_29:
        v15 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * v14);
        if (v15)
        {
          while (1)
          {
            v19 = objc_msgSend(v15, sel_session, v26);
            v20 = a3;
            v21 = objc_msgSend(v19, sel_persistentIdentifier);

            v22 = sub_20D5A6AF8();
            v24 = v23;

            a3 = v20;
            if (v22 == a2 && v24 == v20)
              break;
            v25 = sub_20D5A6F0C();
            swift_bridgeObjectRelease();
            if ((v25 & 1) != 0)
              goto LABEL_36;

            v29 = v7;
            v30 = v8;
            if ((v5 & 0x8000000000000000) == 0)
              goto LABEL_8;
LABEL_10:
            if (sub_20D5A6DF8())
            {
              sub_20D577BD0(0, &qword_2549B94B8);
              swift_unknownObjectRetain();
              swift_dynamicCast();
              v15 = v36;
              swift_unknownObjectRelease();
              v8 = v30;
              if (v36)
                continue;
            }
            goto LABEL_36;
          }
          swift_bridgeObjectRelease();
        }
        goto LABEL_36;
      }
      v7 = v16 + 4;
      if (v16 + 4 < v27)
      {
        v17 = *(_QWORD *)(v28 + 8 * v7);
        if (!v17)
        {
          v18 = v29 + 6;
          while (v27 != v18)
          {
            v17 = *(_QWORD *)(v28 + 8 * v18++);
            if (v17)
            {
              v7 = v18 - 1;
              goto LABEL_28;
            }
          }
          goto LABEL_36;
        }
        goto LABEL_28;
      }
    }
LABEL_36:
    sub_20D57AB48();
    return;
  }
  __break(1u);
}

uint64_t sub_20D582438(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  id v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v25;
  id v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  id v30;

  v26 = a2;
  v29 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94C8);
  MEMORY[0x24BDAC7A8](v2);
  v28 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_20D5A6660();
  v4 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v25 - v16;
  if (qword_2549B7F48 != -1)
    swift_once();
  swift_beginAccess();
  v18 = qword_2549BCF38;
  if (!*(_QWORD *)(qword_2549BCF38 + 16))
    return swift_endAccess();
  v19 = sub_20D5883EC(v29);
  if ((v20 & 1) == 0)
    return swift_endAccess();
  sub_20D582F34(*(_QWORD *)(v18 + 56) + *(_QWORD *)(v12 + 72) * v19, (uint64_t)v15, type metadata accessor for PreviewApplication.PreviewSessionMap);
  sub_20D582C38((uint64_t)v15, (uint64_t)v17);
  swift_endAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800);
  v30 = v26;
  v21 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  sub_20D5A6C90();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_20D5A6C9C();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v29, v27);
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v23 = (uint64_t)v28;
  v22(v28, 1, 1, v11);
  swift_beginAccess();
  sub_20D57F958(v23, (uint64_t)v6);
  swift_endAccess();
  return sub_20D582C7C((uint64_t)v17);
}

uint64_t sub_20D5826DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;

  v36 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94C8);
  MEMORY[0x24BDAC7A8](v1);
  v35 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_20D5A6660();
  v33 = *(_QWORD *)(v3 - 8);
  v34 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D0);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v32 - v18;
  if (qword_2549B7F48 != -1)
    swift_once();
  swift_beginAccess();
  v20 = qword_2549BCF38;
  if (!*(_QWORD *)(qword_2549BCF38 + 16))
    return swift_endAccess();
  v21 = sub_20D5883EC(v36);
  if ((v22 & 1) == 0)
    return swift_endAccess();
  sub_20D582F34(*(_QWORD *)(v20 + 56) + *(_QWORD *)(v14 + 72) * v21, (uint64_t)v17, type metadata accessor for PreviewApplication.PreviewSessionMap);
  sub_20D582C38((uint64_t)v17, (uint64_t)v19);
  swift_endAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800);
  v37 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  sub_20D5A6C90();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_20D5A6C9C();
  v23 = &v19[*(int *)(v13 + 24)];
  v24 = *((_QWORD *)v23 + 1);
  if (v24)
  {
    v25 = *(_QWORD *)v23;
    v26 = sub_20D5A6C78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v8, 1, 1, v26);
    sub_20D5A6C54();
    swift_bridgeObjectRetain();
    v27 = sub_20D5A6C48();
    v28 = (_QWORD *)swift_allocObject();
    v29 = MEMORY[0x24BEE6930];
    v28[2] = v27;
    v28[3] = v29;
    v28[4] = v25;
    v28[5] = v24;
    sub_20D592B84((uint64_t)v8, (uint64_t)&unk_2549B94E8, (uint64_t)v28);
    swift_release();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v5, v36, v34);
  v30 = (uint64_t)v35;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v35, 1, 1, v13);
  swift_beginAccess();
  sub_20D57F958(v30, (uint64_t)v5);
  swift_endAccess();
  return sub_20D582C7C((uint64_t)v19);
}

uint64_t sub_20D582A40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v23 - v10;
  if (qword_2549B7F48 != -1)
    swift_once();
  swift_beginAccess();
  v12 = qword_2549BCF38;
  if (!*(_QWORD *)(qword_2549BCF38 + 16))
    return swift_endAccess();
  v13 = sub_20D5883EC(a1);
  if ((v14 & 1) == 0)
    return swift_endAccess();
  sub_20D582F34(*(_QWORD *)(v12 + 56) + *(_QWORD *)(v6 + 72) * v13, (uint64_t)v9, type metadata accessor for PreviewApplication.PreviewSessionMap);
  sub_20D582C38((uint64_t)v9, (uint64_t)v11);
  swift_endAccess();
  v15 = &v11[*(int *)(v5 + 24)];
  v16 = *((_QWORD *)v15 + 1);
  if (v16)
  {
    v17 = *(_QWORD *)v15;
    v18 = sub_20D5A6C78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v4, 1, 1, v18);
    sub_20D5A6C54();
    swift_bridgeObjectRetain();
    v19 = sub_20D5A6C48();
    v20 = (_QWORD *)swift_allocObject();
    v21 = MEMORY[0x24BEE6930];
    v20[2] = v19;
    v20[3] = v21;
    v20[4] = v17;
    v20[5] = v16;
    sub_20D592B84((uint64_t)v4, (uint64_t)&unk_2549B94B0, (uint64_t)v20);
    swift_release();
  }
  return sub_20D582C7C((uint64_t)v11);
}

uint64_t sub_20D582C38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D582C7C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20D582CBC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D577D2C;
  return sub_20D57F5A0(a1, v4, v5, v7, v6);
}

unint64_t sub_20D582D34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549B94C0;
  if (!qword_2549B94C0)
  {
    v1 = sub_20D577BD0(255, &qword_2549B94B8);
    result = MEMORY[0x212BA45A4](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2549B94C0);
  }
  return result;
}

uint64_t sub_20D582D90(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D5779C0;
  return sub_20D57F6CC(a1, v4, v5, v7, v6);
}

uint64_t sub_20D582E08(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20D582E48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20D582EBC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D577D2C;
  return sub_20D57F5A0(a1, v4, v5, v7, v6);
}

uint64_t sub_20D582F34(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20D582FC0()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed);
  swift_beginAccess();
  return *v1;
}

id sub_20D583044(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed);
  swift_beginAccess();
  *v3 = a1;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer);
  if ((a1 & 1) != 0)
    v5 = 1.0;
  else
    v5 = 0.0;
  if ((a1 & 1) != 0)
    v6 = 0.0;
  else
    v6 = 1.0;
  objc_msgSend(v4, sel_setStartPoint_, 0.5, v5);
  return objc_msgSend(v4, sel_setEndPoint_, 0.5, v6);
}

void (*sub_20D5830E8(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_20D583140;
}

void sub_20D583140(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = v3[3];
    v5 = *(void **)(v4 + OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer);
    if (*(_BYTE *)(v4 + v3[4]))
      v6 = 1.0;
    else
      v6 = 0.0;
    if (*(_BYTE *)(v4 + v3[4]))
      v7 = 0.0;
    else
      v7 = 1.0;
    objc_msgSend(v5, sel_setStartPoint_, 0.5, v6);
    objc_msgSend(v5, sel_setEndPoint_, 0.5, v7);
  }
  free(v3);
}

id QLGradientView.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id QLGradientView.init()()
{
  _BYTE *v0;
  uint64_t v1;
  id v2;
  _BYTE *v3;
  id v4;
  objc_super v6;

  v0[OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed] = 0;
  v1 = OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer;
  v2 = objc_allocWithZone(MEMORY[0x24BDE56B8]);
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_init);

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for QLGradientView();
  v4 = objc_msgSendSuper2(&v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_20D583408();

  return v4;
}

uint64_t type metadata accessor for QLGradientView()
{
  return objc_opt_self();
}

void sub_20D583408()
{
  char *v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  char *v10;
  id v11;

  v1 = *(void **)&v0[OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B8E40);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_20D5B2370;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 0.0, 0.5);
  v4 = objc_msgSend(v3, sel_CGColor);

  type metadata accessor for CGColor(0);
  v6 = v5;
  *(_QWORD *)(v2 + 56) = v5;
  *(_QWORD *)(v2 + 32) = v4;
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithWhite_alpha_, 0.0, 0.0);
  v8 = objc_msgSend(v7, sel_CGColor);

  *(_QWORD *)(v2 + 88) = v6;
  *(_QWORD *)(v2 + 64) = v8;
  v9 = (void *)sub_20D5A6BDC();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setColors_, v9);

  v10 = &v0[OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed];
  swift_beginAccess();
  *v10 = 0;
  objc_msgSend(v1, sel_setStartPoint_, 0.5, 0.0);
  objc_msgSend(v1, sel_setEndPoint_, 0.5, 1.0);
  v11 = objc_msgSend(v0, sel_layer);
  objc_msgSend(v11, sel_insertSublayer_atIndex_, v1, 0);

}

id QLGradientView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void QLGradientView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id QLGradientView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLGradientView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20D583714@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

id sub_20D583764(char *a1)
{
  return sub_20D583044(*a1);
}

uint64_t method lookup function for QLGradientView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QLGradientView.reversed.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of QLGradientView.reversed.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of QLGradientView.reversed.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t sub_20D5837F8()
{
  uint64_t v0;

  v0 = sub_20D5A67E0();
  __swift_allocate_value_buffer(v0, qword_2549B9558);
  __swift_project_value_buffer(v0, (uint64_t)qword_2549B9558);
  return sub_20D5A67D4();
}

uint64_t QLPreviewCollectionWrapper.hostProxy.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  sub_20D5A6A38();
  return v1;
}

uint64_t sub_20D5838A4()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  return sub_20D5A6A44();
}

uint64_t QLPreviewCollectionWrapper.hostProxy.setter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  return sub_20D5A6A44();
}

void (*QLPreviewCollectionWrapper.hostProxy.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  v2[4] = sub_20D5A6A2C();
  return sub_20D56ED6C;
}

uint64_t QLPreviewCollectionWrapper.$hostProxy.getter()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  return sub_20D5A6A50();
}

uint64_t QLPreviewCollectionWrapper.init(hostProxy:)()
{
  type metadata accessor for QLAppExtensionSceneProxy(0);
  sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
  return sub_20D5A6A5C();
}

uint64_t sub_20D583A08()
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
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t KeyPath;
  id v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;

  v1 = v0;
  v36 = type metadata accessor for QLPreviewCollectionWrapper();
  v2 = MEMORY[0x24BDAC7A8](v36);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v35 = (uint64_t)&v34 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v34 - v7;
  if (qword_2549B7F40 != -1)
    swift_once();
  v9 = sub_20D5A67E0();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_2549B9558);
  sub_20D58441C(v1, (uint64_t)v8);
  v34 = v10;
  v11 = sub_20D5A67C8();
  v12 = sub_20D5A6CFC();
  v13 = os_log_type_enabled(v11, v12);
  v37 = v4;
  if (v13)
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v39 = v15;
    *(_DWORD *)v14 = 136315138;
    sub_20D58441C((uint64_t)v8, v35);
    v16 = sub_20D5A6B4C();
    v38 = sub_20D56FB0C(v16, v17, &v39);
    sub_20D5A6DB0();
    swift_bridgeObjectRelease();
    sub_20D584460((uint64_t)v8);
    _os_log_impl(&dword_20D4F5000, v11, v12, "Configuring %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v15, -1, -1);
    MEMORY[0x212BA4658](v14, -1, -1);
  }
  else
  {
    sub_20D584460((uint64_t)v8);
  }

  v18 = (void *)objc_opt_self();
  v19 = objc_msgSend(v18, sel_previewCollectionClassName);
  if (!v19)
  {
    sub_20D5A6AF8();
    v19 = (id)sub_20D5A6AD4();
    swift_bridgeObjectRelease();
  }
  sub_20D5A6AF8();
  v20 = objc_msgSend(v18, sel_previewCollectionWithClassName_, v19);

  v41 = &unk_254A020B0;
  v42 = &unk_2549E3EF8;
  v21 = swift_dynamicCastObjCProtocolConditional();
  if (v21)
  {
    v22 = v21;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
    sub_20D5A6A38();
    v23 = v39;
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    v39 = v23;
    sub_20D570178(&qword_2549B8300, type metadata accessor for QLAppExtensionSceneProxy, (uint64_t)&protocol conformance descriptor for QLAppExtensionSceneProxy);
    v25 = v20;
    sub_20D5A6678();
    swift_release();
    swift_release();

    v26 = (uint64_t)v37;
    sub_20D58441C(v1, (uint64_t)v37);
    v27 = sub_20D5A67C8();
    v28 = sub_20D5A6CFC();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      v39 = v30;
      *(_DWORD *)v29 = 136315138;
      sub_20D58441C(v26, v35);
      v31 = sub_20D5A6B4C();
      v38 = sub_20D56FB0C(v31, v32, &v39);
      sub_20D5A6DB0();
      swift_bridgeObjectRelease();
      sub_20D584460(v26);
      _os_log_impl(&dword_20D4F5000, v27, v28, "Configured %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BA4658](v30, -1, -1);
      MEMORY[0x212BA4658](v29, -1, -1);
    }
    else
    {
      sub_20D584460(v26);
    }

    return v22;
  }
  else
  {

    v39 = 0;
    v40 = 0xE000000000000000;
    sub_20D5A6E1C();
    swift_bridgeObjectRelease();
    v39 = 0xD00000000000002DLL;
    v40 = 0x800000020D5C00D0;
    sub_20D5A6B88();
    result = sub_20D5A6E94();
    __break(1u);
  }
  return result;
}

uint64_t sub_20D583F6C()
{
  return sub_20D570178(&qword_2549B9578, (uint64_t (*)(uint64_t))type metadata accessor for QLPreviewCollectionWrapper, (uint64_t)&protocol conformance descriptor for QLPreviewCollectionWrapper);
}

uint64_t type metadata accessor for QLPreviewCollectionWrapper()
{
  uint64_t result;

  result = qword_2549B95D8;
  if (!qword_2549B95D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20D583FD8()
{
  sub_20D570178(qword_2549B9618, (uint64_t (*)(uint64_t))type metadata accessor for QLPreviewCollectionWrapper, (uint64_t)&protocol conformance descriptor for QLPreviewCollectionWrapper);
  return sub_20D5A693C();
}

uint64_t sub_20D584040()
{
  sub_20D570178(qword_2549B9618, (uint64_t (*)(uint64_t))type metadata accessor for QLPreviewCollectionWrapper, (uint64_t)&protocol conformance descriptor for QLPreviewCollectionWrapper);
  return sub_20D5A690C();
}

void sub_20D5840A8()
{
  sub_20D570178(qword_2549B9618, (uint64_t (*)(uint64_t))type metadata accessor for QLPreviewCollectionWrapper, (uint64_t)&protocol conformance descriptor for QLPreviewCollectionWrapper);
  sub_20D5A6930();
  __break(1u);
}

uint64_t sub_20D5840E4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  result = sub_20D5A6A38();
  *a1 = v3;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for QLPreviewCollectionWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for QLPreviewCollectionWrapper(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for QLPreviewCollectionWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for QLPreviewCollectionWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for QLPreviewCollectionWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for QLPreviewCollectionWrapper(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for QLPreviewCollectionWrapper()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D5842D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for QLPreviewCollectionWrapper()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D58431C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9570);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_20D584360()
{
  unint64_t v0;

  sub_20D5843C8();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20D5843C8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549B95E8[0])
  {
    type metadata accessor for QLAppExtensionSceneProxy(255);
    v0 = sub_20D5A6A68();
    if (!v1)
      atomic_store(v0, qword_2549B95E8);
  }
}

uint64_t sub_20D58441C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for QLPreviewCollectionWrapper();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D584460(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for QLPreviewCollectionWrapper();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20D5844A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t result;

  type metadata accessor for QLGlobalAppExtensionConfiguration.ExportedObject(0, a2, a3, a4);
  v11 = sub_20D58476C(a1, v8, v9, v10);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  *a5 = v11;
  return result;
}

Swift::Bool __swiftcall QLGlobalAppExtensionConfiguration.accept(connection:)(NSXPCConnection connection)
{
  return 0;
}

void sub_20D584508()
{
  sub_20D5847A4();
}

id sub_20D584524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for QLGlobalAppExtensionConfiguration.ExportedObject(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_20D584570(char *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *MEMORY[0x24BEE4EA0] & *(_QWORD *)a1;
  swift_release();
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 8))(&a1[*(_QWORD *)((*v2 & *(_QWORD *)a1) + 0x68)]);
}

uint64_t sub_20D5845D4()
{
  return 0;
}

uint64_t QLNonUIProxy.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t QLNonUIProxy.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for QLGlobalAppExtensionConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for QLGlobalAppExtensionConfiguration);
}

uint64_t sub_20D584604()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for QLGlobalAppExtensionConfiguration.ExportedObject(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for QLGlobalAppExtensionConfiguration.ExportedObject);
}

uint64_t type metadata accessor for QLNonUIProxy()
{
  return objc_opt_self();
}

uint64_t method lookup function for QLNonUIProxy()
{
  return swift_lookUpClassMethod();
}

id sub_20D5846BC(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  objc_super v11;

  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v4 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *v1);
  v5 = v4[12];
  type metadata accessor for QLNonUIProxy();
  *(_QWORD *)((char *)v1 + v5) = swift_allocObject();
  v6 = (char *)v1 + *(_QWORD *)((*v3 & *v1) + 0x68);
  v7 = v4[10];
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v6, a1, v7);
  v9 = (objc_class *)type metadata accessor for QLGlobalAppExtensionConfiguration.ExportedObject(0, v7, v4[11], v8);
  v11.receiver = v1;
  v11.super_class = v9;
  return objc_msgSendSuper2(&v11, sel_init);
}

id sub_20D58476C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v6;

  v6 = objc_allocWithZone((Class)type metadata accessor for QLGlobalAppExtensionConfiguration.ExportedObject(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4));
  return sub_20D5846BC(a1);
}

void sub_20D5847A4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_20D5847D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_20D5A6C78();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_20D5A6C6C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_20D57C26C(a1, (uint64_t *)&unk_2549B97E0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20D5A6C18();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_20D584904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_20D5A6C78();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_20D5A6C6C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_20D57C26C(a1, (uint64_t *)&unk_2549B97E0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20D5A6C18();
    swift_unknownObjectRelease();
  }
LABEL_5:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9BF8);
  return swift_task_create();
}

unint64_t sub_20D584A38()
{
  unint64_t result;

  result = sub_20D58CD1C(MEMORY[0x24BEE4AF8]);
  qword_2549BCF38 = result;
  return result;
}

uint64_t sub_20D584A5C()
{
  uint64_t result;

  type metadata accessor for HostHandler();
  result = swift_allocObject();
  qword_2549BCF40 = result;
  return result;
}

uint64_t static PreviewApplication.open(urls:selectedURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  _QWORD v34[2];
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v38 = a2;
  v40 = type metadata accessor for PreviewItem(0);
  v43 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v7 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97D0);
  MEMORY[0x24BDAC7A8](v8);
  v37 = (uint64_t)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20D5A6618();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v35 = (char *)v34 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97D8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v36 = (char *)v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v39 = (char *)v34 - v19;
  v20 = *(_QWORD *)(a1 + 16);
  v21 = MEMORY[0x24BEE4AF8];
  if (v20)
  {
    v34[0] = a3;
    v34[1] = v3;
    v44 = MEMORY[0x24BEE4AF8];
    sub_20D5888E0(0, v20, 0);
    v22 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    v41 = *(_QWORD *)(v11 + 72);
    v42 = v11;
    v23 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v24 = v40;
    do
    {
      v23(v14, v22, v10);
      v23(&v7[*(int *)(v24 + 24)], (uint64_t)v14, v10);
      sub_20D5A6654();
      *(_QWORD *)v7 = 0;
      *((_QWORD *)v7 + 1) = 0;
      *((_QWORD *)v7 + 2) = 1;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
      v21 = v44;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_20D5888E0(0, *(_QWORD *)(v21 + 16) + 1, 1);
        v24 = v40;
        v21 = v44;
      }
      v26 = *(_QWORD *)(v21 + 16);
      v25 = *(_QWORD *)(v21 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_20D5888E0(v25 > 1, v26 + 1, 1);
        v24 = v40;
        v21 = v44;
      }
      *(_QWORD *)(v21 + 16) = v26 + 1;
      sub_20D588FC8((uint64_t)v7, v21+ ((*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80))+ *(_QWORD *)(v43 + 72) * v26, type metadata accessor for PreviewItem);
      v11 = v42;
      v22 += v41;
      --v20;
    }
    while (v20);
    a3 = v34[0];
  }
  v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56);
  v29 = (uint64_t)v39;
  v28 = v40;
  v27(v39, 1, 1, v40);
  v30 = v37;
  sub_20D57C228(v38, v37, &qword_2549B97D0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v30, 1, v10) == 1)
  {
    sub_20D57C26C(v30, &qword_2549B97D0);
  }
  else
  {
    v31 = v35;
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v35, v30, v10);
    v32 = v36;
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(&v36[*(int *)(v28 + 24)], v31, v10);
    sub_20D5A6654();
    *(_QWORD *)v32 = 0;
    *((_QWORD *)v32 + 1) = 0;
    *((_QWORD *)v32 + 2) = 1;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v31, v10);
    sub_20D57C26C(v29, &qword_2549B97D8);
    v27(v32, 0, 1, v28);
    sub_20D5888FC((uint64_t)v32, v29);
  }
  static PreviewApplication.open(items:selectedItem:)(v21, v29, a3);
  swift_bridgeObjectRelease();
  return sub_20D57C26C(v29, &qword_2549B97D8);
}

uint64_t type metadata accessor for PreviewItem(uint64_t a1)
{
  return sub_20D576D9C(a1, qword_2549B99E8);
}

uint64_t PreviewItem.init(url:displayName:editingMode:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;

  v10 = type metadata accessor for PreviewItem(0);
  sub_20D5A6654();
  v11 = (char *)a5 + *(int *)(v10 + 24);
  v12 = sub_20D5A6618();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a1, v12);
  *a5 = a2;
  a5[1] = a3;
  a5[2] = a4;
  return result;
}

uint64_t static PreviewApplication.open(items:selectedItem:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[3];
  char v37;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97D8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for PreviewItem(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (uint64_t *)((char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v28 - v16;
  v18 = *(_QWORD *)(a1 + 16);
  v19 = MEMORY[0x24BEE4AF8];
  v35 = v15;
  if (v18)
  {
    v29 = a2;
    v31 = v9;
    v33 = a3;
    v34 = v3;
    v36[0] = MEMORY[0x24BEE4AF8];
    sub_20D5A6E64();
    v20 = *(unsigned __int8 *)(v11 + 80);
    v32 = a1;
    v21 = a1 + ((v20 + 32) & ~v20);
    v30 = v11;
    v22 = *(_QWORD *)(v11 + 72);
    v23 = v18;
    do
    {
      sub_20D582F34(v21, (uint64_t)v14, type metadata accessor for PreviewItem);
      sub_20D5813B0(v14);
      sub_20D589320((uint64_t)v14, type metadata accessor for PreviewItem);
      sub_20D5A6E4C();
      sub_20D5A6E70();
      sub_20D5A6E7C();
      sub_20D5A6E58();
      v21 += v22;
      --v23;
    }
    while (v23);
    v19 = v36[0];
    a3 = v33;
    v9 = v31;
    a1 = v32;
    a2 = v29;
    v11 = v30;
  }
  sub_20D57C228(a2, (uint64_t)v9, &qword_2549B97D8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v35) == 1)
  {
    sub_20D57C26C((uint64_t)v9, &qword_2549B97D8);
    v24 = -1;
  }
  else
  {
    sub_20D588FC8((uint64_t)v9, (uint64_t)v17, type metadata accessor for PreviewItem);
    if (v18)
    {
      v24 = 0;
      v25 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
      v26 = *(_QWORD *)(v11 + 72);
      while (!_s9QuickLook11PreviewItemV2eeoiySbAC_ACtFZ_0(v25, (uint64_t)v17))
      {
        ++v24;
        v25 += v26;
        if (v18 == v24)
          goto LABEL_11;
      }
    }
    else
    {
LABEL_11:
      v24 = -1;
    }
    sub_20D589320((uint64_t)v17, type metadata accessor for PreviewItem);
  }
  v36[0] = 0;
  v36[1] = 0;
  v36[2] = 1;
  v37 = 0;
  static PreviewApplication.open(items:selectedItemIndex:configuration:)(v19, v24, 0, (uint64_t)v36, a3);
  return swift_bridgeObjectRelease();
}

uint64_t static PreviewApplication.open(items:selectedItemIndex:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  _QWORD v5[3];
  char v6;

  v5[0] = 0;
  v5[1] = 0;
  v5[2] = 1;
  v6 = 0;
  return static PreviewApplication.open(items:selectedItemIndex:configuration:)(a1, a2, a3 & 1, (uint64_t)v5, a4);
}

uint64_t static PreviewApplication.open(items:selectedItem:configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  char v42;

  v35 = a2;
  v39 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97D8);
  MEMORY[0x24BDAC7A8](v7);
  v36 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PreviewItem(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (uint64_t *)((char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v30 - v15;
  v17 = *((_QWORD *)a3 + 2);
  v18 = *((unsigned __int8 *)a3 + 24);
  v19 = *(_QWORD *)(a1 + 16);
  v20 = MEMORY[0x24BEE4AF8];
  v38 = *a3;
  v34 = a1;
  v37 = v14;
  if (v19)
  {
    v31 = v18;
    v32 = v17;
    v33 = v4;
    *(_QWORD *)&v40 = MEMORY[0x24BEE4AF8];
    sub_20D5A6E64();
    v21 = a1 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
    v30 = v10;
    v22 = *(_QWORD *)(v10 + 72);
    v23 = v19;
    do
    {
      sub_20D582F34(v21, (uint64_t)v13, type metadata accessor for PreviewItem);
      sub_20D5813B0(v13);
      sub_20D589320((uint64_t)v13, type metadata accessor for PreviewItem);
      sub_20D5A6E4C();
      sub_20D5A6E70();
      sub_20D5A6E7C();
      sub_20D5A6E58();
      v21 += v22;
      --v23;
    }
    while (v23);
    v24 = v39;
    v20 = v40;
    v17 = v32;
    LOBYTE(v18) = v31;
    v25 = (uint64_t)v36;
    v10 = v30;
  }
  else
  {
    v25 = (uint64_t)v36;
    v24 = v39;
  }
  sub_20D57C228(v35, v25, &qword_2549B97D8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v25, 1, v37) == 1)
  {
    sub_20D57C26C(v25, &qword_2549B97D8);
    v26 = -1;
  }
  else
  {
    sub_20D588FC8(v25, (uint64_t)v16, type metadata accessor for PreviewItem);
    if (v19)
    {
      v26 = 0;
      v27 = v34 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80));
      v28 = *(_QWORD *)(v10 + 72);
      while (!_s9QuickLook11PreviewItemV2eeoiySbAC_ACtFZ_0(v27, (uint64_t)v16))
      {
        ++v26;
        v27 += v28;
        if (v19 == v26)
        {
          v26 = -1;
          break;
        }
      }
      v24 = v39;
    }
    else
    {
      v26 = -1;
    }
    sub_20D589320((uint64_t)v16, type metadata accessor for PreviewItem);
  }
  v40 = v38;
  v41 = v17;
  v42 = v18;
  static PreviewApplication.open(items:selectedItemIndex:configuration:)(v20, v26, 0, (uint64_t)&v40, v24);
  return swift_bridgeObjectRelease();
}

uint64_t static PreviewApplication.open(items:selectedItemIndex:configuration:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v56 = a3;
  v55 = a2;
  v65 = a1;
  v67 = a5;
  v6 = sub_20D5A6660();
  v53 = *(_QWORD *)(v6 - 8);
  v54 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v52 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v8);
  v66 = (uint64_t)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  v60 = *(_QWORD *)(v10 - 8);
  v61 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  v58 = *(_QWORD *)(v13 - 8);
  v59 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F8);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = type metadata accessor for PreviewSession(0);
  v49 = *(_QWORD *)(v20 - 8);
  v21 = *(_QWORD *)(v49 + 64);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v64 = (uint64_t)&v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v49 - v23;
  v25 = *(_QWORD *)a4;
  v50 = *(_QWORD *)(a4 + 8);
  v51 = v25;
  v63 = *(_QWORD *)(a4 + 16);
  v62 = *(unsigned __int8 *)(a4 + 24);
  type metadata accessor for QLHostRemotePreviewModel();
  v26 = swift_allocObject();
  sub_20D5A66FC();
  v27 = v26 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_previewApplicationProcess;
  v28 = sub_20D5A6774();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v27, 1, 1, v28);
  v29 = v26 + OBJC_IVAR____TtC9QuickLook24QLHostRemotePreviewModel_config;
  v30 = sub_20D5A6750();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v29, 1, 1, v30);
  v31 = &v24[*(int *)(v20 + 24)];
  swift_retain();
  sub_20D5A6654();
  (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))(v19, *MEMORY[0x24BEE6A10], v16);
  sub_20D5A6C84();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v24, v15, v59);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800);
  (*(void (**)(char *, char *, unint64_t))(v60 + 32))(&v24[*(int *)(v32 + 28)], v12, v61);
  *(_QWORD *)&v24[*(int *)(v20 + 20)] = v26;
  v33 = v65;
  if ((sub_20D581B54(v65) & 1) != 0)
  {
    v34 = sub_20D5A6C78();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v66, 1, 1, v34);
    sub_20D582F34((uint64_t)v24, v64, type metadata accessor for PreviewSession);
    sub_20D5A6C54();
    swift_retain();
    swift_bridgeObjectRetain();
    v35 = v50;
    v36 = v51;
    sub_20D58900C(v51, v50, v63);
    v37 = sub_20D5A6C48();
    v38 = (*(unsigned __int8 *)(v49 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
    v39 = (v21 + v38 + 7) & 0xFFFFFFFFFFFFFFF8;
    v60 = (v39 + 15) & 0xFFFFFFFFFFFFFFF8;
    v61 = (v39 + 31) & 0xFFFFFFFFFFFFFFF8;
    v40 = (_QWORD *)swift_allocObject();
    v41 = MEMORY[0x24BEE6930];
    v40[2] = v37;
    v40[3] = v41;
    v40[4] = v26;
    sub_20D588FC8(v64, (uint64_t)v40 + v38, type metadata accessor for PreviewSession);
    *(_QWORD *)((char *)v40 + v39) = v33;
    v42 = (char *)v40 + v60;
    *(_QWORD *)v42 = v55;
    v42[8] = v56 & 1;
    v43 = (char *)v40 + v61;
    *(_QWORD *)v43 = v36;
    *((_QWORD *)v43 + 1) = v35;
    *((_QWORD *)v43 + 2) = v63;
    v43[24] = v62;
    *(_QWORD *)((char *)v40 + ((v39 + 63) & 0xFFFFFFFFFFFFFFF8)) = v57;
    sub_20D5847D0(v66, (uint64_t)&unk_2549B9878, (uint64_t)v40);
    swift_release();
    swift_release();
  }
  else
  {
    if (qword_2549B7F50 != -1)
      swift_once();
    v45 = (uint64_t)v52;
    v44 = v53;
    v46 = v54;
    (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v52, v31, v54);
    sub_20D588F84();
    v47 = (void *)swift_allocError();
    swift_retain();
    sub_20D582438(v45, v47);
    swift_release();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v45, v46);

  }
  return sub_20D588FC8((uint64_t)v24, v67, type metadata accessor for PreviewSession);
}

uint64_t sub_20D5859A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  char v14;

  *(_BYTE *)(v8 + 357) = v14;
  *(_QWORD *)(v8 + 192) = v13;
  *(_OWORD *)(v8 + 176) = v12;
  *(_BYTE *)(v8 + 356) = a8;
  *(_QWORD *)(v8 + 160) = a6;
  *(_QWORD *)(v8 + 168) = a7;
  *(_QWORD *)(v8 + 144) = a4;
  *(_QWORD *)(v8 + 152) = a5;
  *(_QWORD *)(v8 + 200) = type metadata accessor for PreviewSession(0);
  *(_QWORD *)(v8 + 208) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94C8);
  *(_QWORD *)(v8 + 216) = swift_task_alloc();
  v9 = sub_20D5A6660();
  *(_QWORD *)(v8 + 224) = v9;
  *(_QWORD *)(v8 + 232) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 240) = swift_task_alloc();
  *(_QWORD *)(v8 + 248) = swift_task_alloc();
  sub_20D5A6C54();
  *(_QWORD *)(v8 + 256) = sub_20D5A6C48();
  *(_QWORD *)(v8 + 264) = sub_20D5A6C18();
  *(_QWORD *)(v8 + 272) = v10;
  return swift_task_switch();
}

uint64_t sub_20D585AB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  if (qword_2549B7F50 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = qword_2549BCF40;
  *(_QWORD *)(v0 + 280) = qword_2549BCF40;
  v4 = *(int *)(v1 + 24);
  *(_DWORD *)(v0 + 352) = v4;
  v5 = v2 + v4;
  swift_retain();
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 288) = v6;
  *v6 = v0;
  v6[1] = sub_20D585B60;
  return sub_20D57E920(v3, v5);
}

uint64_t sub_20D585B60(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 296) = a1;
  *(_QWORD *)(v3 + 304) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_20D585BD4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v1 = *(_QWORD *)(v0 + 160);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_20D5A6EA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v2)
  {
    result = sub_20D5A6E64();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    v4 = *(_QWORD *)(v0 + 160);
    v5 = (void *)objc_opt_self();
    v6 = 0;
    v7 = v4 + 32;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        v8 = MEMORY[0x212BA368C](v6, *(_QWORD *)(v0 + 160));
      }
      else
      {
        v8 = *(_QWORD *)(v7 + 8 * v6);
        swift_unknownObjectRetain();
      }
      ++v6;
      v9 = objc_msgSend(v5, sel_itemWithPreviewItem_, v8);
      swift_unknownObjectRelease();
      sub_20D5A6E4C();
      sub_20D5A6E70();
      sub_20D5A6E7C();
      sub_20D5A6E58();
    }
    while (v2 != v6);
  }
  v10 = *(_QWORD *)(v0 + 192);
  v11 = *(_BYTE *)(v0 + 356);
  v12 = *(_QWORD *)(v0 + 168);
  v13 = sub_20D5A663C();
  *(_QWORD *)(v0 + 312) = v13;
  sub_20D58BA54();
  v14 = sub_20D5A6BDC();
  *(_QWORD *)(v0 + 320) = v14;
  swift_bridgeObjectRelease();
  v15 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v16 = objc_msgSend(v15, sel_bundleIdentifier);
  *(_QWORD *)(v0 + 328) = v16;

  if (v10 == 1)
    sub_20D58CECC(MEMORY[0x24BEE4AF8]);
  else
    sub_20D586310();
  if ((v11 & 1) != 0)
    v17 = -1;
  else
    v17 = v12;
  v18 = *(void **)(v0 + 296);
  v19 = sub_20D5A6A98();
  *(_QWORD *)(v0 + 336) = v19;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_20D585EBC;
  v20 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v21 = (_QWORD *)(v0 + 80);
  v21[1] = 0x40000000;
  v21[2] = sub_20D586484;
  v21[3] = &block_descriptor_31;
  v21[4] = v20;
  objc_msgSend(v18, sel_openWithSessionUUID_items_selectedIndex_bundleID_configuration_completionHandler_, v13, v14, v17, v16, v19, v21);
  return swift_continuation_await();
}

uint64_t sub_20D585EBC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 344) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_20D585F18()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v17;

  v1 = *(void **)(v0 + 328);
  v2 = *(void **)(v0 + 336);
  v4 = *(void **)(v0 + 312);
  v3 = *(void **)(v0 + 320);
  swift_release();

  if (qword_2549B7F48 != -1)
    swift_once();
  v5 = *(_QWORD *)(v0 + 296);
  v6 = *(_QWORD *)(v0 + 248);
  v7 = *(_QWORD *)(v0 + 208);
  v8 = *(_QWORD *)(v0 + 216);
  v10 = *(_QWORD *)(v0 + 184);
  v9 = *(_QWORD *)(v0 + 192);
  v17 = *(_QWORD *)(v0 + 176);
  v11 = *(_QWORD *)(v0 + 152);
  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 232) + 16))(v6, v11 + *(int *)(v0 + 352), *(_QWORD *)(v0 + 224));
  sub_20D582F34(v11, v7, type metadata accessor for PreviewSession);
  if (v9 == 1)
    v12 = 0;
  else
    v12 = v10;
  if (v9 == 1)
    v13 = 0;
  else
    v13 = v9;
  sub_20D588FC8(v7, v8, type metadata accessor for PreviewSession);
  v14 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
  *(_QWORD *)(v8 + *(int *)(v14 + 20)) = v5;
  v15 = (uint64_t *)(v8 + *(int *)(v14 + 24));
  *v15 = v12;
  v15[1] = v13;
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 0, 1, v14);
  swift_beginAccess();
  sub_20D58900C(v17, v10, v9);
  swift_unknownObjectRetain();
  sub_20D57F958(v8, v6);
  swift_endAccess();
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5860D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  swift_release();
  swift_release();
  v1 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 232);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 16))(v1, *(_QWORD *)(v0 + 152) + *(int *)(v0 + 352), v2);
  sub_20D588F84();
  v4 = (void *)swift_allocError();
  swift_retain();
  sub_20D582438(v1, v4);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5861E4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v1 = *(void **)(v0 + 336);
  v3 = *(void **)(v0 + 320);
  v2 = *(void **)(v0 + 328);
  v4 = *(void **)(v0 + 312);
  swift_release();
  swift_willThrow();
  swift_unknownObjectRelease();

  v5 = *(_QWORD *)(v0 + 240);
  v6 = *(_QWORD *)(v0 + 224);
  v7 = *(_QWORD *)(v0 + 232);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 16))(v5, *(_QWORD *)(v0 + 152) + *(int *)(v0 + 352), v6);
  sub_20D588F84();
  v8 = (void *)swift_allocError();
  swift_retain();
  sub_20D582438(v5, v8);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);

  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_20D586310()
{
  char *v0;
  char v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v12[2];
  __int128 v13;
  uint64_t v14;

  v1 = *v0;
  v2 = v0[1];
  v4 = *((_QWORD *)v0 + 1);
  v3 = *((_QWORD *)v0 + 2);
  v5 = v0[24];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9C20);
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 32) = 0xD000000000000010;
  *(_QWORD *)(inited + 40) = 0x800000020D5C01C0;
  v7 = MEMORY[0x24BEE1328];
  *(_OWORD *)(inited + 16) = xmmword_20D5B2360;
  *(_QWORD *)(inited + 72) = v7;
  *(_BYTE *)(inited + 48) = v1;
  if (qword_2549B7F58 != -1)
    swift_once();
  v8 = *(_QWORD *)algn_2549B97C8;
  *(_QWORD *)(inited + 80) = qword_2549B97C0;
  *(_QWORD *)(inited + 88) = v8;
  *(_BYTE *)(inited + 96) = v2;
  *(_QWORD *)(inited + 120) = v7;
  *(_QWORD *)(inited + 128) = 0xD000000000000010;
  *(_QWORD *)(inited + 136) = 0x800000020D5C0200;
  *(_QWORD *)(inited + 168) = v7;
  *(_BYTE *)(inited + 144) = v5;
  swift_bridgeObjectRetain();
  v9 = sub_20D58CECC(inited);
  if (v3)
  {
    v14 = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v13 = v4;
    *((_QWORD *)&v13 + 1) = v3;
    sub_20D578C6C(&v13, v12);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_20D580D04(v12, 0xD000000000000015, 0x800000020D5C01E0, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  return v9;
}

uint64_t sub_20D586484(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B9C00);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

unint64_t static PreviewApplication.PreviewConfiguration.hideDocumentMenuKey.getter()
{
  return 0xD000000000000010;
}

void sub_20D586514()
{
  qword_2549B97C0 = 0x736F6C43776F6873;
  *(_QWORD *)algn_2549B97C8 = 0xEF6E6F7474754265;
}

uint64_t static PreviewApplication.PreviewConfiguration.showCloseButtonKey.getter()
{
  uint64_t v0;

  if (qword_2549B7F58 != -1)
    swift_once();
  v0 = qword_2549B97C0;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t static PreviewApplication.PreviewConfiguration.matchScenePlacementIDKey.getter()
{
  return 0xD000000000000015;
}

unint64_t static PreviewApplication.PreviewConfiguration.isContentManaged.getter()
{
  return 0xD000000000000010;
}

uint64_t PreviewApplication.PreviewConfiguration.hideDocumentMenu.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t PreviewApplication.PreviewConfiguration.hideDocumentMenu.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*PreviewApplication.PreviewConfiguration.hideDocumentMenu.modify())()
{
  return QLPHDisplayVelocityFromQLPXDisplayVelocity;
}

uint64_t PreviewApplication.PreviewConfiguration.showCloseButton.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t PreviewApplication.PreviewConfiguration.showCloseButton.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*PreviewApplication.PreviewConfiguration.showCloseButton.modify())()
{
  return QLPHDisplayVelocityFromQLPXDisplayVelocity;
}

uint64_t PreviewApplication.PreviewConfiguration.matchScenePlacementID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewApplication.PreviewConfiguration.matchScenePlacementID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*PreviewApplication.PreviewConfiguration.matchScenePlacementID.modify())()
{
  return QLPHDisplayVelocityFromQLPXDisplayVelocity;
}

uint64_t PreviewApplication.PreviewConfiguration.isContentManaged.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t PreviewApplication.PreviewConfiguration.isContentManaged.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 24) = result;
  return result;
}

uint64_t (*PreviewApplication.PreviewConfiguration.isContentManaged.modify())()
{
  return QLPHDisplayVelocityFromQLPXDisplayVelocity;
}

QuickLook::PreviewApplication::PreviewConfiguration __swiftcall PreviewApplication.PreviewConfiguration.init()()
{
  uint64_t v0;
  QuickLook::PreviewApplication::PreviewConfiguration result;

  *(_WORD *)v0 = 0;
  *(_QWORD *)(v0 + 8) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 24) = 0;
  return result;
}

uint64_t PreviewApplication.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PreviewApplication.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t PreviewItem.displayName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PreviewItem.editingMode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t PreviewItem.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for PreviewItem(0) + 28);
  v4 = sub_20D5A6660();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t PreviewItem.hash(into:)()
{
  type metadata accessor for PreviewItem(0);
  sub_20D5A6660();
  sub_20D570178(&qword_2549B9880, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_20D5A6ABC();
}

uint64_t PreviewItem.hashValue.getter()
{
  sub_20D5A6F60();
  type metadata accessor for PreviewItem(0);
  sub_20D5A6660();
  sub_20D570178(&qword_2549B9880, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_20D5A6ABC();
  return sub_20D5A6F78();
}

uint64_t sub_20D58683C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 28);
  v5 = sub_20D5A6660();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_20D58687C()
{
  sub_20D5A6F60();
  sub_20D5A6660();
  sub_20D570178(&qword_2549B9880, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_20D5A6ABC();
  return sub_20D5A6F78();
}

uint64_t sub_20D5868F4()
{
  sub_20D5A6660();
  sub_20D570178(&qword_2549B9880, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_20D5A6ABC();
}

uint64_t sub_20D586958()
{
  sub_20D5A6F60();
  sub_20D5A6660();
  sub_20D570178(&qword_2549B9880, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_20D5A6ABC();
  return sub_20D5A6F78();
}

uint64_t sub_20D5869CC()
{
  return 1;
}

uint64_t sub_20D5869D4()
{
  sub_20D5A6F60();
  sub_20D5A6F6C();
  return sub_20D5A6F78();
}

uint64_t sub_20D586A14()
{
  return sub_20D5A6F6C();
}

uint64_t sub_20D586A38()
{
  sub_20D5A6F60();
  sub_20D5A6F6C();
  return sub_20D5A6F78();
}

uint64_t PreviewSession.events.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t PreviewSession.close()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[5] = v0;
  v2 = type metadata accessor for PreviewSession(0);
  v1[6] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[7] = v3;
  v1[8] = *(_QWORD *)(v3 + 64);
  v1[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  v1[10] = swift_task_alloc();
  v4 = *(_QWORD *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v1[11] = v4;
  v1[12] = *(_QWORD *)(v4 + 64);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20D586B7C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  if (qword_2549B7F48 != -1)
    swift_once();
  swift_beginAccess();
  v1 = qword_2549BCF38;
  if (*(_QWORD *)(qword_2549BCF38 + 16)
    && (v2 = sub_20D5883EC(*(_QWORD *)(v0 + 40) + *(int *)(*(_QWORD *)(v0 + 48) + 24)), (v3 & 1) != 0))
  {
    v5 = *(_QWORD *)(v0 + 112);
    v4 = *(_QWORD *)(v0 + 120);
    v6 = *(_QWORD *)(v0 + 104);
    v8 = *(_QWORD *)(v0 + 80);
    v7 = *(_QWORD *)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 72);
    v17 = *(_QWORD *)(v0 + 96);
    v16 = *(_QWORD *)(v0 + 56);
    v10 = *(_QWORD *)(v0 + 40);
    sub_20D582F34(*(_QWORD *)(v1 + 56) + *(_QWORD *)(v7 + 72) * v2, v5, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_20D588FC8(v5, v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
    swift_endAccess();
    v11 = sub_20D5A6C78();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
    sub_20D582F34(v4, v6, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_20D582F34(v10, v9, type metadata accessor for PreviewSession);
    v12 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v13 = (v17 + *(unsigned __int8 *)(v16 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = 0;
    *(_QWORD *)(v14 + 24) = 0;
    sub_20D588FC8(v6, v14 + v12, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_20D588FC8(v9, v14 + v13, type metadata accessor for PreviewSession);
    sub_20D5847D0(v8, (uint64_t)&unk_2549B9898, v14);
    swift_release();
    sub_20D589320(v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
  }
  else
  {
    swift_endAccess();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D586D9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 120) = a4;
  *(_QWORD *)(v5 + 128) = a5;
  return swift_task_switch();
}

uint64_t sub_20D586DB4()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[15];
  v2 = *(void **)(v1 + *(int *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) + 20));
  type metadata accessor for PreviewSession(0);
  v3 = sub_20D5A663C();
  v0[17] = v3;
  v0[2] = v0;
  v0[3] = sub_20D586E78;
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_20D586484;
  v5[3] = &block_descriptor_28_0;
  v5[4] = v4;
  objc_msgSend(v2, sel_closeWithSessionUUID_completionHandler_, v3, v5);
  return swift_continuation_await();
}

uint64_t sub_20D586E78()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 144) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

unint64_t PreviewSession.Action.init(rawValue:)(unint64_t a1)
{
  return sub_20D58935C(a1);
}

BOOL sub_20D586EF4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20D586F08()
{
  sub_20D5A6F60();
  sub_20D5A6F6C();
  return sub_20D5A6F78();
}

uint64_t sub_20D586F4C()
{
  return sub_20D5A6F6C();
}

uint64_t sub_20D586F74()
{
  sub_20D5A6F60();
  sub_20D5A6F6C();
  return sub_20D5A6F78();
}

unint64_t sub_20D586FB4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_20D58935C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_20D586FE4()
{
  sub_20D58BA10();
  return sub_20D5A6BC4();
}

uint64_t sub_20D587040()
{
  sub_20D58BA10();
  return sub_20D5A6BB8();
}

uint64_t PreviewSession.perform(action:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[5] = a1;
  v2[6] = v1;
  v3 = type metadata accessor for PreviewSession(0);
  v2[7] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[8] = v4;
  v2[9] = *(_QWORD *)(v4 + 64);
  v2[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  v2[11] = swift_task_alloc();
  v5 = *(_QWORD *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v2[12] = v5;
  v2[13] = *(_QWORD *)(v5 + 64);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20D587158()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (qword_2549B7F48 != -1)
    swift_once();
  swift_beginAccess();
  v1 = qword_2549BCF38;
  if (*(_QWORD *)(qword_2549BCF38 + 16)
    && (v2 = sub_20D5883EC(*(_QWORD *)(v0 + 48) + *(int *)(*(_QWORD *)(v0 + 56) + 24)), (v3 & 1) != 0))
  {
    v5 = *(_QWORD *)(v0 + 120);
    v4 = *(_QWORD *)(v0 + 128);
    v6 = *(_QWORD *)(v0 + 112);
    v8 = *(_QWORD *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 96);
    v9 = *(_QWORD *)(v0 + 80);
    v17 = *(_QWORD *)(v0 + 104);
    v18 = *(_QWORD *)(v0 + 72);
    v16 = *(_QWORD *)(v0 + 64);
    v10 = *(_QWORD *)(v0 + 48);
    v19 = *(_QWORD *)(v0 + 40);
    sub_20D582F34(*(_QWORD *)(v1 + 56) + *(_QWORD *)(v7 + 72) * v2, v5, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_20D588FC8(v5, v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
    swift_endAccess();
    v11 = sub_20D5A6C78();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
    sub_20D582F34(v4, v6, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_20D582F34(v10, v9, type metadata accessor for PreviewSession);
    v12 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v13 = (v17 + *(unsigned __int8 *)(v16 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = 0;
    *(_QWORD *)(v14 + 24) = 0;
    sub_20D588FC8(v6, v14 + v12, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_20D588FC8(v9, v14 + v13, type metadata accessor for PreviewSession);
    *(_QWORD *)(v14 + ((v18 + v13 + 7) & 0xFFFFFFFFFFFFFFF8)) = v19;
    sub_20D5847D0(v8, (uint64_t)&unk_2549B98B0, v14);
    swift_release();
    sub_20D589320(v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
  }
  else
  {
    swift_endAccess();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D58738C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[16] = a5;
  v6[17] = a6;
  v6[15] = a4;
  return swift_task_switch();
}

uint64_t sub_20D5873A8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[17];
  v2 = v0[15];
  v3 = *(void **)(v2 + *(int *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) + 20));
  type metadata accessor for PreviewSession(0);
  v4 = sub_20D5A663C();
  v0[18] = v4;
  v0[2] = v0;
  v0[3] = sub_20D58747C;
  v5 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_20D586484;
  v0[13] = &block_descriptor_26;
  v0[14] = v5;
  objc_msgSend(v3, sel_performActionWithSessionUUID_action_itemIndex_completionHandler_, v4, v1, 0, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_20D58747C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_20D5874DC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D587510()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 144);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PreviewSession.update(items:selectedItem:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v4 = type metadata accessor for PreviewSession(0);
  v3[8] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[9] = v5;
  v3[10] = *(_QWORD *)(v5 + 64);
  v3[11] = swift_task_alloc();
  v6 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B97D8) - 8);
  v3[12] = v6;
  v3[13] = *(_QWORD *)(v6 + 64);
  v3[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  v3[15] = swift_task_alloc();
  v7 = *(_QWORD *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v3[16] = v7;
  v3[17] = *(_QWORD *)(v7 + 64);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  v3[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20D58764C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (qword_2549B7F48 != -1)
    swift_once();
  swift_beginAccess();
  v1 = qword_2549BCF38;
  if (*(_QWORD *)(qword_2549BCF38 + 16)
    && (v2 = sub_20D5883EC(*(_QWORD *)(v0 + 56) + *(int *)(*(_QWORD *)(v0 + 64) + 24)), (v3 & 1) != 0))
  {
    v4 = *(_QWORD *)(v0 + 152);
    v5 = *(_QWORD *)(v0 + 160);
    v6 = *(_QWORD *)(v0 + 128);
    v8 = *(_QWORD *)(v0 + 112);
    v7 = *(_QWORD *)(v0 + 120);
    v22 = *(_QWORD *)(v0 + 136);
    v18 = *(_QWORD *)(v0 + 144);
    v19 = *(_QWORD *)(v0 + 96);
    v17 = *(_QWORD *)(v0 + 88);
    v21 = *(_QWORD *)(v0 + 104);
    v20 = *(_QWORD *)(v0 + 72);
    v10 = *(_QWORD *)(v0 + 48);
    v9 = *(_QWORD *)(v0 + 56);
    v23 = *(_QWORD *)(v0 + 40);
    sub_20D582F34(*(_QWORD *)(v1 + 56) + *(_QWORD *)(v6 + 72) * v2, v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_20D588FC8(v4, v5, type metadata accessor for PreviewApplication.PreviewSessionMap);
    swift_endAccess();
    v11 = sub_20D5A6C78();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
    sub_20D57C228(v10, v8, &qword_2549B97D8);
    sub_20D582F34(v5, v18, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_20D582F34(v9, v17, type metadata accessor for PreviewSession);
    v12 = (*(unsigned __int8 *)(v19 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    v13 = (v21 + *(unsigned __int8 *)(v6 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v14 = (v22 + *(unsigned __int8 *)(v20 + 80) + v13) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
    v15 = (_QWORD *)swift_allocObject();
    v15[2] = 0;
    v15[3] = 0;
    v15[4] = v23;
    sub_20D5888FC(v8, (uint64_t)v15 + v12);
    sub_20D588FC8(v18, (uint64_t)v15 + v13, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_20D588FC8(v17, (uint64_t)v15 + v14, type metadata accessor for PreviewSession);
    swift_bridgeObjectRetain();
    sub_20D5847D0(v7, (uint64_t)&unk_2549B98C8, (uint64_t)v15);
    swift_release();
    sub_20D589320(v5, type metadata accessor for PreviewApplication.PreviewSessionMap);
  }
  else
  {
    swift_endAccess();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5878F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;

  v7[17] = a6;
  v7[18] = a7;
  v7[15] = a4;
  v7[16] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97D8);
  v7[19] = swift_task_alloc();
  v8 = type metadata accessor for PreviewItem(0);
  v7[20] = v8;
  v7[21] = *(_QWORD *)(v8 - 8);
  v7[22] = swift_task_alloc();
  v7[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20D587990()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;

  v1 = v0[15];
  v2 = *(_QWORD *)(v1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v4 = v0[21];
    sub_20D5A6E64();
    v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v6 = *(_QWORD *)(v4 + 72);
    v7 = v2;
    do
    {
      v8 = (uint64_t *)v0[22];
      sub_20D582F34(v5, (uint64_t)v8, type metadata accessor for PreviewItem);
      sub_20D5813B0(v8);
      sub_20D589320((uint64_t)v8, type metadata accessor for PreviewItem);
      sub_20D5A6E4C();
      sub_20D5A6E70();
      sub_20D5A6E7C();
      sub_20D5A6E58();
      v5 += v6;
      --v7;
    }
    while (v7);
    swift_release();
  }
  v9 = v0[20];
  v10 = v0[21];
  v11 = v0[19];
  sub_20D57C228(v0[16], v11, &qword_2549B97D8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9) == 1)
  {
    sub_20D57C26C(v0[19], &qword_2549B97D8);
    if (v2)
    {
      v12 = v0[21];
      v34 = v3;
      sub_20D5A6E64();
      v13 = *(_QWORD *)(v12 + 72);
      v14 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
      v33 = -1;
      goto LABEL_14;
    }
LABEL_27:
    v33 = -1;
    v20 = v3;
    if ((v3 & 0xC000000000000000) == 0)
      goto LABEL_18;
    goto LABEL_28;
  }
  sub_20D588FC8(v0[19], v0[23], type metadata accessor for PreviewItem);
  if (!v2)
  {
    sub_20D589320(v0[23], type metadata accessor for PreviewItem);
    goto LABEL_27;
  }
  v15 = 0;
  v16 = v0[21];
  v14 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v17 = v0[15] + v14;
  v13 = *(_QWORD *)(v16 + 72);
  while (!_s9QuickLook11PreviewItemV2eeoiySbAC_ACtFZ_0(v17, v0[23]))
  {
    ++v15;
    v17 += v13;
    if (v2 == v15)
    {
      v15 = -1;
      break;
    }
  }
  v33 = v15;
  sub_20D589320(v0[23], type metadata accessor for PreviewItem);
  v34 = v3;
  sub_20D5A6E64();
LABEL_14:
  v18 = v0[15] + v14;
  do
  {
    v19 = (uint64_t *)v0[22];
    sub_20D582F34(v18, (uint64_t)v19, type metadata accessor for PreviewItem);
    sub_20D5813B0(v19);
    sub_20D589320((uint64_t)v19, type metadata accessor for PreviewItem);
    sub_20D5A6E4C();
    sub_20D5A6E70();
    sub_20D5A6E7C();
    sub_20D5A6E58();
    v18 += v13;
    --v2;
  }
  while (v2);
  v20 = v34;
  if ((v34 & 0x8000000000000000) == 0 && (v34 & 0x4000000000000000) == 0)
  {
LABEL_18:
    v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v21)
      goto LABEL_19;
LABEL_29:
    swift_bridgeObjectRelease();
    v27 = v0[17];
    v28 = *(void **)(v27 + *(int *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) + 20));
    type metadata accessor for PreviewSession(0);
    v29 = sub_20D5A663C();
    v0[24] = v29;
    sub_20D58BA54();
    v30 = sub_20D5A6BDC();
    v0[25] = v30;
    swift_bridgeObjectRelease();
    v0[2] = v0;
    v0[3] = sub_20D587E18;
    v31 = swift_continuation_init();
    v0[10] = MEMORY[0x24BDAC760];
    v32 = v0 + 10;
    v32[1] = 0x40000000;
    v32[2] = sub_20D586484;
    v32[3] = &block_descriptor_24;
    v32[4] = v31;
    objc_msgSend(v28, sel_updateContentsWithSessionUUID_items_selectedIndex_completionHandler_, v29, v30, v33, v32);
    return swift_continuation_await();
  }
LABEL_28:
  swift_bridgeObjectRetain();
  v21 = sub_20D5A6EA0();
  swift_bridgeObjectRelease();
  if (!v21)
    goto LABEL_29;
LABEL_19:
  result = sub_20D5A6E64();
  if ((v21 & 0x8000000000000000) == 0)
  {
    v23 = (void *)objc_opt_self();
    v24 = 0;
    do
    {
      if ((v20 & 0xC000000000000001) != 0)
      {
        v25 = MEMORY[0x212BA368C](v24, v20);
      }
      else
      {
        v25 = *(_QWORD *)(v20 + 8 * v24 + 32);
        swift_unknownObjectRetain();
      }
      ++v24;
      v26 = objc_msgSend(v23, sel_itemWithPreviewItem_, v25);
      swift_unknownObjectRelease();
      sub_20D5A6E4C();
      sub_20D5A6E70();
      sub_20D5A6E7C();
      sub_20D5A6E58();
    }
    while (v21 != v24);
    goto LABEL_29;
  }
  __break(1u);
  return result;
}

uint64_t sub_20D587E18()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 208) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_20D587E78()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 192);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D587ED8()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 200);
  v2 = *(void **)(v0 + 192);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PreviewSession.bringToFront()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[5] = v0;
  v2 = type metadata accessor for PreviewSession(0);
  v1[6] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[7] = v3;
  v1[8] = *(_QWORD *)(v3 + 64);
  v1[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  v1[10] = swift_task_alloc();
  v4 = *(_QWORD *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v1[11] = v4;
  v1[12] = *(_QWORD *)(v4 + 64);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20D58801C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  if (qword_2549B7F48 != -1)
    swift_once();
  swift_beginAccess();
  v1 = qword_2549BCF38;
  if (*(_QWORD *)(qword_2549BCF38 + 16)
    && (v2 = sub_20D5883EC(*(_QWORD *)(v0 + 40) + *(int *)(*(_QWORD *)(v0 + 48) + 24)), (v3 & 1) != 0))
  {
    v5 = *(_QWORD *)(v0 + 112);
    v4 = *(_QWORD *)(v0 + 120);
    v6 = *(_QWORD *)(v0 + 104);
    v8 = *(_QWORD *)(v0 + 80);
    v7 = *(_QWORD *)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 72);
    v17 = *(_QWORD *)(v0 + 96);
    v16 = *(_QWORD *)(v0 + 56);
    v10 = *(_QWORD *)(v0 + 40);
    sub_20D582F34(*(_QWORD *)(v1 + 56) + *(_QWORD *)(v7 + 72) * v2, v5, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_20D588FC8(v5, v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
    swift_endAccess();
    v11 = sub_20D5A6C78();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
    sub_20D582F34(v4, v6, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_20D582F34(v10, v9, type metadata accessor for PreviewSession);
    v12 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v13 = (v17 + *(unsigned __int8 *)(v16 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = 0;
    *(_QWORD *)(v14 + 24) = 0;
    sub_20D588FC8(v6, v14 + v12, type metadata accessor for PreviewApplication.PreviewSessionMap);
    sub_20D588FC8(v9, v14 + v13, type metadata accessor for PreviewSession);
    sub_20D5847D0(v8, (uint64_t)&unk_2549B98E0, v14);
    swift_release();
    sub_20D589320(v4, type metadata accessor for PreviewApplication.PreviewSessionMap);
  }
  else
  {
    swift_endAccess();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D58823C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 120) = a4;
  *(_QWORD *)(v5 + 128) = a5;
  return swift_task_switch();
}

uint64_t sub_20D588254()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[15];
  v2 = *(void **)(v1 + *(int *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) + 20));
  type metadata accessor for PreviewSession(0);
  v3 = sub_20D5A663C();
  v0[17] = v3;
  v0[2] = v0;
  v0[3] = sub_20D588318;
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_20D586484;
  v5[3] = &block_descriptor_4;
  v5[4] = v4;
  objc_msgSend(v2, sel_bringToFrontWithSessionUUID_completionHandler_, v3, v5);
  return swift_continuation_await();
}

uint64_t sub_20D588318()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 144) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_20D588378()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5883AC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 136);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_20D5883EC(uint64_t a1)
{
  uint64_t v2;

  sub_20D5A6660();
  sub_20D570178(&qword_2549B9880, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = sub_20D5A6AB0();
  return sub_20D58854C(a1, v2);
}

unint64_t sub_20D588458(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_20D5A6F60();
  sub_20D5A6B64();
  v4 = sub_20D5A6F78();
  return sub_20D58868C(a1, a2, v4);
}

unint64_t sub_20D5884C0(uint64_t a1)
{
  uint64_t v2;

  sub_20D5A6AF8();
  sub_20D5A6F60();
  sub_20D5A6B64();
  v2 = sub_20D5A6F78();
  swift_bridgeObjectRelease();
  return sub_20D58876C(a1, v2);
}

unint64_t sub_20D58854C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_20D5A6660();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_20D570178((unint64_t *)&unk_2549B9C10, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = sub_20D5A6AC8();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_20D58868C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_20D5A6F0C() & 1) == 0)
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
      while (!v14 && (sub_20D5A6F0C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_20D58876C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_20D5A6AF8();
    v8 = v7;
    if (v6 == sub_20D5A6AF8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_20D5A6F0C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_20D5A6AF8();
          v15 = v14;
          if (v13 == sub_20D5A6AF8() && v15 == v16)
            break;
          v18 = sub_20D5A6F0C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_20D5888E0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_20D588944(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_20D5888FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D588944(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_2549B9C30);
  v10 = *(_QWORD *)(type metadata accessor for PreviewItem(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for PreviewItem(0) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_20D5A6ED0();
  __break(1u);
  return result;
}

BOOL _s9QuickLook11PreviewItemV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  char *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  char *v49;

  v4 = type metadata accessor for PreviewItem(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v46 = (uint64_t)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v45 = (uint64_t)&v42 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v48 = (char *)&v42 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v47 = (char *)&v42 - v11;
  v12 = sub_20D5A6618();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v42 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9C28);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (uint64_t)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = *(int *)(v4 + 24);
  v24 = a2 + v23;
  v25 = v22 + *(int *)(v20 + 48);
  sub_20D582F34(a1 + v23, v22, type metadata accessor for PreviewItem.Source);
  sub_20D582F34(v24, v25, type metadata accessor for PreviewItem.Source);
  v44 = v13;
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 32);
  v27 = v16;
  v28 = v12;
  v30 = v47;
  v29 = v48;
  v26(v18, v22, v28);
  v26(v27, v25, v28);
  v31 = a1;
  v49 = v27;
  LOBYTE(v22) = MEMORY[0x212BA2E4C](v18, v27);
  sub_20D582F34(a1, (uint64_t)v30, type metadata accessor for PreviewItem);
  sub_20D582F34(a2, (uint64_t)v29, type metadata accessor for PreviewItem);
  if ((v22 & 1) == 0)
  {
    sub_20D589320((uint64_t)v29, type metadata accessor for PreviewItem);
    sub_20D589320((uint64_t)v30, type metadata accessor for PreviewItem);
LABEL_11:
    v36 = v45;
    v37 = v46;
    v39 = v44;
    goto LABEL_12;
  }
  v32 = v30[1];
  v33 = v29[1];
  if (v32)
  {
    if (v33)
    {
      v43 = a1;
      if (*v30 != *v29 || v32 != v33)
      {
        v35 = sub_20D5A6F0C();
        swift_bridgeObjectRetain();
        sub_20D589320((uint64_t)v29, type metadata accessor for PreviewItem);
        sub_20D589320((uint64_t)v30, type metadata accessor for PreviewItem);
        swift_bridgeObjectRelease();
        v36 = v45;
        sub_20D582F34(v43, v45, type metadata accessor for PreviewItem);
        v37 = v46;
        sub_20D582F34(a2, v46, type metadata accessor for PreviewItem);
        v38 = 0;
        v39 = v44;
        if ((v35 & 1) == 0)
          goto LABEL_19;
        goto LABEL_18;
      }
      swift_bridgeObjectRetain();
      sub_20D589320((uint64_t)v29, type metadata accessor for PreviewItem);
      sub_20D589320((uint64_t)v30, type metadata accessor for PreviewItem);
      swift_bridgeObjectRelease();
LABEL_17:
      v36 = v45;
      sub_20D582F34(v43, v45, type metadata accessor for PreviewItem);
      v37 = v46;
      sub_20D582F34(a2, v46, type metadata accessor for PreviewItem);
      v39 = v44;
LABEL_18:
      v38 = *(_QWORD *)(v36 + 16) == *(_QWORD *)(v37 + 16);
      goto LABEL_19;
    }
    swift_bridgeObjectRetain();
    sub_20D589320((uint64_t)v29, type metadata accessor for PreviewItem);
    sub_20D589320((uint64_t)v30, type metadata accessor for PreviewItem);
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v43 = a1;
  swift_bridgeObjectRetain();
  sub_20D589320((uint64_t)v29, type metadata accessor for PreviewItem);
  sub_20D589320((uint64_t)v30, type metadata accessor for PreviewItem);
  if (!v33)
    goto LABEL_17;
  swift_bridgeObjectRelease();
  v36 = v45;
  v37 = v46;
  v31 = v43;
  v39 = v44;
LABEL_12:
  sub_20D582F34(v31, v36, type metadata accessor for PreviewItem);
  sub_20D582F34(a2, v37, type metadata accessor for PreviewItem);
  v38 = 0;
LABEL_19:
  sub_20D589320(v37, type metadata accessor for PreviewItem);
  sub_20D589320(v36, type metadata accessor for PreviewItem);
  v40 = *(void (**)(char *, uint64_t))(v39 + 8);
  v40(v49, v28);
  v40(v18, v28);
  return v38;
}

uint64_t type metadata accessor for PreviewSession(uint64_t a1)
{
  return sub_20D576D9C(a1, (uint64_t *)&unk_2549B9A80);
}

unint64_t sub_20D588F84()
{
  unint64_t result;

  result = qword_2549B9808;
  if (!qword_2549B9808)
  {
    result = MEMORY[0x212BA45A4](&unk_20D5B2CC8, &type metadata for PreviewSession.Failure);
    atomic_store(result, &qword_2549B9808);
  }
  return result;
}

uint64_t sub_20D588FC8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_20D58900C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_20D589020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for PreviewSession(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 31) & 0xFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  v5 = v0 + v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = v5 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800) + 28);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  swift_release();
  v9 = v5 + *(int *)(v1 + 24);
  v10 = sub_20D5A6660();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + v4 + 16) != 1)
    swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20D58914C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  _QWORD *v13;
  uint64_t v15;

  v3 = *(_QWORD *)(type metadata accessor for PreviewSession(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  v7 = v1[3];
  v15 = v1[2];
  v8 = v1[4];
  v9 = *(_QWORD *)((char *)v1 + v5);
  v10 = (uint64_t)v1 + v4;
  v11 = *(_QWORD *)((char *)v1 + v6);
  v12 = *((_BYTE *)v1 + v6 + 8);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v13;
  *v13 = v2;
  v13[1] = sub_20D577D2C;
  return sub_20D5859A4(a1, v15, v7, v8, v10, v9, v11, v12);
}

uint64_t type metadata accessor for PreviewApplication.PreviewSessionMap(uint64_t a1)
{
  return sub_20D576D9C(a1, qword_2549B9BA8);
}

uint64_t sub_20D58927C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v2 = *(_QWORD *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PreviewSession(0) - 8) + 80);
  v6 = v3 + v4 + v5;
  v7 = v0 + v3;
  v8 = v0 + (v6 & ~v5);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_20D577D2C;
  v9[15] = v7;
  v9[16] = v8;
  return swift_task_switch();
}

uint64_t sub_20D589320(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_20D58935C(unint64_t result)
{
  if (result > 3)
    return 0;
  return result;
}

uint64_t sub_20D58936C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void (*v11)(unint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v16)(unint64_t, uint64_t);
  uint64_t v17;
  unint64_t v18;

  v1 = *(_QWORD *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = type metadata accessor for PreviewSession(0);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  v18 = (v2 + v3 + v5) & ~v5;
  v17 = v0;
  swift_unknownObjectRelease();
  v6 = v0 + v2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  v16 = *(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v16(v0 + v2, v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800);
  v9 = v0 + v2 + *(int *)(v8 + 28);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  v11 = *(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  swift_release();
  v12 = v6 + *(int *)(v4 + 24);
  v13 = sub_20D5A6660();
  v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8);
  v14(v12, v13);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v16(v17 + v18, v7);
  v11(v17 + v18 + *(int *)(v8 + 28), v10);
  swift_release();
  v14(v17 + v18 + *(int *)(v4 + 24), v13);
  return swift_deallocObject();
}

uint64_t sub_20D589520()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v2 = *(_QWORD *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(_QWORD *)(type metadata accessor for PreviewSession(0) - 8);
  v6 = (v3 + v4 + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v0 + v3;
  v8 = v0 + v6;
  v9 = *(_QWORD *)(v0 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v10;
  *v10 = v1;
  v10[1] = sub_20D577D2C;
  v10[16] = v8;
  v10[17] = v9;
  v10[15] = v7;
  return swift_task_switch();
}

uint64_t sub_20D5895DC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B97D8) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(_QWORD *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v28 = type metadata accessor for PreviewSession(0);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v28 - 8) + 80);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v8 = v0 + v2;
  v9 = type metadata accessor for PreviewItem(0);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v0 + v2, 1, v9))
  {
    swift_bridgeObjectRelease();
    v10 = v8 + *(int *)(v9 + 24);
    v11 = sub_20D5A6618();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
    v12 = v8 + *(int *)(v9 + 28);
    v13 = sub_20D5A6660();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  }
  v14 = (v2 + v3 + v5) & ~v5;
  v15 = (v14 + v6 + v7) & ~v7;
  v16 = v0 + v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  v27 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8);
  v27(v16, v17);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800);
  v19 = v16 + *(int *)(v18 + 28);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  v21 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8);
  v21(v19, v20);
  swift_release();
  v22 = v16 + *(int *)(v28 + 24);
  v23 = sub_20D5A6660();
  v24 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8);
  v24(v22, v23);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v25 = v0 + v15;
  v27(v25, v17);
  v21(v25 + *(int *)(v18 + 28), v20);
  swift_release();
  v24(v25 + *(int *)(v28 + 24), v23);
  return swift_deallocObject();
}

uint64_t sub_20D589844(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B97D8) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(_QWORD *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v8 = (v5 + v6 + *(unsigned __int8 *)(v7 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PreviewSession(0) - 8) + 80);
  v11 = v8 + v9 + v10;
  v12 = v1[2];
  v13 = v1[3];
  v14 = v1[4];
  v15 = (uint64_t)v1 + v5;
  v16 = (uint64_t)v1 + v8;
  v17 = (uint64_t)v1 + (v11 & ~v10);
  v18 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v18;
  *v18 = v2;
  v18[1] = sub_20D577D2C;
  return sub_20D5878F8(a1, v12, v13, v14, v15, v16, v17);
}

uint64_t objectdestroy_3Tm()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void (*v11)(unint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v16)(unint64_t, uint64_t);
  uint64_t v17;
  unint64_t v18;

  v1 = *(_QWORD *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = type metadata accessor for PreviewSession(0);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  v18 = (v2 + v3 + v5) & ~v5;
  v17 = v0;
  swift_unknownObjectRelease();
  v6 = v0 + v2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  v16 = *(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v16(v0 + v2, v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800);
  v9 = v0 + v2 + *(int *)(v8 + 28);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  v11 = *(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  swift_release();
  v12 = v6 + *(int *)(v4 + 24);
  v13 = sub_20D5A6660();
  v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8);
  v14(v12, v13);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v16(v17 + v18, v7);
  v11(v17 + v18 + *(int *)(v8 + 28), v10);
  swift_release();
  v14(v17 + v18 + *(int *)(v4 + 24), v13);
  return swift_deallocObject();
}

uint64_t sub_20D589AE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v2 = *(_QWORD *)(type metadata accessor for PreviewApplication.PreviewSessionMap(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PreviewSession(0) - 8) + 80);
  v6 = v3 + v4 + v5;
  v7 = v0 + v3;
  v8 = v0 + (v6 & ~v5);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_20D5779C0;
  v9[15] = v7;
  v9[16] = v8;
  return swift_task_switch();
}

uint64_t sub_20D589B84()
{
  return sub_20D570178(&qword_2549B9880, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t sub_20D589BB0()
{
  return sub_20D570178(&qword_2549B98E8, type metadata accessor for PreviewItem, (uint64_t)&protocol conformance descriptor for PreviewItem);
}

unint64_t sub_20D589BE0()
{
  unint64_t result;

  result = qword_2549B98F0;
  if (!qword_2549B98F0)
  {
    result = MEMORY[0x212BA45A4](&protocol conformance descriptor for PreviewSession.Action, &type metadata for PreviewSession.Action);
    atomic_store(result, (unint64_t *)&qword_2549B98F0);
  }
  return result;
}

uint64_t type metadata accessor for PreviewApplication()
{
  return objc_opt_self();
}

uint64_t method lookup function for PreviewApplication()
{
  return swift_lookUpClassMethod();
}

uint64_t destroy for PreviewApplication.PreviewConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PreviewApplication.PreviewConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PreviewApplication.PreviewConfiguration(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PreviewApplication.PreviewConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewApplication.PreviewConfiguration(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewApplication.PreviewConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewApplication.PreviewConfiguration()
{
  return &type metadata for PreviewApplication.PreviewConfiguration;
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviewItem(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    a1[2] = a2[2];
    v8 = *(int *)(a3 + 24);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_20D5A6618();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 28);
    v14 = (char *)v4 + v13;
    v15 = (char *)a2 + v13;
    v16 = sub_20D5A6660();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  return v4;
}

uint64_t destroy for PreviewItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_20D5A6618();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 28);
  v7 = sub_20D5A6660();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

_QWORD *initializeWithCopy for PreviewItem(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_20D5A6618();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 28);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_20D5A6660();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

_QWORD *assignWithCopy for PreviewItem(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_20D5A6618();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 28);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_20D5A6660();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t initializeWithTake for PreviewItem(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(int *)(a3 + 24);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_20D5A6618();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = *(int *)(a3 + 28);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_20D5A6660();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

_QWORD *assignWithTake for PreviewItem(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  v7 = *(int *)(a3 + 24);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_20D5A6618();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 28);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_20D5A6660();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewItem()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D58A230(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else if (*(_DWORD *)(*(_QWORD *)(type metadata accessor for PreviewItem.Source(0) - 8) + 84) == (_DWORD)a2)
  {
    v9 = a1 + *(int *)(a3 + 24);
    v10 = sub_20D5A6618();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v9, a2, v10);
  }
  else
  {
    v11 = sub_20D5A6660();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v11);
  }
}

uint64_t type metadata accessor for PreviewItem.Source(uint64_t a1)
{
  return sub_20D576D9C(a1, qword_2549B9B40);
}

uint64_t storeEnumTagSinglePayload for PreviewItem()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D58A314(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    if (*(_DWORD *)(*(_QWORD *)(type metadata accessor for PreviewItem.Source(0) - 8) + 84) == a3)
    {
      v7 = v5 + *(int *)(a4 + 24);
      v8 = sub_20D5A6618();
      v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
      v10 = v7;
    }
    else
    {
      v8 = sub_20D5A6660();
      v10 = v5 + *(int *)(a4 + 28);
      v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56);
    }
    return v9(v10, a2, a2, v8);
  }
  return result;
}

uint64_t sub_20D58A3C8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_20D5A6618();
  if (v1 <= 0x3F)
  {
    result = sub_20D5A6660();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviewSession(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800) + 28);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = sub_20D5A6660();
    v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
    swift_retain();
    v16(v13, v14, v15);
  }
  return a1;
}

uint64_t destroy for PreviewSession(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800) + 28);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
  v7 = a1 + *(int *)(a2 + 24);
  v8 = sub_20D5A6660();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t initializeWithCopy for PreviewSession(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800) + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_20D5A6660();
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  swift_retain();
  v15(v12, v13, v14);
  return a1;
}

uint64_t assignWithCopy for PreviewSession(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800) + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_retain();
  swift_release();
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_20D5A6660();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  return a1;
}

uint64_t initializeWithTake for PreviewSession(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800) + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_20D5A6660();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

uint64_t assignWithTake for PreviewSession(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800) + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_release();
  v11 = *(int *)(a3 + 24);
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_20D5A6660();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewSession()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D58A978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_20D5A6660();
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewSession()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D58AA30(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return result;
    }
    v10 = sub_20D5A6660();
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_20D58AAD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;

  sub_20D58AB68(319, a2, a3, a4);
  if (v4 <= 0x3F)
  {
    sub_20D5A6660();
    if (v5 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_20D58AB68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;

  if (!qword_2549B9A90)
  {
    v4 = type metadata accessor for DataProvider(0, (uint64_t)&type metadata for PreviewSession.Event, a3, a4);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_2549B9A90);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for PreviewSession.Event(_QWORD *a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v4 = v3;
  *a1 = v3;
  return a1;
}

void destroy for PreviewSession.Event(void **a1)
{
  void *v1;

  v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF)

}

void **assignWithCopy for PreviewSession.Event(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
      v7 = v4;
    *a1 = v4;
  }
  else if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    *a1 = *a2;
  }
  else
  {
    v5 = v4;
    v6 = *a1;
    *a1 = v4;

  }
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for PreviewSession.Event(void **a1, unint64_t *a2)
{
  void *v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)v3 < 0xFFFFFFFF)
    goto LABEL_6;
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewSession.Event(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PreviewSession.Event(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_20D58ADB8(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_20D58ADD0(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for PreviewSession.Event()
{
  return &type metadata for PreviewSession.Event;
}

ValueMetadata *type metadata accessor for PreviewSession.Action()
{
  return &type metadata for PreviewSession.Action;
}

unint64_t sub_20D58AE14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549B9AC8;
  if (!qword_2549B9AC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549B97F0);
    result = MEMORY[0x212BA45A4](MEMORY[0x24BEE6AA8], v1);
    atomic_store(result, (unint64_t *)&qword_2549B9AC8);
  }
  return result;
}

uint64_t *sub_20D58AE60(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = sub_20D5A6618();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t sub_20D58AED0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20D5A6618();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_20D58AF04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20D5A6618();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D58AF48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20D5A6618();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D58AF8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20D5A6618();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D58AFD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20D5A6618();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D58B014(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20D5A6618();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_20D58B050(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_20D5A6618();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, a2, a3, v6);
}

uint64_t sub_20D58B09C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = sub_20D5A6618();
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8);
    swift_initEnumMetadataSingleCase();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t *sub_20D58B0F8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800) + 28);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = type metadata accessor for PreviewSession(0);
    *(uint64_t *)((char *)a1 + *(int *)(v12 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v12 + 20));
    v13 = *(int *)(v12 + 24);
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = sub_20D5A6660();
    v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
    swift_retain();
    v17(v14, v15, v16);
    v18 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v19 = (uint64_t *)((char *)a1 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_20D58B238(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800) + 28);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = type metadata accessor for PreviewSession(0);
  swift_release();
  v6 = a1 + *(int *)(v5 + 24);
  v7 = sub_20D5A6660();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D58B308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800) + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = type metadata accessor for PreviewSession(0);
  *(_QWORD *)(a1 + *(int *)(v11 + 20)) = *(_QWORD *)(a2 + *(int *)(v11 + 20));
  v12 = *(int *)(v11 + 24);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_20D5A6660();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
  swift_retain();
  v16(v13, v14, v15);
  v17 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20D58B41C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800) + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = type metadata accessor for PreviewSession(0);
  *(_QWORD *)(a1 + *(int *)(v11 + 20)) = *(_QWORD *)(a2 + *(int *)(v11 + 20));
  swift_retain();
  swift_release();
  v12 = *(int *)(v11 + 24);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_20D5A6660();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v16 = *(int *)(a3 + 24);
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20D58B550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800) + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = type metadata accessor for PreviewSession(0);
  *(_QWORD *)(a1 + *(int *)(v11 + 20)) = *(_QWORD *)(a2 + *(int *)(v11 + 20));
  v12 = *(int *)(v11 + 24);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_20D5A6660();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  v16 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v16) = *(_OWORD *)(a2 + v16);
  return a1;
}

uint64_t sub_20D58B63C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B97F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549B9800) + 28);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = type metadata accessor for PreviewSession(0);
  *(_QWORD *)(a1 + *(int *)(v11 + 20)) = *(_QWORD *)(a2 + *(int *)(v11 + 20));
  swift_release();
  v12 = *(int *)(v11 + 24);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = sub_20D5A6660();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  swift_unknownObjectRelease();
  v16 = *(int *)(a3 + 24);
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20D58B750()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D58B75C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for PreviewSession(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_20D58B7D8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D58B7E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for PreviewSession(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_20D58B85C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for PreviewSession(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewSession.Failure(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for PreviewSession.Failure(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_20D58B96C + 4 * byte_20D5B29A0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_20D58B98C + 4 * byte_20D5B29A5[v4]))();
}

_BYTE *sub_20D58B96C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_20D58B98C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20D58B994(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20D58B99C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20D58B9A4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20D58B9AC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PreviewSession.Failure()
{
  return &type metadata for PreviewSession.Failure;
}

unint64_t sub_20D58B9CC()
{
  unint64_t result;

  result = qword_2549B9BE8;
  if (!qword_2549B9BE8)
  {
    result = MEMORY[0x212BA45A4](&unk_20D5B2CA0, &type metadata for PreviewSession.Failure);
    atomic_store(result, (unint64_t *)&qword_2549B9BE8);
  }
  return result;
}

unint64_t sub_20D58BA10()
{
  unint64_t result;

  result = qword_2549B9BF0;
  if (!qword_2549B9BF0)
  {
    result = MEMORY[0x212BA45A4](&protocol conformance descriptor for PreviewSession.Action, &type metadata for PreviewSession.Action);
    atomic_store(result, (unint64_t *)&qword_2549B9BF0);
  }
  return result;
}

unint64_t sub_20D58BA54()
{
  unint64_t result;

  result = qword_2549B9350;
  if (!qword_2549B9350)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549B9350);
  }
  return result;
}

uint64_t sub_20D58BA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20D5A6618();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_20D58BAD8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D58BAE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20D5A6618();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_20D58BB20()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D58BB2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_20D5A6618();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for QLWebLocationBarView()
{
  uint64_t result;

  result = qword_2549B9C98;
  if (!qword_2549B9C98)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20D58BBA8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20D5A6618();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_20D58BC10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D58BC20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t KeyPath;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;

  v2 = v1;
  v4 = type metadata accessor for QLWebLocationBarView();
  v80 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v81 = v5;
  v82 = (uint64_t)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20D5A6990();
  v78 = *(_QWORD *)(v6 - 8);
  v79 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v77 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20D5A6618();
  v66 = *(_QWORD *)(v8 - 8);
  v67 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v68 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9CD0);
  v70 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9CD8);
  MEMORY[0x24BDAC7A8](v65);
  v14 = (char *)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9CE0);
  MEMORY[0x24BDAC7A8](v69);
  v16 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9CE8);
  MEMORY[0x24BDAC7A8](v73);
  v18 = (char *)&v62 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9CF0);
  v75 = *(_QWORD *)(v19 - 8);
  v76 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v74 = (char *)&v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9CF8);
  MEMORY[0x24BDAC7A8](v71);
  v72 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_20D5A660C();
  if (v23)
  {
    v24 = v22;
    v25 = v23;
    if ((sub_20D5A6BA0() & 1) != 0)
    {
      v26 = sub_20D5A6B70();
      v27 = sub_20D58C650(v26, v24, v25);
      v28 = a1;
      v30 = v29;
      v64 = v2;
      v32 = v31;
      v63 = v10;
      v34 = v33;
      swift_bridgeObjectRelease();
      v35 = v30;
      a1 = v28;
      v36 = v32;
      v2 = v64;
      v24 = MEMORY[0x212BA33B0](v27, v35, v36, v34);
      v25 = v37;
      v10 = v63;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v24 = sub_20D5A65DC();
    v25 = v38;
  }
  v83 = v24;
  v84 = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v68, v2, v67);
  sub_20D58C200();
  sub_20D5A6984();
  v39 = v2;
  v40 = sub_20D5A69E4();
  KeyPath = swift_getKeyPath();
  v42 = v70;
  (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v14, v12, v10);
  v43 = (uint64_t *)&v14[*(int *)(v65 + 36)];
  *v43 = KeyPath;
  v43[1] = v40;
  (*(void (**)(char *, uint64_t))(v42 + 8))(v12, v10);
  v44 = sub_20D5A6978();
  v45 = swift_getKeyPath();
  sub_20D57C228((uint64_t)v14, (uint64_t)v16, &qword_2549B9CD8);
  v46 = (uint64_t *)&v16[*(int *)(v69 + 36)];
  *v46 = v45;
  v46[1] = v44;
  sub_20D57C26C((uint64_t)v14, &qword_2549B9CD8);
  v48 = v77;
  v47 = v78;
  v49 = v79;
  (*(void (**)(char *, _QWORD, uint64_t))(v78 + 104))(v77, *MEMORY[0x24BDF1CC8], v79);
  v50 = swift_getKeyPath();
  v51 = (uint64_t *)&v18[*(int *)(v73 + 36)];
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9D08);
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))((char *)v51 + *(int *)(v52 + 28), v48, v49);
  *v51 = v50;
  sub_20D57C228((uint64_t)v16, (uint64_t)v18, &qword_2549B9CE0);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v49);
  sub_20D57C26C((uint64_t)v16, &qword_2549B9CE0);
  v53 = v82;
  sub_20D57D74C(v39, v82);
  v54 = (*(unsigned __int8 *)(v80 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80);
  v55 = swift_allocObject();
  sub_20D58C3F4(v53, v55 + v54);
  sub_20D58C464();
  v56 = v74;
  sub_20D5A69CC();
  swift_release();
  sub_20D57C26C((uint64_t)v18, &qword_2549B9CE8);
  LOBYTE(v50) = sub_20D5A696C();
  v58 = v75;
  v57 = v76;
  v59 = (uint64_t)v72;
  (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v72, v56, v76);
  v60 = v59 + *(int *)(v71 + 36);
  *(_BYTE *)v60 = v50;
  *(_OWORD *)(v60 + 8) = 0u;
  *(_OWORD *)(v60 + 24) = 0u;
  *(_BYTE *)(v60 + 40) = 1;
  (*(void (**)(char *, uint64_t))(v58 + 8))(v56, v57);
  return sub_20D58C608(v59, a1);
}

id sub_20D58C1B0()
{
  void *v0;
  id v1;

  v0 = (void *)sub_20D5A65E8();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD15F0]), sel_initWithObject_, v0);

  return v1;
}

unint64_t sub_20D58C200()
{
  unint64_t result;

  result = qword_2549B9D00;
  if (!qword_2549B9D00)
  {
    result = MEMORY[0x212BA45A4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2549B9D00);
  }
  return result;
}

uint64_t sub_20D58C244@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_20D5A6858();
  *a1 = result;
  return result;
}

uint64_t sub_20D58C26C()
{
  swift_retain();
  return sub_20D5A6864();
}

uint64_t sub_20D58C294@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_20D5A6870();
  *a1 = result;
  return result;
}

uint64_t sub_20D58C2BC()
{
  swift_retain();
  return sub_20D5A687C();
}

uint64_t sub_20D58C2E4()
{
  return sub_20D5A6840();
}

uint64_t sub_20D58C304(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_20D5A6990();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_20D5A684C();
}

uint64_t sub_20D58C384()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for QLWebLocationBarView() - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  v3 = sub_20D5A6618();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return swift_deallocObject();
}

uint64_t sub_20D58C3F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for QLWebLocationBarView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_20D58C438()
{
  type metadata accessor for QLWebLocationBarView();
  return sub_20D58C1B0();
}

unint64_t sub_20D58C464()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549B9D10;
  if (!qword_2549B9D10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549B9CE8);
    v2[0] = sub_20D58C4E8();
    v2[1] = sub_20D57C440(&qword_2549B9D50, &qword_2549B9D08, MEMORY[0x24BDF1028]);
    result = MEMORY[0x212BA45A4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549B9D10);
  }
  return result;
}

unint64_t sub_20D58C4E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549B9D18;
  if (!qword_2549B9D18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549B9CE0);
    v2[0] = sub_20D58C56C();
    v2[1] = sub_20D57C440(&qword_2549B9D40, &qword_2549B9D48, MEMORY[0x24BDF1028]);
    result = MEMORY[0x212BA45A4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549B9D18);
  }
  return result;
}

unint64_t sub_20D58C56C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549B9D20;
  if (!qword_2549B9D20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549B9CD8);
    v2[0] = sub_20D57C440(&qword_2549B9D28, &qword_2549B9CD0, MEMORY[0x24BDF19E0]);
    v2[1] = sub_20D57C440(&qword_2549B9D30, &qword_2549B9D38, MEMORY[0x24BDF1028]);
    result = MEMORY[0x212BA45A4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549B9D20);
  }
  return result;
}

uint64_t sub_20D58C608(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9CF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_20D58C650(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_20D5A6B7C();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_20D5A6BAC();
  }
  __break(1u);
  return result;
}

unint64_t sub_20D58C6F0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_2549B9D58;
  if (!qword_2549B9D58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549B9CF8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549B9CE8);
    v2[3] = sub_20D58C464();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x212BA45A4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549B9D58);
  }
  return result;
}

uint64_t sub_20D58C784()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20D58CCD4();
  sub_20D5A6684();
  swift_release();
  v1 = *(_QWORD *)(v0 + 16);
  sub_20D57828C(v1);
  return v1;
}

uint64_t sub_20D58C804()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_20D5782B8(*(_QWORD *)(v0 + 16));
  v1 = v0 + OBJC_IVAR____TtC9QuickLook45QLHostAccessoryViewControllerWrapperViewModel___observationRegistrar;
  v2 = sub_20D5A66B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_20D58C85C()
{
  return type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel();
}

uint64_t type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel()
{
  uint64_t result;

  result = qword_2549B9D90;
  if (!qword_2549B9D90)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20D58C8A0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20D5A66B4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel.Session()
{
  return &type metadata for QLHostAccessoryViewControllerWrapperViewModel.Session;
}

uint64_t sub_20D58C928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[15] = a4;
  v5[16] = a5;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  v6 = sub_20D5A6774();
  v5[17] = v6;
  v5[18] = *(_QWORD *)(v6 - 8);
  v5[19] = swift_task_alloc();
  v7 = sub_20D5A6D68();
  v5[20] = v7;
  v5[21] = *(_QWORD *)(v7 - 8);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20D58C9C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0[23];
  v8 = v0[21];
  v2 = v0[19];
  v9 = v0[20];
  v10 = v0[22];
  v4 = v0[17];
  v3 = v0[18];
  v5 = v0[12];
  swift_retain();
  sub_20D5A6D5C();
  sub_20D5A6D50();
  v0[24] = sub_20D5A6D8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v10, v1, v9);
  v6 = (_QWORD *)swift_task_alloc();
  v0[25] = v6;
  *v6 = v0;
  v6[1] = sub_20D58CAC4;
  return sub_20D5A6D80();
}

uint64_t sub_20D58CAC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 208) = a1;
  *(_QWORD *)(v3 + 216) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D58CB30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 208);
  v1 = *(_QWORD *)(v0 + 192);
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = &off_24C728C00;
  type metadata accessor for QLAccessoryExtensionProxy();
  v2 = swift_allocObject();
  v3 = __swift_mutable_project_boxed_opaque_existential_1(v0 + 16, v1);
  v4 = *(_QWORD *)(v1 - 8);
  v5 = (_QWORD *)swift_task_alloc();
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v4 + 16))(v5, v3, v1);
  *(_QWORD *)(v0 + 56) = *v5;
  *(_QWORD *)(v0 + 80) = v1;
  *(_QWORD *)(v0 + 88) = &off_24C728C00;
  v6 = qword_2549B7F28;
  swift_retain_n();
  if (v6 != -1)
    swift_once();
  v7 = *(_QWORD *)(v0 + 184);
  v15 = *(_QWORD *)(v0 + 160);
  v8 = *(_QWORD *)(v0 + 144);
  v13 = *(_QWORD *)(v0 + 136);
  v14 = *(_QWORD *)(v0 + 168);
  v9 = *(_QWORD *)(v0 + 96);
  v10 = (void *)qword_2549BCF20;
  *(_QWORD *)(v2 + 16) = qword_2549BCF20;
  *(_QWORD *)(v2 + 64) = 0;
  sub_20D578728((__int128 *)(v0 + 56), v2 + 24);
  v11 = v10;
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  swift_release();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v9, v13);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v7, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(*(_QWORD *)(v0 + 208), v2);
}

unint64_t sub_20D58CCD4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549BA780;
  if (!qword_2549BA780)
  {
    v1 = type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel();
    result = MEMORY[0x212BA45A4](&unk_20D5B2E70, v1);
    atomic_store(result, (unint64_t *)&qword_2549BA780);
  }
  return result;
}

unint64_t sub_20D58CD1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  _QWORD v24[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9EC8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B94F0);
  v6 = sub_20D5A6EC4();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = (uint64_t)&v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_20D57C228(v12, (uint64_t)v5, &qword_2549B9EC8);
    result = sub_20D5883EC((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_20D5A6660();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    v19 = v7[7];
    v20 = type metadata accessor for PreviewApplication.PreviewSessionMap(0);
    result = sub_20D582C38(v9, v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v16);
    v21 = v7[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_11;
    v7[2] = v23;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_20D58CECC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9508);
  v2 = sub_20D5A6EC4();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_20D57C228(v6, (uint64_t)&v15, &qword_2549B9ED0);
    v7 = v15;
    v8 = v16;
    result = sub_20D588458(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_20D578C6C(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_20D58D000(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9EC0);
  v2 = (_QWORD *)sub_20D5A6EC4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = sub_20D5884BC(v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_20D58D108(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9EA8);
  v2 = sub_20D5A6EC4();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_20D57C228(v6, (uint64_t)&v13, &qword_2549B9EB0);
    v7 = v13;
    result = sub_20D5884BC(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_20D578C6C(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_20D58D254()
{
  uint64_t v0;

  return (*(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 16) != 255) & *(_BYTE *)(v0 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 16);
}

void *sub_20D58D2D8()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;

  v1 = v0 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
  v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 16);
  if (v2 == 255)
    return 0;
  v3 = *(void **)v1;
  v4 = *(_QWORD *)(v1 + 8);
  v5 = *(void **)v1;
  if ((v2 & 1) != 0)
  {
    sub_20D58D3B4(v5, v4, 1);
    sub_20D58D3B4(v3, v4, 1);
    v6 = objc_msgSend(v3, sel_string);
    v7 = sub_20D5A6AF8();

    sub_20D58D3C4(v3, v4, v2);
    sub_20D58D3C4(v3, v4, v2);
    return (void *)v7;
  }
  else
  {
    sub_20D58D3B4(v5, v4, 0);
  }
  return v3;
}

id sub_20D58D3B4(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return a1;
  else
    return (id)swift_bridgeObjectRetain();
}

void sub_20D58D3C4(void *a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255)
    sub_20D58D3DC(a1, a2, a3 & 1);
}

void sub_20D58D3DC(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

id sub_20D58D41C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v1 = v0 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
  v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 16);
  if (v2 == 255)
    return 0;
  v3 = *(void **)v1;
  v4 = *(_QWORD *)(v1 + 8);
  if ((v2 & 1) != 0)
  {
    sub_20D58D3B4(*(void **)v1, *(_QWORD *)(v1 + 8), 1);
  }
  else
  {
    v5 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    sub_20D58D3B4(v3, v4, 0);
    v6 = (void *)sub_20D5A6AD4();
    v7 = objc_msgSend(v5, sel_initWithString_, v6);

    sub_20D58D3C4(v3, v4, v2);
    return v7;
  }
  return v3;
}

void sub_20D58D4E4(void *a1)
{
  char *v1;
  char *v2;
  int v3;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unsigned __int8 v13;
  id v14;

  v2 = &v1[OBJC_IVAR____TtC9QuickLook14QLTextDocument_content];
  v3 = v1[OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 16];
  if (v3 != 255)
  {
    v5 = *(void **)v2;
    v6 = *((_QWORD *)v2 + 1);
    if ((v3 & 1) != 0)
    {
      *(_QWORD *)v2 = a1;
      *((_QWORD *)v2 + 1) = v6 & 1;
      v2[16] = 1;
      sub_20D58D5F4(v5, v6, v3);
      v14 = a1;
      v11 = v5;
      v12 = v6;
      v13 = v3;
    }
    else
    {
      sub_20D58D3B4(*(void **)v2, *((_QWORD *)v2 + 1), 0);
      v7 = objc_msgSend(a1, sel_string);
      v8 = sub_20D5A6AF8();
      v10 = v9;

      v11 = *(void **)v2;
      v12 = *((_QWORD *)v2 + 1);
      *(_QWORD *)v2 = v8;
      *((_QWORD *)v2 + 1) = v10;
      v13 = v2[16];
      v2[16] = 0;
    }
    sub_20D58D3C4(v11, v12, v13);
    objc_msgSend(v1, sel_updateChangeCount_, 0);
    sub_20D58D3C4(v5, v6, v3);
  }
}

id sub_20D58D5F4(id result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return sub_20D58D3B4(result, a2, a3 & 1);
  return result;
}

void sub_20D58D660(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  unint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t inited;
  void *v29;
  void *v30;
  id v31;
  id v32;
  unint64_t v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  _QWORD v40[2];
  id v41[14];

  v41[13] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = sub_20D5A6B40();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v1 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
  v9 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 16);
  if (v9 == 255)
  {
    *(_QWORD *)(a1 + 24) = MEMORY[0x24BDCDDE8];
    *(_OWORD *)a1 = xmmword_20D5B2ED0;
    return;
  }
  v11 = *(void **)v8;
  v10 = *(_QWORD *)(v8 + 8);
  if ((v9 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9E70);
    if ((v10 & 1) != 0)
    {
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_20D5B2EC0;
      v29 = (void *)*MEMORY[0x24BEBB348];
      v30 = (void *)*MEMORY[0x24BEBB3B8];
      *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB348];
      *(_QWORD *)(inited + 40) = v30;
      sub_20D58D3B4(v11, v10, 1);
      sub_20D58D5F4(v11, v10, v9);
      v31 = v29;
      v32 = v30;
      v33 = sub_20D58D000(inited);
      v34 = objc_msgSend(v11, sel_length);
      sub_20D58DAE0(v33);
      swift_bridgeObjectRelease();
      type metadata accessor for DocumentAttributeKey(0);
      sub_20D570178(&qword_2549B81B8, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAttributeKey, (uint64_t)&unk_20D5B1D38);
      v35 = (void *)sub_20D5A6A98();
      swift_bridgeObjectRelease();
      v41[0] = 0;
      v36 = objc_msgSend(v11, sel_fileWrapperFromRange_documentAttributes_error_, 0, v34, v35, v41);

      v37 = v41[0];
      if (v36)
      {
        *(_QWORD *)(a1 + 24) = sub_20D58DE80();
        v38 = v37;
        sub_20D58D3C4(v11, v10, v9);
        sub_20D58D3C4(v11, v10, v9);
        *(_QWORD *)a1 = v36;
        return;
      }
      v24 = v41[0];
    }
    else
    {
      v15 = swift_initStackObject();
      *(_OWORD *)(v15 + 16) = xmmword_20D5B2EC0;
      v16 = (void *)*MEMORY[0x24BEBB348];
      v17 = (void *)*MEMORY[0x24BEBB3C0];
      *(_QWORD *)(v15 + 32) = *MEMORY[0x24BEBB348];
      *(_QWORD *)(v15 + 40) = v17;
      sub_20D58D3B4(v11, v10, 1);
      sub_20D58D5F4(v11, v10, v9);
      v18 = v16;
      v19 = v17;
      v20 = sub_20D58D000(v15);
      v21 = objc_msgSend(v11, sel_length);
      sub_20D58DAE0(v20);
      swift_bridgeObjectRelease();
      type metadata accessor for DocumentAttributeKey(0);
      sub_20D570178(&qword_2549B81B8, (uint64_t (*)(uint64_t))type metadata accessor for DocumentAttributeKey, (uint64_t)&unk_20D5B1D38);
      v22 = (void *)sub_20D5A6A98();
      swift_bridgeObjectRelease();
      v41[0] = 0;
      v23 = objc_msgSend(v11, sel_dataFromRange_documentAttributes_error_, 0, v21, v22, v41);

      v24 = v41[0];
      if (v23)
      {
        v25 = sub_20D5A6630();
        v27 = v26;

        *(_QWORD *)(a1 + 24) = MEMORY[0x24BDCDDE8];
        sub_20D58D3C4(v11, v10, v9);
        sub_20D58D3C4(v11, v10, v9);
        *(_QWORD *)a1 = v25;
        *(_QWORD *)(a1 + 8) = v27;
        return;
      }
    }
    v39 = v24;
    sub_20D5A65D0();

    swift_willThrow();
    sub_20D58D3C4(v11, v10, v9);
    sub_20D58D3C4(v11, v10, v9);
  }
  else
  {
    v40[1] = v2;
    swift_bridgeObjectRetain();
    sub_20D5A6B1C();
    v12 = sub_20D5A6B04();
    v14 = v13;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_QWORD *)(a1 + 24) = MEMORY[0x24BDCDDE8];
    sub_20D58D3C4(v11, v10, v9);
    if (v14 >> 60 == 15)
    {
      *(_OWORD *)a1 = xmmword_20D5B2ED0;
    }
    else
    {
      *(_QWORD *)a1 = v12;
      *(_QWORD *)(a1 + 8) = v14;
    }
  }
}

uint64_t sub_20D58DAE0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  int64_t v30;
  _OWORD v31[4];
  _OWORD v32[2];
  _OWORD v33[3];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9EB8);
    v2 = sub_20D5A6EC4();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v29 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v28 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v30 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v30 << 6);
      goto LABEL_28;
    }
    v11 = v30 + 1;
    if (__OFADD__(v30, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v11 >= v28)
      goto LABEL_37;
    v12 = *(_QWORD *)(v29 + 8 * v11);
    v13 = v30 + 1;
    if (!v12)
    {
      v13 = v30 + 2;
      if (v30 + 2 >= v28)
        goto LABEL_37;
      v12 = *(_QWORD *)(v29 + 8 * v13);
      if (!v12)
      {
        v13 = v30 + 3;
        if (v30 + 3 >= v28)
          goto LABEL_37;
        v12 = *(_QWORD *)(v29 + 8 * v13);
        if (!v12)
        {
          v13 = v30 + 4;
          if (v30 + 4 >= v28)
            goto LABEL_37;
          v12 = *(_QWORD *)(v29 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v30 = v13;
LABEL_28:
    v16 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v10);
    *(_QWORD *)&v33[0] = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v10);
    v15 = *(void **)&v33[0];
    *(_QWORD *)&v32[0] = v16;
    type metadata accessor for DocumentType(0);
    v17 = v15;
    v18 = v16;
    swift_dynamicCast();
    v19 = *(_QWORD *)&v33[0];
    sub_20D578C6C((_OWORD *)((char *)v33 + 8), v31);
    sub_20D578C6C(v31, v33);
    sub_20D578C6C(v33, v32);
    sub_20D5A6AF8();
    sub_20D5A6F60();
    sub_20D5A6B64();
    v20 = sub_20D5A6F78();
    result = swift_bridgeObjectRelease();
    v21 = -1 << *(_BYTE *)(v2 + 32);
    v22 = v20 & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v6 + 8 * (v22 >> 6))) != 0)
    {
      v8 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v6 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v6 + 8 * v23);
      }
      while (v27 == -1);
      v8 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v6 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v19;
    result = (uint64_t)sub_20D578C6C(v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v8));
    ++*(_QWORD *)(v2 + 16);
  }
  v14 = v30 + 5;
  if (v30 + 5 >= v28)
  {
LABEL_37:
    swift_release();
    sub_20D57AB48();
    return v2;
  }
  v12 = *(_QWORD *)(v29 + 8 * v14);
  if (v12)
  {
    v13 = v30 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v28)
      goto LABEL_37;
    v12 = *(_QWORD *)(v29 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_20D58DE80()
{
  unint64_t result;

  result = qword_2549B9E78;
  if (!qword_2549B9E78)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549B9E78);
  }
  return result;
}

void sub_20D58DF80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unsigned __int8 v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  unsigned __int8 v41;
  unint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  unint64_t v49;
  _BYTE v50[32];
  uint64_t v51;

  v51 = a2;
  v7 = sub_20D5A6B40();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_20D5A67B0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D570648(a1, (uint64_t)v50);
  if (swift_dynamicCast())
  {
    v47 = v3;
    v13 = (uint64_t)v48;
    v12 = v49;
    if (a3)
    {
      v46 = v4;
      sub_20D5A67A4();
      v14 = a3;
      v15 = sub_20D5A678C();
      v17 = v16;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      if (v15 == v51 && v17 == v14)
      {
        swift_bridgeObjectRelease();
        v20 = v46;
      }
      else
      {
        v19 = sub_20D5A6F0C();
        swift_bridgeObjectRelease();
        v20 = v46;
        if ((v19 & 1) == 0)
          goto LABEL_8;
      }
      sub_20D58E2D0(v13, v12);
      v42 = sub_20D58D108(MEMORY[0x24BEE4AF8]);
      v43 = objc_allocWithZone(MEMORY[0x24BDD1458]);
      v44 = sub_20D58E62C(v13, v12, v42, 0);
      sub_20D57CE10(v13, v12);
      if (v20)
      {
LABEL_24:
        sub_20D57CE10(v13, v12);
        return;
      }
      v45 = v47 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
      v26 = *(void **)(v47 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content);
      v27 = *(_QWORD *)(v47 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 8);
      *(_QWORD *)v45 = v44;
      *(_QWORD *)(v45 + 8) = 0;
      v28 = *(_BYTE *)(v45 + 16);
      *(_BYTE *)(v45 + 16) = 1;
LABEL_23:
      sub_20D58D3C4(v26, v27, v28);
      goto LABEL_24;
    }
LABEL_8:
    sub_20D5A6B1C();
    v21 = sub_20D5A6B10();
    if (v22)
      v23 = v21;
    else
      v23 = 0;
    v24 = 0xE000000000000000;
    if (v22)
      v24 = v22;
    v25 = v47 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
    v26 = *(void **)(v47 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content);
    v27 = *(_QWORD *)(v47 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 8);
    *(_QWORD *)v25 = v23;
    *(_QWORD *)(v25 + 8) = v24;
    v28 = *(_BYTE *)(v25 + 16);
    *(_BYTE *)(v25 + 16) = 0;
    goto LABEL_23;
  }
  sub_20D570648(a1, (uint64_t)v50);
  sub_20D58DE80();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v29 = v48;
    v30 = objc_msgSend(v48, sel_serializedRepresentation);
    if (v30)
    {
      v31 = v30;
      v32 = sub_20D5A6630();
      v34 = v33;

      sub_20D58E2D0(v32, v34);
      v35 = sub_20D58D108(MEMORY[0x24BEE4AF8]);
      v36 = objc_allocWithZone(MEMORY[0x24BDD1458]);
      v37 = sub_20D58E62C(v32, v34, v35, 0);
      sub_20D57CE10(v32, v34);
      if (!v4)
      {
        v38 = v3 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content;
        v39 = *(void **)(v3 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content);
        v40 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9QuickLook14QLTextDocument_content + 8);
        *(_QWORD *)v38 = v37;
        *(_QWORD *)(v38 + 8) = 1;
        v41 = *(_BYTE *)(v38 + 16);
        *(_BYTE *)(v38 + 16) = 1;
        sub_20D58D3C4(v39, v40, v41);
      }
      sub_20D57CE10(v32, v34);
    }

  }
}

uint64_t sub_20D58E2D0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

id QLTextDocument.__allocating_init(fileURL:)(uint64_t a1)
{
  objc_class *v1;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = objc_allocWithZone(v1);
  v4 = (void *)sub_20D5A65E8();
  v5 = objc_msgSend(v3, sel_initWithFileURL_, v4);

  v6 = sub_20D5A6618();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  return v5;
}

id QLTextDocument.init(fileURL:)(uint64_t a1)
{
  char *v1;
  char *v2;
  char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  objc_super v9;

  v2 = v1;
  v4 = &v2[OBJC_IVAR____TtC9QuickLook14QLTextDocument_content];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = -1;
  v5 = (void *)sub_20D5A65E8();
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for QLTextDocument();
  v6 = objc_msgSendSuper2(&v9, sel_initWithFileURL_, v5);

  v7 = sub_20D5A6618();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
  return v6;
}

id QLTextDocument.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLTextDocument();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_20D58E62C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = (void *)sub_20D5A6624();
  type metadata accessor for DocumentReadingOptionKey(0);
  sub_20D570178(&qword_2549B8200, (uint64_t (*)(uint64_t))type metadata accessor for DocumentReadingOptionKey, (uint64_t)&unk_20D5B1EEC);
  v7 = (void *)sub_20D5A6A98();
  swift_bridgeObjectRelease();
  v12[0] = 0;
  v8 = objc_msgSend(v4, sel_initWithData_options_documentAttributes_error_, v6, v7, a4, v12);

  if (v8)
  {
    v9 = v12[0];
  }
  else
  {
    v10 = v12[0];
    sub_20D5A65D0();

    swift_willThrow();
  }
  return v8;
}

uint64_t type metadata accessor for QLTextDocument()
{
  return objc_opt_self();
}

uint64_t method lookup function for QLTextDocument()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QLTextDocument.hasRichContent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of QLTextDocument.textContent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of QLTextDocument.attributedTextContent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of QLTextDocument.save(textContent:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

void destroy for QLTextDocument.Content(uint64_t a1)
{
  sub_20D58D3DC(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s9QuickLook14QLTextDocumentC7ContentOwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  char v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_20D58D3B4(*(void **)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for QLTextDocument.Content(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_20D58D3B4(*(void **)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_20D58D3DC(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for QLTextDocument.Content(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_20D58D3DC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for QLTextDocument.Content(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for QLTextDocument.Content(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_20D58E970(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_20D58E978(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for QLTextDocument.Content()
{
  return &type metadata for QLTextDocument.Content;
}

uint64_t storeEnumTagSinglePayload for QLTextDocument.RichTextType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_20D58E9E0 + 4 * byte_20D5B2EE5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20D58EA14 + 4 * byte_20D5B2EE0[v4]))();
}

uint64_t sub_20D58EA14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D58EA1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20D58EA24);
  return result;
}

uint64_t sub_20D58EA30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20D58EA38);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20D58EA3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D58EA44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for QLTextDocument.RichTextType()
{
  return &type metadata for QLTextDocument.RichTextType;
}

unint64_t sub_20D58EA64()
{
  unint64_t result;

  result = qword_2549B9ED8;
  if (!qword_2549B9ED8)
  {
    result = MEMORY[0x212BA45A4](&unk_20D5B2F70, &type metadata for QLTextDocument.RichTextType);
    atomic_store(result, (unint64_t *)&qword_2549B9ED8);
  }
  return result;
}

void sub_20D58EAA8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  objc_opt_self();
  v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    v6 = (void *)v5;
    swift_getKeyPath();
    sub_20D578748();
    v7 = a1;
    sub_20D5A6684();
    swift_release();
    v8 = *(_QWORD *)(a3 + 16);
    if (v8)
    {
      sub_20D57828C(v8);
      swift_retain();
      sub_20D5A6D98();
      type metadata accessor for QLHostPlaceholderUIView();
      v9 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
      objc_msgSend(v6, sel_setPlaceholderView_, v9);
      swift_release();
      swift_release();

    }
    else
    {
      sub_20D5A6D98();
    }

  }
  else
  {
    sub_20D5A6E94();
    __break(1u);
  }
}

id sub_20D58EC34()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLHostPrimaryViewControllerWrapper.HostCoordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20D58ECA0()
{
  return type metadata accessor for QLHostPrimaryViewControllerWrapper.HostCoordinator();
}

uint64_t type metadata accessor for QLHostPrimaryViewControllerWrapper.HostCoordinator()
{
  uint64_t result;

  result = qword_2549B9F10;
  if (!qword_2549B9F10)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20D58ECE4()
{
  unint64_t v0;

  sub_20D58ED60();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_20D58ED60()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549B9F20)
  {
    sub_20D5A6780();
    v0 = sub_20D5A6DA4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2549B9F20);
  }
}

ValueMetadata *type metadata accessor for QLHostPrimaryViewControllerWrapper()
{
  return &type metadata for QLHostPrimaryViewControllerWrapper;
}

void sub_20D58EDC8(void *a1, uint64_t a2)
{
  uint64_t *v2;

  sub_20D58EAA8(a1, a2, *v2);
}

id sub_20D58EDD0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  id result;
  objc_super v9;

  v3 = *v1;
  v4 = (objc_class *)type metadata accessor for QLHostPrimaryViewControllerWrapper.HostCoordinator();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = &v5[OBJC_IVAR____TtCV9QuickLook34QLHostPrimaryViewControllerWrapper15HostCoordinator_identity];
  v7 = sub_20D5A6780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_QWORD *)&v5[OBJC_IVAR____TtCV9QuickLook34QLHostPrimaryViewControllerWrapper15HostCoordinator_parent] = v3;
  v9.receiver = v5;
  v9.super_class = v4;
  swift_retain();
  result = objc_msgSendSuper2(&v9, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_20D58EE7C()
{
  sub_20D58F1F8();
  return sub_20D5A693C();
}

uint64_t sub_20D58EECC()
{
  sub_20D58F1F8();
  return sub_20D5A690C();
}

void sub_20D58EF1C()
{
  sub_20D58F1F8();
  sub_20D5A6930();
  __break(1u);
}

unint64_t sub_20D58EF44()
{
  unint64_t result;

  result = qword_2549B9F28;
  if (!qword_2549B9F28)
  {
    result = MEMORY[0x212BA45A4](&unk_20D5B2FE4, &type metadata for QLHostPrimaryViewControllerWrapper);
    atomic_store(result, (unint64_t *)&qword_2549B9F28);
  }
  return result;
}

id sub_20D58EF90(uint64_t a1)
{
  id v2;
  id result;
  void *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7BB0]), sel_init);
  result = objc_msgSend(v2, sel_view);
  if (!result)
    goto LABEL_15;
  v4 = result;
  v5 = objc_msgSend(result, sel_subviews);

  sub_20D58F1BC();
  v6 = sub_20D5A6BE8();

  v15 = a1;
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_20D5A6EA0();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (!v7)
    goto LABEL_11;
  result = (id)objc_opt_self();
  if (v7 < 1)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v8 = result;
  v9 = 0;
  do
  {
    if ((v6 & 0xC000000000000001) != 0)
      v10 = (id)MEMORY[0x212BA368C](v9, v6);
    else
      v10 = *(id *)(v6 + 8 * v9 + 32);
    v11 = v10;
    ++v9;
    v12 = objc_msgSend(v8, sel_clearColor, v15);
    objc_msgSend(v11, sel_setBackgroundColor_, v12);

  }
  while (v7 != v9);
LABEL_11:
  swift_bridgeObjectRelease_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9F40);
  sub_20D5A6954();
  objc_msgSend(v2, sel_setDelegate_, v16);

  result = objc_msgSend(v2, sel_view);
  if (result)
  {
    v13 = result;
    v14 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v13, sel_setBackgroundColor_, v14);

    return v2;
  }
LABEL_16:
  __break(1u);
  return result;
}

unint64_t sub_20D58F1BC()
{
  unint64_t result;

  result = qword_2549B9F38;
  if (!qword_2549B9F38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549B9F38);
  }
  return result;
}

unint64_t sub_20D58F1F8()
{
  unint64_t result;

  result = qword_2549B9F48;
  if (!qword_2549B9F48)
  {
    result = MEMORY[0x212BA45A4](&unk_20D5B3034, &type metadata for QLHostPrimaryViewControllerWrapper);
    atomic_store(result, (unint64_t *)&qword_2549B9F48);
  }
  return result;
}

uint64_t sub_20D58F23C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2549B9F50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20D58F27C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t QLAccessoryAppExtensionScene.init(content:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = 0x726F737365636361;
  a3[1] = 0xE900000000000079;
  a3[2] = result;
  a3[3] = a2;
  return result;
}

uint64_t QLAccessoryAppExtensionScene.body.getter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *v1;
  v4 = v1[3];
  type metadata accessor for QLAccessoryAppExtensionSceneProxy(0);
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_20D5A66A8();
  v6 = swift_allocObject();
  v8 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(v6 + 16) = v8;
  *(_QWORD *)(v6 + 24) = v7;
  *(_QWORD *)(v6 + 32) = v3;
  *(_OWORD *)(v6 + 40) = *(_OWORD *)(v1 + 1);
  *(_QWORD *)(v6 + 56) = v4;
  *(_QWORD *)(v6 + 64) = v5;
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_retain();
  return sub_20D5A66C0();
}

uint64_t sub_20D58F3A8@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, char *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void (*v12)(uint64_t);
  void (*v13)(char *, char *, uint64_t);
  void (*v14)(char *, uint64_t);
  uint64_t v16;

  v5 = *(_QWORD *)(a2 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v16 - v10;
  v12(v9);
  v13 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
  v13(v11, v8, a2);
  v14 = *(void (**)(char *, uint64_t))(v5 + 8);
  v14(v8, a2);
  v13(a3, v11, a2);
  return ((uint64_t (*)(char *, uint64_t))v14)(v11, a2);
}

uint64_t sub_20D58F474()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D58F4A8@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_20D58F3A8(*(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_20D58F4BC(id a1, uint64_t a2)
{
  if (qword_2549B7F28 != -1)
    swift_once();
  objc_msgSend(a1, sel_setExportedInterface_, qword_2549BCF20);
  objc_msgSend(a1, sel_setExportedObject_, a2);
  objc_msgSend(a1, sel_resume);
  return 1;
}

uint64_t sub_20D58F544(void *a1)
{
  uint64_t v1;

  return sub_20D58F4BC(a1, v1);
}

uint64_t sub_20D58F54C(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x212BA45A4](&protocol conformance descriptor for QLAccessoryAppExtensionScene<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_20D58F578()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t type metadata accessor for QLAccessoryAppExtensionScene(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for QLAccessoryAppExtensionScene);
}

uint64_t sub_20D58F5C0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA780, (uint64_t (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2E70);
  sub_20D5A6684();
  swift_release();
  v4 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  *a2 = v4;
  a2[1] = v5;
  return sub_20D57828C(v4);
}

uint64_t sub_20D58F650(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  swift_getKeyPath();
  sub_20D57828C(v1);
  sub_20D570178((unint64_t *)&qword_2549BA780, (uint64_t (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2E70);
  sub_20D5A6678();
  sub_20D5782B8(v1);
  return swift_release();
}

uint64_t sub_20D58F718()
{
  uint64_t v0;

  v0 = sub_20D5A67E0();
  __swift_allocate_value_buffer(v0, qword_2549B9FE0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2549B9FE0);
  return sub_20D5A67D4();
}

uint64_t sub_20D58F794()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_20D58F818(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

uint64_t sub_20D58F820()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t sub_20D58F8A4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 17) = a2;
  return result;
}

void *sub_20D58F8AC()
{
  uint64_t v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  v1 = *(void **)(v0 + 24);
  v2 = v1;
  return v1;
}

id sub_20D58F93C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  v4 = *(void **)(v3 + 24);
  *a2 = v4;
  return v4;
}

uint64_t sub_20D58F9CC(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  v2 = v1;
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6678();

  return swift_release();
}

uint64_t sub_20D58FA80()
{
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  return swift_unknownObjectRetain();
}

uint64_t sub_20D58FB08(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 32) = a2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t sub_20D58FB40()
{
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  return swift_retain();
}

uint64_t sub_20D58FBC8(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 40) = a2;
  swift_retain();
  return swift_release();
}

uint64_t sub_20D58FC00()
{
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  return swift_retain();
}

uint64_t sub_20D58FC88@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 48);
  return swift_retain();
}

uint64_t sub_20D58FD18()
{
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  swift_retain();
  sub_20D5A6678();
  swift_release();
  return swift_release();
}

uint64_t sub_20D58FDD0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  v3 = v1 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel__process;
  swift_beginAccess();
  return sub_20D592918(v3, a1);
}

uint64_t sub_20D58FE80@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel__process;
  swift_beginAccess();
  return sub_20D592918(v4, a2);
}

uint64_t sub_20D58FF30(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9348);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20D592918(a1, (uint64_t)v6);
  v7 = *a2;
  swift_getKeyPath();
  v10 = v7;
  v11 = v6;
  v12 = v7;
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6678();
  swift_release();
  return sub_20D57C26C((uint64_t)v6, &qword_2549B9348);
}

uint64_t sub_20D590034(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a1 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel__process;
  swift_beginAccess();
  sub_20D5928D0(a2, v3);
  return swift_endAccess();
}

uint64_t sub_20D59009C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_WORD *)(v0 + 16) = 256;
  type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel();
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0;
  sub_20D5A66A8();
  *(_QWORD *)(v0 + 40) = v1;
  type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 24) = 0;
  sub_20D5A66A8();
  *(_QWORD *)(v0 + 48) = v2;
  v3 = v0 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel__process;
  v4 = sub_20D5A6774();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  sub_20D5A66FC();
  sub_20D5A66A8();
  return v0;
}

uint64_t sub_20D59018C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2[7] = a1;
  v2[8] = v1;
  v3 = sub_20D5A672C();
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v4 = sub_20D5A6750();
  v2[12] = v4;
  v2[13] = *(_QWORD *)(v4 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_2549B9F50);
  v2[16] = swift_task_alloc();
  v5 = sub_20D5A6780();
  v2[17] = v5;
  v2[18] = *(_QWORD *)(v5 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  v6 = sub_20D5A6708();
  v2[21] = v6;
  v2[22] = *(_QWORD *)(v6 - 8);
  v2[23] = swift_task_alloc();
  v7 = sub_20D5A6714();
  v2[24] = v7;
  v2[25] = *(_QWORD *)(v7 - 8);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20D5902E0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[26];
  v1 = v0[27];
  v3 = v0[24];
  v4 = v0[25];
  v0[28] = OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel_quickLookUIExtensionPointQuery;
  sub_20D5A6720();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  sub_20D570178((unint64_t *)&unk_2549BA2E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7820], MEMORY[0x24BDC7830]);
  sub_20D5A6CC0();
  sub_20D570178(&qword_2549B9370, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7808], MEMORY[0x24BDC7810]);
  v5 = (_QWORD *)swift_task_alloc();
  v0[29] = v5;
  *v5 = v0;
  v5[1] = sub_20D5903E4;
  return sub_20D5A6C3C();
}

uint64_t sub_20D5903E4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 240) = v0;
  swift_task_dealloc();
  if (v0)
    (*(void (**)(_QWORD, _QWORD))(v2[22] + 8))(v2[23], v2[21]);
  return swift_task_switch();
}

uint64_t sub_20D590458()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void (*v21)(_QWORD *, _QWORD);
  _QWORD *v22;
  _QWORD *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;

  v1 = v0[6];
  v3 = v0[22];
  v2 = v0[23];
  v4 = v0[21];
  if (!v1)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
LABEL_8:
    v10 = v0[10];
    v9 = v0[11];
    v11 = v0[9];
    v12 = v0[8] + v0[28];
    sub_20D5A6E1C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v12, v11);
    sub_20D5A6B4C();
    sub_20D5A6B88();
    swift_bridgeObjectRelease();
    sub_20D5A6B88();
    return sub_20D5A6E94();
  }
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  if (*(_QWORD *)(v1 + 16))
  {
    (*(void (**)(_QWORD, unint64_t, _QWORD))(v0[18] + 16))(v0[16], v1 + ((*(unsigned __int8 *)(v0[18] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0[18] + 80)), v0[17]);
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  v6 = v0[17];
  v7 = v0[18];
  v8 = v0[16];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v8, v5, 1, v6);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v8, 1, v6) == 1)
  {
    sub_20D57C26C(v0[16], qword_2549B9F50);
    goto LABEL_8;
  }
  v15 = v0[19];
  v14 = v0[20];
  v16 = v0[17];
  v17 = v0[18];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v17 + 32))(v14, v0[16], v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, v14, v16);
  swift_allocObject();
  swift_weakInit();
  sub_20D5A6738();
  v18 = (void *)sub_20D5A6AD4();
  v19 = (void *)sub_20D5A6AD4();
  v20 = objc_msgSend((id)objc_opt_self(), sel_attributeWithDomain_name_, v18, v19);

  v21 = (void (*)(_QWORD *, _QWORD))sub_20D5A6744();
  v23 = v22;
  v24 = v20;
  MEMORY[0x212BA3428]();
  if (*(_QWORD *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_20D5A6C00();
  v26 = v0[14];
  v25 = v0[15];
  v27 = v0[12];
  v28 = v0[13];
  sub_20D5A6C0C();
  sub_20D5A6BF4();

  v21(v0 + 2, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v26, v25, v27);
  v29 = (_QWORD *)swift_task_alloc();
  v0[31] = v29;
  *v29 = v0;
  v29[1] = sub_20D590888;
  return sub_20D5A675C();
}

uint64_t sub_20D5907C4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D590888()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 256) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D5908EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 160);
  v6 = *(_QWORD *)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 144);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 96));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5909D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 96));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 192));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D590AC4()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD aBlock[6];

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = swift_allocObject();
    swift_weakInit();
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = v1;
    *(_QWORD *)(v2 + 24) = 0;
    aBlock[4] = sub_20D592994;
    aBlock[5] = v2;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20D57683C;
    aBlock[3] = &block_descriptor_5;
    v3 = _Block_copy(aBlock);
    swift_release();
    QLRunInMainThread();
    _Block_release(v3);
    return swift_release();
  }
  return result;
}

uint64_t sub_20D590BAC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1[7] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9348);
  v1[8] = swift_task_alloc();
  v2 = sub_20D5A6774();
  v1[9] = v2;
  v1[10] = *(_QWORD *)(v2 - 8);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  v3 = swift_task_alloc();
  v1[13] = v3;
  v1[14] = sub_20D5A6C54();
  v1[15] = sub_20D5A6C48();
  v4 = (_QWORD *)swift_task_alloc();
  v1[16] = v4;
  *v4 = v1;
  v4[1] = sub_20D590C90;
  return sub_20D59018C(v3);
}

uint64_t sub_20D590C90()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  *(_QWORD *)(*v1 + 136) = v0;
  swift_task_dealloc();
  v3 = sub_20D5A6C18();
  if (!v0)
  {
    *(_QWORD *)(v2 + 144) = v3;
    *(_QWORD *)(v2 + 152) = v4;
  }
  return swift_task_switch();
}

uint64_t sub_20D590D18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D590DA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v10 = v0[13];
  v11 = v0[12];
  v2 = v0[9];
  v1 = v0[10];
  v3 = v0[7];
  v4 = v0[8];
  v5 = *(void (**)(uint64_t))(v1 + 16);
  v0[20] = v5;
  v5(v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v1 + 56))(v4, 0, 1, v2);
  swift_getKeyPath();
  v6 = swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v3;
  *(_QWORD *)(v6 + 24) = v4;
  v0[21] = OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel___observationRegistrar;
  v0[2] = v3;
  v0[22] = sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6678();
  swift_release();
  swift_task_dealloc();
  sub_20D57C26C(v4, &qword_2549B9348);
  ((void (*)(uint64_t, uint64_t, uint64_t))v5)(v11, v10, v2);
  v7 = swift_allocObject();
  v0[23] = v7;
  swift_weakInit();
  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2549B8928 + dword_2549B8928);
  swift_retain();
  v8 = (_QWORD *)swift_task_alloc();
  v0[24] = v8;
  *v8 = v0;
  v8[1] = sub_20D590F60;
  return v12(v0[12], 0x7972616D697270, 0xE700000000000000, (uint64_t)sub_20D592880, v7);
}

uint64_t sub_20D590F60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v4 = (_QWORD *)*v3;
  v4[25] = a1;
  v4[26] = a2;
  v4[27] = v2;
  swift_task_dealloc();
  swift_release();
  if (!v2)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_20D590FEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(v0 + 224);
  v1 = *(_QWORD *)(v0 + 232);
  v9 = *(_QWORD *)(v0 + 104);
  v7 = *(_QWORD *)(v0 + 80);
  v8 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  swift_release();
  swift_getKeyPath();
  *(_QWORD *)(v0 + 40) = v3;
  sub_20D5A6684();
  swift_release();
  v4 = *(_QWORD *)(v3 + 48);
  swift_getKeyPath();
  v5 = (_QWORD *)swift_task_alloc();
  v5[2] = v4;
  v5[3] = v1;
  v5[4] = v2;
  *(_QWORD *)(v0 + 48) = v4;
  sub_20D570178((unint64_t *)&qword_2549BA780, (uint64_t (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2E70);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_20D5A6678();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release_n();
  swift_release_n();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v9, v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5911BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D591260()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = v0[26];
  v2 = v0[25];
  v11 = v0[13];
  v12 = (void (*)(uint64_t, uint64_t, uint64_t))v0[20];
  v9 = v0[11];
  v10 = v0[9];
  v3 = v0[7];
  swift_getKeyPath();
  v0[3] = v3;
  sub_20D5A6684();
  swift_release();
  v4 = *(_QWORD *)(v3 + 40);
  swift_getKeyPath();
  v5 = (_QWORD *)swift_task_alloc();
  v5[2] = v4;
  v5[3] = v2;
  v5[4] = v1;
  v0[4] = v4;
  sub_20D570178((unint64_t *)&qword_2549B9F30, (uint64_t (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2150);
  swift_retain();
  swift_retain();
  swift_retain();
  sub_20D5A6678();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  v12(v9, v11, v10);
  v6 = swift_allocObject();
  v0[30] = v6;
  swift_weakInit();
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_2549B9E60 + dword_2549B9E60);
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  v0[31] = v7;
  *v7 = v0;
  v7[1] = sub_20D591464;
  return v13(v0[11], 0x726F737365636361, 0xE900000000000079, (uint64_t)sub_20D5928B0, v6);
}

uint64_t sub_20D591464(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(*v3 + 256) = v2;
  swift_task_dealloc();
  swift_release();
  if (!v2)
  {
    swift_release();
    *(_QWORD *)(v6 + 224) = a2;
    *(_QWORD *)(v6 + 232) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_20D5914F8()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_20D59155C(uint64_t a1, const char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    v3 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    if (!v3)
    {
      __break(1u);
      return;
    }
    v4 = v3;
    objc_msgSend(v3, sel_setRemoteObserver_, 0);
    swift_release();

  }
  if (qword_2549B7F60 != -1)
    swift_once();
  v5 = sub_20D5A67E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_2549B9FE0);
  v6 = sub_20D5A67C8();
  v7 = sub_20D5A6CFC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20D4F5000, v6, v7, a2, v8, 2u);
    MEMORY[0x212BA4658](v8, -1, -1);
  }

}

id sub_20D5916A0(uint64_t a1, void *a2)
{
  uint64_t KeyPath;
  uint64_t v4;
  id result;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
    sub_20D5A6684();
    swift_release();
    swift_retain();
    swift_release();
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    sub_20D570178((unint64_t *)&qword_2549B9F30, (uint64_t (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2150);
    sub_20D5A6678();
    swift_release();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
    sub_20D5A6684();
    swift_release();
    swift_retain();
    swift_release();
    v4 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v4);
    sub_20D570178((unint64_t *)&qword_2549BA780, (uint64_t (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2E70);
    sub_20D5A6678();
    swift_release();
    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    if (!result)
    {
      __break(1u);
      return result;
    }
    v6 = result;
    objc_msgSend(result, sel_setRemoteObserver_, 0);

    swift_release();
  }
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    v7 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v7);
    sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
    sub_20D5A6678();
    swift_release();
    swift_release();
  }
  swift_beginAccess();
  result = (id)swift_weakLoadStrong();
  if (result)
  {
    v8 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v8);
    v9 = a2;
    sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
    sub_20D5A6678();

    swift_release();
    return (id)swift_release();
  }
  return result;
}

uint64_t sub_20D591B20()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  return swift_task_switch();
}

uint64_t sub_20D591B38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (__cdecl *v6)();

  v1 = *(_QWORD *)(v0 + 32);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v1;
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  v2 = *(_QWORD *)(v1 + 40);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 24) = v2;
  sub_20D570178((unint64_t *)&qword_2549B9F30, (uint64_t (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2150);
  swift_retain();
  sub_20D5A6684();
  swift_release();
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v0 + 40) = v3;
  *(_QWORD *)(v0 + 48) = *(_QWORD *)(v2 + 24);
  sub_20D57828C(v3);
  swift_release();
  if (v3)
  {
    v6 = (uint64_t (__cdecl *)())((char *)&dword_2549BAA18 + dword_2549BAA18);
    swift_retain();
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v4;
    *v4 = v0;
    v4[1] = sub_20D591CDC;
    return v6();
  }
  else
  {
    sub_20D5927A4();
    swift_allocError();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20D591CDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_release();
  if (!v1)
    *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_20D591D58()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  return swift_task_switch();
}

uint64_t sub_20D591D70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (__cdecl *v6)();

  v1 = *(_QWORD *)(v0 + 32);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v1;
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  v2 = *(_QWORD *)(v1 + 48);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 24) = v2;
  sub_20D570178((unint64_t *)&qword_2549BA780, (uint64_t (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2E70);
  swift_retain();
  sub_20D5A6684();
  swift_release();
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v0 + 40) = v3;
  *(_QWORD *)(v0 + 48) = *(_QWORD *)(v2 + 24);
  sub_20D57828C(v3);
  swift_release();
  if (v3)
  {
    v6 = (uint64_t (__cdecl *)())((char *)&dword_2549BAA58 + dword_2549BAA58);
    swift_retain();
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v4;
    *v4 = v0;
    v4[1] = sub_20D591F14;
    return v6();
  }
  else
  {
    sub_20D5927A4();
    swift_allocError();
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20D591F14(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 64) = v1;
  swift_task_dealloc();
  swift_release();
  if (!v1)
    *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_20D591F90()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 72));
}

uint64_t sub_20D591FD0()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59200C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  v1[4] = sub_20D5A6C54();
  v1[5] = sub_20D5A6C48();
  v1[6] = sub_20D5A6C18();
  v1[7] = v2;
  return swift_task_switch();
}

uint64_t sub_20D59207C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 24);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v1;
  *(_QWORD *)(v0 + 64) = OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel___observationRegistrar;
  *(_QWORD *)(v0 + 72) = sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  v2 = *(_QWORD *)(v1 + 40);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v2;
  sub_20D570178((unint64_t *)&qword_2549B9F30, (uint64_t (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2150);
  swift_retain();
  sub_20D5A6684();
  swift_release();
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v0 + 80) = v3;
  *(_QWORD *)(v0 + 88) = *(_QWORD *)(v2 + 24);
  sub_20D57828C(v3);
  swift_release();
  if (v3)
  {
    *(_QWORD *)(v0 + 96) = sub_20D5A6C48();
    sub_20D5A6C18();
    return swift_task_switch();
  }
  v4 = *(_QWORD *)(v0 + 24);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v4;
  sub_20D5A6684();
  swift_release();
  v5 = *(_QWORD *)(v4 + 48);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v5;
  sub_20D570178((unint64_t *)&qword_2549BA780, (uint64_t (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2E70);
  swift_retain();
  sub_20D5A6684();
  swift_release();
  v6 = *(_QWORD *)(v5 + 16);
  *(_QWORD *)(v0 + 104) = v6;
  *(_QWORD *)(v0 + 112) = *(_QWORD *)(v5 + 24);
  sub_20D57828C(v6);
  swift_release();
  if (v6)
  {
    *(_QWORD *)(v0 + 120) = sub_20D5A6C48();
    sub_20D5A6C18();
    return swift_task_switch();
  }
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5922F4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 88);
  swift_release();
  __swift_project_boxed_opaque_existential_0((_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 48));
  sub_20D5A6D44();
  objc_msgSend(*(id *)(v1 + 64), sel_invalidate);
  v2 = *(void **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = 0;
  swift_release();
  swift_release();

  return swift_task_switch();
}

uint64_t sub_20D592378()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v1;
  sub_20D5A6684();
  swift_release();
  v2 = *(_QWORD *)(v1 + 48);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v2;
  sub_20D570178((unint64_t *)&qword_2549BA780, (uint64_t (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2E70);
  swift_retain();
  sub_20D5A6684();
  swift_release();
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v0 + 104) = v3;
  *(_QWORD *)(v0 + 112) = *(_QWORD *)(v2 + 24);
  sub_20D57828C(v3);
  swift_release();
  if (v3)
  {
    *(_QWORD *)(v0 + 120) = sub_20D5A6C48();
    sub_20D5A6C18();
    return swift_task_switch();
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20D5924D0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 112);
  swift_release();
  __swift_project_boxed_opaque_existential_0((_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 48));
  sub_20D5A6D44();
  objc_msgSend(*(id *)(v1 + 64), sel_invalidate);
  v2 = *(void **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = 0;
  swift_release();
  swift_release();

  return swift_task_switch();
}

uint64_t sub_20D592554()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D592584()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  sub_20D57C26C(v0 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel__process, &qword_2549B9348);
  v1 = v0 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel_quickLookUIExtensionPointQuery;
  v2 = sub_20D5A672C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC9QuickLook21QLHostRemoteViewModel___observationRegistrar;
  v4 = sub_20D5A66B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_20D592634()
{
  return type metadata accessor for QLHostRemoteViewModel();
}

uint64_t type metadata accessor for QLHostRemoteViewModel()
{
  uint64_t result;

  result = qword_2549BA038;
  if (!qword_2549BA038)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20D592678()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_20D592740();
  if (v0 <= 0x3F)
  {
    sub_20D5A672C();
    if (v1 <= 0x3F)
    {
      sub_20D5A66B4();
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

void sub_20D592740()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549BA070)
  {
    sub_20D5A6774();
    v0 = sub_20D5A6DA4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2549BA070);
  }
}

unint64_t sub_20D5927A4()
{
  unint64_t result;

  result = qword_2549BA2D0;
  if (!qword_2549BA2D0)
  {
    result = MEMORY[0x212BA45A4](&unk_20D5B3420, &type metadata for QLHostRemoteViewModel.InternalError);
    atomic_store(result, (unint64_t *)&qword_2549BA2D0);
  }
  return result;
}

uint64_t sub_20D5927E8()
{
  uint64_t *v0;

  return sub_20D577DC4(v0[2], v0[3], v0[4]);
}

uint64_t sub_20D592804()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 48) = *(_QWORD *)(v0 + 24);
  swift_retain();
  return swift_release();
}

uint64_t sub_20D592844()
{
  uint64_t v0;

  return sub_20D590034(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_20D59285C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_20D592880()
{
  uint64_t v0;

  sub_20D59155C(v0, "Preview collection view service did terminate normally.");
}

void sub_20D5928B0()
{
  uint64_t v0;

  sub_20D59155C(v0, "Accessory view service did terminate normally.");
}

uint64_t sub_20D5928D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9348);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D592918(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9348);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D592960()
{
  return sub_20D590AC4();
}

uint64_t sub_20D592968()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

id sub_20D592994()
{
  uint64_t v0;

  return sub_20D5916A0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_20D5929A4()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 17) = *(_BYTE *)(v0 + 24);
}

void sub_20D5929BC()
{
  sub_20D5929D0();
}

void sub_20D5929D0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(void **)(v0 + 24);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v1;
  v4 = v1;

}

uint64_t storeEnumTagSinglePayload for QLHostRemoteViewModel.InternalError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_20D592A58 + 4 * byte_20D5B3190[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_20D592A78 + 4 * byte_20D5B3195[v4]))();
}

_BYTE *sub_20D592A58(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_20D592A78(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20D592A80(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20D592A88(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_20D592A90(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_20D592A98(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for QLHostRemoteViewModel.InternalError()
{
  return &type metadata for QLHostRemoteViewModel.InternalError;
}

unint64_t sub_20D592AB8()
{
  unint64_t result;

  result = qword_2549BA2F0;
  if (!qword_2549BA2F0)
  {
    result = MEMORY[0x212BA45A4](&unk_20D5B33F8, &type metadata for QLHostRemoteViewModel.InternalError);
    atomic_store(result, (unint64_t *)&qword_2549BA2F0);
  }
  return result;
}

uint64_t sub_20D592B04()
{
  return sub_20D592844();
}

uint64_t sub_20D592B18()
{
  return sub_20D5927E8();
}

void sub_20D592B2C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_20D5A65C4();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

uint64_t sub_20D592B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_20D5A6C78();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_20D5A6C6C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_20D57C26C(a1, (uint64_t *)&unk_2549B97E0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20D5A6C18();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_20D592CD0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 16);
  return result;
}

uint64_t sub_20D592D5C()
{
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6678();
  return swift_release();
}

uint64_t sub_20D592E04@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 17);
  return result;
}

uint64_t sub_20D592E90()
{
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6678();
  return swift_release();
}

uint64_t sub_20D592F38@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 32);
  return swift_unknownObjectRetain();
}

uint64_t sub_20D592FC8()
{
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  swift_unknownObjectRetain();
  sub_20D5A6678();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_20D593080()
{
  uint64_t v0;

  v0 = sub_20D5A67E0();
  __swift_allocate_value_buffer(v0, qword_2549BA300);
  __swift_project_value_buffer(v0, (uint64_t)qword_2549BA300);
  return sub_20D5A67D4();
}

id sub_20D5930FC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___accessoryViewController;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___accessoryViewController);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___accessoryViewController);
  }
  else
  {
    v4 = sub_20D59315C(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_20D59315C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7BB0]), sel_init);
  v3 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  v4 = *(_QWORD *)(v3 + 48);
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA780, (uint64_t (*)(uint64_t))type metadata accessor for QLHostAccessoryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2E70);
  swift_retain();
  sub_20D5A6684();
  swift_release();
  v5 = *(_QWORD *)(v4 + 16);
  sub_20D57828C(v5);
  swift_release();
  if (v5)
  {
    swift_retain();
    sub_20D5A6D98();
    type metadata accessor for QLHostPlaceholderUIView();
    v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    objc_msgSend(v2, sel_setPlaceholderView_, v6);
    swift_release();
    swift_release();

  }
  else
  {
    sub_20D5A6D98();
  }
  return v2;
}

uint64_t sub_20D5933A0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  return *(unsigned __int8 *)(v1 + 17);
}

uint64_t sub_20D5934D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA328);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v13[-v7];
  v9 = v1 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
  swift_beginAccess();
  sub_20D593634(v9, (uint64_t)v8);
  v10 = sub_20D5A6660();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
    return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v11 + 32))(a1, v8, v10);
  sub_20D57C26C((uint64_t)v8, &qword_2549BA328);
  sub_20D5A6654();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_20D59367C((uint64_t)v6, v9);
  return swift_endAccess();
}

uint64_t sub_20D593634(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D59367C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D5937E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA328);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20D5A6660();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v5, a1, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  v8 = v1 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
  swift_beginAccess();
  sub_20D59367C((uint64_t)v5, v8);
  return swift_endAccess();
}

uint64_t sub_20D5938C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA328);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20D5A6660();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  v11 = *a2;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v6, v10, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  v12 = v11 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
  swift_beginAccess();
  sub_20D59367C((uint64_t)v6, v12);
  return swift_endAccess();
}

void (*sub_20D5939E0(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  void *v8;

  v3 = malloc(0x60uLL);
  *a1 = v3;
  v3[6] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA328);
  v3[7] = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v5 = sub_20D5A6660();
  v3[8] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v3[9] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v3[10] = malloc(v7);
  v8 = malloc(v7);
  v3[11] = v8;
  sub_20D5934D0((uint64_t)v8);
  return sub_20D593A7C;
}

void sub_20D593A7C(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD **)a1;
  v4 = *(void **)(*(_QWORD *)a1 + 80);
  v3 = *(void **)(*(_QWORD *)a1 + 88);
  if ((a2 & 1) != 0)
  {
    v5 = v2[8];
    v6 = v2[9];
    v8 = v2[6];
    v7 = (void *)v2[7];
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v6 + 16))(v2[10], v2[11], v5);
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v7, v4, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v7, 0, 1, v5);
    v9 = v8 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
    swift_beginAccess();
    sub_20D59367C((uint64_t)v7, v9);
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v3, v5);
  }
  else
  {
    v10 = v2[8];
    v11 = v2[9];
    v12 = v2[6];
    v7 = (void *)v2[7];
    (*(void (**)(void *, _QWORD, uint64_t))(v11 + 32))(v7, v2[11], v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    v13 = v12 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid;
    swift_beginAccess();
    sub_20D59367C((uint64_t)v7, v13);
    swift_endAccess();
  }
  free(v3);
  free(v4);
  free(v7);
  free(v2);
}

id sub_20D593BD4(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  objc_super v13;

  v6 = OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel;
  type metadata accessor for QLHostRemoteViewModel();
  swift_allocObject();
  v7 = v3;
  *(_QWORD *)&v3[v6] = sub_20D59009C();
  *(_QWORD *)&v7[OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___accessoryViewController] = 0;
  v8 = &v7[OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController____lazy_storage___uuid];
  v9 = sub_20D5A6660();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);

  if (a2)
  {
    v10 = (void *)sub_20D5A6AD4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v7;
  v13.super_class = (Class)type metadata accessor for QLRemoteUIHostViewController();
  v11 = objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, v10, a3);

  return v11;
}

uint64_t type metadata accessor for QLRemoteUIHostViewController()
{
  uint64_t result;

  result = qword_2549BA548;
  if (!qword_2549BA548)
    return swift_getSingletonMetadata();
  return result;
}

id QLRemoteUIHostViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QLRemoteUIHostViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t static QLRemoteUIHostViewController.remotePreviewCollection()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_2549BA340 + dword_2549BA340);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_20D5770A8;
  return v3();
}

void sub_20D593FB4(uint64_t a1)
{
  id v2;
  id v3;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_setRemoteObserver_, a1);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_20D594018(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_20D594178(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  sub_20D5A6C54();
  *(_QWORD *)(v1 + 24) = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D5941E4()
{
  _QWORD *v0;
  const void *v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  v1 = (const void *)v0[2];
  swift_release();
  v0[4] = _Block_copy(v1);
  v4 = (uint64_t (__cdecl *)())((char *)&dword_2549BA340 + dword_2549BA340);
  v2 = (_QWORD *)swift_task_alloc();
  v0[5] = v2;
  *v2 = v0;
  v2[1] = sub_20D594250;
  return v4();
}

uint64_t sub_20D594250(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v5;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 32);
  v5 = *v1;
  swift_task_dealloc();
  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v5 + 8))();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.toggleDebugView()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  swift_getKeyPath();
  sub_20D5A669C();
  swift_release();
  *(_BYTE *)(v1 + 16) = (*(_BYTE *)(v1 + 16) & 1) == 0;
  swift_getKeyPath();
  sub_20D5A6690();
  swift_release();
}

Swift::Bool __swiftcall QLRemoteUIHostViewController.isRemote()()
{
  return 1;
}

Swift::Void __swiftcall QLRemoteUIHostViewController.setAllowInteractiveTransitions(_:)(Swift::Bool a1)
{
  sub_20D59DA48(a1, (uint64_t)&unk_24C728F28, (uint64_t)&unk_2549BA358, (void (*)(char *, uint64_t, uint64_t))sub_20D592B84);
}

uint64_t sub_20D594410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v5 + 220) = a5;
  *(_QWORD *)(v5 + 144) = a4;
  sub_20D5A6C54();
  *(_QWORD *)(v5 + 152) = sub_20D5A6C48();
  *(_QWORD *)(v5 + 160) = sub_20D5A6C18();
  *(_QWORD *)(v5 + 168) = v6;
  return swift_task_switch();
}

uint64_t sub_20D594480()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (__cdecl *v6)();

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 144) + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 120) = v1;
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  v2 = *(_QWORD *)(v1 + 40);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 128) = v2;
  sub_20D570178((unint64_t *)&qword_2549B9F30, (uint64_t (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2150);
  swift_retain();
  sub_20D5A6684();
  swift_release();
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v0 + 176) = v3;
  *(_QWORD *)(v0 + 184) = *(_QWORD *)(v2 + 24);
  sub_20D57828C(v3);
  swift_release();
  if (v3)
  {
    v6 = (uint64_t (__cdecl *)())((char *)&dword_2549BAA18 + dword_2549BAA18);
    swift_retain();
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v4;
    *v4 = v0;
    v4[1] = sub_20D594610;
    return v6();
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20D594610(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 200) = v1;
  swift_task_dealloc();
  swift_release();
  if (!v1)
    *(_QWORD *)(v4 + 208) = a1;
  return swift_task_switch();
}

uint64_t sub_20D594690()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(void **)(v0 + 208);
  v2 = *(unsigned __int8 *)(v0 + 220);
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_20D59472C;
  v3 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v4 = (_QWORD *)(v0 + 80);
  v4[1] = 0x40000000;
  v4[2] = sub_20D572224;
  v4[3] = &block_descriptor_453;
  v4[4] = v3;
  objc_msgSend(v1, sel_setAllowInteractiveTransitions_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_20D59472C()
{
  return swift_task_switch();
}

uint64_t sub_20D594778()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20D5947C4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5947F4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  int v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;

  swift_release();
  swift_release();
  swift_release();
  if (qword_2549B7F68 != -1)
    swift_once();
  v1 = *(void **)(v0 + 200);
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 200);
  if (v7)
  {
    v9 = *(unsigned __int8 *)(v0 + 220);
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 67109378;
    *(_DWORD *)(v0 + 216) = v9;
    sub_20D5A6DB0();
    *(_WORD *)(v10 + 8) = 2112;
    v12 = v8;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 136) = v13;
    sub_20D5A6DB0();
    *v11 = v13;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to set allowInteractiveTransitions to %{BOOL}d. Error: %@", (uint8_t *)v10, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v11, -1, -1);
    MEMORY[0x212BA4658](v10, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void __swiftcall QLRemoteUIHostViewController.accessoryView()(UIView *__return_ptr retstr)
{
  id v1;
  id v2;

  v1 = sub_20D5930FC();
  v2 = objc_msgSend(v1, sel_view);

  if (!v2)
    __break(1u);
}

Swift::Void __swiftcall QLRemoteUIHostViewController.setHostApplicationBundleIdentifier(_:)(Swift::String a1)
{
  sub_20D59A080(a1._countAndFlagsBits, (uint64_t)a1._object, (uint64_t)&unk_24C728F50, (uint64_t)&unk_2549BA368, (void (*)(char *, uint64_t, _QWORD *))sub_20D5847D0);
}

uint64_t sub_20D594ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v6[5] = sub_20D5A6C54();
  v6[6] = sub_20D5A6C48();
  v6[7] = sub_20D5A6C48();
  v6[8] = sub_20D5A6C18();
  v6[9] = v7;
  return swift_task_switch();
}

uint64_t sub_20D594B5C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_20D594BB0;
  return sub_20D591B20();
}

uint64_t sub_20D594BB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 96) = a1;
  return swift_task_switch();
}

uint64_t sub_20D594C24()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D594C7C()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 96);
  swift_release();
  v2 = (void *)sub_20D5A6AD4();
  objc_msgSend(v1, sel_setHostApplicationBundleIdentifier_, v2);

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D594CF0()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t QLRemoteUIHostViewController.configure(withNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char *v5;
  char *v6;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t KeyPath;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;

  v6 = v5;
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = &unk_2549CA378;
  v15 = swift_dynamicCastObjCProtocolConditional();
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)&v6[OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel];
    KeyPath = swift_getKeyPath();
    v26 = a2;
    v27 = a3;
    MEMORY[0x24BDAC7A8](KeyPath);
    *(&v25 - 2) = v17;
    *(&v25 - 1) = v16;
    v28 = v17;
    sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
    swift_unknownObjectRetain();
    sub_20D5A6678();
    swift_unknownObjectRelease();
    swift_release();
    a2 = v26;
    a3 = v27;
  }
  sub_20D5A6C60();
  v19 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v14, 0, 1, v19);
  sub_20D5A6C54();
  swift_unknownObjectRetain();
  v20 = v6;
  swift_unknownObjectRetain();
  v21 = sub_20D5A6C48();
  v22 = swift_allocObject();
  v23 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v22 + 16) = v21;
  *(_QWORD *)(v22 + 24) = v23;
  *(_QWORD *)(v22 + 32) = v20;
  *(_QWORD *)(v22 + 40) = a1;
  *(_QWORD *)(v22 + 48) = a2;
  *(_QWORD *)(v22 + 56) = a3;
  *(_QWORD *)(v22 + 64) = a4;
  *(_BYTE *)(v22 + 72) = a5 & 1;
  sub_20D5847D0((uint64_t)v14, (uint64_t)&unk_2549BA380, v22);
  return swift_release();
}

uint64_t sub_20D594F8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  char v11;

  *(_BYTE *)(v8 + 120) = v11;
  *(_QWORD *)(v8 + 40) = a7;
  *(_QWORD *)(v8 + 48) = a8;
  *(_QWORD *)(v8 + 24) = a5;
  *(_QWORD *)(v8 + 32) = a6;
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 56) = sub_20D5A6C54();
  *(_QWORD *)(v8 + 64) = sub_20D5A6C48();
  *(_QWORD *)(v8 + 72) = sub_20D5A6C48();
  *(_QWORD *)(v8 + 80) = sub_20D5A6C18();
  *(_QWORD *)(v8 + 88) = v9;
  return swift_task_switch();
}

uint64_t sub_20D59501C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_20D595070;
  return sub_20D591B20();
}

uint64_t sub_20D595070(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 104) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 112) = a1;
  return swift_task_switch();
}

uint64_t sub_20D5950E4()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59513C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 112);
  v2 = *(unsigned __int8 *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v6 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  swift_release();
  objc_msgSend(v1, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen_, v6, v5, v4, v3, v2);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5951BC()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D595214()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t QLRemoteUIHostViewController.configure(withNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t KeyPath;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = &unk_2549CA378;
  v12 = swift_dynamicCastObjCProtocolConditional();
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)&v4[OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel];
    KeyPath = swift_getKeyPath();
    v23 = a1;
    v24 = a3;
    MEMORY[0x24BDAC7A8](KeyPath);
    *(&v22 - 2) = v14;
    *(&v22 - 1) = v13;
    v25 = v14;
    sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
    swift_unknownObjectRetain();
    sub_20D5A6678();
    swift_unknownObjectRelease();
    swift_release();
    a1 = v23;
    a3 = v24;
  }
  sub_20D5A6C60();
  v16 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v11, 0, 1, v16);
  sub_20D5A6C54();
  swift_unknownObjectRetain();
  v17 = v4;
  swift_unknownObjectRetain();
  v18 = sub_20D5A6C48();
  v19 = (_QWORD *)swift_allocObject();
  v20 = MEMORY[0x24BEE6930];
  v19[2] = v18;
  v19[3] = v20;
  v19[4] = v17;
  v19[5] = a1;
  v19[6] = a2;
  v19[7] = a3;
  v19[8] = a4;
  sub_20D5847D0((uint64_t)v11, (uint64_t)&unk_2549BA390, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_20D5954F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;

  v8[5] = a7;
  v8[6] = a8;
  v8[3] = a5;
  v8[4] = a6;
  v8[2] = a4;
  v8[7] = sub_20D5A6C54();
  v8[8] = sub_20D5A6C48();
  v8[9] = sub_20D5A6C48();
  v8[10] = sub_20D5A6C18();
  v8[11] = v9;
  return swift_task_switch();
}

uint64_t sub_20D59557C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_20D5955D0;
  return sub_20D591B20();
}

uint64_t sub_20D5955D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 104) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 112) = a1;
  return swift_task_switch();
}

uint64_t sub_20D595644()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59569C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 32);
  swift_release();
  objc_msgSend(v1, sel_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_, v5, v4, v3, v2);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.setCurrentPreviewItemIndex(_:animated:)(Swift::Int _, Swift::Bool animated)
{
  sub_20D59B588(_, animated, (uint64_t)&unk_24C728FC8, (uint64_t)&unk_2549BA3A0);
}

uint64_t sub_20D5957B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v6 + 96) = a6;
  *(_QWORD *)(v6 + 16) = a4;
  *(_QWORD *)(v6 + 24) = a5;
  *(_QWORD *)(v6 + 32) = sub_20D5A6C54();
  *(_QWORD *)(v6 + 40) = sub_20D5A6C48();
  *(_QWORD *)(v6 + 48) = sub_20D5A6C48();
  *(_QWORD *)(v6 + 56) = sub_20D5A6C18();
  *(_QWORD *)(v6 + 64) = v7;
  return swift_task_switch();
}

uint64_t sub_20D595834()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = sub_20D595888;
  return sub_20D591B20();
}

uint64_t sub_20D595888(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 80) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 88) = a1;
  return swift_task_switch();
}

uint64_t sub_20D5958FC()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D595954()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 88);
  v2 = *(unsigned __int8 *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 24);
  swift_release();
  objc_msgSend(v1, sel_setCurrentPreviewItemIndex_animated_, v3, v2);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5959BC()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.hostApplicationDidEnterBackground(_:)(Swift::Bool a1)
{
  sub_20D59DA48(a1, (uint64_t)&unk_24C728FF0, (uint64_t)&unk_2549BA3B0, (void (*)(char *, uint64_t, uint64_t))sub_20D5847D0);
}

uint64_t sub_20D595A44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v5 + 88) = a5;
  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = sub_20D5A6C54();
  *(_QWORD *)(v5 + 32) = sub_20D5A6C48();
  *(_QWORD *)(v5 + 40) = sub_20D5A6C48();
  *(_QWORD *)(v5 + 48) = sub_20D5A6C18();
  *(_QWORD *)(v5 + 56) = v6;
  return swift_task_switch();
}

uint64_t sub_20D595AC4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_20D595B18;
  return sub_20D591B20();
}

uint64_t sub_20D595B18(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t sub_20D595B8C()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D595BE4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 80);
  v2 = *(unsigned __int8 *)(v0 + 88);
  swift_release();
  objc_msgSend(v1, sel_hostApplicationDidEnterBackground_, v2);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D595C3C()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.hostApplicationDidBecomeActive()()
{
  sub_20D59C7F0((uint64_t)&unk_24C729018, (uint64_t)&unk_2549BA3C0, (void (*)(char *, uint64_t, _QWORD *))sub_20D5847D0);
}

uint64_t sub_20D595CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a4;
  v4[3] = sub_20D5A6C54();
  v4[4] = sub_20D5A6C48();
  v4[5] = sub_20D5A6C48();
  v4[6] = sub_20D5A6C18();
  v4[7] = v5;
  return swift_task_switch();
}

uint64_t sub_20D595D48()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_20D595D9C;
  return sub_20D591B20();
}

uint64_t sub_20D595D9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t sub_20D595E10()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D595E68()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 80);
  swift_release();
  objc_msgSend(v1, sel_hostApplicationDidBecomeActive);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t QLRemoteUIHostViewController.toolbarButtons(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[18] = a1;
  v2[19] = v1;
  v2[20] = sub_20D5A6C54();
  v2[21] = sub_20D5A6C48();
  v2[22] = sub_20D5A6C48();
  v2[23] = sub_20D5A6C18();
  v2[24] = v3;
  return swift_task_switch();
}

uint64_t sub_20D595F50()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 200) = v1;
  *v1 = v0;
  v1[1] = sub_20D595FA4;
  return sub_20D591B20();
}

uint64_t sub_20D595FA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 208) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 216) = a1;
  return swift_task_switch();
}

uint64_t sub_20D596018()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  *(_QWORD *)(v0 + 224) = sub_20D5A6C18();
  *(_QWORD *)(v0 + 232) = v1;
  return swift_task_switch();
}

uint64_t sub_20D596070()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[27];
  v2 = v0[18];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_20D596114;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_20D571C14;
  v4[3] = &block_descriptor_6;
  v4[4] = v3;
  objc_msgSend(v1, sel_toolbarButtonsForTraitCollection_withCompletionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_20D596114()
{
  return swift_task_switch();
}

uint64_t sub_20D596158()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 128);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_20D5961A8()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D596200()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  swift_release();
  if (qword_2549B7F68 != -1)
    swift_once();
  v1 = *(void **)(v0 + 208);
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 208);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 136) = v12;
    sub_20D5A6DB0();
    *v10 = v12;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to get toolbar buttons: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v10, -1, -1);
    MEMORY[0x212BA4658](v9, -1, -1);
  }
  else
  {

  }
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8], MEMORY[0x24BEE4AF8]);
}

uint64_t sub_20D596504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_20D5A6C54();
  v3[5] = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D596574()
{
  uint64_t *v0;
  void *v1;
  const void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD *v6;

  v1 = (void *)v0[4];
  v3 = (void *)v0[2];
  v2 = (const void *)v0[3];
  swift_release();
  v0[6] = (uint64_t)_Block_copy(v2);
  v4 = v3;
  v5 = v1;
  v6 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v6;
  *v6 = v0;
  v6[1] = sub_20D5965F0;
  return QLRemoteUIHostViewController.toolbarButtons(for:)(v0[2]);
}

uint64_t sub_20D5965F0()
{
  uint64_t *v0;
  void (**v1)(_QWORD, _QWORD, _QWORD);
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;

  v1 = *(void (***)(_QWORD, _QWORD, _QWORD))(*v0 + 48);
  v2 = *(void **)(*v0 + 32);
  v3 = *(void **)(*v0 + 16);
  v7 = *v0;
  swift_task_dealloc();

  sub_20D577BD0(0, &qword_2549BA720);
  v4 = (void *)sub_20D5A6BDC();
  v5 = (void *)sub_20D5A6BDC();
  ((void (**)(_QWORD, void *, void *))v1)[2](v1, v4, v5);

  _Block_release(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t QLRemoteUIHostViewController.toolbarButtonPressed(withIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[20] = a2;
  v3[21] = v2;
  v3[19] = a1;
  v3[22] = sub_20D5A6C54();
  v3[23] = sub_20D5A6C48();
  v3[24] = sub_20D5A6C18();
  v3[25] = v4;
  return swift_task_switch();
}

uint64_t sub_20D596744()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;

  if (qword_2549B7F68 != -1)
    swift_once();
  v1 = sub_20D5A67E0();
  *(_QWORD *)(v0 + 208) = __swift_project_value_buffer(v1, (uint64_t)qword_2549BA300);
  swift_bridgeObjectRetain_n();
  v2 = sub_20D5A67C8();
  v3 = sub_20D5A6CFC();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(_QWORD *)(v0 + 160);
  if (v4)
  {
    v11 = *(_QWORD *)(v0 + 152);
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12 = v7;
    *(_DWORD *)v6 = 136315394;
    *(_QWORD *)(v0 + 136) = sub_20D56FB0C(0xD000000000000025, 0x800000020D5BF420, &v12);
    sub_20D5A6DB0();
    *(_WORD *)(v6 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 144) = sub_20D56FB0C(v11, v5, &v12);
    sub_20D5A6DB0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_20D4F5000, v2, v3, "Calling %s on the service (%s", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v7, -1, -1);
    MEMORY[0x212BA4658](v6, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v8 = *(_QWORD *)(*(_QWORD *)(v0 + 168) + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 120) = v8;
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  if (*(_BYTE *)(v8 + 17) == 1)
  {
    *(_QWORD *)(v0 + 216) = sub_20D5A6C48();
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 224) = v9;
    *v9 = v0;
    v9[1] = sub_20D596A14;
    return sub_20D591B20();
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20D596A14(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 232) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 240) = a1;
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D596ABC()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20D596AF4()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[30];
  v2 = sub_20D5A6AD4();
  v0[31] = v2;
  v0[2] = v0;
  v0[3] = sub_20D596B9C;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_20D572224;
  v4[3] = &block_descriptor_38;
  v4[4] = v3;
  objc_msgSend(v1, sel_toolbarButtonPressedWithIdentifier_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_20D596B9C()
{
  return swift_task_switch();
}

uint64_t sub_20D596BE0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 248);
  swift_release();
  swift_unknownObjectRelease();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D596C20()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20D596C58()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v1 = *(void **)(v0 + 232);
  swift_release();
  v2 = v1;
  v3 = v1;
  v4 = sub_20D5A67C8();
  v5 = sub_20D5A6D14();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 232);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 128) = v10;
    sub_20D5A6DB0();
    *v8 = v10;

    _os_log_impl(&dword_20D4F5000, v4, v5, "Failed to inform toolbar button has been pressed: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v8, -1, -1);
    MEMORY[0x212BA4658](v7, -1, -1);

  }
  else
  {
    v11 = *(void **)(v0 + 232);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D596F14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_20D5A6C54();
  v3[5] = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D596F84()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;

  v1 = (void *)v0[4];
  v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  v3 = sub_20D5A6AF8();
  v5 = v4;
  v0[7] = v4;
  v6 = v1;
  v7 = (_QWORD *)swift_task_alloc();
  v0[8] = v7;
  *v7 = v0;
  v7[1] = sub_20D597018;
  return QLRemoteUIHostViewController.toolbarButtonPressed(withIdentifier:)(v3, v5);
}

uint64_t sub_20D597018()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  uint64_t v4;

  v1 = *(void (***)(_QWORD))(*v0 + 48);
  v2 = *(void **)(*v0 + 32);
  v4 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t QLRemoteUIHostViewController.shouldDisplayLockActivity()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[16] = v0;
  v1[17] = sub_20D5A6C54();
  v1[18] = sub_20D5A6C48();
  v1[19] = sub_20D5A6C48();
  v1[20] = sub_20D5A6C18();
  v1[21] = v2;
  return swift_task_switch();
}

uint64_t sub_20D59710C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v1;
  *v1 = v0;
  v1[1] = sub_20D597160;
  return sub_20D591B20();
}

uint64_t sub_20D597160(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 184) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 192) = a1;
  return swift_task_switch();
}

uint64_t sub_20D5971D4()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  *(_QWORD *)(v0 + 200) = sub_20D5A6C18();
  *(_QWORD *)(v0 + 208) = v1;
  return swift_task_switch();
}

uint64_t sub_20D59722C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)v0[24];
  v0[7] = v0 + 27;
  v0[2] = v0;
  v0[3] = sub_20D5972C0;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_20D572764;
  v3[3] = &block_descriptor_40;
  v3[4] = v2;
  objc_msgSend(v1, sel_shouldDisplayLockActivityWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_20D5972C0()
{
  return swift_task_switch();
}

uint64_t sub_20D597304()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = *(unsigned __int8 *)(v0 + 216);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_20D597348()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D5973A0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  swift_release();
  if (qword_2549B7F68 != -1)
    swift_once();
  v1 = *(void **)(v0 + 184);
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 184);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 120) = v12;
    sub_20D5A6DB0();
    *v10 = v12;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to know if current preview can be locked: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v10, -1, -1);
    MEMORY[0x212BA4658](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_20D597694(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_20D5A6C54();
  v2[4] = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D597700()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_20D597768;
  return QLRemoteUIHostViewController.shouldDisplayLockActivity()();
}

uint64_t sub_20D597768(char a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  uint64_t v6;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 40);
  v4 = *(void **)(*v1 + 24);
  v6 = *v1;
  swift_task_dealloc();

  v3[2](v3, a1 & 1);
  _Block_release(v3);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.requestLockForCurrentItem()()
{
  sub_20D59C7F0((uint64_t)&unk_24C729088, (uint64_t)&unk_2549BA3F0, (void (*)(char *, uint64_t, _QWORD *))sub_20D5847D0);
}

uint64_t sub_20D5977F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a4;
  v4[3] = sub_20D5A6C54();
  v4[4] = sub_20D5A6C48();
  v4[5] = sub_20D5A6C48();
  v4[6] = sub_20D5A6C18();
  v4[7] = v5;
  return swift_task_switch();
}

uint64_t sub_20D597874()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_20D5978C8;
  return sub_20D591B20();
}

uint64_t sub_20D5978C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t sub_20D59793C()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D597994()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 80);
  swift_release();
  objc_msgSend(v1, sel_requestLockForCurrentItem);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t QLRemoteUIHostViewController.keyCommands()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[17] = v0;
  v1[18] = sub_20D5A6C54();
  v1[19] = sub_20D5A6C48();
  v1[20] = sub_20D5A6C48();
  v1[21] = sub_20D5A6C18();
  v1[22] = v2;
  return swift_task_switch();
}

uint64_t sub_20D597A7C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v1;
  *v1 = v0;
  v1[1] = sub_20D597AD0;
  return sub_20D591B20();
}

uint64_t sub_20D597AD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 192) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 200) = a1;
  return swift_task_switch();
}

uint64_t sub_20D597B44()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  *(_QWORD *)(v0 + 208) = sub_20D5A6C18();
  *(_QWORD *)(v0 + 216) = v1;
  return swift_task_switch();
}

uint64_t sub_20D597B9C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)v0[25];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_20D597C30;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_20D572CD8;
  v3[3] = &block_descriptor_46;
  v3[4] = v2;
  objc_msgSend(v1, sel_keyCommandsWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_20D597C30()
{
  return swift_task_switch();
}

uint64_t sub_20D597C74()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = *(_QWORD *)(v0 + 120);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_20D597CB8()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D597D10()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  swift_release();
  if (qword_2549B7F68 != -1)
    swift_once();
  v1 = *(void **)(v0 + 192);
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 192);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 128) = v12;
    sub_20D5A6DB0();
    *v10 = v12;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to get key commands: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v10, -1, -1);
    MEMORY[0x212BA4658](v9, -1, -1);
  }
  else
  {

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
}

uint64_t sub_20D597FFC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_20D5A6C54();
  v2[4] = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D598068()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_20D5980D0;
  return QLRemoteUIHostViewController.keyCommands()();
}

uint64_t sub_20D5980D0()
{
  uint64_t *v0;
  void (**v1)(_QWORD, _QWORD);
  void *v2;
  void *v3;
  uint64_t v5;

  v1 = *(void (***)(_QWORD, _QWORD))(*v0 + 40);
  v2 = *(void **)(*v0 + 24);
  v5 = *v0;
  swift_task_dealloc();

  sub_20D577BD0(0, &qword_2549BA6B0);
  v3 = (void *)sub_20D5A6BDC();
  swift_bridgeObjectRelease();
  ((void (**)(_QWORD, void *))v1)[2](v1, v3);

  _Block_release(v1);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t QLRemoteUIHostViewController.keyCommandWasPerformed(_:)(void *a1)
{
  return sub_20D59CCC8(a1, (uint64_t)&unk_24C7290C8, (uint64_t)&unk_2549BA408, (void (*)(char *, uint64_t, _QWORD *))sub_20D5847D0);
}

uint64_t sub_20D598194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[2] = a4;
  v5[3] = a5;
  v5[4] = sub_20D5A6C54();
  v5[5] = sub_20D5A6C48();
  v5[6] = sub_20D5A6C48();
  v5[7] = sub_20D5A6C18();
  v5[8] = v6;
  return swift_task_switch();
}

uint64_t sub_20D598210()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = sub_20D598264;
  return sub_20D591B20();
}

uint64_t sub_20D598264(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 80) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 88) = a1;
  return swift_task_switch();
}

uint64_t sub_20D5982D8()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D598330()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 24);
  swift_release();
  objc_msgSend(v1, sel_keyCommandWasPerformed_, v2);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D598388()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D5983E0()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t QLRemoteUIHostViewController.setAppearance(_:animated:)(void *a1, char a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6C60();
  v8 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  sub_20D5A6C54();
  v9 = v2;
  v10 = a1;
  v11 = sub_20D5A6C48();
  v12 = swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v13;
  *(_QWORD *)(v12 + 32) = v9;
  *(_QWORD *)(v12 + 40) = v10;
  *(_BYTE *)(v12 + 48) = a2;
  sub_20D5847D0((uint64_t)v7, (uint64_t)&unk_2549BA418, v12);
  return swift_release();
}

uint64_t sub_20D598530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v6 + 96) = a6;
  *(_QWORD *)(v6 + 16) = a4;
  *(_QWORD *)(v6 + 24) = a5;
  *(_QWORD *)(v6 + 32) = sub_20D5A6C54();
  *(_QWORD *)(v6 + 40) = sub_20D5A6C48();
  *(_QWORD *)(v6 + 48) = sub_20D5A6C48();
  *(_QWORD *)(v6 + 56) = sub_20D5A6C18();
  *(_QWORD *)(v6 + 64) = v7;
  return swift_task_switch();
}

uint64_t sub_20D5985B0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = sub_20D598604;
  return sub_20D591B20();
}

uint64_t sub_20D598604(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 80) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 88) = a1;
  return swift_task_switch();
}

uint64_t sub_20D598678()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D5986D0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 88);
  v2 = *(unsigned __int8 *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 24);
  swift_release();
  objc_msgSend(v1, sel_setAppearance_animated_, v3, v2);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.notifyFirstTimeAppearance(with:)(__C::QLPreviewControllerFirstTimeAppearanceActions with)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  __C::QLPreviewControllerFirstTimeAppearanceActions *v9;
  Swift::UInt v10;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6C60();
  v6 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  sub_20D5A6C54();
  v7 = v1;
  v8 = sub_20D5A6C48();
  v9 = (__C::QLPreviewControllerFirstTimeAppearanceActions *)swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  v9[2].rawValue = v8;
  v9[3].rawValue = v10;
  v9[4].rawValue = (Swift::UInt)v7;
  v9[5].rawValue = with.rawValue;
  sub_20D5847D0((uint64_t)v5, (uint64_t)&unk_2549BA428, (uint64_t)v9);
  swift_release();
}

uint64_t sub_20D59894C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[2] = a4;
  v5[3] = a5;
  v5[4] = sub_20D5A6C54();
  v5[5] = sub_20D5A6C48();
  v5[6] = sub_20D5A6C48();
  v5[7] = sub_20D5A6C18();
  v5[8] = v6;
  return swift_task_switch();
}

uint64_t sub_20D5989C8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = sub_20D598A1C;
  return sub_20D591B20();
}

uint64_t sub_20D598A1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 80) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 88) = a1;
  return swift_task_switch();
}

uint64_t sub_20D598A90()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D598AE8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 24);
  swift_release();
  objc_msgSend(v1, sel_notifyFirstTimeAppearanceWithActions_, v2);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.notifyStateRestorationUserInfo(_:)(Swift::OpaquePointer_optional a1)
{
  void *v1;
  void *rawValue;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  rawValue = a1.value._rawValue;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6C60();
  v6 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  sub_20D5A6C54();
  swift_bridgeObjectRetain();
  v7 = v1;
  v8 = sub_20D5A6C48();
  v9 = (_QWORD *)swift_allocObject();
  v10 = MEMORY[0x24BEE6930];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  v9[5] = rawValue;
  sub_20D5847D0((uint64_t)v5, (uint64_t)&unk_2549BA438, (uint64_t)v9);
  swift_release();
}

uint64_t sub_20D598D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[5] = a4;
  v5[6] = a5;
  v5[7] = sub_20D5A6C54();
  v5[8] = sub_20D5A6C48();
  v5[9] = sub_20D5A6C48();
  v5[10] = sub_20D5A6C18();
  v5[11] = v6;
  return swift_task_switch();
}

uint64_t sub_20D598DBC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_20D598E10;
  return sub_20D591B20();
}

uint64_t sub_20D598E10(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[2] = v2;
  v3[3] = a1;
  v3[4] = v1;
  v3[13] = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D598E78()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D598ED0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 48);
  swift_release();
  if (v1)
    v1 = (void *)sub_20D5A6A98();
  objc_msgSend(*(id *)(v0 + 24), sel_notifyStateRestorationUserInfo_, v1);

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t QLRemoteUIHostViewController.previewItemDisplayState(_:wasAppliedToItemAt:)(uint64_t a1, uint64_t a2)
{
  return sub_20D59B9D0(a1, a2, (uint64_t)&unk_24C729168, (uint64_t)&unk_2549BA448);
}

uint64_t sub_20D5990B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v6[5] = sub_20D5A6C54();
  v6[6] = sub_20D5A6C48();
  v6[7] = sub_20D5A6C48();
  v6[8] = sub_20D5A6C18();
  v6[9] = v7;
  return swift_task_switch();
}

uint64_t sub_20D599130()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_20D599184;
  return sub_20D591B20();
}

uint64_t sub_20D599184(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 96) = a1;
  return swift_task_switch();
}

uint64_t sub_20D5991F8()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D599250()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0 + 96);
  v3 = *(_QWORD **)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  swift_release();
  __swift_project_boxed_opaque_existential_0(v3, v3[3]);
  objc_msgSend(v1, sel_previewItemDisplayState_wasAppliedToItemAtIndex_, sub_20D5A6F00(), v2);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t QLRemoteUIHostViewController.startTransition(withSourceViewProvider:transitionController:presenting:useInteractiveTransition:)(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v5 + 136) = a2;
  *(_QWORD *)(v5 + 144) = v4;
  *(_BYTE *)(v5 + 233) = a4;
  *(_BYTE *)(v5 + 232) = a3;
  *(_QWORD *)(v5 + 128) = a1;
  *(_QWORD *)(v5 + 152) = sub_20D5A6C54();
  *(_QWORD *)(v5 + 160) = sub_20D5A6C48();
  *(_QWORD *)(v5 + 168) = sub_20D5A6C48();
  *(_QWORD *)(v5 + 176) = sub_20D5A6C18();
  *(_QWORD *)(v5 + 184) = v6;
  return swift_task_switch();
}

uint64_t sub_20D599374()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 192) = v1;
  *v1 = v0;
  v1[1] = sub_20D5993C8;
  return sub_20D591B20();
}

uint64_t sub_20D5993C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 200) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 208) = a1;
  return swift_task_switch();
}

uint64_t sub_20D59943C()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  *(_QWORD *)(v0 + 216) = sub_20D5A6C18();
  *(_QWORD *)(v0 + 224) = v1;
  return swift_task_switch();
}

uint64_t sub_20D599494()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = *(void **)(v0 + 208);
  v2 = *(unsigned __int8 *)(v0 + 233);
  v3 = *(unsigned __int8 *)(v0 + 232);
  v5 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 136);
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_20D59954C;
  v6 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v7 = (_QWORD *)(v0 + 80);
  v7[1] = 0x40000000;
  v7[2] = sub_20D572224;
  v7[3] = &block_descriptor_68;
  v7[4] = v6;
  objc_msgSend(v1, sel_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler_, v5, v4, v3, v2, v7);
  return swift_continuation_await();
}

uint64_t sub_20D59954C()
{
  return swift_task_switch();
}

uint64_t sub_20D599590()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5995CC()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D599624()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  swift_release();
  if (qword_2549B7F68 != -1)
    swift_once();
  v1 = *(void **)(v0 + 200);
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 200);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 120) = v12;
    sub_20D5A6DB0();
    *v10 = v12;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to start transition: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v10, -1, -1);
    MEMORY[0x212BA4658](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59994C(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  *(_QWORD *)(v6 + 32) = a5;
  *(_QWORD *)(v6 + 40) = a6;
  *(_BYTE *)(v6 + 73) = a4;
  *(_BYTE *)(v6 + 72) = a3;
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  sub_20D5A6C54();
  *(_QWORD *)(v6 + 48) = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D5999C4()
{
  uint64_t v0;
  void *v1;
  const void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD *v6;

  v1 = *(void **)(v0 + 40);
  v2 = *(const void **)(v0 + 32);
  v3 = *(void **)(v0 + 16);
  swift_release();
  *(_QWORD *)(v0 + 56) = _Block_copy(v2);
  v4 = v3;
  swift_unknownObjectRetain();
  v5 = v1;
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v6;
  *v6 = v0;
  v6[1] = sub_20D599A54;
  return QLRemoteUIHostViewController.startTransition(withSourceViewProvider:transitionController:presenting:useInteractiveTransition:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 72), *(_BYTE *)(v0 + 73));
}

uint64_t sub_20D599A54()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  void *v3;
  uint64_t v5;

  v1 = *(void (***)(_QWORD))(*v0 + 56);
  v2 = *(void **)(*v0 + 40);
  v3 = *(void **)(*v0 + 16);
  v5 = *v0;
  swift_task_dealloc();

  swift_unknownObjectRelease();
  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.tearDownTransition(_:)(Swift::Bool a1)
{
  sub_20D59DA48(a1, (uint64_t)&unk_24C7291A8, (uint64_t)&unk_2549BA460, (void (*)(char *, uint64_t, uint64_t))sub_20D5847D0);
}

uint64_t sub_20D599AEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v5 + 88) = a5;
  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = sub_20D5A6C54();
  *(_QWORD *)(v5 + 32) = sub_20D5A6C48();
  *(_QWORD *)(v5 + 40) = sub_20D5A6C48();
  *(_QWORD *)(v5 + 48) = sub_20D5A6C18();
  *(_QWORD *)(v5 + 56) = v6;
  return swift_task_switch();
}

uint64_t sub_20D599B6C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_20D599BC0;
  return sub_20D591B20();
}

uint64_t sub_20D599BC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t sub_20D599C34()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D599C8C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 80);
  v2 = *(unsigned __int8 *)(v0 + 88);
  swift_release();
  objc_msgSend(v1, sel_tearDownTransition_, v2);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D599CE4()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D599D3C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.setLoading(_:)(Swift::String a1)
{
  sub_20D59A080(a1._countAndFlagsBits, (uint64_t)a1._object, (uint64_t)&unk_24C7291D0, (uint64_t)&unk_2549BA470, (void (*)(char *, uint64_t, _QWORD *))sub_20D5847D0);
}

uint64_t sub_20D599DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v6[5] = sub_20D5A6C54();
  v6[6] = sub_20D5A6C48();
  v6[7] = sub_20D5A6C48();
  v6[8] = sub_20D5A6C18();
  v6[9] = v7;
  return swift_task_switch();
}

uint64_t sub_20D599E28()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_20D599E7C;
  return sub_20D591B20();
}

uint64_t sub_20D599E7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 96) = a1;
  return swift_task_switch();
}

uint64_t sub_20D599EF0()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D599F48()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 96);
  swift_release();
  v2 = (void *)sub_20D5A6AD4();
  objc_msgSend(v1, sel_setLoadingString_, v2);

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D599FBC()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59A014()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.overrideParentApplicationDisplayIdentifier(withIdentifier:)(Swift::String withIdentifier)
{
  sub_20D59A080(withIdentifier._countAndFlagsBits, (uint64_t)withIdentifier._object, (uint64_t)&unk_24C7291F8, (uint64_t)&unk_2549BA480, (void (*)(char *, uint64_t, _QWORD *))sub_20D592B84);
}

uint64_t sub_20D59A080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t, _QWORD *))
{
  void *v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;

  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6C60();
  v13 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 0, 1, v13);
  sub_20D5A6C54();
  v14 = v5;
  swift_bridgeObjectRetain();
  v15 = sub_20D5A6C48();
  v16 = (_QWORD *)swift_allocObject();
  v17 = MEMORY[0x24BEE6930];
  v16[2] = v15;
  v16[3] = v17;
  v16[4] = v14;
  v16[5] = a1;
  v16[6] = a2;
  a5(v12, a4, v16);
  return swift_release();
}

uint64_t sub_20D59A194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  v6[6] = sub_20D5A6C54();
  v6[7] = sub_20D5A6C48();
  v6[8] = sub_20D5A6C48();
  v6[9] = sub_20D5A6C18();
  v6[10] = v7;
  return swift_task_switch();
}

uint64_t sub_20D59A214()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v1;
  *v1 = v0;
  v1[1] = sub_20D59A268;
  return sub_20D591B20();
}

uint64_t sub_20D59A268(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 96) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 104) = a1;
  return swift_task_switch();
}

uint64_t sub_20D59A2DC()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59A334()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 104);
  swift_release();
  v2 = (void *)sub_20D5A6AD4();
  objc_msgSend(v1, sel_overrideParentApplicationDisplayIdentifierWithIdentifier_, v2);

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59A3A4()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59A3FC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  swift_release();
  if (qword_2549B7F68 != -1)
    swift_once();
  v1 = *(void **)(v0 + 96);
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 96);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v12;
    sub_20D5A6DB0();
    *v10 = v12;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to override parent application display identifier: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v10, -1, -1);
    MEMORY[0x212BA4658](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59A5EC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(char *, uint64_t, _QWORD *))
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v22;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_20D5A6AF8();
  v14 = v13;
  v15 = a1;
  sub_20D5A6C60();
  v16 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v11, 0, 1, v16);
  sub_20D5A6C54();
  v17 = v15;
  swift_bridgeObjectRetain();
  v18 = sub_20D5A6C48();
  v19 = (_QWORD *)swift_allocObject();
  v20 = MEMORY[0x24BEE6930];
  v19[2] = v18;
  v19[3] = v20;
  v19[4] = v17;
  v19[5] = v12;
  v19[6] = v14;
  a6(v11, a5, v19);

  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t QLRemoteUIHostViewController.preparePreviewCollectionForInvalidation()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[16] = v0;
  v1[17] = sub_20D5A6C54();
  v1[18] = sub_20D5A6C48();
  v1[19] = sub_20D5A6C48();
  v1[20] = sub_20D5A6C18();
  v1[21] = v2;
  return swift_task_switch();
}

uint64_t sub_20D59A7A8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v1;
  *v1 = v0;
  v1[1] = sub_20D59A7FC;
  return sub_20D591B20();
}

uint64_t sub_20D59A7FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 184) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 192) = a1;
  return swift_task_switch();
}

uint64_t sub_20D59A870()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  *(_QWORD *)(v0 + 200) = sub_20D5A6C18();
  *(_QWORD *)(v0 + 208) = v1;
  return swift_task_switch();
}

uint64_t sub_20D59A8C8()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)v0[24];
  v0[2] = v0;
  v0[3] = sub_20D59A954;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_20D572224;
  v3[3] = &block_descriptor_82;
  v3[4] = v2;
  objc_msgSend(v1, sel_preparePreviewCollectionForInvalidationWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_20D59A954()
{
  return swift_task_switch();
}

uint64_t sub_20D59A998()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59A9F0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  swift_release();
  if (qword_2549B7F68 != -1)
    swift_once();
  v1 = *(void **)(v0 + 184);
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 184);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 120) = v12;
    sub_20D5A6DB0();
    *v10 = v12;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to prepare preview collection for invalidation: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v10, -1, -1);
    MEMORY[0x212BA4658](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59ACE0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_20D5A6C54();
  v2[4] = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59AD4C()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_20D5A220C;
  return QLRemoteUIHostViewController.preparePreviewCollectionForInvalidation()();
}

uint64_t QLRemoteUIHostViewController.invalidateService()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[16] = v0;
  v1[17] = sub_20D5A6C54();
  v1[18] = sub_20D5A6C48();
  v1[19] = sub_20D5A6C48();
  v1[20] = sub_20D5A6C18();
  v1[21] = v2;
  return swift_task_switch();
}

uint64_t sub_20D59AE30()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[22] = *(_QWORD *)(v0[16] + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  v1 = (_QWORD *)swift_task_alloc();
  v0[23] = v1;
  *v1 = v0;
  v1[1] = sub_20D59AE88;
  return sub_20D591B20();
}

uint64_t sub_20D59AE88(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 192) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 200) = a1;
  return swift_task_switch();
}

uint64_t sub_20D59AEFC()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  *(_QWORD *)(v0 + 208) = sub_20D5A6C18();
  *(_QWORD *)(v0 + 216) = v1;
  return swift_task_switch();
}

uint64_t sub_20D59AF54()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)v0[25];
  v0[2] = v0;
  v0[3] = sub_20D59AFE0;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_20D572224;
  v3[3] = &block_descriptor_84;
  v3[4] = v2;
  objc_msgSend(v1, sel_invalidateServiceWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_20D59AFE0()
{
  return swift_task_switch();
}

uint64_t sub_20D59B024()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 224) = v1;
  *v1 = v0;
  v1[1] = sub_20D59B06C;
  return sub_20D59200C();
}

uint64_t sub_20D59B06C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D59B0B8()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59B0F4()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59B14C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  swift_release();
  if (qword_2549B7F68 != -1)
    swift_once();
  v1 = *(void **)(v0 + 192);
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 192);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 120) = v12;
    sub_20D5A6DB0();
    *v10 = v12;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to invalidate service: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v10, -1, -1);
    MEMORY[0x212BA4658](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59B43C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_20D5A6C54();
  v2[4] = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59B4A8()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_20D59B510;
  return QLRemoteUIHostViewController.invalidateService()();
}

uint64_t sub_20D59B510()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  uint64_t v4;

  v1 = *(void (***)(_QWORD))(*v0 + 40);
  v2 = *(void **)(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t QLRemoteUIHostViewController.hostViewControlerTransition(to:animated:)(uint64_t a1, char a2)
{
  return sub_20D59B588(a1, a2, (uint64_t)&unk_24C729250, (uint64_t)&unk_2549BA4A0);
}

uint64_t sub_20D59B588(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6C60();
  v11 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  sub_20D5A6C54();
  v12 = v4;
  v13 = sub_20D5A6C48();
  v14 = swift_allocObject();
  v15 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = v15;
  *(_QWORD *)(v14 + 32) = v12;
  *(_QWORD *)(v14 + 40) = a1;
  *(_BYTE *)(v14 + 48) = a2;
  sub_20D5847D0((uint64_t)v10, a4, v14);
  return swift_release();
}

uint64_t sub_20D59B688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v6 + 96) = a6;
  *(_QWORD *)(v6 + 16) = a4;
  *(_QWORD *)(v6 + 24) = a5;
  *(_QWORD *)(v6 + 32) = sub_20D5A6C54();
  *(_QWORD *)(v6 + 40) = sub_20D5A6C48();
  *(_QWORD *)(v6 + 48) = sub_20D5A6C48();
  *(_QWORD *)(v6 + 56) = sub_20D5A6C18();
  *(_QWORD *)(v6 + 64) = v7;
  return swift_task_switch();
}

uint64_t sub_20D59B708()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = sub_20D59B75C;
  return sub_20D591B20();
}

uint64_t sub_20D59B75C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 80) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 88) = a1;
  return swift_task_switch();
}

uint64_t sub_20D59B7D0()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59B828()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 88);
  v2 = *(unsigned __int8 *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 24);
  swift_release();
  objc_msgSend(v1, sel_hostViewControlerTransitionToState_animated_, v3, v2);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59B8A4(void *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1;
  sub_20D5A6C60();
  v14 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 0, 1, v14);
  sub_20D5A6C54();
  v15 = v13;
  v16 = sub_20D5A6C48();
  v17 = swift_allocObject();
  v18 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v17 + 16) = v16;
  *(_QWORD *)(v17 + 24) = v18;
  *(_QWORD *)(v17 + 32) = v15;
  *(_QWORD *)(v17 + 40) = a3;
  *(_BYTE *)(v17 + 48) = a4;
  sub_20D5847D0((uint64_t)v12, a6, v17);

  return swift_release();
}

uint64_t QLRemoteUIHostViewController.setPreviewItemDisplayState(_:onItemAt:)(uint64_t a1, uint64_t a2)
{
  return sub_20D59B9D0(a1, a2, (uint64_t)&unk_24C729278, (uint64_t)&unk_2549BA4B0);
}

uint64_t sub_20D59B9D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v17[2];

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6C60();
  v11 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  sub_20D570648(a1, (uint64_t)v17);
  sub_20D5A6C54();
  v12 = v4;
  v13 = sub_20D5A6C48();
  v14 = swift_allocObject();
  v15 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = v15;
  *(_QWORD *)(v14 + 32) = v12;
  sub_20D578C6C(v17, (_OWORD *)(v14 + 40));
  *(_QWORD *)(v14 + 72) = a2;
  sub_20D5847D0((uint64_t)v10, a4, v14);
  return swift_release();
}

uint64_t sub_20D59BAF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  v6[5] = sub_20D5A6C54();
  v6[6] = sub_20D5A6C48();
  v6[7] = sub_20D5A6C48();
  v6[8] = sub_20D5A6C18();
  v6[9] = v7;
  return swift_task_switch();
}

uint64_t sub_20D59BB70()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_20D59BBC4;
  return sub_20D591B20();
}

uint64_t sub_20D59BBC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 96) = a1;
  return swift_task_switch();
}

uint64_t sub_20D59BC38()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59BC90()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0 + 96);
  v3 = *(_QWORD **)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  swift_release();
  __swift_project_boxed_opaque_existential_0(v3, v3[3]);
  objc_msgSend(v1, sel_setPreviewItemDisplayState_onItemAtIndex_, sub_20D5A6F00(), v2);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59BD2C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v19[2];
  _BYTE v20[32];

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectRetain();
  v12 = a1;
  sub_20D5A6DC8();
  swift_unknownObjectRelease();
  sub_20D5A6C60();
  v13 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 0, 1, v13);
  sub_20D570648((uint64_t)v20, (uint64_t)v19);
  sub_20D5A6C54();
  v14 = v12;
  v15 = sub_20D5A6C48();
  v16 = swift_allocObject();
  v17 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = v17;
  *(_QWORD *)(v16 + 32) = v14;
  sub_20D578C6C(v19, (_OWORD *)(v16 + 40));
  *(_QWORD *)(v16 + 72) = a4;
  sub_20D5847D0((uint64_t)v11, a6, v16);

  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v20);
}

uint64_t QLRemoteUIHostViewController.prepareForActionSheetPresentation()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[16] = v0;
  v1[17] = sub_20D5A6C54();
  v1[18] = sub_20D5A6C48();
  v1[19] = sub_20D5A6C48();
  v1[20] = sub_20D5A6C18();
  v1[21] = v2;
  return swift_task_switch();
}

uint64_t sub_20D59BEF8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v1;
  *v1 = v0;
  v1[1] = sub_20D59BF4C;
  return sub_20D591B20();
}

uint64_t sub_20D59BF4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 184) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 192) = a1;
  return swift_task_switch();
}

uint64_t sub_20D59BFC0()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  *(_QWORD *)(v0 + 200) = sub_20D5A6C18();
  *(_QWORD *)(v0 + 208) = v1;
  return swift_task_switch();
}

uint64_t sub_20D59C018()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)v0[24];
  v0[2] = v0;
  v0[3] = sub_20D59C0A4;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_20D572224;
  v3[3] = &block_descriptor_95;
  v3[4] = v2;
  objc_msgSend(v1, sel_prepareForActionSheetPresentationWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_20D59C0A4()
{
  return swift_task_switch();
}

uint64_t sub_20D59C0E8()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59C124()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59C17C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;

  swift_release();
  if (qword_2549B7F68 != -1)
    swift_once();
  v1 = *(void **)(v0 + 184);
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 184);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 120) = v12;
    sub_20D5A6DB0();
    *v10 = v12;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to prepare for action sheet presentation: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v10, -1, -1);
    MEMORY[0x212BA4658](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59C46C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_20D5A6C54();
  v2[4] = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59C4D8()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_20D59C540;
  return QLRemoteUIHostViewController.prepareForActionSheetPresentation()();
}

uint64_t sub_20D59C540()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void (**v5)(_QWORD);

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 40);
  v3 = *(void **)(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc();

  if (v2)
  {
    v5 = *(void (***)(_QWORD))(v1 + 40);
    v5[2](v5);
    _Block_release(v5);
  }
  return (*(uint64_t (**)(void))(v4 + 8))();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.actionSheetDidDismiss()()
{
  sub_20D59C7F0((uint64_t)&unk_24C7292B8, (uint64_t)&unk_2549BA4C8, (void (*)(char *, uint64_t, _QWORD *))sub_20D5847D0);
}

uint64_t sub_20D59C5CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a4;
  v4[3] = sub_20D5A6C54();
  v4[4] = sub_20D5A6C48();
  v4[5] = sub_20D5A6C48();
  v4[6] = sub_20D5A6C18();
  v4[7] = v5;
  return swift_task_switch();
}

uint64_t sub_20D59C648()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_20D59C69C;
  return sub_20D591B20();
}

uint64_t sub_20D59C69C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t sub_20D59C710()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59C768()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 80);
  swift_release();
  objc_msgSend(v1, sel_actionSheetDidDismiss);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.documentMenuActionWillBegin()()
{
  sub_20D59C7F0((uint64_t)&unk_24C7292E0, (uint64_t)&unk_2549BA4D8, (void (*)(char *, uint64_t, _QWORD *))sub_20D584904);
}

uint64_t sub_20D59C7F0(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t, _QWORD *))
{
  void *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6C60();
  v9 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  sub_20D5A6C54();
  v10 = v3;
  v11 = sub_20D5A6C48();
  v12 = (_QWORD *)swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  v12[2] = v11;
  v12[3] = v13;
  v12[4] = v10;
  a3(v8, a2, v12);
  return swift_release();
}

uint64_t sub_20D59C8E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a1;
  v4[3] = a4;
  v4[4] = sub_20D5A6C54();
  v4[5] = sub_20D5A6C48();
  v4[6] = sub_20D5A6C48();
  v4[7] = sub_20D5A6C18();
  v4[8] = v5;
  return swift_task_switch();
}

uint64_t sub_20D59C964()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = sub_20D59C9B8;
  return sub_20D591B20();
}

uint64_t sub_20D59C9B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 80) = a1;
  *(_QWORD *)(v3 + 88) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D59CA20()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59CA78()
{
  uint64_t v0;
  void *v1;
  unsigned __int8 v2;
  BOOL *v3;

  v1 = *(void **)(v0 + 80);
  swift_release();
  v2 = objc_msgSend(v1, sel_respondsToSelector_, sel_documentMenuActionWillBegin);
  if ((v2 & 1) != 0)
    objc_msgSend(*(id *)(v0 + 80), sel_documentMenuActionWillBegin);
  v3 = *(BOOL **)(v0 + 16);
  swift_unknownObjectRelease();
  *v3 = (v2 & 1) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59CAF4()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59CB4C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59CB9C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t, _QWORD *))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v18;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1;
  sub_20D5A6C60();
  v12 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 0, 1, v12);
  sub_20D5A6C54();
  v13 = v11;
  v14 = sub_20D5A6C48();
  v15 = (_QWORD *)swift_allocObject();
  v16 = MEMORY[0x24BEE6930];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v13;
  a5(v10, a4, v15);

  return swift_release();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.hostViewControllerBackgroundColorChanged(_:)(UIColor a1)
{
  sub_20D59CCC8(a1.super.isa, (uint64_t)&unk_24C729308, (uint64_t)&unk_2549BA4E8, (void (*)(char *, uint64_t, _QWORD *))sub_20D584904);
}

uint64_t sub_20D59CCC8(void *a1, uint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t, _QWORD *))
{
  void *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v18;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6C60();
  v11 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  sub_20D5A6C54();
  v12 = v4;
  v13 = a1;
  v14 = sub_20D5A6C48();
  v15 = (_QWORD *)swift_allocObject();
  v16 = MEMORY[0x24BEE6930];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v12;
  v15[5] = v13;
  a4(v10, a3, v15);
  return swift_release();
}

uint64_t sub_20D59CDCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = sub_20D5A6C54();
  v5[6] = sub_20D5A6C48();
  v5[7] = sub_20D5A6C48();
  v5[8] = sub_20D5A6C18();
  v5[9] = v6;
  return swift_task_switch();
}

uint64_t sub_20D59CE4C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_20D59CEA0;
  return sub_20D591B20();
}

uint64_t sub_20D59CEA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 88) = a1;
  *(_QWORD *)(v3 + 96) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D59CF08()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59CF60()
{
  uint64_t v0;
  void *v1;
  unsigned __int8 v2;
  BOOL *v3;

  v1 = *(void **)(v0 + 88);
  swift_release();
  v2 = objc_msgSend(v1, sel_respondsToSelector_, sel_hostViewControllerBackgroundColorChanged_);
  if ((v2 & 1) != 0)
    objc_msgSend(*(id *)(v0 + 88), sel_hostViewControllerBackgroundColorChanged_, *(_QWORD *)(v0 + 32));
  v3 = *(BOOL **)(v0 + 16);
  swift_unknownObjectRelease();
  *v3 = (v2 & 1) == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59CFE0()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59D038()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59D088(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(char *, uint64_t, _QWORD *))
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v22;

  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a3;
  v14 = a1;
  sub_20D5A6C60();
  v15 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 0, 1, v15);
  sub_20D5A6C54();
  v16 = v13;
  v17 = v14;
  v18 = sub_20D5A6C48();
  v19 = (_QWORD *)swift_allocObject();
  v20 = MEMORY[0x24BEE6930];
  v19[2] = v18;
  v19[3] = v20;
  v19[4] = v17;
  v19[5] = v16;
  a6(v12, a5, v19);

  return swift_release();
}

uint64_t QLRemoteUIHostViewController.saveIntoPhotoLibraryMedia(with:previewItemType:completionHandler:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v18;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6C60();
  v11 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_20D5A6C54();
  swift_retain();
  v13 = a1;
  sub_20D5A13D0(a3);
  v14 = sub_20D5A6C48();
  v15 = (_QWORD *)swift_allocObject();
  v16 = MEMORY[0x24BEE6930];
  v15[2] = v14;
  v15[3] = v16;
  v15[4] = v12;
  v15[5] = v13;
  v15[6] = a2;
  v15[7] = a3;
  v15[8] = a4;
  swift_release();
  sub_20D592B84((uint64_t)v10, (uint64_t)&unk_2549BA4F8, (uint64_t)v15);
  return swift_release();
}

uint64_t sub_20D59D304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;

  v8[10] = a7;
  v8[11] = a8;
  v8[8] = a5;
  v8[9] = a6;
  v8[7] = a4;
  v8[12] = sub_20D5A6C54();
  v8[13] = sub_20D5A6C48();
  v8[14] = sub_20D5A6C18();
  v8[15] = v9;
  return swift_task_switch();
}

uint64_t sub_20D59D37C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 56) + 16;
  swift_beginAccess();
  v2 = MEMORY[0x212BA4700](v1);
  *(_QWORD *)(v0 + 128) = v2;
  if (v2)
  {
    *(_QWORD *)(v0 + 136) = sub_20D5A6C48();
    *(_QWORD *)(v0 + 144) = sub_20D5A6C18();
    *(_QWORD *)(v0 + 152) = v3;
    return swift_task_switch();
  }
  else
  {
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20D59D424()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v1;
  *v1 = v0;
  v1[1] = sub_20D59D478;
  return sub_20D591B20();
}

uint64_t sub_20D59D478(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 168) = a1;
  *(_QWORD *)(v3 + 176) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D59D4E0()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20D59D518()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = v0[21];
  v3 = v0[8];
  v2 = v0[9];
  v0[23] = sub_20D5A6C48();
  v4 = (_QWORD *)swift_task_alloc();
  v0[24] = v4;
  v4[2] = v1;
  v4[3] = v3;
  v4[4] = v2;
  v5 = (_QWORD *)swift_task_alloc();
  v0[25] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA770);
  *v5 = v0;
  v5[1] = sub_20D59D5EC;
  return sub_20D5A6EF4();
}

uint64_t sub_20D59D5EC()
{
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D59D654()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + 80);
  swift_release();
  v2 = *(void **)(v0 + 48);
  v3 = *(void **)(v0 + 128);
  if (v1)
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 80))(*(unsigned __int8 *)(v0 + 40), *(_QWORD *)(v0 + 48));
    swift_unknownObjectRelease();

  }
  else
  {
    swift_unknownObjectRelease();

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59D6DC()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20D59D714()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void (*v4)(_QWORD, void *);
  id v5;

  v1 = *(_QWORD *)(v0 + 80);
  swift_release();
  v2 = *(void **)(v0 + 176);
  v3 = *(void **)(v0 + 128);
  if (v1)
  {
    v4 = *(void (**)(_QWORD, void *))(v0 + 80);
    v5 = v2;
    v4(0, v2);

  }
  else
  {

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59D798(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA778);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  if ((objc_msgSend(a2, sel_respondsToSelector_, sel_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler_) & 1) == 0)return sub_20D5A6C30();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v12 + v11, (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_20D5A1F4C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20D575A98;
  aBlock[3] = &block_descriptor_390;
  v13 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(a2, sel_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler_, a3, a4, v13);
  _Block_release(v13);
  return swift_unknownObjectRelease();
}

uint64_t sub_20D59D928(int a1, id a2)
{
  id v2;

  v2 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA778);
  return sub_20D5A6C30();
}

Swift::Void __swiftcall QLRemoteUIHostViewController.setIsContentManaged(_:)(Swift::Bool a1)
{
  sub_20D59DA48(a1, (uint64_t)&unk_24C729380, (uint64_t)&unk_2549BA508, (void (*)(char *, uint64_t, uint64_t))sub_20D5847D0);
}

uint64_t sub_20D59DA48(char a1, uint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t, uint64_t))
{
  void *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6C60();
  v11 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  sub_20D5A6C54();
  v12 = v4;
  v13 = sub_20D5A6C48();
  v14 = swift_allocObject();
  v15 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = v15;
  *(_QWORD *)(v14 + 32) = v12;
  *(_BYTE *)(v14 + 40) = a1;
  a4(v10, a3, v14);
  return swift_release();
}

uint64_t sub_20D59DB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v5 + 88) = a5;
  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = sub_20D5A6C54();
  *(_QWORD *)(v5 + 32) = sub_20D5A6C48();
  *(_QWORD *)(v5 + 40) = sub_20D5A6C48();
  *(_QWORD *)(v5 + 48) = sub_20D5A6C18();
  *(_QWORD *)(v5 + 56) = v6;
  return swift_task_switch();
}

uint64_t sub_20D59DBC8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_20D59DC1C;
  return sub_20D591B20();
}

uint64_t sub_20D59DC1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 80) = a1;
  return swift_task_switch();
}

uint64_t sub_20D59DC90()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59DCE8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 80);
  v2 = *(unsigned __int8 *)(v0 + 88);
  swift_release();
  objc_msgSend(v1, sel_setIsContentManaged_, v2);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D59DD5C(void *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, void (*a6)(char *, uint64_t, uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1;
  sub_20D5A6C60();
  v14 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 0, 1, v14);
  sub_20D5A6C54();
  v15 = v13;
  v16 = sub_20D5A6C48();
  v17 = swift_allocObject();
  v18 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v17 + 16) = v16;
  *(_QWORD *)(v17 + 24) = v18;
  *(_QWORD *)(v17 + 32) = v15;
  *(_BYTE *)(v17 + 40) = a3;
  a6(v12, a5, v17);

  return swift_release();
}

uint64_t QLRemoteUIHostViewController.saveCurrentPreviewEditsSynchronously(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v2 + 152) = v1;
  *(_BYTE *)(v2 + 264) = a1;
  v3 = sub_20D5A67E0();
  *(_QWORD *)(v2 + 160) = v3;
  *(_QWORD *)(v2 + 168) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 176) = swift_task_alloc();
  *(_QWORD *)(v2 + 184) = sub_20D5A6C54();
  *(_QWORD *)(v2 + 192) = sub_20D5A6C48();
  *(_QWORD *)(v2 + 200) = sub_20D5A6C48();
  *(_QWORD *)(v2 + 208) = sub_20D5A6C18();
  *(_QWORD *)(v2 + 216) = v4;
  return swift_task_switch();
}

uint64_t sub_20D59DF1C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 224) = v1;
  *v1 = v0;
  v1[1] = sub_20D59DF70;
  return sub_20D591B20();
}

uint64_t sub_20D59DF70(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 232) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 240) = a1;
  return swift_task_switch();
}

uint64_t sub_20D59DFE4()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  *(_QWORD *)(v0 + 248) = sub_20D5A6C18();
  *(_QWORD *)(v0 + 256) = v1;
  return swift_task_switch();
}

uint64_t sub_20D59E03C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(void **)(v0 + 240);
  v2 = *(unsigned __int8 *)(v0 + 264);
  *(_QWORD *)(v0 + 56) = v0 + 120;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_20D59E0E0;
  v3 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v4 = (_QWORD *)(v0 + 80);
  v4[1] = 0x40000000;
  v4[2] = sub_20D5760E0;
  v4[3] = &block_descriptor_120;
  v4[4] = v3;
  objc_msgSend(v1, sel_saveCurrentPreviewEditsSynchronously_withCompletionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_20D59E0E0()
{
  return swift_task_switch();
}

uint64_t sub_20D59E124()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_unknownObjectRelease();
  swift_release();
  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_20D59E174()
{
  swift_release();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59E1CC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  swift_release();
  if (qword_2549B7F68 != -1)
    swift_once();
  v1 = *(void **)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 160);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2549BA300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_20D5A67C8();
  v9 = sub_20D5A6D14();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(void **)(v0 + 232);
  v13 = *(_QWORD *)(v0 + 168);
  v12 = *(_QWORD *)(v0 + 176);
  v14 = *(_QWORD *)(v0 + 160);
  if (v10)
  {
    v28 = *(_QWORD *)(v0 + 176);
    v15 = *(unsigned __int8 *)(v0 + 264);
    v27 = *(_QWORD *)(v0 + 168);
    v16 = swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v29 = v18;
    *(_DWORD *)v16 = 136315394;
    if (v15)
      v19 = 0x6F7268636E797361;
    else
      v19 = 0x6E6F7268636E7973;
    v26 = v14;
    if (v15)
      v20 = 0xEE00796C73756F6ELL;
    else
      v20 = 0xED0000796C73756FLL;
    *(_QWORD *)(v0 + 136) = sub_20D56FB0C(v19, v20, &v29);
    sub_20D5A6DB0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2112;
    v21 = v11;
    v22 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 144) = v22;
    sub_20D5A6DB0();
    *v17 = v22;

    _os_log_impl(&dword_20D4F5000, v8, v9, "Failed to save current preview edits %s: %@", (uint8_t *)v16, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v17, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v18, -1, -1);
    MEMORY[0x212BA4658](v16, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v26);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  v23 = *(void **)(v0 + 232);
  v24 = sub_20D5A65B8();

  if (v24 < 0)
    return sub_20D5A6E88();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v24, 0);
}

uint64_t sub_20D59E650(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 56) = a1;
  sub_20D5A6C54();
  *(_QWORD *)(v3 + 32) = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59E6C0()
{
  uint64_t v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = *(void **)(v0 + 24);
  v2 = *(const void **)(v0 + 16);
  swift_release();
  *(_QWORD *)(v0 + 40) = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v4;
  *v4 = v0;
  v4[1] = sub_20D59E730;
  return QLRemoteUIHostViewController.saveCurrentPreviewEditsSynchronously(_:)(*(_BYTE *)(v0 + 56));
}

uint64_t sub_20D59E730(uint64_t a1, void *a2)
{
  uint64_t *v2;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  uint64_t v8;

  v5 = *(void (***)(_QWORD, _QWORD, _QWORD))(*v2 + 40);
  v6 = *(void **)(*v2 + 24);
  v8 = *v2;
  swift_task_dealloc();

  ((void (**)(_QWORD, uint64_t, void *))v5)[2](v5, a1, a2);
  _Block_release(v5);

  return (*(uint64_t (**)(void))(v8 + 8))();
}

void sub_20D59E7B0(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel);
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  if (*(_BYTE *)(v1 + 17) == 1)
  {
    type metadata accessor for QLHostRemoteViewModel();
    swift_retain();
    sub_20D5A69FC();
    v2 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2549BA7B8));
    swift_retain();
    swift_retain();
    v3 = (void *)sub_20D5A68D0();
    sub_20D59EEB8(v3);
    swift_release();
    swift_release();

  }
  else
  {
    sub_20D59E930(v1);
    swift_getKeyPath();
    sub_20D5A6684();
    swift_release();
    v4 = *(void **)(v1 + 32);
    if (v4)
      objc_msgSend(v4, sel_remoteViewControllerWasInvalidated);
  }
}

void sub_20D59E928()
{
  uint64_t v0;

  sub_20D59E7B0(*(_QWORD *)(v0 + 16));
}

void sub_20D59E930(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  v2 = objc_msgSend(objc_allocWithZone((Class)QLErrorItemViewController), sel_init);
  swift_getKeyPath();
  v10[0] = a1;
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    v4 = objc_msgSend(v3, sel_currentItem, v10[0]);
    v5 = objc_msgSend(v4, sel_createPreviewContext);
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v2;
  v10[4] = sub_20D5A21C4;
  v10[5] = v7;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_20D594060;
  v10[3] = &block_descriptor_481;
  v8 = _Block_copy(v10);
  v9 = v2;
  swift_release();
  objc_msgSend(v9, sel_loadPreviewControllerWithContents_context_completionHandler_, v4, v5, v8);
  _Block_release(v8);

  swift_unknownObjectRelease();
}

uint64_t sub_20D59EAEC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  swift_beginAccess();
  v6 = MEMORY[0x212BA4700](a1 + 16);
  sub_20D5A6C54();
  v7 = sub_20D5A6C48();
  v8 = (_QWORD *)swift_allocObject();
  v9 = MEMORY[0x24BEE6930];
  v8[2] = v7;
  v8[3] = v9;
  v8[4] = v6;
  sub_20D592B84((uint64_t)v4, (uint64_t)&unk_2549BA7A8, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_20D59EBE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  sub_20D5A6C54();
  *(_QWORD *)(v4 + 24) = sub_20D5A6C48();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D59EC54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release();
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 16);
    sub_20D59ECF0();
    *(_QWORD *)(swift_task_alloc() + 16) = v2;
    *(_QWORD *)(swift_task_alloc() + 16) = v2;
    sub_20D5A666C();
    swift_task_dealloc();
    swift_task_dealloc();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_20D59ECF0()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;
  uint64_t v7;
  id result;
  void *v9;

  v1 = objc_msgSend(v0, sel_childViewControllers);
  sub_20D577BD0(0, &qword_2549BA7B0);
  v2 = sub_20D5A6BE8();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
    return (id)swift_bridgeObjectRelease_n();
  }
LABEL_12:
  swift_bridgeObjectRetain();
  v3 = sub_20D5A6EA0();
  if (!v3)
    return (id)swift_bridgeObjectRelease_n();
LABEL_3:
  for (i = 4; ; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0)
      v5 = (id)MEMORY[0x212BA368C](i - 4, v2);
    else
      v5 = *(id *)(v2 + 8 * i);
    v6 = v5;
    v7 = i - 3;
    if (__OFADD__(i - 4, 1))
    {
      __break(1u);
      goto LABEL_12;
    }
    objc_msgSend(v5, sel_willMoveToParentViewController_, 0);
    result = objc_msgSend(v6, sel_view);
    if (!result)
      break;
    v9 = result;
    objc_msgSend(result, sel_removeFromSuperview);

    objc_msgSend(v6, sel_removeFromParentViewController);
    if (v7 == v3)
      return (id)swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

void sub_20D59EE60(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = a2 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x212BA4700](v4);
  if (v5)
  {
    v6 = (void *)v5;
    sub_20D59EEB8(a3);

  }
}

void sub_20D59EEB8(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;

  v2 = v1;
  v32 = objc_msgSend(a1, sel_view);
  if (!v32)
    goto LABEL_13;
  v4 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v32, sel_setBackgroundColor_, v4);

  objc_msgSend(v32, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v2, sel_addChildViewController_, a1);
  v5 = objc_msgSend(v2, sel_view);
  if (!v5)
  {
    __break(1u);
    goto LABEL_9;
  }
  v6 = v5;
  objc_msgSend(v5, sel_addSubview_, v32);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA7C0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_20D5B2390;
  v8 = objc_msgSend(v32, sel_topAnchor);
  v9 = objc_msgSend(v2, sel_view);
  if (!v9)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, sel_topAnchor);

  v12 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v11);
  *(_QWORD *)(v7 + 32) = v12;
  v13 = objc_msgSend(v32, sel_bottomAnchor);
  v14 = objc_msgSend(v2, sel_view);
  if (!v14)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v15 = v14;
  v16 = objc_msgSend(v14, sel_bottomAnchor);

  v17 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v16);
  *(_QWORD *)(v7 + 40) = v17;
  v18 = objc_msgSend(v32, sel_leadingAnchor);
  v19 = objc_msgSend(v2, sel_view);
  if (v19)
  {
    v20 = v19;
    v21 = objc_msgSend(v19, sel_leadingAnchor);

    v22 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v21);
    *(_QWORD *)(v7 + 48) = v22;
    v23 = objc_msgSend(v32, sel_trailingAnchor);
    v24 = objc_msgSend(v2, sel_view);
    if (v24)
    {
      v25 = v24;
      v26 = (void *)objc_opt_self();
      v27 = objc_msgSend(v25, sel_trailingAnchor);

      v28 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v27);
      *(_QWORD *)(v7 + 56) = v28;
      sub_20D5A6BF4();
      sub_20D577BD0(0, (unint64_t *)&qword_2549B9050);
      v29 = (void *)sub_20D5A6BDC();
      swift_bridgeObjectRelease();
      objc_msgSend(v26, sel_activateConstraints_, v29);

      objc_msgSend(a1, sel_didMoveToParentViewController_, v2);
      return;
    }
    goto LABEL_12;
  }
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
LABEL_13:
  sub_20D5A6E1C();
  swift_bridgeObjectRelease();
  v30 = a1;
  v31 = objc_msgSend(v30, sel_description);
  sub_20D5A6AF8();

  sub_20D5A6B88();
  swift_bridgeObjectRelease();
  sub_20D5A6E94();
  __break(1u);
}

void sub_20D59F310(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_20D59F364(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_20D577D2C;
  return v6();
}

uint64_t sub_20D59F3B8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_20D577D2C;
  return v7();
}

uint64_t sub_20D59F40C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_20D5A6C78();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_20D5A6C6C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_20D57C26C(a1, (uint64_t *)&unk_2549B97E0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20D5A6C18();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_20D59F558(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_20D5A21F8;
  return v6(a1);
}

uint64_t sub_20D59F5BC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_20D59F620;
  return v6(a1);
}

uint64_t sub_20D59F620()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20D59F66C()
{
  _QWORD *v0;
  uint64_t v1;

  v0[15] = sub_20D5A6C54();
  v0[16] = sub_20D5A6C48();
  v0[17] = sub_20D5A6C18();
  v0[18] = v1;
  return swift_task_switch();
}

uint64_t sub_20D59F6D8()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;
  _QWORD *v3;

  type metadata accessor for QLRemoteUIHostViewController();
  v1 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v2 = OBJC_IVAR____TtC9QuickLook28QLRemoteUIHostViewController_viewModel;
  v0[19] = v1;
  v0[20] = v2;
  v0[21] = *(_QWORD *)&v1[v2];
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[22] = v3;
  *v3 = v0;
  v3[1] = sub_20D59F758;
  return sub_20D590BAC();
}

uint64_t sub_20D59F758()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    v2[24] = sub_20D5A6C48();
    v2[25] = sub_20D5A6C18();
    v2[26] = v3;
  }
  return swift_task_switch();
}

uint64_t sub_20D59F7FC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 216) = v1;
  *v1 = v0;
  v1[1] = sub_20D59F848;
  return sub_20D591B20();
}

uint64_t sub_20D59F848(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 224) = a1;
  *(_QWORD *)(v3 + 232) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D59F8B0()
{
  swift_release();
  return swift_task_switch();
}

id sub_20D59F8E8()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v2 = result;
    objc_msgSend(*(id *)(v0 + 224), sel_setNotificationCenter_, result);

    swift_unknownObjectRelease();
    *(_QWORD *)(v0 + 240) = sub_20D5A6C48();
    *(_QWORD *)(v0 + 248) = sub_20D5A6C18();
    *(_QWORD *)(v0 + 256) = v3;
    return (id)swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D59F9A0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 264) = v1;
  *v1 = v0;
  v1[1] = sub_20D59F9EC;
  return sub_20D591B20();
}

uint64_t sub_20D59F9EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 272) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 280) = a1;
  return swift_task_switch();
}

uint64_t sub_20D59FA60()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20D59FA98()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;

  swift_release();
  v1 = *(void **)(v0 + 232);
  if (qword_2549B7F68 != -1)
    swift_once();
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v1;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 112) = v10;
    sub_20D5A6DB0();
    *v8 = v10;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to create remote preview collection: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v8, -1, -1);
    MEMORY[0x212BA4658](v7, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 152));
}

uint64_t sub_20D59FC68()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20D59FCA0()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)v0[35];
  v0[6] = sub_20D593FB4;
  v0[7] = 0;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_20D594018;
  v0[5] = &block_descriptor_459;
  v2 = _Block_copy(v0 + 2);
  objc_msgSend(v1, sel_getNetworkObserverWithCompletionBlock_, v2);
  _Block_release(v2);
  swift_unknownObjectRelease();
  v0[36] = sub_20D5A6C48();
  v0[37] = sub_20D5A6C18();
  v0[38] = v3;
  return swift_task_switch();
}

uint64_t sub_20D59FD74()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 312) = v1;
  *v1 = v0;
  v1[1] = sub_20D59FDC0;
  return sub_20D591D58();
}

uint64_t sub_20D59FDC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 320) = a1;
  *(_QWORD *)(v3 + 328) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D59FE28()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20D59FE60()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;

  swift_release();
  v1 = *(void **)(v0 + 272);
  if (qword_2549B7F68 != -1)
    swift_once();
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v1;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 112) = v10;
    sub_20D5A6DB0();
    *v8 = v10;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to create remote preview collection: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v8, -1, -1);
    MEMORY[0x212BA4658](v7, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 152));
}

uint64_t sub_20D5A0030()
{
  _QWORD *v0;
  uint64_t v1;

  swift_release();
  v0[42] = sub_20D5A6C48();
  v0[43] = sub_20D5A6C18();
  v0[44] = v1;
  return swift_task_switch();
}

uint64_t sub_20D5A0098()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v1;
  *v1 = v0;
  v1[1] = sub_20D5A00E4;
  return sub_20D591B20();
}

uint64_t sub_20D5A00E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 368) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 376) = a1;
  return swift_task_switch();
}

uint64_t sub_20D5A0158()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20D5A0190()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;

  swift_release();
  v1 = *(void **)(v0 + 328);
  if (qword_2549B7F68 != -1)
    swift_once();
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v1;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 112) = v10;
    sub_20D5A6DB0();
    *v8 = v10;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to create remote preview collection: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v8, -1, -1);
    MEMORY[0x212BA4658](v7, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 152));
}

uint64_t sub_20D5A0360()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20D5A0398()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = (void *)v0[47];
  v2 = v0[40];
  swift_release();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  v0[12] = sub_20D5A206C;
  v0[13] = v3;
  v0[8] = MEMORY[0x24BDAC760];
  v0[9] = 1107296256;
  v0[10] = sub_20D594060;
  v0[11] = &block_descriptor_467;
  v4 = _Block_copy(v0 + 8);
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(v1, sel_getPreviewCollectionUUIDWithCompletionHandlerWithCompletionHandler_, v4);
  _Block_release(v4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return ((uint64_t (*)(_QWORD))v0[1])(v0[19]);
}

uint64_t sub_20D5A0478()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20D5A04B0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;

  swift_release();
  swift_unknownObjectRelease();
  v1 = *(void **)(v0 + 368);
  if (qword_2549B7F68 != -1)
    swift_once();
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v1;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 112) = v10;
    sub_20D5A6DB0();
    *v8 = v10;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to create remote preview collection: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v8, -1, -1);
    MEMORY[0x212BA4658](v7, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 152));
}

uint64_t sub_20D5A068C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;

  swift_release();
  swift_release();
  v1 = *(void **)(v0 + 184);
  if (qword_2549B7F68 != -1)
    swift_once();
  v2 = sub_20D5A67E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_2549BA300);
  v3 = v1;
  v4 = v1;
  v5 = sub_20D5A67C8();
  v6 = sub_20D5A6D14();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v1;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 112) = v10;
    sub_20D5A6DB0();
    *v8 = v10;

    _os_log_impl(&dword_20D4F5000, v5, v6, "Failed to create remote preview collection: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA3D0);
    swift_arrayDestroy();
    MEMORY[0x212BA4658](v8, -1, -1);
    MEMORY[0x212BA4658](v7, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 152));
}

uint64_t sub_20D5A0870()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A0878(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D577D2C;
  return sub_20D594410(a1, v4, v5, v6, v7);
}

uint64_t sub_20D5A08F8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_20D577D2C;
  return sub_20D594ADC(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_20D5A0978()
{
  return objectdestroy_12Tm();
}

uint64_t sub_20D5A0980(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_20D577D2C;
  return sub_20D594F8C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_20D5A0A2C()
{
  uint64_t v0;

  return sub_20D58FB08(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_20D5A0A44()
{
  return objectdestroy_12Tm();
}

uint64_t objectdestroy_12Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20D5A0A94(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_20D577D2C;
  return sub_20D5954F8(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_20D5A0B28()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A0B30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_20D577D2C;
  return sub_20D5957B4(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_20D5A0BB0()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A0BB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D577D2C;
  return sub_20D595A44(a1, v4, v5, v6, v7);
}

uint64_t sub_20D5A0C34()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A0C3C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20D577D2C;
  return sub_20D595CCC(a1, v4, v5, v6);
}

uint64_t sub_20D5A0CA8()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A0CB0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20D577D2C;
  return sub_20D5977F8(a1, v4, v5, v6);
}

uint64_t sub_20D5A0D1C()
{
  return objectdestroy_48Tm();
}

uint64_t sub_20D5A0D24(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D577D2C;
  return sub_20D598194(a1, v4, v5, v7, v6);
}

uint64_t sub_20D5A0D9C()
{
  return objectdestroy_48Tm();
}

uint64_t sub_20D5A0DA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_20D577D2C;
  return sub_20D598530(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_20D5A0E24()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A0E2C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D577D2C;
  return sub_20D59894C(a1, v4, v5, v7, v6);
}

uint64_t sub_20D5A0EA8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D577D2C;
  return sub_20D598D40(a1, v4, v5, v7, v6);
}

uint64_t sub_20D5A0F24(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (uint64_t)(v1 + 5);
  v8 = v1[9];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_20D577D2C;
  return sub_20D5990B0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_20D5A0FA8()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A0FB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D577D2C;
  return sub_20D599AEC(a1, v4, v5, v6, v7);
}

uint64_t sub_20D5A1030(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_20D577D2C;
  return sub_20D599DA8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_20D5A10B4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_20D577D2C;
  return sub_20D59A194(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_20D5A1134()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A113C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_20D577D2C;
  return sub_20D59B688(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_20D5A11C0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (uint64_t)(v1 + 5);
  v8 = v1[9];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_20D577D2C;
  return sub_20D59BAF0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_20D5A1244()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A124C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20D577D2C;
  return sub_20D59C5CC(a1, v4, v5, v6);
}

uint64_t sub_20D5A12B8()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A12C0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20D577D2C;
  return sub_20D59C8E8(a1, v4, v5, v6);
}

uint64_t sub_20D5A132C()
{
  return objectdestroy_48Tm();
}

uint64_t sub_20D5A1334(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D577D2C;
  return sub_20D59CDCC(a1, v4, v5, v7, v6);
}

uint64_t sub_20D5A13AC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_20D5A13D0(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_20D5A13E0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  if (*(_QWORD *)(v0 + 56))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D5A1424(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_20D577D2C;
  return sub_20D59D304(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_20D5A14B8()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A14C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D577D2C;
  return sub_20D59DB48(a1, v4, v5, v6, v7);
}

uint64_t sub_20D5A153C@<X0>(uint64_t a1@<X8>)
{
  return sub_20D5934D0(a1);
}

uint64_t sub_20D5A1560()
{
  return type metadata accessor for QLRemoteUIHostViewController();
}

void sub_20D5A1568()
{
  unint64_t v0;

  sub_20D5A1668();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for QLRemoteUIHostViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QLRemoteUIHostViewController.isAvailable.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of QLRemoteUIHostViewController.uuid.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of QLRemoteUIHostViewController.uuid.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of QLRemoteUIHostViewController.uuid.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

void sub_20D5A1668()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549BA558)
  {
    sub_20D5A6660();
    v0 = sub_20D5A6DA4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2549BA558);
  }
}

uint64_t sub_20D5A16BC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));

  return swift_deallocObject();
}

uint64_t sub_20D5A16E8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(_BYTE *)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_20D577D2C;
  return ((uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_2549BA560 + dword_2549BA560))(v2, v4, v3);
}

uint64_t sub_20D5A175C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D5A1780(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20D577D2C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2549BA590 + dword_2549BA590))(a1, v4);
}

uint64_t sub_20D5A17F0()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A17F8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_20D5A181C()
{
  return objectdestroy_48Tm();
}

uint64_t sub_20D5A1824()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A182C()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A1834()
{
  return objectdestroy_167Tm((void (*)(_QWORD))MEMORY[0x24BDAC738]);
}

uint64_t sub_20D5A1840()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_20D577D2C;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2549BA5C0 + dword_2549BA5C0))(v2, v3);
}

uint64_t sub_20D5A18B0()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A18B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_20D5779C0;
  return sub_20D59B688(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_20D5A1938()
{
  return objectdestroy_167Tm((void (*)(_QWORD))MEMORY[0x24BDAC738]);
}

uint64_t sub_20D5A1944()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_20D577D2C;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2549BA5F0 + dword_2549BA5F0))(v2, v3);
}

uint64_t sub_20D5A19B0()
{
  return objectdestroy_167Tm((void (*)(_QWORD))MEMORY[0x24BDAC738]);
}

uint64_t sub_20D5A19BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_20D577D2C;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2549BA610 + dword_2549BA610))(v2, v3);
}

uint64_t sub_20D5A1A30()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A1A38()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  _Block_release(*(const void **)(v0 + 40));

  return swift_deallocObject();
}

uint64_t sub_20D5A1A74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_BYTE *)(v0 + 32);
  v5 = *(_BYTE *)(v0 + 33);
  v7 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 48);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_20D577D2C;
  return ((uint64_t (*)(uint64_t, uint64_t, char, char, uint64_t, uint64_t))((char *)&dword_2549BA648
                                                                                 + dword_2549BA648))(v2, v3, v4, v5, v7, v6);
}

uint64_t objectdestroy_64Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0(v0 + 40);
  return swift_deallocObject();
}

uint64_t objectdestroy_60Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20D5A1B7C()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A1B84()
{
  return objectdestroy_48Tm();
}

uint64_t sub_20D5A1B8C()
{
  return objectdestroy_48Tm();
}

uint64_t objectdestroy_48Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_20D5A1BD4()
{
  return objectdestroy_167Tm((void (*)(_QWORD))MEMORY[0x24BDAC738]);
}

uint64_t sub_20D5A1BE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_20D577D2C;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2549BA690 + dword_2549BA690))(v2, v3);
}

uint64_t sub_20D5A1C4C()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A1C54()
{
  return objectdestroy_167Tm((void (*)(_QWORD))MEMORY[0x24BDAC738]);
}

uint64_t sub_20D5A1C60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_20D577D2C;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2549BA6C0 + dword_2549BA6C0))(v2, v3);
}

uint64_t sub_20D5A1CD0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_20D577D2C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2549BA6E0 + dword_2549BA6E0))(v2, v3, v4);
}

uint64_t objectdestroy_312Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_20D5A1D7C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_20D577D2C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2549BA700 + dword_2549BA700))(v2, v3, v4);
}

uint64_t sub_20D5A1DF0()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A1DF8()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A1E00()
{
  return objectdestroyTm_0();
}

uint64_t objectdestroy_8Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20D5A1E40()
{
  return objectdestroyTm_0();
}

uint64_t sub_20D5A1E48()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_20D5A1E6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_20D577D2C;
  return ((uint64_t (*)(uint64_t))((char *)&dword_2549BA750 + dword_2549BA750))(v2);
}

uint64_t sub_20D5A1EDC(uint64_t a1)
{
  uint64_t v1;

  return sub_20D59D798(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_20D5A1EE8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA778);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_20D5A1F4C(int a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA778);
  return sub_20D59D928(a1, a2);
}

uint64_t sub_20D5A1FAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20D577D2C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2549BA788 + dword_2549BA788))(a1, v4);
}

uint64_t sub_20D5A202C()
{
  uint64_t v0;

  return sub_20D58F818(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_20D5A2048()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

id sub_20D5A206C(id result)
{
  uint64_t v1;

  if (result)
    return objc_msgSend(*(id *)(v1 + 16), sel_configureAsAccessoryViewContainerForPreviewCollectionWithPreviewCollectionUUID_, result);
  return result;
}

uint64_t sub_20D5A2088()
{
  uint64_t v0;

  return sub_20D59EAEC(v0);
}

uint64_t sub_20D5A2090()
{
  return objectdestroyTm_0();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_20D5A20D0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20D5779C0;
  return sub_20D59EBE8(a1, v4, v5, v6);
}

uint64_t (*sub_20D5A213C())()
{
  swift_allocObject();
  swift_unknownObjectWeakInit();
  return sub_20D5A2088;
}

uint64_t sub_20D5A2188()
{
  return objectdestroy_167Tm((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t objectdestroy_167Tm(void (*a1)(_QWORD))
{
  uint64_t v1;

  a1(*(_QWORD *)(v1 + 16));

  return swift_deallocObject();
}

void sub_20D5A21C4(uint64_t a1)
{
  uint64_t v1;

  sub_20D59EE60(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_20D5A21CC()
{
  uint64_t v0;

  return sub_20D58F8A4(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_20D5A2220()
{
  return sub_20D5A0A2C();
}

uint64_t sub_20D5A2234(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_20D5A2254()
{
  uint64_t (**v0)(void);

  return sub_20D5A2234(*v0);
}

uint64_t static QLAppExtensionSceneBuilder.buildBlock<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v7 = *(_QWORD *)(a2 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a2;
  *(_QWORD *)(v11 + 24) = a3;
  result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, v9, a2);
  *a4 = sub_20D5A2330;
  a4[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v11;
  return result;
}

uint64_t sub_20D5A2330@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 16) - 8) + 16))(a1, v1+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 16) - 8) + 80)));
}

uint64_t static QLAppExtensionSceneBuilder.buildBlock<A, B>(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t (**a7)@<X0>(uint64_t *a1@<X8>)@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  uint64_t (**v22)@<X0>(uint64_t *@<X8>);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (**v26)@<X0>(uint64_t *@<X8>);

  v24 = a5;
  v25 = a6;
  v26 = a7;
  v10 = *(_QWORD *)(a4 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v14 + 16))(v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a2, a4);
  v17 = (*(unsigned __int8 *)(v14 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v18 = (v15 + *(unsigned __int8 *)(v10 + 80) + v17) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v19 = (char *)swift_allocObject();
  *((_QWORD *)v19 + 2) = a3;
  *((_QWORD *)v19 + 3) = a4;
  v20 = v25;
  *((_QWORD *)v19 + 4) = v24;
  *((_QWORD *)v19 + 5) = v20;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v19[v17], v16, a3);
  result = (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 32))(&v19[v18], (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
  v22 = v26;
  *v26 = sub_20D5A2530;
  v22[1] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v19;
  return result;
}

uint64_t sub_20D5A24A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 16) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v1 - 8);
  v5 = (v3 + *(_QWORD *)(v2 + 64) + *(unsigned __int8 *)(v4 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v2 + 8))(v0 + v3);
  (*(void (**)(unint64_t, uint64_t))(v4 + 8))(v0 + v5, v1);
  return swift_deallocObject();
}

uint64_t sub_20D5A2530@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v2 = v1[2];
  v3 = v1[3];
  v4 = *(_QWORD *)(v2 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v3 - 8) + 80);
  return sub_20D5A2574((uint64_t)v1 + v5, (uint64_t)v1 + ((v5 + *(_QWORD *)(v4 + 64) + v6) & ~v6), v2, v3, *(_QWORD *)(v1[4] + 8), *(_QWORD *)(v1[5] + 8), a1);
}

uint64_t sub_20D5A2574@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;

  v22 = a7;
  v23 = a6;
  v20 = a5;
  v21 = a2;
  v10 = *(_QWORD *)(a4 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA8E0);
  sub_20D5A66F0();
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_20D5B2370;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, a3);
  sub_20D5A66E4();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v21, a4);
  result = sub_20D5A66E4();
  *v22 = v18;
  return result;
}

uint64_t QLAppExtension.configuration.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *, uint64_t, uint64_t);
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v3 = v2;
  v6 = *(_QWORD *)(a1 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - v10;
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v12((char *)&v19 - v10, v3, a1);
  v13 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a1;
  *(_QWORD *)(v14 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v14 + v13, v11, a1);
  v12(v9, v3, a1);
  sub_20D5844A4((uint64_t)v9, a1, a2, v15, &v20);
  v19 = v20;
  swift_getAssociatedTypeWitness();
  v17 = type metadata accessor for QLGlobalAppExtensionConfiguration(0, a1, a2, v16);
  swift_getAssociatedConformanceWitness();
  MEMORY[0x212BA45A4](&protocol conformance descriptor for QLGlobalAppExtensionConfiguration<A>, v17);
  return sub_20D5A66CC();
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_20D5A28C8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 32))();
}

uint64_t sub_20D5A2900@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 96);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 16))(a1, v4);
}

uint64_t sub_20D5A2964(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 80) - 8) + 32))(v2 + *(_QWORD *)(*(_QWORD *)v2 + 96), a1);
  return v2;
}

uint64_t sub_20D5A29B8(void *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t result;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = v1;
  v4 = *v1;
  v5 = *(_QWORD *)(*v1 + 80);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t)v2 + *(_QWORD *)(v4 + 96);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = *(_QWORD *)(v4 + 88);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 16))(v5, v10);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  objc_msgSend(a1, sel_setExportedObject_, v11);
  swift_unknownObjectRelease();
  v12 = (void *)objc_opt_self();
  v13 = objc_msgSend(v12, sel_interfaceWithProtocol_, &unk_254A1B1A8);
  objc_msgSend(a1, sel_setExportedInterface_, v13);

  v14 = objc_msgSend(v12, sel_interfaceWithProtocol_, &unk_254A05DB0);
  objc_msgSend(a1, sel_setRemoteObjectInterface_, v14);

  objc_msgSend(a1, sel_resume);
  v15 = objc_msgSend(a1, sel_exportedInterface);
  if (v15)
  {
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B8E40);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_20D5B2370;
    v18 = sub_20D577BD0(0, &qword_2549B8E58);
    *(_QWORD *)(v17 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8E60);
    *(_QWORD *)(v17 + 32) = v18;
    v19 = sub_20D577BD0(0, (unint64_t *)&qword_2549B9350);
    *(_QWORD *)(v17 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9358);
    *(_QWORD *)(v17 + 64) = v19;
    v20 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
    v21 = (void *)sub_20D5A6BDC();
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v20, sel_initWithArray_, v21);

    v37 = 0;
    result = sub_20D5A6CD8();
    if (!v37)
    {
      __break(1u);
      goto LABEL_12;
    }

    v24 = (void *)sub_20D5A6CCC();
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_setClasses_forSelector_argumentIndex_ofReply_, v24, sel_openWithSessionUUID_items_selectedIndex_bundleID_configuration_completionHandler_, 1, 0);

  }
  v25 = objc_msgSend(a1, sel_exportedInterface);
  if (v25)
  {
    v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B8E40);
    v27 = swift_allocObject();
    *(_OWORD *)(v27 + 16) = xmmword_20D5B2370;
    v28 = sub_20D577BD0(0, &qword_2549B8E58);
    *(_QWORD *)(v27 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B8E60);
    *(_QWORD *)(v27 + 32) = v28;
    v29 = sub_20D577BD0(0, (unint64_t *)&qword_2549B9350);
    *(_QWORD *)(v27 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_2549B9358);
    *(_QWORD *)(v27 + 64) = v29;
    v30 = objc_allocWithZone(MEMORY[0x24BDBCF20]);
    v31 = (void *)sub_20D5A6BDC();
    swift_bridgeObjectRelease();
    v32 = objc_msgSend(v30, sel_initWithArray_, v31);

    v37 = 0;
    result = sub_20D5A6CD8();
    if (v37)
    {

      v33 = (void *)sub_20D5A6CCC();
      swift_bridgeObjectRelease();
      objc_msgSend(v26, sel_setClasses_forSelector_argumentIndex_ofReply_, v33, sel_updateContentsWithSessionUUID_items_selectedIndex_completionHandler_, 1, 0);

      goto LABEL_7;
    }
LABEL_12:
    __break(1u);
    return result;
  }
LABEL_7:
  v34 = objc_msgSend(a1, sel_remoteObjectProxy);
  sub_20D5A6DC8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(qword_2549BA7C8);
  if (swift_dynamicCast())
    v35 = v36;
  else
    v35 = 0;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v35, v5, v10);
  swift_endAccess();
  return 1;
}

uint64_t QuickLookPreviewConfiguration.deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96));
  return v0;
}

uint64_t QuickLookPreviewConfiguration.__deallocating_deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96));
  return swift_deallocClassInstance();
}

uint64_t sub_20D5A2F34(void *a1)
{
  sub_20D5A29B8(a1);
  return 1;
}

uint64_t QuickLookPreviewAppExtension.configuration.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v3 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for QuickLookPreviewConfiguration(0, a1, v6, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, a1);
  v8 = swift_allocObject();
  (*(void (**)(uint64_t, char *))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v8 + 80) - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)v8 + 96), v5);
  return v8;
}

uint64_t type metadata accessor for QuickLookPreviewConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for QuickLookPreviewConfiguration);
}

uint64_t dispatch thunk of QLAppExtension.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

ValueMetadata *type metadata accessor for QLAppExtensionSceneBuilder()
{
  return &type metadata for QLAppExtensionSceneBuilder;
}

uint64_t sub_20D5A3038()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for QuickLookPreviewConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QuickLookPreviewConfiguration.accept(connection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of QuickLookPreviewAppExtension.protocolHandler.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of QuickLookPreviewAppExtension.hostProxy.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of QuickLookPreviewAppExtension.hostProxy.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of QuickLookPreviewAppExtension.hostProxy.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

void sub_20D5A30E0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for QLAppExtensionSceneBuilder._QLAppExtensionScene(255, *a1, *(_QWORD *)(a1[1] + 8), a4);
  JUMPOUT(0x212BA45A4);
}

uint64_t type metadata accessor for QLAppExtensionSceneBuilder._QLAppExtensionScene(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for QLAppExtensionSceneBuilder._QLAppExtensionScene);
}

unint64_t sub_20D5A311C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549BA850;
  if (!qword_2549BA850)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_2549BA858);
    result = MEMORY[0x212BA45A4](&unk_20D5B3760, v1);
    atomic_store(result, (unint64_t *)&qword_2549BA850);
  }
  return result;
}

_QWORD *sub_20D5A3168(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t sub_20D5A3194()
{
  return swift_release();
}

_QWORD *sub_20D5A319C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_20D5A31D4(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t sub_20D5A3204()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D5A3238(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x212BA45A4](&unk_20D5B3720);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_20D5A3264(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t sub_20D5A3274(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_20D5A32B4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_20D5A32EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D5A3334(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D5A337C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D5A33C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_20D5A340C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D5A3418(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_20D5A3458()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D5A3464(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for QLHostDebugView()
{
  uint64_t result;

  result = qword_2549BA948;
  if (!qword_2549BA948)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20D5A34E4()
{
  unint64_t v0;

  sub_20D5A354C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20D5A354C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549BA958[0])
  {
    type metadata accessor for QLHostRemoteViewModel();
    v0 = sub_20D5A6A68();
    if (!v1)
      atomic_store(v0, qword_2549BA958);
  }
}

uint64_t sub_20D5A35A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D5A35B0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549B9F30, (uint64_t (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2150);
  sub_20D5A6684();
  swift_release();
  v4 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  *a2 = v4;
  a2[1] = v5;
  return sub_20D57828C(v4);
}

uint64_t sub_20D5A3640(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  swift_getKeyPath();
  sub_20D57828C(v1);
  sub_20D570178((unint64_t *)&qword_2549B9F30, (uint64_t (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2150);
  sub_20D5A6678();
  sub_20D5782B8(v1);
  return swift_release();
}

uint64_t sub_20D5A3708()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_20D5A374C;
  return sub_20D578DD0();
}

uint64_t sub_20D5A374C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 32) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_20D5A37C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[4];
  v2 = swift_allocObject();
  v0[5] = v2;
  *(_BYTE *)(v2 + 16) = 0;
  v3 = swift_task_alloc();
  v0[6] = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[7] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BAA20);
  *v4 = v0;
  v4[1] = sub_20D5A3890;
  return sub_20D5A6F18();
}

uint64_t sub_20D5A3890()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D5A38FC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 32);
  swift_release();

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_20D5A3934()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 32);
  swift_release();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5A3978()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_20D5A39BC;
  return sub_20D5792B0();
}

uint64_t sub_20D5A39BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 32) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_20D5A3A30()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[4];
  v2 = swift_allocObject();
  v0[5] = v2;
  *(_BYTE *)(v2 + 16) = 0;
  v3 = swift_task_alloc();
  v0[6] = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[7] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BAA60);
  *v4 = v0;
  v4[1] = sub_20D5A3B00;
  return sub_20D5A6F18();
}

uint64_t sub_20D5A3B00()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

void sub_20D5A3B6C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_20D5A3BBC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _BYTE *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BAA28);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_BYTE *)(a3 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v11 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v12 + v11, v9, v6);
  aBlock[4] = sub_20D5A61E0;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20D5A3B6C;
  aBlock[3] = &block_descriptor_7;
  v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v14 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v13);
  _Block_release(v13);
  sub_20D5A6DC8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BAA20);
  if (swift_dynamicCast() && (v15 = v20) != 0)
  {
    swift_beginAccess();
    if ((*v10 & 1) != 0)
    {
      return swift_unknownObjectRelease();
    }
    else
    {
      swift_beginAccess();
      *v10 = 1;
      v19 = v15;
      return sub_20D5A6C30();
    }
  }
  else
  {
    result = swift_beginAccess();
    if ((*v10 & 1) == 0)
    {
      swift_beginAccess();
      *v10 = 1;
      sub_20D5A61EC();
      v17 = swift_allocError();
      *v18 = 1;
      v19 = v17;
      return sub_20D5A6C24();
    }
  }
  return result;
}

uint64_t sub_20D5A3E24(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _BYTE *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  _BYTE *v18;
  _QWORD v19[4];
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BAA68);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_BYTE *)(a3 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v11 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v12 + v11, v9, v6);
  aBlock[4] = sub_20D5A6458;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20D5A3B6C;
  aBlock[3] = &block_descriptor_62;
  v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v14 = objc_msgSend(a2, sel_remoteObjectProxyWithErrorHandler_, v13);
  _Block_release(v13);
  sub_20D5A6DC8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BAA60);
  if (swift_dynamicCast())
  {
    v15 = v19[1];
    swift_beginAccess();
    if ((*v10 & 1) != 0)
    {
      return swift_unknownObjectRelease();
    }
    else
    {
      swift_beginAccess();
      *v10 = 1;
      v19[0] = v15;
      return sub_20D5A6C30();
    }
  }
  else
  {
    result = swift_beginAccess();
    if ((*v10 & 1) == 0)
    {
      swift_beginAccess();
      *v10 = 1;
      sub_20D5A61EC();
      v17 = swift_allocError();
      *v18 = 1;
      v19[0] = v17;
      return sub_20D5A6C24();
    }
  }
  return result;
}

uint64_t sub_20D5A4088(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  _BYTE *v7;
  uint64_t result;
  id v9;

  v7 = (_BYTE *)(a2 + 16);
  result = swift_beginAccess();
  if ((*(_BYTE *)(a2 + 16) & 1) == 0)
  {
    swift_beginAccess();
    *v7 = 1;
    v9 = a1;
    __swift_instantiateConcreteTypeFromMangledName(a4);
    return sub_20D5A6C24();
  }
  return result;
}

uint64_t sub_20D5A4124@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 40);
  return swift_retain();
}

uint64_t sub_20D5A41B4()
{
  swift_getKeyPath();
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  swift_retain();
  sub_20D5A6678();
  swift_release();
  return swift_release();
}

uint64_t sub_20D5A426C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA990);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA998);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v17 - v11;
  *(_QWORD *)v6 = sub_20D5A68A0();
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA9A0);
  sub_20D5A4414(a1, (uint64_t)&v6[*(int *)(v13 + 44)]);
  LOBYTE(a1) = sub_20D5A696C();
  sub_20D57C228((uint64_t)v6, (uint64_t)v10, &qword_2549BA990);
  v14 = &v10[*(int *)(v7 + 36)];
  *v14 = a1;
  *(_OWORD *)(v14 + 8) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  v14[40] = 1;
  sub_20D57C26C((uint64_t)v6, &qword_2549BA990);
  sub_20D57F334((uint64_t)v10, (uint64_t)v12, &qword_2549BA998);
  sub_20D57C228((uint64_t)v12, (uint64_t)v10, &qword_2549BA998);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA9A8);
  sub_20D57C228((uint64_t)v10, a2 + *(int *)(v15 + 48), &qword_2549BA998);
  sub_20D57C26C((uint64_t)v12, &qword_2549BA998);
  return sub_20D57C26C((uint64_t)v10, &qword_2549BA998);
}

uint64_t sub_20D5A4414@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t KeyPath;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  uint64_t *v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;

  v83 = a2;
  v3 = type metadata accessor for QLHostDebugView();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA9B0);
  v75 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v79 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v91 = (char *)&v75 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v75 - v12;
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA9B8);
  v14 = MEMORY[0x24BDAC7A8](v94);
  v82 = (uint64_t)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v81 = (uint64_t)&v75 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v80 = (uint64_t)&v75 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v77 = (char *)&v75 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v78 = (uint64_t)&v75 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v76 = (char *)&v75 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v93 = (uint64_t)&v75 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v75 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v92 = (uint64_t)&v75 - v31;
  sub_20D582F34(a1, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for QLHostDebugView);
  v32 = *(unsigned __int8 *)(v4 + 80);
  v33 = (v32 + 16) & ~v32;
  v89 = v32 | 7;
  v90 = v33 + v5;
  v34 = swift_allocObject();
  sub_20D5A5DFC((uint64_t)v6, v34 + v33);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA9C0);
  v87 = sub_20D5A5E4C();
  v88 = v35;
  sub_20D5A6A14();
  v86 = __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  sub_20D5A6A38();
  v36 = v95;
  swift_getKeyPath();
  v95 = v36;
  v85 = sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  v37 = *(_QWORD *)(v36 + 40);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  v95 = v37;
  v84 = sub_20D570178((unint64_t *)&qword_2549B9F30, (uint64_t (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2150);
  sub_20D5A6684();
  swift_release();
  v38 = *(_QWORD *)(v37 + 16);
  sub_20D57828C(v38);
  swift_release();
  if (v38)
    sub_20D5782B8(v38);
  v39 = v38 != 0;
  KeyPath = swift_getKeyPath();
  v41 = swift_allocObject();
  *(_BYTE *)(v41 + 16) = v39;
  v42 = v75;
  v43 = *(void (**)(char *, char *, uint64_t))(v75 + 16);
  v43(v30, v13, v7);
  v44 = (uint64_t *)&v30[*(int *)(v94 + 36)];
  *v44 = KeyPath;
  v44[1] = (uint64_t)sub_20D5A5FC4;
  v44[2] = v41;
  v45 = *(void (**)(char *, uint64_t))(v42 + 8);
  v45(v13, v7);
  sub_20D57F334((uint64_t)v30, v92, &qword_2549BA9B8);
  sub_20D582F34(a1, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for QLHostDebugView);
  v46 = swift_allocObject();
  sub_20D5A5DFC((uint64_t)v6, v46 + v33);
  sub_20D5A6A14();
  sub_20D5A6A38();
  v47 = v95;
  swift_getKeyPath();
  v95 = v47;
  sub_20D5A6684();
  swift_release();
  v48 = *(_QWORD *)(v47 + 40);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  v95 = v48;
  sub_20D5A6684();
  swift_release();
  v49 = *(_QWORD *)(v48 + 16);
  sub_20D57828C(v49);
  swift_release();
  if (v49)
    sub_20D5782B8(v49);
  v50 = v49 == 0;
  v51 = swift_getKeyPath();
  v52 = swift_allocObject();
  *(_BYTE *)(v52 + 16) = v50;
  v53 = (uint64_t)v76;
  v54 = v91;
  v43(v76, v91, v7);
  v55 = (uint64_t *)(v53 + *(int *)(v94 + 36));
  *v55 = v51;
  v55[1] = (uint64_t)sub_20D5A64F4;
  v55[2] = v52;
  v45(v54, v7);
  sub_20D57F334(v53, v93, &qword_2549BA9B8);
  sub_20D582F34(a1, (uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for QLHostDebugView);
  v56 = swift_allocObject();
  sub_20D5A5DFC((uint64_t)v6, v56 + v33);
  v57 = v79;
  sub_20D5A6A14();
  sub_20D5A6A38();
  v58 = v95;
  swift_getKeyPath();
  v95 = v58;
  sub_20D5A6684();
  swift_release();
  v59 = *(_QWORD *)(v58 + 40);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  v95 = v59;
  sub_20D5A6684();
  swift_release();
  v60 = *(_QWORD *)(v59 + 16);
  sub_20D57828C(v60);
  swift_release();
  if (v60)
    sub_20D5782B8(v60);
  v61 = v60 == 0;
  v62 = swift_getKeyPath();
  v63 = swift_allocObject();
  *(_BYTE *)(v63 + 16) = v61;
  v64 = (uint64_t)v77;
  v43(v77, v57, v7);
  v65 = (uint64_t *)(v64 + *(int *)(v94 + 36));
  *v65 = v62;
  v65[1] = (uint64_t)sub_20D5A64F4;
  v65[2] = v63;
  v45(v57, v7);
  v66 = v78;
  sub_20D57F334(v64, v78, &qword_2549BA9B8);
  v67 = v92;
  v68 = v80;
  sub_20D57C228(v92, v80, &qword_2549BA9B8);
  v69 = v93;
  v70 = v81;
  sub_20D57C228(v93, v81, &qword_2549BA9B8);
  v71 = v82;
  sub_20D57C228(v66, v82, &qword_2549BA9B8);
  v72 = v83;
  sub_20D57C228(v68, v83, &qword_2549BA9B8);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BAA00);
  sub_20D57C228(v70, v72 + *(int *)(v73 + 48), &qword_2549BA9B8);
  sub_20D57C228(v71, v72 + *(int *)(v73 + 64), &qword_2549BA9B8);
  sub_20D57C26C(v66, &qword_2549BA9B8);
  sub_20D57C26C(v69, &qword_2549BA9B8);
  sub_20D57C26C(v67, &qword_2549BA9B8);
  sub_20D57C26C(v71, &qword_2549BA9B8);
  sub_20D57C26C(v70, &qword_2549BA9B8);
  return sub_20D57C26C(v68, &qword_2549BA9B8);
}

uint64_t sub_20D5A4C90(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = type metadata accessor for QLHostDebugView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_20D582F34(a1, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for QLHostDebugView);
  sub_20D5A6C54();
  v10 = sub_20D5A6C48();
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v12 = swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v12 + 16) = v10;
  *(_QWORD *)(v12 + 24) = v13;
  sub_20D5A5DFC((uint64_t)v5, v12 + v11);
  sub_20D5847D0((uint64_t)v8, (uint64_t)&unk_2549BAA50, v12);
  return swift_release();
}

uint64_t sub_20D5A4DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[3] = a4;
  sub_20D5A6C54();
  v4[4] = sub_20D5A6C48();
  v4[5] = sub_20D5A6C18();
  v4[6] = v5;
  return swift_task_switch();
}

uint64_t sub_20D5A4E3C()
{
  _QWORD *v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  sub_20D5A6A38();
  v0[7] = v0[2];
  v1 = (_QWORD *)swift_task_alloc();
  v0[8] = v1;
  *v1 = v0;
  v1[1] = sub_20D5A4EA4;
  return sub_20D590BAC();
}

uint64_t sub_20D5A4EA4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_20D5A4F10()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5A4F44()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5A4F84@<X0>(uint64_t a1@<X8>)
{
  return sub_20D5A55F0(0xED00006E6F697373, 0x7269632E79616C70, 0xEB00000000656C63, a1);
}

uint64_t sub_20D5A4FC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = type metadata accessor for QLHostDebugView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A6C60();
  v9 = sub_20D5A6C78();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  sub_20D582F34(a1, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for QLHostDebugView);
  sub_20D5A6C54();
  v10 = sub_20D5A6C48();
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v12 = swift_allocObject();
  v13 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v12 + 16) = v10;
  *(_QWORD *)(v12 + 24) = v13;
  sub_20D5A5DFC((uint64_t)v5, v12 + v11);
  sub_20D592B84((uint64_t)v8, (uint64_t)&unk_2549BAA40, v12);
  return swift_release();
}

uint64_t sub_20D5A510C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[3] = a4;
  v4[4] = sub_20D5A6C54();
  v4[5] = sub_20D5A6C48();
  v4[6] = sub_20D5A6C18();
  v4[7] = v5;
  return swift_task_switch();
}

uint64_t sub_20D5A517C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  *(_QWORD *)(v0 + 64) = __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  sub_20D5A6A38();
  v1 = *(_QWORD *)(v0 + 16);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v1;
  *(_QWORD *)(v0 + 72) = sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  v2 = *(_QWORD *)(v1 + 40);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v2;
  *(_QWORD *)(v0 + 80) = sub_20D570178((unint64_t *)&qword_2549B9F30, (uint64_t (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2150);
  sub_20D5A6684();
  swift_release();
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v0 + 88) = v3;
  *(_QWORD *)(v0 + 96) = *(_QWORD *)(v2 + 24);
  sub_20D57828C(v3);
  swift_release();
  if (v3)
  {
    *(_QWORD *)(v0 + 104) = sub_20D5A6C48();
    sub_20D5A6C18();
    return swift_task_switch();
  }
  else
  {
    swift_release();
    sub_20D5A6A38();
    v5 = *(_QWORD *)(v0 + 16);
    swift_getKeyPath();
    *(_QWORD *)(v0 + 16) = v5;
    sub_20D5A6684();
    swift_release();
    v6 = *(_QWORD *)(v5 + 40);
    swift_retain();
    swift_release();
    swift_getKeyPath();
    v7 = (_QWORD *)swift_task_alloc();
    v7[3] = 0;
    v7[4] = 0;
    v7[2] = v6;
    *(_QWORD *)(v0 + 16) = v6;
    sub_20D5A6678();
    swift_release();
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20D5A5408()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 96);
  swift_release();
  __swift_project_boxed_opaque_existential_0((_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 48));
  sub_20D5A6D44();
  objc_msgSend(*(id *)(v1 + 64), sel_invalidate);
  v2 = *(void **)(v1 + 64);
  *(_QWORD *)(v1 + 64) = 0;
  swift_release();
  swift_release();

  return swift_task_switch();
}

uint64_t sub_20D5A548C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  swift_release();
  sub_20D5A6A38();
  v1 = *(_QWORD *)(v0 + 16);
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v1;
  sub_20D5A6684();
  swift_release();
  v2 = *(_QWORD *)(v1 + 40);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  v3 = (_QWORD *)swift_task_alloc();
  v3[3] = 0;
  v3[4] = 0;
  v3[2] = v2;
  *(_QWORD *)(v0 + 16) = v2;
  sub_20D5A6678();
  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5A55B4@<X0>(uint64_t a1@<X8>)
{
  return sub_20D5A55F0(0xEC0000006E6F6973, 0x7269632E706F7473, 0xEB00000000656C63, a1);
}

uint64_t sub_20D5A55F0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[3];
  uint64_t v28;

  v27[1] = a2;
  v27[2] = a3;
  v27[0] = a1;
  v28 = a4;
  v4 = sub_20D5A6A20();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20D5A6A80();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA9E8);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA9D8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D5A68AC();
  sub_20D5A69F0();
  v18 = sub_20D5A696C();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v17, v14, v11);
  v19 = &v17[*(int *)(v15 + 36)];
  *v19 = v18;
  *(_OWORD *)(v19 + 8) = 0u;
  *(_OWORD *)(v19 + 24) = 0u;
  v19[40] = 1;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_20D5A6A74();
  v20 = *MEMORY[0x24BDEEB68];
  v21 = sub_20D5A68B8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v6, v20, v21);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA9C0);
  v23 = v28;
  v24 = v28 + *(int *)(v22 + 36);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v24, v10, v7);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA9F8);
  sub_20D582F34((uint64_t)v6, v24 + *(int *)(v25 + 52), (uint64_t (*)(_QWORD))MEMORY[0x24BDF48E8]);
  *(_WORD *)(v24 + *(int *)(v25 + 56)) = 256;
  sub_20D57C228((uint64_t)v17, v23, &qword_2549BA9D8);
  sub_20D5A60CC((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return sub_20D57C26C((uint64_t)v17, &qword_2549BA9D8);
}

uint64_t sub_20D5A585C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  sub_20D5A6A38();
  v3 = v13;
  swift_getKeyPath();
  v13 = v3;
  sub_20D570178((unint64_t *)&qword_2549BA2C0, (uint64_t (*)(uint64_t))type metadata accessor for QLHostRemoteViewModel, (uint64_t)&unk_20D5B3220);
  sub_20D5A6684();
  swift_release();
  v4 = *(_QWORD *)(v3 + 40);
  swift_retain();
  swift_release();
  swift_getKeyPath();
  v13 = v4;
  sub_20D570178((unint64_t *)&qword_2549B9F30, (uint64_t (*)(uint64_t))type metadata accessor for QLHostPrimaryViewControllerWrapperViewModel, (uint64_t)&unk_20D5B2150);
  sub_20D5A6684();
  swift_release();
  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  sub_20D57828C(v5);
  swift_release();
  if (v5)
  {
    v7 = sub_20D5A6C78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v2, 1, 1, v7);
    sub_20D5A6C54();
    swift_retain();
    swift_retain();
    v8 = sub_20D5A6C48();
    v9 = (_QWORD *)swift_allocObject();
    v10 = MEMORY[0x24BEE6930];
    v9[2] = v8;
    v9[3] = v10;
    v9[4] = v5;
    v9[5] = v6;
    sub_20D5847D0((uint64_t)v2, (uint64_t)&unk_2549BAA10, (uint64_t)v9);
    swift_release();
    swift_release();
    return swift_release();
  }
  else
  {
    result = sub_20D5A6E94();
    __break(1u);
  }
  return result;
}

uint64_t sub_20D5A5A90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t (*v8)(void);

  v5[5] = a5;
  v5[6] = sub_20D5A6C54();
  v5[7] = sub_20D5A6C48();
  v8 = (uint64_t (*)(void))((char *)&dword_2549BAA18 + dword_2549BAA18);
  swift_retain();
  v6 = (_QWORD *)swift_task_alloc();
  v5[8] = v6;
  *v6 = v5;
  v6[1] = sub_20D5A5B1C;
  return v8();
}

uint64_t sub_20D5A5B1C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[2] = v2;
  v3[3] = a1;
  v3[4] = v1;
  v3[9] = v1;
  swift_task_dealloc();
  swift_release();
  if (v1)
    sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D5A5BBC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[3];
  v0[10] = v1;
  v2 = swift_task_alloc();
  v0[11] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[12] = v3;
  *v3 = v0;
  v3[1] = sub_20D5A5C54;
  return sub_20D5A6EF4();
}

uint64_t sub_20D5A5C54()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20D5A5CB0()
{
  swift_unknownObjectRelease();
  sub_20D5A6C18();
  return swift_task_switch();
}

uint64_t sub_20D5A5D08()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5A5D3C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D5A5D70@<X0>(uint64_t a1@<X8>)
{
  return sub_20D5A55F0(0xEB00000000786570, 0x636F2E6B72616D78, 0xED00006E6F676174, a1);
}

uint64_t sub_20D5A5DB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)a1 = sub_20D5A68C4();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BA988);
  return sub_20D5A426C(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_20D5A5DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for QLHostDebugView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D5A5E40()
{
  return sub_20D5A6080(sub_20D5A4C90);
}

unint64_t sub_20D5A5E4C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549BA9C8;
  if (!qword_2549BA9C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BA9C0);
    v2[0] = sub_20D5A5ED0();
    v2[1] = sub_20D57C440(&qword_2549BA9F0, &qword_2549BA9F8, MEMORY[0x24BDF1330]);
    result = MEMORY[0x212BA45A4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BA9C8);
  }
  return result;
}

unint64_t sub_20D5A5ED0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549BA9D0;
  if (!qword_2549BA9D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BA9D8);
    v2[0] = sub_20D57C440(&qword_2549BA9E0, &qword_2549BA9E8, MEMORY[0x24BDF41A8]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x212BA45A4](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BA9D0);
  }
  return result;
}

uint64_t sub_20D5A5F64@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_20D5A6888();
  *a1 = result & 1;
  return result;
}

uint64_t sub_20D5A5F90()
{
  return sub_20D5A6894();
}

uint64_t sub_20D5A5FB4()
{
  return swift_deallocObject();
}

_BYTE *sub_20D5A5FC4(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_20D5A5FE0()
{
  return sub_20D5A6080(sub_20D5A4FC4);
}

uint64_t sub_20D5A5FEC()
{
  return swift_deallocObject();
}

uint64_t objectdestroyTm_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for QLHostDebugView() - 8) + 80);
  v2 = v0 + ((v1 + 16) & ~v1);
  v3 = __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return swift_deallocObject();
}

uint64_t sub_20D5A6074()
{
  return sub_20D5A6080((uint64_t (*)(uint64_t))sub_20D5A585C);
}

uint64_t sub_20D5A6080(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for QLHostDebugView() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_20D5A60BC()
{
  return swift_deallocObject();
}

uint64_t sub_20D5A60CC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20D5A6A20();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20D5A6108()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D5A613C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D5779C0;
  return sub_20D5A5A90(a1, v4, v5, v7, v6);
}

void sub_20D5A61B4(uint64_t a1)
{
  uint64_t v1;

  sub_20D577E0C(a1, *(void **)(v1 + 16));
}

uint64_t sub_20D5A61BC()
{
  return swift_deallocObject();
}

uint64_t sub_20D5A61CC(uint64_t a1)
{
  uint64_t v1;

  return sub_20D5A3BBC(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_20D5A61D4()
{
  return objectdestroy_40Tm(&qword_2549BAA28);
}

uint64_t sub_20D5A61E0(void *a1)
{
  return sub_20D5A6464(a1, &qword_2549BAA28);
}

unint64_t sub_20D5A61EC()
{
  unint64_t result;

  result = qword_2549BAA30;
  if (!qword_2549BAA30)
  {
    result = MEMORY[0x212BA45A4](&unk_20D5B22C4, &type metadata for ProxyError);
    atomic_store(result, &qword_2549BAA30);
  }
  return result;
}

uint64_t sub_20D5A6234(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for QLHostDebugView() - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D5779C0;
  return sub_20D5A510C(a1, v5, v6, v7);
}

uint64_t sub_20D5A62B8()
{
  uint64_t v0;

  return sub_20D58FBC8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t objectdestroy_43Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for QLHostDebugView() - 8) + 80);
  v2 = (v1 + 32) & ~v1;
  swift_unknownObjectRelease();
  v3 = __swift_instantiateConcreteTypeFromMangledName(qword_2549BA8E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

uint64_t sub_20D5A6350(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for QLHostDebugView() - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20D577D2C;
  return sub_20D5A4DD0(a1, v5, v6, v7);
}

uint64_t sub_20D5A63D4(uint64_t a1)
{
  uint64_t v1;

  return sub_20D5A3E24(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_20D5A63DC()
{
  return objectdestroy_40Tm(&qword_2549BAA68);
}

uint64_t objectdestroy_40Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v1 + v4, v2);
  return swift_deallocObject();
}

uint64_t sub_20D5A6458(void *a1)
{
  return sub_20D5A6464(a1, &qword_2549BAA68);
}

uint64_t sub_20D5A6464(void *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a2) - 8) + 80);
  return sub_20D5A4088(a1, *(_QWORD *)(v2 + 16), v2 + ((v5 + 24) & ~v5), a2);
}

uint64_t sub_20D5A64B8()
{
  return sub_20D57C440(&qword_2549BAA70, &qword_2549BAA78, MEMORY[0x24BDF4700]);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_20D5A65B8()
{
  return MEMORY[0x24BDCAF28]();
}

uint64_t sub_20D5A65C4()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_20D5A65D0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_20D5A65DC()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_20D5A65E8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_20D5A65F4()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_20D5A6600()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_20D5A660C()
{
  return MEMORY[0x24BDCD9D0]();
}

uint64_t sub_20D5A6618()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_20D5A6624()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_20D5A6630()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_20D5A663C()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_20D5A6648()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_20D5A6654()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_20D5A6660()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_20D5A666C()
{
  return MEMORY[0x24BEE5BF8]();
}

uint64_t sub_20D5A6678()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_20D5A6684()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_20D5A6690()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_20D5A669C()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_20D5A66A8()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_20D5A66B4()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_20D5A66C0()
{
  return MEMORY[0x24BDC7A48]();
}

uint64_t sub_20D5A66CC()
{
  return MEMORY[0x24BDC7A80]();
}

uint64_t sub_20D5A66D8()
{
  return MEMORY[0x24BDC7A90]();
}

uint64_t sub_20D5A66E4()
{
  return MEMORY[0x24BDC7A98]();
}

uint64_t sub_20D5A66F0()
{
  return MEMORY[0x24BDC7AA8]();
}

uint64_t sub_20D5A66FC()
{
  return MEMORY[0x24BDC77F0]();
}

uint64_t sub_20D5A6708()
{
  return MEMORY[0x24BDC7808]();
}

uint64_t sub_20D5A6714()
{
  return MEMORY[0x24BDC7820]();
}

uint64_t sub_20D5A6720()
{
  return MEMORY[0x24BDC7838]();
}

uint64_t sub_20D5A672C()
{
  return MEMORY[0x24BDC7840]();
}

uint64_t sub_20D5A6738()
{
  return MEMORY[0x24BDC7858]();
}

uint64_t sub_20D5A6744()
{
  return MEMORY[0x24BDC7868]();
}

uint64_t sub_20D5A6750()
{
  return MEMORY[0x24BDC7870]();
}

uint64_t sub_20D5A675C()
{
  return MEMORY[0x24BDC7880]();
}

uint64_t sub_20D5A6768()
{
  return MEMORY[0x24BDC7890]();
}

uint64_t sub_20D5A6774()
{
  return MEMORY[0x24BDC78A8]();
}

uint64_t sub_20D5A6780()
{
  return MEMORY[0x24BDC7920]();
}

uint64_t sub_20D5A678C()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t sub_20D5A6798()
{
  return MEMORY[0x24BEE6238]();
}

uint64_t sub_20D5A67A4()
{
  return MEMORY[0x24BEE6280]();
}

uint64_t sub_20D5A67B0()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_20D5A67BC()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_20D5A67C8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_20D5A67D4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_20D5A67E0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_20D5A67EC()
{
  return MEMORY[0x24BDEB4A0]();
}

uint64_t sub_20D5A67F8()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_20D5A6804()
{
  return MEMORY[0x24BDECCA0]();
}

uint64_t sub_20D5A6810()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_20D5A681C()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_20D5A6828()
{
  return MEMORY[0x24BDEDF08]();
}

uint64_t sub_20D5A6834()
{
  return MEMORY[0x24BDEDF10]();
}

uint64_t sub_20D5A6840()
{
  return MEMORY[0x24BDEDFE8]();
}

uint64_t sub_20D5A684C()
{
  return MEMORY[0x24BDEDFF0]();
}

uint64_t sub_20D5A6858()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_20D5A6864()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_20D5A6870()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_20D5A687C()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_20D5A6888()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_20D5A6894()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_20D5A68A0()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_20D5A68AC()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_20D5A68B8()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_20D5A68C4()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_20D5A68D0()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_20D5A68DC()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_20D5A68E8()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_20D5A68F4()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_20D5A6900()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_20D5A690C()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_20D5A6918()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_20D5A6924()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_20D5A6930()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_20D5A693C()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_20D5A6948()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_20D5A6954()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_20D5A6960()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_20D5A696C()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_20D5A6978()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_20D5A6984()
{
  return MEMORY[0x24BDF19C8]();
}

uint64_t sub_20D5A6990()
{
  return MEMORY[0x24BDF1CE0]();
}

uint64_t sub_20D5A699C()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_20D5A69A8()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_20D5A69B4()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_20D5A69C0()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_20D5A69CC()
{
  return MEMORY[0x24BDF36E0]();
}

uint64_t sub_20D5A69D8()
{
  return MEMORY[0x24BDF3C98]();
}

uint64_t sub_20D5A69E4()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_20D5A69F0()
{
  return MEMORY[0x24BDF4160]();
}

uint64_t sub_20D5A69FC()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_20D5A6A08()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_20D5A6A14()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_20D5A6A20()
{
  return MEMORY[0x24BDF48E8]();
}

uint64_t sub_20D5A6A2C()
{
  return MEMORY[0x24BDF4BD8]();
}

uint64_t sub_20D5A6A38()
{
  return MEMORY[0x24BDF4BE0]();
}

uint64_t sub_20D5A6A44()
{
  return MEMORY[0x24BDF4BF0]();
}

uint64_t sub_20D5A6A50()
{
  return MEMORY[0x24BDF4C00]();
}

uint64_t sub_20D5A6A5C()
{
  return MEMORY[0x24BDF4C08]();
}

uint64_t sub_20D5A6A68()
{
  return MEMORY[0x24BDF4C28]();
}

uint64_t sub_20D5A6A74()
{
  return MEMORY[0x24BDF4E28]();
}

uint64_t sub_20D5A6A80()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_20D5A6A8C()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_20D5A6A98()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_20D5A6AA4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_20D5A6AB0()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_20D5A6ABC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_20D5A6AC8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_20D5A6AD4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20D5A6AE0()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_20D5A6AEC()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_20D5A6AF8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20D5A6B04()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_20D5A6B10()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_20D5A6B1C()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_20D5A6B28()
{
  return MEMORY[0x24BDCFAE0]();
}

uint64_t sub_20D5A6B34()
{
  return MEMORY[0x24BDCFAE8]();
}

uint64_t sub_20D5A6B40()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_20D5A6B4C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_20D5A6B58()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_20D5A6B64()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20D5A6B70()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_20D5A6B7C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_20D5A6B88()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_20D5A6B94()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_20D5A6BA0()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_20D5A6BAC()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_20D5A6BB8()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_20D5A6BC4()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_20D5A6BD0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_20D5A6BDC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_20D5A6BE8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_20D5A6BF4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_20D5A6C00()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_20D5A6C0C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_20D5A6C18()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_20D5A6C24()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_20D5A6C30()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_20D5A6C3C()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_20D5A6C48()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_20D5A6C54()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_20D5A6C60()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_20D5A6C6C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_20D5A6C78()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_20D5A6C84()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_20D5A6C90()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_20D5A6C9C()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_20D5A6CA8()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t sub_20D5A6CB4()
{
  return MEMORY[0x24BEE6A98]();
}

uint64_t sub_20D5A6CC0()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_20D5A6CCC()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_20D5A6CD8()
{
  return MEMORY[0x24BDCFCC8]();
}

uint64_t sub_20D5A6CE4()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_20D5A6CF0()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_20D5A6CFC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_20D5A6D08()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_20D5A6D14()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_20D5A6D20()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_20D5A6D2C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_20D5A6D38()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_20D5A6D44()
{
  return MEMORY[0x24BDC7B50]();
}

uint64_t sub_20D5A6D50()
{
  return MEMORY[0x24BDC7B58]();
}

uint64_t sub_20D5A6D5C()
{
  return MEMORY[0x24BDC7B60]();
}

uint64_t sub_20D5A6D68()
{
  return MEMORY[0x24BDC7B68]();
}

uint64_t sub_20D5A6D74()
{
  return MEMORY[0x24BDC7B70]();
}

uint64_t sub_20D5A6D80()
{
  return MEMORY[0x24BDC7B78]();
}

uint64_t sub_20D5A6D8C()
{
  return MEMORY[0x24BDC7B88]();
}

uint64_t sub_20D5A6D98()
{
  return MEMORY[0x24BDC7BA0]();
}

uint64_t sub_20D5A6DA4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_20D5A6DB0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_20D5A6DBC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_20D5A6DC8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_20D5A6DD4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_20D5A6DE0()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_20D5A6DEC()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_20D5A6DF8()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_20D5A6E04()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_20D5A6E10()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_20D5A6E1C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_20D5A6E28()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_20D5A6E34()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_20D5A6E40()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20D5A6E4C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_20D5A6E58()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_20D5A6E64()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_20D5A6E70()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_20D5A6E7C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_20D5A6E88()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_20D5A6E94()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_20D5A6EA0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_20D5A6EAC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_20D5A6EB8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_20D5A6EC4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_20D5A6ED0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_20D5A6EDC()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_20D5A6EE8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_20D5A6EF4()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_20D5A6F00()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_20D5A6F0C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20D5A6F18()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_20D5A6F24()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_20D5A6F30()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_20D5A6F3C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_20D5A6F48()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_20D5A6F54()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_20D5A6F60()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20D5A6F6C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20D5A6F78()
{
  return MEMORY[0x24BEE4328]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x24BDE5440](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC4E8](*(_QWORD *)&encoding);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x24BDBC500](encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x24BDBD8B0](t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x24BDBD8C8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x24BDBDCB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x24BDBDD00](c);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD38](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x24BDBDD48](c);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
  MEMORY[0x24BDBDE00](c, page);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x24BDBDE18](c, *(_QWORD *)&mode);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDF20](c, x, y);
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

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE120](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CFDictionaryRef CGImageSourceCopyProperties(CGImageSourceRef isrc, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9140](isrc, options);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9170](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x24BDD9188](isrc);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x24BDD91A0](isrc);
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return (CGPDFDocumentRef)MEMORY[0x24BDBEA00](provider);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x24BDBEA70](document, pageNumber);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
  MEMORY[0x24BDBEAC8](document);
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
  MEMORY[0x24BDBEDB0](path, m, x1, y1, x2, y2, radius);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
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

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x24BDC0058](desc);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00C0](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x24BDC00D0](theBuffer);
}

OSStatus CMFormatDescriptionCreate(CFAllocatorRef allocator, CMMediaType mediaType, FourCharCode mediaSubType, CFDictionaryRef extensions, CMFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0188](allocator, *(_QWORD *)&mediaType, *(_QWORD *)&mediaSubType, extensions, formatDescriptionOut);
}

OSStatus CMSampleBufferCreateReady(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0298](allocator, dataBuffer, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries, sampleSizeArray);
}

OSStatus CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(CMSampleBufferRef sbuf, size_t *bufferListSizeNeededOut, AudioBufferList *bufferListOut, size_t bufferListSize, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC02B0](sbuf, bufferListSizeNeededOut, bufferListOut, bufferListSize, blockBufferStructureAllocator, blockBufferBlockAllocator, *(_QWORD *)&flags, blockBufferOut);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC02D0](retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x24BDC02E0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC0320](retstr, sbuf);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x24BDC04F0](retstr, time, multiplier);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x24BDC0508](range, time);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x24BDC0580](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC05A0](retstr, lhs, rhs);
}

uint64_t FPExtendBookmarkForDocumentURL()
{
  return MEMORY[0x24BDC8060]();
}

uint64_t FPURLMightBeInFileProvider()
{
  return MEMORY[0x24BDC8178]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x24BDD1238]();
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x24BEBD2B0](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BEBD2B8]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BEBD2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BEBD2C8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NSStringFromQLNetworkState()
{
  return MEMORY[0x24BE7BF50]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t QLAdaptSizeToRect()
{
  return MEMORY[0x24BE7BF10]();
}

uint64_t QLCGSizeFromQLItemThumbnailSize()
{
  return MEMORY[0x24BE7BFF8]();
}

uint64_t QLFrameworkBundle()
{
  return MEMORY[0x24BE7BF18]();
}

uint64_t QLImageWithSizeShouldNotBeScaled()
{
  return MEMORY[0x24BE7C010]();
}

uint64_t QLLocalizedDictionaryString()
{
  return MEMORY[0x24BE7C018]();
}

uint64_t QLLocalizedString()
{
  return MEMORY[0x24BE7C020]();
}

uint64_t QLLocalizedStringFromTable()
{
  return MEMORY[0x24BE7C028]();
}

uint64_t QLLocalizedStringWithDefaultValue()
{
  return MEMORY[0x24BE7C030]();
}

uint64_t QLPreviewCopyEmbeddedPDF()
{
  return MEMORY[0x24BE7BF28]();
}

uint64_t QLRunInBackgroundThread()
{
  return MEMORY[0x24BE7C038]();
}

uint64_t QLRunInMainThread()
{
  return MEMORY[0x24BE7C040]();
}

uint64_t QLRunInMainThreadSync()
{
  return MEMORY[0x24BE7C048]();
}

uint64_t QLSInitLogging()
{
  return MEMORY[0x24BE7BF38]();
}

uint64_t QLScaledPlatformImageFromImageSource()
{
  return MEMORY[0x24BE7BF40]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BEBDE48]();
}

void UIGraphicsBeginPDFContextToData(NSMutableData *data, CGRect bounds, NSDictionary *documentInfo)
{
  MEMORY[0x24BEBE288](data, documentInfo, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height);
}

void UIGraphicsBeginPDFPage(void)
{
  MEMORY[0x24BEBE290]();
}

void UIGraphicsEndPDFContext(void)
{
  MEMORY[0x24BEBE2A0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x24BEBE668]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x24BEBE698]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x24BDBD0C8]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x24BDBD0F0]();
}

uint64_t _CFURLIsItemPromiseAtURL()
{
  return MEMORY[0x24BDBD108]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x24BDBD118]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x24BDBD120]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

uint64_t _QLContentTypeConformsToContentTypeInSet()
{
  return MEMORY[0x24BE7C050]();
}

uint64_t _UIAccessibilityZoomTouchEnabled()
{
  return MEMORY[0x24BEBEA10]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x24BEBEA28]();
}

uint64_t _UIBarsDesktopNavigationBarEnabled()
{
  return MEMORY[0x24BEBEA58]();
}

uint64_t _UIStringFromWhitePointAdaptivityStyle()
{
  return MEMORY[0x24BEBEBC8]();
}

uint64_t _UIUpdateRequestActivate()
{
  return MEMORY[0x24BEBEBE0]();
}

uint64_t _UIUpdateRequestDeactivate()
{
  return MEMORY[0x24BEBEBE8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x24BDAFC08]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x24BEE4E38]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t PXAssetBadgeInfoCreateWithBadges_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUICore))
    dlopenHelper_PhotosUICore(a1);
  return MEMORY[0x24BE727E0]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_PhotosUI(double a1)
{
  dlopen("/System/Library/Frameworks/PhotosUI.framework/PhotosUI", 0);
  atomic_store(1u, &dlopenHelperFlag_PhotosUI);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_PhotosFormats(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/PhotosFormats.framework/PhotosFormats", 0);
  atomic_store(1u, &dlopenHelperFlag_PhotosFormats);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_TelephonyUtilities(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities", 0);
  atomic_store(1u, &dlopenHelperFlag_TelephonyUtilities);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_DataDetectorsUI(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/DataDetectorsUI.framework/DataDetectorsUI", 0);
  atomic_store(1u, &dlopenHelperFlag_DataDetectorsUI);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_Photos(double a1)
{
  dlopen("/System/Library/Frameworks/Photos.framework/Photos", 0);
  atomic_store(1u, &dlopenHelperFlag_Photos);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_PhotosUIPrivate(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/PhotosUIPrivate.framework/PhotosUIPrivate", 0);
  atomic_store(1u, &dlopenHelperFlag_PhotosUIPrivate);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_ScreenTimeUI(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/ScreenTimeUI.framework/ScreenTimeUI", 0);
  atomic_store(1u, &dlopenHelperFlag_ScreenTimeUI);
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_PhotosUICore(double a1)
{
  dlopen("/System/Library/PrivateFrameworks/PhotosUICore.framework/PhotosUICore", 0);
  atomic_store(1u, &dlopenHelperFlag_PhotosUICore);
  return a1;
}

double gotLoadHelper_x8__OBJC_CLASS___STBlockingViewController(double result)
{
  if (!atomic_load(&dlopenHelperFlag_ScreenTimeUI))
    return dlopenHelper_ScreenTimeUI(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PUVideoComplementItemSource(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUIPrivate))
    return dlopenHelper_PhotosUIPrivate(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PUUISaveToCameraRollActivity(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUIPrivate))
    return dlopenHelper_PhotosUIPrivate(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___TUDialRequest(double result)
{
  if (!atomic_load(&dlopenHelperFlag_TelephonyUtilities))
    return dlopenHelper_TelephonyUtilities(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PHLivePhoto(double result)
{
  if (!atomic_load(&dlopenHelperFlag_Photos))
    return dlopenHelper_Photos(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PFVideoComplement(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosFormats))
    return dlopenHelper_PhotosFormats(result);
  return result;
}

void gotLoadHelper_x24__OBJC_CLASS___PHLivePhoto(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_Photos))
    dlopenHelper_Photos(a1);
}

double gotLoadHelper_x8__OBJC_CLASS___PFImageMetadata(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosFormats))
    return dlopenHelper_PhotosFormats(result);
  return result;
}

void gotLoadHelper_x23__OBJC_CLASS___PHLivePhotoView(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUI))
    dlopenHelper_PhotosUI(a1);
}

double gotLoadHelper_x8__DDDetectionControllerWillPresentActionNotification(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsUI))
    return dlopenHelper_DataDetectorsUI(result);
  return result;
}

double gotLoadHelper_x8__DDDetectionControllerDidDismissActionNotification(double result)
{
  if (!atomic_load(&dlopenHelperFlag_DataDetectorsUI))
    return dlopenHelper_DataDetectorsUI(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PHVideoScrubberView(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUIPrivate))
    return dlopenHelper_PhotosUIPrivate(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PHPlaceholderView(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUIPrivate))
    return dlopenHelper_PhotosUIPrivate(result);
  return result;
}

double gotLoadHelper_x8__PXAssetBadgeInfoNull(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUICore))
    return dlopenHelper_PhotosUICore(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PXUIAssetBadgeView(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosUICore))
    return dlopenHelper_PhotosUICore(result);
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___PFMetadata(double result)
{
  if (!atomic_load(&dlopenHelperFlag_PhotosFormats))
    return dlopenHelper_PhotosFormats(result);
  return result;
}

void gotLoadHelper_x20__OBJC_CLASS___PHPhotoLibrary(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_Photos))
    dlopenHelper_Photos(a1);
}

double gotLoadHelper_x8__OBJC_CLASS___PHAssetCreationRequest(double result)
{
  if (!atomic_load(&dlopenHelperFlag_Photos))
    return dlopenHelper_Photos(result);
  return result;
}

