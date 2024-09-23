void sub_227C5F68C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C604F0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_227C60A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C61FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C62330(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227C62528(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227C62DA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227C642E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227C645D8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227C64B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C651D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C65448(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227C65B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C66418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location)
{
  uint64_t v11;

  _Block_object_dispose((const void *)(v11 - 232), 8);
  objc_destroyWeak((id *)(v11 - 184));
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

void sub_227C6674C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227C672C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C6A620(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_227C6B520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C6BF50(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_227C6C188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_227C6CE64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_227C6DE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C6E8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_227C6F34C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227C6F4B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
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

void sub_227C7025C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_227C704F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227C7078C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C70B24(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  id *v6;
  uint64_t v7;

  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v7 - 88));
  _Unwind_Resume(a1);
}

void sub_227C71314(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227C7137C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227C718CC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 112));
  _Unwind_Resume(a1);
}

void sub_227C7271C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227C727D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227C72844(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227C72AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C72BF4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227C72D7C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227C72FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C73114(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227C73660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 160));
  _Unwind_Resume(a1);
}

void sub_227C75E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_227C765B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_227C777A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_227C77A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_227C7813C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_227C79C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C79DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C79ECC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227C7A278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C7A45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C7A608(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_227C7AA24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_227C7C004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C7C1D4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227C7C674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C7D48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_227C7D760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_227C7DF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_227C7E2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_227C7F1F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_227C80340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C80620(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_227C80844(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_227C80A24(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_227C80BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C80E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C81DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C82064(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_227C82C24(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_227C830F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C83DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  objc_destroyWeak((id *)(v29 - 112));
  _Unwind_Resume(a1);
}

void sub_227C840D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C84818(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_227C84BD8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_227C8511C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

id OUTLINED_FUNCTION_11(id *location)
{
  return objc_loadWeakRetained(location);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_227C878FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C897A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CMContinuityCaptureSMValidSameStateEventName(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("kCMContinuityCaptureEventStopStream"), CFSTR("kCMContinuityCaptureEventStartStream"), CFSTR("kCMContinuityCaptureEventImageCapture"), CFSTR("kCMContinuityCaptureEventEnqueueReactionEffect"), CFSTR("kCMContinuityCaptureEventUserDisconnect"), CFSTR("kCMContinuityCaptureEventForceRestartStream"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("kCMContinuityCaptureEventSystemWake"), CFSTR("kCMContinuityCaptureEventSystemSleep"), CFSTR("kCMContinuityCaptureEventAssociatedDevicePause"), CFSTR("kCMContinuityCaptureEventAssociatedDeviceResume"), CFSTR("kCMContinuityCaptureEventStreamEnableForMultipleStreamExit"), CFSTR("kCMContinuityCaptureEventStreamDisableForMultipleStream"), CFSTR("kCMContinuityCaptureEventRemoteClientDisconnect"), CFSTR("kCMContinuityCaptureEventRemoteClientReconnect"), CFSTR("kCMContinuityCaptureEventUserDisconnect"), CFSTR("kCMContinuityCaptureEventStreamDisableForWifiContention"), CFSTR("kCMContinuityCaptureEventStreamEnableForWifiContentionExit"), CFSTR("kCMContinuityCaptureEventScreenLocked"), CFSTR("kCMContinuityCaptureEventScreenUnlocked"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("kCMContinuityCaptureEventUserResume"), CFSTR("kCMContinuityCaptureEventUserPause"), CFSTR("kCMContinuityCaptureEventActiveCallStart"), CFSTR("kCMContinuityCaptureEventActiveCallEnd"), CFSTR("kCMContinuityCaptureEventCaptureSessionStarted"), CFSTR("kCMContinuityCaptureEventCaptureSessionEnded"), CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUse"), CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUseExit"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("kCMContinuityCaptureStreamActionEventSendData"), CFSTR("kCMContinuityCaptureStreamActionEventReceivedData"), CFSTR("kCMContinuityCaptureStreamActionEventTimeout"), CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarting"), CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarted"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsObject:", v3) && (objc_msgSend(v5, "containsObject:", v4) & 1) != 0
    || objc_msgSend(v6, "containsObject:", v3) && (objc_msgSend(v6, "containsObject:", v4) & 1) != 0
    || objc_msgSend(v8, "containsObject:", v3) && (objc_msgSend(v8, "containsObject:", v4) & 1) != 0)
  {
    v9 = 1;
  }
  else if (objc_msgSend(v7, "containsObject:", v3))
  {
    v9 = objc_msgSend(v7, "containsObject:", v4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t CMContinuityCaptureSMIsValidExitEventForState(void *a1, void *a2)
{
  id v3;
  id v4;
  const __CFString *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStateDisabled")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStateStreaming")))
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStopStream")) & 1) == 0)
      {
        v5 = CFSTR("kCMContinuityCaptureEventUserDisconnect");
        goto LABEL_11;
      }
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStatePaused")))
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventActiveCallEnd")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventCaptureSessionEnded")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUseExit")) & 1) == 0)
      {
        v5 = CFSTR("kCMContinuityCaptureEventUserResume");
        goto LABEL_11;
      }
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStreamStateWait")))
      {
        v6 = 0;
        goto LABEL_21;
      }
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureStreamActionEventReceivedData")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureStreamActionEventTimeout")) & 1) == 0)
      {
        v5 = CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarted");
        goto LABEL_11;
      }
    }
LABEL_20:
    v6 = 1;
    goto LABEL_21;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventSystemWake")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamEnableForMultipleStreamExit")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventRemoteClientReconnect")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamEnableForWifiContentionExit")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventScreenUnlocked")) & 1) != 0)
  {
    goto LABEL_20;
  }
  v5 = CFSTR("kCMContinuityCaptureEventAssociatedDeviceResume");
LABEL_11:
  v6 = objc_msgSend(v3, "isEqualToString:", v5);
LABEL_21:

  return v6;
}

uint64_t CMContinuityCaptureValidSMEvent(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("kCMContinuityCaptureEventCaptureSessionStarted"), CFSTR("kCMContinuityCaptureEventCaptureSessionEnded"), CFSTR("kCMContinuityCaptureEventSystemSleep"), CFSTR("kCMContinuityCaptureEventSystemWake"), CFSTR("kCMContinuityCaptureEventTerminate"), CFSTR("kCMContinuityCaptureEventUserPause"), CFSTR("kCMContinuityCaptureEventUserResume"), CFSTR("kCMContinuityCaptureEventStartStream"), CFSTR("kCMContinuityCaptureEventStopStream"), CFSTR("kCMContinuityCaptureEventAssociatedDevicePause"), CFSTR("kCMContinuityCaptureEventAssociatedDeviceResume"), CFSTR("kCMContinuityCaptureEventStreamEnableForMultipleStreamExit"), CFSTR("kCMContinuityCaptureEventStreamDisableForMultipleStream"), CFSTR("kCMContinuityCaptureEventImageCapture"), CFSTR("kCMContinuityCaptureEventEnqueueReactionEffect"), CFSTR("kCMContinuityCaptureEventActiveCallStart"), CFSTR("kCMContinuityCaptureEventActiveCallEnd"),
    CFSTR("kCMContinuityCaptureEventRemoteClientDisconnect"),
    CFSTR("kCMContinuityCaptureEventRemoteClientReconnect"),
    CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUse"),
    CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUseExit"),
    CFSTR("kCMContinuityCaptureEventStreamInterrupted"),
    CFSTR("kCMContinuityCaptureEventUserDisconnect"),
    CFSTR("kCMContinuityCaptureEventForceRestartStream"),
    CFSTR("kCMContinuityCaptureEventStreamDisableForWifiContention"),
    CFSTR("kCMContinuityCaptureEventStreamEnableForWifiContentionExit"),
    CFSTR("kCMContinuityCaptureEventScreenLocked"),
    CFSTR("kCMContinuityCaptureEventScreenUnlocked"),
    CFSTR("kCMContinuityCaptureStreamActionEventSendData"),
    CFSTR("kCMContinuityCaptureStreamActionEventReceivedData"),
    CFSTR("kCMContinuityCaptureStreamActionEventTimeout"),
    CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarted"),
    CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarting"),
    0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
    v4 = objc_msgSend(v2, "containsObject:", v1);
  else
    v4 = 0;

  return v4;
}

void sub_227C8B78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CMContinuityCaptureSMCreateTransitionsFromStatesToDestination(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  v31 = (id)0xAAAAAAAAAAAAAAAALL;
  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __CMContinuityCaptureSMCreateTransitionsFromStatesToDestination_block_invoke;
  v20[3] = &unk_24F06BA10;
  v14 = v10;
  v21 = v14;
  v15 = v11;
  v22 = v15;
  v16 = v13;
  v23 = v16;
  v17 = v12;
  v24 = v17;
  v25 = &v26;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v20);
  v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v18;
}

void sub_227C8BB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

id CMContinuityCaptureSMCreateTransitionsFromStateToDestinations(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  v31 = (id)0xAAAAAAAAAAAAAAAALL;
  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __CMContinuityCaptureSMCreateTransitionsFromStateToDestinations_block_invoke;
  v20[3] = &unk_24F06BA10;
  v14 = v9;
  v21 = v14;
  v15 = v11;
  v22 = v15;
  v16 = v13;
  v23 = v16;
  v17 = v12;
  v24 = v17;
  v25 = &v26;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v20);
  v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v18;
}

void sub_227C8BD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CMContinuityCaptureSMCreateTransitionsFromStateToDestinationOnEvents(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4;
  v30 = __Block_byref_object_dispose__4;
  v31 = (id)0xAAAAAAAAAAAAAAAALL;
  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __CMContinuityCaptureSMCreateTransitionsFromStateToDestinationOnEvents_block_invoke;
  v20[3] = &unk_24F06BA38;
  v14 = v9;
  v21 = v14;
  v15 = v10;
  v22 = v15;
  v16 = v13;
  v23 = v16;
  v17 = v12;
  v24 = v17;
  v25 = &v26;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v20);
  v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v18;
}

void sub_227C8BF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CMContinuityCaptureSMDeferEventsInState(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v9);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __CMContinuityCaptureSMDeferEventsInState_block_invoke;
  v16[3] = &unk_24F06BA60;
  objc_copyWeak(&v19, &location);
  v11 = v10;
  v18 = v11;
  v12 = v8;
  v17 = v12;
  v13 = (void *)MEMORY[0x22E2A7CB0](v16);
  CMContinuityCaptureSMCreateTransitionsFromStateToDestinationOnEvents(v12, v12, v7, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v14;
}

void sub_227C8C138(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *CMContinuityCaptureSMGetMatchingStateEntryEventForExitEvent(void *a1, void *a2)
{
  id v3;
  id v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStateDisabled")))
  {
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventSystemWake")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventSystemSleep");
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventAssociatedDeviceResume")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventAssociatedDevicePause");
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventStreamEnableForMultipleStreamExit")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventStreamDisableForMultipleStream");
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventRemoteClientReconnect")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventRemoteClientDisconnect");
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventStreamEnableForWifiContentionExit")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventStreamDisableForWifiContention");
      goto LABEL_29;
    }
    v5 = CFSTR("kCMContinuityCaptureEventScreenLocked");
    v6 = CFSTR("kCMContinuityCaptureEventScreenUnlocked");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStateStreaming")) & 1) != 0)
  {
    v5 = CFSTR("kCMContinuityCaptureEventStartStream");
    v6 = CFSTR("kCMContinuityCaptureEventStopStream");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStatePaused")))
  {
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventUserResume")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventUserPause");
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventActiveCallEnd")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventActiveCallStart");
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventCaptureSessionEnded")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventCaptureSessionStarted");
      goto LABEL_29;
    }
    v5 = CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUse");
    v6 = CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUseExit");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStreamStateWait")))
    {
      v5 = 0;
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarted")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarting");
      goto LABEL_29;
    }
    v5 = CFSTR("kCMContinuityCaptureStreamActionEventSendData");
    v6 = CFSTR("kCMContinuityCaptureStreamActionEventReceivedData");
  }
  if (!objc_msgSend(v3, "isEqual:", v6))
    v5 = 0;
LABEL_29:

  return v5;
}

const __CFString *CMContinuityCaptureSMGetMatchingStateExitEventForEntryEvent(void *a1, void *a2)
{
  id v3;
  id v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStateDisabled")))
  {
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventSystemSleep")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventSystemWake");
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventAssociatedDevicePause")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventAssociatedDeviceResume");
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventStreamDisableForMultipleStream")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventStreamEnableForMultipleStreamExit");
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventRemoteClientDisconnect")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventRemoteClientReconnect");
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventStreamDisableForWifiContention")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventStreamEnableForWifiContentionExit");
      goto LABEL_29;
    }
    v5 = CFSTR("kCMContinuityCaptureEventScreenUnlocked");
    v6 = CFSTR("kCMContinuityCaptureEventScreenLocked");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStateStreaming")) & 1) != 0)
  {
    v5 = CFSTR("kCMContinuityCaptureEventStopStream");
    v6 = CFSTR("kCMContinuityCaptureEventStartStream");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStatePaused")))
  {
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventUserPause")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventUserResume");
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventActiveCallStart")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventActiveCallEnd");
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureEventCaptureSessionStarted")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventCaptureSessionEnded");
      goto LABEL_29;
    }
    v5 = CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUseExit");
    v6 = CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUse");
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStreamStateWait")))
    {
      v5 = 0;
      goto LABEL_29;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarting")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarted");
      goto LABEL_29;
    }
    v5 = CFSTR("kCMContinuityCaptureStreamActionEventReceivedData");
    v6 = CFSTR("kCMContinuityCaptureStreamActionEventSendData");
  }
  if (!objc_msgSend(v3, "isEqual:", v6))
    v5 = 0;
LABEL_29:

  return v5;
}

uint64_t CMContinuityCaptureSMIsValidEntryEventForState(void *a1, void *a2)
{
  id v3;
  id v4;
  const __CFString *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStateDisabled")))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStateStreaming")) & 1) != 0)
    {
      v5 = CFSTR("kCMContinuityCaptureEventStartStream");
      goto LABEL_11;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStatePaused")))
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventActiveCallStart")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventCaptureSessionStarted")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamDisableForDeviceInUse")) & 1) == 0)
      {
        v5 = CFSTR("kCMContinuityCaptureEventUserPause");
        goto LABEL_11;
      }
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("kCMContinuityCaptureStreamStateWait")))
      {
        v6 = 0;
        goto LABEL_20;
      }
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureStreamActionEventSendData")) & 1) == 0)
      {
        v5 = CFSTR("kCMContinuityCaptureStreamActionEventCaptureStarting");
        goto LABEL_11;
      }
    }
LABEL_19:
    v6 = 1;
    goto LABEL_20;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventSystemSleep")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventAssociatedDevicePause")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventRemoteClientDisconnect")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventUserDisconnect")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStreamDisableForWifiContention")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("kCMContinuityCaptureEventScreenLocked")) & 1) != 0)
  {
    goto LABEL_19;
  }
  v5 = CFSTR("kCMContinuityCaptureEventStreamDisableForMultipleStream");
LABEL_11:
  v6 = objc_msgSend(v3, "isEqualToString:", v5);
LABEL_20:

  return v6;
}

id CMContinuityCaptureGetDeviceUUID(void *a1, char a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 0xAAAAAAAAAAAAAAAALL;
  v5 = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(a1, "getUUIDBytes:", &v4);
  WORD2(v5) = 0;
  BYTE6(v5) = 0;
  HIBYTE(v5) = a2;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v4);
}

void sub_227C8D1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C8D890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C8DDE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C8DEFC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227C8E748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C8EACC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227C8EBDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227C8ECD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_227C8EFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v10 - 88));
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

void sub_227C8F3F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_227C8FA3C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_227C8FD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C90704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C90900(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227C90CDC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_227C91480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C916FC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227C919C0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227C92AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *location, id *a15, id *a16)
{
  id *v16;
  id *v17;
  uint64_t v18;

  objc_destroyWeak(v16);
  objc_destroyWeak(v17);
  objc_destroyWeak(location);
  objc_destroyWeak(a16);
  objc_destroyWeak(a15);
  objc_destroyWeak(a13);
  objc_destroyWeak(a12);
  objc_destroyWeak(a11);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v18 - 224));
  _Unwind_Resume(a1);
}

void sub_227C95280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, id *a14, id *a15, id *a16, id *a17, id *a18, id *a19, id *a20,id *a21,id *a22,id *a23,id *a24,id *a25,id *a26,id *a27,id *a28,id *a29,id *a30,id *a31,id *a32,id *a33,id *a34,id *a35,id *a36,id *location,id *a38,id *a39,id *a40,id *a41,id *a42,id *a43,id *a44,id *a45,id *a46,id *a47)
{
  id *v47;
  id *v48;

  objc_destroyWeak(v48);
  objc_destroyWeak(v47);
  objc_destroyWeak((id *)STACK[0x308]);
  objc_destroyWeak(a16);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak(a17);
  objc_destroyWeak(a18);
  objc_destroyWeak(a19);
  objc_destroyWeak(a20);
  objc_destroyWeak(a21);
  objc_destroyWeak(a22);
  objc_destroyWeak(a23);
  objc_destroyWeak(a25);
  objc_destroyWeak(a27);
  objc_destroyWeak(a31);
  objc_destroyWeak(a26);
  objc_destroyWeak(a28);
  objc_destroyWeak(a33);
  objc_destroyWeak(a35);
  objc_destroyWeak(a36);
  objc_destroyWeak(a47);
  objc_destroyWeak(a45);
  objc_destroyWeak(a46);
  objc_destroyWeak(a43);
  objc_destroyWeak(a44);
  objc_destroyWeak(a42);
  objc_destroyWeak(a41);
  objc_destroyWeak(a39);
  objc_destroyWeak(a40);
  objc_destroyWeak(a32);
  objc_destroyWeak(a29);
  objc_destroyWeak(a24);
  objc_destroyWeak(location);
  objc_destroyWeak(a30);
  objc_destroyWeak(a38);
  objc_destroyWeak(a34);
  objc_destroyWeak((id *)&STACK[0xB50]);
  _Unwind_Resume(a1);
}

void sub_227C9FCB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227C9FEAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CA00AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CA037C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CA1740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CA1AE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_227CA1FB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CA209C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_227CA21A4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf, int a12, __int16 a13, __int16 a14, uint64_t a15, __int128 a16)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = v18;
  if (a2 == 1)
  {
    v19 = objc_begin_catch(a1);
    CMContinuityCaptureLog(2);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(v16 + v23);
      v22 = *(_QWORD *)(v17 + 32);
      LODWORD(buf) = 138544130;
      *(_QWORD *)((char *)&buf + 4) = v16;
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v21;
      a14 = 2112;
      a15 = v22;
      LOWORD(a16) = 2112;
      *(_QWORD *)((char *)&a16 + 2) = v19;
      _os_log_error_impl(&dword_227C5D000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Device %@ performEffectForReaction does not support %@: %@", (uint8_t *)&buf, 0x2Au);
    }

    objc_end_catch();
    JUMPOUT(0x227CA2170);
  }
  _Unwind_Resume(a1);
}

void sub_227CA238C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_227CA2C40(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_227CA3BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CA6710(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CA68D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CA7050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getDKNotificationAgentClass()
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
  v0 = (void *)getDKNotificationAgentClass_softClass;
  v7 = getDKNotificationAgentClass_softClass;
  if (!getDKNotificationAgentClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getDKNotificationAgentClass_block_invoke;
    v3[3] = &unk_24F06B090;
    v3[4] = &v4;
    __getDKNotificationAgentClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_227CA7118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDKNotificationAgentClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!DockKitCoreLibraryCore_frameworkLibrary)
    DockKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("DKNotificationAgent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getDKNotificationAgentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_9_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_12_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_227CA89C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CA8D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CA8F50(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227CAA4C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CAAC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_227CAB520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

unint64_t CMContinuityCaptureGetHostTimeInNanoSec()
{
  uint64_t v0;
  unint64_t v1;

  if (CMContinuityCaptureGetHostTimeInNanoSec_onceToken != -1)
    dispatch_once(&CMContinuityCaptureGetHostTimeInNanoSec_onceToken, &__block_literal_global_8);
  v0 = mach_absolute_time();
  if (*(_DWORD *)algn_25592462C <= 1u)
    v1 = 1;
  else
    v1 = *(unsigned int *)algn_25592462C;
  return v0 * CMContinuityCaptureGetHostTimeInNanoSec_s_timebase_info / v1;
}

id CMContinuityCaptureStringFromOSType(unsigned int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  int v5;
  char v6;
  unsigned int v7;

  v6 = -86;
  v5 = -1431655766;
  v1 = bswap32(a1);
  v2 = 3;
  if (HIBYTE(a1))
    v2 = 4;
  v3 = v2 - (a1 < 0x10000) - (a1 < 0x100) - (a1 == 0);
  v7 = v1;
  __strncpy_chk();
  *((_BYTE *)&v5 + v3) = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", &v5, 30);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t CMContinuityCapture4CCIDFromControlName(void *a1)
{
  uint64_t v1;
  id v2;

  v1 = 1651797110;
  v2 = a1;
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("kCMContinuityCaptureControlBatteryLevel")) & 1) == 0)
  {
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("kCMContinuityCaptureControlBatteryState")))
      v1 = 1651798900;
    else
      v1 = 0;
  }

  return v1;
}

const __CFString *CMContinuityCaptureDevicePropertyFromControlName(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("kCMContinuityCaptureControlCameraHidden")) & 1) != 0)
  {
    v2 = CFSTR("CMIOExtensionPropertyDeviceHidden");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("kCMContinuityCaptureControlCameraReadyToUnhide")) & 1) != 0)
  {
    v2 = CFSTR("CMIOExtensionPropertyDeviceReadyToUnhide");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("kCMContinuityCaptureControlDockedTrackingActive")))
  {
    v2 = CFSTR("DockedTrackingActive");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t CMContinuityCaptureGetAVCVideoResolutionForFormat(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "width") == 320 && objc_msgSend(v1, "height") == 240)
  {
    v2 = 0;
  }
  else if (objc_msgSend(v1, "width") == 480 && objc_msgSend(v1, "height") == 360)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "width") == 640 && objc_msgSend(v1, "height") == 480)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "width") == 1024 && objc_msgSend(v1, "height") == 768)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "width") == 1280 && objc_msgSend(v1, "height") == 960)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "width") == 320 && objc_msgSend(v1, "height") == 180)
  {
    v2 = 5;
  }
  else if (objc_msgSend(v1, "width") == 480 && objc_msgSend(v1, "height") == 270)
  {
    v2 = 6;
  }
  else if (objc_msgSend(v1, "width") == 640 && objc_msgSend(v1, "height") == 360)
  {
    v2 = 7;
  }
  else if (objc_msgSend(v1, "width") == 1280 && objc_msgSend(v1, "height") == 720)
  {
    v2 = 8;
  }
  else if (objc_msgSend(v1, "width") == 1920 && objc_msgSend(v1, "height") == 1080)
  {
    v2 = 9;
  }
  else if (objc_msgSend(v1, "width") == 2592 && objc_msgSend(v1, "height") == 1936)
  {
    v2 = 10;
  }
  else if (objc_msgSend(v1, "width") == 3264)
  {
    if (objc_msgSend(v1, "height") == 2448)
      v2 = 11;
    else
      v2 = 12;
  }
  else
  {
    v2 = 12;
  }

  return v2;
}

id CMContinuityCaptureGetCurrentTimeString()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureGetTimeStringFromDate(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

__CFString *CMContinuityCaptureGetTimeStringFromDate(void *a1)
{
  id v1;
  id v2;
  void *v3;
  __CFString *v4;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd hh:mm:ss.SSS"));
    objc_msgSend(v3, "stringFromDate:", v1);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("Unknown");
  }

  return v4;
}

id CMContinuityCaptureGetDateFromTimeString(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v3 = v2;
  v4 = 0;
  if (v1 && v2)
  {
    objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd hh:mm:ss.SSS"));
    objc_msgSend(v3, "dateFromString:", v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t CMContinuityCaptureXPCConnectionHasEntitlement(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "valueForEntitlement:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

id CMContinuityCaptureCreateLocalizedString(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v10 = (void *)MEMORY[0x24BDD1488];
  v11 = a2;
  v12 = a1;
  objc_msgSend(v10, "bundleWithIdentifier:", CFSTR("com.apple.CMContinuityCaptureCore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend(v13, "localizations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "preferredLocalizationsFromArray:forPreferences:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "localizedStringForKey:value:table:localization:", v12, v11, 0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:locale:arguments:", v20, v14, &a9);
  return v21;
}

uint64_t CMContinuityCaptureLagunaEnabled()
{
  if (CMContinuityCaptureLagunaEnabled_sOnceToken != -1)
    dispatch_once(&CMContinuityCaptureLagunaEnabled_sOnceToken, &__block_literal_global_93);
  return CMContinuityCaptureLagunaEnabled_sLagunaEnabled;
}

uint64_t CMContinuityCaptureDeviceModelFromModelString()
{
  int v0;

  v0 = GestaltProductTypeStringToDeviceClass();
  if (v0 > 3)
  {
    if (v0 != 4)
      return v0 == 100;
    return 2;
  }
  else
  {
    if (v0 != 1)
    {
      if (v0 == 3)
        return 3;
      return 0;
    }
    return 4;
  }
}

uint64_t CMContinuityCaptureDeviceClassFromDeviceModel(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return dword_227CED6A0[a1 - 1];
}

__CFString *CMContinuityCaptureStringForEntity(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_24F06C480[a1];
}

uint64_t CMContinuityCaptureDevicePosition()
{
  if (CMContinuityCaptureDevicePosition_once != -1)
    dispatch_once(&CMContinuityCaptureDevicePosition_once, &__block_literal_global_152);
  return CMContinuityCaptureDevicePosition_devicePosition;
}

id CMContinuityCaptureRemoteEventToBeRelayedList()
{
  _QWORD v1[7];

  v1[6] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("kCMContinuityCaptureEventUserPause");
  v1[1] = CFSTR("kCMContinuityCaptureEventUserResume");
  v1[2] = CFSTR("kCMContinuityCaptureEventActiveCallStart");
  v1[3] = CFSTR("kCMContinuityCaptureEventActiveCallEnd");
  v1[4] = CFSTR("kCMContinuityCaptureEventUserDisconnect");
  v1[5] = CFSTR("kCMContinuityCaptureEventStreamInterrupted");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

id CMContinuityCaptureRemoteEventToBeRelayedListEvenWhenDropped()
{
  _QWORD v1[4];

  v1[3] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("kCMContinuityCaptureEventUserResume");
  v1[1] = CFSTR("kCMContinuityCaptureEventActiveCallEnd");
  v1[2] = CFSTR("kCMContinuityCaptureEventUserDisconnect");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void CMContinuityCapturePromptOpenTapToRadar(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  const __CFDictionary *v9;
  CFUserNotificationRef v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  CFUserNotificationRef v17;
  SInt32 error;
  uint8_t buf[4];
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (os_variant_has_internal_ui())
  {
    v8 = *MEMORY[0x24BDBD6F8];
    v21[0] = *MEMORY[0x24BDBD6D8];
    v21[1] = v8;
    error = 0;
    v22[0] = v5;
    v22[1] = CFSTR("File radar");
    v21[2] = *MEMORY[0x24BDBD6F0];
    v22[2] = CFSTR("Ignore");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, &error, v9);
    CMContinuityCaptureLog(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "Prompt opening Tap-to-Radar: %@", buf, 0xCu);
      }

      dispatch_get_global_queue(0, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __CMContinuityCapturePromptOpenTapToRadar_block_invoke;
      v14[3] = &unk_24F06C460;
      v17 = v10;
      v15 = v6;
      v16 = v7;
      dispatch_async(v13, v14);

      v12 = v15;
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      CMContinuityCapturePromptOpenTapToRadar_cold_1(&error, v12);
    }

  }
}

void sub_227CAE880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

BOOL continuityCaptureNotificationCenter_isiPhone(void *a1)
{
  id v1;
  int v2;
  _BOOL8 v3;
  NSObject *v4;

  v1 = a1;
  v2 = GestaltProductTypeStringToDeviceClass();
  v3 = v2 == 1;
  if ((v2 | 2) != 3)
  {
    if (CMContinityCaptureDebugLogEnabled())
    {
      CMContinuityCaptureLog(2);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        continuityCaptureNotificationCenter_isiPhone_cold_1((uint64_t)v1, v4);

    }
    v3 = 1;
  }

  return v3;
}

void sub_227CAFB10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CAFFE0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_227CB0598(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_227CB0654(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CB0718(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_227CB08F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CB0984(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CB1554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CB19D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CB2604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CB29C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CB4A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CB5280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CB56E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CB5E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *CMContinuityCaptureMediaIdentifierFromEntityType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return 0;
  else
    return off_24F06C938[a1 - 1];
}

uint64_t CMContinuityCaptureEntityTypeFromMediaIdentifer(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ContinuityCaptureMediaIdentifierDefaultVideo")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("ContinuityCaptureMediaIdentifierDeskcamVideo")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("ContinuityCaptureMediaMicrophone")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const char *CMContinuityCaptureStringFromSelector(int a1, void *a2)
{
  id v3;
  const char *v4;
  const char *v5;
  int v6;
  const char *v7;

  v3 = a2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ContinuityCaptureCommand")))
  {
    if ((a1 - 1) >= 9)
      v4 = "Invalid";
    else
      v4 = off_24F06C8F0[(char)(a1 - 1)];
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ContinuityCaptureControl")))
  {
    v5 = "Invalid";
    if (a1 == 2)
      v5 = "AVCNegotiation";
    if (a1 == 1)
      v4 = "SetValue";
    else
      v4 = v5;
  }
  else
  {
    v6 = objc_msgSend(v3, "isEqualToString:", CFSTR("ContinuityCaptureData"));
    v7 = "Invalid";
    if (!a1)
      v7 = "StillImage";
    if (v6)
      v4 = v7;
    else
      v4 = 0;
  }

  return v4;
}

id CMContinuityCaptureCreateCipherKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length") != 32)
  {
    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v10 = objc_msgSend(v3, "length");
      else
        v10 = 0;
      v15 = 134217984;
      v16 = v10;
      v11 = "Invalid base length %lu";
      v12 = v9;
      v13 = 12;
      goto LABEL_11;
    }
LABEL_12:

    v6 = 0;
    goto LABEL_13;
  }
  if (!v4)
  {
    CMContinuityCaptureLog(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      v11 = "Invalid sessionID";
      v12 = v9;
      v13 = 2;
LABEL_11:
      _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v15, v13);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 16);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithData:", v3);
  v7 = objc_retainAutorelease(v5);
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v7, "mutableBytes"));
  v8 = objc_retainAutorelease(v7);
  objc_msgSend(v6, "appendBytes:length:", objc_msgSend(v8, "bytes"), 14);

LABEL_13:
  return v6;
}

unint64_t CMContinuityCaptureGetStreamSessionGenerationID()
{
  unint64_t result;

  if (CMContinuityCaptureGetStreamSessionGenerationID_onceTokenStreamSession != -1)
    dispatch_once(&CMContinuityCaptureGetStreamSessionGenerationID_onceTokenStreamSession, &__block_literal_global_12);
  do
    result = __ldaxr(&__streamSessionGenerationID);
  while (__stlxr(result + 1, &__streamSessionGenerationID));
  return result;
}

unint64_t CMContinuityCaptureGetMessageGenerationID()
{
  unint64_t result;

  if (CMContinuityCaptureGetMessageGenerationID_onceTokenMessage != -1)
    dispatch_once(&CMContinuityCaptureGetMessageGenerationID_onceTokenMessage, &__block_literal_global_61_0);
  do
    result = __ldaxr(&__messageGenerationID);
  while (__stlxr(result + 1, &__messageGenerationID));
  return result;
}

unint64_t CMContinuityCaptureGetActivateGenerationID()
{
  unint64_t result;

  if (CMContinuityCaptureGetActivateGenerationID_onceTokenActivate != -1)
    dispatch_once(&CMContinuityCaptureGetActivateGenerationID_onceTokenActivate, &__block_literal_global_62);
  do
    result = __ldaxr(&__activateGenerationID);
  while (__stlxr(result + 1, &__activateGenerationID));
  return result;
}

uint64_t CMContinuityCaptureGetMediaProcessUniqueID(int a1)
{
  __int128 v1;
  pid_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v16 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v14 = v1;
    v15 = v1;
    v13 = v1;
    v2 = getpid();
    proc_pidinfo(v2, 17, 1uLL, &v13, 56);
    return v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFD9E8], "getDaemonProcessInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
      goto LABEL_7;
    v6 = *MEMORY[0x24BDFD9C8];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDFD9C8]);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
      goto LABEL_7;
    v8 = (void *)v7;
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v11, "unsignedLongLongValue");

    }
    else
    {
LABEL_7:
      v3 = 0;
    }

  }
  return v3;
}

id CMContinuityCaptureMediaIdentfiersForCapabilities(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v1, "devicesCapabilities", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "entityType") - 1;
        if (v8 <= 2)
          objc_msgSend(v2, "addObject:", off_24F06C938[v8]);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

id CMContinuityCaptureGetListOfSupportedSidebandIdentifiers()
{
  _QWORD v1[4];

  v1[3] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("ContinuityCaptureControl");
  v1[1] = CFSTR("ContinuityCaptureCommand");
  v1[2] = CFSTR("ContinuityCaptureData");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t CMContinuityCaptureDeviceSupportsAllFeatures(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  char v22;
  uint64_t v24;
  uint64_t v25;
  id obj;
  uint64_t v27;
  int v28;
  char v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = a1;
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v1)
  {
    v2 = v1;
    v3 = 0;
    v4 = 0;
    v30 = 0;
    v29 = 0;
    v5 = *(_QWORD *)v36;
    v24 = *(_QWORD *)v36;
    do
    {
      v6 = 0;
      v25 = v2;
      do
      {
        if (*(_QWORD *)v36 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v6);
        if (objc_msgSend(v7, "entityType") == 1)
        {
          v27 = v6;
          v28 = v4;
          objc_msgSend(v7, "controls");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v32;
            do
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v32 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
                objc_msgSend(v13, "name");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("4cc_cfen_glob_0000"));

                if ((v15 & 1) != 0)
                {
                  v3 = 1;
                }
                else
                {
                  objc_msgSend(v13, "name");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("StudioLightingEnabled"));

                  if ((v17 & 1) != 0)
                  {
                    LOBYTE(v30) = 1;
                  }
                  else
                  {
                    objc_msgSend(v13, "name");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("ReactionEffectsEnabled"));

                    if ((v19 & 1) != 0)
                    {
                      v29 = 1;
                    }
                    else
                    {
                      objc_msgSend(v13, "name");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("BackgroundReplacementEnabled"));

                      BYTE4(v30) |= v21;
                    }
                  }
                }
              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            }
            while (v10);
          }

          v4 = v28;
          v5 = v24;
          v2 = v25;
          v6 = v27;
        }
        else
        {
          v4 |= objc_msgSend(v7, "entityType") == 2;
        }
        ++v6;
      }
      while (v6 != v2);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v2);
    v22 = v3 & v4 & v30 & v29 & BYTE4(v30);
  }
  else
  {
    v22 = 0;
  }

  return v22 & 1;
}

void sub_227CB8020(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_227CBC90C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CBCBD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CBCD54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CMContinuityCaptureLog(uint64_t a1)
{
  id v2;
  id v3;

  if (CMContinuityCaptureLog_once != -1)
    dispatch_once(&CMContinuityCaptureLog_once, &__block_literal_global_15);
  if (a1 > 3)
  {
    v2 = (id)MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v2 = (id)CMContinuityCaptureLog_log[a1];
  }
  return v2;
}

uint64_t CMContinuityCaptureGetBootArgsForKey(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  size_t v6;
  size_t v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  uint64_t v12;
  char __s1[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[31];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v26 = 0u;
  memset(v27, 0, sizeof(v27));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  *(_OWORD *)__s1 = 0u;
  v14 = 0u;
  v8 = 255;
  if (v1
    && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@="), v1, v8),
        (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    v4 = 0;
    if (!sysctlbyname("kern.bootargs", __s1, &v8, 0, 0))
    {
      v5 = objc_retainAutorelease(v3);
      v4 = (uint64_t)strstr(__s1, (const char *)objc_msgSend(v5, "UTF8String"));
      if (v4)
      {
        v6 = strlen((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
        v4 = strtol((const char *)(v4 + v6), 0, 0);
      }
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v10 = v1;
      v11 = 2048;
      v12 = v4;
      _os_log_impl(&dword_227C5D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "boot args [%@ : %lx]", buf, 0x16u);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t CMContinityCaptureDebugLogEnabled()
{
  if (CMContinityCaptureDebugLogEnabled_onceToken != -1)
    dispatch_once(&CMContinityCaptureDebugLogEnabled_onceToken, &__block_literal_global_18);
  return CMContinityCaptureDebugLogEnabled_debugOptions & 1;
}

void sub_227CBDAD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CBDCE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_227CBDE10(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_227CBDFE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_227CBE2FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CBF364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_227CBF8F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, id *location)
{
  uint64_t v13;

  objc_destroyWeak((id *)(v13 - 168));
  _Unwind_Resume(a1);
}

void sub_227CC0298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CC0A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CC0F2C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227CC12F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CC1B70(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227CC2A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void handleBatteryInfoChanged(void *a1, uint64_t a2, int a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v4 = a1;
  v5 = v4;
  if (v4 && a3 == -536723200)
  {
    objc_msgSend(v4, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __handleBatteryInfoChanged_block_invoke;
    block[3] = &unk_24F06AEB0;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __handleBatteryInfoChanged_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBatteryInfoChanged");
}

void sub_227CC2DFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_227CC34AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CC36A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CC38A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CC3BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CC4D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CC5760(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_227CC6244(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void sub_227CC7DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CCA948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CCBCF0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_227CCC2E0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227CCCB54(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227CCD370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CCD9B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CCDAD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CCDC60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CCE674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_227CCE960(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CCFCB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CCFFCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CD0220(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CD0540(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CD0734(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CD197C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CD1FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location)
{
  id *v11;
  id *v12;
  id *v13;
  uint64_t v14;

  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v14 - 160));
  objc_destroyWeak((id *)(v14 - 168));
  _Unwind_Resume(a1);
}

void sub_227CD2184(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CD22E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CD26C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CD2AB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CD2CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CD313C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CD3D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CD4154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CD626C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CD6700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CD695C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227CD6D04(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227CD7068(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CD7108(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227CD78C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CD8358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CD868C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CD8E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CD9854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CD9B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CDAAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CDADE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CDB5D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CDD6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void CMContinuityCaptureReceiveDataFromNWConnection(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  NSObject *v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__7;
  v21[4] = __Block_byref_object_dispose__7;
  v22 = (id)0xAAAAAAAAAAAAAAAALL;
  if (v8)
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithData:", v8);
  else
    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v22 = v11;
  CMContinuityCaptureLog(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v9;
    _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%@ Schedule NW connection read", buf, 0xCu);
  }

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __CMContinuityCaptureReceiveDataFromNWConnection_block_invoke;
  v16[3] = &unk_24F06D1F0;
  v13 = v9;
  v17 = v13;
  v20 = v21;
  v14 = v10;
  v19 = v14;
  v15 = v7;
  v18 = v15;
  nw_connection_receive(v15, 1u, 0xFFFFFFFF, v16);

  _Block_object_dispose(v21, 8);
}

void sub_227CDDF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void CMContinuityCaptureSendDataToNWConnection(void *a1, void *a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v7 && v8)
  {
    v11 = NWCreateDispatchDataFromNSData();
    if (v11)
    {
      v12 = v11;
      nw_connection_send(v7, v11, (nw_content_context_t)*MEMORY[0x24BDE0850], 0, v10);
    }
    else
    {
      CMContinuityCaptureLog(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEFAULT, "%@ sendData NWCreateDispatchDataFromNSData for %@", (uint8_t *)&v13, 0x16u);
      }
    }

  }
}

void sub_227CDE4FC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_227CDE724(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_227CDFAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CDFE80(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_227CE0B00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CE0ED8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227CE1100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227CE2638(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_227CE2EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
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

void CMContinuityCapturePromptOpenTapToRadar_cold_1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_227C5D000, a2, OS_LOG_TYPE_ERROR, "Error creating Tap-to-Radar notification: %d", (uint8_t *)v3, 8u);
}

void continuityCaptureNotificationCenter_isiPhone_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_227C5D000, a2, OS_LOG_TYPE_DEBUG, "Unsupported device model %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AVGestaltGetBoolAnswer()
{
  return MEMORY[0x24BDB1C68]();
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
  MEMORY[0x24BDB6988](*(_QWORD *)&inSystemSoundID, inCompletionBlock);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x24BDBEFA8](dict, point);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEFD0]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x24BDBF068](dict, rect);
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0040](allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return (const AudioStreamBasicDescription *)MEMORY[0x24BDC0058](desc);
}

OSStatus CMBlockBufferCreateContiguous(CFAllocatorRef structureAllocator, CMBlockBufferRef sourceBuffer, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00B8](structureAllocator, sourceBuffer, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags, blockBufferOut);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return MEMORY[0x24BDC00C0](structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, *(_QWORD *)&flags);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return MEMORY[0x24BDC00D0](theBuffer);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return MEMORY[0x24BDC00D8](theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

Boolean CMBlockBufferIsRangeContiguous(CMBlockBufferRef theBuffer, size_t offset, size_t length)
{
  return MEMORY[0x24BDC00E8](theBuffer, offset, length);
}

uint64_t CMClockConvertHostTimeToSystemUnits(CMTime *hostTime)
{
  return MEMORY[0x24BDC0148](hostTime);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x24BDC0150]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x24BDC0158](retstr, clock);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return (CMTime *)MEMORY[0x24BDC0168](retstr, hostTime);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return MEMORY[0x24BDC01C0](desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x24BDC01E0](target, key, attachmentModeOut);
}

uint64_t CMIOExtensionPropertyFromPropertyAddress()
{
  return MEMORY[0x24BDC1338]();
}

void CMRemoveAttachment(CMAttachmentBearerRef target, CFStringRef key)
{
  MEMORY[0x24BDC0260](target, key);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0270](allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries);
}

OSStatus CMSampleBufferCreateCopyWithNewTiming(CFAllocatorRef allocator, CMSampleBufferRef originalSBuf, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0280](allocator, originalSBuf, numSampleTimingEntries, sampleTimingArray, sampleBufferOut);
}

OSStatus CMSampleBufferCreateReadyWithImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC02A0](allocator, imageBuffer, formatDescription, sampleTiming, sampleBufferOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return (CMBlockBufferRef)MEMORY[0x24BDC02B8](sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return (CMFormatDescriptionRef)MEMORY[0x24BDC02E0](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x24BDC02E8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x24BDC0300](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC0320](retstr, sbuf);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x24BDC0340](sbuf, sampleIndex, timingInfoOut);
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC0380](target, key, value, *(_QWORD *)&attachmentMode);
}

void CMSetAttachments(CMAttachmentBearerRef target, CFDictionaryRef theAttachments, CMAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC0388](target, theAttachments, *(_QWORD *)&attachmentMode);
}

CMTime *__cdecl CMSyncConvertTime(CMTime *__return_ptr retstr, CMTime *time, CMClockOrTimebaseRef fromClockOrTimebase, CMClockOrTimebaseRef toClockOrTimebase)
{
  return (CMTime *)MEMORY[0x24BDC03E8](retstr, time, fromClockOrTimebase, toClockOrTimebase);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC0420](retstr, lhs, rhs);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x24BDC0460](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x24BDC0468](time, allocator);
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

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x24BDC04A8](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x24BDC05A0](retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreate(CFAllocatorRef allocator, CMVideoCodecType codecType, int32_t width, int32_t height, CFDictionaryRef extensions, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0638](allocator, *(_QWORD *)&codecType, *(_QWORD *)&width, *(_QWORD *)&height, extensions, formatDescriptionOut);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0648](allocator, imageBuffer, formatDescriptionOut);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return (CMVideoDimensions)MEMORY[0x24BDC0668](videoDesc);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
  MEMORY[0x24BDC5160](sourceBuffer, destinationBuffer);
}

CFDictionaryRef CVPixelBufferCopyCreationAttributes(CVPixelBufferRef pixelBuffer)
{
  return (CFDictionaryRef)MEMORY[0x24BDC5238](pixelBuffer);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52B8](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D8](pixelBuffer);
}

CFTypeID CVPixelBufferGetTypeID(void)
{
  return MEMORY[0x24BDC52E0]();
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

uint64_t FigCaptureSessionRemoteSetWombatEnabled()
{
  return MEMORY[0x24BE10398]();
}

uint64_t FigCaptureSessionRemoteSetWombatInUse()
{
  return MEMORY[0x24BE103A0]();
}

uint64_t FigContinuityCaptureGetUserPreferenceDisabled()
{
  return MEMORY[0x24BE103C8]();
}

uint64_t FigDebugAssert3()
{
  return MEMORY[0x24BDC07F8]();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return MEMORY[0x24BDC0820]();
}

uint64_t FigGetCFPreferenceBooleanWithDefault()
{
  return MEMORY[0x24BDC08B0]();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return MEMORY[0x24BDC08C0]();
}

uint64_t FigNote_AllowInternalDefaultLogs()
{
  return MEMORY[0x24BDC0960]();
}

uint64_t FigRemote_CreatePixelBufferFromSerializedAtomDataBlockBuffer()
{
  return MEMORY[0x24BDC0980]();
}

uint64_t FigRemote_CreateSerializedAtomDataBlockBufferForPixelBuffer()
{
  return MEMORY[0x24BDC0990]();
}

uint64_t GestaltCopyAnswer()
{
  return MEMORY[0x24BE29388]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x24BE293A0]();
}

uint64_t GestaltProductTypeStringToDeviceClass()
{
  return MEMORY[0x24BE293A8]();
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

uint64_t IOPMAssertionDeclareSystemActivity()
{
  return MEMORY[0x24BDD8728]();
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x24BDD8740](*(_QWORD *)&AssertionID);
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  return MEMORY[0x24BDD8750](*(_QWORD *)&theAssertion, theProperty, theValue);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MSNMonitorBeginException()
{
  return MEMORY[0x24BE65A98]();
}

uint64_t MSNMonitorEndException()
{
  return MEMORY[0x24BE65AA0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NWCreateDispatchDataFromNSData()
{
  return MEMORY[0x24BDE07B0]();
}

uint64_t NWCreateNSDataFromDispatchData()
{
  return MEMORY[0x24BDE07B8]();
}

uint64_t SockAddrConvertToIPv6()
{
  return MEMORY[0x24BE29998]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x24BE29A28]();
}

uint64_t TUFormattedPhoneNumber()
{
  return MEMORY[0x24BEB4B38]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x24BDAC920]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x24BDC0B20]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x24BDC0B28]();
}

uint64_t fig_note_initialize_category_with_default_work_cf()
{
  return MEMORY[0x24BDC0B40]();
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x24BDAE850](*(_QWORD *)&a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x24BDAF150](*(_QWORD *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0AF8](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x24BDE0B68](endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x24BDE0C28](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x24BDE0C58](connection, content, context, is_complete, completion);
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x24BDE0C80]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C98](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x24BDE0CB0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CD0](connection);
}

BOOL nw_content_context_get_is_final(nw_content_context_t context)
{
  return MEMORY[0x24BDE0D20](context);
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return MEMORY[0x24BDE0E98]();
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x24BDE1380]();
}

nw_listener_t nw_listener_create_with_port(const char *port, nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x24BDE1458](port, parameters);
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
  MEMORY[0x24BDE1488](listener, handler);
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1498](listener, queue);
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
  MEMORY[0x24BDE14A0](listener, handler);
}

void nw_listener_start(nw_listener_t listener)
{
  MEMORY[0x24BDE14A8](listener);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x24BDE1588](configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x24BDE15A0](configure_dtls, configure_udp);
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
  MEMORY[0x24BDE1620](parameters, interface);
}

uint64_t nw_parameters_set_delegated_unique_pid()
{
  return MEMORY[0x24BDE1660]();
}

void nw_parameters_set_local_endpoint(nw_parameters_t parameters, nw_endpoint_t local_endpoint)
{
  MEMORY[0x24BDE16C8](parameters, local_endpoint);
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
  MEMORY[0x24BDE1758](parameters, reuse_local_address);
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x24BDE17F0]();
}

uint64_t nw_path_evaluator_get_client_id()
{
  return MEMORY[0x24BDE1830]();
}

uint64_t nw_udp_options_set_no_metadata()
{
  return MEMORY[0x24BDE2630]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

