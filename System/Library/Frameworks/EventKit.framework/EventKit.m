void sub_1A231AC98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A231C18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A231D4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A231D844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A231D9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A231DB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A231DCEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _bitmaskContainsOption(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

void restrictDateRange(void *a1, id *a2)
{
  id v3;
  double v4;
  id v5;
  void *v6;

  v3 = a1;
  if (v3)
  {
    if (a2)
    {
      v6 = v3;
      objc_msgSend(*a2, "timeIntervalSinceDate:", v3);
      v3 = v6;
      if (v4 > 126230400.0)
      {
        objc_msgSend(v6, "dateByAddingTimeInterval:");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        v3 = v6;
        *a2 = v5;
      }
    }
  }

}

void sub_1A231E770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A231EFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A231F130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void EKLogInitIfNeeded()
{
  if (EKLogInitIfNeeded_onceToken != -1)
    dispatch_once(&EKLogInitIfNeeded_onceToken, &__block_literal_global_84);
}

void sub_1A232001C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id EKObjectIDFromDictionary()
{
  NSObject *v0;
  NSObject *v1;
  uint64_t v3;

  v3 = 0;
  if ((CalGetEntityIDFromFetchedObjectDictonary() & 1) != 0)
  {
    v0 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      EKObjectIDFromDictionary_cold_1((int *)&v3 + 1, (int *)&v3, v0);
  }
  else
  {
    v1 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      EKObjectIDFromDictionary_cold_2(v1);
  }
  return 0;
}

void sub_1A2321478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

{

}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

void __Block_byref_object_dispose__22(uint64_t a1)
{

}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void __Block_byref_object_dispose__24(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A85849D4](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1A232365C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2324250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2324390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23246B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A2324878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2324D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A23250F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A23264F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23297B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2329BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A2329E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A232A050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A232A494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A232B19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;
  char a68;

  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Unwind_Resume(a1);
}

void sub_1A232B3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A232B61C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A232BAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A232BDEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A232C07C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A232C290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getREMStoreClass()
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
  v0 = (void *)getREMStoreClass_softClass;
  v7 = getREMStoreClass_softClass;
  if (!getREMStoreClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getREMStoreClass_block_invoke;
    v3[3] = &unk_1E4784C68;
    v3[4] = &v4;
    __getREMStoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A232C748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_1();
  result = objc_getClass("REMStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMStoreClass_block_invoke_cold_1();
  getREMStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ReminderKitLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E4784C88;
    v2 = 0;
    ReminderKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary)
    ReminderKitLibrary_cold_1(&v0);
}

void ReminderKitLibrary_0()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_0)
  {
    v1 = xmmword_1E4784D48;
    v2 = 0;
    ReminderKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_0)
    ReminderKitLibrary_cold_1_0(&v0);
}

uint64_t ReminderKitLibrary_1()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_1)
  {
    v2 = xmmword_1E4785470;
    v3 = 0;
    ReminderKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_1)
    ReminderKitLibrary_cold_1_1(&v1);
  return ReminderKitLibraryCore_frameworkLibrary_1;
}

void ReminderKitLibrary_2()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_3)
  {
    v1 = xmmword_1E47862C0;
    v2 = 0;
    ReminderKitLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_3)
    ReminderKitLibrary_cold_1_2(&v0);
}

void ReminderKitLibrary_3()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_5)
  {
    v1 = xmmword_1E4789220;
    v2 = 0;
    ReminderKitLibraryCore_frameworkLibrary_5 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_5)
    ReminderKitLibrary_cold_1_3(&v0);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id OUTLINED_FUNCTION_4(uint64_t a1, uint64_t a2, void *a3)
{
  return a3;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1A232F58C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A232FB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2330074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A233269C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2332B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2333598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A2333A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id getREMListClass()
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
  v0 = (void *)getREMListClass_softClass;
  v7 = getREMListClass_softClass;
  if (!getREMListClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getREMListClass_block_invoke;
    v3[3] = &unk_1E4784C68;
    v3[4] = &v4;
    __getREMListClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A2337A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getREMColorClass()
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
  v0 = (void *)getREMColorClass_softClass;
  v7 = getREMColorClass_softClass;
  if (!getREMColorClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getREMColorClass_block_invoke;
    v3[3] = &unk_1E4784C68;
    v3[4] = &v4;
    __getREMColorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A2337E68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMListClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary();
  result = objc_getClass("REMList");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMListClass_block_invoke_cold_1();
  getREMListClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMColorClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary();
  result = objc_getClass("REMColor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMColorClass_block_invoke_cold_1();
  getREMColorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getREMReminderClass()
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
  v0 = (void *)getREMReminderClass_softClass;
  v7 = getREMReminderClass_softClass;
  if (!getREMReminderClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getREMReminderClass_block_invoke;
    v3[3] = &unk_1E4784C68;
    v3[4] = &v4;
    __getREMReminderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A2338F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getREMUserActivityClass()
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
  v0 = (void *)getREMUserActivityClass_softClass;
  v7 = getREMUserActivityClass_softClass;
  if (!getREMUserActivityClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getREMUserActivityClass_block_invoke;
    v3[3] = &unk_1E4784C68;
    v3[4] = &v4;
    __getREMUserActivityClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A23399CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2339CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMReminderClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_0();
  result = objc_getClass("REMReminder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMReminderClass_block_invoke_cold_1();
  getREMReminderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMUserActivityClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_0();
  result = objc_getClass("REMUserActivity");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMUserActivityClass_block_invoke_cold_1();
  getREMUserActivityClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMReminderChangeItemClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_0();
  result = objc_getClass("REMReminderChangeItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMReminderChangeItemClass_block_invoke_cold_1();
  getREMReminderChangeItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A233C9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A233D2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double OUTLINED_FUNCTION_0_4(double a1, double a2)
{
  return a1 / a2;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_6()
{
  void *v0;

  return objc_msgSend(v0, "elapsedTimeAsNumber:", 3);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void sub_1A233E6F8(void *a1)
{
  void *v1;

  objc_begin_catch(a1);

  objc_end_catch();
  JUMPOUT(0x1A233E5A8);
}

void sub_1A233E80C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2344CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2344EBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A23451EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_6(id a1)
{

}

uint64_t OUTLINED_FUNCTION_1_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a10 + 16))(a10, 0, 0);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return objc_opt_class();
}

void sub_1A2346A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2346DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23477A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_1A2347DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getREMListClass_0()
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
  v0 = (void *)getREMListClass_softClass_0;
  v7 = getREMListClass_softClass_0;
  if (!getREMListClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getREMListClass_block_invoke_0;
    v3[3] = &unk_1E4784C68;
    v3[4] = &v4;
    __getREMListClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A2347F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2348C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

id getREMReminderClass_0()
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
  v0 = (void *)getREMReminderClass_softClass_0;
  v7 = getREMReminderClass_softClass_0;
  if (!getREMReminderClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getREMReminderClass_block_invoke_0;
    v3[3] = &unk_1E4784C68;
    v3[4] = &v4;
    __getREMReminderClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A2348D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2349C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Unwind_Resume(a1);
}

void sub_1A234A198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__52(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A85849D4](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__53(uint64_t a1)
{

}

void sub_1A234AFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

void sub_1A234B280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A234B504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1A234BAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A234BC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getREMListClass_block_invoke_0(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_1();
  result = objc_getClass("REMList");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMListClass_block_invoke_cold_1_0();
  getREMListClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMReminderClass_block_invoke_0(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_1();
  result = objc_getClass("REMReminder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMReminderClass_block_invoke_cold_1_0();
  getREMReminderClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMSaveRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_1();
  result = objc_getClass("REMSaveRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMSaveRequestClass_block_invoke_cold_1();
  getREMSaveRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMAccountClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_1();
  result = objc_getClass("REMAccount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMAccountClass_block_invoke_cold_1();
  getREMAccountClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMAlarmClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_1();
  result = objc_getClass("REMAlarm");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMAlarmClass_block_invoke_cold_1();
  getREMAlarmClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMRecurrenceRuleClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_1();
  result = objc_getClass("REMRecurrenceRule");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMRecurrenceRuleClass_block_invoke_cold_1();
  getREMRecurrenceRuleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMStructuredLocationClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_1();
  result = objc_getClass("REMStructuredLocation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMStructuredLocationClass_block_invoke_cold_1();
  getREMStructuredLocationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1A234E8F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1A234EB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A234EE74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23503D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1A2350628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A2350B48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

Class __getCNAutocompleteStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsAutocompleteLibrary();
  result = objc_getClass("CNAutocompleteStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNAutocompleteStoreClass_block_invoke_cold_1();
  getCNAutocompleteStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ContactsAutocompleteLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!ContactsAutocompleteLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E47855E0;
    v2 = 0;
    ContactsAutocompleteLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ContactsAutocompleteLibraryCore_frameworkLibrary)
    ContactsAutocompleteLibrary_cold_1(&v0);
}

Class __getCNAutocompleteFetchRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsAutocompleteLibrary();
  result = objc_getClass("CNAutocompleteFetchRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNAutocompleteFetchRequestClass_block_invoke_cold_1();
  getCNAutocompleteFetchRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNAutocompleteNameComponentsClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsAutocompleteLibrary();
  result = objc_getClass("CNAutocompleteNameComponents");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNAutocompleteNameComponentsClass_block_invoke_cold_1();
  getCNAutocompleteNameComponentsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCNAutocompleteResultClass_block_invoke(uint64_t a1)
{
  Class result;

  ContactsAutocompleteLibrary();
  result = objc_getClass("CNAutocompleteResult");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCNAutocompleteResultClass_block_invoke_cold_1();
  getCNAutocompleteResultClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A2351F38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A235306C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id rangesSafeToRemove(void *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = objc_msgSend(a1, "underlyingResult");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _recursiveSafeRangesToRemoveFromResult(v1, v2);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

void _recursiveSafeRangesToRemoveFromResult(uint64_t a1, void *a2)
{
  void *v2;
  const __CFArray *SubResults;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t Range;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  DDResultGetType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("ApproxTime"), "isEqualToString:", v2) & 1) == 0
    && (objc_msgSend(CFSTR("SpecialDateTime"), "isEqualToString:", v2) & 1) == 0)
  {
    if (resultHasApproxTime())
    {
      SubResults = (const __CFArray *)DDResultGetSubResults();
      if (SubResults)
      {
        v4 = SubResults;
        Count = CFArrayGetCount(SubResults);
        if (Count >= 1)
        {
          v6 = Count;
          for (i = 0; i != v6; ++i)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
            _recursiveSafeRangesToRemoveFromResult(ValueAtIndex, v12);
          }
        }
      }
    }
    else
    {
      Range = DDResultGetRange();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", Range, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v11);

    }
  }

}

uint64_t resultHasApproxTime()
{
  const __CFArray *SubResults;
  const __CFArray *v1;
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const void *ValueAtIndex;
  void *v6;
  uint64_t HasApproxTime;

  SubResults = (const __CFArray *)DDResultGetSubResults();
  if (!SubResults)
    return 0;
  v1 = SubResults;
  Count = CFArrayGetCount(SubResults);
  v3 = Count - 1;
  if (Count < 1)
    return 0;
  v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v1, v4);
    DDResultGetType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("ApproxTime"), "isEqualToString:", v6) & 1) != 0
      || objc_msgSend(CFSTR("SpecialDateTime"), "isEqualToString:", v6))
    {
      break;
    }
    HasApproxTime = resultHasApproxTime(ValueAtIndex);

    if ((HasApproxTime & 1) == 0 && v3 != v4++)
      continue;
    return HasApproxTime;
  }

  return 1;
}

uint64_t resultHasExactTime()
{
  const __CFArray *SubResults;
  const __CFArray *v1;
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const void *ValueAtIndex;
  void *v6;
  uint64_t HasExactTime;

  SubResults = (const __CFArray *)DDResultGetSubResults();
  if (!SubResults)
    return 0;
  v1 = SubResults;
  Count = CFArrayGetCount(SubResults);
  v3 = Count - 1;
  if (Count < 1)
    return 0;
  v4 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v1, v4);
    DDResultGetType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (((objc_msgSend(CFSTR("Time"), "isEqualToString:", v6) & 1) != 0
       || objc_msgSend(CFSTR("TimeDuration"), "isEqualToString:", v6))
      && (resultHasApproxTime() & 1) == 0)
    {
      break;
    }
    HasExactTime = resultHasExactTime(ValueAtIndex);

    if ((HasExactTime & 1) == 0 && v3 != v4++)
      continue;
    return HasExactTime;
  }

  return 1;
}

void sub_1A2355A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2356444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "count");
}

id OUTLINED_FUNCTION_9_0(id a1)
{
  return a1;
}

__CFString *EKAvailabilitySpanTypeAsString(unint64_t a1)
{
  if (a1 > 7)
    return 0;
  else
    return off_1E47858A0[a1];
}

void sub_1A235B6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMStructuredLocationClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_2)
  {
    v4 = xmmword_1E4785908;
    v5 = 0;
    ReminderKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_2)
    __getREMStructuredLocationClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("REMStructuredLocation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMStructuredLocationClass_block_invoke_cold_2();
  getREMStructuredLocationClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A235E34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A235F97C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_0_7(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return objc_opt_class();
}

void sub_1A236414C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2364928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2364B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2364CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2364F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void EKTravelEngineLogInitialize()
{
  if (EKTravelEngineLogInitialize_onceToken != -1)
    dispatch_once(&EKTravelEngineLogInitialize_onceToken, &__block_literal_global_27);
}

void sub_1A23689CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2368AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2368BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2368D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2368E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2368F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2369098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2369184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A236A3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id *a9, id *a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,id a62)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a62);
  objc_destroyWeak(a9);
  objc_destroyWeak((id *)&STACK[0x2A0]);
  _Unwind_Resume(a1);
}

void sub_1A236B228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  id *v28;
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(&a21);
  objc_destroyWeak(location);
  objc_destroyWeak(&a28);
  _Unwind_Resume(a1);
}

void sub_1A236E49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_15()
{
  void *v0;

  return objc_msgSend(v0, "availabilitySearchDurationMultiplier");
}

id OUTLINED_FUNCTION_16(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_18(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return objc_opt_class();
}

id OUTLINED_FUNCTION_20(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t OUTLINED_FUNCTION_21()
{
  void *v0;

  return objc_msgSend(v0, "remainingSearchAttempts");
}

void sub_1A236F040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2370B04(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A23737C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23753D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A2377510(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A2379FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A237A348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A237C304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A237E914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id getREMRecurrenceEndClass()
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
  v0 = (void *)getREMRecurrenceEndClass_softClass;
  v7 = getREMRecurrenceEndClass_softClass;
  if (!getREMRecurrenceEndClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getREMRecurrenceEndClass_block_invoke;
    v3[3] = &unk_1E4784C68;
    v3[4] = &v4;
    __getREMRecurrenceEndClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A23802C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getREMRecurrenceRuleClass()
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
  v0 = (void *)getREMRecurrenceRuleClass_softClass_0;
  v7 = getREMRecurrenceRuleClass_softClass_0;
  if (!getREMRecurrenceRuleClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getREMRecurrenceRuleClass_block_invoke_0;
    v3[3] = &unk_1E4784C68;
    v3[4] = &v4;
    __getREMRecurrenceRuleClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A2380380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2380D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMRecurrenceEndClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_2();
  result = objc_getClass("REMRecurrenceEnd");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMRecurrenceEndClass_block_invoke_cold_1();
  getREMRecurrenceEndClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMRecurrenceRuleClass_block_invoke_0(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_2();
  result = objc_getClass("REMRecurrenceRule");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMRecurrenceRuleClass_block_invoke_cold_1_0();
  getREMRecurrenceRuleClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMRecurrenceDayOfWeekClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_2();
  result = objc_getClass("REMRecurrenceDayOfWeek");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMRecurrenceDayOfWeekClass_block_invoke_cold_1();
  getREMRecurrenceDayOfWeekClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1A2386170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23884A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23888CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A238A144(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id logHandle()
{
  if (logHandle_onceToken_0 != -1)
    dispatch_once(&logHandle_onceToken_0, &__block_literal_global_48);
  return (id)logHandle_handle;
}

void __logHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar.eventkit", "EKPredicateExpanding");
  v1 = (void *)logHandle_handle;
  logHandle_handle = (uint64_t)v0;

}

void sub_1A238C01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A238C2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A238C3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A238C514(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1A238C79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A85849D4](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_1A238C8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

id OUTLINED_FUNCTION_5_1()
{
  id *v0;

  return objc_loadWeakRetained(v0);
}

void sub_1A239018C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2391208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23928C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2392BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2392E80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  return objc_opt_class();
}

void sub_1A2395B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A2395C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23A03D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23A7740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23A79E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23A98FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1A23AA0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1A23ADAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1A23B2B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMReminderClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!ReminderKitLibraryCore_frameworkLibrary_4)
  {
    v4 = xmmword_1E4787240;
    v5 = 0;
    ReminderKitLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  if (!ReminderKitLibraryCore_frameworkLibrary_4)
    __getREMReminderClass_block_invoke_cold_1_1(&v3);
  result = objc_getClass("REMReminder");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMReminderClass_block_invoke_cold_2();
  getREMReminderClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkSuggestionsEKEventAvailabilityStateSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreSuggestionsLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E4787258;
    v5 = 0;
    CoreSuggestionsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreSuggestionsLibraryCore_frameworkLibrary)
    __getkSuggestionsEKEventAvailabilityStateSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)CoreSuggestionsLibraryCore_frameworkLibrary, "kSuggestionsEKEventAvailabilityState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getkSuggestionsEKEventAvailabilityStateSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_7_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  void *v0;

  return objc_msgSend(v0, "count");
}

int64_t CalAttendeeStatusToEKParticipantStatus(uint64_t a1)
{
  return +[EKAttendee _ekParticipantStatusFromCalAttendeeStatus:](EKAttendee, "_ekParticipantStatusFromCalAttendeeStatus:", a1);
}

uint64_t EKParticipantStatusToCalAttendeeStatus(uint64_t a1)
{
  return +[EKAttendee _calAttendeeStatusFromEKParticipantStatus:](EKAttendee, "_calAttendeeStatusFromEKParticipantStatus:", a1);
}

void sub_1A23BA7D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A23BB1B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A23BD37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1A23C05B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23C0758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23C0904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23C1268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A23C24B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23C2CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23C4C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a63, 8);
  _Unwind_Resume(a1);
}

void sub_1A23C5810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_3_5(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_7_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_0_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A23C7960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A23CBD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23CBE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23CC528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23CE85C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_7_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_8_1(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_10()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  uint64_t v0;

  return v0;
}

id gondolaDefaultExtensionName()
{
  void *v0;
  void *v1;

  EKBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("FaceTime"), &stru_1E4789A58, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1A23D1EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

void sub_1A23D2BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23D3200(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A23D64B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23D7EE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1A23D9F70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A23DA6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A23DA934(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A23DF688(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A23E4F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  id *v13;
  id *v14;
  uint64_t v15;

  objc_destroyWeak(v13);
  objc_destroyWeak(v14);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 128));
  _Unwind_Resume(a1);
}

void sub_1A23E5CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23E5FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23E6734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A23E7660(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x260], 8);
  _Unwind_Resume(a1);
}

void sub_1A23E85B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a67;

  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_1A23E9264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23E93B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23E9904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23E9AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A23E9E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A23EABB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23EAD2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23EB654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23EB7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23EBF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A23EC314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23EDF0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23EE63C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23EE938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23EEBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23EEF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23EF194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23EF380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23EFA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F0928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F0B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F0C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F0FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F15F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F1E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F3D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F4074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F43E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F4BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F4DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F4F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F55CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F6450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F683C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F6988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F6E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F7538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F76F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F7914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F7A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F831C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F8958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F8F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F91B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A23F9704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F98A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23F9BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23FA07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23FA38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23FC44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A23FDCB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose(&STACK[0x3E0], 8);
  _Block_object_dispose(&STACK[0x410], 8);
  _Block_object_dispose(&STACK[0x440], 8);
  _Block_object_dispose(&STACK[0x470], 8);
  _Block_object_dispose(&STACK[0x4A0], 8);
  _Unwind_Resume(a1);
}

void sub_1A23FEBCC(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x220], 8);
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Unwind_Resume(a1);
}

void sub_1A23FF778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A2400510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A24009E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_1A2401140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A2402204(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A2403608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A24037FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A24039B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2405D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2405F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A240610C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2406E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2406FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2407160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2407388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2407764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2407CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2407F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2408288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A24083C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2408504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2408C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2408F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _shouldUseLegacyAccessBehavior()
{
  NSObject *v0;
  uint64_t v1;
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (_shouldUseLegacyAccessBehavior_onceToken != -1)
    dispatch_once(&_shouldUseLegacyAccessBehavior_onceToken, &__block_literal_global_1361);
  if (_shouldUseLegacyAccessBehavior_forceLegacyBehavior)
  {
    v0 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v4[0]) = 0;
      _os_log_impl(&dword_1A2318000, v0, OS_LOG_TYPE_DEFAULT, "Forcing legacy access behavior.", (uint8_t *)v4, 2u);
    }
    return 1;
  }
  else
  {
    v1 = objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E70901FFFFFFFFLL) ^ 1;
    v2 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl(&dword_1A2318000, v2, OS_LOG_TYPE_INFO, "Using legacy access behavior: %{BOOL}d", (uint8_t *)v4, 8u);
    }
  }
  return v1;
}

void ___shouldUseLegacyAccessBehavior_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("com.apple.private.calendar.has-adopted-modern-request-access-methods"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = v4;
  if (v4)
  {
    v3 = objc_msgSend(v4, "BOOLValue") ^ 1;
    v2 = v4;
    _shouldUseLegacyAccessBehavior_forceLegacyBehavior = v3;
  }

}

void OUTLINED_FUNCTION_16_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

uint64_t OUTLINED_FUNCTION_26()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x1Cu);
}

void OUTLINED_FUNCTION_29(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_31(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_33(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_34()
{
  void *v0;

  return objc_msgSend(v0, "count");
}

id OUTLINED_FUNCTION_35(uint64_t a1, void *a2)
{
  return a2;
}

void OUTLINED_FUNCTION_6_5(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id getREMAlarmTimeIntervalTriggerClass()
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
  v0 = (void *)getREMAlarmTimeIntervalTriggerClass_softClass;
  v7 = getREMAlarmTimeIntervalTriggerClass_softClass;
  if (!getREMAlarmTimeIntervalTriggerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getREMAlarmTimeIntervalTriggerClass_block_invoke;
    v3[3] = &unk_1E4784C68;
    v3[4] = &v4;
    __getREMAlarmTimeIntervalTriggerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A240D46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getREMAlarmDateTriggerClass()
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
  v0 = (void *)getREMAlarmDateTriggerClass_softClass;
  v7 = getREMAlarmDateTriggerClass_softClass;
  if (!getREMAlarmDateTriggerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getREMAlarmDateTriggerClass_block_invoke;
    v3[3] = &unk_1E4784C68;
    v3[4] = &v4;
    __getREMAlarmDateTriggerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A240D524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getREMAlarmLocationTriggerClass()
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
  v0 = (void *)getREMAlarmLocationTriggerClass_softClass;
  v7 = getREMAlarmLocationTriggerClass_softClass;
  if (!getREMAlarmLocationTriggerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getREMAlarmLocationTriggerClass_block_invoke;
    v3[3] = &unk_1E4784C68;
    v3[4] = &v4;
    __getREMAlarmLocationTriggerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A240D5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getREMAlarmTimeIntervalTriggerClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_3();
  result = objc_getClass("REMAlarmTimeIntervalTrigger");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMAlarmTimeIntervalTriggerClass_block_invoke_cold_1();
  getREMAlarmTimeIntervalTriggerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMAlarmDateTriggerClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_3();
  result = objc_getClass("REMAlarmDateTrigger");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMAlarmDateTriggerClass_block_invoke_cold_1();
  getREMAlarmDateTriggerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREMAlarmLocationTriggerClass_block_invoke(uint64_t a1)
{
  Class result;

  ReminderKitLibrary_3();
  result = objc_getClass("REMAlarmLocationTrigger");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREMAlarmLocationTriggerClass_block_invoke_cold_1();
  getREMAlarmLocationTriggerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id EKBundle()
{
  if (EKBundle_onceToken != -1)
    dispatch_once(&EKBundle_onceToken, &__block_literal_global_82);
  return (id)EKBundle_eventKitBundle;
}

uint64_t EKAutoCommentPrefix()
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "CalAutoCommentPrefix");
}

BOOL _bitmaskExclusivelyMatchesOption(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

id EKUtils_AdjustedAttendeeAddress(void *a1)
{
  id v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "length"))
    {
      if (objc_msgSend(v2, "hasPrefix:", CFSTR("mailto:")))
        objc_msgSend(v2, "substringFromIndex:", 7);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("mailto:"), v2);
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = v2;
    }
    v5 = v3;
  }
  else
  {
    v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      EKUtils_AdjustedAttendeeAddress_cold_1(v4);
    v5 = 0;
  }

  return v5;
}

BOOL EKUIAttendeeUtils_AttendeeHasResponded(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;
  NSObject *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = (unint64_t)objc_msgSend(v1, "participantStatus") > 1;
  }
  else
  {
    v4 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      EKUIAttendeeUtils_AttendeeHasResponded_cold_1(v4);
    v3 = 0;
  }

  return v3;
}

uint64_t identityIsEqualToIdentity(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "emailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "emailAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = doURLsEmailsPhoneNumbersMatch();

  return v13;
}

__CFString *EKRedaction(const void *a1, CC_LONG a2, const void *a3, CC_LONG a4)
{
  void *v8;
  void *v9;
  void *v10;
  CC_SHA256_CTX v12;
  char v13;
  _WORD v14[5];
  unsigned __int8 md[32];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(&v12, 0, sizeof(v12));
  CC_SHA256_Init(&v12);
  if (a3 && a4)
  {
    CC_SHA256_Update(&v12, a3, a4);
LABEL_5:
    CC_SHA256_Update(&v12, a1, a2);
    CC_SHA256_Final(md, &v12);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", md, 6, 0);
    objc_msgSend(v8, "base64EncodedDataWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 62;
    objc_msgSend(v9, "getBytes:length:", v14, 8);
    v14[4] = 60;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    return (__CFString *)v10;
  }
  if ((os_variant_has_internal_diagnostics() & 1) != 0)
    goto LABEL_5;
  CC_SHA256_Final(md, &v12);
  return CFSTR("<EKRedacted>");
}

__CFString *EKUUIDString()
{
  const __CFAllocator *v0;
  const __CFUUID *v1;
  __CFString *v2;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v2 = (__CFString *)CFUUIDCreateString(v0, v1);
  CFRelease(v1);
  return v2;
}

uint64_t EKDatabasePerformMigrationIfNeeded()
{
  EKEventStore *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v0 = objc_alloc_init(EKEventStore);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[EKEventStore connection](v0, "connection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "CADOperationProxySync");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __EKDatabasePerformMigrationIfNeeded_block_invoke;
  v5[3] = &unk_1E4784F70;
  v5[4] = &v6;
  objc_msgSend(v2, "CADMigrateDatabaseIfNeeded:", v5);

  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_1A24145D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A2415B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A24167A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A2416800()
{
  qword_1EE6678A8 = 4;
}

uint64_t static EKSpan.everyOccurrence.getter()
{
  return sub_1A24168B0(&qword_1EE6678A0, (uint64_t)&qword_1EE6678A8);
}

void sub_1A241682C()
{
  qword_1EE6678B8 = 3;
}

uint64_t static EKSpan.automaticChange.getter()
{
  return sub_1A24168B0(&qword_1EE6678B0, (uint64_t)&qword_1EE6678B8);
}

void sub_1A2416858()
{
  qword_1EE6678C8 = 2;
}

uint64_t static EKSpan.everyOccurrenceUnlessDetached.getter()
{
  return sub_1A24168B0(&qword_1EE6678C0, (uint64_t)&qword_1EE6678C8);
}

void sub_1A2416884()
{
  qword_1EE666498 = 6;
}

uint64_t static EKSourceType.integrations.getter()
{
  return sub_1A24168B0(&qword_1EE6663F0, (uint64_t)&qword_1EE666498);
}

uint64_t sub_1A24168B0(_QWORD *a1, uint64_t a2)
{
  if (*a1 != -1)
    swift_once();
  return *(_QWORD *)a2;
}

uint64_t sub_1A24168E8()
{
  uint64_t v0;

  v0 = sub_1A2435A1C();
  __swift_allocate_value_buffer(v0, qword_1EE667E88);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE667E88);
  return sub_1A2435A10();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1A24169B4()
{
  uint64_t v0;

  if (qword_1EE6678D0 != -1)
    swift_once();
  v0 = sub_1A2435A1C();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EE667E88);
}

uint64_t EKRemoteUISerializedObject.serializedObjectIDDictionary.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t EKRemoteUISerializedObject.objectIDToChangeSetDictionaryMap.getter()
{
  return swift_bridgeObjectRetain();
}

id sub_1A2416A90()
{
  void *v0;

  sub_1A2424D0C(0, &qword_1EE667958);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667960);
  sub_1A2424CC0(&qword_1EE667968, &qword_1EE667958);
  v0 = (void *)sub_1A2435A28();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t EKRemoteUISerializedObject.objectIDToPersistentDictionaryMap.getter()
{
  return swift_bridgeObjectRetain();
}

id EKRemoteUISerializedObject.__allocating_init(serializedObjectIDDictionary:objectIDToChangeSetDictionaryMap:objectIDToPersistentDictionaryMap:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;
  objc_super v9;

  v7 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v7[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_serializedObjectIDDictionary] = a1;
  *(_QWORD *)&v7[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToChangeSetDictionaryMap] = a2;
  *(_QWORD *)&v7[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToPersistentDictionaryMap] = a3;
  v9.receiver = v7;
  v9.super_class = v3;
  return objc_msgSendSuper2(&v9, sel_init);
}

id EKRemoteUISerializedObject.init(serializedObjectIDDictionary:objectIDToChangeSetDictionaryMap:objectIDToPersistentDictionaryMap:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  objc_super v5;

  *(_QWORD *)&v3[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_serializedObjectIDDictionary] = a1;
  *(_QWORD *)&v3[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToChangeSetDictionaryMap] = a2;
  *(_QWORD *)&v3[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToPersistentDictionaryMap] = a3;
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for EKRemoteUISerializedObject();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for EKRemoteUISerializedObject()
{
  return objc_opt_self();
}

void EKRemoteUISerializedObject.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id EKRemoteUISerializedObject.__deallocating_deinit()
{
  return sub_1A24172B4(type metadata accessor for EKRemoteUISerializedObject);
}

id EKRemoteUIDeserializedObject.deserializedObject.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_deserializedObject);
}

uint64_t EKRemoteUIDeserializedObject.tempObjectIDMap.getter()
{
  return swift_bridgeObjectRetain();
}

id EKRemoteUIDeserializedObject.__allocating_init(deserializedObject:tempObjectIDMap:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_deserializedObject] = a1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_tempObjectIDMap] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id EKRemoteUIDeserializedObject.init(deserializedObject:tempObjectIDMap:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_super v4;

  *(_QWORD *)&v2[OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_deserializedObject] = a1;
  *(_QWORD *)&v2[OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_tempObjectIDMap] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for EKRemoteUIDeserializedObject();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for EKRemoteUIDeserializedObject()
{
  return objc_opt_self();
}

void EKRemoteUIDeserializedObject.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id EKRemoteUIDeserializedObject.__deallocating_deinit()
{
  return sub_1A24172B4(type metadata accessor for EKRemoteUIDeserializedObject);
}

id EKRemoteUIPersistentObjectPointer.objectID.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID);
}

uint64_t EKRemoteUIPersistentObjectPointer.isPendingInsert.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert);
}

uint64_t static EKRemoteUIPersistentObjectPointer.supportsSecureCoding.getter()
{
  return 1;
}

id EKRemoteUIPersistentObjectPointer.__allocating_init(objectID:isPendingInsert:)(uint64_t a1, char a2)
{
  objc_class *v2;
  _BYTE *v5;
  objc_super v7;

  v5 = objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = a1;
  v5[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id EKRemoteUIPersistentObjectPointer.init(objectID:isPendingInsert:)(uint64_t a1, char a2)
{
  _BYTE *v2;
  objc_super v4;

  *(_QWORD *)&v2[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = a1;
  v2[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for EKRemoteUIPersistentObjectPointer();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for EKRemoteUIPersistentObjectPointer()
{
  return objc_opt_self();
}

uint64_t EKRemoteUIPersistentObjectPointer.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = objc_allocWithZone(v1);
  sub_1A2424590(a1);
  v5 = v4;

  return v5;
}

uint64_t EKRemoteUIPersistentObjectPointer.init(coder:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_1A2424590(a1);
  v3 = v2;

  return v3;
}

void sub_1A24170B8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID);
  v4 = (void *)sub_1A2435A4C();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  v5 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert);
  v6 = (id)sub_1A2435A4C();
  objc_msgSend(a1, sel_encodeBool_forKey_, v5, v6);

}

void EKRemoteUIPersistentObjectPointer.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id EKRemoteUIPersistentObjectPointer.__deallocating_deinit()
{
  return sub_1A24172B4(type metadata accessor for EKRemoteUIPersistentObjectPointer);
}

id sub_1A24172B4(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id EKRemoteUIObjectSerializer.serializedRepresentation(ekObject:obfuscateKeyProperties:)(void *a1, int a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  objc_super v8;
  uint64_t v9;
  id v10;

  v9 = MEMORY[0x1E0DEE9E0];
  v10 = (id)MEMORY[0x1E0DEE9E0];
  v2 = sub_1A2417380(a1, a2, &v10, &v9);
  v4 = v9;
  v3 = v10;
  v5 = (objc_class *)type metadata accessor for EKRemoteUISerializedObject();
  v6 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_serializedObjectIDDictionary] = v2;
  *(_QWORD *)&v6[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToChangeSetDictionaryMap] = v3;
  *(_QWORD *)&v6[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToPersistentDictionaryMap] = v4;
  v8.receiver = v6;
  v8.super_class = v5;
  return objc_msgSendSuper2(&v8, sel_init);
}

uint64_t sub_1A2417380(void *a1, int a2, id *a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char isUniquelyReferenced_nonNull_native;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  int64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  unsigned __int8 v39;
  objc_class *v40;
  _BYTE *v41;
  id v42;
  void *ObjCClassFromObject;
  id v44;
  void *v45;
  unsigned __int8 v46;
  uint64_t v47;
  char v48;
  char v49;
  unint64_t v50;
  uint64_t v51;
  _BOOL8 v52;
  uint64_t v53;
  char v54;
  unint64_t v55;
  char v56;
  _QWORD *v57;
  uint64_t *v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  _QWORD *v62;
  char v63;
  char v64;
  unint64_t v65;
  uint64_t v66;
  _BOOL8 v67;
  uint64_t v68;
  char v69;
  unint64_t v70;
  char v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  _OWORD *v77;
  _OWORD *v78;
  id *v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  __int128 *v83;
  id v84;
  char *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  void *v98;
  int64_t v99;
  unint64_t v100;
  int64_t v101;
  __int128 *v102;
  uint64_t *v103;
  char v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  os_log_type_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  os_log_type_t v118;
  uint8_t *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  _QWORD *v124;
  char v125;
  char v126;
  unint64_t v127;
  uint64_t v128;
  _BOOL8 v129;
  uint64_t v130;
  char v131;
  unint64_t v132;
  char v133;
  _QWORD *v134;
  _OWORD *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  unsigned __int8 v142;
  objc_class *v143;
  _BYTE *v144;
  id v145;
  id v146;
  id *v147;
  uint64_t v148;
  char v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  uint64_t v153;
  id v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  id v158;
  id v159;
  id v160;
  void *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  uint64_t v166;
  char *v167;
  unint64_t v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v171;
  _QWORD *v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t v177;
  __int128 *v178;
  uint64_t *v179;
  char v180;
  uint64_t v181;
  uint64_t *v182;
  uint64_t v183;
  unint64_t v184;
  uint64_t v185;
  uint64_t v186;
  NSObject *v187;
  os_log_type_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint8_t *v194;
  uint64_t v195;
  uint64_t v196;
  unint64_t v197;
  id v198;
  _QWORD *v199;
  char v200;
  uint64_t v201;
  uint64_t v202;
  char v203;
  unint64_t v204;
  uint64_t v205;
  _BOOL8 v206;
  uint64_t v207;
  char v208;
  unint64_t v209;
  char v210;
  _QWORD *v211;
  _OWORD *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  unsigned __int8 v219;
  objc_class *v220;
  _BYTE *v221;
  id v222;
  id v223;
  uint64_t v224;
  unint64_t v225;
  uint64_t v226;
  uint64_t v227;
  id v228;
  uint64_t v229;
  unint64_t v230;
  uint64_t v231;
  id v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t *v236;
  uint64_t v237;
  uint64_t v238;
  _QWORD *v239;
  _QWORD *v240;
  uint64_t v241;
  uint64_t v242;
  unint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  char v247;
  id v248;
  id v249;
  void *v250;
  id v251;
  uint64_t v252;
  uint64_t v253;
  id v254;
  char *v255;
  char v256;
  id v257;
  void *v258;
  _QWORD *v259;
  uint64_t v260;
  char v261;
  _QWORD *v262;
  id v263;
  void *v264;
  uint64_t v265;
  uint64_t v266;
  unint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  unint64_t v271;
  __int128 *v272;
  uint64_t *v273;
  unint64_t v274;
  unint64_t v275;
  unint64_t v276;
  uint64_t v277;
  _QWORD *v278;
  uint64_t v279;
  uint64_t v280;
  unint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  void *v286;
  void *v287;
  uint64_t v288;
  _QWORD *v289;
  char v290;
  char v291;
  unint64_t v292;
  uint64_t v293;
  _BOOL8 v294;
  uint64_t v295;
  char v296;
  unint64_t v297;
  char v298;
  unint64_t v299;
  uint64_t *v300;
  uint64_t v301;
  unint64_t v302;
  _QWORD *v303;
  _OWORD *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  _QWORD *v310;
  id v311;
  uint64_t v312;
  uint64_t v313;
  unint64_t v314;
  int64_t v315;
  unint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  char *v322;
  char v323;
  uint64_t v324;
  uint64_t result;
  uint64_t v326;
  int64_t v327;
  id receiver;
  uint64_t v329;
  id v330;
  int64_t p_super_class;
  __int128 v332;
  __int128 v333;
  id v334;
  char *v335;
  uint64_t v336;
  uint64_t *v337;
  uint64_t *v338;
  char *v339;
  int64_t v340;
  uint64_t *v341;
  __int128 *v342;
  __int128 *v343;
  char *v344;
  uint64_t v345;
  uint64_t v346;
  int64_t v347;
  uint64_t *super_class;
  uint64_t v349;
  _QWORD *v350;
  uint64_t v351;
  unint64_t v352;
  id *v353;
  int v354;
  uint64_t v355;
  objc_super v356;
  _OWORD v357[2];
  _QWORD *v358;
  __int128 v359;
  uint64_t v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  uint64_t v365;
  uint64_t v366;
  _QWORD *v367;
  _QWORD *v368;
  _QWORD *v369;
  _QWORD *v370;
  unint64_t v371;
  uint64_t v372;
  uint64_t v373;
  unint64_t v374;
  __int128 v375;
  uint64_t *v376;
  uint64_t v377;
  unint64_t v378;
  objc_super v379;
  uint64_t *v380;
  uint64_t v381;
  unint64_t v382;

  v350 = a4;
  v353 = a3;
  v354 = a2;
  v6 = sub_1A2435A1C();
  v346 = *(_QWORD *)(v6 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v344 = (char *)&v326 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v339 = (char *)&v326 - v9;
  v10 = objc_msgSend(a1, sel_persistentObject);
  if (!v10)
    goto LABEL_322;
  v11 = v10;
  objc_msgSend(v10, sel_isPendingInsert);

  v355 = v4;
  v12 = *(_QWORD *)(v4 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKIsPendingInsertKey);
  v13 = *(_QWORD *)(v4 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKIsPendingInsertKey + 8);
  v14 = sub_1A2424D0C(0, &qword_1EE6679B8);
  swift_bridgeObjectRetain();
  v15 = sub_1A2435AA0();
  v366 = v14;
  *(_QWORD *)&v364 = v15;
  sub_1A2424824(&v364, &v361);
  v16 = (void *)MEMORY[0x1E0DEE9E0];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v379.receiver = v16;
  sub_1A24232A0(&v361, v12, v13, isUniquelyReferenced_nonNull_native);
  receiver = v379.receiver;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v368 = v16;
  v369 = v16;
  v18 = objc_msgSend(a1, sel_changeSet);
  v334 = a1;
  if (!v18)
    goto LABEL_224;
  v330 = v18;
  v19 = objc_msgSend(v18, sel_singleValueChanges);
  v345 = v6;
  if (v19)
  {
    v20 = v19;
    *(_QWORD *)&v364 = 0;
    v351 = MEMORY[0x1E0DEE9B8] + 8;
    sub_1A2435A34();

    if ((_QWORD)v364)
    {
      v352 = 0;
      v347 = v364;
      v21 = *(_QWORD *)(v364 + 64);
      v338 = (uint64_t *)(v364 + 64);
      v22 = 1 << *(_BYTE *)(v364 + 32);
      v23 = -1;
      if (v22 < 64)
        v23 = ~(-1 << v22);
      v24 = v23 & v21;
      v343 = &v362;
      super_class = &v365;
      v340 = (unint64_t)(v22 + 63) >> 6;
      v337 = (uint64_t *)(v340 - 1);
      v25 = (_QWORD *)MEMORY[0x1E0DEE9E0];
      v349 = MEMORY[0x1E0DEE9E0];
      if ((v23 & v21) == 0)
        goto LABEL_10;
LABEL_8:
      v26 = __clz(__rbit64(v24));
      v24 &= v24 - 1;
      v27 = v26 | (v352 << 6);
LABEL_9:
      v28 = *(_QWORD *)(v347 + 56);
      v29 = (_QWORD *)(*(_QWORD *)(v347 + 48) + 16 * v27);
      v30 = v29[1];
      *(_QWORD *)&v361 = *v29;
      *((_QWORD *)&v361 + 1) = v30;
      sub_1A24247A0(v28 + 32 * v27, (uint64_t)v343);
      swift_bridgeObjectRetain();
      v25 = (_QWORD *)v349;
      while (1)
      {
        sub_1A24247DC((uint64_t)&v361, (uint64_t)&v364);
        v34 = *((_QWORD *)&v364 + 1);
        if (!*((_QWORD *)&v364 + 1))
        {
          swift_release();
          goto LABEL_63;
        }
        v35 = v364;
        sub_1A2424824(super_class, &v361);
        sub_1A24247A0((uint64_t)&v361, (uint64_t)&v379);
        sub_1A2424D0C(0, &qword_1EE6679B0);
        if ((swift_dynamicCast() & 1) == 0)
          goto LABEL_38;
        v36 = (void *)v375;
        v37 = objc_msgSend((id)v375, sel_objectID);
        if (!v37)
        {

          v25 = (_QWORD *)v349;
LABEL_38:
          sub_1A24247A0((uint64_t)&v361, (uint64_t)&v379);
          v63 = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)&v375 = v25;
          v65 = sub_1A2420AEC(v35, v34);
          v66 = *(_QWORD *)(v349 + 16);
          v67 = (v64 & 1) == 0;
          v68 = v66 + v67;
          if (__OFADD__(v66, v67))
          {
LABEL_307:
            __break(1u);
LABEL_308:
            __break(1u);
LABEL_309:
            __break(1u);
LABEL_310:
            __break(1u);
LABEL_311:
            __break(1u);
LABEL_312:
            __break(1u);
LABEL_313:
            __break(1u);
LABEL_314:
            __break(1u);
LABEL_315:
            __break(1u);
LABEL_316:
            __break(1u);
LABEL_317:
            __break(1u);
LABEL_318:
            __break(1u);
LABEL_319:
            __break(1u);
            goto LABEL_320;
          }
          v69 = v64;
          if (*(_QWORD *)(v349 + 24) >= v68)
          {
            if ((v63 & 1) != 0)
            {
              v25 = (_QWORD *)v375;
              if ((v64 & 1) == 0)
                goto LABEL_42;
            }
            else
            {
              sub_1A24238B4();
              v25 = (_QWORD *)v375;
              if ((v69 & 1) == 0)
                goto LABEL_42;
            }
          }
          else
          {
            sub_1A242230C(v68, v63);
            v70 = sub_1A2420AEC(v35, v34);
            if ((v69 & 1) != (v71 & 1))
              goto LABEL_324;
            v65 = v70;
            v25 = (_QWORD *)v375;
            if ((v69 & 1) == 0)
            {
LABEL_42:
              v25[(v65 >> 6) + 8] |= 1 << v65;
              v72 = (uint64_t *)(v25[6] + 16 * v65);
              *v72 = v35;
              v72[1] = v34;
              sub_1A2424824(&v379, (_OWORD *)(v25[7] + 32 * v65));
              v73 = v25[2];
              v60 = __OFADD__(v73, 1);
              v74 = v73 + 1;
              if (v60)
                goto LABEL_315;
              v25[2] = v74;
              swift_bridgeObjectRetain();
LABEL_47:
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              __swift_destroy_boxed_opaque_existential_0((uint64_t)&v361);
              v349 = (uint64_t)v25;
              if (v24)
                goto LABEL_8;
              goto LABEL_10;
            }
          }
          v75 = v25;
          v76 = v25[7] + 32 * v65;
          __swift_destroy_boxed_opaque_existential_0(v76);
          v77 = (_OWORD *)v76;
          v25 = v75;
          sub_1A2424824(&v379, v77);
          goto LABEL_47;
        }
        v38 = v37;
        v39 = objc_msgSend(v36, sel_isPendingInsert);
        v40 = (objc_class *)type metadata accessor for EKRemoteUIPersistentObjectPointer();
        v41 = objc_allocWithZone(v40);
        *(_QWORD *)&v41[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v38;
        v41[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = v39;
        v356.receiver = v41;
        v356.super_class = v40;
        v342 = v38;
        v42 = objc_msgSendSuper2(&v356, sel_init);
        ObjCClassFromObject = (void *)swift_getObjCClassFromObject();
        v44 = v36;
        v45 = (void *)sub_1A2435A4C();
        v46 = objc_msgSend(ObjCClassFromObject, sel_isWeakRelationObject_forKey_, v44, v45);

        v381 = (uint64_t)v40;
        v379.receiver = v42;
        sub_1A2424824(&v379, &v375);
        v341 = (uint64_t *)v42;
        v47 = v349;
        v48 = swift_isUniquelyReferenced_nonNull_native();
        v370 = (_QWORD *)v47;
        v50 = sub_1A2420AEC(v35, v34);
        v51 = *(_QWORD *)(v47 + 16);
        v52 = (v49 & 1) == 0;
        v53 = v51 + v52;
        if (__OFADD__(v51, v52))
          goto LABEL_316;
        v54 = v49;
        if (*(_QWORD *)(v47 + 24) >= v53)
        {
          if ((v48 & 1) != 0)
          {
            v57 = v370;
            if ((v49 & 1) != 0)
              goto LABEL_51;
          }
          else
          {
            sub_1A24238B4();
            v57 = v370;
            if ((v54 & 1) != 0)
              goto LABEL_51;
          }
        }
        else
        {
          sub_1A242230C(v53, v48);
          v55 = sub_1A2420AEC(v35, v34);
          if ((v54 & 1) != (v56 & 1))
            goto LABEL_324;
          v50 = v55;
          v57 = v370;
          if ((v54 & 1) != 0)
          {
LABEL_51:
            v62 = v57;
            v78 = (_OWORD *)(v57[7] + 32 * v50);
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v78);
            sub_1A2424824(&v375, v78);
            goto LABEL_52;
          }
        }
        v57[(v50 >> 6) + 8] |= 1 << v50;
        v58 = (uint64_t *)(v57[6] + 16 * v50);
        *v58 = v35;
        v58[1] = v34;
        sub_1A2424824(&v375, (_OWORD *)(v57[7] + 32 * v50));
        v59 = v57[2];
        v60 = __OFADD__(v59, 1);
        v61 = v59 + 1;
        if (v60)
          goto LABEL_317;
        v62 = v57;
        v57[2] = v61;
        swift_bridgeObjectRetain();
LABEL_52:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v46 & 1) != 0)
        {
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v361);

        }
        else
        {
          v79 = v353;
          v80 = sub_1A2419CB0(v44, v354 & 1, v353);
          v81 = swift_isUniquelyReferenced_nonNull_native();
          v379.receiver = *v79;
          *v79 = (id)0x8000000000000000;
          v82 = v80;
          v83 = v342;
          sub_1A2423140(v82, v342, v81);
          *v79 = v379.receiver;

          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v361);
        }
        v6 = v345;
        v25 = v62;
        v349 = (uint64_t)v62;
        if (v24)
          goto LABEL_8;
LABEL_10:
        v31 = v352 + 1;
        if (__OFADD__(v352, 1))
          goto LABEL_312;
        if (v31 < v340)
        {
          v32 = v338[v31];
          if (v32)
            goto LABEL_13;
          v33 = (char *)(v352 + 2);
          ++v352;
          if (v31 + 1 < v340)
          {
            v32 = v338[(_QWORD)v33];
            if (v32)
              goto LABEL_16;
            v352 = v31 + 1;
            if (v31 + 2 < v340)
            {
              v32 = v338[v31 + 2];
              if (v32)
              {
                v31 += 2;
LABEL_13:
                v24 = (v32 - 1) & v32;
                v27 = __clz(__rbit64(v32)) + (v31 << 6);
                v352 = v31;
                goto LABEL_9;
              }
              v33 = (char *)(v31 + 3);
              v352 = v31 + 2;
              if (v31 + 3 < v340)
              {
                v32 = v338[(_QWORD)v33];
                if (!v32)
                {
                  while (1)
                  {
                    v31 = (int64_t)(v33 + 1);
                    if (__OFADD__(v33, 1))
                      goto LABEL_319;
                    if (v31 >= v340)
                    {
                      v352 = (unint64_t)v337;
                      goto LABEL_27;
                    }
                    v32 = v338[v31];
                    ++v33;
                    if (v32)
                      goto LABEL_13;
                  }
                }
LABEL_16:
                v31 = (int64_t)v33;
                goto LABEL_13;
              }
            }
          }
        }
LABEL_27:
        v24 = 0;
        v362 = 0u;
        v363 = 0u;
        v361 = 0u;
      }
    }
  }
  v349 = MEMORY[0x1E0DEE9E0];
LABEL_63:
  v84 = objc_msgSend(v330, sel_multiValueAdditions);
  v85 = v339;
  if (v84)
  {
    v86 = v84;
    *(_QWORD *)&v364 = 0;
    v338 = (uint64_t *)(MEMORY[0x1E0DEE9B8] + 8);
    sub_1A2435A34();

    if ((_QWORD)v364)
    {
      v340 = 0;
      v335 = (char *)v364;
      v87 = *(_QWORD *)(v364 + 64);
      v329 = v364 + 64;
      v88 = 1 << *(_BYTE *)(v364 + 32);
      if (v88 < 64)
        v89 = ~(-1 << v88);
      else
        v89 = -1;
      v90 = v89 & v87;
      *(_QWORD *)&v333 = &v362;
      v337 = &v365;
      p_super_class = (unint64_t)(v88 + 63) >> 6;
      v327 = p_super_class - 1;
      v347 = MEMORY[0x1E0DEE9B0] + 8;
      v332 = xmmword_1A244A7E0;
      if ((v89 & v87) == 0)
        goto LABEL_72;
      while (1)
      {
LABEL_69:
        v91 = __clz(__rbit64(v90));
        v92 = (v90 - 1) & v90;
        v93 = v91 | (v340 << 6);
        v94 = v346;
        while (1)
        {
          v95 = *((_QWORD *)v335 + 7);
          v96 = (_QWORD *)(*((_QWORD *)v335 + 6) + 16 * v93);
          v97 = v96[1];
          *(_QWORD *)&v361 = *v96;
          *((_QWORD *)&v361 + 1) = v97;
          sub_1A24247A0(v95 + 32 * v93, v333);
          swift_bridgeObjectRetain();
LABEL_90:
          sub_1A24247DC((uint64_t)&v361, (uint64_t)&v364);
          v102 = (__int128 *)*((_QWORD *)&v364 + 1);
          if (!*((_QWORD *)&v364 + 1))
          {
            swift_release();
            goto LABEL_142;
          }
          v103 = (uint64_t *)v364;
          sub_1A2424824(v337, &v361);
          sub_1A24247A0((uint64_t)&v361, (uint64_t)&v379);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A38);
          v104 = swift_dynamicCast();
          v342 = v102;
          v343 = (__int128 *)v92;
          v341 = v103;
          if ((v104 & 1) == 0)
            break;
          v105 = v375;
          *(_QWORD *)&v375 = MEMORY[0x1E0DEE9E8];
          if ((v105 & 0xC000000000000001) != 0)
          {
            sub_1A2435B0C();
            sub_1A2424D0C(0, &qword_1EE6679B0);
            sub_1A2424CC0(&qword_1EE6679E0, &qword_1EE6679B0);
            sub_1A2435A88();
            v105 = (unint64_t)v370;
            v352 = v371;
            v106 = v372;
            v107 = v373;
            v108 = v374;
          }
          else
          {
            v107 = 0;
            v136 = -1 << *(_BYTE *)(v105 + 32);
            v137 = *(_QWORD *)(v105 + 56);
            v352 = v105 + 56;
            v138 = ~v136;
            v139 = -v136;
            if (v139 < 64)
              v140 = ~(-1 << v139);
            else
              v140 = -1;
            v108 = v140 & v137;
            v106 = v138;
          }
          super_class = (uint64_t *)(v105 & 0x7FFFFFFFFFFFFFFFLL);
          v336 = v106;
          v351 = (unint64_t)(v106 + 64) >> 6;
          while ((v105 & 0x8000000000000000) != 0)
          {
            v153 = sub_1A2435B30();
            if (!v153)
              goto LABEL_71;
            *(_QWORD *)&v359 = v153;
            sub_1A2424D0C(0, &qword_1EE6679B0);
            swift_unknownObjectRetain();
            swift_dynamicCast();
            v154 = v379.receiver;
            swift_unknownObjectRelease();
            v152 = v107;
            v150 = v108;
            if (!v154)
              goto LABEL_71;
LABEL_137:
            v158 = objc_msgSend(v154, sel_objectID);
            if (v158)
            {
              v141 = v158;
              v142 = objc_msgSend(v154, sel_isPendingInsert);
              v143 = (objc_class *)type metadata accessor for EKRemoteUIPersistentObjectPointer();
              v144 = objc_allocWithZone(v143);
              v145 = v141;
              *(_QWORD *)&v144[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v145;
              v144[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = v142;
              v379.receiver = v144;
              v379.super_class = v143;
              v146 = objc_msgSendSuper2(&v379, sel_init);
              sub_1A242059C(&v379, v146);

              v147 = v353;
              v148 = sub_1A2419CB0(v154, v354 & 1, v353);
              v149 = swift_isUniquelyReferenced_nonNull_native();
              v379.receiver = *v147;
              *v147 = (id)0x8000000000000000;
              sub_1A2423140(v148, v145, v149);
              *v147 = v379.receiver;

              swift_bridgeObjectRelease();
            }
            else
            {

            }
            v107 = v152;
            v108 = v150;
          }
          if (v108)
          {
            v150 = (v108 - 1) & v108;
            v151 = __clz(__rbit64(v108)) | (v107 << 6);
            v152 = v107;
            goto LABEL_136;
          }
          v155 = v107 + 1;
          if (__OFADD__(v107, 1))
          {
            __break(1u);
            goto LABEL_305;
          }
          if (v155 >= v351)
            goto LABEL_71;
          v156 = *(_QWORD *)(v352 + 8 * v155);
          v152 = v107 + 1;
          if (v156)
            goto LABEL_135;
          v152 = v107 + 2;
          if (v107 + 2 >= v351)
            goto LABEL_71;
          v156 = *(_QWORD *)(v352 + 8 * v152);
          if (v156)
            goto LABEL_135;
          v152 = v107 + 3;
          if (v107 + 3 >= v351)
            goto LABEL_71;
          v156 = *(_QWORD *)(v352 + 8 * v152);
          if (v156)
            goto LABEL_135;
          v152 = v107 + 4;
          if (v107 + 4 >= v351)
            goto LABEL_71;
          v156 = *(_QWORD *)(v352 + 8 * v152);
          if (v156)
          {
LABEL_135:
            v150 = (v156 - 1) & v156;
            v151 = __clz(__rbit64(v156)) + (v152 << 6);
LABEL_136:
            v154 = *(id *)(*(_QWORD *)(v105 + 48) + 8 * v151);
            if (!v154)
              goto LABEL_71;
            goto LABEL_137;
          }
          v157 = v107 + 5;
          while (v351 != v157)
          {
            v156 = *(_QWORD *)(v352 + 8 * v157++);
            if (v156)
            {
              v152 = v157 - 1;
              goto LABEL_135;
            }
          }
LABEL_71:
          sub_1A2424D04();
          v98 = (void *)v375;
          v381 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667998);
          v379.receiver = v98;
          sub_1A241AD2C((uint64_t)&v379, (uint64_t)v341, (uint64_t)v342);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v361);
          v6 = v345;
          v85 = v339;
          v90 = (unint64_t)v343;
          if (v343)
            goto LABEL_69;
LABEL_72:
          v99 = v340 + 1;
          v94 = v346;
          if (__OFADD__(v340, 1))
            goto LABEL_313;
          if (v99 >= p_super_class)
            goto LABEL_89;
          v100 = *(_QWORD *)(v329 + 8 * v99);
          if (v100)
            goto LABEL_75;
          v101 = v340 + 2;
          ++v340;
          if (v99 + 1 >= p_super_class)
            goto LABEL_89;
          v100 = *(_QWORD *)(v329 + 8 * v101);
          if (v100)
            goto LABEL_78;
          v340 = v99 + 1;
          if (v99 + 2 >= p_super_class)
          {
LABEL_89:
            v92 = 0;
            v362 = 0u;
            v363 = 0u;
            v361 = 0u;
            goto LABEL_90;
          }
          v100 = *(_QWORD *)(v329 + 8 * (v99 + 2));
          if (!v100)
          {
            v101 = v99 + 3;
            v340 = v99 + 2;
            if (v99 + 3 < p_super_class)
            {
              v100 = *(_QWORD *)(v329 + 8 * v101);
              if (v100)
              {
LABEL_78:
                v99 = v101;
                goto LABEL_75;
              }
              while (1)
              {
                v99 = v101 + 1;
                if (__OFADD__(v101, 1))
                  break;
                if (v99 >= p_super_class)
                {
                  v340 = v327;
                  goto LABEL_89;
                }
                v100 = *(_QWORD *)(v329 + 8 * v99);
                ++v101;
                if (v100)
                  goto LABEL_75;
              }
LABEL_320:
              __break(1u);
LABEL_321:
              __break(1u);
LABEL_322:
              __break(1u);
LABEL_323:
              __break(1u);
              goto LABEL_324;
            }
            goto LABEL_89;
          }
          v99 += 2;
LABEL_75:
          v92 = (v100 - 1) & v100;
          v93 = __clz(__rbit64(v100)) + (v99 << 6);
          v340 = v99;
        }
        if (qword_1EE6678D0 != -1)
          swift_once();
        v109 = __swift_project_value_buffer(v6, (uint64_t)qword_1EE667E88);
        (*(void (**)(char *, uint64_t, uint64_t))(v94 + 16))(v85, v109, v6);
        v110 = swift_allocObject();
        *(_QWORD *)(v110 + 16) = v103;
        *(_QWORD *)(v110 + 24) = v102;
        swift_bridgeObjectRetain_n();
        v111 = sub_1A2435A04();
        v112 = sub_1A2435A94();
        v113 = swift_allocObject();
        *(_BYTE *)(v113 + 16) = 32;
        v114 = swift_allocObject();
        *(_BYTE *)(v114 + 16) = 8;
        v115 = swift_allocObject();
        *(_QWORD *)(v115 + 16) = sub_1A2424F04;
        *(_QWORD *)(v115 + 24) = v110;
        v116 = swift_allocObject();
        *(_QWORD *)(v116 + 16) = sub_1A2424EC4;
        *(_QWORD *)(v116 + 24) = v115;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679A0);
        v117 = swift_allocObject();
        *(_OWORD *)(v117 + 16) = v332;
        *(_QWORD *)(v117 + 32) = sub_1A2424F00;
        *(_QWORD *)(v117 + 40) = v113;
        *(_QWORD *)(v117 + 48) = sub_1A2424F00;
        *(_QWORD *)(v117 + 56) = v114;
        *(_QWORD *)(v117 + 64) = sub_1A2424EC8;
        *(_QWORD *)(v117 + 72) = v116;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_bridgeObjectRelease();
        v118 = v112;
        v352 = (unint64_t)v111;
        if (os_log_type_enabled(v111, v112))
        {
          v119 = (uint8_t *)swift_slowAlloc();
          v120 = (void *)swift_slowAlloc();
          v379.receiver = v120;
          *(_WORD *)v119 = 258;
          v119[2] = 32;
          swift_release();
          v119[3] = 8;
          swift_release();
          v121 = (uint64_t)v342;
          swift_bridgeObjectRetain();
          v122 = (uint64_t)v341;
          *(_QWORD *)&v375 = sub_1A241FC64((uint64_t)v341, v121, (uint64_t *)&v379);
          sub_1A2435AC4();
          swift_release();
          swift_release();
          swift_release();
          swift_bridgeObjectRelease_n();
          v123 = (id)v352;
          _os_log_impl(&dword_1A2318000, (os_log_t)v352, v118, "EKRemoteUIObjectSerializer: Cannot parse changeSet multiValueAdditions as Set<EKPersistentObject> for key: %s", v119, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1A8584D7C](v120, -1, -1);
          MEMORY[0x1A8584D7C](v119, -1, -1);

          v85 = v339;
          (*(void (**)(char *, uint64_t))(v346 + 8))(v339, v345);
        }
        else
        {

          v121 = (uint64_t)v342;
          swift_bridgeObjectRelease();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          v85 = v339;
          (*(void (**)(char *, uint64_t))(v346 + 8))(v339, v345);
          v122 = (uint64_t)v341;
        }
        sub_1A24247A0((uint64_t)&v361, (uint64_t)&v379);
        v124 = v369;
        v125 = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)&v375 = v124;
        v127 = sub_1A2420AEC(v122, v121);
        v128 = v124[2];
        v129 = (v126 & 1) == 0;
        v130 = v128 + v129;
        v90 = (unint64_t)v343;
        if (__OFADD__(v128, v129))
          goto LABEL_309;
        v131 = v126;
        if (v124[3] >= v130)
        {
          if ((v125 & 1) != 0)
          {
            v134 = (_QWORD *)v375;
            if ((v126 & 1) == 0)
              goto LABEL_103;
          }
          else
          {
            sub_1A24238B4();
            v134 = (_QWORD *)v375;
            if ((v131 & 1) == 0)
              goto LABEL_103;
          }
LABEL_106:
          v135 = (_OWORD *)(v134[7] + 32 * v127);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v135);
          sub_1A2424824(&v379, v135);
          goto LABEL_107;
        }
        sub_1A242230C(v130, v125);
        v132 = sub_1A2420AEC(v122, v121);
        if ((v131 & 1) != (v133 & 1))
          goto LABEL_324;
        v127 = v132;
        v134 = (_QWORD *)v375;
        if ((v131 & 1) != 0)
          goto LABEL_106;
LABEL_103:
        sub_1A24236A4(v127, v122, v121, &v379, v134);
        swift_bridgeObjectRetain();
LABEL_107:
        v6 = v345;
        v369 = v134;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v361);
        if (!v90)
          goto LABEL_72;
      }
    }
  }
LABEL_142:
  v159 = v330;
  v160 = objc_msgSend(v330, sel_multiValueRemovals);
  if (!v160)
  {

LABEL_223:
    v16 = (void *)v349;
LABEL_224:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A20);
    v233 = swift_allocObject();
    *(_OWORD *)(v233 + 16) = xmmword_1A244A7E0;
    v234 = v355;
    v235 = *(_QWORD *)(v355 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetSingleValueChangesKey + 8);
    *(_QWORD *)(v233 + 32) = *(_QWORD *)(v355
                                       + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetSingleValueChangesKey);
    *(_QWORD *)(v233 + 40) = v235;
    v236 = (uint64_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE667960);
    *(_QWORD *)(v233 + 48) = v16;
    v237 = *(_QWORD *)(v234 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueAdditionsKey);
    v238 = *(_QWORD *)(v234
                     + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueAdditionsKey
                     + 8);
    *(_QWORD *)(v233 + 72) = v236;
    *(_QWORD *)(v233 + 80) = v237;
    v240 = v368;
    v239 = v369;
    *(_QWORD *)(v233 + 88) = v238;
    *(_QWORD *)(v233 + 96) = v239;
    v241 = *(_QWORD *)(v234 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueRemovalsKey);
    v242 = *(_QWORD *)(v234 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueRemovalsKey + 8);
    *(_QWORD *)(v233 + 120) = v236;
    *(_QWORD *)(v233 + 128) = v241;
    *(_QWORD *)(v233 + 168) = v236;
    *(_QWORD *)(v233 + 136) = v242;
    *(_QWORD *)(v233 + 144) = v240;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v243 = sub_1A241AF48(v233);
    v244 = *(_QWORD *)(v234 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetKey);
    v245 = *(_QWORD *)(v234 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetKey + 8);
    v366 = (uint64_t)v236;
    *(_QWORD *)&v364 = v243;
    sub_1A2424824(&v364, &v361);
    swift_bridgeObjectRetain();
    v246 = receiver;
    v247 = swift_isUniquelyReferenced_nonNull_native();
    v379.receiver = v246;
    sub_1A24232A0(&v361, v244, v245, v247);
    v339 = (char *)v379.receiver;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v248 = v334;
    v249 = objc_msgSend(v334, sel_persistentObject);
    if (!v249)
      goto LABEL_323;
    v250 = v249;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v251 = objc_msgSend(v250, sel_objectID);

    if (v251)
    {
      v252 = *(_QWORD *)(v355 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKPersistentObjectKey);
      v253 = *(_QWORD *)(v355 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKPersistentObjectKey + 8);
      v366 = sub_1A2424D0C(0, &qword_1EE667958);
      *(_QWORD *)&v364 = v251;
      sub_1A2424824(&v364, &v361);
      swift_bridgeObjectRetain();
      v254 = v251;
      v255 = v339;
      v256 = swift_isUniquelyReferenced_nonNull_native();
      v379.receiver = v255;
      sub_1A24232A0(&v361, v252, v253, v256);
      v339 = (char *)v379.receiver;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v257 = objc_msgSend(v248, sel_backingObject);
      if (v257)
      {
        v258 = v257;
        v259 = v350;
        v260 = sub_1A2419CB0(v257, v354 & 1, v350);
        v261 = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)&v364 = *v259;
        *v259 = 0x8000000000000000;
        sub_1A2423140(v260, v254, v261);
        *v259 = v364;
        v248 = v334;

        swift_bridgeObjectRelease();
      }
      else
      {

      }
    }
    v262 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    v367 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    v263 = objc_msgSend(v248, sel_cachedMeltedObjects);
    if (!v263
      || (v264 = v263,
          v265 = MEMORY[0x1E0DEE9B8] + 8,
          v266 = sub_1A2435A40(),
          v264,
          v267 = sub_1A241B07C(v266),
          swift_bridgeObjectRelease(),
          !v267))
    {
LABEL_303:
      v320 = *(_QWORD *)(v355 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKCachedMeltedObjectsKey);
      v321 = *(_QWORD *)(v355 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKCachedMeltedObjectsKey + 8);
      v366 = (uint64_t)v236;
      *(_QWORD *)&v364 = v262;
      sub_1A2424824(&v364, &v361);
      swift_bridgeObjectRetain();
      v322 = v339;
      v323 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)&v359 = v322;
      sub_1A24232A0(&v361, v320, v321, v323);
      v324 = v359;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v324;
    }
    v349 = 0;
    v268 = *(_QWORD *)(v267 + 64);
    v340 = v267 + 64;
    v269 = 1 << *(_BYTE *)(v267 + 32);
    if (v269 < 64)
      v270 = ~(-1 << v269);
    else
      v270 = -1;
    v271 = v270 & v268;
    v272 = &v362;
    v273 = &v365;
    v344 = (char *)((unint64_t)(v269 + 63) >> 6);
    v335 = v344 - 1;
    v345 = MEMORY[0x1E0DEE9B0] + 8;
    v342 = &v362;
    v343 = (__int128 *)v267;
    v341 = &v365;
    v336 = v265;
    v337 = v236;
    while (v271)
    {
      v274 = __clz(__rbit64(v271));
      v275 = (v271 - 1) & v271;
      v276 = v274 | (v349 << 6);
LABEL_238:
      v277 = *(_QWORD *)(v267 + 56);
      v278 = (_QWORD *)(*(_QWORD *)(v267 + 48) + 16 * v276);
      v279 = v278[1];
      *(_QWORD *)&v361 = *v278;
      *((_QWORD *)&v361 + 1) = v279;
      sub_1A24247A0(v277 + 32 * v276, (uint64_t)v272);
      swift_bridgeObjectRetain();
LABEL_257:
      sub_1A24247DC((uint64_t)&v361, (uint64_t)&v364);
      v283 = *((_QWORD *)&v364 + 1);
      if (!*((_QWORD *)&v364 + 1))
      {
        swift_release();
        v262 = v367;
        goto LABEL_303;
      }
      v352 = v275;
      v284 = v364;
      sub_1A2424824(v273, &v361);
      v285 = swift_getObjCClassFromObject();
      v351 = v284;
      v286 = (void *)sub_1A2435A4C();
      LOBYTE(v285) = objc_msgSend((id)v285, sel_isWeakRelationObject_forKey_, v248, v286);

      if ((v285 & 1) != 0)
      {
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v361);
        swift_bridgeObjectRelease();
        v271 = v352;
        continue;
      }
      sub_1A24247A0((uint64_t)&v361, (uint64_t)&v359);
      sub_1A2424D0C(0, &qword_1EE667990);
      if (swift_dynamicCast())
      {
        v287 = *(void **)&v357[0];
        v288 = sub_1A2417380(*(_QWORD *)&v357[0], v354 & 1, v353, v350);
        v360 = (uint64_t)v236;
        *(_QWORD *)&v359 = v288;
        sub_1A2424824(&v359, v357);
        v289 = v367;
        v290 = swift_isUniquelyReferenced_nonNull_native();
        v358 = v289;
        v292 = sub_1A2420AEC(v351, v283);
        v293 = v289[2];
        v294 = (v291 & 1) == 0;
        v295 = v293 + v294;
        if (__OFADD__(v293, v294))
          goto LABEL_311;
        v296 = v291;
        if (v289[3] >= v295)
        {
          if ((v290 & 1) == 0)
            sub_1A24238B4();
        }
        else
        {
          sub_1A242230C(v295, v290);
          v297 = sub_1A2420AEC(v351, v283);
          if ((v296 & 1) != (v298 & 1))
            goto LABEL_324;
          v292 = v297;
        }
        v273 = v341;
        v303 = v358;
        if ((v296 & 1) != 0)
        {
          v304 = (_OWORD *)(v358[7] + 32 * v292);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v304);
          sub_1A2424824(v357, v304);
        }
        else
        {
          sub_1A24236A4(v292, v351, v283, v357, v358);
          swift_bridgeObjectRetain();
        }
        v267 = (unint64_t)v343;
        v367 = v303;

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v361);
        v272 = v342;
        v271 = v352;
        continue;
      }
      sub_1A24247A0((uint64_t)&v361, (uint64_t)&v359);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A28);
      if ((swift_dynamicCast() & 1) == 0)
      {
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v361);
        v271 = v352;
        continue;
      }
      v299 = *(_QWORD *)&v357[0];
      *(_QWORD *)&v357[0] = MEMORY[0x1E0DEE9D8];
      if ((v299 & 0xC000000000000001) != 0)
      {
        sub_1A2435B0C();
        sub_1A2424CC0(&qword_1EE667A30, &qword_1EE667990);
        sub_1A2435A88();
        v299 = (unint64_t)v379.receiver;
        super_class = (uint64_t *)v379.super_class;
        v300 = v380;
        v301 = v381;
        v302 = v382;
      }
      else
      {
        v301 = 0;
        v305 = -1 << *(_BYTE *)(v299 + 32);
        v306 = *(_QWORD *)(v299 + 56);
        super_class = (uint64_t *)(v299 + 56);
        v307 = ~v305;
        v308 = -v305;
        if (v308 < 64)
          v309 = ~(-1 << v308);
        else
          v309 = -1;
        v302 = v309 & v306;
        v300 = (uint64_t *)v307;
      }
      v338 = v300;
      v346 = v299 & 0x7FFFFFFFFFFFFFFFLL;
      v347 = (unint64_t)(v300 + 8) >> 6;
      if ((v299 & 0x8000000000000000) != 0)
      {
LABEL_279:
        v310 = (_QWORD *)sub_1A2435B30();
        if (!v310)
          goto LABEL_301;
        v358 = v310;
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v311 = (id)v359;
        swift_unknownObjectRelease();
        v312 = v301;
        v313 = v302;
        if (!v311)
          goto LABEL_301;
        goto LABEL_299;
      }
      while (v302)
      {
        v313 = (v302 - 1) & v302;
        v314 = __clz(__rbit64(v302)) | (v301 << 6);
        v312 = v301;
LABEL_298:
        v311 = *(id *)(*(_QWORD *)(v299 + 48) + 8 * v314);
        if (!v311)
          goto LABEL_301;
LABEL_299:
        v318 = sub_1A2417380(v311, v354 & 1, v353, v350);
        sub_1A241B44C(v318);

        v301 = v312;
        v302 = v313;
        if ((v299 & 0x8000000000000000) != 0)
          goto LABEL_279;
      }
      v315 = v301 + 1;
      if (__OFADD__(v301, 1))
      {
LABEL_306:
        __break(1u);
        goto LABEL_307;
      }
      if (v315 >= v347)
        goto LABEL_301;
      v316 = super_class[v315];
      v312 = v301 + 1;
      if (v316)
        goto LABEL_297;
      v312 = v301 + 2;
      if (v301 + 2 >= v347)
        goto LABEL_301;
      v316 = super_class[v312];
      if (v316)
        goto LABEL_297;
      v312 = v301 + 3;
      if (v301 + 3 >= v347)
        goto LABEL_301;
      v316 = super_class[v312];
      if (v316)
        goto LABEL_297;
      v312 = v301 + 4;
      if (v301 + 4 >= v347)
        goto LABEL_301;
      v316 = super_class[v312];
      if (v316)
      {
LABEL_297:
        v313 = (v316 - 1) & v316;
        v314 = __clz(__rbit64(v316)) + (v312 << 6);
        goto LABEL_298;
      }
      v317 = v301 + 5;
      while (v347 != v317)
      {
        v316 = super_class[v317++];
        if (v316)
        {
          v312 = v317 - 1;
          goto LABEL_297;
        }
      }
LABEL_301:
      sub_1A2424D04();
      v319 = *(_QWORD *)&v357[0];
      v360 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667980);
      *(_QWORD *)&v359 = v319;
      sub_1A241AD2C((uint64_t)&v359, v351, v283);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v361);
      v248 = v334;
      v236 = v337;
      v272 = v342;
      v267 = (unint64_t)v343;
      v273 = v341;
      v271 = v352;
    }
    v280 = v349 + 1;
    if (__OFADD__(v349, 1))
      goto LABEL_308;
    if (v280 >= (uint64_t)v344)
      goto LABEL_256;
    v281 = *(_QWORD *)(v340 + 8 * v280);
    if (!v281)
    {
      v282 = v349 + 2;
      ++v349;
      if (v280 + 1 >= (uint64_t)v344)
        goto LABEL_256;
      v281 = *(_QWORD *)(v340 + 8 * v282);
      if (!v281)
      {
        v349 = v280 + 1;
        if (v280 + 2 >= (uint64_t)v344)
          goto LABEL_256;
        v281 = *(_QWORD *)(v340 + 8 * (v280 + 2));
        if (v281)
        {
          v280 += 2;
          goto LABEL_242;
        }
        v282 = v280 + 3;
        v349 = v280 + 2;
        if (v280 + 3 >= (uint64_t)v344)
          goto LABEL_256;
        v281 = *(_QWORD *)(v340 + 8 * v282);
        if (!v281)
        {
          while (1)
          {
            v280 = v282 + 1;
            if (__OFADD__(v282, 1))
              goto LABEL_318;
            if (v280 >= (uint64_t)v344)
              break;
            v281 = *(_QWORD *)(v340 + 8 * v280);
            ++v282;
            if (v281)
              goto LABEL_242;
          }
          v349 = (uint64_t)v335;
LABEL_256:
          v275 = 0;
          v362 = 0u;
          v363 = 0u;
          v361 = 0u;
          goto LABEL_257;
        }
      }
      v280 = v282;
    }
LABEL_242:
    v275 = (v281 - 1) & v281;
    v276 = __clz(__rbit64(v281)) + (v280 << 6);
    v349 = v280;
    goto LABEL_238;
  }
  v161 = v160;
  *(_QWORD *)&v364 = 0;
  v339 = (char *)(MEMORY[0x1E0DEE9B8] + 8);
  sub_1A2435A34();

  if (!(_QWORD)v364)
  {

    goto LABEL_223;
  }
  v340 = 0;
  v336 = v364;
  v162 = *(_QWORD *)(v364 + 64);
  v329 = v364 + 64;
  v163 = 1 << *(_BYTE *)(v364 + 32);
  if (v163 < 64)
    v164 = ~(-1 << v163);
  else
    v164 = -1;
  v165 = v164 & v162;
  v335 = (char *)&v362;
  v338 = &v365;
  p_super_class = (int64_t)&v379.super_class;
  *(_QWORD *)&v332 = (unint64_t)(v163 + 63) >> 6;
  v327 = v332 - 1;
  v347 = MEMORY[0x1E0DEE9B0] + 8;
  v333 = xmmword_1A244A7E0;
  v166 = v346;
  v167 = v344;
  if ((v164 & v162) == 0)
    goto LABEL_151;
LABEL_148:
  while (2)
  {
    v168 = __clz(__rbit64(v165));
    v169 = (v165 - 1) & v165;
    v170 = v168 | (v340 << 6);
LABEL_149:
    v171 = *(_QWORD *)(v336 + 56);
    v172 = (_QWORD *)(*(_QWORD *)(v336 + 48) + 16 * v170);
    v173 = v172[1];
    *(_QWORD *)&v361 = *v172;
    *((_QWORD *)&v361 + 1) = v173;
    sub_1A24247A0(v171 + 32 * v170, (uint64_t)v335);
    swift_bridgeObjectRetain();
    v167 = v344;
    while (1)
    {
      sub_1A24247DC((uint64_t)&v361, (uint64_t)&v364);
      v178 = (__int128 *)*((_QWORD *)&v364 + 1);
      if (!*((_QWORD *)&v364 + 1))
      {

        swift_release();
        goto LABEL_223;
      }
      v179 = (uint64_t *)v364;
      sub_1A2424824(v338, &v361);
      sub_1A24247A0((uint64_t)&v361, (uint64_t)&v379);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A38);
      v180 = swift_dynamicCast();
      v342 = v178;
      v343 = (__int128 *)v169;
      v341 = v179;
      if ((v180 & 1) == 0)
        break;
      v181 = v359;
      *(_QWORD *)&v359 = MEMORY[0x1E0DEE9E8];
      if ((v181 & 0xC000000000000001) != 0)
      {
        sub_1A2435B0C();
        sub_1A2424D0C(0, &qword_1EE6679B0);
        sub_1A2424CC0(&qword_1EE6679E0, &qword_1EE6679B0);
        sub_1A2435A88();
        v352 = *((_QWORD *)&v375 + 1);
        v181 = v375;
        v182 = v376;
        v183 = v377;
        v184 = v378;
      }
      else
      {
        v183 = 0;
        v213 = -1 << *(_BYTE *)(v181 + 32);
        v214 = *(_QWORD *)(v181 + 56);
        v352 = v181 + 56;
        v215 = ~v213;
        v216 = -v213;
        if (v216 < 64)
          v217 = ~(-1 << v216);
        else
          v217 = -1;
        v184 = v217 & v214;
        v182 = (uint64_t *)v215;
      }
      super_class = (uint64_t *)(v181 & 0x7FFFFFFFFFFFFFFFLL);
      v337 = v182;
      v351 = (unint64_t)(v182 + 8) >> 6;
      while (v181 < 0)
      {
        v227 = sub_1A2435B30();
        if (!v227)
          goto LABEL_150;
        *(_QWORD *)&v357[0] = v227;
        sub_1A2424D0C(0, &qword_1EE6679B0);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v228 = v379.receiver;
        swift_unknownObjectRelease();
        v226 = v183;
        v224 = v184;
        if (!v228)
          goto LABEL_150;
LABEL_216:
        v232 = objc_msgSend(v228, sel_objectID);
        if (v232)
        {
          v218 = v232;
          v219 = objc_msgSend(v228, sel_isPendingInsert);
          v220 = (objc_class *)type metadata accessor for EKRemoteUIPersistentObjectPointer();
          v221 = objc_allocWithZone(v220);
          v222 = v218;
          *(_QWORD *)&v221[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v222;
          v221[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = v219;
          v379.receiver = v221;
          v379.super_class = v220;
          v223 = objc_msgSendSuper2(&v379, sel_init);
          sub_1A242059C(&v379, v223);

        }
        else
        {

        }
        v183 = v226;
        v184 = v224;
      }
      if (v184)
      {
        v224 = (v184 - 1) & v184;
        v225 = __clz(__rbit64(v184)) | (v183 << 6);
        v226 = v183;
        goto LABEL_215;
      }
      v229 = v183 + 1;
      if (__OFADD__(v183, 1))
      {
LABEL_305:
        __break(1u);
        goto LABEL_306;
      }
      if (v229 >= v351)
        goto LABEL_150;
      v230 = *(_QWORD *)(v352 + 8 * v229);
      v226 = v183 + 1;
      if (v230)
        goto LABEL_214;
      v226 = v183 + 2;
      if (v183 + 2 >= v351)
        goto LABEL_150;
      v230 = *(_QWORD *)(v352 + 8 * v226);
      if (v230)
        goto LABEL_214;
      v226 = v183 + 3;
      if (v183 + 3 >= v351)
        goto LABEL_150;
      v230 = *(_QWORD *)(v352 + 8 * v226);
      if (v230)
        goto LABEL_214;
      v226 = v183 + 4;
      if (v183 + 4 >= v351)
        goto LABEL_150;
      v230 = *(_QWORD *)(v352 + 8 * v226);
      if (v230)
      {
LABEL_214:
        v224 = (v230 - 1) & v230;
        v225 = __clz(__rbit64(v230)) + (v226 << 6);
LABEL_215:
        v228 = *(id *)(*(_QWORD *)(v181 + 48) + 8 * v225);
        if (!v228)
          goto LABEL_150;
        goto LABEL_216;
      }
      v231 = v183 + 5;
      while (v351 != v231)
      {
        v230 = *(_QWORD *)(v352 + 8 * v231++);
        if (v230)
        {
          v226 = v231 - 1;
          goto LABEL_214;
        }
      }
LABEL_150:
      sub_1A2424D04();
      v174 = (void *)v359;
      v381 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667998);
      v379.receiver = v174;
      sub_1A241AD2C((uint64_t)&v379, (uint64_t)v341, (uint64_t)v342);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v361);
      v6 = v345;
      v166 = v346;
      v165 = (unint64_t)v343;
      v167 = v344;
      if (v343)
        goto LABEL_148;
LABEL_151:
      v175 = v340 + 1;
      if (__OFADD__(v340, 1))
        goto LABEL_314;
      if (v175 < (uint64_t)v332)
      {
        v176 = *(_QWORD *)(v329 + 8 * v175);
        if (v176)
          goto LABEL_154;
        v177 = v340 + 2;
        ++v340;
        if (v175 + 1 < (uint64_t)v332)
        {
          v176 = *(_QWORD *)(v329 + 8 * v177);
          if (v176)
            goto LABEL_157;
          v340 = v175 + 1;
          if (v175 + 2 < (uint64_t)v332)
          {
            v176 = *(_QWORD *)(v329 + 8 * (v175 + 2));
            if (!v176)
            {
              v177 = v175 + 3;
              v340 = v175 + 2;
              if (v175 + 3 < (uint64_t)v332)
              {
                v176 = *(_QWORD *)(v329 + 8 * v177);
                if (v176)
                {
LABEL_157:
                  v175 = v177;
                  goto LABEL_154;
                }
                while (1)
                {
                  v175 = v177 + 1;
                  if (__OFADD__(v177, 1))
                    goto LABEL_321;
                  if (v175 >= (uint64_t)v332)
                  {
                    v340 = v327;
                    goto LABEL_168;
                  }
                  v176 = *(_QWORD *)(v329 + 8 * v175);
                  ++v177;
                  if (v176)
                    goto LABEL_154;
                }
              }
              goto LABEL_168;
            }
            v175 += 2;
LABEL_154:
            v169 = (v176 - 1) & v176;
            v170 = __clz(__rbit64(v176)) + (v175 << 6);
            v340 = v175;
            goto LABEL_149;
          }
        }
      }
LABEL_168:
      v169 = 0;
      v362 = 0u;
      v363 = 0u;
      v361 = 0u;
    }
    if (qword_1EE6678D0 != -1)
      swift_once();
    v185 = __swift_project_value_buffer(v6, (uint64_t)qword_1EE667E88);
    (*(void (**)(char *, uint64_t, uint64_t))(v166 + 16))(v167, v185, v6);
    v186 = swift_allocObject();
    *(_QWORD *)(v186 + 16) = v179;
    *(_QWORD *)(v186 + 24) = v178;
    swift_bridgeObjectRetain();
    v187 = sub_1A2435A04();
    v188 = sub_1A2435A94();
    v189 = swift_allocObject();
    *(_BYTE *)(v189 + 16) = 32;
    v190 = swift_allocObject();
    *(_BYTE *)(v190 + 16) = 8;
    v191 = swift_allocObject();
    *(_QWORD *)(v191 + 16) = sub_1A2424DD8;
    *(_QWORD *)(v191 + 24) = v186;
    v192 = swift_allocObject();
    *(_QWORD *)(v192 + 16) = sub_1A2424EC4;
    *(_QWORD *)(v192 + 24) = v191;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679A0);
    v193 = swift_allocObject();
    *(_OWORD *)(v193 + 16) = v333;
    *(_QWORD *)(v193 + 32) = sub_1A2424F00;
    *(_QWORD *)(v193 + 40) = v189;
    *(_QWORD *)(v193 + 48) = sub_1A2424F00;
    *(_QWORD *)(v193 + 56) = v190;
    *(_QWORD *)(v193 + 64) = sub_1A2424EC8;
    *(_QWORD *)(v193 + 72) = v192;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRelease();
    v352 = (unint64_t)v187;
    if (os_log_type_enabled(v187, v188))
    {
      v194 = (uint8_t *)swift_slowAlloc();
      v195 = swift_slowAlloc();
      *(_QWORD *)&v359 = v195;
      *(_WORD *)v194 = 258;
      v194[2] = 32;
      swift_release();
      v194[3] = 8;
      swift_release();
      swift_retain();
      v196 = *(_QWORD *)(v186 + 16);
      v197 = *(_QWORD *)(v186 + 24);
      swift_bridgeObjectRetain();
      v379.receiver = (id)sub_1A241FC64(v196, v197, (uint64_t *)&v359);
      sub_1A2435AD0();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v198 = (id)v352;
      _os_log_impl(&dword_1A2318000, (os_log_t)v352, v188, "EKRemoteUIObjectSerializer: Cannot parse changeSet multiValueRemovals as Set<EKPersistentObject> for key: %s", v194, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A8584D7C](v195, -1, -1);
      MEMORY[0x1A8584D7C](v194, -1, -1);

    }
    else
    {

      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
    }
    v6 = v345;
    (*(void (**)(char *, uint64_t))(v346 + 8))(v344, v345);
    sub_1A24247A0((uint64_t)&v361, (uint64_t)&v379);
    v199 = v368;
    v200 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v359 = v199;
    v202 = (uint64_t)v341;
    v201 = (uint64_t)v342;
    v204 = sub_1A2420AEC((uint64_t)v341, (uint64_t)v342);
    v205 = v199[2];
    v206 = (v203 & 1) == 0;
    v207 = v205 + v206;
    v165 = (unint64_t)v343;
    if (__OFADD__(v205, v206))
      goto LABEL_310;
    v208 = v203;
    if (v199[3] >= v207)
    {
      if ((v200 & 1) != 0)
      {
        v211 = (_QWORD *)v359;
        if ((v203 & 1) != 0)
          goto LABEL_185;
      }
      else
      {
        sub_1A24238B4();
        v211 = (_QWORD *)v359;
        if ((v208 & 1) != 0)
          goto LABEL_185;
      }
LABEL_182:
      sub_1A24236A4(v204, v202, v201, &v379, v211);
      swift_bridgeObjectRetain();
LABEL_186:
      v166 = v346;
      v368 = v211;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v361);
      v167 = v344;
      if (!v165)
        goto LABEL_151;
      continue;
    }
    break;
  }
  sub_1A242230C(v207, v200);
  v209 = sub_1A2420AEC(v202, v201);
  if ((v208 & 1) == (v210 & 1))
  {
    v204 = v209;
    v211 = (_QWORD *)v359;
    if ((v208 & 1) == 0)
      goto LABEL_182;
LABEL_185:
    v212 = (_OWORD *)(v211[7] + 32 * v204);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v212);
    sub_1A2424824(&v379, v212);
    goto LABEL_186;
  }
LABEL_324:
  result = sub_1A2435C50();
  __break(1u);
  return result;
}

id EKRemoteUIObjectSerializer.serializedRepresentation(ekObject:)(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  objc_super v7;
  uint64_t v8;
  id v9;

  v8 = MEMORY[0x1E0DEE9E0];
  v9 = (id)MEMORY[0x1E0DEE9E0];
  v1 = sub_1A2417380(a1, 0, &v9, &v8);
  v3 = v8;
  v2 = v9;
  v4 = (objc_class *)type metadata accessor for EKRemoteUISerializedObject();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_serializedObjectIDDictionary] = v1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToChangeSetDictionaryMap] = v2;
  *(_QWORD *)&v5[OBJC_IVAR____TtC8EventKit26EKRemoteUISerializedObject_objectIDToPersistentDictionaryMap] = v3;
  v7.receiver = v5;
  v7.super_class = v4;
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t sub_1A2419CB0(void *a1, char a2, _QWORD *a3)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _OWORD *v9;
  id *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  unsigned __int8 v24;
  objc_class *v25;
  _BYTE *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  char v45;
  _QWORD *v46;
  uint64_t *v47;
  uint64_t v48;
  BOOL v49;
  uint64_t v50;
  char v51;
  id v52;
  void *v53;
  objc_class *v54;
  _BYTE *v55;
  id v56;
  id v57;
  char v58;
  id v59;
  void *v60;
  _BYTE *v61;
  id v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  int64_t v80;
  unint64_t v81;
  uint64_t v82;
  id v83;
  void *v84;
  unsigned __int8 v85;
  objc_class *v86;
  _BYTE *v87;
  id v88;
  id v89;
  id v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  char v94;
  unint64_t v95;
  uint64_t v96;
  _BOOL8 v97;
  uint64_t v98;
  char v99;
  unint64_t v100;
  char v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  char v108;
  char v109;
  unint64_t v110;
  uint64_t v111;
  _BOOL8 v112;
  uint64_t v113;
  char v114;
  unint64_t v115;
  char v116;
  uint64_t *v117;
  uint64_t v118;
  char v119;
  _QWORD *v120;
  unint64_t v121;
  char v122;
  char v123;
  char isUniquelyReferenced_nonNull_native;
  id v125;
  char v126;
  id v127;
  uint64_t v128;
  char v129;
  char v130;
  uint64_t result;
  uint64_t v132;
  int64_t v133;
  uint64_t v134;
  int64_t v135;
  unint64_t v136;
  _QWORD *v137;
  int64_t v138;
  char *v139;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  objc_super v145;
  objc_super v146;
  objc_super v147;
  objc_super v148;
  _QWORD *v149;
  id v150[2];
  __int128 v151;
  id v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  _BYTE v156[40];
  uint64_t v157;
  uint64_t v158;
  __int128 v159;
  unint64_t v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;

  v3 = objc_msgSend(a1, sel_updatedPropertiesWithOnlyPersistentObjects);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1A2435A40();

    v132 = v5 + 64;
    v6 = 1 << *(_BYTE *)(v5 + 32);
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v5 + 64);
    v134 = v5;
    v135 = 0;
    v133 = (unint64_t)(v6 + 63) >> 6;
    v137 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    while (1)
    {
      if (v8)
      {
        v11 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v12 = v11 | (v135 << 6);
      }
      else
      {
        v16 = v135 + 1;
        if (__OFADD__(v135, 1))
          goto LABEL_143;
        if (v16 >= v133)
          goto LABEL_27;
        v17 = *(_QWORD *)(v132 + 8 * v16);
        if (!v17)
        {
          v18 = v135 + 2;
          ++v135;
          if (v16 + 1 >= v133)
            goto LABEL_27;
          v17 = *(_QWORD *)(v132 + 8 * v18);
          if (v17)
          {
            ++v16;
          }
          else
          {
            v19 = v16 + 2;
            v135 = v16 + 1;
            if (v16 + 2 >= v133)
              goto LABEL_27;
            v17 = *(_QWORD *)(v132 + 8 * v19);
            if (!v17)
            {
              while (1)
              {
                v16 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_148;
                if (v16 >= v133)
                  break;
                v17 = *(_QWORD *)(v132 + 8 * v16);
                ++v19;
                if (v17)
                  goto LABEL_15;
              }
              v135 = v133 - 1;
LABEL_27:
              v8 = 0;
              memset(v156, 0, 32);
              v155 = 0u;
              goto LABEL_28;
            }
            v16 += 2;
          }
        }
LABEL_15:
        v8 = (v17 - 1) & v17;
        v12 = __clz(__rbit64(v17)) + (v16 << 6);
        v135 = v16;
      }
      v13 = *(_QWORD *)(v134 + 56);
      v14 = (_QWORD *)(*(_QWORD *)(v134 + 48) + 16 * v12);
      v15 = v14[1];
      *(_QWORD *)&v155 = *v14;
      *((_QWORD *)&v155 + 1) = v15;
      sub_1A24247A0(v13 + 32 * v12, (uint64_t)v156);
      swift_bridgeObjectRetain();
LABEL_28:
      sub_1A24247DC((uint64_t)&v155, (uint64_t)&v157);
      v20 = v158;
      if (!v158)
      {
        swift_release();
        return (uint64_t)v137;
      }
      v142 = v157;
      sub_1A2424824(&v159, &v155);
      sub_1A24247A0((uint64_t)&v155, (uint64_t)&v153);
      sub_1A2424D0C(0, &qword_1EE6679B0);
      v143 = v20;
      if ((swift_dynamicCast() & 1) != 0)
      {
        v21 = v150[0];
        v22 = objc_msgSend(v150[0], sel_objectID);
        if (!v22)
        {

          goto LABEL_37;
        }
        v23 = v22;
        v24 = objc_msgSend(v21, sel_isPendingInsert);
        v25 = (objc_class *)type metadata accessor for EKRemoteUIPersistentObjectPointer();
        v26 = objc_allocWithZone(v25);
        *(_QWORD *)&v26[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v23;
        v26[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = v24;
        v146.receiver = v26;
        v146.super_class = v25;
        v27 = v23;
        v28 = objc_msgSendSuper2(&v146, sel_init);
        if (!objc_msgSend((id)swift_getObjCClassFromObject(), sel_meltedClass))
          goto LABEL_149;
        swift_getObjCClassMetadata();
        v29 = v21;
        v30 = v142;
        v31 = v20;
        v32 = (void *)sub_1A2435A4C();
        v33 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isWeakRelationObject_forKey_, v29, v32);

        objc_opt_self();
        if (!swift_dynamicCastObjCClass())
          goto LABEL_130;
        if (v142 == sub_1A2435A58() && v34 == v31)
        {
          swift_bridgeObjectRelease();
LABEL_56:
          v59 = objc_msgSend((id)objc_opt_self(), sel_virtualObjectIDWithEntityType_, 1);
          if (!v59)
            goto LABEL_151;
          v60 = v59;
          v61 = objc_allocWithZone(v25);
          *(_QWORD *)&v61[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v60;
          v61[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = 0;
          v145.receiver = v61;
          v145.super_class = v25;
          v62 = v60;
          v63 = objc_msgSendSuper2(&v145, sel_init);
          *((_QWORD *)&v151 + 1) = v25;

LABEL_125:
          v150[0] = v63;
          sub_1A2424824(v150, &v153);
          sub_1A24247A0((uint64_t)&v153, (uint64_t)v150);
          sub_1A2424D0C(0, &qword_1EE667A08);
          if ((swift_dynamicCast() & 1) != 0)
          {

            v120 = v137;
            swift_bridgeObjectRetain();
            v121 = sub_1A2420AEC(v142, v143);
            v123 = v122;
            swift_bridgeObjectRelease();
            if ((v123 & 1) != 0)
            {
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              v152 = v137;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                sub_1A24238B4();
                v120 = v152;
              }
              swift_bridgeObjectRelease();
              sub_1A2424824((_OWORD *)(v120[7] + 32 * v121), v150);
              v137 = v120;
              sub_1A2422BE8(v121, (uint64_t)v120);
              swift_bridgeObjectRelease();
            }
            else
            {
              *(_OWORD *)v150 = 0u;
              v151 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_1A2424E44((uint64_t)v150, &qword_1EE667970);
          }
          else
          {
            sub_1A24247A0((uint64_t)&v153, (uint64_t)v150);
            v130 = swift_isUniquelyReferenced_nonNull_native();
            v152 = v137;
            sub_1A24232A0(v150, v142, v143, v130);
            v137 = v152;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v153);
          if (!v33)
            goto LABEL_131;
LABEL_136:
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v155);

        }
        else
        {
          v58 = sub_1A2435C38();
          swift_bridgeObjectRelease();
          if ((v58 & 1) != 0)
            goto LABEL_56;
          v30 = v142;
          v31 = v143;
          if (v142 == sub_1A2435A58() && v65 == v143)
          {
            swift_bridgeObjectRelease();
LABEL_124:
            *((_QWORD *)&v151 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667998);
            v63 = (id)MEMORY[0x1E0DEE9E8];
            goto LABEL_125;
          }
          v119 = sub_1A2435C38();
          swift_bridgeObjectRelease();
          if ((v119 & 1) != 0)
            goto LABEL_124;
LABEL_130:
          *(_OWORD *)v150 = 0u;
          v151 = 0u;
          sub_1A2424E44((uint64_t)v150, &qword_1EE667970);
          *((_QWORD *)&v154 + 1) = v25;
          *(_QWORD *)&v153 = v28;
          sub_1A2424824(&v153, v150);
          v125 = v28;
          v126 = swift_isUniquelyReferenced_nonNull_native();
          v152 = v137;
          sub_1A24232A0(v150, v30, v31, v126);
          v137 = v152;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v33)
            goto LABEL_136;
LABEL_131:
          v127 = v27;
          v128 = sub_1A2419CB0(v29, a2 & 1, a3);
          v129 = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)&v153 = *a3;
          *a3 = 0x8000000000000000;
          sub_1A2423140(v128, v127, v129);
          *a3 = v153;

          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v155);
        }
      }
      else
      {
LABEL_37:
        v136 = v8;
        sub_1A24247A0((uint64_t)&v155, (uint64_t)&v153);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A38);
        if (swift_dynamicCast())
        {
          v35 = (unint64_t)v150[0];
          v152 = (id)MEMORY[0x1E0DEE9E8];
          objc_opt_self();
          if (swift_dynamicCastObjCClass())
          {
            if (v142 == sub_1A2435A58() && v36 == v20)
            {
              swift_bridgeObjectRelease();
              goto LABEL_53;
            }
            v51 = sub_1A2435C38();
            swift_bridgeObjectRelease();
            if ((v51 & 1) != 0)
            {
LABEL_53:
              v52 = objc_msgSend((id)objc_opt_self(), sel_virtualObjectIDWithEntityType_, 1);
              if (!v52)
                goto LABEL_150;
              v53 = v52;
              v54 = (objc_class *)type metadata accessor for EKRemoteUIPersistentObjectPointer();
              v55 = objc_allocWithZone(v54);
              *(_QWORD *)&v55[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v53;
              v55[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = 0;
              v147.receiver = v55;
              v147.super_class = v54;
              v56 = v53;
              v57 = objc_msgSendSuper2(&v147, sel_init);
              *((_QWORD *)&v154 + 1) = v54;

LABEL_66:
              *(_QWORD *)&v153 = v57;
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667998);
              if ((swift_dynamicCast() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                v67 = v150[0];
                swift_bridgeObjectRelease();
                v152 = v67;
                goto LABEL_113;
              }
LABEL_69:
              if ((v35 & 0xC000000000000001) != 0)
              {
                sub_1A2435B0C();
                sub_1A2424CC0(&qword_1EE6679E0, &qword_1EE6679B0);
                sub_1A2435A88();
                v35 = v160;
                v139 = v161;
                v68 = v162;
                v69 = v163;
                v70 = v164;
              }
              else
              {
                v69 = 0;
                v71 = -1 << *(_BYTE *)(v35 + 32);
                v139 = (char *)(v35 + 56);
                v72 = ~v71;
                v73 = -v71;
                if (v73 < 64)
                  v74 = ~(-1 << v73);
                else
                  v74 = -1;
                v70 = v74 & *(_QWORD *)(v35 + 56);
                v68 = v72;
              }
              v138 = (unint64_t)(v68 + 64) >> 6;
              v141 = v35;
              if ((v35 & 0x8000000000000000) == 0)
                goto LABEL_81;
              while (2)
              {
                v75 = (void *)sub_1A2435B30();
                if (!v75
                  || (v150[0] = v75,
                      swift_unknownObjectRetain(),
                      swift_dynamicCast(),
                      v76 = (id)v153,
                      swift_unknownObjectRelease(),
                      v77 = v69,
                      v78 = v70,
                      !v76))
                {
LABEL_112:
                  sub_1A2424D04();
                  v67 = v152;
LABEL_113:
                  *((_QWORD *)&v154 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667998);
                  *(_QWORD *)&v153 = v67;
                  sub_1A2424824(&v153, v150);
                  v108 = swift_isUniquelyReferenced_nonNull_native();
                  v149 = v137;
                  v110 = sub_1A2420AEC(v142, v20);
                  v111 = v137[2];
                  v112 = (v109 & 1) == 0;
                  v113 = v111 + v112;
                  if (__OFADD__(v111, v112))
                    goto LABEL_145;
                  v114 = v109;
                  if (v137[3] >= v113)
                  {
                    v8 = v136;
                    if ((v108 & 1) == 0)
                    {
                      sub_1A24238B4();
                      goto LABEL_117;
                    }
                  }
                  else
                  {
                    sub_1A242230C(v113, v108);
                    v115 = sub_1A2420AEC(v142, v20);
                    if ((v114 & 1) != (v116 & 1))
                      goto LABEL_153;
                    v110 = v115;
LABEL_117:
                    v8 = v136;
                  }
                  v46 = v149;
                  v137 = v149;
                  if ((v114 & 1) != 0)
                  {
                    v9 = (_OWORD *)(v149[7] + 32 * v110);
                    __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
                    v10 = v150;
                    goto LABEL_7;
                  }
                  v149[(v110 >> 6) + 8] |= 1 << v110;
                  v117 = (uint64_t *)(v46[6] + 16 * v110);
                  *v117 = v142;
                  v117[1] = v20;
                  sub_1A2424824(v150, (_OWORD *)(v46[7] + 32 * v110));
                  v118 = v46[2];
                  v49 = __OFADD__(v118, 1);
                  v50 = v118 + 1;
                  if (v49)
                    goto LABEL_147;
                  goto LABEL_122;
                }
LABEL_98:
                v83 = objc_msgSend(v76, sel_objectID);
                if (v83)
                {
                  v84 = v83;
                  v70 = v78;
                  v85 = objc_msgSend(v76, sel_isPendingInsert);
                  v86 = (objc_class *)type metadata accessor for EKRemoteUIPersistentObjectPointer();
                  v87 = objc_allocWithZone(v86);
                  *(_QWORD *)&v87[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v84;
                  v87[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = v85;
                  v148.receiver = v87;
                  v148.super_class = v86;
                  v88 = v84;
                  v89 = objc_msgSendSuper2(&v148, sel_init);
                  sub_1A242059C(&v153, v89);

                  v90 = v88;
                  v91 = sub_1A2419CB0(v76, a2 & 1, a3);
                  v92 = swift_isUniquelyReferenced_nonNull_native();
                  *(_QWORD *)&v153 = *a3;
                  v93 = v153;
                  *a3 = 0x8000000000000000;
                  v95 = sub_1A2420ABC((uint64_t)v90);
                  v96 = *(_QWORD *)(v93 + 16);
                  v97 = (v94 & 1) == 0;
                  v98 = v96 + v97;
                  if (__OFADD__(v96, v97))
                  {
                    __break(1u);
LABEL_141:
                    __break(1u);
LABEL_142:
                    __break(1u);
LABEL_143:
                    __break(1u);
LABEL_144:
                    __break(1u);
LABEL_145:
                    __break(1u);
LABEL_146:
                    __break(1u);
LABEL_147:
                    __break(1u);
LABEL_148:
                    __break(1u);
LABEL_149:
                    __break(1u);
LABEL_150:
                    __break(1u);
LABEL_151:
                    __break(1u);
LABEL_152:
                    sub_1A2424D0C(0, &qword_1EE667958);
                    sub_1A2435C50();
                    __break(1u);
LABEL_153:
                    result = sub_1A2435C50();
                    __break(1u);
                    return result;
                  }
                  v99 = v94;
                  if (*(_QWORD *)(v93 + 24) >= v98)
                  {
                    if ((v92 & 1) != 0)
                    {
                      v102 = (_QWORD *)v153;
                      if ((v94 & 1) == 0)
                        goto LABEL_108;
                    }
                    else
                    {
                      sub_1A242370C();
                      v102 = (_QWORD *)v153;
                      if ((v99 & 1) == 0)
                        goto LABEL_108;
                    }
                  }
                  else
                  {
                    sub_1A2422038(v98, v92);
                    v100 = sub_1A2420ABC((uint64_t)v90);
                    if ((v99 & 1) != (v101 & 1))
                      goto LABEL_152;
                    v95 = v100;
                    v102 = (_QWORD *)v153;
                    if ((v99 & 1) == 0)
                    {
LABEL_108:
                      v102[(v95 >> 6) + 8] |= 1 << v95;
                      v104 = 8 * v95;
                      *(_QWORD *)(v102[6] + v104) = v90;
                      *(_QWORD *)(v102[7] + v104) = v91;
                      v105 = v102[2];
                      v49 = __OFADD__(v105, 1);
                      v106 = v105 + 1;
                      if (v49)
                        goto LABEL_141;
                      v102[2] = v106;
                      v107 = v90;
                      goto LABEL_110;
                    }
                  }
                  v103 = v102[7];
                  swift_bridgeObjectRelease();
                  *(_QWORD *)(v103 + 8 * v95) = v91;
LABEL_110:
                  *a3 = v102;

                  swift_bridgeObjectRelease();
                  v69 = v77;
                  v20 = v143;
                  v35 = v141;
                  if ((v141 & 0x8000000000000000) != 0)
                    continue;
                }
                else
                {

                  v69 = v77;
                  v70 = v78;
                  if ((v35 & 0x8000000000000000) != 0)
                    continue;
                }
                break;
              }
LABEL_81:
              if (v70)
              {
                v78 = (v70 - 1) & v70;
                v79 = __clz(__rbit64(v70)) | (v69 << 6);
                v77 = v69;
              }
              else
              {
                v80 = v69 + 1;
                if (__OFADD__(v69, 1))
                  goto LABEL_142;
                if (v80 >= v138)
                  goto LABEL_112;
                v81 = *(_QWORD *)&v139[8 * v80];
                v77 = v69 + 1;
                if (!v81)
                {
                  v77 = v69 + 2;
                  if (v69 + 2 >= v138)
                    goto LABEL_112;
                  v81 = *(_QWORD *)&v139[8 * v77];
                  if (!v81)
                  {
                    v77 = v69 + 3;
                    if (v69 + 3 >= v138)
                      goto LABEL_112;
                    v81 = *(_QWORD *)&v139[8 * v77];
                    if (!v81)
                    {
                      v77 = v69 + 4;
                      if (v69 + 4 >= v138)
                        goto LABEL_112;
                      v81 = *(_QWORD *)&v139[8 * v77];
                      if (!v81)
                      {
                        v82 = v69 + 5;
                        while (v138 != v82)
                        {
                          v81 = *(_QWORD *)&v139[8 * v82++];
                          if (v81)
                          {
                            v77 = v82 - 1;
                            goto LABEL_96;
                          }
                        }
                        goto LABEL_112;
                      }
                    }
                  }
                }
LABEL_96:
                v78 = (v81 - 1) & v81;
                v79 = __clz(__rbit64(v81)) + (v77 << 6);
              }
              v76 = *(id *)(*(_QWORD *)(v35 + 48) + 8 * v79);
              if (!v76)
                goto LABEL_112;
              goto LABEL_98;
            }
            if (v142 == sub_1A2435A58() && v64 == v20)
            {
              swift_bridgeObjectRelease();
LABEL_65:
              *((_QWORD *)&v154 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667998);
              v57 = (id)MEMORY[0x1E0DEE9E8];
              goto LABEL_66;
            }
            v66 = sub_1A2435C38();
            swift_bridgeObjectRelease();
            if ((v66 & 1) != 0)
              goto LABEL_65;
          }
          v154 = 0u;
          v153 = 0u;
          sub_1A2424E44((uint64_t)&v153, &qword_1EE667970);
          goto LABEL_69;
        }
        sub_1A24247A0((uint64_t)&v155, (uint64_t)&v153);
        v37 = swift_isUniquelyReferenced_nonNull_native();
        v150[0] = v137;
        v39 = sub_1A2420AEC(v142, v20);
        v40 = v137[2];
        v41 = (v38 & 1) == 0;
        v42 = v40 + v41;
        if (__OFADD__(v40, v41))
          goto LABEL_144;
        v43 = v38;
        if (v137[3] >= v42)
        {
          if ((v37 & 1) == 0)
            sub_1A24238B4();
        }
        else
        {
          sub_1A242230C(v42, v37);
          v44 = sub_1A2420AEC(v142, v20);
          if ((v43 & 1) != (v45 & 1))
            goto LABEL_153;
          v39 = v44;
        }
        v46 = v150[0];
        v137 = v150[0];
        if ((v43 & 1) != 0)
        {
          v9 = (_OWORD *)(*((_QWORD *)v150[0] + 7) + 32 * v39);
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
          v10 = (id *)&v153;
LABEL_7:
          sub_1A2424824(v10, v9);
          goto LABEL_8;
        }
        *((_QWORD *)v150[0] + (v39 >> 6) + 8) |= 1 << v39;
        v47 = (uint64_t *)(v46[6] + 16 * v39);
        *v47 = v142;
        v47[1] = v20;
        sub_1A2424824(&v153, (_OWORD *)(v46[7] + 32 * v39));
        v48 = v46[2];
        v49 = __OFADD__(v48, 1);
        v50 = v48 + 1;
        if (v49)
          goto LABEL_146;
LABEL_122:
        v46[2] = v50;
        swift_bridgeObjectRetain();
LABEL_8:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v155);
      }
    }
  }
  return MEMORY[0x1E0DEE9E0];
}

uint64_t sub_1A241AD2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  _OWORD v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1A2424824((_OWORD *)a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_1A24232A0(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1A2424E44(a1, &qword_1EE667970);
    sub_1A24202A4(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_1A2424E44((uint64_t)v9, &qword_1EE667970);
  }
}

uint64_t sub_1A241AE00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v4 = v3;
  if (a1)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v15 = *v3;
    *v3 = 0x8000000000000000;
    sub_1A2423548(a1, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v15;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    v9 = sub_1A2420AEC(a2, a3);
    v11 = v10;
    swift_bridgeObjectRelease();
    if ((v11 & 1) != 0)
    {
      v12 = swift_isUniquelyReferenced_nonNull_native();
      v13 = *v3;
      v16 = *v4;
      *v4 = 0x8000000000000000;
      if ((v12 & 1) == 0)
      {
        sub_1A2423C34();
        v13 = v16;
      }
      swift_bridgeObjectRelease();
      sub_1A2422F6C(v9, v13);
      *v4 = v13;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_1A241AF48(uint64_t a1)
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
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A00);
  v2 = sub_1A2435C14();
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
    sub_1A2424E80(v6, (uint64_t)&v15, (uint64_t *)&unk_1EE667A60);
    v7 = v15;
    v8 = v16;
    result = sub_1A2420AEC(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1A2424824(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1A241B07C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  int64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  __int128 v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  __int128 v24;
  _OWORD v25[2];
  _OWORD v26[2];
  __int128 v27;
  _OWORD v28[2];
  _OWORD v29[2];
  _OWORD v30[2];
  _OWORD v31[2];
  uint64_t v32;
  _OWORD v33[2];
  _OWORD v34[2];
  uint64_t v35;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A00);
    v2 = (_QWORD *)sub_1A2435C14();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v23 = a1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(a1 + 64);
  v22 = (unint64_t)(63 - v4) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = (v5 - 1) & v5;
      v11 = __clz(__rbit64(v5)) | (v7 << 6);
      v12 = v7;
    }
    else
    {
      v13 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_37;
      if (v13 >= v22)
      {
LABEL_33:
        sub_1A2424D04();
        return (unint64_t)v2;
      }
      v14 = *(_QWORD *)(v23 + 8 * v13);
      v12 = v7 + 1;
      if (!v14)
      {
        v12 = v7 + 2;
        if (v7 + 2 >= v22)
          goto LABEL_33;
        v14 = *(_QWORD *)(v23 + 8 * v12);
        if (!v14)
        {
          v12 = v7 + 3;
          if (v7 + 3 >= v22)
            goto LABEL_33;
          v14 = *(_QWORD *)(v23 + 8 * v12);
          if (!v14)
          {
            v12 = v7 + 4;
            if (v7 + 4 >= v22)
              goto LABEL_33;
            v14 = *(_QWORD *)(v23 + 8 * v12);
            if (!v14)
            {
              v15 = v7 + 5;
              if (v7 + 5 >= v22)
                goto LABEL_33;
              v14 = *(_QWORD *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v12 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_38;
                  if (v12 >= v22)
                    goto LABEL_33;
                  v14 = *(_QWORD *)(v23 + 8 * v12);
                  ++v15;
                  if (v14)
                    goto LABEL_26;
                }
              }
              v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      v10 = (v14 - 1) & v14;
      v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_1A2424D68(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_1A24247A0(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_1A2424D68((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_1A2424E44((uint64_t)v30, &qword_1EE667A58);
      swift_bridgeObjectRelease();
      sub_1A2424D04();
      swift_release();
      return 0;
    }
    sub_1A24247A0((uint64_t)v31 + 8, (uint64_t)v25);
    sub_1A2424E44((uint64_t)v30, &qword_1EE667A58);
    sub_1A2424824(v25, v26);
    v27 = v24;
    sub_1A2424824(v26, v28);
    v16 = v27;
    sub_1A2424824(v28, v29);
    sub_1A2424824(v29, &v27);
    result = sub_1A2420AEC(v16, *((uint64_t *)&v16 + 1));
    v17 = result;
    if ((v18 & 1) != 0)
    {
      v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v8 = v16;
      v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      result = (unint64_t)sub_1A2424824(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    result = (unint64_t)sub_1A2424824(&v27, (_OWORD *)(v2[7] + 32 * result));
    v19 = v2[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_36;
    v2[2] = v21;
LABEL_8:
    v7 = v12;
    v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_1A241B44C(uint64_t a1)
{
  _QWORD **v1;
  _QWORD *v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = (uint64_t)sub_1A241FAE8(0, v3[2] + 1, 1, v3);
    v3 = (_QWORD *)result;
  }
  v6 = v3[2];
  v5 = v3[3];
  if (v6 >= v5 >> 1)
  {
    result = (uint64_t)sub_1A241FAE8((_QWORD *)(v5 > 1), v6 + 1, 1, v3);
    v3 = (_QWORD *)result;
  }
  v3[2] = v6 + 1;
  v3[v6 + 4] = a1;
  *v1 = v3;
  return result;
}

id EKRemoteUIObjectSerializer.deserializedRepresentation(serializedDictionary:objectIDToChangeSetDictionaryMap:objectIDToPersistentDictionaryMap:eventStore:occurrenceDate:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  objc_super v10;
  uint64_t v11;
  uint64_t v12;

  v11 = MEMORY[0x1E0DEE9E0];
  v12 = MEMORY[0x1E0DEE9E0];
  v5 = (void *)sub_1A241B590(a1, a2, a3, a4, a5, &v12, &v11);
  swift_bridgeObjectRelease();
  if (v5)
  {
    v6 = v12;
    if (v12)
    {
      v7 = (objc_class *)type metadata accessor for EKRemoteUIDeserializedObject();
      v8 = (char *)objc_allocWithZone(v7);
      *(_QWORD *)&v8[OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_deserializedObject] = v5;
      *(_QWORD *)&v8[OBJC_IVAR____TtC8EventKit28EKRemoteUIDeserializedObject_tempObjectIDMap] = v6;
      v10.receiver = v8;
      v10.super_class = v7;
      return objc_msgSendSuper2(&v10, sel_init);
    }

  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_1A241B590(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, _QWORD *a6, uint64_t *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  NSObject *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _OWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  id v53;
  uint64_t result;
  os_log_type_t v55;
  BOOL v56;
  uint8_t *v57;
  NSObject *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t ObjCClassFromObject;
  char *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  char isUniquelyReferenced_nonNull_native;
  char v80;
  unint64_t v81;
  uint64_t v82;
  _BOOL8 v83;
  uint64_t v84;
  char v85;
  unint64_t v86;
  char v87;
  char v88;
  char v89;
  unint64_t v90;
  uint64_t v91;
  _BOOL8 v92;
  uint64_t v93;
  char v94;
  unint64_t v95;
  char v96;
  char v97;
  void *v98;
  void *v99;
  id v100;
  uint64_t v101;
  char v102;
  NSObject *v103;
  os_log_type_t v104;
  BOOL v105;
  uint8_t *v106;
  NSObject *v107;
  NSObject *v108;
  id v109;
  NSObject *v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  char *v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  _QWORD *v125;
  uint64_t v126;
  int64_t v127;
  unint64_t v128;
  unint64_t v129;
  char *v130;
  uint64_t v131;
  int v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  NSObject *v140;
  os_log_type_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  os_log_type_t v146;
  uint8_t *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  _BYTE *v157;
  int64_t v158;
  unint64_t v159;
  uint64_t v160;
  char v161;
  id v162;
  void *v163;
  id v164;
  uint64_t v165;
  uint64_t v166;
  int64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  uint64_t v173;
  unint64_t v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t v177;
  _QWORD *v178;
  uint64_t v179;
  int64_t v180;
  unint64_t v181;
  char *v182;
  _OWORD *v183;
  char *v184;
  int v185;
  unint64_t v186;
  char *v187;
  uint64_t v188;
  uint64_t v189;
  unint64_t v190;
  uint64_t v191;
  uint64_t v192;
  NSObject *v193;
  os_log_type_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  os_log_type_t v200;
  uint8_t *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  unint64_t v208;
  uint64_t v209;
  uint64_t v210;
  _BYTE *v211;
  int64_t v212;
  unint64_t v213;
  uint64_t v214;
  char v215;
  id v216;
  void *v217;
  id v218;
  void *v219;
  void *v220;
  void *v221;
  id v222;
  uint64_t v223;
  uint64_t v224;
  _OWORD *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  unint64_t v229;
  unint64_t v230;
  unint64_t v231;
  unint64_t v232;
  uint64_t v233;
  _QWORD *v234;
  uint64_t v235;
  uint64_t v236;
  unint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  int64_t v242;
  char *v243;
  uint64_t v244;
  uint64_t v245;
  id v246;
  uint64_t v247;
  id v248;
  uint64_t v249;
  int64_t *v250;
  uint64_t v251;
  void (*v252)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v253;
  uint64_t v254;
  void *v255;
  char v256;
  id v257;
  id v258;
  unsigned __int8 v259;
  id v260;
  char v261;
  char v262;
  unint64_t v263;
  uint64_t v264;
  _BOOL8 v265;
  uint64_t v266;
  char v267;
  unint64_t v268;
  char v269;
  _OWORD *v270;
  int64_t v271;
  void *v272;
  NSObject *v273;
  NSObject *v274;
  uint64_t v275;
  unint64_t v276;
  unint64_t v277;
  int64_t v278;
  _OWORD *v279;
  uint64_t v280;
  uint64_t v281;
  int64_t v282;
  __int128 v283;
  __int128 *v284;
  char *v285;
  uint64_t v286;
  char *v287;
  uint64_t v288;
  _OWORD *v289;
  NSObject *v290;
  id v291;
  _OWORD *v292;
  NSObject *v293;
  unint64_t v294;
  __int128 *v295;
  unint64_t v296;
  _OWORD *v297;
  uint64_t v298;
  char *v299;
  _OWORD *v300;
  uint64_t v301;
  id v302;
  uint64_t v303;
  char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  _QWORD *v308;
  uint64_t *v309;
  void *v310;
  uint64_t v311;
  _OWORD v312[2];
  __int128 v313;
  uint64_t v314;
  __int128 v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  _OWORD v319[2];
  unint64_t v320;
  __int128 v321;
  uint64_t v322;
  uint64_t v323;
  unint64_t v324;
  __int128 v325;
  uint64_t v326;
  uint64_t v327;
  unint64_t v328;

  v8 = v7;
  v308 = a6;
  v309 = a7;
  v310 = a4;
  v305 = a3;
  v307 = a2;
  v303 = sub_1A2435A1C();
  v301 = *(_QWORD *)(v303 - 8);
  v11 = MEMORY[0x1E0C80A78](v303);
  v300 = (_OWORD *)((char *)&v275 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v11);
  v299 = (char *)&v275 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667950);
  v15 = MEMORY[0x1E0C80A78](v14);
  v304 = (char *)&v275 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v275 - v17;
  if (!*(_QWORD *)(a1 + 16))
  {
    v319[0] = 0u;
    v318 = 0u;
    goto LABEL_9;
  }
  v19 = *(_QWORD *)(v7 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKIsPendingInsertKey);
  v20 = *(_QWORD *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKIsPendingInsertKey + 8);
  swift_bridgeObjectRetain();
  v21 = sub_1A2420AEC(v19, v20);
  if ((v22 & 1) == 0)
  {
    v319[0] = 0u;
    v318 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_1A24247A0(*(_QWORD *)(a1 + 56) + 32 * v21, (uint64_t)&v318);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v319[0] + 1))
  {
LABEL_9:
    sub_1A2424E44((uint64_t)&v318, &qword_1EE667970);
LABEL_10:
    v23 = 0;
    v302 = 0;
    if (!*(_QWORD *)(a1 + 16))
      goto LABEL_6;
    goto LABEL_11;
  }
  sub_1A2424D0C(0, &qword_1EE6679B8);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_10;
  v302 = (id)v315;
  v23 = objc_msgSend((id)v315, sel_BOOLValue);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_6:
    v319[0] = 0u;
    v318 = 0u;
    v24 = v303;
LABEL_28:
    sub_1A2424E44((uint64_t)&v318, &qword_1EE667970);
    goto LABEL_29;
  }
LABEL_11:
  v25 = *(_QWORD *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKPersistentObjectKey);
  v26 = *(_QWORD *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKPersistentObjectKey + 8);
  swift_bridgeObjectRetain();
  v27 = sub_1A2420AEC(v25, v26);
  if ((v28 & 1) != 0)
  {
    sub_1A24247A0(*(_QWORD *)(a1 + 56) + 32 * v27, (uint64_t)&v318);
  }
  else
  {
    v319[0] = 0u;
    v318 = 0u;
  }
  v24 = v303;
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v319[0] + 1))
    goto LABEL_28;
  sub_1A2424D0C(0, &qword_1EE667958);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_29:
    v49 = v302;
    if (qword_1EE6678D0 != -1)
      swift_once();
    __swift_project_value_buffer(v24, (uint64_t)qword_1EE667E88);
    v50 = sub_1A2435A04();
    v51 = sub_1A2435A94();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_1A2318000, v50, v51, "EKRemoteUIObjectSerializer: Cannot create persistentObject because objectID is nil", v52, 2u);
      MEMORY[0x1A8584D7C](v52, -1, -1);
      goto LABEL_33;
    }

    goto LABEL_35;
  }
  v293 = (id)v315;
  sub_1A241DD50(v293, v305, v310, v23, v308, v309);
  if (!v29)
  {
    if (qword_1EE6678D0 != -1)
      goto LABEL_318;
    goto LABEL_39;
  }
  v30 = v29;
  objc_opt_self();
  v31 = swift_dynamicCastObjCClass();
  v288 = a1;
  v290 = v30;
  if (!v31)
  {
    v103 = v30;
    v38 = objc_msgSend(v310, sel_publicObjectWithPersistentObject_, v103);
    if (v38)
      goto LABEL_21;
LABEL_91:
    if (qword_1EE6678D0 != -1)
      swift_once();
    __swift_project_value_buffer(v24, (uint64_t)qword_1EE667E88);
    v50 = sub_1A2435A04();
    v104 = sub_1A2435A94();
    v105 = os_log_type_enabled(v50, v104);
    v49 = v302;
    if (!v105)
    {

      v110 = v293;
      v108 = v290;
      goto LABEL_99;
    }
    v106 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v106 = 0;
    _os_log_impl(&dword_1A2318000, v50, v104, "EKRemoteUIObjectSerializer: Cannot create EKObject from deserialized EKPersistentObject", v106, 2u);
    MEMORY[0x1A8584D7C](v106, -1, -1);
    v107 = v293;

    v50 = v290;
LABEL_33:

    return 0;
  }
  v32 = v31;
  sub_1A2424E80(a5, (uint64_t)v18, &qword_1EE667950);
  v33 = sub_1A24359F8();
  v34 = *(_QWORD *)(v33 - 8);
  v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48))(v18, 1, v33);
  v36 = v30;
  v37 = 0;
  if (v35 != 1)
  {
    v37 = (void *)sub_1A24359E0();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v18, v33);
  }
  v38 = objc_msgSend(objc_allocWithZone((Class)EKEvent), sel_initWithPersistentObject_occurrenceDate_, v32, v37);

  a1 = v288;
  v24 = v303;
  if (!v38)
    goto LABEL_91;
LABEL_21:
  v291 = v38;
  v39 = *(_QWORD *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetKey);
  v40 = *(_QWORD *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetKey + 8);
  swift_bridgeObjectRetain();
  sub_1A241DD00(v39, v40, a1, &v318);
  swift_bridgeObjectRelease();
  v306 = v8;
  if (!*((_QWORD *)&v319[0] + 1))
  {
    sub_1A2424E44((uint64_t)&v318, &qword_1EE667970);
    goto LABEL_97;
  }
  v281 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667960);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_97:
    v109 = v302;
    goto LABEL_247;
  }
  v41 = v315;
  v42 = *(_QWORD *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetSingleValueChangesKey);
  v43 = *(_QWORD *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetSingleValueChangesKey + 8);
  swift_bridgeObjectRetain();
  v280 = v41;
  sub_1A241DD00(v42, v43, v41, &v318);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v319[0] + 1))
  {
    sub_1A2424E44((uint64_t)&v318, &qword_1EE667970);
    goto LABEL_101;
  }
  v44 = (_OWORD *)(MEMORY[0x1E0DEE9B8] + 8);
  v45 = (uint64_t)&v318;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_101:
    v294 = MEMORY[0x1E0DEE9E0];
    goto LABEL_103;
  }
  v46 = *(_QWORD *)(v315 + 64);
  v286 = v315 + 64;
  v296 = v315;
  v47 = 1 << *(_BYTE *)(v315 + 32);
  v48 = -1;
  if (v47 < 64)
    v48 = ~(-1 << v47);
  v24 = v48 & v46;
  v295 = &v316;
  v297 = v319;
  v298 = 0;
  v289 = (_OWORD *)((unint64_t)(v47 + 63) >> 6);
  v285 = (char *)v289 - 1;
  v294 = MEMORY[0x1E0DEE9E0];
  v292 = v44;
  while (1)
  {
    if (v24)
    {
      v59 = __clz(__rbit64(v24));
      v24 &= v24 - 1;
      v60 = v59 | (v298 << 6);
LABEL_45:
      v61 = *(_QWORD *)(v296 + 56);
      v62 = (_QWORD *)(*(_QWORD *)(v296 + 48) + 16 * v60);
      v63 = v62[1];
      *(_QWORD *)&v315 = *v62;
      *((_QWORD *)&v315 + 1) = v63;
      sub_1A24247A0(v61 + 32 * v60, (uint64_t)v295);
      swift_bridgeObjectRetain();
      goto LABEL_64;
    }
    v64 = v298 + 1;
    if (__OFADD__(v298, 1))
      goto LABEL_315;
    if (v64 < (uint64_t)v289)
    {
      v65 = *(_QWORD *)(v286 + 8 * v64);
      if (v65)
        goto LABEL_49;
      v66 = v298 + 2;
      ++v298;
      if (v64 + 1 < (uint64_t)v289)
      {
        v65 = *(_QWORD *)(v286 + 8 * v66);
        if (v65)
          goto LABEL_52;
        v298 = v64 + 1;
        if (v64 + 2 < (uint64_t)v289)
        {
          v65 = *(_QWORD *)(v286 + 8 * (v64 + 2));
          if (v65)
          {
            v64 += 2;
            goto LABEL_49;
          }
          v66 = v64 + 3;
          v298 = v64 + 2;
          if (v64 + 3 < (uint64_t)v289)
          {
            v65 = *(_QWORD *)(v286 + 8 * v66);
            if (v65)
            {
LABEL_52:
              v64 = v66;
LABEL_49:
              v24 = (v65 - 1) & v65;
              v60 = __clz(__rbit64(v65)) + (v64 << 6);
              v298 = v64;
              goto LABEL_45;
            }
            while (1)
            {
              v64 = v66 + 1;
              if (__OFADD__(v66, 1))
                goto LABEL_321;
              if (v64 >= (uint64_t)v289)
                break;
              v65 = *(_QWORD *)(v286 + 8 * v64);
              ++v66;
              if (v65)
                goto LABEL_49;
            }
            v298 = (uint64_t)v285;
          }
        }
      }
    }
    v24 = 0;
    v316 = 0u;
    v317 = 0u;
    v315 = 0u;
LABEL_64:
    sub_1A24247DC((uint64_t)&v315, (uint64_t)&v318);
    v67 = *((_QWORD *)&v318 + 1);
    if (!*((_QWORD *)&v318 + 1))
      break;
    v68 = v318;
    sub_1A2424824(v297, &v315);
    sub_1A24247A0((uint64_t)&v315, (uint64_t)&v325);
    type metadata accessor for EKRemoteUIPersistentObjectPointer();
    if (swift_dynamicCast())
    {
      v69 = (void *)v321;
      v70 = *(void **)(v321 + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID);
      v45 = *(unsigned __int8 *)(v321 + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert);
      v71 = v291;
      ObjCClassFromObject = swift_getObjCClassFromObject();
      v73 = v70;
      v74 = v71;
      v75 = (void *)sub_1A2435A4C();
      LOBYTE(ObjCClassFromObject) = objc_msgSend((id)ObjCClassFromObject, sel_isWeakRelationObject_forKey_, v74, v75);

      if ((ObjCClassFromObject & 1) != 0)
      {
        v76 = sub_1A2424A64(v73, v310, *v309);
        if (!v76)
          goto LABEL_82;
        v77 = v76;
        v287 = v73;
        v327 = sub_1A2424D0C(0, &qword_1EE6679B0);
        *(_QWORD *)&v325 = v77;
        sub_1A2424824(&v325, &v321);
        v78 = v77;
        v45 = v294;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)&v313 = v45;
        v81 = sub_1A2420AEC(v68, v67);
        v82 = *(_QWORD *)(v45 + 16);
        v83 = (v80 & 1) == 0;
        v84 = v82 + v83;
        if (__OFADD__(v82, v83))
        {
          __break(1u);
LABEL_320:
          __break(1u);
LABEL_321:
          __break(1u);
LABEL_322:

          __break(1u);
LABEL_323:
          result = sub_1A2435C50();
          __break(1u);
          return result;
        }
        v85 = v80;
        if (*(_QWORD *)(v45 + 24) >= v84)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v45 = (uint64_t)&v313;
            sub_1A24238B4();
          }
        }
        else
        {
          sub_1A242230C(v84, isUniquelyReferenced_nonNull_native);
          v45 = v313;
          v86 = sub_1A2420AEC(v68, v67);
          if ((v85 & 1) != (v87 & 1))
            goto LABEL_323;
          v81 = v86;
        }
        v294 = v313;
        if ((v85 & 1) != 0)
        {
          v45 = *(_QWORD *)(v313 + 56) + 32 * v81;
          __swift_destroy_boxed_opaque_existential_0(v45);
          sub_1A2424824(&v321, (_OWORD *)v45);
        }
        else
        {
          sub_1A24236A4(v81, v68, v67, &v321, (_QWORD *)v313);
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

LABEL_89:
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v315);
      }
      else
      {
        v97 = v45;
        v45 = v306;
        sub_1A241DD50(v73, v307, v310, v97, v308, v309);
        if (v98)
        {
          v99 = v98;
          v327 = sub_1A2424D0C(0, &qword_1EE6679B0);
          *(_QWORD *)&v325 = v99;
          sub_1A2424824(&v325, &v321);
          v100 = v99;
          v101 = v294;
          v102 = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)&v313 = v101;
          v45 = (uint64_t)&v313;
          sub_1A24232A0(&v321, v68, v67, v102);
          v294 = v313;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          goto LABEL_89;
        }
LABEL_82:
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v315);

        swift_bridgeObjectRelease();
      }
    }
    else
    {
      sub_1A24247A0((uint64_t)&v315, (uint64_t)&v325);
      v45 = v294;
      v88 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)&v321 = v45;
      v90 = sub_1A2420AEC(v68, v67);
      v91 = *(_QWORD *)(v45 + 16);
      v92 = (v89 & 1) == 0;
      v93 = v91 + v92;
      if (__OFADD__(v91, v92))
        goto LABEL_314;
      v94 = v89;
      if (*(_QWORD *)(v45 + 24) >= v93)
      {
        if ((v88 & 1) == 0)
        {
          v45 = (uint64_t)&v321;
          sub_1A24238B4();
        }
      }
      else
      {
        sub_1A242230C(v93, v88);
        v45 = v321;
        v95 = sub_1A2420AEC(v68, v67);
        if ((v94 & 1) != (v96 & 1))
          goto LABEL_323;
        v90 = v95;
      }
      v294 = v321;
      if ((v94 & 1) != 0)
      {
        v45 = *(_QWORD *)(v321 + 56) + 32 * v90;
        __swift_destroy_boxed_opaque_existential_0(v45);
        sub_1A2424824(&v325, (_OWORD *)v45);
      }
      else
      {
        sub_1A24236A4(v90, v68, v67, &v325, (_QWORD *)v321);
        swift_bridgeObjectRetain();
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v315);
    }
  }
  swift_release();
  v8 = v306;
  v24 = v303;
LABEL_103:
  *(_QWORD *)&v313 = MEMORY[0x1E0DEE9E0];
  v111 = *(_QWORD *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueAdditionsKey);
  v112 = *(_QWORD *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueAdditionsKey + 8);
  swift_bridgeObjectRetain();
  sub_1A241DD00(v111, v112, v280, &v318);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v319[0] + 1))
  {
    sub_1A2424E44((uint64_t)&v318, &qword_1EE667970);
    goto LABEL_174;
  }
  v292 = (_OWORD *)(MEMORY[0x1E0DEE9B8] + 8);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_174:
    *(_QWORD *)&v312[0] = MEMORY[0x1E0DEE9E0];
    v165 = *(_QWORD *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueRemovalsKey);
    v166 = *(_QWORD *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueRemovalsKey + 8);
    swift_bridgeObjectRetain();
    sub_1A241DD00(v165, v166, v280, &v318);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v319[0] + 1))
    {
      v295 = (__int128 *)(MEMORY[0x1E0DEE9B8] + 8);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v167 = 0;
        v168 = *(_QWORD *)(v315 + 64);
        v281 = v315 + 64;
        v169 = 1 << *(_BYTE *)(v315 + 32);
        if (v169 < 64)
          v170 = ~(-1 << v169);
        else
          v170 = -1;
        v171 = v170 & v168;
        v284 = &v316;
        v285 = (char *)v315;
        v292 = v319;
        v282 = (unint64_t)(v169 + 63) >> 6;
        v278 = v282 - 1;
        v279 = (_OWORD *)(v282 - 5);
        v280 = v315 + 104;
        v298 = MEMORY[0x1E0DEE9B0] + 8;
        v283 = xmmword_1A244A7E0;
        v172 = v301;
        while (1)
        {
          if (v171)
          {
            v174 = __clz(__rbit64(v171));
            v175 = (v171 - 1) & v171;
            v176 = v174 | (v167 << 6);
            goto LABEL_184;
          }
          v180 = v167 + 1;
          if (__OFADD__(v167, 1))
            goto LABEL_317;
          if (v180 >= v282)
            break;
          v181 = *(_QWORD *)(v281 + 8 * v180);
          if (v181)
            goto LABEL_188;
          v182 = (char *)(v167 + 1);
          if (v167 + 2 >= v282)
            goto LABEL_190;
          v181 = *(_QWORD *)(v281 + 8 * (v167 + 2));
          if (v181)
          {
            v180 = v167 + 2;
            goto LABEL_188;
          }
          v182 = (char *)(v167 + 2);
          if (v167 + 3 >= v282)
            goto LABEL_190;
          v181 = *(_QWORD *)(v281 + 8 * (v167 + 3));
          if (v181)
          {
            v180 = v167 + 3;
            goto LABEL_188;
          }
          v180 = v167 + 4;
          v182 = (char *)(v167 + 3);
          if (v167 + 4 >= v282)
            goto LABEL_190;
          v181 = *(_QWORD *)(v281 + 8 * v180);
          if (v181)
            goto LABEL_188;
          do
          {
            if (v279 == (_OWORD *)v167)
            {
              v182 = (char *)v278;
              goto LABEL_190;
            }
            v181 = *(_QWORD *)(v280 + 8 * v167++);
          }
          while (!v181);
          v180 = v167 + 4;
LABEL_188:
          v175 = (v181 - 1) & v181;
          v176 = __clz(__rbit64(v181)) + (v180 << 6);
          v167 = v180;
LABEL_184:
          v177 = *((_QWORD *)v285 + 7);
          v178 = (_QWORD *)(*((_QWORD *)v285 + 6) + 16 * v176);
          v179 = v178[1];
          *(_QWORD *)&v315 = *v178;
          *((_QWORD *)&v315 + 1) = v179;
          sub_1A24247A0(v177 + 32 * v176, (uint64_t)v284);
          swift_bridgeObjectRetain();
LABEL_191:
          sub_1A24247DC((uint64_t)&v315, (uint64_t)&v318);
          v183 = (_OWORD *)*((_QWORD *)&v318 + 1);
          if (!*((_QWORD *)&v318 + 1))
          {
            swift_release();
            goto LABEL_243;
          }
          v184 = (char *)v318;
          sub_1A2424824(v292, &v315);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667998);
          v185 = swift_dynamicCast();
          v296 = v175;
          v297 = (_OWORD *)v167;
          if (v185)
          {
            v287 = v184;
            v289 = v183;
            v186 = v320;
            *(_QWORD *)&v315 = MEMORY[0x1E0DEE9E8];
            if ((v320 & 0xC000000000000001) != 0)
            {
              sub_1A2435B0C();
              type metadata accessor for EKRemoteUIPersistentObjectPointer();
              sub_1A24248F8();
              sub_1A2435A88();
              v187 = (char *)*((_QWORD *)&v325 + 1);
              v186 = v325;
              v188 = v326;
              v189 = v327;
              v190 = v328;
            }
            else
            {
              v189 = 0;
              v204 = -1 << *(_BYTE *)(v320 + 32);
              v187 = (char *)(v320 + 56);
              v188 = ~v204;
              v205 = -v204;
              if (v205 < 64)
                v206 = ~(-1 << v205);
              else
                v206 = -1;
              v190 = v206 & *(_QWORD *)(v320 + 56);
            }
            v299 = (char *)(v186 & 0x7FFFFFFFFFFFFFFFLL);
            v286 = v188;
            v24 = (unint64_t)(v188 + 64) >> 6;
            while (1)
            {
              if ((v186 & 0x8000000000000000) != 0)
              {
                v210 = sub_1A2435B30();
                if (!v210)
                  goto LABEL_180;
                v311 = v210;
                type metadata accessor for EKRemoteUIPersistentObjectPointer();
                swift_unknownObjectRetain();
                swift_dynamicCast();
                v211 = (_BYTE *)v320;
                swift_unknownObjectRelease();
                v209 = v189;
                v207 = v190;
                if (!v211)
                  goto LABEL_180;
              }
              else
              {
                if (v190)
                {
                  v207 = (v190 - 1) & v190;
                  v208 = __clz(__rbit64(v190)) | (v189 << 6);
                  v209 = v189;
                }
                else
                {
                  v212 = v189 + 1;
                  if (__OFADD__(v189, 1))
                    goto LABEL_311;
                  if (v212 >= v24)
                  {
LABEL_180:
                    sub_1A2424D04();
                    v173 = sub_1A241ECE0(v315);
                    swift_bridgeObjectRelease();
                    sub_1A241AE00(v173, (uint64_t)v287, (uint64_t)v289);
                    v24 = v303;
                    v172 = v301;
                    goto LABEL_181;
                  }
                  v213 = *(_QWORD *)&v187[8 * v212];
                  v209 = v189 + 1;
                  if (!v213)
                  {
                    v209 = v189 + 2;
                    if (v189 + 2 >= v24)
                      goto LABEL_180;
                    v213 = *(_QWORD *)&v187[8 * v209];
                    if (!v213)
                    {
                      v209 = v189 + 3;
                      if (v189 + 3 >= v24)
                        goto LABEL_180;
                      v213 = *(_QWORD *)&v187[8 * v209];
                      if (!v213)
                      {
                        v209 = v189 + 4;
                        if (v189 + 4 >= v24)
                          goto LABEL_180;
                        v213 = *(_QWORD *)&v187[8 * v209];
                        if (!v213)
                        {
                          v214 = v189 + 5;
                          do
                          {
                            if (v24 == v214)
                              goto LABEL_180;
                            v213 = *(_QWORD *)&v187[8 * v214++];
                          }
                          while (!v213);
                          v209 = v214 - 1;
                        }
                      }
                    }
                  }
                  v207 = (v213 - 1) & v213;
                  v208 = __clz(__rbit64(v213)) + (v209 << 6);
                }
                v211 = *(id *)(*(_QWORD *)(v186 + 48) + 8 * v208);
                if (!v211)
                  goto LABEL_180;
              }
              v215 = v211[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert];
              v216 = *(id *)&v211[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID];
              sub_1A241DD50(v216, v307, v310, v215, v308, v309);
              if (v217)
              {
                v218 = v217;
                sub_1A2420818(&v320, v218);

              }
              else
              {

              }
              v189 = v209;
              v190 = v207;
            }
          }
          v191 = sub_1A24169B4();
          (*(void (**)(_OWORD *, uint64_t, int64_t))(v172 + 16))(v300, v191, v24);
          v192 = swift_allocObject();
          *(_QWORD *)(v192 + 16) = v184;
          *(_QWORD *)(v192 + 24) = v183;
          v193 = sub_1A2435A04();
          v194 = sub_1A2435A94();
          v195 = swift_allocObject();
          *(_BYTE *)(v195 + 16) = 32;
          v196 = swift_allocObject();
          *(_BYTE *)(v196 + 16) = 8;
          v197 = swift_allocObject();
          *(_QWORD *)(v197 + 16) = sub_1A2424F04;
          *(_QWORD *)(v197 + 24) = v192;
          v198 = swift_allocObject();
          *(_QWORD *)(v198 + 16) = sub_1A24248D0;
          *(_QWORD *)(v198 + 24) = v197;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679A0);
          v199 = swift_allocObject();
          *(_OWORD *)(v199 + 16) = v283;
          *(_QWORD *)(v199 + 32) = sub_1A2424888;
          *(_QWORD *)(v199 + 40) = v195;
          *(_QWORD *)(v199 + 48) = sub_1A2424F00;
          *(_QWORD *)(v199 + 56) = v196;
          *(_QWORD *)(v199 + 64) = sub_1A24248F0;
          *(_QWORD *)(v199 + 72) = v198;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          v200 = v194;
          if (os_log_type_enabled(v193, v194))
          {
            v201 = (uint8_t *)swift_slowAlloc();
            v202 = swift_slowAlloc();
            v320 = 0;
            v311 = v202;
            *(_WORD *)v201 = 258;
            v201[2] = *(_BYTE *)(v195 + 16);
            swift_release();
            v201[3] = *(_BYTE *)(v196 + 16);
            *(_QWORD *)&v315 = v201 + 4;
            swift_release();
            sub_1A241FBF4((uint64_t *)&v315, (uint64_t)&v320, &v311, *(uint64_t (**)(void))(v198 + 16));
            swift_release();
            _os_log_impl(&dword_1A2318000, v193, v200, "EKRemoteUIObjectSerializer: cannot deserialize changeSet multiValueRemovals as a Set<EKObjectID> for key: %s", v201, 0xCu);
            swift_arrayDestroy();
            v203 = v202;
            v172 = v301;
            MEMORY[0x1A8584D7C](v203, -1, -1);
            MEMORY[0x1A8584D7C](v201, -1, -1);
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
          }

          (*(void (**)(_OWORD *, int64_t))(v172 + 8))(v300, v24);
LABEL_181:
          v171 = v296;
          v167 = (int64_t)v297;
        }
        v182 = (char *)v167;
LABEL_190:
        v175 = 0;
        v316 = 0u;
        v317 = 0u;
        v167 = (int64_t)v182;
        v315 = 0u;
        goto LABEL_191;
      }
    }
    else
    {
      sub_1A2424E44((uint64_t)&v318, &qword_1EE667970);
    }
LABEL_243:
    sub_1A241F11C(v294);
    swift_bridgeObjectRelease();
    sub_1A241F4E0(v313);
    swift_bridgeObjectRelease();
    sub_1A241F4E0(*(uint64_t *)&v312[0]);
    swift_bridgeObjectRelease();
    v24 = (int64_t)objc_allocWithZone((Class)EKChangeSet);
    v219 = (void *)sub_1A2435A28();
    swift_bridgeObjectRelease();
    v220 = (void *)sub_1A2435A28();
    swift_bridgeObjectRelease();
    v221 = (void *)sub_1A2435A28();
    swift_bridgeObjectRelease();
    v222 = objc_msgSend((id)v24, sel_initWithSingleValueChanges_multiValueAdditions_multiValueRemovals_, v219, v220, v221);

    v8 = v306;
    a1 = v288;
    v109 = v302;
    if (v222)
    {
      if (-[NSObject isTemporary](v293, sel_isTemporary))
        objc_msgSend(v222, sel_setIsNew_, 1);
      objc_msgSend(v291, sel_setChangeSet_, v222);

    }
LABEL_247:
    objc_msgSend(v291, sel__resetAfterUpdatingChangeSetOrBackingObject);
    v320 = MEMORY[0x1E0DEE9E0];
    v223 = *(_QWORD *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKCachedMeltedObjectsKey);
    v224 = *(_QWORD *)(v8 + OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKCachedMeltedObjectsKey + 8);
    swift_bridgeObjectRetain();
    sub_1A241DD00(v223, v224, a1, &v318);
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v319[0] + 1))
    {
      v225 = (_OWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EE667960);
      v45 = (uint64_t)&v318;
      v301 = MEMORY[0x1E0DEE9B8] + 8;
      if ((swift_dynamicCast() & 1) != 0)
      {
        v302 = v109;
        v303 = 0;
        v226 = *(_QWORD *)(v315 + 64);
        v288 = v315 + 64;
        v299 = (char *)v315;
        v227 = 1 << *(_BYTE *)(v315 + 32);
        v228 = -1;
        if (v227 < 64)
          v228 = ~(-1 << v227);
        v229 = v228 & v226;
        v298 = (uint64_t)&v316;
        v300 = v319;
        v230 = *MEMORY[0x1E0D0B280];
        v295 = (__int128 *)((unint64_t)(v227 + 63) >> 6);
        v296 = v230;
        v287 = (char *)v295 - 1;
        v289 = v225;
        if (!v229)
          goto LABEL_256;
LABEL_254:
        v231 = __clz(__rbit64(v229));
        v229 &= v229 - 1;
        v232 = v231 | (v303 << 6);
        while (1)
        {
          v233 = *((_QWORD *)v299 + 7);
          v234 = (_QWORD *)(*((_QWORD *)v299 + 6) + 16 * v232);
          v235 = v234[1];
          *(_QWORD *)&v315 = *v234;
          *((_QWORD *)&v315 + 1) = v235;
          sub_1A24247A0(v233 + 32 * v232, v298);
          swift_bridgeObjectRetain();
          while (1)
          {
            sub_1A24247DC((uint64_t)&v315, (uint64_t)&v318);
            v239 = *((_QWORD *)&v318 + 1);
            if (!*((_QWORD *)&v318 + 1))
            {
              swift_release();
              v271 = v320;
              v109 = v302;
              goto LABEL_309;
            }
            v45 = v318;
            sub_1A2424824(v300, &v315);
            sub_1A24247A0((uint64_t)&v315, (uint64_t)&v313);
            if (swift_dynamicCast())
            {
              v240 = *(_QWORD *)&v312[0];
              v241 = sub_1A24359F8();
              v242 = v45;
              v243 = v304;
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v241 - 8) + 56))(v304, 1, 1, v241);
              v45 = sub_1A241B590(v240, v307, v305, v310, v243, v308, v309);
              swift_bridgeObjectRelease();
              v244 = (uint64_t)v243;
              v24 = v242;
              sub_1A2424E44(v244, &qword_1EE667950);
              if (v242 == sub_1A2435A58() && v245 == v239)
              {
                v246 = (id)v45;
                swift_bridgeObjectRelease();
LABEL_286:
                if (!v45)
                  goto LABEL_290;
                v258 = objc_msgSend((id)v45, sel_objectID);

                if (!v258)
                  goto LABEL_322;
                v259 = objc_msgSend(v258, sel_isVirtual);

                if ((v259 & 1) != 0)
                {
                  v260 = objc_msgSend(v310, sel_defaultCalendarForNewEvents);

                  v45 = (uint64_t)v260;
                  if (!v260)
                    goto LABEL_290;
                }
LABEL_292:
                v314 = sub_1A2424D0C(0, &qword_1EE667990);
                *(_QWORD *)&v313 = v45;
                sub_1A2424824(&v313, v312);
                v45 = v320;
                v261 = swift_isUniquelyReferenced_nonNull_native();
                v311 = v45;
                v263 = sub_1A2420AEC(v24, v239);
                v264 = *(_QWORD *)(v45 + 16);
                v265 = (v262 & 1) == 0;
                v266 = v264 + v265;
                if (__OFADD__(v264, v265))
                  goto LABEL_313;
                v267 = v262;
                if (*(_QWORD *)(v45 + 24) >= v266)
                {
                  if ((v261 & 1) != 0)
                  {
                    if ((v262 & 1) == 0)
                      goto LABEL_296;
                  }
                  else
                  {
                    sub_1A24238B4();
                    v45 = v311;
                    if ((v267 & 1) == 0)
                      goto LABEL_296;
                  }
                }
                else
                {
                  sub_1A242230C(v266, v261);
                  v45 = v311;
                  v268 = sub_1A2420AEC(v24, v239);
                  if ((v267 & 1) != (v269 & 1))
                    goto LABEL_323;
                  v263 = v268;
                  if ((v267 & 1) == 0)
                  {
LABEL_296:
                    sub_1A24236A4(v263, v24, v239, v312, (_QWORD *)v45);
                    swift_bridgeObjectRetain();
LABEL_300:
                    v320 = v45;
                    swift_bridgeObjectRelease();
LABEL_301:
                    swift_bridgeObjectRelease();
LABEL_302:
                    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v315);
                    if (v229)
                      goto LABEL_254;
                    goto LABEL_256;
                  }
                }
                v270 = (_OWORD *)(*(_QWORD *)(v45 + 56) + 32 * v263);
                __swift_destroy_boxed_opaque_existential_0((uint64_t)v270);
                sub_1A2424824(v312, v270);
                goto LABEL_300;
              }
              v256 = sub_1A2435C38();
              v257 = (id)v45;
              swift_bridgeObjectRelease();
              if ((v256 & 1) != 0)
                goto LABEL_286;

              if (v45)
                goto LABEL_292;
LABEL_290:
              v45 = (uint64_t)&v320;
              sub_1A24202A4(v24, v239, v312);
              swift_bridgeObjectRelease();
              sub_1A2424E44((uint64_t)v312, &qword_1EE667970);
              goto LABEL_302;
            }
            sub_1A24247A0((uint64_t)&v315, (uint64_t)&v313);
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667980);
            if ((swift_dynamicCast() & 1) == 0)
              goto LABEL_301;
            v292 = (_OWORD *)v45;
            v294 = v229;
            v247 = *(_QWORD *)&v312[0];
            v248 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E20]), sel_init);
            v297 = (_OWORD *)v247;
            v249 = *(_QWORD *)(v247 + 16);
            if (v249)
            {
              v250 = (int64_t *)(v297 + 2);
              v251 = sub_1A24359F8();
              v252 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v251 - 8) + 56);
              do
              {
                v24 = *v250;
                v253 = (uint64_t)v304;
                v252(v304, 1, 1, v251);
                v254 = swift_bridgeObjectRetain();
                v255 = (void *)sub_1A241B590(v254, v307, v305, v310, v253, v308, v309);
                swift_bridgeObjectRelease();
                sub_1A2424E44(v253, &qword_1EE667950);
                if (v255)
                {
                  objc_msgSend(v248, sel_addObject_, v255);

                }
                ++v250;
                --v249;
              }
              while (v249);
            }
            swift_bridgeObjectRelease();
            v314 = sub_1A2424D0C(0, &qword_1EE667988);
            *(_QWORD *)&v313 = v248;
            v45 = (uint64_t)&v320;
            sub_1A241AD2C((uint64_t)&v313, (uint64_t)v292, v239);
            __swift_destroy_boxed_opaque_existential_0((uint64_t)&v315);
            v229 = v294;
            if (v294)
              goto LABEL_254;
LABEL_256:
            v236 = v303 + 1;
            if (__OFADD__(v303, 1))
              goto LABEL_312;
            if (v236 >= (uint64_t)v295)
              goto LABEL_273;
            v237 = *(_QWORD *)(v288 + 8 * v236);
            if (v237)
              goto LABEL_259;
            v238 = v303 + 2;
            ++v303;
            if (v236 + 1 >= (uint64_t)v295)
              goto LABEL_273;
            v237 = *(_QWORD *)(v288 + 8 * v238);
            if (v237)
              goto LABEL_262;
            v303 = v236 + 1;
            if (v236 + 2 >= (uint64_t)v295)
              goto LABEL_273;
            v237 = *(_QWORD *)(v288 + 8 * (v236 + 2));
            if (v237)
              break;
            v238 = v236 + 3;
            v303 = v236 + 2;
            if (v236 + 3 < (uint64_t)v295)
            {
              v237 = *(_QWORD *)(v288 + 8 * v238);
              if (v237)
              {
LABEL_262:
                v236 = v238;
                goto LABEL_259;
              }
              while (1)
              {
                v236 = v238 + 1;
                if (__OFADD__(v238, 1))
                  goto LABEL_320;
                if (v236 >= (uint64_t)v295)
                  break;
                v237 = *(_QWORD *)(v288 + 8 * v236);
                ++v238;
                if (v237)
                  goto LABEL_259;
              }
              v303 = (uint64_t)v287;
            }
LABEL_273:
            v229 = 0;
            v316 = 0u;
            v317 = 0u;
            v315 = 0u;
          }
          v236 += 2;
LABEL_259:
          v229 = (v237 - 1) & v237;
          v232 = __clz(__rbit64(v237)) + (v236 << 6);
          v303 = v236;
        }
      }
    }
    else
    {
      sub_1A2424E44((uint64_t)&v318, &qword_1EE667970);
    }
    v271 = MEMORY[0x1E0DEE9E0];
LABEL_309:
    sub_1A241F11C(v271);
    swift_bridgeObjectRelease();
    v272 = (void *)sub_1A2435A28();
    swift_bridgeObjectRelease();
    v53 = v291;
    objc_msgSend(v291, sel_setCachedMeltedObjects_, v272);

    v273 = v293;
    v274 = v290;

    return (uint64_t)v53;
  }
  v113 = 0;
  v114 = *(_QWORD *)(v315 + 64);
  v279 = (_OWORD *)(v315 + 64);
  v115 = 1 << *(_BYTE *)(v315 + 32);
  if (v115 < 64)
    v116 = ~(-1 << v115);
  else
    v116 = -1;
  v117 = v116 & v114;
  v118 = (unint64_t)(v115 + 63) >> 6;
  v282 = v118;
  *(_QWORD *)&v283 = &v316;
  v289 = v319;
  v276 = v118 - 1;
  v277 = v118 - 5;
  v284 = (__int128 *)v315;
  v278 = v315 + 104;
  v297 = (_OWORD *)(MEMORY[0x1E0DEE9B0] + 8);
  v119 = v299;
  while (1)
  {
    if (v117)
    {
      v121 = __clz(__rbit64(v117));
      v122 = (v117 - 1) & v117;
      v123 = v121 | (v113 << 6);
LABEL_113:
      v124 = *((_QWORD *)v284 + 7);
      v125 = (_QWORD *)(*((_QWORD *)v284 + 6) + 16 * v123);
      v126 = v125[1];
      *(_QWORD *)&v315 = *v125;
      *((_QWORD *)&v315 + 1) = v126;
      sub_1A24247A0(v124 + 32 * v123, v283);
      swift_bridgeObjectRetain();
      goto LABEL_120;
    }
    v127 = v113 + 1;
    if (__OFADD__(v113, 1))
      goto LABEL_316;
    if (v127 >= v282)
    {
      v129 = v113;
    }
    else
    {
      v128 = *((_QWORD *)v279 + v127);
      if (v128)
        goto LABEL_117;
      v129 = v113 + 1;
      if ((uint64_t)(v113 + 2) < v282)
      {
        v128 = *((_QWORD *)v279 + v113 + 2);
        if (v128)
        {
          v127 = v113 + 2;
LABEL_117:
          v122 = (v128 - 1) & v128;
          v123 = __clz(__rbit64(v128)) + (v127 << 6);
          v113 = v127;
          goto LABEL_113;
        }
        v129 = v113 + 2;
        if ((uint64_t)(v113 + 3) < v282)
        {
          v128 = *((_QWORD *)v279 + v113 + 3);
          if (v128)
          {
            v127 = v113 + 3;
            goto LABEL_117;
          }
          v127 = v113 + 4;
          v129 = v113 + 3;
          if ((uint64_t)(v113 + 4) < v282)
          {
            v128 = *((_QWORD *)v279 + v127);
            if (v128)
              goto LABEL_117;
            while (v277 != v113)
            {
              v128 = *(_QWORD *)(v278 + 8 * v113++);
              if (v128)
              {
                v127 = v113 + 4;
                goto LABEL_117;
              }
            }
            v129 = v276;
          }
        }
      }
    }
    v122 = 0;
    v316 = 0u;
    v317 = 0u;
    v113 = v129;
    v315 = 0u;
LABEL_120:
    sub_1A24247DC((uint64_t)&v315, (uint64_t)&v318);
    v130 = (char *)*((_QWORD *)&v318 + 1);
    if (!*((_QWORD *)&v318 + 1))
    {
      swift_release();
      goto LABEL_174;
    }
    v131 = v318;
    sub_1A2424824(v289, &v315);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667998);
    v132 = swift_dynamicCast();
    v295 = (__int128 *)v122;
    v296 = v113;
    if (v132)
      break;
    if (qword_1EE6678D0 != -1)
      swift_once();
    v138 = __swift_project_value_buffer(v24, (uint64_t)qword_1EE667E88);
    (*(void (**)(char *, uint64_t, int64_t))(v301 + 16))(v119, v138, v24);
    v139 = swift_allocObject();
    *(_QWORD *)(v139 + 16) = v131;
    *(_QWORD *)(v139 + 24) = v130;
    v140 = sub_1A2435A04();
    v141 = sub_1A2435A94();
    v142 = swift_allocObject();
    *(_BYTE *)(v142 + 16) = 32;
    v143 = swift_allocObject();
    *(_BYTE *)(v143 + 16) = 8;
    v144 = swift_allocObject();
    *(_QWORD *)(v144 + 16) = sub_1A2424F04;
    *(_QWORD *)(v144 + 24) = v139;
    v145 = swift_allocObject();
    *(_QWORD *)(v145 + 16) = sub_1A2424EC4;
    *(_QWORD *)(v145 + 24) = v144;
    v146 = v141;
    if (os_log_type_enabled(v140, v141))
    {
      v147 = (uint8_t *)swift_slowAlloc();
      v148 = swift_slowAlloc();
      *(_QWORD *)&v325 = 0;
      *(_QWORD *)&v312[0] = v148;
      *(_WORD *)v147 = 258;
      v147[2] = *(_BYTE *)(v142 + 16);
      swift_release();
      v147[3] = *(_BYTE *)(v143 + 16);
      *(_QWORD *)&v315 = v147 + 4;
      swift_release();
      sub_1A241FBF4((uint64_t *)&v315, (uint64_t)&v325, (uint64_t *)v312, *(uint64_t (**)(void))(v145 + 16));
      swift_release();
      _os_log_impl(&dword_1A2318000, v140, v146, "EKRemoteUIObjectSerializer: cannot deserialize changeSet multiValueAdditions as a Set<EKObjectID> for key: %s", v147, 0xCu);
      swift_arrayDestroy();
      v149 = v148;
      v8 = v306;
      MEMORY[0x1A8584D7C](v149, -1, -1);
      MEMORY[0x1A8584D7C](v147, -1, -1);
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
    }

    (*(void (**)(char *, int64_t))(v301 + 8))(v119, v24);
LABEL_110:
    v117 = (unint64_t)v295;
    v113 = v296;
  }
  v286 = v131;
  v287 = v130;
  v133 = v325;
  *(_QWORD *)&v315 = MEMORY[0x1E0DEE9E8];
  if ((v325 & 0xC000000000000001) != 0)
  {
    sub_1A2435B0C();
    type metadata accessor for EKRemoteUIPersistentObjectPointer();
    sub_1A24248F8();
    sub_1A2435A88();
    v134 = *((_QWORD *)&v321 + 1);
    v133 = v321;
    v135 = v322;
    v136 = v323;
    v137 = v324;
  }
  else
  {
    v136 = 0;
    v150 = -1 << *(_BYTE *)(v325 + 32);
    v134 = v325 + 56;
    v135 = ~v150;
    v151 = -v150;
    if (v151 < 64)
      v152 = ~(-1 << v151);
    else
      v152 = -1;
    v137 = v152 & *(_QWORD *)(v325 + 56);
  }
  v298 = v133 & 0x7FFFFFFFFFFFFFFFLL;
  v285 = (char *)v135;
  v24 = (unint64_t)(v135 + 64) >> 6;
  while (2)
  {
    if (v133 < 0)
    {
      v156 = sub_1A2435B30();
      if (!v156)
        goto LABEL_109;
      *(_QWORD *)&v312[0] = v156;
      type metadata accessor for EKRemoteUIPersistentObjectPointer();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v157 = (_BYTE *)v325;
      swift_unknownObjectRelease();
      v155 = v136;
      v153 = v137;
      if (!v157)
        goto LABEL_109;
      goto LABEL_158;
    }
    if (v137)
    {
      v153 = (v137 - 1) & v137;
      v154 = __clz(__rbit64(v137)) | (v136 << 6);
      v155 = v136;
      goto LABEL_157;
    }
    v158 = v136 + 1;
    if (!__OFADD__(v136, 1))
    {
      if (v158 >= v24)
        goto LABEL_109;
      v159 = *(_QWORD *)(v134 + 8 * v158);
      v155 = v136 + 1;
      if (!v159)
      {
        v155 = v136 + 2;
        if (v136 + 2 >= v24)
          goto LABEL_109;
        v159 = *(_QWORD *)(v134 + 8 * v155);
        if (!v159)
        {
          v155 = v136 + 3;
          if (v136 + 3 >= v24)
            goto LABEL_109;
          v159 = *(_QWORD *)(v134 + 8 * v155);
          if (!v159)
          {
            v155 = v136 + 4;
            if (v136 + 4 >= v24)
              goto LABEL_109;
            v159 = *(_QWORD *)(v134 + 8 * v155);
            if (!v159)
            {
              v160 = v136 + 5;
              while (v24 != v160)
              {
                v159 = *(_QWORD *)(v134 + 8 * v160++);
                if (v159)
                {
                  v155 = v160 - 1;
                  goto LABEL_156;
                }
              }
LABEL_109:
              sub_1A2424D04();
              v120 = sub_1A241ECE0(v315);
              swift_bridgeObjectRelease();
              sub_1A241AE00(v120, v286, (uint64_t)v287);
              v8 = v306;
              v24 = v303;
              v119 = v299;
              goto LABEL_110;
            }
          }
        }
      }
LABEL_156:
      v153 = (v159 - 1) & v159;
      v154 = __clz(__rbit64(v159)) + (v155 << 6);
LABEL_157:
      v157 = *(id *)(*(_QWORD *)(v133 + 48) + 8 * v154);
      if (!v157)
        goto LABEL_109;
LABEL_158:
      v161 = v157[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert];
      v162 = *(id *)&v157[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID];
      sub_1A241DD50(v162, v307, v310, v161, v308, v309);
      if (v163)
      {
        v164 = v163;
        sub_1A2420818(&v325, v164);

      }
      else
      {

      }
      v136 = v155;
      v137 = v153;
      continue;
    }
    break;
  }
  __break(1u);
LABEL_311:
  __break(1u);
LABEL_312:
  __break(1u);
LABEL_313:
  __break(1u);
LABEL_314:
  __break(1u);
LABEL_315:
  __break(1u);
LABEL_316:
  __break(1u);
LABEL_317:
  __break(1u);
LABEL_318:
  swift_once();
LABEL_39:
  __swift_project_value_buffer(v24, (uint64_t)qword_1EE667E88);
  v50 = sub_1A2435A04();
  v55 = sub_1A2435A94();
  v56 = os_log_type_enabled(v50, v55);
  v49 = v302;
  if (v56)
  {
    v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v57 = 0;
    _os_log_impl(&dword_1A2318000, v50, v55, "EKRemoteUIObjectSerializer: Cannot generate a Deserialized EKPersistentObject.", v57, 2u);
    MEMORY[0x1A8584D7C](v57, -1, -1);
    v58 = v293;

    goto LABEL_33;
  }

  v108 = v293;
LABEL_99:

LABEL_35:
  return 0;
}

void *sub_1A241DC2C(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  char v7;
  id v8;
  void *v10;

  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v6 = sub_1A2420ABC((uint64_t)a1);
      if ((v7 & 1) != 0)
      {
        v5 = *(void **)(*(_QWORD *)(a2 + 56) + 8 * v6);
        v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  v3 = a1;
  v4 = sub_1A2435BCC();

  if (!v4)
    return 0;
  sub_1A2424D0C(0, &qword_1EE6679B0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

double sub_1A241DD00@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_1A2420AEC(a1, a2), (v7 & 1) != 0))
  {
    sub_1A24247A0(*(_QWORD *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

void sub_1A241DD50(void *a1, uint64_t a2, void *a3, char a4, _QWORD *a5, uint64_t *a6)
{
  uint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  char **v15;
  id v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  int64_t v40;
  unint64_t v41;
  int64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *ObjCClassFromObject;
  void *v48;
  id v49;
  void *v50;
  unsigned __int8 v51;
  NSObject v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  char *v71;
  int64_t v72;
  unint64_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v84;
  char v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint64_t v89;
  _QWORD *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  uint64_t v94;
  NSObject *v95;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  _QWORD *v99;
  NSObject *v100;
  void *v101;
  id v102;
  uint64_t v103;
  unint64_t v104;
  int64_t v105;
  id v106;
  uint64_t v107;
  NSObject *v108;
  int64_t v109;
  int64_t v110;
  _BYTE *v111;
  uint64_t v112;
  NSObject *v113;
  void *v114;
  _QWORD *v115;
  uint64_t v116;
  _OWORD v117[2];
  uint64_t v118;
  uint64_t v119;
  _BYTE *v120;
  __int128 v121;
  uint64_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  NSObject *v126;
  NSObject *v127;
  __int128 v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;

  v11 = *a6;
  v12 = a1;
  v13 = sub_1A241DC2C(v12, v11);

  if (v13)
    return;
  v108 = a6;
  if (!-[NSObject isTemporary](v12, sel_isTemporary))
  {
    v20 = objc_msgSend(a3, sel_registerFetchedObjectWithID_, v12);
    if (v20)
      goto LABEL_10;
LABEL_119:
    if (qword_1EE6678D0 != -1)
      goto LABEL_127;
    goto LABEL_120;
  }
  v14 = -[NSObject entityName](v12, sel_entityName);
  v15 = &selRef_insertedPersistentObjectWithEntityName_;
  if ((a4 & 1) == 0)
    v15 = &selRef_persistentObjectWithEntityName_;
  v16 = objc_msgSend(a3, *v15, v14);

  if (!*a5)
  {
    v20 = v16;
    if (v16)
      goto LABEL_10;
    goto LABEL_119;
  }
  if (!v16 || (v17 = objc_msgSend(v16, sel_objectID)) == 0)
  {
    v92 = v12;
    v93 = (void *)sub_1A2420394((unint64_t)v92);

    v20 = v16;
    if (v16)
      goto LABEL_10;
    goto LABEL_119;
  }
  v18 = (uint64_t)v17;
  v19 = v12;
  sub_1A24204E8(v18, v19, &qword_1EE667A10, sub_1A2421DFC);

  v20 = v16;
LABEL_10:
  v21 = v20;
  v22 = v20;
  v12 = v12;
  v23 = v22;
  sub_1A24204E8((uint64_t)v23, v12, &qword_1EE667A18, sub_1A2421BA4);
  if (!*(_QWORD *)(a2 + 16))
  {

    return;
  }
  v101 = v21;
  v24 = sub_1A2420ABC((uint64_t)v12);
  if ((v25 & 1) == 0)
  {

LABEL_117:
    return;
  }
  v26 = a2;
  v115 = a5;
  v27 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v24);
  swift_bridgeObjectRetain();

  v109 = 0;
  v103 = v27 + 64;
  v28 = 1 << *(_BYTE *)(v27 + 32);
  if (v28 < 64)
    v29 = ~(-1 << v28);
  else
    v29 = -1;
  v30 = v29 & *(_QWORD *)(v27 + 64);
  v107 = v27;
  v105 = (unint64_t)(v28 + 63) >> 6;
  v116 = a2;
  v106 = v23;
  v114 = a3;
  while (1)
  {
    if (v30)
    {
      v35 = __clz(__rbit64(v30));
      v30 &= v30 - 1;
      v36 = v35 | (v109 << 6);
LABEL_23:
      v37 = *(_QWORD *)(v107 + 56);
      v38 = (_QWORD *)(*(_QWORD *)(v107 + 48) + 16 * v36);
      v39 = v38[1];
      *(_QWORD *)&v123 = *v38;
      *((_QWORD *)&v123 + 1) = v39;
      sub_1A24247A0(v37 + 32 * v36, (uint64_t)&v124);
      swift_bridgeObjectRetain();
      goto LABEL_42;
    }
    v40 = v109 + 1;
    if (__OFADD__(v109, 1))
      goto LABEL_126;
    if (v40 < v105)
    {
      v41 = *(_QWORD *)(v103 + 8 * v40);
      if (!v41)
      {
        v42 = v109 + 2;
        ++v109;
        if (v40 + 1 >= v105)
          goto LABEL_41;
        v41 = *(_QWORD *)(v103 + 8 * v42);
        if (!v41)
        {
          v109 = v40 + 1;
          if (v40 + 2 >= v105)
            goto LABEL_41;
          v41 = *(_QWORD *)(v103 + 8 * (v40 + 2));
          if (v41)
          {
            v40 += 2;
            goto LABEL_27;
          }
          v42 = v40 + 3;
          v109 = v40 + 2;
          if (v40 + 3 >= v105)
            goto LABEL_41;
          v41 = *(_QWORD *)(v103 + 8 * v42);
          if (!v41)
          {
            while (1)
            {
              v40 = v42 + 1;
              if (__OFADD__(v42, 1))
                break;
              if (v40 >= v105)
              {
                v109 = v105 - 1;
                goto LABEL_41;
              }
              v41 = *(_QWORD *)(v103 + 8 * v40);
              ++v42;
              if (v41)
                goto LABEL_27;
            }
            __break(1u);
LABEL_129:
            __break(1u);
            return;
          }
        }
        v40 = v42;
      }
LABEL_27:
      v30 = (v41 - 1) & v41;
      v36 = __clz(__rbit64(v41)) + (v40 << 6);
      v109 = v40;
      goto LABEL_23;
    }
LABEL_41:
    v30 = 0;
    v124 = 0u;
    v125 = 0u;
    v123 = 0u;
LABEL_42:
    sub_1A24247DC((uint64_t)&v123, (uint64_t)&v126);
    v113 = v127;
    if (!v127)
    {
      swift_release();
      goto LABEL_117;
    }
    sub_1A2424824(&v128, &v121);
    sub_1A24247A0((uint64_t)&v121, (uint64_t)&v123);
    type metadata accessor for EKRemoteUIPersistentObjectPointer();
    if (swift_dynamicCast())
    {
      v43 = a3;
      v44 = v26;
      v34 = *(void **)&v117[0];
      v45 = *(void **)(*(_QWORD *)&v117[0] + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID);
      v46 = *(unsigned __int8 *)(*(_QWORD *)&v117[0]
                               + OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert);
      ObjCClassFromObject = (void *)swift_getObjCClassFromObject();
      v48 = v23;
      v49 = v45;
      if (!objc_msgSend(ObjCClassFromObject, sel_meltedClass))
        goto LABEL_129;
      swift_getObjCClassMetadata();
      v12 = v48;
      v50 = (void *)sub_1A2435A4C();
      v51 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_isWeakRelationObject_forKey_, v12, v50);

      if ((v51 & 1) == 0)
      {
        v26 = v44;
        v59 = (void *)sub_1A241DD50(v49, v44, v43, v46, v115, v108);
        if (v59)
        {
          v60 = v59;
          v61 = (void *)sub_1A2435A4C();
          swift_bridgeObjectRelease();
          -[NSObject setValue:forKey:](v12, sel_setValue_forKey_, v60, v61);

          v26 = v44;
          v34 = v60;
        }
        else
        {

          swift_bridgeObjectRelease();
          v34 = v49;
        }
        v23 = v106;
        goto LABEL_19;
      }
      v52.isa = v108->isa;
      if (objc_msgSend(v49, sel_entityType) == (id)1 && objc_msgSend(v49, sel_isVirtual))
      {
        v53 = objc_msgSend(v43, sel_defaultCalendarForNewEvents);
        if (!v53)
          goto LABEL_113;
        v54 = v53;
        v31 = objc_msgSend(v53, sel_persistentObject);

        if (!v31)
          goto LABEL_113;
        goto LABEL_17;
      }
      if (((unint64_t)v52.isa & 0xC000000000000001) != 0)
      {
        v62 = v49;
        v63 = sub_1A2435BCC();
        if (v63)
        {
          *(_QWORD *)&v117[0] = v63;
          sub_1A2424D0C(0, &qword_1EE6679B0);
          swift_unknownObjectRetain();
          swift_dynamicCast();
          v31 = (id)v123;
          swift_unknownObjectRelease();
          goto LABEL_102;
        }
      }
      else
      {
        if (!*((_QWORD *)v52.isa + 2))
          goto LABEL_105;
        v84 = sub_1A2420ABC((uint64_t)v49);
        if ((v85 & 1) != 0)
        {
          v31 = *(id *)(*((_QWORD *)v52.isa + 7) + 8 * v84);
LABEL_102:

          if (v31)
            goto LABEL_17;
          goto LABEL_105;
        }
      }

LABEL_105:
      if (objc_msgSend(v49, sel_isTemporary))
      {
        if (qword_1EE6678D0 != -1)
          swift_once();
        v86 = sub_1A2435A1C();
        __swift_project_value_buffer(v86, (uint64_t)qword_1EE667E88);
        v87 = v49;
        v12 = sub_1A2435A04();
        v88 = sub_1A2435A94();
        if (os_log_type_enabled(v12, v88))
        {
          v89 = swift_slowAlloc();
          v90 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v89 = 138412290;
          *(_QWORD *)(v89 + 4) = v87;
          *v90 = v87;
          _os_log_impl(&dword_1A2318000, v12, v88, "EKRemoteUIObjectSerializer: Attempting to fetch from the eventStore using a temporary objectID: %@", (uint8_t *)v89, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679C0);
          swift_arrayDestroy();
          v44 = v116;
          MEMORY[0x1A8584D7C](v90, -1, -1);
          MEMORY[0x1A8584D7C](v89, -1, -1);
        }
        else
        {

          v12 = v87;
        }

        goto LABEL_113;
      }
      v31 = objc_msgSend(v43, sel_registerFetchedObjectWithID_, v49);
      if (!v31)
      {
LABEL_113:
        swift_bridgeObjectRelease();

        goto LABEL_18;
      }
LABEL_17:
      v32 = v31;
      v33 = (void *)sub_1A2435A4C();
      swift_bridgeObjectRelease();
      -[NSObject setValue:forKey:](v12, sel_setValue_forKey_, v32, v33);

      v34 = v32;
LABEL_18:
      v23 = v106;
      v26 = v44;
LABEL_19:
      a3 = v43;
      goto LABEL_20;
    }
    sub_1A24247A0((uint64_t)&v121, (uint64_t)&v123);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667998);
    if (swift_dynamicCast())
      break;
    sub_1A24247A0((uint64_t)&v121, (uint64_t)&v123);
    sub_1A2424D0C(0, &qword_1EE667A08);
    if (swift_dynamicCast())
    {

      v12 = v113;
      v34 = (void *)sub_1A2435A4C();
      swift_bridgeObjectRelease();
      objc_msgSend(v23, sel_setValue_forKey_, 0, v34);
    }
    else
    {
      __swift_project_boxed_opaque_existential_0(&v121, v122);
      v12 = sub_1A2435C2C();
      v34 = (void *)sub_1A2435A4C();
      swift_bridgeObjectRelease();
      objc_msgSend(v23, sel_setValue_forKey_, v12, v34);
      swift_unknownObjectRelease();
    }
LABEL_20:

    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v121);
  }
  v55 = *(_QWORD *)&v117[0];
  if ((*(_QWORD *)&v117[0] & 0xC000000000000001) != 0)
  {
    sub_1A2435B0C();
    sub_1A24248F8();
    sub_1A2435A88();
    v55 = v129;
    v112 = v130;
    v56 = v131;
    v57 = v132;
    v58 = v133;
  }
  else
  {
    v57 = 0;
    v64 = -1 << *(_BYTE *)(*(_QWORD *)&v117[0] + 32);
    v112 = *(_QWORD *)&v117[0] + 56;
    v56 = ~v64;
    v65 = -v64;
    if (v65 < 64)
      v66 = ~(-1 << v65);
    else
      v66 = -1;
    v58 = v66 & *(_QWORD *)(*(_QWORD *)&v117[0] + 56);
  }
  v12 = v108;
  v104 = v30;
  v110 = (unint64_t)(v56 + 64) >> 6;
  v111 = (_BYTE *)MEMORY[0x1E0DEE9E8];
  while (1)
  {
    v67 = v57;
    if ((v55 & 0x8000000000000000) == 0)
      break;
    v70 = sub_1A2435B30();
    if (!v70)
      goto LABEL_110;
    *(_QWORD *)&v117[0] = v70;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v71 = (char *)v123;
    swift_unknownObjectRelease();
    if (!v71)
      goto LABEL_110;
LABEL_88:
    v75 = *(id *)&v71[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID];
    v76 = ((uint64_t (*)(void))sub_1A241DD50)();
    if (v76)
    {
      v77 = (void *)v76;
      v119 = v76;
      sub_1A2424D0C(0, &qword_1EE6679B0);
      sub_1A2424CC0(&qword_1EE6679E0, &qword_1EE6679B0);
      v102 = v77;
      sub_1A2435B60();
      swift_bridgeObjectRetain();
      v78 = sub_1A2435B3C();
      v79 = -1 << v111[32];
      v80 = v78 & ~v79;
      if (((*(_QWORD *)&v111[((v80 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v80) & 1) != 0)
      {
        v81 = ~v79;
        while (1)
        {
          sub_1A2424D68(*((_QWORD *)v111 + 6) + 40 * v80, (uint64_t)&v123);
          v82 = MEMORY[0x1A8583FA8](&v123, v117);
          sub_1A2424DA4((uint64_t)&v123);
          if ((v82 & 1) != 0)
            break;
          v80 = (v80 + 1) & v81;
          if (((*(_QWORD *)&v111[((v80 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v80) & 1) == 0)
            goto LABEL_94;
        }
        swift_bridgeObjectRelease();
        sub_1A2424DA4((uint64_t)v117);
        sub_1A2424D68(*((_QWORD *)v111 + 6) + 40 * v80, (uint64_t)&v123);
      }
      else
      {
LABEL_94:
        swift_bridgeObjectRelease();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_1A2424D68((uint64_t)v117, (uint64_t)&v123);
        v120 = v111;
        sub_1A2423DE8((uint64_t)&v123, v80, isUniquelyReferenced_nonNull_native);
        v111 = v120;
        swift_bridgeObjectRelease();
        v123 = v117[0];
        v124 = v117[1];
        *(_QWORD *)&v125 = v118;
      }
      sub_1A2435B54();
      sub_1A2424DA4((uint64_t)&v123);
      swift_dynamicCast();

      v12 = v108;
    }
    else
    {

    }
  }
  if (v58)
  {
    v68 = __clz(__rbit64(v58));
    v58 &= v58 - 1;
    v69 = v68 | (v57 << 6);
LABEL_87:
    v71 = (char *)*(id *)(*(_QWORD *)(v55 + 48) + 8 * v69);
    if (!v71)
      goto LABEL_110;
    goto LABEL_88;
  }
  v72 = v57 + 1;
  if (!__OFADD__(v57, 1))
  {
    if (v72 >= v110)
      goto LABEL_110;
    v73 = *(_QWORD *)(v112 + 8 * v72);
    ++v57;
    if (!v73)
    {
      v57 = v67 + 2;
      if (v67 + 2 >= v110)
        goto LABEL_110;
      v73 = *(_QWORD *)(v112 + 8 * v57);
      if (!v73)
      {
        v57 = v67 + 3;
        if (v67 + 3 >= v110)
          goto LABEL_110;
        v73 = *(_QWORD *)(v112 + 8 * v57);
        if (!v73)
        {
          v57 = v67 + 4;
          if (v67 + 4 >= v110)
            goto LABEL_110;
          v73 = *(_QWORD *)(v112 + 8 * v57);
          if (!v73)
          {
            v74 = v67 + 5;
            while (v110 != v74)
            {
              v73 = *(_QWORD *)(v112 + 8 * v74++);
              if (v73)
              {
                v57 = v74 - 1;
                goto LABEL_86;
              }
            }
LABEL_110:
            sub_1A2424D04();
            v91 = (void *)sub_1A2435A7C();
            swift_bridgeObjectRelease();
            v12 = v113;
            v34 = (void *)sub_1A2435A4C();
            swift_bridgeObjectRelease();
            v23 = v106;
            objc_msgSend(v106, sel_setValue_forKey_, v91, v34);

            a3 = v114;
            v26 = v116;
            v30 = v104;
            goto LABEL_20;
          }
        }
      }
    }
LABEL_86:
    v58 = (v73 - 1) & v73;
    v69 = __clz(__rbit64(v73)) + (v57 << 6);
    goto LABEL_87;
  }
  __break(1u);
LABEL_126:
  __break(1u);
LABEL_127:
  swift_once();
LABEL_120:
  v94 = sub_1A2435A1C();
  __swift_project_value_buffer(v94, (uint64_t)qword_1EE667E88);
  v95 = v12;
  v96 = sub_1A2435A04();
  v97 = sub_1A2435A94();
  if (os_log_type_enabled(v96, v97))
  {
    v98 = (uint8_t *)swift_slowAlloc();
    v99 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v98 = 138412290;
    v126 = v95;
    v100 = v95;
    sub_1A2435AD0();
    *v99 = v95;

    _os_log_impl(&dword_1A2318000, v96, v97, "EKRemoteUIObjectSerializer: Cannot create persistentObject from objectID: %@", v98, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679C0);
    swift_arrayDestroy();
    MEMORY[0x1A8584D7C](v99, -1, -1);
    MEMORY[0x1A8584D7C](v98, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_1A241ECE0(uint64_t a1)
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
    if (sub_1A2435B18())
      goto LABEL_3;
LABEL_6:
    v3 = MEMORY[0x1E0DEE9E8];
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679D8);
  v3 = sub_1A2435B90();
  if (!v2)
    goto LABEL_7;
LABEL_4:
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A2435B0C();
  sub_1A2424D0C(0, &qword_1EE6679B0);
  sub_1A2424CC0(&qword_1EE6679E0, &qword_1EE6679B0);
  result = sub_1A2435A88();
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
    v16 = sub_1A2435B30();
    if (!v16)
      goto LABEL_45;
    *(_QWORD *)&v31 = v16;
    sub_1A2424D0C(0, &qword_1EE6679B0);
    swift_dynamicCast();
LABEL_36:
    sub_1A2424D0C(0, &qword_1EE6679B0);
    swift_dynamicCast();
    result = sub_1A2435B3C();
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
              sub_1A2424D04();
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

uint64_t sub_1A241F11C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679F0);
    v2 = sub_1A2435C14();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_1A24247A0(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1A2424824(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_1A2424824(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_1A2424824(v36, v37);
    sub_1A2424824(v37, &v33);
    result = sub_1A2435B3C();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_1A2424824(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1A2424D04();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1A241F4E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679F0);
    v2 = sub_1A2435C14();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    *(_QWORD *)&v36[0] = *v17;
    *((_QWORD *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679F8);
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_1A2424824(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_1A2424824(v35, v36);
    sub_1A2424824(v36, &v32);
    result = sub_1A2435B3C();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_1A2424824(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1A2424D04();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

id EKRemoteUIObjectSerializer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id EKRemoteUIObjectSerializer.init()()
{
  char *v0;
  objc_class *ObjectType;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKIsPendingInsertKey];
  *(_QWORD *)v2 = 0xD000000000000015;
  *((_QWORD *)v2 + 1) = 0x80000001A2455110;
  v3 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetKey];
  *(_QWORD *)v3 = 0x676E6168434B456BLL;
  *((_QWORD *)v3 + 1) = 0xEF79654B74655365;
  v4 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKPersistentObjectKey];
  *(_QWORD *)v4 = 0xD000000000000016;
  *((_QWORD *)v4 + 1) = 0x80000001A2455140;
  v5 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKCachedMeltedObjectsKey];
  *(_QWORD *)v5 = 0xD000000000000019;
  *((_QWORD *)v5 + 1) = 0x80000001A2455160;
  v6 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetSingleValueChangesKey];
  *(_QWORD *)v6 = 0xD00000000000001FLL;
  *((_QWORD *)v6 + 1) = 0x80000001A2455180;
  v7 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueAdditionsKey];
  *(_QWORD *)v7 = 0xD000000000000020;
  *((_QWORD *)v7 + 1) = 0x80000001A24551A0;
  v8 = &v0[OBJC_IVAR____TtC8EventKit26EKRemoteUIObjectSerializer_kEKChangeSetMultiValueRemovalsKey];
  *(_QWORD *)v8 = 0xD00000000000001FLL;
  *((_QWORD *)v8 + 1) = 0x80000001A24551D0;
  v10.receiver = v0;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, sel_init);
}

id EKRemoteUIObjectSerializer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

_QWORD *sub_1A241FAE8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A50);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1A242495C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A241FBF4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_1A241FC64(v6, v7, a3);
  v8 = *a1 + 8;
  sub_1A2435AD0();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1A241FC64(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1A241FD34(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1A24247A0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1A24247A0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1A241FD34(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1A2435ADC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1A241FEEC(a5, a6);
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
  v8 = sub_1A2435BA8();
  if (!v8)
  {
    sub_1A2435BE4();
    __break(1u);
LABEL_17:
    result = sub_1A2435C20();
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

uint64_t sub_1A241FEEC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1A241FF80(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1A2420158(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1A2420158(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1A241FF80(uint64_t a1, unint64_t a2)
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
      v3 = sub_1A24200F4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1A2435B9C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1A2435BE4();
      __break(1u);
LABEL_10:
      v2 = sub_1A2435A70();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1A2435C20();
    __break(1u);
LABEL_14:
    result = sub_1A2435BE4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1A24200F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679E8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1A2420158(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679E8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1A2435C20();
  __break(1u);
  return result;
}

double sub_1A24202A4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1A2420AEC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1A24238B4();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1A2424824((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_1A2422BE8(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1A2420394(unint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v17;

  v2 = v1;
  v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_1A2420ABC(a1);
    v13 = v12;
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v9 = *v2;
      v17 = *v2;
      *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_1A2423A98(&qword_1EE667A10);
        v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0)
    v5 = v4;
  else
    v5 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v6 = (id)a1;
  v7 = sub_1A2435BCC();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  v8 = sub_1A2435B18();
  v9 = sub_1A2421DFC(v5, v8);
  swift_retain();
  a1 = sub_1A2420ABC((uint64_t)v6);
  v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  v15 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * a1);
  sub_1A2422DBC(a1, v9);
  *v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1A24204E8(uint64_t a1, void *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t *v4;
  uint64_t *v6;
  uint64_t v9;
  uint64_t v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  v6 = v4;
  v9 = *v4;
  if ((*v4 & 0xC000000000000001) == 0)
    goto LABEL_7;
  if (v9 < 0)
    v11 = *v4;
  else
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
  result = sub_1A2435B18();
  if (!__OFADD__(result, 1))
  {
    *v6 = a4(v11, result + 1);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v6;
    *v6 = 0x8000000000000000;
    sub_1A24233D0(a1, a2, isUniquelyReferenced_nonNull_native, a3);
    *v6 = v14;
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1A242059C(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_1A2435B24();

    if (v9)
    {
      swift_bridgeObjectRelease();

      type metadata accessor for EKRemoteUIPersistentObjectPointer();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v28;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_1A2435B18();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_1A2420D48(v7, result + 1);
    v29 = v21;
    v22 = *(_QWORD *)(v21 + 16);
    if (*(_QWORD *)(v21 + 24) <= v22)
    {
      v26 = v22 + 1;
      v27 = v8;
      sub_1A2421144(v26, &qword_1EE667A40);
      v23 = v29;
    }
    else
    {
      v23 = v21;
      v24 = v8;
    }
    sub_1A24213DC((uint64_t)v8, v23);
    *v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_1A2435AAC();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      type metadata accessor for EKRemoteUIPersistentObjectPointer();
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_1A2435AB8();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_1A2435AB8();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v30 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_1A242145C((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v30;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_1A2420818(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_1A2435B24();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_1A2424D0C(0, &qword_1EE6679B0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v28;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_1A2435B18();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_1A2420F3C(v7, result + 1);
    v29 = v21;
    v22 = *(_QWORD *)(v21 + 16);
    if (*(_QWORD *)(v21 + 24) <= v22)
    {
      v26 = v22 + 1;
      v27 = v8;
      sub_1A2421144(v26, &qword_1EE6679C8);
      v23 = v29;
    }
    else
    {
      v23 = v21;
      v24 = v8;
    }
    sub_1A24213DC((uint64_t)v8, v23);
    *v3 = v23;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_1A2435AAC();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_1A2424D0C(0, &qword_1EE6679B0);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_1A2435AB8();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_1A2435AB8();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v30 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_1A24215EC((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v30;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

unint64_t sub_1A2420ABC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1A2435AAC();
  return sub_1A2420B50(a1, v2);
}

unint64_t sub_1A2420AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A2435C5C();
  sub_1A2435A64();
  v4 = sub_1A2435C68();
  return sub_1A2420C68(a1, a2, v4);
}

unint64_t sub_1A2420B50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_1A2424D0C(0, &qword_1EE667958);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_1A2435AB8();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_1A2435AB8();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_1A2420C68(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1A2435C38() & 1) == 0)
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
      while (!v14 && (sub_1A2435C38() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1A2420D48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A40);
    v2 = sub_1A2435B84();
    v15 = v2;
    sub_1A2435B0C();
    if (sub_1A2435B30())
    {
      type metadata accessor for EKRemoteUIPersistentObjectPointer();
      do
      {
        swift_dynamicCast();
        v2 = v15;
        v9 = *(_QWORD *)(v15 + 16);
        if (*(_QWORD *)(v15 + 24) <= v9)
        {
          sub_1A2421144(v9 + 1, &qword_1EE667A40);
          v2 = v15;
        }
        result = sub_1A2435AAC();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v10 = 0;
          v11 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v11 && (v10 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v12 = v7 == v11;
            if (v7 == v11)
              v7 = 0;
            v10 |= v12;
            v13 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v13 == -1);
          v8 = __clz(__rbit64(~v13)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v14;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_1A2435B30());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E8];
  }
  return v2;
}

uint64_t sub_1A2420F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679C8);
    v2 = sub_1A2435B84();
    v15 = v2;
    sub_1A2435B0C();
    if (sub_1A2435B30())
    {
      sub_1A2424D0C(0, &qword_1EE6679B0);
      do
      {
        swift_dynamicCast();
        v2 = v15;
        v9 = *(_QWORD *)(v15 + 16);
        if (*(_QWORD *)(v15 + 24) <= v9)
        {
          sub_1A2421144(v9 + 1, &qword_1EE6679C8);
          v2 = v15;
        }
        result = sub_1A2435AAC();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v10 = 0;
          v11 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v11 && (v10 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v12 = v7 == v11;
            if (v7 == v11)
              v7 = 0;
            v10 |= v12;
            v13 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v13 == -1);
          v8 = __clz(__rbit64(~v13)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v14;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_1A2435B30());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E8];
  }
  return v2;
}

uint64_t sub_1A2421144(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_1A2435B78();
  v6 = v5;
  if (*(_QWORD *)(v4 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v4 + 32);
    v8 = (_QWORD *)(v4 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v4 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_33;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_33;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_33;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                v3 = v30;
                v29 = 1 << *(_BYTE *)(v4 + 32);
                if (v29 > 63)
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v4 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v11)
                    goto LABEL_33;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v17);
      result = sub_1A2435AAC();
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release();
  *v3 = v6;
  return result;
}

unint64_t sub_1A24213DC(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_1A2435AAC();
  result = sub_1A2435B00();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_1A242145C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  v8 = v6 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1A2421144(v8, &qword_1EE667A40);
  }
  else
  {
    if (v7 > v6)
    {
      sub_1A2421790(&qword_1EE667A40);
      goto LABEL_14;
    }
    sub_1A2421930(v8, &qword_1EE667A40);
  }
  v9 = *v3;
  v10 = sub_1A2435AAC();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    type metadata accessor for EKRemoteUIPersistentObjectPointer();
    v12 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * a2);
    v13 = sub_1A2435AB8();

    if ((v13 & 1) != 0)
    {
LABEL_13:
      sub_1A2435C44();
      __break(1u);
    }
    else
    {
      v14 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v14;
        if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v15 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * a2);
        v16 = sub_1A2435AB8();

        if ((v16 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v17 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v17 + 48) + 8 * a2) = a1;
  v18 = *(_QWORD *)(v17 + 16);
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (v19)
    __break(1u);
  else
    *(_QWORD *)(v17 + 16) = v20;
}

void sub_1A24215EC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  v8 = v6 + 1;
  if ((a3 & 1) != 0)
  {
    sub_1A2421144(v8, &qword_1EE6679C8);
  }
  else
  {
    if (v7 > v6)
    {
      sub_1A2421790(&qword_1EE6679C8);
      goto LABEL_14;
    }
    sub_1A2421930(v8, &qword_1EE6679C8);
  }
  v9 = *v3;
  v10 = sub_1A2435AAC();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_1A2424D0C(0, &qword_1EE6679B0);
    v12 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * a2);
    v13 = sub_1A2435AB8();

    if ((v13 & 1) != 0)
    {
LABEL_13:
      sub_1A2435C44();
      __break(1u);
    }
    else
    {
      v14 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v14;
        if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v15 = *(id *)(*(_QWORD *)(v9 + 48) + 8 * a2);
        v16 = sub_1A2435AB8();

        if ((v16 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v17 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v17 + 48) + 8 * a2) = a1;
  v18 = *(_QWORD *)(v17 + 16);
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (v19)
    __break(1u);
  else
    *(_QWORD *)(v17 + 16) = v20;
}

id sub_1A2421790(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_1A2435B6C();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_28;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v14)
          goto LABEL_28;
        v20 = *(_QWORD *)(v7 + 8 * v10);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    result = v18;
  }
  v21 = v19 + 3;
  if (v21 >= v14)
    goto LABEL_28;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1A2421930(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
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
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_1A2435B78();
  v6 = v5;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_release();
LABEL_35:
    *v3 = v6;
    return result;
  }
  v29 = v2;
  v7 = 1 << *(_BYTE *)(v4 + 32);
  v8 = v4 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v4 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_33;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_33;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    v21 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v17);
    result = sub_1A2435AAC();
    v22 = -1 << *(_BYTE *)(v6 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    result = swift_release_n();
    v3 = v29;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1A2421BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A18);
    v2 = sub_1A2435C08();
    v18 = v2;
    sub_1A2435BB4();
    v3 = sub_1A2435BD8();
    if (v3)
    {
      v4 = v3;
      sub_1A2424D0C(0, &qword_1EE667958);
      do
      {
        swift_dynamicCast();
        sub_1A2424D0C(0, &qword_1EE6679B0);
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_1A2422608(v12 + 1, 1, &qword_1EE667A18);
          v2 = v18;
        }
        result = sub_1A2435AAC();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_1A2435BD8();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E0];
  }
  return v2;
}

uint64_t sub_1A2421DFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A10);
    v2 = sub_1A2435C08();
    v18 = v2;
    sub_1A2435BB4();
    v3 = sub_1A2435BD8();
    if (v3)
    {
      v4 = v3;
      sub_1A2424D0C(0, &qword_1EE667958);
      do
      {
        swift_dynamicCast();
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_1A2422608(v12 + 1, 1, &qword_1EE667A10);
          v2 = v18;
        }
        result = sub_1A2435AAC();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_1A2435BD8();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E0];
  }
  return v2;
}

uint64_t sub_1A2422038(uint64_t a1, char a2)
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
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A48);
  v6 = sub_1A2435BFC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
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
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      swift_bridgeObjectRetain();
    }
    result = sub_1A2435AAC();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1A242230C(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A00);
  v6 = sub_1A2435BFC();
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
        sub_1A2424824(v24, v35);
      }
      else
      {
        sub_1A24247A0((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1A2435C5C();
      sub_1A2435A64();
      result = sub_1A2435C68();
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
      result = (uint64_t)sub_1A2424824(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1A2422608(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v7 = sub_1A2435BFC();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v37 = v3;
  v38 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v22 = v21 | (v15 << 6);
      goto LABEL_31;
    }
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v12)
      break;
    v24 = (_QWORD *)(v6 + 64);
    v25 = *(_QWORD *)(v38 + 8 * v23);
    ++v15;
    if (!v25)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v12)
        goto LABEL_33;
      v25 = *(_QWORD *)(v38 + 8 * v15);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_33:
          swift_release();
          v4 = v37;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v38 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v15 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v15 >= v12)
              goto LABEL_33;
            v25 = *(_QWORD *)(v38 + 8 * v15);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v15 = v26;
      }
    }
LABEL_30:
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_31:
    v31 = 8 * v22;
    v32 = *(void **)(*(_QWORD *)(v6 + 48) + v31);
    v33 = *(void **)(*(_QWORD *)(v6 + 56) + v31);
    if ((a2 & 1) == 0)
    {
      v34 = v32;
      v35 = v33;
    }
    result = sub_1A2435AAC();
    v16 = -1 << *(_BYTE *)(v8 + 32);
    v17 = result & ~v16;
    v18 = v17 >> 6;
    if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v18 == v28;
        if (v18 == v28)
          v18 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v13 + 8 * v18);
      }
      while (v30 == -1);
      v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }
    *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    v20 = 8 * v19;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + v20) = v32;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v20) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v4 = v37;
  v24 = (_QWORD *)(v6 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v36 = 1 << *(_BYTE *)(v6 + 32);
  if (v36 >= 64)
    bzero(v24, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v36;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_1A24228D4(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679D0);
  v36 = a2;
  v6 = sub_1A2435BFC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1A2435C5C();
    sub_1A2435A64();
    result = sub_1A2435C68();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_1A2422BE8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1A2435AF4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1A2435C5C();
        swift_bridgeObjectRetain();
        sub_1A2435A64();
        v10 = sub_1A2435C68();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_1A2422DBC(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = sub_1A2435AF4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v11 = sub_1A2435AAC();

        v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(a2 + 48);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1)
              *v16 = *v17;
            v18 = *(_QWORD *)(a2 + 56);
            v19 = (_QWORD *)(v18 + 8 * v3);
            v20 = (_QWORD *)(v18 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v19 >= v20 + 1))
            {
              *v19 = *v20;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v23 = *v21;
    v22 = (-1 << a1) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

unint64_t sub_1A2422F6C(unint64_t result, uint64_t a2)
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
    result = sub_1A2435AF4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1A2435C5C();
        swift_bridgeObjectRetain();
        sub_1A2435A64();
        v9 = sub_1A2435C68();
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

id sub_1A2423140(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_1A2420ABC((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_1A242370C();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];
      result = (id)swift_bridgeObjectRelease();
      *(_QWORD *)(v16 + 8 * v9) = a1;
      return result;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v20 = 8 * v9;
    *(_QWORD *)(v15[6] + v20) = a2;
    *(_QWORD *)(v15[7] + v20) = a1;
    v21 = v15[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v15[2] = v23;
      return a2;
    }
    goto LABEL_14;
  }
  sub_1A2422038(v12, a3 & 1);
  v18 = sub_1A2420ABC((uint64_t)a2);
  if ((v13 & 1) == (v19 & 1))
  {
    v9 = v18;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_1A2424D0C(0, &qword_1EE667958);
  result = (id)sub_1A2435C50();
  __break(1u);
  return result;
}

_OWORD *sub_1A24232A0(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_1A2420AEC(a2, a3);
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
        return sub_1A2424824(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1A24238B4();
      goto LABEL_7;
    }
    sub_1A242230C(v15, a4 & 1);
    v21 = sub_1A2420AEC(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1A24236A4(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_1A2435C50();
  __break(1u);
  return result;
}

void sub_1A24233D0(uint64_t a1, void *a2, char a3, uint64_t *a4)
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  id v25;

  v6 = v4;
  v9 = *v4;
  v11 = sub_1A2420ABC((uint64_t)a2);
  v12 = *(_QWORD *)(v9 + 16);
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v15 = v10;
  v16 = *(_QWORD *)(v9 + 24);
  if (v16 >= v14 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v16 >= v14 && (a3 & 1) == 0)
  {
    sub_1A2423A98(a4);
LABEL_7:
    v17 = (_QWORD *)*v6;
    if ((v15 & 1) != 0)
    {
LABEL_8:
      v18 = v17[7];

      *(_QWORD *)(v18 + 8 * v11) = a1;
      return;
    }
LABEL_11:
    v17[(v11 >> 6) + 8] |= 1 << v11;
    v21 = 8 * v11;
    *(_QWORD *)(v17[6] + v21) = a2;
    *(_QWORD *)(v17[7] + v21) = a1;
    v22 = v17[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v17[2] = v24;
      v25 = a2;
      return;
    }
    goto LABEL_14;
  }
  sub_1A2422608(v14, a3 & 1, a4);
  v19 = sub_1A2420ABC((uint64_t)a2);
  if ((v15 & 1) == (v20 & 1))
  {
    v11 = v19;
    v17 = (_QWORD *)*v6;
    if ((v15 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_1A2424D0C(0, &qword_1EE667958);
  sub_1A2435C50();
  __break(1u);
}

uint64_t sub_1A2423548(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1A2420AEC(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1A2423C34();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1A24228D4(v15, a4 & 1);
  v21 = sub_1A2420AEC(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1A2435C50();
  __break(1u);
  return result;
}

_OWORD *sub_1A24236A4(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_1A2424824(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_1A242370C()
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
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A48);
  v2 = *v0;
  v3 = sub_1A2435BF0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1A24238B4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667A00);
  v2 = *v0;
  v3 = sub_1A2435BF0();
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
    sub_1A24247A0(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_1A2424824(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

id sub_1A2423A98(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_1A2435BF0();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v21 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v14)
      goto LABEL_26;
    v22 = *(_QWORD *)(v7 + 8 * v21);
    ++v10;
    if (!v22)
    {
      v10 = v21 + 1;
      if (v21 + 1 >= v14)
        goto LABEL_26;
      v22 = *(_QWORD *)(v7 + 8 * v10);
      if (!v22)
        break;
    }
LABEL_25:
    v13 = (v22 - 1) & v22;
    v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    v19 = *(void **)(*(_QWORD *)(v3 + 56) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v17) = v19;
    v20 = v18;
    result = v19;
  }
  v23 = v21 + 2;
  if (v23 >= v14)
    goto LABEL_26;
  v22 = *(_QWORD *)(v7 + 8 * v23);
  if (v22)
  {
    v10 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v22 = *(_QWORD *)(v7 + 8 * v10);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1A2423C34()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679D0);
  v2 = *v0;
  v3 = sub_1A2435BF0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
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
      goto LABEL_28;
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
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1A2423DE8(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  unint64_t v45;
  unint64_t v46;
  int64_t v47;
  unint64_t v48;
  int64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char v54;
  unint64_t v55;
  BOOL v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  int64_t v73;
  unint64_t v74;
  int64_t i;
  uint64_t v76;
  uint64_t v77;
  int64_t v78;
  int64_t v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;

  v4 = v3;
  v5 = a3;
  v6 = result;
  v7 = *(_QWORD *)v4;
  if (*(_QWORD *)(*(_QWORD *)v4 + 24) > *(_QWORD *)(*(_QWORD *)v4 + 16))
  {
    if ((a3 & 1) != 0)
      goto LABEL_87;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679D8);
    v9 = sub_1A2435B6C();
    v5 = v9;
    if (*(_QWORD *)(v7 + 16))
    {
      v10 = (void *)(v9 + 56);
      v11 = v7 + 56;
      v12 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
      if (v5 != v7 || (unint64_t)v10 >= v11 + 8 * v12)
        memmove(v10, (const void *)(v7 + 56), 8 * v12);
      v13 = 0;
      *(_QWORD *)(v5 + 16) = *(_QWORD *)(v7 + 16);
      v14 = 1 << *(_BYTE *)(v7 + 32);
      v15 = -1;
      if (v14 < 64)
        v15 = ~(-1 << v14);
      v16 = v15 & *(_QWORD *)(v7 + 56);
      v17 = (unint64_t)(v14 + 63) >> 6;
      while (1)
      {
        if (v16)
        {
LABEL_90:
          v67 = __clz(__rbit64(v16));
          v16 &= v16 - 1;
          v68 = v67 | (v13 << 6);
        }
        else
        {
          v73 = v13 + 1;
          if (__OFADD__(v13, 1))
            goto LABEL_114;
          if (v73 >= v17)
            break;
          v74 = *(_QWORD *)(v11 + 8 * v73);
          ++v13;
          if (!v74)
          {
            v13 = v73 + 1;
            if (v73 + 1 >= v17)
              break;
            v74 = *(_QWORD *)(v11 + 8 * v13);
            if (!v74)
            {
              v13 = v73 + 2;
              if (v73 + 2 >= v17)
                break;
              v74 = *(_QWORD *)(v11 + 8 * v13);
              if (!v74)
              {
                v13 = v73 + 3;
                if (v73 + 3 >= v17)
                  break;
                v74 = *(_QWORD *)(v11 + 8 * v13);
                if (!v74)
                {
                  v13 = v73 + 4;
                  if (v73 + 4 >= v17)
                    break;
                  v74 = *(_QWORD *)(v11 + 8 * v13);
                  for (i = v73 + 4; !v74; ++i)
                  {
                    v13 = i + 1;
                    if (__OFADD__(i, 1))
                      goto LABEL_115;
                    if (v13 >= v17)
                      goto LABEL_111;
                    v74 = *(_QWORD *)(v11 + 8 * v13);
                  }
                }
              }
            }
          }
          v16 = (v74 - 1) & v74;
          v68 = __clz(__rbit64(v74)) + (v13 << 6);
        }
        v69 = 40 * v68;
        sub_1A2424D68(*(_QWORD *)(v7 + 48) + 40 * v68, (uint64_t)&v80);
        v70 = *(_QWORD *)(v5 + 48) + v69;
        v71 = v80;
        v72 = v81;
        *(_QWORD *)(v70 + 32) = v82;
        *(_OWORD *)v70 = v71;
        *(_OWORD *)(v70 + 16) = v72;
      }
    }
LABEL_111:
    while (1)
    {
      result = swift_release();
      *(_QWORD *)v4 = v5;
LABEL_87:
      v61 = *(_QWORD *)v4;
      *(_QWORD *)(*(_QWORD *)v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      v62 = *(_QWORD *)(v61 + 48) + 40 * a2;
      v63 = *(_OWORD *)(v6 + 16);
      *(_OWORD *)v62 = *(_OWORD *)v6;
      *(_OWORD *)(v62 + 16) = v63;
      *(_QWORD *)(v62 + 32) = *(_QWORD *)(v6 + 32);
      v64 = *(_QWORD *)(v61 + 16);
      v65 = __OFADD__(v64, 1);
      v66 = v64 + 1;
      if (!v65)
        break;
LABEL_110:
      __break(1u);
    }
    *(_QWORD *)(v61 + 16) = v66;
    return result;
  }
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679D8);
  if ((v5 & 1) == 0)
  {
    v5 = v18;
    v38 = sub_1A2435B78();
    v11 = v38;
    if (*(_QWORD *)(v7 + 16))
    {
      v77 = v4;
      v79 = v6;
      v39 = 1 << *(_BYTE *)(v7 + 32);
      v16 = v7 + 56;
      if (v39 < 64)
        v40 = ~(-1 << v39);
      else
        v40 = -1;
      a2 = v40 & *(_QWORD *)(v7 + 56);
      v6 = (unint64_t)(v39 + 63) >> 6;
      v4 = v38 + 56;
      swift_retain();
      v17 = 0;
      v13 = 40;
      while (1)
      {
        if (a2)
        {
          v45 = __clz(__rbit64(a2));
          a2 &= a2 - 1;
          v46 = v45 | (v17 << 6);
        }
        else
        {
          v47 = v17 + 1;
          if (__OFADD__(v17, 1))
            goto LABEL_109;
          if (v47 >= v6)
            goto LABEL_79;
          v48 = *(_QWORD *)(v16 + 8 * v47);
          ++v17;
          if (!v48)
          {
            v17 = v47 + 1;
            if (v47 + 1 >= v6)
              goto LABEL_79;
            v48 = *(_QWORD *)(v16 + 8 * v17);
            if (!v48)
            {
              v17 = v47 + 2;
              if (v47 + 2 >= v6)
                goto LABEL_79;
              v48 = *(_QWORD *)(v16 + 8 * v17);
              if (!v48)
              {
                v17 = v47 + 3;
                if (v47 + 3 >= v6)
                  goto LABEL_79;
                v48 = *(_QWORD *)(v16 + 8 * v17);
                if (!v48)
                {
                  v17 = v47 + 4;
                  if (v47 + 4 >= v6)
                    goto LABEL_79;
                  v48 = *(_QWORD *)(v16 + 8 * v17);
                  v49 = v47 + 4;
                  if (!v48)
                  {
                    while (1)
                    {
                      v17 = v49 + 1;
                      if (__OFADD__(v49, 1))
                        goto LABEL_113;
                      if (v17 >= v6)
                        break;
                      v48 = *(_QWORD *)(v16 + 8 * v17);
                      ++v49;
                      if (v48)
                        goto LABEL_67;
                    }
LABEL_79:
                    swift_release_n();
                    v4 = v77;
                    v6 = v79;
LABEL_83:
                    *(_QWORD *)v4 = v11;
                    v5 = v6;
                    result = sub_1A2435B3C();
                    v59 = -1 << *(_BYTE *)(v11 + 32);
                    a2 = result & ~v59;
                    if (((*(_QWORD *)(v11 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
                      goto LABEL_87;
                    v60 = ~v59;
                    while (1)
                    {
                      sub_1A2424D68(*(_QWORD *)(v11 + 48) + 40 * a2, (uint64_t)&v80);
                      v5 = MEMORY[0x1A8583FA8](&v80, v6);
                      result = sub_1A2424DA4((uint64_t)&v80);
                      if ((v5 & 1) != 0)
                        goto LABEL_116;
                      a2 = (a2 + 1) & v60;
                      if (((*(_QWORD *)(v11 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
                        goto LABEL_87;
                    }
                  }
                }
              }
            }
          }
LABEL_67:
          a2 = (v48 - 1) & v48;
          v46 = __clz(__rbit64(v48)) + (v17 << 6);
        }
        sub_1A2424D68(*(_QWORD *)(v7 + 48) + 40 * v46, (uint64_t)&v80);
        v5 = (uint64_t)&v80;
        v50 = sub_1A2435B3C();
        v51 = -1 << *(_BYTE *)(v11 + 32);
        v52 = v50 & ~v51;
        v53 = v52 >> 6;
        if (((-1 << v52) & ~*(_QWORD *)(v4 + 8 * (v52 >> 6))) != 0)
        {
          v41 = __clz(__rbit64((-1 << v52) & ~*(_QWORD *)(v4 + 8 * (v52 >> 6)))) | v52 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v54 = 0;
          v55 = (unint64_t)(63 - v51) >> 6;
          do
          {
            if (++v53 == v55 && (v54 & 1) != 0)
              goto LABEL_89;
            v56 = v53 == v55;
            if (v53 == v55)
              v53 = 0;
            v54 |= v56;
            v57 = *(_QWORD *)(v4 + 8 * v53);
          }
          while (v57 == -1);
          v41 = __clz(__rbit64(~v57)) + (v53 << 6);
        }
        *(_QWORD *)(v4 + ((v41 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v41;
        v42 = *(_QWORD *)(v11 + 48) + 40 * v41;
        v43 = v80;
        v44 = v81;
        *(_QWORD *)(v42 + 32) = v82;
        *(_OWORD *)v42 = v43;
        *(_OWORD *)(v42 + 16) = v44;
        ++*(_QWORD *)(v11 + 16);
      }
    }
LABEL_82:
    swift_release();
    goto LABEL_83;
  }
  v5 = v18;
  v19 = sub_1A2435B78();
  v11 = v19;
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_82;
  v76 = v4;
  v78 = v6;
  v20 = 1 << *(_BYTE *)(v7 + 32);
  a2 = v7 + 56;
  if (v20 < 64)
    v21 = ~(-1 << v20);
  else
    v21 = -1;
  v16 = v21 & *(_QWORD *)(v7 + 56);
  v6 = (unint64_t)(v20 + 63) >> 6;
  v4 = v19 + 56;
  swift_retain();
  v17 = 0;
  v13 = 40;
  while (v16)
  {
    v24 = __clz(__rbit64(v16));
    v16 &= v16 - 1;
    v25 = v24 | (v17 << 6);
LABEL_35:
    v29 = *(_QWORD *)(v7 + 48) + 40 * v25;
    v80 = *(_OWORD *)v29;
    v81 = *(_OWORD *)(v29 + 16);
    v82 = *(_QWORD *)(v29 + 32);
    v5 = (uint64_t)&v80;
    v30 = sub_1A2435B3C();
    v31 = -1 << *(_BYTE *)(v11 + 32);
    v32 = v30 & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v4 + 8 * (v32 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v4 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_17;
    }
    v34 = 0;
    v35 = (unint64_t)(63 - v31) >> 6;
    do
    {
      if (++v33 == v35 && (v34 & 1) != 0)
      {
        __break(1u);
LABEL_89:
        __break(1u);
        goto LABEL_90;
      }
      v36 = v33 == v35;
      if (v33 == v35)
        v33 = 0;
      v34 |= v36;
      v37 = *(_QWORD *)(v4 + 8 * v33);
    }
    while (v37 == -1);
    v22 = __clz(__rbit64(~v37)) + (v33 << 6);
LABEL_17:
    *(_QWORD *)(v4 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    v23 = *(_QWORD *)(v11 + 48) + 40 * v22;
    *(_OWORD *)v23 = v80;
    *(_OWORD *)(v23 + 16) = v81;
    *(_QWORD *)(v23 + 32) = v82;
    ++*(_QWORD *)(v11 + 16);
  }
  v26 = v17 + 1;
  if (__OFADD__(v17, 1))
  {
    __break(1u);
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  if (v26 >= v6)
    goto LABEL_77;
  v27 = *(_QWORD *)(a2 + 8 * v26);
  ++v17;
  if (v27)
    goto LABEL_34;
  v17 = v26 + 1;
  if (v26 + 1 >= v6)
    goto LABEL_77;
  v27 = *(_QWORD *)(a2 + 8 * v17);
  if (v27)
    goto LABEL_34;
  v17 = v26 + 2;
  if (v26 + 2 >= v6)
    goto LABEL_77;
  v27 = *(_QWORD *)(a2 + 8 * v17);
  if (v27)
    goto LABEL_34;
  v17 = v26 + 3;
  if (v26 + 3 >= v6)
    goto LABEL_77;
  v27 = *(_QWORD *)(a2 + 8 * v17);
  if (v27)
  {
LABEL_34:
    v16 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v17 << 6);
    goto LABEL_35;
  }
  v17 = v26 + 4;
  if (v26 + 4 >= v6)
  {
LABEL_77:
    swift_release();
    v58 = 1 << *(_BYTE *)(v7 + 32);
    v4 = v76;
    v6 = v78;
    if (v58 >= 64)
      bzero((void *)(v7 + 56), ((unint64_t)(v58 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *(_QWORD *)a2 = -1 << v58;
    *(_QWORD *)(v7 + 16) = 0;
    goto LABEL_82;
  }
  v27 = *(_QWORD *)(a2 + 8 * v17);
  v28 = v26 + 4;
  if (v27)
    goto LABEL_34;
  while (1)
  {
    v17 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v17 >= v6)
      goto LABEL_77;
    v27 = *(_QWORD *)(a2 + 8 * v17);
    ++v28;
    if (v27)
      goto LABEL_34;
  }
  __break(1u);
LABEL_113:
  __break(1u);
LABEL_114:
  __break(1u);
LABEL_115:
  __break(1u);
LABEL_116:
  result = sub_1A2435C44();
  __break(1u);
  return result;
}

void sub_1A2424590(void *a1)
{
  void *v1;
  _BYTE *v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  objc_super v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v3 = v1;
  v4 = (void *)sub_1A2435A4C();
  v5 = objc_msgSend(a1, sel_decodeObjectForKey_, v4);

  if (v5)
  {
    sub_1A2435AE8();
    swift_unknownObjectRelease();
    sub_1A2424824(&v10, &v11);
    sub_1A2424D0C(0, &qword_1EE667958);
    swift_dynamicCast();
    *(_QWORD *)&v3[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_objectID] = v9;
    v6 = (void *)sub_1A2435A4C();
    v7 = objc_msgSend(a1, sel_decodeBoolForKey_, v6);

    v3[OBJC_IVAR____TtC8EventKit33EKRemoteUIPersistentObjectPointer_isPendingInsert] = v7;
    v8.receiver = v3;
    v8.super_class = (Class)type metadata accessor for EKRemoteUIPersistentObjectPointer();
    objc_msgSendSuper2(&v8, sel_init);
  }
  else
  {
    __break(1u);
  }
}

uint64_t method lookup function for EKRemoteUISerializedObject()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EKRemoteUISerializedObject.__allocating_init(serializedObjectIDDictionary:objectIDToChangeSetDictionaryMap:objectIDToPersistentDictionaryMap:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for EKRemoteUIDeserializedObject()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EKRemoteUIDeserializedObject.__allocating_init(deserializedObject:tempObjectIDMap:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t method lookup function for EKRemoteUIPersistentObjectPointer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EKRemoteUIPersistentObjectPointer.__allocating_init(objectID:isPendingInsert:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of EKRemoteUIPersistentObjectPointer.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of EKRemoteUIPersistentObjectPointer.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t type metadata accessor for EKRemoteUIObjectSerializer()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A8584D10]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1A24247A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1A24247DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667978);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1A2424824(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

uint64_t sub_1A2424854()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A2424878()
{
  return swift_deallocObject();
}

_BYTE **sub_1A2424888(_BYTE **result)
{
  uint64_t v1;
  _BYTE *v2;

  v2 = *result;
  *v2 = *(_BYTE *)(v1 + 16);
  *result = v2 + 1;
  return result;
}

uint64_t sub_1A242489C()
{
  return swift_deallocObject();
}

uint64_t sub_1A24248AC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A24248D0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1A24248F0(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1A241FBF4(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_1A24248F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE6679A8;
  if (!qword_1EE6679A8)
  {
    v1 = type metadata accessor for EKRemoteUIPersistentObjectPointer();
    result = MEMORY[0x1A8584D1C](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EE6679A8);
  }
  return result;
}

uint64_t sub_1A242493C()
{
  return swift_deallocObject();
}

uint64_t sub_1A242494C()
{
  return swift_deallocObject();
}

uint64_t sub_1A242495C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE667960);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1A2435C20();
  __break(1u);
  return result;
}

id sub_1A2424A64(void *a1, void *a2, uint64_t a3)
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  id v16;

  if (objc_msgSend(a1, sel_entityType) != (id)1 || !objc_msgSend(a1, sel_isVirtual))
  {
    v9 = a1;
    v8 = sub_1A241DC2C(v9, a3);

    if (v8)
      return v8;
    if (!objc_msgSend(v9, sel_isTemporary))
      return objc_msgSend(a2, sel_registerFetchedObjectWithID_, v9);
    if (qword_1EE6678D0 != -1)
      swift_once();
    v10 = sub_1A2435A1C();
    __swift_project_value_buffer(v10, (uint64_t)qword_1EE667E88);
    v11 = v9;
    v12 = sub_1A2435A04();
    v13 = sub_1A2435A94();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v14 = 138412290;
      v16 = v11;
      sub_1A2435AD0();
      *v15 = v11;

      _os_log_impl(&dword_1A2318000, v12, v13, "EKRemoteUIObjectSerializer: Attempting to fetch from the eventStore using a temporary objectID: %@", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE6679C0);
      swift_arrayDestroy();
      MEMORY[0x1A8584D7C](v15, -1, -1);
      MEMORY[0x1A8584D7C](v14, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v6 = objc_msgSend(a2, sel_defaultCalendarForNewEvents);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = objc_msgSend(v6, sel_persistentObject);

  return v8;
}

uint64_t sub_1A2424CC0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_1A2424D0C(255, a2);
    result = MEMORY[0x1A8584D1C](MEMORY[0x1E0DEFCF8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A2424D04()
{
  return swift_release();
}

uint64_t sub_1A2424D0C(uint64_t a1, unint64_t *a2)
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

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1A2424D68(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1A2424DA4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1A2424DD8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A2424E04()
{
  return swift_deallocObject();
}

uint64_t sub_1A2424E14()
{
  return swift_deallocObject();
}

uint64_t sub_1A2424E24()
{
  return swift_deallocObject();
}

uint64_t sub_1A2424E34()
{
  return swift_deallocObject();
}

uint64_t sub_1A2424E44(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1A2424E80(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void __getREMListClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMListClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKFrozenReminderCalendar.m"), 24, CFSTR("Unable to find class %s"), "REMList");

  __break(1u);
}

void ReminderKitLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ReminderKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKFrozenReminderCalendar.m"), 23, CFSTR("%s"), *a1);

  __break(1u);
}

void __getREMColorClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMColorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKFrozenReminderCalendar.m"), 25, CFSTR("Unable to find class %s"), "REMColor");

  __break(1u);
}

void __getREMReminderClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMReminderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKFrozenReminderReminder.m"), 22, CFSTR("Unable to find class %s"), "REMReminder");

  __break(1u);
}

void ReminderKitLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ReminderKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKFrozenReminderReminder.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getREMUserActivityClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMUserActivityClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKFrozenReminderReminder.m"), 23, CFSTR("Unable to find class %s"), "REMUserActivity");

  __break(1u);
}

void __getREMReminderChangeItemClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMReminderChangeItemClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKFrozenReminderReminder.m"), 24, CFSTR("Unable to find class %s"), "REMReminderChangeItem");

  __break(1u);
}

void __getREMStoreClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKReminderStore.m"), 40, CFSTR("Unable to find class %s"), "REMStore");

  __break(1u);
}

void ReminderKitLibrary_cold_1_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ReminderKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKReminderStore.m"), 39, CFSTR("%s"), *a1);

  __break(1u);
}

void __getREMListClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMListClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKReminderStore.m"), 42, CFSTR("Unable to find class %s"), "REMList");

  __break(1u);
}

void __getREMReminderClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMReminderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKReminderStore.m"), 44, CFSTR("Unable to find class %s"), "REMReminder");

  __break(1u);
}

void __getREMSaveRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMSaveRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKReminderStore.m"), 43, CFSTR("Unable to find class %s"), "REMSaveRequest");

  __break(1u);
}

void __getREMAccountClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMAccountClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKReminderStore.m"), 41, CFSTR("Unable to find class %s"), "REMAccount");

  __break(1u);
}

void __getREMAlarmClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMAlarmClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKReminderStore.m"), 45, CFSTR("Unable to find class %s"), "REMAlarm");

  __break(1u);
}

void __getREMRecurrenceRuleClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMRecurrenceRuleClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKReminderStore.m"), 46, CFSTR("Unable to find class %s"), "REMRecurrenceRule");

  __break(1u);
}

void __getREMStructuredLocationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMStructuredLocationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKReminderStore.m"), 47, CFSTR("Unable to find class %s"), "REMStructuredLocation");

  __break(1u);
}

void __getCNAutocompleteStoreClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCNAutocompleteStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKAutocompleter.m"), 42, CFSTR("Unable to find class %s"), "CNAutocompleteStore");

  __break(1u);
}

void ContactsAutocompleteLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ContactsAutocompleteLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKAutocompleter.m"), 41, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCNAutocompleteFetchRequestClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCNAutocompleteFetchRequestClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKAutocompleter.m"), 43, CFSTR("Unable to find class %s"), "CNAutocompleteFetchRequest");

  __break(1u);
}

void __getCNAutocompleteNameComponentsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCNAutocompleteNameComponentsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKAutocompleter.m"), 45, CFSTR("Unable to find class %s"), "CNAutocompleteNameComponents");

  __break(1u);
}

void __getCNAutocompleteResultClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCNAutocompleteResultClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKAutocompleter.m"), 44, CFSTR("Unable to find class %s"), "CNAutocompleteResult");

  __break(1u);
}

void __getREMStructuredLocationClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ReminderKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKFrozenReminderStructuredLocation.m"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void __getREMStructuredLocationClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMStructuredLocationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKFrozenReminderStructuredLocation.m"), 23, CFSTR("Unable to find class %s"), "REMStructuredLocation");

  __break(1u);
}

void __getREMRecurrenceEndClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMRecurrenceEndClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKFrozenReminderRecurrenceRule.m"), 20, CFSTR("Unable to find class %s"), "REMRecurrenceEnd");

  __break(1u);
}

void ReminderKitLibrary_cold_1_2(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ReminderKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKFrozenReminderRecurrenceRule.m"), 18, CFSTR("%s"), *a1);

  __break(1u);
}

void __getREMRecurrenceRuleClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMRecurrenceRuleClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKFrozenReminderRecurrenceRule.m"), 19, CFSTR("Unable to find class %s"), "REMRecurrenceRule");

  __break(1u);
}

void __getREMRecurrenceDayOfWeekClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMRecurrenceDayOfWeekClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKFrozenReminderRecurrenceRule.m"), 21, CFSTR("Unable to find class %s"), "REMRecurrenceDayOfWeek");

  __break(1u);
}

void EKObjectIDFromDictionary_cold_1(int *a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Could not convert dictionary into EKObjectID. entityType = %d, rowID = %d", (uint8_t *)v5, 0xEu);
}

void EKObjectIDFromDictionary_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Could not convert dictionary into EKObjectID. Keys were missing.", v1, 2u);
}

void __getREMReminderClass_block_invoke_cold_1_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ReminderKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKEvent.m"), 95, CFSTR("%s"), *a1);

  __break(1u);
}

void __getREMReminderClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMReminderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKEvent.m"), 96, CFSTR("Unable to find class %s"), "REMReminder");

  __break(1u);
}

void __getkSuggestionsEKEventAvailabilityStateSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreSuggestionsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKEvent.m"), 109, CFSTR("%s"), *a1);

  __break(1u);
}

void __getREMAlarmTimeIntervalTriggerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMAlarmTimeIntervalTriggerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKFrozenReminderAlarm.m"), 22, CFSTR("Unable to find class %s"), "REMAlarmTimeIntervalTrigger");

  __break(1u);
}

void ReminderKitLibrary_cold_1_3(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ReminderKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("EKFrozenReminderAlarm.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getREMAlarmDateTriggerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMAlarmDateTriggerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKFrozenReminderAlarm.m"), 23, CFSTR("Unable to find class %s"), "REMAlarmDateTrigger");

  __break(1u);
}

void __getREMAlarmLocationTriggerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getREMAlarmLocationTriggerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("EKFrozenReminderAlarm.m"), 24, CFSTR("Unable to find class %s"), "REMAlarmLocationTrigger");

  __break(1u);
}

void EKUtils_AdjustedAttendeeAddress_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "No 'address' given.  Will not create an adjusted address.", v1, 2u);
}

void EKUIAttendeeUtils_AttendeeHasResponded_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "EKUIAttendeeUtils_AttendeeHasResponded";
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "'nil' participant given to function: [%s].  Will not compute needs response state.", (uint8_t *)&v1, 0xCu);
}

uint64_t sub_1A24359E0()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1A24359EC()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1A24359F8()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1A2435A04()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1A2435A10()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1A2435A1C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1A2435A28()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1A2435A34()
{
  return MEMORY[0x1E0CB17F8]();
}

uint64_t sub_1A2435A40()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1A2435A4C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A2435A58()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A2435A64()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1A2435A70()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1A2435A7C()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1A2435A88()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1A2435A94()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1A2435AA0()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1A2435AAC()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1A2435AB8()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1A2435AC4()
{
  return MEMORY[0x1E0DEBC00]();
}

uint64_t sub_1A2435AD0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1A2435ADC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1A2435AE8()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1A2435AF4()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1A2435B00()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1A2435B0C()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1A2435B18()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1A2435B24()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1A2435B30()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1A2435B3C()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1A2435B48()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1A2435B54()
{
  return MEMORY[0x1E0DEC180]();
}

uint64_t sub_1A2435B60()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1A2435B6C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1A2435B78()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1A2435B84()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1A2435B90()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1A2435B9C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1A2435BA8()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1A2435BB4()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1A2435BC0()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1A2435BCC()
{
  return MEMORY[0x1E0DECBA8]();
}

uint64_t sub_1A2435BD8()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1A2435BE4()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1A2435BF0()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1A2435BFC()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1A2435C08()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_1A2435C14()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1A2435C20()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1A2435C2C()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1A2435C38()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A2435C44()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1A2435C50()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1A2435C5C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A2435C68()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t CADEKPersistentEventDefaultPropertiesToLoad()
{
  return MEMORY[0x1E0D0A000]();
}

uint64_t CADEventAccessTypeFromAuthStatus()
{
  return MEMORY[0x1E0D0A008]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BC80](color);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1E0C9BCD8](color1, color2);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x1E0C9E300]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CalAbsoluteTimeGetAbsoluteTimeInTimeZone()
{
  return MEMORY[0x1E0D0BF60]();
}

uint64_t CalAbsoluteTimeGetGregorianDate()
{
  return MEMORY[0x1E0D0BF78]();
}

uint64_t CalAbsoluteTimeGetGregorianDateWithFallbackToDefaultTimeZone()
{
  return MEMORY[0x1E0D0BF88]();
}

uint64_t CalAlertInviteeDeclines()
{
  return MEMORY[0x1E0D0A1E8]();
}

uint64_t CalAnalyticsSendEvent()
{
  return MEMORY[0x1E0D0BFB8]();
}

uint64_t CalAnalyticsTimeIntervalFromMachTimes()
{
  return MEMORY[0x1E0D0BFC8]();
}

uint64_t CalBooleanAsString()
{
  return MEMORY[0x1E0D0BFD8]();
}

uint64_t CalColorStringRepresentation()
{
  return MEMORY[0x1E0D0BFE8]();
}

uint64_t CalCopyTimeZone()
{
  return MEMORY[0x1E0D0C010]();
}

uint64_t CalCreateDateTimeFromICSDate()
{
  return MEMORY[0x1E0D0A4E8]();
}

uint64_t CalDatabaseSizeInBytes()
{
  return MEMORY[0x1E0D0A970]();
}

uint64_t CalDateTimeRelease()
{
  return MEMORY[0x1E0D0C028]();
}

uint64_t CalEntityTypeGetName()
{
  return MEMORY[0x1E0D0A9B0]();
}

uint64_t CalEqualObjects()
{
  return MEMORY[0x1E0D0C0C0]();
}

uint64_t CalEqualStrings()
{
  return MEMORY[0x1E0D0C0C8]();
}

uint64_t CalEventOccurrenceCacheCopyBoundsForTimeZone()
{
  return MEMORY[0x1E0D0AB70]();
}

uint64_t CalEventOccurrenceCacheGetIdealRangeAndTimeZone()
{
  return MEMORY[0x1E0D0ABB0]();
}

uint64_t CalGenerateQualifiedIdentifierWithClassAndSubdomain()
{
  return MEMORY[0x1E0D0C0D0]();
}

uint64_t CalGetEntityIDFromFetchedObjectDictonary()
{
  return MEMORY[0x1E0D0A018]();
}

uint64_t CalGetRecurrenceUIDFromRealUID()
{
  return MEMORY[0x1E0D0AC80]();
}

uint64_t CalGetValuesFromFetchedObjectDictionary()
{
  return MEMORY[0x1E0D0A020]();
}

uint64_t CalGregorianDateGetAbsoluteTimeWithFallbackToDefaultTimeZone()
{
  return MEMORY[0x1E0D0C100]();
}

uint64_t CalGregorianDateGetGregorianDateForDay()
{
  return MEMORY[0x1E0D0C110]();
}

uint64_t CalIsReminderBridgeEnabled()
{
  return MEMORY[0x1E0D0C130]();
}

uint64_t CalMonotonicTime()
{
  return MEMORY[0x1E0D0C148]();
}

uint64_t CalRecurrenceFrequencyFromICSFrequency()
{
  return MEMORY[0x1E0D0ADA0]();
}

uint64_t CalRequestAuthorizationForServiceWithCompletion()
{
  return MEMORY[0x1E0D0A028]();
}

uint64_t CalShowCompletedReminders()
{
  return MEMORY[0x1E0D0AE78]();
}

uint64_t CalShowDeclinedEvents()
{
  return MEMORY[0x1E0D0AE80]();
}

uint64_t CalTemporaryDirectory()
{
  return MEMORY[0x1E0D0C190]();
}

uint64_t CalTimeZoneCopyCFTimeZone()
{
  return MEMORY[0x1E0D0C198]();
}

uint64_t CalendarFoundationPerformBlockOnSharedContactStore()
{
  return MEMORY[0x1E0D0C1A0]();
}

uint64_t DDResultCopyExtractedDateFromReferenceDate()
{
  return MEMORY[0x1E0D1CC10]();
}

uint64_t DDResultCopyExtractedStartDateEndDate()
{
  return MEMORY[0x1E0D1CC20]();
}

uint64_t DDResultGetRange()
{
  return MEMORY[0x1E0D1CCD0]();
}

uint64_t DDResultGetSubResults()
{
  return MEMORY[0x1E0D1CCF0]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x1E0D1CD00]();
}

uint64_t DDResultIsPastDate()
{
  return MEMORY[0x1E0D1CD28]();
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return MEMORY[0x1E0D1CDA8]();
}

uint64_t DDScannerCreate()
{
  return MEMORY[0x1E0D1CDB0]();
}

uint64_t DDScannerScanString()
{
  return MEMORY[0x1E0D1CDE8]();
}

uint64_t DisplayNameStringForIdentityWithProperties()
{
  return MEMORY[0x1E0D0C1B8]();
}

uint64_t EKCachedTimeZoneWithName()
{
  return MEMORY[0x1E0D0C1C0]();
}

uint64_t EKDateComponentsGetDate()
{
  return MEMORY[0x1E0D0C1C8]();
}

uint64_t EKGetDefaultCalendarColors()
{
  return MEMORY[0x1E0D0C1E0]();
}

uint64_t EKSymbolicColorToRGBMapping()
{
  return MEMORY[0x1E0D0C208]();
}

uint64_t EKWeakLinkClass()
{
  return MEMORY[0x1E0D0C210]();
}

uint64_t EKWeakLinkStringConstant()
{
  return MEMORY[0x1E0D0C218]();
}

uint64_t GetSharedXPCInterfaceForCADClientInterface()
{
  return MEMORY[0x1E0D0A030]();
}

uint64_t GetSharedXPCInterfaceForCADInterface()
{
  return MEMORY[0x1E0D0A038]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

uint64_t SecTrustDeserialize()
{
  return MEMORY[0x1E0CD66A0]();
}

uint64_t SecTrustSerialize()
{
  return MEMORY[0x1E0CD6708]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1E0DB1048]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return MEMORY[0x1E0C9A178]();
}

uint64_t _EKMSUUIDString()
{
  return MEMORY[0x1E0D0BE50]();
}

uint64_t _EKMSUUIDStringForDetachedEvent()
{
  return MEMORY[0x1E0D0BE58]();
}

uint64_t _NSMethodExceptionProem()
{
  return MEMORY[0x1E0CB3C38]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t doURLsEmailsPhoneNumbersMatch()
{
  return MEMORY[0x1E0D0C448]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83860](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C843E0](*(_QWORD *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x1E0C844F8](activity, block);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85510](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

size_t strftime_l(char *a1, size_t a2, const char *a3, const tm *a4, locale_t a5)
{
  return MEMORY[0x1E0C85560](a1, a2, a3, a4, a5);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return (char *)MEMORY[0x1E0C855E0](a1, a2, a3, a4);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x1E0DEECD0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t tcc_authorization_check_audit_token()
{
  return MEMORY[0x1E0DB11F8]();
}

uint64_t tcc_authorization_preflight()
{
  return MEMORY[0x1E0DB1200]();
}

uint64_t tcc_credential_singleton_for_self()
{
  return MEMORY[0x1E0DB1268]();
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1E0C85958](a1);
}

