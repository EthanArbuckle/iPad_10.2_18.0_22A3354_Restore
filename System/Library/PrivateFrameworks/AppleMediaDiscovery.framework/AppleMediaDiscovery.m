_BYTE *__os_log_helper_16_0_0(_BYTE *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_0_1_4_0(uint64_t result, int a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_6_8_64_4_0_4_0_8_64_8_64_4_0(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, int a7)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 6;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  *(_BYTE *)(result + 24) = 64;
  *(_BYTE *)(result + 25) = 8;
  *(_QWORD *)(result + 26) = a5;
  *(_BYTE *)(result + 34) = 64;
  *(_BYTE *)(result + 35) = 8;
  *(_QWORD *)(result + 36) = a6;
  *(_BYTE *)(result + 44) = 0;
  *(_BYTE *)(result + 45) = 4;
  *(_DWORD *)(result + 46) = a7;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_64_4_0_4_0(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_2_5_8_64_8_64_8_0_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  *(_BYTE *)(result + 42) = 64;
  *(_BYTE *)(result + 43) = 8;
  *(_QWORD *)(result + 44) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

void sub_1DC69B184()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

id getGDViewServiceClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getGDViewServiceClass_softClass;
  v13 = getGDViewServiceClass_softClass;
  if (!getGDViewServiceClass_softClass)
  {
    v2 = MEMORY[0x1E0C809B0];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getGDViewServiceClass_block_invoke;
    v6 = &unk_1EA4B5090;
    v7 = &v9;
    __getGDViewServiceClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

id getGDViewServiceHelperClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getGDViewServiceHelperClass_softClass;
  v13 = getGDViewServiceHelperClass_softClass;
  if (!getGDViewServiceHelperClass_softClass)
  {
    v2 = MEMORY[0x1E0C809B0];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getGDViewServiceHelperClass_block_invoke;
    v6 = &unk_1EA4B5090;
    v7 = &v9;
    __getGDViewServiceHelperClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getGDViewServiceClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  IntelligencePlatformLibrary();
  Class = objc_getClass("GDViewService");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getGDViewServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t IntelligencePlatformLibrary()
{
  uint64_t v1;

  v1 = IntelligencePlatformLibraryCore();
  if (!v1)
    abort_report_np();
  return v1;
}

uint64_t IntelligencePlatformLibraryCore()
{
  if (!IntelligencePlatformLibraryCore_frameworkLibrary)
    __IntelligencePlatformLibraryCore_block_invoke();
  return IntelligencePlatformLibraryCore_frameworkLibrary;
}

uint64_t __getGDViewServiceHelperClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;

  IntelligencePlatformLibrary();
  Class = objc_getClass("GDViewServiceHelper");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getGDViewServiceHelperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_1DC6A6BF8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_1_8_32(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

uint64_t __os_log_helper_16_0_1_8_0(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 1;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  return result;
}

void sub_1DC6B0E94()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1DC6B11D8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_0_2_4_0_4_0(uint64_t result, int a2, int a3)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  return result;
}

void sub_1DC6B2D24()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_2_8_64_8_32(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 32;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

void sub_1DC6B5954()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_2_4_0_8_64(uint64_t result, int a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 64;
  *(_BYTE *)(result + 9) = 8;
  *(_QWORD *)(result + 10) = a3;
  return result;
}

uint64_t __os_log_helper_16_0_2_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

void sub_1DC6B7034()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1DC6B79DC()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_4_8_64_4_0_4_0_4_0(uint64_t result, uint64_t a2, int a3, int a4, int a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  *(_BYTE *)(result + 24) = 0;
  *(_BYTE *)(result + 25) = 4;
  *(_DWORD *)(result + 26) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_64_4_0_4_0_8_64(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 0;
  *(_BYTE *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  *(_BYTE *)(result + 24) = 64;
  *(_BYTE *)(result + 25) = 8;
  *(_QWORD *)(result + 26) = a5;
  return result;
}

uint64_t __os_log_helper_16_0_3_4_0_4_0_4_0(uint64_t result, int a2, int a3, int a4)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(_BYTE *)(result + 14) = 0;
  *(_BYTE *)(result + 15) = 4;
  *(_DWORD *)(result + 16) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_3_4_0_4_0_8_64(uint64_t result, int a2, int a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(_BYTE *)(result + 14) = 64;
  *(_BYTE *)(result + 15) = 8;
  *(_QWORD *)(result + 16) = a4;
  return result;
}

void sub_1DC6B8A14()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_1DC6BA034()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1DC6BAE00()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1DC6BD318()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_1DC6C1294()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_1DC6C3088()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_1DC6C3994()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1DC6C5550()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

uint64_t __os_log_helper_16_0_2_4_0_8_0(uint64_t result, int a2, uint64_t a3)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 8;
  *(_QWORD *)(result + 10) = a3;
  return result;
}

uint64_t __os_log_helper_16_0_3_4_0_4_0_8_0(uint64_t result, int a2, int a3, uint64_t a4)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(_BYTE *)(result + 14) = 0;
  *(_BYTE *)(result + 15) = 8;
  *(_QWORD *)(result + 16) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_64_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 64;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_64_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_1DC6D514C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1DC6D591C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23,_Unwind_Exception *exception_object)
{
  uint64_t v24;

  _Block_object_dispose((const void *)(v24 - 128), 8);
  _Block_object_dispose((const void *)(v24 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DC6D5F28()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_1DC6EA558()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1DC6ED088()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t GetDeviceSpace(_QWORD *a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;
  _QWORD v4[3];
  _QWORD v5[3];
  _DWORD *v6;
  _QWORD *v7;
  _QWORD *v8;

  v8 = a1;
  v7 = a2;
  v6 = a3;
  memset(v4, 0, 20);
  v5[2] = 0;
  v5[0] = 5;
  v5[1] = 2147483668;
  result = getattrlist("/", v5, v4, 0x14uLL, 0);
  *v6 = result;
  if (!*v6)
  {
    *v8 = *(_QWORD *)((char *)v4 + 4);
    *v7 = *(_QWORD *)((char *)&v4[1] + 4);
  }
  return result;
}

void __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_1DC6F2EC0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1DC6F515C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_2_8_64_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  return result;
}

void sub_1DC6F9FA0(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 168) = a1;
  *(_DWORD *)(v2 - 172) = a2;
  objc_end_catch();
  JUMPOUT(0x1DC6FA028);
}

void sub_1DC6FA040()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1DC707884()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_1DC719B44()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

id getGDViewServiceClass_0()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getGDViewServiceClass_softClass_0;
  v13 = getGDViewServiceClass_softClass_0;
  if (!getGDViewServiceClass_softClass_0)
  {
    v2 = MEMORY[0x1E0C809B0];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getGDViewServiceClass_block_invoke_0;
    v6 = &unk_1EA4B5090;
    v7 = &v9;
    __getGDViewServiceClass_block_invoke_0((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getGDViewServiceClass_block_invoke_0(uint64_t a1)
{
  Class Class;
  uint64_t result;

  IntelligencePlatformLibrary_0();
  Class = objc_getClass("GDViewService");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    result = abort_report_np();
  getGDViewServiceClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t IntelligencePlatformLibrary_0()
{
  uint64_t v1;

  v1 = IntelligencePlatformLibraryCore_0();
  if (!v1)
    abort_report_np();
  return v1;
}

uint64_t IntelligencePlatformLibraryCore_0()
{
  if (!IntelligencePlatformLibraryCore_frameworkLibrary_0)
    __IntelligencePlatformLibraryCore_block_invoke_0();
  return IntelligencePlatformLibraryCore_frameworkLibrary_0;
}

void sub_1DC71A6F0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_1DC71CF14()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_3_8_64_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 64;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t __os_log_helper_16_0_2_8_0_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void __Block_byref_object_copy__9(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void __Block_byref_object_copy__10(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_1DC724C4C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_4_8_64_8_64_4_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 4;
  *(_DWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 28) = 64;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  return result;
}

void sub_1DC72A6F4()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1DC72D368()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void SparseConvertFromCoordinate(uint64_t a1@<X4>, int *a2@<X5>, int *a3@<X6>, float *a4@<X7>, int a5@<W0>, int a6@<W1>, uint64_t a7@<X2>, uint8_t a8@<W3>, uint64_t a9@<X8>)
{
  SparseAttributes_t v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  os_log_t v15;
  void *workspace;
  uint8_t v17[15];
  os_log_type_t v18;
  os_log_t v19;
  char *storage;
  uint8_t v21[7];
  os_log_type_t v22;
  os_log_t v23;
  os_log_type_t v24;
  os_log_t v25;
  os_log_type_t v26;
  os_log_t v27;
  os_log_type_t type;
  os_log_t oslog;
  _QWORD __dst[6];
  float *val;
  int *col;
  int *row;
  uint8_t blockSize;
  uint64_t nBlock;
  int n;
  int m;
  uint64_t v38;
  int v39;
  uint8_t v40[16];
  char v41[256];
  char v42[256];
  char v43[256];
  uint8_t v44[16];
  char v45[256];
  uint8_t v46[16];
  char v47[256];
  uint8_t v48[8];
  char __b[256];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v38 = a1;
  v39 = a1;
  m = a5;
  n = a6;
  nBlock = a7;
  blockSize = a8;
  row = a2;
  col = a3;
  val = a4;
  memcpy(__dst, &unk_1EA4B5D28, sizeof(__dst));
  if (m >= 0)
  {
    if (n >= 0)
    {
      if (nBlock >= 0)
      {
        if ((((unsigned __int16)v39 >> 2) & 3) == 0 || m == n)
        {
          storage = (char *)malloc_type_malloc(8 * (n + 1) + 28 + 4 * nBlock + 4 * nBlock * blockSize * blockSize, 0xA2E37A59uLL);
          if (storage)
          {
            workspace = malloc_type_malloc(4 * m, 0x100004052888210uLL);
            if (workspace)
            {
              memset((void *)a9, 0, 0x28uLL);
              v9 = (SparseAttributes_t)v39;
              _SparseConvertFromCoordinate_Float((SparseMatrix_Float *)a9, m, n, nBlock, blockSize, v9, row, col, val, storage, (int *)workspace);
              *(_QWORD *)(a9 + 8) = storage;
              free(workspace);
              *(_WORD *)(a9 + 24) = *(_WORD *)(a9 + 24) & 0x7FFF | 0x8000;
            }
            else
            {
              free(storage);
              if (__dst[5])
              {
                memset(v41, 0, sizeof(v41));
                __snprintf_chk(v41, 0x100uLL, 0, 0x100uLL, "Failed to allocate workspace of size %ld.\n", 4 * m);
                ((void (*)(char *))__dst[5])(v41);
              }
              else
              {
                v15 = (os_log_t)MEMORY[0x1E0C81028];
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  __os_log_helper_16_0_1_8_0((uint64_t)v40, 4 * m);
                  _os_log_error_impl(&dword_1DC678000, v15, OS_LOG_TYPE_ERROR, "Failed to allocate workspace of size %ld.\n", v40, 0xCu);
                }
                objc_storeStrong((id *)&v15, 0);
                _SparseTrap();
              }
              memcpy((void *)a9, &_SparseNullMatrix_Float, 0x28uLL);
            }
          }
          else
          {
            if (__dst[5])
            {
              memset(v42, 0, sizeof(v42));
              __snprintf_chk(v42, 0x100uLL, 0, 0x100uLL, "Failed to allocate storage for result.\n");
              ((void (*)(char *))__dst[5])(v42);
            }
            else
            {
              v19 = (os_log_t)MEMORY[0x1E0C81028];
              v18 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                v10 = v19;
                v11 = v18;
                __os_log_helper_16_0_0(v17);
                _os_log_error_impl(&dword_1DC678000, v10, v11, "Failed to allocate storage for result.\n", v17, 2u);
              }
              objc_storeStrong((id *)&v19, 0);
              _SparseTrap();
            }
            memcpy((void *)a9, &_SparseNullMatrix_Float, 0x28uLL);
          }
        }
        else
        {
          if (__dst[5])
          {
            memset(v43, 0, sizeof(v43));
            __snprintf_chk(v43, 0x100uLL, 0, 0x100uLL, "attributes.kind must be SparseOrdinary if matrix is not square.\n");
            ((void (*)(char *))__dst[5])(v43);
          }
          else
          {
            v23 = (os_log_t)MEMORY[0x1E0C81028];
            v22 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v12 = v23;
              v13 = v22;
              __os_log_helper_16_0_0(v21);
              _os_log_error_impl(&dword_1DC678000, v12, v13, "attributes.kind must be SparseOrdinary if matrix is not square.\n", v21, 2u);
            }
            objc_storeStrong((id *)&v23, 0);
            _SparseTrap();
          }
          memcpy((void *)a9, &_SparseNullMatrix_Float, 0x28uLL);
        }
      }
      else
      {
        if (__dst[5])
        {
          memset(v45, 0, sizeof(v45));
          __snprintf_chk(v45, 0x100uLL, 0, 0x100uLL, "blockCount (%ld) must be non-negative.\n", nBlock);
          ((void (*)(char *))__dst[5])(v45);
        }
        else
        {
          v25 = (os_log_t)MEMORY[0x1E0C81028];
          v24 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_0_1_8_0((uint64_t)v44, nBlock);
            _os_log_error_impl(&dword_1DC678000, v25, v24, "blockCount (%ld) must be non-negative.\n", v44, 0xCu);
          }
          objc_storeStrong((id *)&v25, 0);
          _SparseTrap();
        }
        memcpy((void *)a9, &_SparseNullMatrix_Float, 0x28uLL);
      }
    }
    else
    {
      if (__dst[5])
      {
        memset(v47, 0, sizeof(v47));
        __snprintf_chk(v47, 0x100uLL, 0, 0x100uLL, "columnCount (%d) must be non-negative.\n", n);
        ((void (*)(char *))__dst[5])(v47);
      }
      else
      {
        v27 = (os_log_t)MEMORY[0x1E0C81028];
        v26 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_4_0((uint64_t)v46, n);
          _os_log_error_impl(&dword_1DC678000, v27, v26, "columnCount (%d) must be non-negative.\n", v46, 8u);
        }
        objc_storeStrong((id *)&v27, 0);
        _SparseTrap();
      }
      memcpy((void *)a9, &_SparseNullMatrix_Float, 0x28uLL);
    }
  }
  else
  {
    if (__dst[5])
    {
      memset(__b, 0, sizeof(__b));
      __snprintf_chk(__b, 0x100uLL, 0, 0x100uLL, "rowCount (%d) must be non-negative.\n", m);
      ((void (*)(char *))__dst[5])(__b);
    }
    else
    {
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v48, m);
        _os_log_error_impl(&dword_1DC678000, oslog, type, "rowCount (%d) must be non-negative.\n", v48, 8u);
      }
      objc_storeStrong((id *)&oslog, 0);
      _SparseTrap();
    }
    memcpy((void *)a9, &_SparseNullMatrix_Float, 0x28uLL);
  }
}

void SparseMultiply(SparseMatrix_Float *a1, DenseVector_Float a2, DenseVector_Float a3)
{
  SparseMatrix_Float __dst;
  SparseMatrix_Float *v4;
  DenseVector_Float v5;
  DenseVector_Float v6;

  v6 = a2;
  v5 = a3;
  v4 = a1;
  memcpy(&__dst, a1, sizeof(__dst));
  SparseMultiply(1.0, &__dst, v6, v5);
}

void SparseMultiply(float a1, SparseMatrix_Float *a2, DenseVector_Float a3, DenseVector_Float a4)
{
  float alpha;
  int rowCount;
  int v6;
  int columnCount;
  SparseMatrix_Float v9;
  DenseMatrix_Float v10;
  DenseMatrix_Float v11;
  os_log_type_t v12;
  os_log_t v13;
  os_log_type_t type;
  os_log_t oslog;
  int v16;
  int v17;
  _QWORD __dst[7];
  float v19;
  DenseVector_Float v20;
  DenseVector_Float v21;
  uint8_t v22[32];
  char v23[256];
  uint8_t v24[40];
  char __b[256];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v20 = a4;
  v19 = a1;
  __dst[6] = a2;
  memcpy(__dst, &unk_1EA4B5D58, 0x30uLL);
  v17 = 0;
  if ((*(_WORD *)&a2->structure.attributes & 1) != 0)
    columnCount = a2->structure.columnCount;
  else
    columnCount = a2->structure.rowCount;
  v17 = *(&a2->structure.blockSize + 2) * columnCount;
  v16 = 0;
  v6 = *(&a2->structure.blockSize + 2);
  if ((*(_WORD *)&a2->structure.attributes & 1) != 0)
    rowCount = a2->structure.rowCount;
  else
    rowCount = a2->structure.columnCount;
  v16 = v6 * rowCount;
  if (v6 * rowCount == v21.count)
  {
    if (v17 == v20.count)
    {
      alpha = v19;
      _DenseMatrixFromVector_Float(*(uint64_t *)&v21.count, (uint64_t)v21.data, (uint64_t)&v11);
      _DenseMatrixFromVector_Float(*(uint64_t *)&v20.count, (uint64_t)v20.data, (uint64_t)&v10);
      memcpy(&v9, a2, sizeof(v9));
      _SparseSpMV_Float(alpha, &v9, &v11, 0, &v10);
    }
    else if (__dst[5])
    {
      memset(v23, 0, sizeof(v23));
      __snprintf_chk(v23, 0x100uLL, 0, 0x100uLL, "Matrix dimensions (%dx%d) do not match y vector dimensions %dx%d\n", v17, v16, v20.count, 1);
      ((void (*)(char *))__dst[5])(v23);
    }
    else
    {
      v13 = (os_log_t)MEMORY[0x1E0C81028];
      v12 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_4_4_0_4_0_4_0_4_0((uint64_t)v22, v17, v16, v20.count, 1);
        _os_log_error_impl(&dword_1DC678000, v13, v12, "Matrix dimensions (%dx%d) do not match y vector dimensions %dx%d\n", v22, 0x1Au);
      }
      objc_storeStrong((id *)&v13, 0);
      _SparseTrap();
    }
  }
  else if (__dst[5])
  {
    memset(__b, 0, sizeof(__b));
    __snprintf_chk(__b, 0x100uLL, 0, 0x100uLL, "Matrix dimensions (%dx%d) do not match x vector dimensions %dx%d\n", v17, v16, v21.count, 1);
    ((void (*)(char *))__dst[5])(__b);
  }
  else
  {
    oslog = (os_log_t)MEMORY[0x1E0C81028];
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_4_4_0_4_0_4_0_4_0((uint64_t)v24, v17, v16, v21.count, 1);
      _os_log_error_impl(&dword_1DC678000, oslog, type, "Matrix dimensions (%dx%d) do not match x vector dimensions %dx%d\n", v24, 0x1Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    _SparseTrap();
  }
}

uint64_t __os_log_helper_16_0_4_4_0_4_0_4_0_4_0(uint64_t result, int a2, int a3, int a4, int a5)
{
  *(_BYTE *)result = 0;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 0;
  *(_BYTE *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 8) = 0;
  *(_BYTE *)(result + 9) = 4;
  *(_DWORD *)(result + 10) = a3;
  *(_BYTE *)(result + 14) = 0;
  *(_BYTE *)(result + 15) = 4;
  *(_DWORD *)(result + 16) = a4;
  *(_BYTE *)(result + 20) = 0;
  *(_BYTE *)(result + 21) = 4;
  *(_DWORD *)(result + 22) = a5;
  return result;
}

uint64_t _DenseMatrixFromVector_Float@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_DWORD *)a3 = result;
  *(_DWORD *)(a3 + 4) = 1;
  *(_QWORD *)(a3 + 8) = result;
  *(_QWORD *)(a3 + 16) = a2;
  return result;
}

void __Block_byref_object_copy__11(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_1DC732528()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1DC740124()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__12(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__12(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void __Block_byref_object_copy__13(uint64_t a1, uint64_t a2)
{
  void *v2;
  id *v3;
  id *location;

  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__13(uint64_t a1)
{
  objc_storeStrong((id *)(a1 + 40), 0);
}

void sub_1DC7471B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, id a12, os_log_t log, int a14, os_log_type_t a15, uint8_t *buf, id a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,_QWORD **a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38,__int16 a39,char a40,os_log_type_t type,os_log_t oslog,id location,id a44)
{
  uint64_t v44;
  _Unwind_Exception *exception_objecta;
  NSObject *loga;

  if (a2)
  {
    *(_QWORD *)(v44 - 232) = a1;
    *(_DWORD *)(v44 - 236) = a2;
    if (*(_DWORD *)(v44 - 236) == 1)
    {
      a44 = objc_begin_catch(*(void **)(v44 - 232));
      location = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid Predicate: %@"));
      oslog = (os_log_t)MEMORY[0x1E0C81028];
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        loga = oslog;
        __os_log_helper_16_2_1_8_64(v44 - 176, (uint64_t)location);
        _os_log_error_impl(&dword_1DC678000, loga, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)(v44 - 176), 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      **a34 = +[AMDError allocError:withMessage:](AMDError, "allocError:withMessage:", 21, location);
      objc_storeStrong(&location, 0);
      objc_storeStrong(&a44, 0);
      objc_end_catch();
      JUMPOUT(0x1DC747160);
    }
    exception_objecta = *(_Unwind_Exception **)(v44 - 232);
  }
  else
  {
    exception_objecta = a1;
  }
  _Unwind_Resume(exception_objecta);
}

uint64_t __os_log_helper_16_2_4_8_64_8_64_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 64;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 64;
  *(_BYTE *)(result + 13) = 8;
  *(_QWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 22) = 0;
  *(_BYTE *)(result + 23) = 8;
  *(_QWORD *)(result + 24) = a4;
  *(_BYTE *)(result + 32) = 0;
  *(_BYTE *)(result + 33) = 8;
  *(_QWORD *)(result + 34) = a5;
  return result;
}

uint64_t sub_1DC74C028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[41] = a5;
  v6[40] = a4;
  v6[39] = a3;
  v6[38] = a2;
  v6[37] = a1;
  v6[27] = v6;
  v6[28] = 0;
  v6[15] = 0;
  v6[16] = 0;
  v6[17] = 0;
  v6[18] = 0;
  v6[29] = 0;
  v6[30] = 0;
  v6[31] = 0;
  v6[32] = 0;
  v6[34] = 0;
  v6[36] = 0;
  v6[28] = a1;
  v6[15] = a2;
  v6[16] = a3;
  v6[17] = a4;
  v6[18] = a5;
  v6[29] = v5;
  return swift_task_switch();
}

uint64_t sub_1DC74C0BC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;

  v12 = *(_QWORD *)(v0 + 328);
  v11 = *(_QWORD *)(v0 + 320);
  v10 = *(_QWORD *)(v0 + 312);
  v9 = *(_QWORD *)(v0 + 304);
  v15 = *(_QWORD *)(v0 + 296);
  *(_QWORD *)(v0 + 216) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F039A980);
  sub_1DC76F74C();
  v14 = v1;
  *(_QWORD *)(v0 + 152) = sub_1DC76F464();
  *(_QWORD *)(v0 + 160) = v2;
  v13 = MEMORY[0x1E0DEA968];
  sub_1DC76F704();
  v3 = sub_1DC76F464();
  v14[8] = v13;
  v14[5] = v3;
  v14[6] = v4;
  *(_QWORD *)(v0 + 168) = sub_1DC76F464();
  *(_QWORD *)(v0 + 176) = v5;
  sub_1DC76F704();
  swift_bridgeObjectRetain();
  v14[17] = v13;
  v14[14] = v9;
  v14[15] = v10;
  *(_QWORD *)(v0 + 184) = sub_1DC76F464();
  *(_QWORD *)(v0 + 192) = v6;
  sub_1DC76F704();
  swift_bridgeObjectRetain();
  v14[26] = v13;
  v14[23] = v11;
  v14[24] = v12;
  *(_QWORD *)(v0 + 200) = sub_1DC76F464();
  *(_QWORD *)(v0 + 208) = v7;
  sub_1DC76F704();
  swift_bridgeObjectRetain();
  v14[35] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
  v14[32] = v15;
  sub_1DC74CCA0();
  sub_1DC74CCE0();
  sub_1DC74CCE0();
  sub_1DC74CCE0();
  sub_1DC74CCE0();
  v16 = sub_1DC76F410();
  *(_QWORD *)(v0 + 336) = v16;
  *(_QWORD *)(v0 + 240) = v16;
  sub_1DC74CD08();
  v17 = sub_1DC74CD6C();
  *(_QWORD *)(v0 + 344) = v17;
  *(_QWORD *)(v0 + 248) = v17;
  swift_bridgeObjectRetain();
  v18 = (void *)sub_1DC76F3EC();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v17, sel_enqueueData_, v18);
  *(_QWORD *)(v0 + 352) = v19;

  *(_QWORD *)(v0 + 256) = v19;
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 216);
  *(_QWORD *)(v0 + 56) = v0 + 264;
  *(_QWORD *)(v0 + 24) = sub_1DC74C4B4;
  *(_QWORD *)(v0 + 112) = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x1E0C809B0];
  *(_DWORD *)(v0 + 88) = 0x40000000;
  *(_DWORD *)(v0 + 92) = 0;
  *(_QWORD *)(v0 + 96) = sub_1DC74CD98;
  *(_QWORD *)(v0 + 104) = &block_descriptor;
  objc_msgSend(v19, sel_resultWithCompletion_, v0 + 80);
  return __swift_continuation_await_point(v0 + 16);
}

uint64_t sub_1DC74C4B4()
{
  _QWORD *v0;
  _QWORD *v1;

  v1 = (_QWORD *)*v0;
  v1[27] = *v0;
  v1[45] = v1[6];
  return swift_task_switch();
}

uint64_t sub_1DC74C554()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  id v21;

  v0[27] = v0;
  v20 = (void *)v0[33];
  v0[34] = v20;
  v21 = objc_msgSend(v20, sel_data);
  if (v21)
  {
    v17 = sub_1DC76F3F8();

    v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  v19[35] = v18;
  if (v19[35])
  {
    sub_1DC74CEAC();
    v16 = objc_msgSend(v20, sel_data);
    if (v16)
    {
      v9 = sub_1DC76F3F8();

      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    if (!v10)
      return sub_1DC76F6C8();
    v6 = (id)v19[44];
    v7 = (id)v19[43];
    v8 = sub_1DC76F6F8();
    v19[36] = v8;
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    v15 = v8;
  }
  else
  {
    sub_1DC74CEAC();
    v12 = (id)v19[44];
    v13 = (id)v19[43];
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
    sub_1DC76F74C();
    v11 = v1;
    *v1 = sub_1DC76F464();
    v11[1] = v2;
    v3 = sub_1DC76F464();
    v11[5] = MEMORY[0x1E0DEA968];
    v11[2] = v3;
    v11[3] = v4;
    sub_1DC74CCA0();
    v14 = sub_1DC76F410();

    swift_bridgeObjectRelease();
    v15 = v14;
  }
  return (*(uint64_t (**)(uint64_t))(v19[27] + 8))(v15);
}

uint64_t sub_1DC74CB8C()
{
  _QWORD *v0;
  id v2;
  id v3;

  v2 = (id)v0[44];
  v3 = (id)v0[43];
  v0[27] = v0;
  swift_willThrow();

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)())(v0[27] + 8))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x1DF0CD6E8]((char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC74CCA0()
{
  sub_1DC76F554();
  sub_1DC74D818();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC74CCE0()
{
  swift_bridgeObjectRelease();
}

unint64_t sub_1DC74CD08()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1F039A988;
  if (!qword_1F039A988)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1F039A988);
    return ObjCClassMetadata;
  }
  return v2;
}

id sub_1DC74CD6C()
{
  id v0;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_1DC74D7F8();
}

void sub_1DC74CD98(uint64_t a1, id a2, void *a3)
{
  id v3;
  id v4;
  id v5;
  unint64_t v6;
  id v7;
  unint64_t v8;
  id v9;
  uint64_t v13;
  id v14;

  v3 = a2;
  v4 = a3;
  v13 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v7 = a3;
    v8 = sub_1DC74E218();
    sub_1DC74CED4(v13, (uint64_t)a3, v8);
  }
  else
  {
    v5 = a2;
    if (a2)
    {
      v9 = a2;
    }
    else
    {
      sub_1DC76F764();
      __break(1u);
    }
    v14 = v9;
    v6 = sub_1DC74E218();
    sub_1DC74CF2C(v13, (uint64_t)&v14, v6);
  }

}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC74CEAC()
{
  swift_bridgeObjectRelease();
}

uint64_t sub_1DC74CED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v7[2];

  v7[1] = a3;
  v7[0] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA08);
  return sub_1DC74D874((uint64_t)v7, a1, a3, v3);
}

uint64_t sub_1DC74CF2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA08);
  return sub_1DC74D824(a2, a1, a3);
}

uint64_t sub_1DC74D030(void *a1, void *a2, void *a3, const void *a4, void *a5)
{
  _QWORD *v5;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5[6] = a5;
  v5[5] = a3;
  v5[4] = a2;
  v5[3] = a1;
  v5[2] = v5;
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v5[7] = _Block_copy(a4);
  v10 = a5;
  v23 = sub_1DC76F3F8();
  v5[8] = v23;
  v19 = sub_1DC76F44C();
  v20 = v11;
  v5[9] = v11;
  v21 = sub_1DC76F44C();
  v22 = v12;
  v5[10] = v12;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v18 + 88) = v13;
  *v13 = *(_QWORD *)(v18 + 16);
  v13[1] = sub_1DC74D158;
  return sub_1DC74C028(v23, v19, v20, v21, v22);
}

_QWORD *sub_1DC74D158()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void (**aBlock)(void *, _QWORD);
  void *v10;
  void (**v11)(void);
  void *v12;
  _QWORD *v13;
  _QWORD *v14;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v13 = (_QWORD *)(v2 + 16);
  v14 = (_QWORD *)(v2 + 16);
  swift_task_dealloc();
  if (v0)
  {
    aBlock = (void (**)(void *, _QWORD))v13[5];
    v8 = (id)sub_1DC76EF60();
    aBlock[2](aBlock, 0);

    _Block_release(aBlock);
  }
  else
  {
    v11 = (void (**)(void))v13[5];
    v10 = (void *)sub_1DC76F3EC();
    v11[2]();

    _Block_release(v11);
    swift_bridgeObjectRelease();
  }
  v7 = (void *)v13[4];
  v4 = (void *)v13[3];
  v5 = (void *)v13[2];
  v6 = (void *)v13[1];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v14 + 8))(v14);
}

uint64_t sub_1DC74D2E8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_1DC74D344()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  void *v4;
  void *v5;
  const void *v6;
  void *v7;
  void *v8;

  *(_QWORD *)(v1 + 16) = v1;
  v8 = (void *)v0[2];
  v4 = (void *)v0[3];
  v5 = (void *)v0[4];
  v6 = (const void *)v0[5];
  v7 = (void *)v0[6];
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_1DC74D408;
  return ((uint64_t (*)(void *, void *, void *, const void *, void *))((char *)&dword_1F039A990
                                                                               + dword_1F039A990))(v8, v4, v5, v6, v7);
}

uint64_t sub_1DC74D408()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_1DC74D468(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  char *v22;

  v16 = a1;
  v15 = a2;
  v14 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601E0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78]();
  v22 = (char *)&v13 - v14;
  v2 = sub_1DC76F590();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v22, 1);
  v17 = 48;
  v18 = 7;
  v3 = swift_allocObject();
  v4 = v15;
  v5 = (_QWORD *)v3;
  v6 = v16;
  v21 = v5;
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v6;
  v5[5] = v4;
  v19 = v5[2];
  v20 = v5[3];
  swift_unknownObjectRetain();
  v7 = swift_allocObject();
  v8 = v20;
  v9 = v21;
  v10 = (_QWORD *)v7;
  v11 = (uint64_t)v22;
  v10[2] = v19;
  v10[3] = v8;
  v10[4] = &unk_1F039A9D8;
  v10[5] = v9;
  sub_1DC74DD5C(v11, (uint64_t)&unk_1F039A9E8, (uint64_t)v10);
  return swift_release();
}

id AMDSwiftClient.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AMDSwiftClient.init()()
{
  id v0;
  id v2;
  objc_super v3;
  id v4;

  v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for AMDSwiftClient();
  v2 = objc_msgSendSuper2(&v3, sel_init);
  v0 = v2;
  v4 = v2;

  return v2;
}

uint64_t type metadata accessor for AMDSwiftClient()
{
  return objc_opt_self();
}

id AMDSwiftClient.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMDSwiftClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for AMDSwiftClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AMDSwiftClient.queryLLM(requestPayload:usecase:capability:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v6 + 16) = v6;
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)((*v5 & *MEMORY[0x1E0DEEDD8])
                                                                                        + 0x50)
                                                                            + **(int **)((*v5 & *MEMORY[0x1E0DEEDD8])
                                                                                       + 0x50));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 24) = v7;
  *v7 = *(_QWORD *)(v6 + 16);
  v7[1] = sub_1DC74D790;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t sub_1DC74D790(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

id sub_1DC74D7F8()
{
  void *v0;

  return objc_msgSend(v0, sel_init);
}

void sub_1DC74D818()
{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t sub_1DC74D824(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(*(_QWORD *)(*(_QWORD *)(a2 + 64) + 40), a1);
  return swift_continuation_throwingResume();
}

uint64_t sub_1DC74D874(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  swift_allocError();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(v4, a1);
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_1DC74D8E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  *(_QWORD *)(v3 + 16) = v3;
  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v4;
  *v4 = *(_QWORD *)(v3 + 16);
  v4[1] = sub_1DC74D960;
  return v6();
}

uint64_t sub_1DC74D960()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_1DC74D9C0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC74DA04()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  int *v5;
  uint64_t v6;

  *(_QWORD *)(v1 + 16) = v1;
  v6 = v0[2];
  v4 = v0[3];
  v5 = (int *)v0[4];
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_1DC74DABC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1F039A9D0 + dword_1F039A9D0))(v6, v4, v5);
}

uint64_t sub_1DC74DABC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_1DC74DB1C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  *(_QWORD *)(v4 + 16) = v4;
  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 24) = v5;
  *v5 = *(_QWORD *)(v4 + 16);
  v5[1] = sub_1DC74DB98;
  return v7();
}

uint64_t sub_1DC74DB98()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_1DC74DBF8()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC74DC3C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  int *v7;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = v1[2];
  v6 = v1[3];
  v7 = (int *)v1[4];
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_1DC74DCFC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1F039A9E0 + dword_1F039A9E0))(a1, v5, v6, v7);
}

uint64_t sub_1DC74DCFC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_1DC74DD5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;

  v9 = sub_1DC76F590();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 48))(a1, 1) == 1)
  {
    sub_1DC74DF7C(a1);
  }
  else
  {
    sub_1DC76F584();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  }
  v5 = *(_QWORD *)(a3 + 16);
  swift_unknownObjectRetain();
  if (v5)
  {
    swift_getObjectType();
    sub_1DC76F578();
    swift_unknownObjectRelease();
  }
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a2;
  *(_QWORD *)(v4 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1DC74DF7C(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1DC76F590();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DC74DFEC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_1DC74E070;
  return v5(a1);
}

uint64_t sub_1DC74E070()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_1DC74E0D4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC74E110(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int *v5;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(int **)(v1 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_1DC74E1B8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F039A9F0 + dword_1F039A9F0))(a1, v5);
}

uint64_t sub_1DC74E1B8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

unint64_t sub_1DC74E218()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1F039AA00;
  if (!qword_1F039AA00)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1F039AA00);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1DC74E27C()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1DC76F464();
  qword_1F039AE50 = result;
  qword_1F039AE58 = v1;
  return result;
}

uint64_t *sub_1DC74E2BC()
{
  if (qword_1F039ACA0 != -1)
    swift_once();
  return &qword_1F039AE50;
}

uint64_t sub_1DC74E310()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1DC76F464();
  qword_1F039AE60 = result;
  qword_1F039AE68 = v1;
  return result;
}

uint64_t *sub_1DC74E350()
{
  if (qword_1F039ACA8 != -1)
    swift_once();
  return &qword_1F039AE60;
}

uint64_t sub_1DC74E3A4()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1DC76F464();
  qword_1F039AE70 = result;
  qword_1F039AE78 = v1;
  return result;
}

uint64_t *sub_1DC74E3E4()
{
  if (qword_1F039ACB0 != -1)
    swift_once();
  return &qword_1F039AE70;
}

uint64_t sub_1DC74E438()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1DC76F464();
  qword_1F039AE80 = result;
  qword_1F039AE88 = v1;
  return result;
}

uint64_t *sub_1DC74E478()
{
  if (qword_1F039ACB8 != -1)
    swift_once();
  return &qword_1F039AE80;
}

uint64_t sub_1DC74E548()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19AppleMediaDiscovery18FitCoreDQueryClass_tableUpdateSummary);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_1DC74E620(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  swift_bridgeObjectRetain();
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC19AppleMediaDiscovery18FitCoreDQueryClass_tableUpdateSummary);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DC74E6A0())()
{
  swift_beginAccess();
  return sub_1DC74E6F0;
}

uint64_t sub_1DC74E6F0()
{
  return swift_endAccess();
}

uint64_t sub_1DC74E794()
{
  uint64_t v0;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC19AppleMediaDiscovery18FitCoreDQueryClass_allFitnessTables);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  swift_endAccess();
  return v3;
}

uint64_t sub_1DC74E858(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  swift_bridgeObjectRetain();
  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC19AppleMediaDiscovery18FitCoreDQueryClass_allFitnessTables);
  swift_beginAccess();
  *v3 = a1;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DC74E8D8())()
{
  swift_beginAccess();
  return sub_1DC74E928;
}

uint64_t sub_1DC74E928()
{
  return swift_endAccess();
}

uint64_t sub_1DC74E964(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 2352) = a1;
  *(_QWORD *)(v2 + 2200) = v2;
  *(_QWORD *)(v2 + 2208) = 0;
  *(_QWORD *)(v2 + 2216) = 0;
  *(_QWORD *)(v2 + 2224) = 0;
  *(_BYTE *)(v2 + 2568) = 0;
  *(_BYTE *)(v2 + 2576) = 0;
  *(_QWORD *)(v2 + 2240) = 0;
  *(_QWORD *)(v2 + 2248) = 0;
  *(_QWORD *)(v2 + 1624) = 0;
  *(_QWORD *)(v2 + 1632) = 0;
  *(_QWORD *)(v2 + 2280) = 0;
  *(_QWORD *)(v2 + 2296) = 0;
  *(_QWORD *)(v2 + 1848) = 0;
  *(_QWORD *)(v2 + 1856) = 0;
  *(_QWORD *)(v2 + 2312) = 0;
  *(_QWORD *)(v2 + 2328) = 0;
  *(_QWORD *)(v2 + 2344) = 0;
  v3 = sub_1DC76F200();
  *(_QWORD *)(v2 + 2360) = v3;
  *(_QWORD *)(v2 + 2368) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 2376) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA28);
  *(_QWORD *)(v2 + 2384) = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA30);
  *(_QWORD *)(v2 + 2392) = v4;
  *(_QWORD *)(v2 + 2400) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 2408) = swift_task_alloc();
  v5 = sub_1DC76F068();
  *(_QWORD *)(v2 + 2416) = v5;
  *(_QWORD *)(v2 + 2424) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 2432) = swift_task_alloc();
  v6 = sub_1DC76F014();
  *(_QWORD *)(v2 + 2440) = v6;
  *(_QWORD *)(v2 + 2448) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v2 + 2456) = swift_task_alloc();
  *(_QWORD *)(v2 + 2464) = sub_1DC76F08C();
  *(_QWORD *)(v2 + 2472) = swift_task_alloc();
  *(_QWORD *)(v2 + 2480) = swift_task_alloc();
  *(_QWORD *)(v2 + 2488) = swift_task_alloc();
  *(_QWORD *)(v2 + 2496) = swift_task_alloc();
  *(_QWORD *)(v2 + 2504) = swift_task_alloc();
  *(_QWORD *)(v2 + 2512) = swift_task_alloc();
  *(_QWORD *)(v2 + 2520) = swift_task_alloc();
  *(_QWORD *)(v2 + 2528) = swift_task_alloc();
  *(_QWORD *)(v2 + 2536) = swift_task_alloc();
  *(_QWORD *)(v2 + 2544) = swift_task_alloc();
  *(_QWORD *)(v2 + 2208) = a1;
  *(_QWORD *)(v2 + 2216) = v1;
  return swift_task_switch();
}

uint64_t sub_1DC74EBEC()
{
  _QWORD *v0;
  uint64_t *v1;
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
  uint64_t v13;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  char v71;
  char v72;
  char v73;

  v0[275] = v0;
  v0[278] = sub_1DC76F74C();
  v1 = sub_1DC74E2BC();
  v68 = *v1;
  v69 = v1[1];
  swift_bridgeObjectRetain();
  v0[193] = v68;
  v0[194] = v69;
  MEMORY[0x1DF0CCDA0]();
  sub_1DC74CCE0();
  if (v0[5])
  {
    sub_1DC751DA4(v67 + 16, v67 + 272);
    if (!*(_QWORD *)(v67 + 296))
      return sub_1DC76F6C8();
    sub_1DC751E1C(v67 + 272, v67 + 240);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
    swift_dynamicCast();
    *(_QWORD *)(v67 + 2280) = *(_QWORD *)(v67 + 2272);
    *(_QWORD *)(v67 + 1640) = sub_1DC76F464();
    *(_QWORD *)(v67 + 1648) = v2;
    MEMORY[0x1DF0CCDA0]();
    sub_1DC74CCE0();
    if (*(_QWORD *)(v67 + 328))
    {
      sub_1DC7521C0(v67 + 304);
      *(_QWORD *)(v67 + 2168) = sub_1DC76F464();
      *(_QWORD *)(v67 + 2176) = v3;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 1512))
        return sub_1DC76F6C8();
      v66 = *(_QWORD **)(v67 + 2544);
      sub_1DC751E1C(v67 + 1488, v67 + 1456);
      swift_dynamicCast();
      v4 = *(_QWORD *)(v67 + 2192);
      *v66 = *(_QWORD *)(v67 + 2184);
      v66[1] = v4;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA38);
      sub_1DC76F53C();
    }
    else
    {
      sub_1DC7521C0(v67 + 304);
    }
    *(_QWORD *)(v67 + 1656) = sub_1DC76F464();
    *(_QWORD *)(v67 + 1664) = v5;
    MEMORY[0x1DF0CCDA0]();
    sub_1DC74CCE0();
    if (*(_QWORD *)(v67 + 360))
    {
      sub_1DC7521C0(v67 + 336);
      *(_QWORD *)(v67 + 2136) = sub_1DC76F464();
      *(_QWORD *)(v67 + 2144) = v6;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 1448))
        return sub_1DC76F6C8();
      v65 = *(_QWORD **)(v67 + 2536);
      sub_1DC751E1C(v67 + 1424, v67 + 1392);
      swift_dynamicCast();
      v7 = *(_QWORD *)(v67 + 2160);
      *v65 = *(_QWORD *)(v67 + 2152);
      v65[1] = v7;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA38);
      sub_1DC76F53C();
    }
    else
    {
      sub_1DC7521C0(v67 + 336);
    }
    *(_QWORD *)(v67 + 1672) = sub_1DC76F464();
    *(_QWORD *)(v67 + 1680) = v8;
    MEMORY[0x1DF0CCDA0]();
    sub_1DC74CCE0();
    if (*(_QWORD *)(v67 + 392))
    {
      sub_1DC7521C0(v67 + 368);
      *(_QWORD *)(v67 + 2104) = sub_1DC76F464();
      *(_QWORD *)(v67 + 2112) = v9;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 1384))
        return sub_1DC76F6C8();
      v64 = *(_QWORD **)(v67 + 2528);
      sub_1DC751E1C(v67 + 1360, v67 + 1328);
      swift_dynamicCast();
      v10 = *(_QWORD *)(v67 + 2128);
      *v64 = *(_QWORD *)(v67 + 2120);
      v64[1] = v10;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA38);
      sub_1DC76F53C();
    }
    else
    {
      sub_1DC7521C0(v67 + 368);
    }
    *(_QWORD *)(v67 + 1688) = sub_1DC76F464();
    *(_QWORD *)(v67 + 1696) = v11;
    MEMORY[0x1DF0CCDA0]();
    sub_1DC74CCE0();
    if (*(_QWORD *)(v67 + 424))
    {
      sub_1DC7521C0(v67 + 400);
      *(_QWORD *)(v67 + 2072) = sub_1DC76F464();
      *(_QWORD *)(v67 + 2080) = v12;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 1320))
        return sub_1DC76F6C8();
      v63 = *(_QWORD **)(v67 + 2520);
      sub_1DC751E1C(v67 + 1296, v67 + 1264);
      swift_dynamicCast();
      v13 = *(_QWORD *)(v67 + 2096);
      *v63 = *(_QWORD *)(v67 + 2088);
      v63[1] = v13;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA38);
      sub_1DC76F53C();
    }
    else
    {
      sub_1DC7521C0(v67 + 400);
    }
    *(_QWORD *)(v67 + 1704) = sub_1DC76F464();
    *(_QWORD *)(v67 + 1712) = v14;
    MEMORY[0x1DF0CCDA0]();
    sub_1DC74CCE0();
    if (*(_QWORD *)(v67 + 456))
    {
      sub_1DC7521C0(v67 + 432);
      *(_QWORD *)(v67 + 2040) = sub_1DC76F464();
      *(_QWORD *)(v67 + 2048) = v15;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 1256))
        return sub_1DC76F6C8();
      v62 = *(_QWORD **)(v67 + 2512);
      sub_1DC751E1C(v67 + 1232, v67 + 1200);
      swift_dynamicCast();
      v16 = *(_QWORD *)(v67 + 2064);
      *v62 = *(_QWORD *)(v67 + 2056);
      v62[1] = v16;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA38);
      sub_1DC76F53C();
    }
    else
    {
      sub_1DC7521C0(v67 + 432);
    }
    *(_QWORD *)(v67 + 1720) = sub_1DC76F464();
    *(_QWORD *)(v67 + 1728) = v17;
    MEMORY[0x1DF0CCDA0]();
    sub_1DC74CCE0();
    if (*(_QWORD *)(v67 + 488))
    {
      sub_1DC7521C0(v67 + 464);
      *(_QWORD *)(v67 + 2008) = sub_1DC76F464();
      *(_QWORD *)(v67 + 2016) = v18;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 1192))
        return sub_1DC76F6C8();
      v61 = *(_QWORD **)(v67 + 2504);
      sub_1DC751E1C(v67 + 1168, v67 + 1136);
      swift_dynamicCast();
      v19 = *(_QWORD *)(v67 + 2032);
      *v61 = *(_QWORD *)(v67 + 2024);
      v61[1] = v19;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA38);
      sub_1DC76F53C();
    }
    else
    {
      sub_1DC7521C0(v67 + 464);
    }
    *(_QWORD *)(v67 + 1736) = sub_1DC76F464();
    *(_QWORD *)(v67 + 1744) = v20;
    MEMORY[0x1DF0CCDA0]();
    sub_1DC74CCE0();
    if (*(_QWORD *)(v67 + 520))
    {
      sub_1DC7521C0(v67 + 496);
      *(_QWORD *)(v67 + 1976) = sub_1DC76F464();
      *(_QWORD *)(v67 + 1984) = v21;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 1128))
        return sub_1DC76F6C8();
      v60 = *(_QWORD **)(v67 + 2496);
      sub_1DC751E1C(v67 + 1104, v67 + 1072);
      swift_dynamicCast();
      v22 = *(_QWORD *)(v67 + 2000);
      *v60 = *(_QWORD *)(v67 + 1992);
      v60[1] = v22;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA38);
      sub_1DC76F53C();
    }
    else
    {
      sub_1DC7521C0(v67 + 496);
    }
    *(_QWORD *)(v67 + 1752) = sub_1DC76F464();
    *(_QWORD *)(v67 + 1760) = v23;
    MEMORY[0x1DF0CCDA0]();
    sub_1DC74CCE0();
    if (*(_QWORD *)(v67 + 552))
    {
      sub_1DC7521C0(v67 + 528);
      *(_QWORD *)(v67 + 1944) = sub_1DC76F464();
      *(_QWORD *)(v67 + 1952) = v24;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 1064))
        return sub_1DC76F6C8();
      v59 = *(_QWORD **)(v67 + 2488);
      sub_1DC751E1C(v67 + 1040, v67 + 1008);
      swift_dynamicCast();
      v25 = *(_QWORD *)(v67 + 1968);
      *v59 = *(_QWORD *)(v67 + 1960);
      v59[1] = v25;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA38);
      sub_1DC76F53C();
    }
    else
    {
      sub_1DC7521C0(v67 + 528);
    }
    *(_QWORD *)(v67 + 1768) = sub_1DC76F464();
    *(_QWORD *)(v67 + 1776) = v26;
    MEMORY[0x1DF0CCDA0]();
    sub_1DC74CCE0();
    if (*(_QWORD *)(v67 + 584))
    {
      sub_1DC7521C0(v67 + 560);
      *(_QWORD *)(v67 + 1912) = sub_1DC76F464();
      *(_QWORD *)(v67 + 1920) = v27;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 1000))
        return sub_1DC76F6C8();
      v58 = *(_QWORD **)(v67 + 2480);
      sub_1DC751E1C(v67 + 976, v67 + 944);
      swift_dynamicCast();
      v28 = *(_QWORD *)(v67 + 1936);
      *v58 = *(_QWORD *)(v67 + 1928);
      v58[1] = v28;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA38);
      sub_1DC76F53C();
    }
    else
    {
      sub_1DC7521C0(v67 + 560);
    }
    *(_QWORD *)(v67 + 1784) = sub_1DC76F464();
    *(_QWORD *)(v67 + 1792) = v29;
    MEMORY[0x1DF0CCDA0]();
    sub_1DC74CCE0();
    if (*(_QWORD *)(v67 + 616))
    {
      sub_1DC7521C0(v67 + 592);
      *(_QWORD *)(v67 + 1800) = sub_1DC76F464();
      *(_QWORD *)(v67 + 1808) = v30;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 680))
        return sub_1DC76F6C8();
      sub_1DC751E1C(v67 + 656, v67 + 624);
      swift_dynamicCast();
      *(_QWORD *)(v67 + 2296) = *(_QWORD *)(v67 + 2288);
      *(_QWORD *)(v67 + 1816) = sub_1DC76F464();
      *(_QWORD *)(v67 + 1824) = v31;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 744))
        return sub_1DC76F6C8();
      sub_1DC751E1C(v67 + 720, v67 + 688);
      swift_dynamicCast();
      v32 = *(_QWORD *)(v67 + 1840);
      *(_QWORD *)(v67 + 1848) = *(_QWORD *)(v67 + 1832);
      *(_QWORD *)(v67 + 1856) = v32;
      *(_QWORD *)(v67 + 1864) = sub_1DC76F464();
      *(_QWORD *)(v67 + 1872) = v33;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 808))
        return sub_1DC76F6C8();
      sub_1DC751E1C(v67 + 784, v67 + 752);
      swift_dynamicCast();
      *(_QWORD *)(v67 + 2312) = *(_QWORD *)(v67 + 2304);
      *(_QWORD *)(v67 + 1880) = sub_1DC76F464();
      *(_QWORD *)(v67 + 1888) = v34;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 872))
        return sub_1DC76F6C8();
      sub_1DC751E1C(v67 + 848, v67 + 816);
      swift_dynamicCast();
      *(_QWORD *)(v67 + 2328) = *(_QWORD *)(v67 + 2320);
      *(_QWORD *)(v67 + 1896) = sub_1DC76F464();
      *(_QWORD *)(v67 + 1904) = v35;
      MEMORY[0x1DF0CCDA0]();
      sub_1DC74CCE0();
      if (!*(_QWORD *)(v67 + 936))
        return sub_1DC76F6C8();
      sub_1DC751E1C(v67 + 912, v67 + 880);
      swift_dynamicCast();
      *(_QWORD *)(v67 + 2344) = *(_QWORD *)(v67 + 2336);
      sub_1DC76F59C();
      sub_1DC76F59C();
      sub_1DC76F59C();
      sub_1DC76F020();
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA38);
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1DC7521C0(v67 + 592);
    }
    swift_bridgeObjectRelease();
  }
  v37 = sub_1DC74E350();
  v56 = *v37;
  v57 = v37[1];
  swift_bridgeObjectRetain();
  *(_QWORD *)(v67 + 1560) = v56;
  *(_QWORD *)(v67 + 1568) = v57;
  MEMORY[0x1DF0CCDA0]();
  sub_1DC74CCE0();
  if (!*(_QWORD *)(v67 + 72))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
    sub_1DC76F74C();
    v53 = v38;
    *v38 = sub_1DC76F464();
    v53[1] = v39;
    v40 = sub_1DC76F464();
    v53[5] = MEMORY[0x1E0DEA968];
    v53[2] = v40;
    v53[3] = v41;
    sub_1DC74CCA0();
    v54 = sub_1DC76F410();
    sub_1DC7521C0(v67 + 48);
    sub_1DC7521C0(v67 + 16);
    sub_1DC752268();
    v55 = v54;
LABEL_81:
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
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v67 + 2200) + 8))(v55);
  }
  sub_1DC751DA4(v67 + 48, v67 + 112);
  if (!*(_QWORD *)(v67 + 136))
    return sub_1DC76F6C8();
  sub_1DC751E1C(v67 + 112, v67 + 80);
  swift_dynamicCast();
  v71 = sub_1DC76F098();
  if (v71 == 2)
    v70 = 1;
  else
    v70 = v71 & 1;
  *(_BYTE *)(v67 + 2568) = v70 & 1;
  v42 = sub_1DC74E3E4();
  v51 = *v42;
  v52 = v42[1];
  swift_bridgeObjectRetain();
  *(_QWORD *)(v67 + 1592) = v51;
  *(_QWORD *)(v67 + 1600) = v52;
  MEMORY[0x1DF0CCDA0]();
  sub_1DC74CCE0();
  if (!*(_QWORD *)(v67 + 168))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
    sub_1DC76F74C();
    v49 = v43;
    *v43 = sub_1DC76F464();
    v49[1] = v44;
    v45 = sub_1DC76F464();
    v49[5] = MEMORY[0x1E0DEA968];
    v49[2] = v45;
    v49[3] = v46;
    sub_1DC74CCA0();
    v50 = sub_1DC76F410();
    sub_1DC7521C0(v67 + 144);
    sub_1DC7521C0(v67 + 48);
    sub_1DC7521C0(v67 + 16);
    sub_1DC752268();
    v55 = v50;
    goto LABEL_81;
  }
  sub_1DC751DA4(v67 + 144, v67 + 208);
  if (!*(_QWORD *)(v67 + 232))
    return sub_1DC76F6C8();
  sub_1DC751E1C(v67 + 208, v67 + 176);
  swift_dynamicCast();
  v73 = MEMORY[0x1DF0CC9B0](*(_QWORD *)(v67 + 1608), *(_QWORD *)(v67 + 1616));
  if (v73 == 8)
    v72 = 5;
  else
    v72 = v73;
  *(_BYTE *)(v67 + 2576) = v72;
  v48 = *(_QWORD *)(v67 + 2224);
  swift_bridgeObjectRetain();
  *(_QWORD *)(v67 + 2232) = v48;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA38);
  sub_1DC751E38();
  sub_1DC751EA8();
  sub_1DC76F5D8();
  sub_1DC751F8C();
  sub_1DC76F008();
  *(_QWORD *)(v67 + 2240) = sub_1DC76F74C();
  sub_1DC76F368();
  sub_1DC751FFC();
  sub_1DC75210C();
  sub_1DC76F35C();
  sub_1DC76F32C();
  swift_release();
  v47 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v67 + 2552) = v47;
  *v47 = *(_QWORD *)(v67 + 2200);
  v47[1] = sub_1DC751650;
  return sub_1DC76F218();
}

uint64_t sub_1DC751650()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = *v1;
  v4 = (_QWORD *)(*v1 + 16);
  *(_QWORD *)(v2 + 2200) = *v1;
  *(_QWORD *)(v2 + 2560) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v4[298] + 8))(v4[299], v4[297]);
  return swift_task_switch();
}

uint64_t sub_1DC751714()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  *(_QWORD *)(v0 + 2200) = v0;
  *(_QWORD *)(v0 + 2264) = sub_1DC76F05C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA50);
  sub_1DC752290();
  sub_1DC76F5E4();
  while (1)
  {
    v17 = v19[298];
    v16 = v19[296];
    v18 = v19[295];
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA60);
    sub_1DC76F698();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v17, 1, v18) == 1)
      break;
    v14 = v19[297];
    v13 = v19[296];
    v15 = v19[295];
    (*(void (**)(uint64_t, _QWORD))(v13 + 32))(v14, v19[298]);
    sub_1DC76F1F4();
    sub_1DC76F548();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  }
  v11 = v19[307];
  v9 = v19[306];
  v10 = v19[305];
  v6 = v19[304];
  v4 = v19[303];
  v5 = v19[302];
  sub_1DC752300();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
  sub_1DC76F74C();
  v7 = v1;
  *v1 = sub_1DC76F464();
  v7[1] = v2;
  v8 = v19[280];
  swift_bridgeObjectRetain();
  v7[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601C8);
  v7[2] = v8;
  sub_1DC74CCA0();
  v12 = sub_1DC76F410();
  sub_1DC752198();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v10);
  sub_1DC7521C0((uint64_t)(v19 + 18));
  sub_1DC7521C0((uint64_t)(v19 + 6));
  sub_1DC7521C0((uint64_t)(v19 + 2));
  sub_1DC752268();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v19[275] + 8))(v12);
}

uint64_t sub_1DC751AF8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_0;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v12 = (id)v0[320];
  v15 = v0[307];
  v13 = v0[306];
  v14 = v0[305];
  v1 = v0[301];
  v2 = v0[300];
  v3 = v0[299];
  v0[275] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = v12;
  v0[281] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
  sub_1DC76F74C();
  v9 = v5;
  *v5 = sub_1DC76F464();
  v9[1] = v6;
  swift_getErrorValue();
  v10 = v0[190];
  v11 = v0[191];
  v9[5] = v11;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v9 + 2);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_0, v10);
  sub_1DC74CCA0();
  v16 = sub_1DC76F410();

  sub_1DC752198();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v14);
  sub_1DC7521C0((uint64_t)(v0 + 18));
  sub_1DC7521C0((uint64_t)(v0 + 6));
  sub_1DC7521C0((uint64_t)(v0 + 2));
  sub_1DC752268();
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0[275] + 8))(v16);
}

uint64_t sub_1DC751DA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (*(_QWORD *)(a1 + 24))
  {
    v2 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a2 + 24) = v2;
    (**(void (***)(void))(v2 - 8))();
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  }
  return a2;
}

__n128 sub_1DC751E1C(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  result = *(__n128 *)(a1 + 16);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

unint64_t sub_1DC751E38()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1F039AA40;
  if (!qword_1F039AA40)
  {
    v0 = sub_1DC76F08C();
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0D933C8], v0);
    atomic_store(v1, (unint64_t *)&qword_1F039AA40);
    return v1;
  }
  return v3;
}

unint64_t sub_1DC751EA8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1F039AA48;
  if (!qword_1F039AA48)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F039AA38);
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEAF38], v0);
    atomic_store(v1, (unint64_t *)&qword_1F039AA48);
    return v1;
  }
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  if (*a1 < 0)
  {
    v2 = MEMORY[0x1DF0CD6F4](255, (char *)a1 + (int)*a1, -(*a1 >> 32), 0);
    *a1 = v2;
    return v2;
  }
  return v4;
}

uint64_t sub_1DC751F8C()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v4;

  v4 = sub_1DC75C914(0);
  if (sub_1DC75C9CC(v4))
  {
    sub_1DC75C9D4(v4);
    return v0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v2 = MEMORY[0x1E0DEE9E8];
    swift_retain();
    return v2;
  }
}

uint64_t sub_1DC751FFC()
{
  uint64_t v0;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9[5];

  v5 = 0;
  v4 = sub_1DC76F38C();
  v3 = *(_QWORD *)(v4 - 8);
  v2 = (*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v6 = (char *)&v2 - v2;
  sub_1DC75D79C();
  v8 = sub_1DC76F608();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E0D8EF50], v4);
  v0 = sub_1DC76F380();
  v7 = v9;
  v9[3] = v0;
  v9[4] = MEMORY[0x1E0D8EF38];
  __swift_allocate_boxed_opaque_existential_1(v9);
  sub_1DC76F374();
  sub_1DC76F3A4();
  swift_allocObject();
  return sub_1DC76F398();
}

uint64_t sub_1DC75210C()
{
  sub_1DC75D79C();
  return sub_1DC76F608();
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;

  v3 = result;
  if ((*(_DWORD *)(*(_QWORD *)(result[3] - 8) + 80) & 0x20000) != 0)
  {
    v1 = swift_allocBox();
    result = v2;
    *v3 = v1;
  }
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC752198()
{
  swift_bridgeObjectRelease();
}

uint64_t sub_1DC7521C0(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_0(a1);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC752268()
{
  swift_bridgeObjectRelease();
}

unint64_t sub_1DC752290()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1F039AA58;
  if (!qword_1F039AA58)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F039AA50);
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEAF50], v0);
    atomic_store(v1, (unint64_t *)&qword_1F039AA58);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC752300()
{
  swift_bridgeObjectRelease();
}

uint64_t sub_1DC7523B4(void *a1, const void *a2, void *a3)
{
  _QWORD *v3;
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v10;
  uint64_t v11;

  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  v5 = a1;
  v3[5] = _Block_copy(a2);
  v6 = a3;
  v11 = sub_1DC76F3F8();
  v3[6] = v11;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 56) = v7;
  *v7 = *(_QWORD *)(v10 + 16);
  v7[1] = sub_1DC75247C;
  return sub_1DC74E964(v11);
}

uint64_t sub_1DC75247C()
{
  uint64_t *v0;
  void *v2;
  void *v3;
  id v4;
  void (**aBlock)(void);
  uint64_t v6;

  v6 = *v0;
  aBlock = *(void (***)(void))(*v0 + 40);
  v3 = *(void **)(*v0 + 32);
  v2 = *(void **)(*v0 + 24);
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  v4 = (id)sub_1DC76F3EC();
  aBlock[2]();

  _Block_release(aBlock);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v6 + 16) + 8))();
}

uint64_t sub_1DC752568()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1DC7525B4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  const void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)(v1 + 16) = v1;
  v6 = (void *)v0[2];
  v4 = (const void *)v0[3];
  v5 = (void *)v0[4];
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_1DC752660;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_1F039AA68 + dword_1F039AA68))(v6, v4, v5);
}

uint64_t sub_1DC752660()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_1DC7526C0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[43] = a1;
  v2[31] = v2;
  v2[32] = 0;
  v2[33] = 0;
  v2[35] = 0;
  v2[37] = 0;
  v2[38] = 0;
  v2[40] = 0;
  v2[42] = 0;
  memset(v2 + 7, 0, 0x28uLL);
  v2[25] = 0;
  v2[26] = 0;
  v3 = sub_1DC76F1E8();
  v2[44] = v3;
  v2[45] = *(_QWORD *)(v3 - 8);
  v2[46] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60148);
  v2[47] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA80);
  v2[48] = v4;
  v2[49] = *(_QWORD *)(v4 - 8);
  v2[50] = swift_task_alloc();
  v2[32] = a1;
  v2[33] = v1;
  return swift_task_switch();
}

uint64_t sub_1DC7527F4()
{
  _QWORD *v0;
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v0[31] = v0;
  v1 = sub_1DC74E478();
  v7 = *v1;
  v8 = v1[1];
  swift_bridgeObjectRetain();
  v0[23] = v7;
  v0[24] = v8;
  MEMORY[0x1DF0CCDA0]();
  sub_1DC74CCE0();
  if (!v0[19])
    return sub_1DC76F6C8();
  sub_1DC751E1C((uint64_t)(v6 + 16), (uint64_t)(v6 + 12));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601C8);
  swift_dynamicCast();
  v4 = v6[34];
  v6[51] = v4;
  v6[35] = v4;
  swift_bridgeObjectRetain();
  v6[36] = v4;
  sub_1DC7531A8();
  v5 = sub_1DC76F5D8();
  v6[52] = v5;
  v6[37] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601A0);
  sub_1DC76F74C();
  v6[38] = sub_1DC76F410();
  sub_1DC76F368();
  sub_1DC751FFC();
  sub_1DC75210C();
  sub_1DC76F35C();
  sub_1DC76F320();
  swift_release();
  v3 = (_QWORD *)swift_task_alloc();
  v6[53] = v3;
  *v3 = v6[31];
  v3[1] = sub_1DC752B00;
  return sub_1DC76F218();
}

uint64_t sub_1DC752B00()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 248) = *v1;
  v2 += 248;
  v4 = (_QWORD *)(v2 - 232);
  *(_QWORD *)(v2 + 184) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v4[47] + 8))(v4[48], v4[46]);
  return swift_task_switch();
}

uint64_t sub_1DC752BC4()
{
  _QWORD *v0;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void *i;

  v0[31] = v0;
  v0[42] = v0[39];
  swift_bridgeObjectRetain();
  sub_1DC753240();
  sub_1DC76F5C0();
  memcpy(v0 + 7, v0 + 2, 0x28uLL);
  for (i = (void *)v0[54]; ; i = 0)
  {
    v14 = v16[47];
    v13 = v16[45];
    v15 = v16[44];
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60200);
    sub_1DC76F5CC();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v15) == 1)
      break;
    (*(void (**)(_QWORD, _QWORD))(v16[45] + 32))(v16[46], v16[47]);
    sub_1DC75332C();
    v12 = sub_1DC76F20C();
    if (i)
    {

      v10 = 0;
      v11 = 0;
    }
    else
    {
      v10 = v12;
      v11 = v1;
    }
    v8 = v16[46];
    v7 = v16[45];
    v9 = v16[44];
    v16[25] = v10;
    v16[26] = v11;
    v5 = sub_1DC76F128();
    v6 = v2;
    swift_bridgeObjectRetain();
    v16[27] = v10;
    v16[28] = v11;
    v16[29] = v5;
    v16[30] = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA90);
    sub_1DC76F434();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  }
  sub_1DC7532B0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v4 = sub_1DC76F6E0();
  swift_bridgeObjectRelease();
  sub_1DC753218();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v16[31] + 8))(v4);
}

uint64_t sub_1DC752FD8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_0;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v12 = (id)v0[54];
  v1 = v0[50];
  v2 = v0[49];
  v3 = v0[48];
  v0[31] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = v12;
  v0[40] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
  sub_1DC76F74C();
  v9 = v5;
  *v5 = sub_1DC76F464();
  v9[1] = v6;
  swift_getErrorValue();
  v10 = v0[20];
  v11 = v0[21];
  v9[5] = v11;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v9 + 2);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_0, v10);
  sub_1DC74CCA0();
  v13 = sub_1DC76F410();

  sub_1DC753218();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0[31] + 8))(v13);
}

unint64_t sub_1DC7531A8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EDB601D0;
  if (!qword_1EDB601D0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDB601C8);
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEAF38], v0);
    atomic_store(v1, (unint64_t *)&qword_1EDB601D0);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC753218()
{
  swift_bridgeObjectRelease();
}

unint64_t sub_1DC753240()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EDB60140;
  if (!qword_1EDB60140)
  {
    v0 = sub_1DC76F1E8();
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0D93F90], v0);
    atomic_store(v1, (unint64_t *)&qword_1EDB60140);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC7532B0()
{
  sub_1DC7532EC();
}

uint64_t sub_1DC7532EC()
{
  return swift_release();
}

unint64_t sub_1DC75332C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1F039AA88;
  if (!qword_1F039AA88)
  {
    v0 = sub_1DC76F1E8();
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0D93F78], v0);
    atomic_store(v1, (unint64_t *)&qword_1F039AA88);
    return v1;
  }
  return v3;
}

uint64_t sub_1DC753428(void *a1, const void *a2, void *a3)
{
  _QWORD *v3;
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v10;
  uint64_t v11;

  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  v5 = a1;
  v3[5] = _Block_copy(a2);
  v6 = a3;
  v11 = sub_1DC76F3F8();
  v3[6] = v11;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 56) = v7;
  *v7 = *(_QWORD *)(v10 + 16);
  v7[1] = sub_1DC7534F0;
  return sub_1DC7526C0(v11);
}

uint64_t sub_1DC7534F0()
{
  uint64_t *v0;
  void *v2;
  void *v3;
  id v4;
  void (**aBlock)(void);
  uint64_t v6;

  v6 = *v0;
  aBlock = *(void (***)(void))(*v0 + 40);
  v3 = *(void **)(*v0 + 32);
  v2 = *(void **)(*v0 + 24);
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  v4 = (id)sub_1DC76F3EC();
  aBlock[2]();

  _Block_release(aBlock);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v6 + 16) + 8))();
}

uint64_t sub_1DC7535DC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1DC753628()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  const void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)(v1 + 16) = v1;
  v6 = (void *)v0[2];
  v4 = (const void *)v0[3];
  v5 = (void *)v0[4];
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_1DC7536D4;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_1F039AA98 + dword_1F039AA98))(v6, v4, v5);
}

uint64_t sub_1DC7536D4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_1DC753734(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[7] = v2;
  v2[8] = 0;
  v2[9] = 0;
  v2[10] = 0;
  v2[11] = 0;
  v2[5] = 0;
  v2[6] = 0;
  v3 = sub_1DC76F200();
  v2[14] = v3;
  v2[15] = *(_QWORD *)(v3 - 8);
  v2[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA28);
  v2[17] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA30);
  v2[18] = v4;
  v2[19] = *(_QWORD *)(v4 - 8);
  v2[20] = swift_task_alloc();
  v5 = sub_1DC76F068();
  v2[21] = v5;
  v2[22] = *(_QWORD *)(v5 - 8);
  v2[23] = swift_task_alloc();
  v6 = sub_1DC76F014();
  v2[24] = v6;
  v2[25] = *(_QWORD *)(v6 - 8);
  v2[26] = swift_task_alloc();
  v2[8] = a1;
  v2[9] = v1;
  return swift_task_switch();
}

uint64_t sub_1DC7538AC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  *(_QWORD *)(v0 + 56) = v0;
  sub_1DC751F8C();
  sub_1DC753F7C();
  sub_1DC76F008();
  *(_QWORD *)(v0 + 80) = sub_1DC76F74C();
  sub_1DC76F368();
  sub_1DC751FFC();
  sub_1DC75210C();
  sub_1DC76F35C();
  sub_1DC76F32C();
  swift_release();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 216) = v1;
  *v1 = *(_QWORD *)(v3 + 56);
  v1[1] = sub_1DC7539E8;
  return sub_1DC76F218();
}

uint64_t sub_1DC7539E8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = *v1;
  v2 += 56;
  v4 = (_QWORD *)(v2 - 40);
  *(_QWORD *)(v2 + 168) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v4[17] + 8))(v4[18], v4[16]);
  return swift_task_switch();
}

uint64_t sub_1DC753AAC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  *(_QWORD *)(v0 + 56) = v0;
  *(_QWORD *)(v0 + 104) = sub_1DC76F05C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA50);
  sub_1DC752290();
  sub_1DC76F5E4();
  while (1)
  {
    v17 = v19[17];
    v16 = v19[15];
    v18 = v19[14];
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA60);
    sub_1DC76F698();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v17, 1, v18) == 1)
      break;
    v14 = v19[16];
    v13 = v19[15];
    v15 = v19[14];
    (*(void (**)(uint64_t, _QWORD))(v13 + 32))(v14, v19[17]);
    sub_1DC76F1F4();
    sub_1DC76F548();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  }
  v11 = v19[26];
  v9 = v19[25];
  v10 = v19[24];
  v6 = v19[23];
  v4 = v19[22];
  v5 = v19[21];
  sub_1DC752300();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
  sub_1DC76F74C();
  v7 = v1;
  *v1 = sub_1DC76F464();
  v7[1] = v2;
  v8 = v19[10];
  swift_bridgeObjectRetain();
  v7[5] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601C8);
  v7[2] = v8;
  sub_1DC74CCA0();
  v12 = sub_1DC76F410();
  sub_1DC752198();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v11, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v19[7] + 8))(v12);
}

uint64_t sub_1DC753D98()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_0;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v12 = (id)v0[28];
  v15 = v0[26];
  v13 = v0[25];
  v14 = v0[24];
  v1 = v0[20];
  v2 = v0[19];
  v3 = v0[18];
  v0[7] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = v12;
  v0[11] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
  sub_1DC76F74C();
  v9 = v5;
  *v5 = sub_1DC76F464();
  v9[1] = v6;
  swift_getErrorValue();
  v10 = v0[2];
  v11 = v0[3];
  v9[5] = v11;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v9 + 2);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_0, v10);
  sub_1DC74CCA0();
  v16 = sub_1DC76F410();

  sub_1DC752198();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v15, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0[7] + 8))(v16);
}

uint64_t sub_1DC753F7C()
{
  uint64_t v0;
  uint64_t v2;
  uint64_t v4;

  v4 = sub_1DC75C914(0);
  if (sub_1DC75C9CC(v4))
  {
    sub_1DC75C9D4(v4);
    return v0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v2 = MEMORY[0x1E0DEE9E8];
    swift_retain();
    return v2;
  }
}

uint64_t sub_1DC754078(void *a1, const void *a2, void *a3)
{
  _QWORD *v3;
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v10;
  uint64_t v11;

  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  v5 = a1;
  v3[5] = _Block_copy(a2);
  v6 = a3;
  v11 = sub_1DC76F3F8();
  v3[6] = v11;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 56) = v7;
  *v7 = *(_QWORD *)(v10 + 16);
  v7[1] = sub_1DC754140;
  return sub_1DC753734(v11);
}

uint64_t sub_1DC754140()
{
  uint64_t *v0;
  void *v2;
  void *v3;
  id v4;
  void (**aBlock)(void);
  uint64_t v6;

  v6 = *v0;
  aBlock = *(void (***)(void))(*v0 + 40);
  v3 = *(void **)(*v0 + 32);
  v2 = *(void **)(*v0 + 24);
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  v4 = (id)sub_1DC76F3EC();
  aBlock[2]();

  _Block_release(aBlock);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v6 + 16) + 8))();
}

uint64_t sub_1DC75422C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1DC754278()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  const void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)(v1 + 16) = v1;
  v6 = (void *)v0[2];
  v4 = (const void *)v0[3];
  v5 = (void *)v0[4];
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_1DC754324;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_1F039AAB0 + dword_1F039AAB0))(v6, v4, v5);
}

uint64_t sub_1DC754324()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_1DC754384()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[8] = v0;
  v1[2] = v1;
  v1[3] = 0;
  v1[5] = 0;
  v1[7] = 0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60150);
  v1[9] = v2;
  v1[10] = *(_QWORD *)(v2 - 8);
  v1[11] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60158);
  v1[12] = v3;
  v1[13] = *(_QWORD *)(v3 - 8);
  v1[14] = swift_task_alloc();
  v1[3] = v0;
  return swift_task_switch();
}

uint64_t sub_1DC754450()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (_QWORD *)v0[8];
  v0[2] = v0;
  v5 = (id)objc_opt_self();
  (*(void (**)(void))((*v1 & *MEMORY[0x1E0DEEDD8]) + 0x78))();
  sub_1DC76F68C();
  v6 = (id)sub_1DC76F4F4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_deleteEventsWithPredicate_forStreams_, 0, v6);

  sub_1DC76F3F8();
  swift_bridgeObjectRelease();

  v0[15] = sub_1DC76F368();
  sub_1DC751FFC();
  sub_1DC75210C();
  v0[16] = sub_1DC76F35C();
  v2 = v1;
  v9 = swift_task_alloc();
  v0[17] = v9;
  *(_QWORD *)(v9 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 144) = v3;
  *v3 = *(_QWORD *)(v8 + 16);
  v3[1] = sub_1DC754600;
  return sub_1DC76F344();
}

uint64_t sub_1DC754600()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v5 = v2 + 16;
  *(_QWORD *)(v2 + 152) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v4 = *(void **)(v5 + 48);
    swift_task_dealloc();

    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_1DC7546D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v3;

  *(_QWORD *)(v0 + 16) = v0;
  sub_1DC751FFC();
  sub_1DC75210C();
  sub_1DC76F35C();
  sub_1DC76F338();
  swift_release();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 160) = v1;
  *v1 = *(_QWORD *)(v3 + 16);
  v1[1] = sub_1DC7547BC;
  return sub_1DC76F218();
}

uint64_t sub_1DC7547BC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v4 = (_QWORD *)(v2 + 16);
  *(_QWORD *)(v2 + 168) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v4[11] + 8))(v4[12], v4[10]);
  return swift_task_switch();
}

uint64_t sub_1DC754880()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;

  v1 = v0[21];
  v2 = (_QWORD *)v0[8];
  v0[2] = v0;
  v6 = v0[4];
  v0[22] = v6;
  v0[5] = v6;
  (*(void (**)(void))((*v2 & *MEMORY[0x1E0DEEDD8]) + 0xC0))();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)())(*(_QWORD *)(v5 + 16) + 8))();
  }
  else
  {
    sub_1DC751FFC();
    sub_1DC75210C();
    sub_1DC76F35C();
    sub_1DC76F350();
    swift_release();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v5 + 184) = v3;
    *v3 = *(_QWORD *)(v5 + 16);
    v3[1] = sub_1DC754A2C;
    return sub_1DC76F218();
  }
}

uint64_t sub_1DC754A2C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v4 = (_QWORD *)(v2 + 16);
  *(_QWORD *)(v2 + 192) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v4[8] + 8))(v4[9], v4[7]);
  return swift_task_switch();
}

uint64_t sub_1DC754AF0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v1 = v0[24];
  v2 = (_QWORD *)v0[8];
  v0[2] = v0;
  v0[7] = v0[6];
  v3 = (*(uint64_t (**)(void))((*v2 & *MEMORY[0x1E0DEEDD8]) + 0xB8))();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)())(*(_QWORD *)(v6 + 16) + 8))();
  }
  else
  {
    v5 = (*(uint64_t (**)(uint64_t))((**(_QWORD **)(v6 + 64) & *MEMORY[0x1E0DEEDD8]) + 0x60))(v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v6 + 16) + 8))(v5);
  }
}

uint64_t sub_1DC754C7C()
{
  uint64_t v0;
  id v2;

  v2 = *(id *)(v0 + 64);
  *(_QWORD *)(v0 + 16) = v0;
  swift_task_dealloc();

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(*(_QWORD *)(v0 + 16) + 8))();
}

uint64_t sub_1DC754D08()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[14];
  v2 = v0[13];
  v3 = v0[12];
  v0[2] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(v0[2] + 8))();
}

uint64_t sub_1DC754D80()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[11];
  v2 = v0[10];
  v3 = v0[9];
  v0[2] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)())(v0[2] + 8))();
}

uint64_t sub_1DC754E0C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[6] = a2;
  v2[5] = a1;
  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[3] = a1;
  v2[4] = a2;
  return swift_task_switch();
}

uint64_t sub_1DC754E54()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v1 = (_QWORD *)v0[6];
  v2 = v0[5];
  v0[2] = v0;
  (*(void (**)(uint64_t))((*v1 & *MEMORY[0x1E0DEEDD8]) + 0xC8))(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(v4 + 16) + 8))();
}

uint64_t sub_1DC754F1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;

  *(_QWORD *)(v2 + 16) = v2;
  v5 = *(_QWORD *)(v1 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_1DC754F9C;
  return sub_1DC754E0C(a1, v5);
}

uint64_t sub_1DC754F9C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_1DC755070(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;
  uint64_t v7;

  v2[3] = a2;
  v2[2] = v2;
  v2[4] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 40) = v5;
  *v5 = *(_QWORD *)(v7 + 16);
  v5[1] = sub_1DC7550F4;
  return sub_1DC754384();
}

_QWORD *sub_1DC7550F4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  id v4;
  void (**v5)(void *, _QWORD);
  id v6;
  void (**aBlock)(void);
  id v8;
  uint64_t v9;
  _QWORD *v10;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v9 = v2 + 16;
  v10 = (_QWORD *)(v2 + 16);
  swift_task_dealloc();
  if (v0)
  {
    v5 = *(void (***)(void *, _QWORD))(v9 + 16);
    v4 = (id)sub_1DC76EF60();
    v5[2](v5, 0);

    _Block_release(v5);
  }
  else
  {
    aBlock = *(void (***)(void))(v9 + 16);
    v6 = (id)sub_1DC76F3EC();
    aBlock[2]();

    _Block_release(aBlock);
    swift_bridgeObjectRelease();
  }

  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v10 + 8))(v10);
}

uint64_t sub_1DC755224()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_1DC755268()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v4;
  const void *v5;

  *(_QWORD *)(v1 + 16) = v1;
  v5 = *(const void **)(v0 + 16);
  v4 = *(void **)(v0 + 24);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_1DC755308;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1F039AAD8 + dword_1F039AAD8))(v5, v4);
}

uint64_t sub_1DC755308()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t sub_1DC755368(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[31] = v1;
  v2[30] = a1;
  v2[21] = v2;
  v2[22] = 0;
  v2[23] = 0;
  v2[24] = 0;
  v2[26] = 0;
  v2[28] = 0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AA80);
  v2[32] = v3;
  v2[33] = *(_QWORD *)(v3 - 8);
  v2[34] = swift_task_alloc();
  v2[22] = a1;
  v2[23] = v1;
  return swift_task_switch();
}

uint64_t sub_1DC755428()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;

  v0[21] = v0;
  v0[17] = sub_1DC76F464();
  v0[18] = v1;
  MEMORY[0x1DF0CCDA0]();
  sub_1DC74CCE0();
  if (v0[5])
  {
    sub_1DC7521C0((uint64_t)(v6 + 2));
    v6[19] = sub_1DC76F464();
    v6[20] = v2;
    MEMORY[0x1DF0CCDA0]();
    sub_1DC74CCE0();
    if (!v6[13])
      return sub_1DC76F6C8();
    sub_1DC751E1C((uint64_t)(v6 + 10), (uint64_t)(v6 + 6));
    swift_dynamicCast();
    v5 = v6[29];
  }
  else
  {
    sub_1DC7521C0((uint64_t)(v6 + 2));
    v5 = 1000;
  }
  v6[24] = v5;
  sub_1DC76F368();
  sub_1DC751FFC();
  sub_1DC75210C();
  sub_1DC76F35C();
  sub_1DC76F314();
  swift_release();
  v4 = (_QWORD *)swift_task_alloc();
  v6[35] = v4;
  *v4 = v6[21];
  v4[1] = sub_1DC7557A0;
  return sub_1DC76F218();
}

uint64_t sub_1DC7557A0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 168) = *v1;
  v2 += 168;
  v4 = (_QWORD *)(v2 - 152);
  *(_QWORD *)(v2 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v4[31] + 8))(v4[32], v4[30]);
  return swift_task_switch();
}

uint64_t sub_1DC755864()
{
  _QWORD *v0;
  void *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *boxed_opaque_existential_0;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v1 = (void *)v0[36];
  v2 = (_QWORD *)v0[31];
  v0[21] = v0;
  v0[28] = v0[25];
  (*(void (**)(void))((*v2 & *MEMORY[0x1E0DEEDD8]) + 0xC8))();
  if (v1)
  {
    swift_bridgeObjectRelease();
    v6 = v1;
    v16[26] = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
    sub_1DC76F74C();
    v10 = v7;
    v11 = v7 + 2;
    *v7 = sub_1DC76F464();
    v10[1] = v8;
    swift_getErrorValue();
    v12 = v16[14];
    v13 = v16[15];
    v10[5] = v13;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v11);
    (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(boxed_opaque_existential_0, v12);
    sub_1DC74CCA0();
    v14 = sub_1DC76F410();

    v15 = v14;
  }
  else
  {
    v3 = (_QWORD *)v16[31];
    v4 = swift_bridgeObjectRelease();
    v15 = (*(uint64_t (**)(uint64_t))((*v3 & *MEMORY[0x1E0DEEDD8]) + 0x60))(v4);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v16[21] + 8))(v15);
}

uint64_t sub_1DC755AC0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_0;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v1 = v0[34];
  v2 = v0[33];
  v3 = v0[32];
  v0[21] = v0;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v12 = (id)v0[36];
  v4 = v12;
  v0[26] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
  sub_1DC76F74C();
  v9 = v5;
  *v5 = sub_1DC76F464();
  v9[1] = v6;
  swift_getErrorValue();
  v10 = v0[14];
  v11 = v0[15];
  v9[5] = v11;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v9 + 2);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_0, v10);
  sub_1DC74CCA0();
  v13 = sub_1DC76F410();

  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0[21] + 8))(v13);
}

uint64_t sub_1DC755CD4(void *a1, const void *a2, void *a3)
{
  _QWORD *v3;
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v10;
  uint64_t v11;

  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  v5 = a1;
  v3[5] = _Block_copy(a2);
  v6 = a3;
  v11 = sub_1DC76F3F8();
  v3[6] = v11;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 56) = v7;
  *v7 = *(_QWORD *)(v10 + 16);
  v7[1] = sub_1DC755D9C;
  return sub_1DC755368(v11);
}

_QWORD *sub_1DC755D9C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;
  void *v5;
  id v6;
  void (**v7)(void *, _QWORD);
  id v8;
  void (**aBlock)(void);
  void *v10;
  _QWORD *v11;
  _QWORD *v12;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = *v1;
  v11 = (_QWORD *)(v2 + 16);
  v12 = (_QWORD *)(v2 + 16);
  swift_task_dealloc();
  if (v0)
  {
    v7 = (void (**)(void *, _QWORD))v11[3];
    v6 = (id)sub_1DC76EF60();
    v7[2](v7, 0);

    _Block_release(v7);
  }
  else
  {
    aBlock = (void (**)(void))v11[3];
    v8 = (id)sub_1DC76F3EC();
    aBlock[2]();

    _Block_release(aBlock);
    swift_bridgeObjectRelease();
  }
  v5 = (void *)v11[2];
  v4 = (void *)v11[1];
  swift_bridgeObjectRelease();

  return (*(_QWORD *(**)(_QWORD *__return_ptr))(*v12 + 8))(v12);
}

uint64_t sub_1DC755EEC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1DC755F38()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  const void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)(v1 + 16) = v1;
  v6 = (void *)v0[2];
  v4 = (const void *)v0[3];
  v5 = (void *)v0[4];
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_1DC755FE4;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_1F039AAF0 + dword_1F039AAF0))(v6, v4, v5);
}

uint64_t sub_1DC755FE4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

uint64_t *sub_1DC756044(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *result;
  _QWORD v23[2];
  uint64_t *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  char *v52;
  size_t v53;
  uint64_t v54;
  uint64_t i;
  uint64_t v56;
  uint64_t v57;
  _BYTE __b[40];
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char v63;

  v50 = a1;
  v62 = 0;
  v61 = 0;
  v60 = 0;
  v59 = 0;
  v51 = __b;
  v53 = 40;
  memset(__b, 0, sizeof(__b));
  v57 = 0;
  v48 = 0;
  v49 = sub_1DC76F050();
  v43 = *(_QWORD *)(v49 - 8);
  v44 = (*(_QWORD *)(v43 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v49);
  v45 = (char *)v23 - v44;
  v62 = (char *)v23 - v44;
  v46 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60120) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](v50);
  v47 = (char *)v23 - v46;
  v61 = v2;
  v60 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
  v59 = sub_1DC76F74C();
  swift_bridgeObjectRetain();
  sub_1DC756530();
  v52 = &v63;
  sub_1DC76F5C0();
  v3 = v54;
  memcpy(v51, v52, v53);
  for (i = v3; ; i = v41)
  {
    v41 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601F0);
    sub_1DC76F5CC();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v47, 1, v49) == 1)
      break;
    (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v45, v47, v49);
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
    v37 = sub_1DC76F74C();
    v36 = v4;
    v5 = sub_1DC76F464();
    v6 = v36;
    *v36 = v5;
    v6[1] = v7;
    v8 = sub_1DC76F044();
    v9 = v36;
    v39 = MEMORY[0x1E0DEA968];
    v36[5] = MEMORY[0x1E0DEA968];
    v9[2] = v8;
    v9[3] = v10;
    sub_1DC74CCA0();
    v11 = sub_1DC76F410();
    v40 = &v56;
    v56 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601B8);
    sub_1DC76F53C();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v45, v49);
  }
  v12 = v42;
  sub_1DC7565A0();
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601A8);
  v27 = sub_1DC76F74C();
  v24 = v13;
  v25 = v13 + 2;
  v14 = sub_1DC76F464();
  v15 = v24;
  v17 = v16;
  v18 = v25;
  *v24 = v14;
  v15[1] = v17;
  sub_1DC7565DC(&v59, v18);
  v19 = v27;
  sub_1DC74CCA0();
  v28 = v19;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601B8);
  v31 = MEMORY[0x1E0DEA968];
  v32 = MEMORY[0x1E0DEA978];
  v29 = sub_1DC76F410();
  v57 = v29;
  swift_bridgeObjectRetain();
  v20 = sub_1DC76F6E0();
  v21 = v41;
  v33 = v20;
  (*(void (**)(void))((*v12 & *MEMORY[0x1E0DEEDD8]) + 0xD8))();
  v34 = v21;
  v35 = v21;
  if (v21)
    v23[1] = v35;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = &v59;
  sub_1DC756610();
  return result;
}

unint64_t sub_1DC756530()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EDB60118;
  if (!qword_1EDB60118)
  {
    v0 = sub_1DC76F050();
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0D92048], v0);
    atomic_store(v1, (unint64_t *)&qword_1EDB60118);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC7565A0()
{
  sub_1DC7532EC();
}

_QWORD *sub_1DC7565DC(uint64_t *a1, _QWORD *a2)
{
  _QWORD *result;
  uint64_t v4;

  v4 = *a1;
  swift_bridgeObjectRetain();
  result = a2;
  *a2 = v4;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC756610()
{
  swift_bridgeObjectRelease();
}

uint64_t *sub_1DC756638(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  _QWORD *v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD *v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD *v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  uint64_t v140;
  _QWORD *v141;
  uint64_t v142;
  uint64_t *v143;
  uint64_t v144;
  uint64_t v145;
  _QWORD *v146;
  uint64_t v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t v150;
  _QWORD *v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t v155;
  _QWORD *v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;
  uint64_t v160;
  _QWORD *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t *result;
  uint64_t v166;
  _QWORD *v167;
  _QWORD *v168;
  _QWORD *v169;
  _QWORD *v170;
  _QWORD *v171;
  _QWORD *v172;
  _QWORD *v173;
  uint64_t v174;
  int v175;
  uint64_t *v176;
  _QWORD *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  int v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t kk;
  int v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t jj;
  int v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t ii;
  int v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t n;
  int v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t m;
  int v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t k;
  int v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t *v274;
  uint64_t v275;
  uint64_t v276;
  unint64_t v277;
  uint64_t j;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t *v282;
  _QWORD *v283;
  uint64_t v284;
  int v285;
  uint64_t v286;
  _QWORD *v287;
  uint64_t *v288;
  unsigned int v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  _QWORD *v293;
  uint64_t v294;
  uint64_t v295;
  unint64_t v296;
  char *v297;
  unint64_t v298;
  char *v299;
  unint64_t v300;
  char *v301;
  uint64_t v302;
  uint64_t v303;
  unint64_t v304;
  char *v305;
  uint64_t v306;
  unint64_t v307;
  char *v308;
  unint64_t v309;
  char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  _BYTE *v315;
  char *v316;
  size_t v317;
  uint64_t v318;
  uint64_t i;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  _QWORD v377[3];
  uint64_t v378;
  _QWORD v379[2];
  char v380;
  uint64_t v381;
  _BYTE __b[40];
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  char *v393;
  char *v394;
  char *v395;
  char v396;

  v314 = a1;
  v395 = 0;
  v394 = 0;
  v393 = 0;
  v392 = 0;
  v391 = 0;
  v390 = 0;
  v389 = 0;
  v388 = 0;
  v387 = 0;
  v386 = 0;
  v385 = 0;
  v384 = 0;
  v383 = 0;
  v315 = __b;
  v317 = 40;
  memset(__b, 0, sizeof(__b));
  v381 = 0;
  v374 = 0;
  v375 = 0;
  v369 = 0;
  v370 = 0;
  v364 = 0;
  v365 = 0;
  v359 = 0;
  v360 = 0;
  v354 = 0;
  v355 = 0;
  v349 = 0;
  v350 = 0;
  v344 = 0;
  v345 = 0;
  v339 = 0;
  v340 = 0;
  v336 = 0;
  v337 = 0;
  v333 = 0;
  v334 = 0;
  v330 = 0;
  v331 = 0;
  v327 = 0;
  v328 = 0;
  v324 = 0;
  v325 = 0;
  v321 = 0;
  v322 = 0;
  v312 = 0;
  v294 = sub_1DC76EF54();
  v295 = *(_QWORD *)(v294 - 8);
  v296 = (*(_QWORD *)(v295 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v294);
  v297 = (char *)&v166 - v296;
  v298 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600F0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](v312);
  v299 = (char *)&v166 - v298;
  v300 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v2);
  v301 = (char *)&v166 - v300;
  v395 = (char *)&v166 - v300;
  v302 = sub_1DC76EFF0();
  v303 = *(_QWORD *)(v302 - 8);
  v304 = (*(_QWORD *)(v303 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v312);
  v305 = (char *)&v166 - v304;
  v394 = (char *)&v166 - v304;
  v313 = sub_1DC76F11C();
  v306 = *(_QWORD *)(v313 - 8);
  v307 = (*(_QWORD *)(v306 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v313);
  v308 = (char *)&v166 - v307;
  v393 = (char *)&v166 - v307;
  v309 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60138) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x1E0C80A78](v314);
  v310 = (char *)&v166 - v309;
  v392 = v4;
  v391 = v1;
  v311 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
  v390 = sub_1DC76F74C();
  v389 = sub_1DC76F74C();
  v388 = sub_1DC76F74C();
  v387 = sub_1DC76F74C();
  v386 = sub_1DC76F74C();
  v385 = sub_1DC76F74C();
  v384 = sub_1DC76F74C();
  v383 = sub_1DC76F74C();
  swift_bridgeObjectRetain();
  sub_1DC757CE8();
  v316 = &v396;
  sub_1DC76F5C0();
  v5 = v318;
  memcpy(v315, v316, v317);
  for (i = v5; ; i = v197)
  {
    v292 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601F8);
    sub_1DC76F5CC();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v306 + 48))(v310, 1, v313) == 1)
      break;
    (*(void (**)(char *, char *, uint64_t))(v306 + 32))(v308, v310, v313);
    sub_1DC76EFE4();
    sub_1DC76F0B0();
    sub_1DC76EFD8();
    (*(void (**)(char *, uint64_t))(v295 + 8))(v297, v294);
    v279 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
    v280 = sub_1DC76F74C();
    v288 = v6;
    v289 = 1;
    v7 = sub_1DC76F464();
    v8 = v288;
    *v288 = v7;
    v8[1] = v9;
    v10 = sub_1DC76F0A4();
    v12 = v11;
    v13 = v288;
    v281 = MEMORY[0x1E0DEA968];
    v288[5] = MEMORY[0x1E0DEA968];
    v13[2] = v10;
    v13[3] = v12;
    v282 = v13 + 8;
    v14 = sub_1DC76F464();
    v15 = v288;
    v288[6] = v14;
    v15[7] = v16;
    v286 = sub_1DC76F0BC();
    v284 = v17;
    v285 = v18;
    sub_1DC757D94(v286, v17, v18 & 1);
    v283 = v379;
    v379[0] = v286;
    v379[1] = v284;
    v380 = v285 & 1 & v289;
    v288[11] = v281;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600F8);
    sub_1DC76EFFC();
    sub_1DC757DC4((uint64_t)v283);
    sub_1DC757DFC(v286, v284, v285 & 1);
    v287 = v288 + 14;
    v19 = sub_1DC76F464();
    v20 = v288;
    v21 = v19;
    v22 = v301;
    v24 = v23;
    v25 = v299;
    v288[12] = v21;
    v20[13] = v24;
    sub_1DC757E2C(v22, v25);
    v290 = sub_1DC76EFCC();
    v291 = *(_QWORD *)(v290 - 8);
    if ((*(unsigned int (**)(char *, _QWORD))(v291 + 48))(v299, v289) == 1)
    {
      sub_1DC757EE8((uint64_t)v299);
      memset(v377, 0, sizeof(v377));
      v378 = 0;
    }
    else
    {
      sub_1DC76EFC0();
      v378 = MEMORY[0x1E0DEB070];
      v377[0] = v26;
      (*(void (**)(char *, uint64_t))(v291 + 8))(v299, v290);
    }
    if (v378)
    {
      sub_1DC751E1C((uint64_t)v377, (uint64_t)v287);
    }
    else
    {
      v27 = v288;
      v288[17] = MEMORY[0x1E0DEB418];
      v27[14] = 0;
      sub_1DC7521C0((uint64_t)v377);
    }
    sub_1DC74CCA0();
    v28 = sub_1DC76F410();
    v274 = &v376;
    v376 = v28;
    v275 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601B8);
    sub_1DC76F53C();
    v373 = sub_1DC76F110();
    v276 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601C8);
    v277 = sub_1DC757F58();
    sub_1DC76F5E4();
    for (j = v292; ; j = v270)
    {
      v270 = j;
      v271 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60220);
      sub_1DC76F698();
      v272 = v371;
      v273 = v372;
      if (!v372)
        break;
      v268 = v272;
      v269 = v273;
      v267 = v273;
      v264 = v272;
      v321 = v272;
      v322 = v273;
      v263 = sub_1DC76F74C();
      v265 = v29;
      v262 = 1;
      v30 = sub_1DC76F464();
      v31 = v265;
      *v265 = v30;
      v31[1] = v32;
      v33 = sub_1DC76F0A4();
      v34 = v265;
      v266 = MEMORY[0x1E0DEA968];
      v265[5] = MEMORY[0x1E0DEA968];
      v34[2] = v33;
      v34[3] = v35;
      v36 = sub_1DC76F464();
      v37 = v265;
      v265[6] = v36;
      v37[7] = v38;
      swift_bridgeObjectRetain();
      v39 = v264;
      v40 = v265;
      v41 = v267;
      v265[11] = v266;
      v40[8] = v39;
      v40[9] = v41;
      sub_1DC74CCA0();
      v320 = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    v368 = sub_1DC76F0F8();
    sub_1DC76F5E4();
    for (k = v270; ; k = v258)
    {
      v258 = k;
      sub_1DC76F698();
      v259 = v366;
      v260 = v367;
      if (!v367)
        break;
      v256 = v259;
      v257 = v260;
      v255 = v260;
      v252 = v259;
      v324 = v259;
      v325 = v260;
      v251 = sub_1DC76F74C();
      v253 = v42;
      v250 = 1;
      v43 = sub_1DC76F464();
      v44 = v253;
      *v253 = v43;
      v44[1] = v45;
      v46 = sub_1DC76F0A4();
      v47 = v253;
      v254 = MEMORY[0x1E0DEA968];
      v253[5] = MEMORY[0x1E0DEA968];
      v47[2] = v46;
      v47[3] = v48;
      v49 = sub_1DC76F464();
      v50 = v253;
      v253[6] = v49;
      v50[7] = v51;
      swift_bridgeObjectRetain();
      v52 = v252;
      v53 = v253;
      v54 = v255;
      v253[11] = v254;
      v53[8] = v52;
      v53[9] = v54;
      sub_1DC74CCA0();
      v323 = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    v363 = sub_1DC76F0EC();
    sub_1DC76F5E4();
    for (m = v258; ; m = v246)
    {
      v246 = m;
      sub_1DC76F698();
      v247 = v361;
      v248 = v362;
      if (!v362)
        break;
      v244 = v247;
      v245 = v248;
      v243 = v248;
      v240 = v247;
      v327 = v247;
      v328 = v248;
      v239 = sub_1DC76F74C();
      v241 = v55;
      v238 = 1;
      v56 = sub_1DC76F464();
      v57 = v241;
      *v241 = v56;
      v57[1] = v58;
      v59 = sub_1DC76F0A4();
      v60 = v241;
      v242 = MEMORY[0x1E0DEA968];
      v241[5] = MEMORY[0x1E0DEA968];
      v60[2] = v59;
      v60[3] = v61;
      v62 = sub_1DC76F464();
      v63 = v241;
      v241[6] = v62;
      v63[7] = v64;
      swift_bridgeObjectRetain();
      v65 = v240;
      v66 = v241;
      v67 = v243;
      v241[11] = v242;
      v66[8] = v65;
      v66[9] = v67;
      sub_1DC74CCA0();
      v326 = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    v358 = sub_1DC76F104();
    sub_1DC76F5E4();
    for (n = v246; ; n = v234)
    {
      v234 = n;
      sub_1DC76F698();
      v235 = v356;
      v236 = v357;
      if (!v357)
        break;
      v232 = v235;
      v233 = v236;
      v231 = v236;
      v228 = v235;
      v330 = v235;
      v331 = v236;
      v227 = sub_1DC76F74C();
      v229 = v68;
      v226 = 1;
      v69 = sub_1DC76F464();
      v70 = v229;
      *v229 = v69;
      v70[1] = v71;
      v72 = sub_1DC76F0A4();
      v73 = v229;
      v230 = MEMORY[0x1E0DEA968];
      v229[5] = MEMORY[0x1E0DEA968];
      v73[2] = v72;
      v73[3] = v74;
      v75 = sub_1DC76F464();
      v76 = v229;
      v229[6] = v75;
      v76[7] = v77;
      swift_bridgeObjectRetain();
      v78 = v228;
      v79 = v229;
      v80 = v231;
      v229[11] = v230;
      v79[8] = v78;
      v79[9] = v80;
      sub_1DC74CCA0();
      v329 = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    v353 = sub_1DC76F0C8();
    sub_1DC76F5E4();
    for (ii = v234; ; ii = v222)
    {
      v222 = ii;
      sub_1DC76F698();
      v223 = v351;
      v224 = v352;
      if (!v352)
        break;
      v220 = v223;
      v221 = v224;
      v219 = v224;
      v216 = v223;
      v333 = v223;
      v334 = v224;
      v215 = sub_1DC76F74C();
      v217 = v81;
      v214 = 1;
      v82 = sub_1DC76F464();
      v83 = v217;
      *v217 = v82;
      v83[1] = v84;
      v85 = sub_1DC76F0A4();
      v86 = v217;
      v218 = MEMORY[0x1E0DEA968];
      v217[5] = MEMORY[0x1E0DEA968];
      v86[2] = v85;
      v86[3] = v87;
      v88 = sub_1DC76F464();
      v89 = v217;
      v217[6] = v88;
      v89[7] = v90;
      swift_bridgeObjectRetain();
      v91 = v216;
      v92 = v217;
      v93 = v219;
      v217[11] = v218;
      v92[8] = v91;
      v92[9] = v93;
      sub_1DC74CCA0();
      v332 = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    v348 = sub_1DC76F0D4();
    sub_1DC76F5E4();
    for (jj = v222; ; jj = v210)
    {
      v210 = jj;
      sub_1DC76F698();
      v211 = v346;
      v212 = v347;
      if (!v347)
        break;
      v208 = v211;
      v209 = v212;
      v207 = v212;
      v204 = v211;
      v336 = v211;
      v337 = v212;
      v203 = sub_1DC76F74C();
      v205 = v94;
      v202 = 17;
      v201 = 1;
      v95 = sub_1DC76F464();
      v96 = v205;
      *v205 = v95;
      v96[1] = v97;
      v98 = sub_1DC76F0A4();
      v99 = v205;
      v206 = MEMORY[0x1E0DEA968];
      v205[5] = MEMORY[0x1E0DEA968];
      v99[2] = v98;
      v99[3] = v100;
      v101 = sub_1DC76F464();
      v102 = v205;
      v205[6] = v101;
      v102[7] = v103;
      swift_bridgeObjectRetain();
      v104 = v204;
      v105 = v205;
      v106 = v207;
      v205[11] = v206;
      v105[8] = v104;
      v105[9] = v106;
      sub_1DC74CCA0();
      v335 = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    v343 = sub_1DC76F0E0();
    sub_1DC76F5E4();
    for (kk = v210; ; kk = v197)
    {
      v197 = kk;
      sub_1DC76F698();
      v198 = v341;
      v199 = v342;
      if (!v342)
        break;
      v195 = v198;
      v196 = v199;
      v194 = v199;
      v191 = v198;
      v339 = v198;
      v340 = v199;
      v190 = sub_1DC76F74C();
      v192 = v107;
      v189 = 17;
      v188 = 1;
      v108 = sub_1DC76F464();
      v109 = v192;
      *v192 = v108;
      v109[1] = v110;
      v111 = sub_1DC76F0A4();
      v112 = v192;
      v193 = MEMORY[0x1E0DEA968];
      v192[5] = MEMORY[0x1E0DEA968];
      v112[2] = v111;
      v112[3] = v113;
      v114 = sub_1DC76F464();
      v115 = v192;
      v192[6] = v114;
      v115[7] = v116;
      swift_bridgeObjectRetain();
      v117 = v191;
      v118 = v192;
      v119 = v194;
      v192[11] = v193;
      v118[8] = v117;
      v118[9] = v119;
      sub_1DC74CCA0();
      v338 = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    sub_1DC757EE8((uint64_t)v301);
    (*(void (**)(char *, uint64_t))(v303 + 8))(v305, v302);
    (*(void (**)(char *, uint64_t))(v306 + 8))(v308, v313);
  }
  v120 = v293;
  sub_1DC757D58();
  v178 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601A8);
  v179 = sub_1DC76F74C();
  v176 = v121;
  v167 = v121 + 2;
  v175 = 1;
  v122 = sub_1DC76F464();
  v123 = v176;
  v125 = v124;
  v126 = v167;
  *v176 = v122;
  v123[1] = v125;
  sub_1DC7565DC(&v390, v126);
  v168 = v176 + 5;
  v127 = sub_1DC76F464();
  v128 = v176;
  v130 = v129;
  v131 = v168;
  v176[3] = v127;
  v128[4] = v130;
  sub_1DC7565DC(&v389, v131);
  v169 = v176 + 8;
  v132 = sub_1DC76F464();
  v133 = v176;
  v135 = v134;
  v136 = v169;
  v176[6] = v132;
  v133[7] = v135;
  sub_1DC7565DC(&v388, v136);
  v170 = v176 + 11;
  v137 = sub_1DC76F464();
  v138 = v176;
  v140 = v139;
  v141 = v170;
  v176[9] = v137;
  v138[10] = v140;
  sub_1DC7565DC(&v387, v141);
  v171 = v176 + 14;
  v142 = sub_1DC76F464();
  v143 = v176;
  v145 = v144;
  v146 = v171;
  v176[12] = v142;
  v143[13] = v145;
  sub_1DC7565DC(&v386, v146);
  v172 = v176 + 17;
  v147 = sub_1DC76F464();
  v148 = v176;
  v150 = v149;
  v151 = v172;
  v176[15] = v147;
  v148[16] = v150;
  sub_1DC7565DC(&v385, v151);
  v173 = v176 + 20;
  v174 = 21;
  v152 = sub_1DC76F464();
  v153 = v176;
  v155 = v154;
  v156 = v173;
  v176[18] = v152;
  v153[19] = v155;
  sub_1DC7565DC(&v384, v156);
  v177 = v176 + 23;
  v157 = sub_1DC76F464();
  v158 = v176;
  v160 = v159;
  v161 = v177;
  v176[21] = v157;
  v158[22] = v160;
  sub_1DC7565DC(&v383, v161);
  v162 = v179;
  sub_1DC74CCA0();
  v180 = v162;
  v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601B8);
  v183 = MEMORY[0x1E0DEA968];
  v184 = MEMORY[0x1E0DEA978];
  v181 = sub_1DC76F410();
  v381 = v181;
  swift_bridgeObjectRetain();
  v163 = sub_1DC76F6E0();
  v164 = v292;
  v185 = v163;
  (*(void (**)(void))((*v120 & *MEMORY[0x1E0DEEDD8]) + 0xD8))();
  v186 = v164;
  v187 = v164;
  if (v164)
    v166 = v187;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DC756610();
  sub_1DC756610();
  sub_1DC756610();
  sub_1DC756610();
  sub_1DC756610();
  sub_1DC756610();
  sub_1DC756610();
  result = &v390;
  sub_1DC756610();
  return result;
}

unint64_t sub_1DC757CE8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EDB60130;
  if (!qword_1EDB60130)
  {
    v0 = sub_1DC76F11C();
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0D93EC8], v0);
    atomic_store(v1, (unint64_t *)&qword_1EDB60130);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC757D58()
{
  sub_1DC7532EC();
}

uint64_t sub_1DC757D94(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1DC757DC4(uint64_t a1)
{
  sub_1DC757DFC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16) & 1);
  return a1;
}

uint64_t sub_1DC757DFC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

void *sub_1DC757E2C(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1DC76EFCC();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1))
  {
    v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600F0);
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a2, a1, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a2, 0, 1, v6);
  }
  return a2;
}

uint64_t sub_1DC757EE8(uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1DC76EFCC();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(v4 + 48))(a1, 1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return a1;
}

unint64_t sub_1DC757F58()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EDB601D8;
  if (!qword_1EDB601D8)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDB601C8);
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEAF50], v0);
    atomic_store(v1, (unint64_t *)&qword_1EDB601D8);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC757FC8()
{
  swift_bridgeObjectRelease();
}

uint64_t *sub_1DC757FF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t *v153;
  uint64_t v154;
  uint64_t *v155;
  char v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  _QWORD *v162;
  uint64_t *v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t v167;
  _QWORD *v168;
  uint64_t v169;
  uint64_t *v170;
  uint64_t v171;
  uint64_t v172;
  _QWORD *v173;
  uint64_t v174;
  uint64_t *v175;
  uint64_t v176;
  uint64_t v177;
  _QWORD *v178;
  uint64_t v179;
  uint64_t *v180;
  uint64_t v181;
  uint64_t v182;
  _QWORD *v183;
  uint64_t v184;
  uint64_t *v185;
  uint64_t v186;
  uint64_t v187;
  _QWORD *v188;
  uint64_t v189;
  uint64_t *v190;
  uint64_t v191;
  uint64_t v192;
  _QWORD *v193;
  uint64_t v194;
  uint64_t *v195;
  uint64_t v196;
  uint64_t v197;
  _QWORD *v198;
  uint64_t v199;
  uint64_t *v200;
  uint64_t v201;
  uint64_t v202;
  _QWORD *v203;
  uint64_t v204;
  uint64_t *v205;
  uint64_t v206;
  uint64_t v207;
  _QWORD *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t *result;
  _QWORD v213[2];
  _QWORD *v214;
  _QWORD *v215;
  _QWORD *v216;
  uint64_t v217;
  _QWORD *v218;
  _QWORD *v219;
  uint64_t v220;
  _QWORD *v221;
  _QWORD *v222;
  _QWORD *v223;
  uint64_t v224;
  int v225;
  uint64_t *v226;
  _QWORD *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  int v238;
  uint64_t *v239;
  uint64_t *v240;
  _QWORD *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  int v246;
  uint64_t v247;
  uint64_t v248;
  int v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  int v253;
  uint64_t v254;
  uint64_t v255;
  char *v256;
  uint64_t mm;
  int v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t kk;
  int v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t jj;
  int v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t ii;
  int v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t n;
  int v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t m;
  int v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t k;
  int v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t *v344;
  uint64_t v345;
  uint64_t v346;
  unint64_t v347;
  uint64_t j;
  uint64_t v349;
  uint64_t v350;
  _QWORD *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  _QWORD *v355;
  _QWORD *v356;
  _QWORD *v357;
  uint64_t v358;
  int v359;
  uint64_t v360;
  int v361;
  uint64_t v362;
  uint64_t v363;
  double v364;
  _DWORD *v365;
  int v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t *v370;
  _QWORD *v371;
  uint64_t v372;
  int v373;
  uint64_t v374;
  _QWORD *v375;
  uint64_t *v376;
  uint64_t v377;
  unsigned int v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  _QWORD *v382;
  int __c;
  uint64_t v384;
  uint64_t v385;
  unint64_t v386;
  char *v387;
  unint64_t v388;
  char *v389;
  uint64_t v390;
  uint64_t v391;
  unint64_t v392;
  char *v393;
  unint64_t v394;
  char *v395;
  unint64_t v396;
  char *v397;
  uint64_t v398;
  uint64_t v399;
  unint64_t v400;
  char *v401;
  uint64_t v402;
  unint64_t v403;
  char *v404;
  unint64_t v405;
  char *v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  _BYTE *v411;
  char *v412;
  size_t __len;
  uint64_t v414;
  uint64_t i;
  uint64_t v416;
  uint64_t v417;
  _QWORD v418[6];
  _QWORD v419[5];
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  _QWORD v441[2];
  char v442;
  uint64_t v443;
  uint64_t v444;
  char v445;
  uint64_t v446;
  uint64_t v447;
  unsigned __int8 v448;
  _BYTE v449[40];
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  _QWORD v488[2];
  char v489;
  double v490;
  _QWORD v491[3];
  uint64_t v492;
  _QWORD v493[2];
  char v494;
  uint64_t v495;
  uint64_t v496;
  _BYTE v497[40];
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  char *v509;
  char *v510;
  char *v511;
  char v512;
  char v513;

  v410 = a1;
  v511 = 0;
  v510 = 0;
  v509 = 0;
  v508 = 0;
  v507 = 0;
  v506 = 0;
  v505 = 0;
  v504 = 0;
  v503 = 0;
  v502 = 0;
  v501 = 0;
  v500 = 0;
  v499 = 0;
  v498 = 0;
  v411 = v497;
  __len = 40;
  __c = 0;
  memset(v497, 0, sizeof(v497));
  v496 = 0;
  v495 = 0;
  v487 = 0;
  v486 = 0;
  v483 = 0;
  v484 = 0;
  v478 = 0;
  v479 = 0;
  v473 = 0;
  v474 = 0;
  v468 = 0;
  v469 = 0;
  v463 = 0;
  v464 = 0;
  v458 = 0;
  v459 = 0;
  v453 = 0;
  v454 = 0;
  memset(v449, 0, sizeof(v449));
  v443 = 0;
  v444 = 0;
  v445 = 0;
  v438 = 0;
  v439 = 0;
  v435 = 0;
  v436 = 0;
  v432 = 0;
  v433 = 0;
  v429 = 0;
  v430 = 0;
  v426 = 0;
  v427 = 0;
  v423 = 0;
  v424 = 0;
  v420 = 0;
  v421 = 0;
  v408 = 0;
  v384 = sub_1DC76F71C();
  v385 = *(_QWORD *)(v384 - 8);
  v386 = (*(_QWORD *)(v385 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](0);
  v387 = (char *)v213 - v386;
  v388 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v2);
  v389 = (char *)v213 - v388;
  v390 = sub_1DC76EF54();
  v391 = *(_QWORD *)(v390 - 8);
  v392 = (*(_QWORD *)(v391 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v390);
  v393 = (char *)v213 - v392;
  v394 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600F0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x1E0C80A78](v408);
  v395 = (char *)v213 - v394;
  v396 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v4);
  v397 = (char *)v213 - v396;
  v511 = (char *)v213 - v396;
  v398 = sub_1DC76EFF0();
  v399 = *(_QWORD *)(v398 - 8);
  v400 = (*(_QWORD *)(v399 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v408);
  v401 = (char *)v213 - v400;
  v510 = (char *)v213 - v400;
  v409 = sub_1DC76F1E8();
  v402 = *(_QWORD *)(v409 - 8);
  v403 = (*(_QWORD *)(v402 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v409);
  v404 = (char *)v213 - v403;
  v509 = (char *)v213 - v403;
  v405 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60148) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x1E0C80A78](v410);
  v406 = (char *)v213 - v405;
  v508 = v6;
  v507 = v1;
  v407 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
  v506 = sub_1DC76F74C();
  v505 = sub_1DC76F74C();
  v504 = sub_1DC76F74C();
  v503 = sub_1DC76F74C();
  v502 = sub_1DC76F74C();
  v501 = sub_1DC76F74C();
  v500 = sub_1DC76F74C();
  v499 = sub_1DC76F74C();
  v498 = sub_1DC76F74C();
  swift_bridgeObjectRetain();
  sub_1DC753240();
  v412 = &v512;
  sub_1DC76F5C0();
  v7 = v414;
  memcpy(v411, v412, __len);
  for (i = v7; ; i = v250)
  {
    v381 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60200);
    sub_1DC76F5CC();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v402 + 48))(v406, 1, v409) == 1)
      break;
    (*(void (**)(char *, char *, uint64_t))(v402 + 32))(v404, v406, v409);
    v367 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
    v377 = 0;
    sub_1DC76F74C();
    v369 = MEMORY[0x1E0DEA968];
    v495 = sub_1DC76F410();
    sub_1DC76EFE4();
    sub_1DC76F134();
    sub_1DC76EFD8();
    (*(void (**)(char *, uint64_t))(v391 + 8))(v393, v390);
    v368 = sub_1DC76F74C();
    v376 = v8;
    v378 = 1;
    v9 = sub_1DC76F464();
    v10 = v376;
    *v376 = v9;
    v10[1] = v11;
    v12 = sub_1DC76F128();
    v14 = v13;
    v15 = v376;
    v376[5] = v369;
    v15[2] = v12;
    v15[3] = v14;
    v370 = v15 + 8;
    v16 = sub_1DC76F464();
    v17 = v376;
    v376[6] = v16;
    v17[7] = v18;
    v374 = sub_1DC76F140();
    v372 = v19;
    v373 = v20;
    sub_1DC757D94(v374, v19, v20 & 1);
    v371 = v493;
    v493[0] = v374;
    v493[1] = v372;
    v494 = v373 & 1 & v378;
    v376[11] = v369;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600F8);
    sub_1DC76EFFC();
    sub_1DC757DC4((uint64_t)v371);
    sub_1DC757DFC(v374, v372, v373 & 1);
    v375 = v376 + 14;
    v21 = sub_1DC76F464();
    v22 = v376;
    v23 = v21;
    v24 = v397;
    v26 = v25;
    v27 = v395;
    v376[12] = v23;
    v22[13] = v26;
    sub_1DC757E2C(v24, v27);
    v379 = sub_1DC76EFCC();
    v380 = *(_QWORD *)(v379 - 8);
    if ((*(unsigned int (**)(char *, _QWORD))(v380 + 48))(v395, v378) == 1)
    {
      sub_1DC757EE8((uint64_t)v395);
      memset(v491, 0, sizeof(v491));
      v492 = 0;
    }
    else
    {
      sub_1DC76EFC0();
      v492 = MEMORY[0x1E0DEB070];
      v491[0] = v28;
      (*(void (**)(char *, uint64_t))(v380 + 8))(v395, v379);
    }
    if (v492)
    {
      sub_1DC751E1C((uint64_t)v491, (uint64_t)v375);
    }
    else
    {
      v29 = v376;
      v376[17] = MEMORY[0x1E0DEB418];
      v29[14] = 0;
      sub_1DC7521C0((uint64_t)v491);
    }
    v30 = sub_1DC76F464();
    v31 = v376;
    v376[18] = v30;
    v31[19] = v32;
    sub_1DC76F1D0();
    v33 = v389;
    v34 = v385;
    v35 = v384;
    v364 = v36;
    v376[23] = MEMORY[0x1E0DEB070];
    v365 = (_DWORD *)MEMORY[0x1E0DED4F0];
    (*(void (**)(char *, _QWORD, uint64_t))(v34 + 104))(v33, *MEMORY[0x1E0DED4F0], v35);
    v490 = v364;
    (*(void (**)(char *, char *, uint64_t))(v385 + 16))(v387, v389, v384);
    v366 = (*(uint64_t (**)(char *, uint64_t))(v385 + 88))(v387, v384);
    if (v366 == *v365)
    {
      v490 = round(v364);
      goto LABEL_22;
    }
    if (v366 == *MEMORY[0x1E0DED4E8])
    {
      v490 = rint(v364);
      goto LABEL_22;
    }
    if (v366 == *MEMORY[0x1E0DED500])
      goto LABEL_19;
    if (v366 == *MEMORY[0x1E0DED508])
      goto LABEL_21;
    if (v366 == *MEMORY[0x1E0DED4D8])
    {
      v490 = trunc(v364);
      goto LABEL_22;
    }
    if (v366 != *MEMORY[0x1E0DED4E0])
    {
      sub_1DC76F5A8();
      (*(void (**)(char *, uint64_t))(v385 + 8))(v387, v384);
      goto LABEL_22;
    }
    if ((sub_1DC76F5B4() & 1) != 0)
LABEL_21:
      v490 = floor(v364);
    else
LABEL_19:
      v490 = ceil(v364);
LABEL_22:
    v37 = v384;
    v38 = v389;
    v39 = v385;
    *((double *)v376 + 20) = v490;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v38, v37);
    v356 = v376 + 26;
    v361 = 1;
    v40 = sub_1DC76F464();
    v41 = v376;
    v376[24] = v40;
    v41[25] = v42;
    v360 = sub_1DC76F1DC();
    v358 = v43;
    v359 = v44;
    sub_1DC759EF0(v360, v43, v44 & 1);
    v357 = v488;
    v488[0] = v360;
    v488[1] = v358;
    v489 = v359 & 1;
    v362 = MEMORY[0x1E0DEA968];
    v376[29] = MEMORY[0x1E0DEA968];
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60100);
    sub_1DC76EFFC();
    sub_1DC759F20((uint64_t)v357);
    sub_1DC759F58(v360, v358, v359 & 1);
    v45 = sub_1DC76F464();
    v46 = v376;
    v376[30] = v45;
    v46[31] = v47;
    v48 = sub_1DC76F158();
    v49 = v376;
    v376[35] = v362;
    v49[32] = v48;
    v49[33] = v50;
    sub_1DC74CCA0();
    v495 = sub_1DC76F410();
    swift_bridgeObjectRelease();
    v363 = sub_1DC76F188();
    v487 = v363;
    if (sub_1DC76F530() > 0)
    {
      v353 = sub_1DC76F464();
      v354 = v51;
      v355 = v418;
      v418[3] = MEMORY[0x1E0DEA968];
      v418[0] = MEMORY[0x1DF0CCEE4](0, v363);
      v418[1] = v52;
      v416 = v353;
      v417 = v354;
      sub_1DC76F434();
    }
    v352 = sub_1DC76F164();
    v486 = v352;
    if (sub_1DC76F530() > 0)
    {
      v349 = sub_1DC76F464();
      v350 = v53;
      v351 = v419;
      v419[3] = MEMORY[0x1E0DEA968];
      v419[0] = MEMORY[0x1DF0CCEE4](0, v352);
      v419[1] = v54;
      v418[4] = v349;
      v418[5] = v350;
      sub_1DC76F434();
    }
    v343 = v495;
    swift_bridgeObjectRetain();
    v344 = &v485;
    v485 = v343;
    v345 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601B8);
    sub_1DC76F53C();
    v482 = sub_1DC76F170();
    v346 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601C8);
    v347 = sub_1DC757F58();
    sub_1DC76F5E4();
    for (j = v381; ; j = v339)
    {
      v339 = j;
      v340 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60220);
      sub_1DC76F698();
      v341 = v480;
      v342 = v481;
      if (!v481)
        break;
      v337 = v341;
      v338 = v342;
      v336 = v342;
      v333 = v341;
      v420 = v341;
      v421 = v342;
      v332 = sub_1DC76F74C();
      v334 = v55;
      v331 = 1;
      v56 = sub_1DC76F464();
      v57 = v334;
      *v334 = v56;
      v57[1] = v58;
      v59 = sub_1DC76F128();
      v60 = v334;
      v335 = MEMORY[0x1E0DEA968];
      v334[5] = MEMORY[0x1E0DEA968];
      v60[2] = v59;
      v60[3] = v61;
      v62 = sub_1DC76F464();
      v63 = v334;
      v334[6] = v62;
      v63[7] = v64;
      swift_bridgeObjectRetain();
      v65 = v333;
      v66 = v334;
      v67 = v336;
      v334[11] = v335;
      v66[8] = v65;
      v66[9] = v67;
      sub_1DC74CCA0();
      v419[4] = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    v477 = sub_1DC76F1A0();
    sub_1DC76F5E4();
    for (k = v339; ; k = v327)
    {
      v327 = k;
      sub_1DC76F698();
      v328 = v475;
      v329 = v476;
      if (!v476)
        break;
      v325 = v328;
      v326 = v329;
      v324 = v329;
      v321 = v328;
      v423 = v328;
      v424 = v329;
      v320 = sub_1DC76F74C();
      v322 = v68;
      v319 = 1;
      v69 = sub_1DC76F464();
      v70 = v322;
      *v322 = v69;
      v70[1] = v71;
      v72 = sub_1DC76F128();
      v73 = v322;
      v323 = MEMORY[0x1E0DEA968];
      v322[5] = MEMORY[0x1E0DEA968];
      v73[2] = v72;
      v73[3] = v74;
      v75 = sub_1DC76F464();
      v76 = v322;
      v322[6] = v75;
      v76[7] = v77;
      swift_bridgeObjectRetain();
      v78 = v321;
      v79 = v322;
      v80 = v324;
      v322[11] = v323;
      v79[8] = v78;
      v79[9] = v80;
      sub_1DC74CCA0();
      v422 = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    v472 = sub_1DC76F17C();
    sub_1DC76F5E4();
    for (m = v327; ; m = v315)
    {
      v315 = m;
      sub_1DC76F698();
      v316 = v470;
      v317 = v471;
      if (!v471)
        break;
      v313 = v316;
      v314 = v317;
      v312 = v317;
      v309 = v316;
      v426 = v316;
      v427 = v317;
      v308 = sub_1DC76F74C();
      v310 = v81;
      v307 = 1;
      v82 = sub_1DC76F464();
      v83 = v310;
      *v310 = v82;
      v83[1] = v84;
      v85 = sub_1DC76F128();
      v86 = v310;
      v311 = MEMORY[0x1E0DEA968];
      v310[5] = MEMORY[0x1E0DEA968];
      v86[2] = v85;
      v86[3] = v87;
      v88 = sub_1DC76F464();
      v89 = v310;
      v310[6] = v88;
      v89[7] = v90;
      swift_bridgeObjectRetain();
      v91 = v309;
      v92 = v310;
      v93 = v312;
      v310[11] = v311;
      v92[8] = v91;
      v92[9] = v93;
      sub_1DC74CCA0();
      v425 = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    v467 = sub_1DC76F188();
    sub_1DC76F5E4();
    for (n = v315; ; n = v303)
    {
      v303 = n;
      sub_1DC76F698();
      v304 = v465;
      v305 = v466;
      if (!v466)
        break;
      v301 = v304;
      v302 = v305;
      v300 = v305;
      v297 = v304;
      v429 = v304;
      v430 = v305;
      v296 = sub_1DC76F74C();
      v298 = v94;
      v295 = 1;
      v95 = sub_1DC76F464();
      v96 = v298;
      *v298 = v95;
      v96[1] = v97;
      v98 = sub_1DC76F128();
      v99 = v298;
      v299 = MEMORY[0x1E0DEA968];
      v298[5] = MEMORY[0x1E0DEA968];
      v99[2] = v98;
      v99[3] = v100;
      v101 = sub_1DC76F464();
      v102 = v298;
      v298[6] = v101;
      v102[7] = v103;
      swift_bridgeObjectRetain();
      v104 = v297;
      v105 = v298;
      v106 = v300;
      v298[11] = v299;
      v105[8] = v104;
      v105[9] = v106;
      sub_1DC74CCA0();
      v428 = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    v462 = sub_1DC76F194();
    sub_1DC76F5E4();
    for (ii = v303; ; ii = v291)
    {
      v291 = ii;
      sub_1DC76F698();
      v292 = v460;
      v293 = v461;
      if (!v461)
        break;
      v289 = v292;
      v290 = v293;
      v288 = v293;
      v285 = v292;
      v432 = v292;
      v433 = v293;
      v284 = sub_1DC76F74C();
      v286 = v107;
      v283 = 1;
      v108 = sub_1DC76F464();
      v109 = v286;
      *v286 = v108;
      v109[1] = v110;
      v111 = sub_1DC76F128();
      v112 = v286;
      v287 = MEMORY[0x1E0DEA968];
      v286[5] = MEMORY[0x1E0DEA968];
      v112[2] = v111;
      v112[3] = v113;
      v114 = sub_1DC76F464();
      v115 = v286;
      v286[6] = v114;
      v115[7] = v116;
      swift_bridgeObjectRetain();
      v117 = v285;
      v118 = v286;
      v119 = v288;
      v286[11] = v287;
      v118[8] = v117;
      v118[9] = v119;
      sub_1DC74CCA0();
      v431 = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    v457 = sub_1DC76F14C();
    sub_1DC76F5E4();
    for (jj = v291; ; jj = v279)
    {
      v279 = jj;
      sub_1DC76F698();
      v280 = v455;
      v281 = v456;
      if (!v456)
        break;
      v277 = v280;
      v278 = v281;
      v276 = v281;
      v273 = v280;
      v435 = v280;
      v436 = v281;
      v272 = sub_1DC76F74C();
      v274 = v120;
      v271 = 1;
      v121 = sub_1DC76F464();
      v122 = v274;
      *v274 = v121;
      v122[1] = v123;
      v124 = sub_1DC76F128();
      v125 = v274;
      v275 = MEMORY[0x1E0DEA968];
      v274[5] = MEMORY[0x1E0DEA968];
      v125[2] = v124;
      v125[3] = v126;
      v127 = sub_1DC76F464();
      v128 = v274;
      v274[6] = v127;
      v128[7] = v129;
      swift_bridgeObjectRetain();
      v130 = v273;
      v131 = v274;
      v132 = v276;
      v274[11] = v275;
      v131[8] = v130;
      v131[9] = v132;
      sub_1DC74CCA0();
      v434 = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    v452 = sub_1DC76F164();
    sub_1DC76F5E4();
    for (kk = v279; ; kk = v267)
    {
      v267 = kk;
      sub_1DC76F698();
      v268 = v450;
      v269 = v451;
      if (!v451)
        break;
      v265 = v268;
      v266 = v269;
      v264 = v269;
      v261 = v268;
      v438 = v268;
      v439 = v269;
      v260 = sub_1DC76F74C();
      v262 = v133;
      v259 = 17;
      v258 = 1;
      v134 = sub_1DC76F464();
      v135 = v262;
      *v262 = v134;
      v135[1] = v136;
      v137 = sub_1DC76F128();
      v138 = v262;
      v263 = MEMORY[0x1E0DEA968];
      v262[5] = MEMORY[0x1E0DEA968];
      v138[2] = v137;
      v138[3] = v139;
      v140 = sub_1DC76F464();
      v141 = v262;
      v262[6] = v140;
      v141[7] = v142;
      swift_bridgeObjectRetain();
      v143 = v261;
      v144 = v262;
      v145 = v264;
      v262[11] = v263;
      v144[8] = v143;
      v144[9] = v145;
      sub_1DC74CCA0();
      v437 = sub_1DC76F410();
      sub_1DC76F53C();
      swift_bridgeObjectRelease();
    }
    sub_1DC757FC8();
    v255 = sub_1DC76F1B8();
    v254 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60110);
    sub_1DC759F88();
    v256 = &v513;
    sub_1DC76F5C0();
    memcpy(v449, v256, sizeof(v449));
    for (mm = v267; ; mm = v250)
    {
      v250 = mm;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601E8);
      sub_1DC76F5CC();
      v251 = v446;
      v252 = v447;
      v253 = v448;
      if (v448 == 255)
        break;
      v247 = v251;
      v248 = v252;
      v249 = v253;
      v246 = v253;
      v245 = v252;
      v244 = v251;
      v443 = v251;
      v444 = v252;
      v238 = 1;
      v445 = v253 & 1;
      v242 = sub_1DC76F74C();
      v239 = v146;
      v147 = sub_1DC76F464();
      v148 = v239;
      *v239 = v147;
      v148[1] = v149;
      v150 = sub_1DC76F128();
      v152 = v151;
      v153 = v239;
      v243 = MEMORY[0x1E0DEA968];
      v239[5] = MEMORY[0x1E0DEA968];
      v153[2] = v150;
      v153[3] = v152;
      v240 = v153 + 8;
      v154 = sub_1DC76F464();
      v155 = v239;
      v156 = v246;
      v157 = v154;
      v158 = v244;
      v160 = v159;
      v161 = v245;
      v239[6] = v157;
      v155[7] = v160;
      sub_1DC75A0DC(v158, v161, v156 & 1);
      v241 = v441;
      v441[0] = v244;
      v441[1] = v245;
      v442 = v246 & 1 & v238;
      v239[11] = v243;
      sub_1DC76EFFC();
      sub_1DC75A10C((uint64_t)v241);
      sub_1DC74CCA0();
      v440 = sub_1DC76F410();
      sub_1DC76F53C();
      sub_1DC75A144(v244, v245, v246 & 1);
    }
    sub_1DC75A078();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1DC757EE8((uint64_t)v397);
    (*(void (**)(char *, uint64_t))(v399 + 8))(v401, v398);
    sub_1DC75A0B4();
    (*(void (**)(char *, uint64_t))(v402 + 8))(v404, v409);
  }
  v162 = v382;
  sub_1DC7532B0();
  v228 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601A8);
  v229 = sub_1DC76F74C();
  v226 = v163;
  v214 = v163 + 2;
  v225 = 1;
  v164 = sub_1DC76F464();
  v165 = v226;
  v167 = v166;
  v168 = v214;
  *v226 = v164;
  v165[1] = v167;
  sub_1DC7565DC(&v506, v168);
  v215 = v226 + 5;
  v217 = 23;
  v169 = sub_1DC76F464();
  v170 = v226;
  v172 = v171;
  v173 = v215;
  v226[3] = v169;
  v170[4] = v172;
  sub_1DC7565DC(&v505, v173);
  v216 = v226 + 8;
  v174 = sub_1DC76F464();
  v175 = v226;
  v177 = v176;
  v178 = v216;
  v226[6] = v174;
  v175[7] = v177;
  sub_1DC7565DC(&v504, v178);
  v218 = v226 + 11;
  v179 = sub_1DC76F464();
  v180 = v226;
  v182 = v181;
  v183 = v218;
  v226[9] = v179;
  v180[10] = v182;
  sub_1DC7565DC(&v503, v183);
  v219 = v226 + 14;
  v220 = 24;
  v184 = sub_1DC76F464();
  v185 = v226;
  v187 = v186;
  v188 = v219;
  v226[12] = v184;
  v185[13] = v187;
  sub_1DC7565DC(&v502, v188);
  v221 = v226 + 17;
  v189 = sub_1DC76F464();
  v190 = v226;
  v192 = v191;
  v193 = v221;
  v226[15] = v189;
  v190[16] = v192;
  sub_1DC7565DC(&v501, v193);
  v222 = v226 + 20;
  v224 = 19;
  v194 = sub_1DC76F464();
  v195 = v226;
  v197 = v196;
  v198 = v222;
  v226[18] = v194;
  v195[19] = v197;
  sub_1DC7565DC(&v500, v198);
  v223 = v226 + 23;
  v199 = sub_1DC76F464();
  v200 = v226;
  v202 = v201;
  v203 = v223;
  v226[21] = v199;
  v200[22] = v202;
  sub_1DC7565DC(&v499, v203);
  v227 = v226 + 26;
  v204 = sub_1DC76F464();
  v205 = v226;
  v207 = v206;
  v208 = v227;
  v226[24] = v204;
  v205[25] = v207;
  sub_1DC7565DC(&v498, v208);
  v209 = v229;
  sub_1DC74CCA0();
  v230 = v209;
  v232 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601B8);
  v233 = MEMORY[0x1E0DEA968];
  v234 = MEMORY[0x1E0DEA978];
  v231 = sub_1DC76F410();
  v496 = v231;
  swift_bridgeObjectRetain();
  v210 = sub_1DC76F6E0();
  v211 = v381;
  v235 = v210;
  (*(void (**)(void))((*v162 & *MEMORY[0x1E0DEEDD8]) + 0xD8))();
  v236 = v211;
  v237 = v211;
  if (v211)
    v213[1] = v237;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DC756610();
  sub_1DC756610();
  sub_1DC756610();
  sub_1DC756610();
  sub_1DC756610();
  sub_1DC756610();
  sub_1DC756610();
  sub_1DC756610();
  result = &v506;
  sub_1DC756610();
  return result;
}

uint64_t sub_1DC759EF0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1DC759F20(uint64_t a1)
{
  sub_1DC759F58(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16) & 1);
  return a1;
}

uint64_t sub_1DC759F58(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_1DC759F88()
{
  unint64_t v0;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  v3 = qword_1EDB60108;
  if (!qword_1EDB60108)
  {
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDB60110);
    v4[0] = sub_1DC75A010();
    v4[1] = MEMORY[0x1E0DEA978];
    v0 = MEMORY[0x1DF0CD700](MEMORY[0x1E0D908D0], v2, v4);
    atomic_store(v0, (unint64_t *)&qword_1EDB60108);
    return v0;
  }
  return v3;
}

unint64_t sub_1DC75A010()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EDB60128;
  if (!qword_1EDB60128)
  {
    v0 = MEMORY[0x1DF0CD700](MEMORY[0x1E0D92AA8], MEMORY[0x1E0D92AA0]);
    atomic_store(v0, (unint64_t *)&qword_1EDB60128);
    return v0;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC75A078()
{
  sub_1DC7532EC();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC75A0B4()
{
  swift_bridgeObjectRelease();
}

uint64_t sub_1DC75A0DC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1DC75A10C(uint64_t a1)
{
  sub_1DC75A144(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16) & 1);
  return a1;
}

uint64_t sub_1DC75A144(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1DC75A174(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BOOL4 v48;
  _BOOL4 v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  _DWORD *v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  _QWORD *v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  _QWORD v146[2];
  char v147;
  _QWORD v148[12];
  double v149;
  _QWORD v150[6];
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  _QWORD v169[2];
  char v170;
  char v171;
  uint64_t v172;
  _QWORD v173[2];
  _QWORD v174[4];
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;

  v110 = a1;
  v2 = v1;
  v3 = v110;
  v84 = v2;
  v177 = 0;
  v176 = 0;
  v105 = &v175;
  v175 = 0;
  v86 = 0;
  v78 = sub_1DC76F71C();
  v79 = *(_QWORD *)(v78 - 8);
  v80 = (*(_QWORD *)(v79 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x1E0C80A78](0);
  v81 = (char *)v40 - v80;
  v82 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v4);
  v83 = (char *)v40 - v82;
  v117 = sub_1DC76EF54();
  v114 = *(_QWORD *)(v117 - 8);
  v85 = (*(_QWORD *)(v114 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v117);
  v115 = (char *)v40 - v85;
  v177 = v3;
  v176 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
  sub_1DC76F74C();
  v92 = MEMORY[0x1E0DEA968];
  v175 = sub_1DC76F410();
  v104 = 20;
  v111 = 1;
  v89 = sub_1DC76F464();
  v88 = v7;
  v87 = sub_1DC76F170();
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601C8);
  v91 = v174;
  v174[3] = v106;
  v174[0] = v87;
  v90 = v173;
  v173[0] = v89;
  v173[1] = v88;
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
  sub_1DC76F434();
  v97 = sub_1DC76F464();
  v98 = v8;
  v96 = sub_1DC76F140();
  v94 = v9;
  v95 = v10;
  sub_1DC757D94(v96, v9, v10 & 1);
  v93 = v169;
  v169[0] = v96;
  v169[1] = v94;
  v170 = v95 & 1;
  v99 = &v171;
  v172 = v92;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600F8);
  sub_1DC76EFFC();
  sub_1DC757DC4((uint64_t)v93);
  sub_1DC757DFC(v96, v94, v95 & 1);
  v167 = v97;
  v168 = v98;
  sub_1DC76F434();
  v100 = sub_1DC76F464();
  v101 = v11;
  v12 = sub_1DC76F1A0();
  v166 = v106;
  v165 = v12;
  v163 = v100;
  v164 = v101;
  sub_1DC76F434();
  v102 = sub_1DC76F464();
  v103 = v13;
  v14 = sub_1DC76F1C4();
  v162 = MEMORY[0x1E0DEBB98];
  v161 = v14;
  v159 = v102;
  v160 = v103;
  sub_1DC76F434();
  v107 = sub_1DC76F464();
  v108 = v15;
  v16 = sub_1DC76F17C();
  v158 = v106;
  v157 = v16;
  v155 = v107;
  v156 = v108;
  sub_1DC76F434();
  v112 = sub_1DC76F464();
  v113 = v17;
  sub_1DC76F134();
  v116 = sub_1DC76EF48();
  v118 = v18;
  (*(void (**)(char *, uint64_t))(v114 + 8))(v115, v117);
  if ((v118 & 1) != 0)
  {
    v151 = 0;
    v152 = 0;
    v153 = 0;
    v154 = 0;
  }
  else
  {
    v77 = v116;
    v154 = MEMORY[0x1E0DEB418];
    v151 = v116;
  }
  v150[4] = v112;
  v150[5] = v113;
  sub_1DC76F434();
  v72 = sub_1DC76F464();
  v73 = v19;
  sub_1DC76F1D0();
  v74 = v20;
  v150[3] = MEMORY[0x1E0DEB070];
  v75 = (_DWORD *)MEMORY[0x1E0DED4F0];
  (*(void (**)(char *, _QWORD, uint64_t))(v79 + 104))(v83, *MEMORY[0x1E0DED4F0], v78);
  v149 = v74;
  (*(void (**)(char *, char *, uint64_t))(v79 + 16))(v81, v83, v78);
  v76 = (*(uint64_t (**)(char *, uint64_t))(v79 + 88))(v81, v78);
  if (v76 == *v75)
  {
    v149 = round(v74);
    goto LABEL_17;
  }
  if (v76 == *MEMORY[0x1E0DED4E8])
  {
    v149 = rint(v74);
    goto LABEL_17;
  }
  if (v76 == *MEMORY[0x1E0DED500])
  {
LABEL_14:
    v149 = ceil(v74);
    goto LABEL_17;
  }
  if (v76 == *MEMORY[0x1E0DED508])
  {
LABEL_16:
    v149 = floor(v74);
    goto LABEL_17;
  }
  if (v76 == *MEMORY[0x1E0DED4D8])
  {
    v149 = trunc(v74);
    goto LABEL_17;
  }
  if (v76 == *MEMORY[0x1E0DED4E0])
  {
    if ((sub_1DC76F5B4() & 1) == 0)
      goto LABEL_14;
    goto LABEL_16;
  }
  sub_1DC76F5A8();
  (*(void (**)(char *, uint64_t))(v79 + 8))(v81, v78);
LABEL_17:
  v50 = v150;
  *(double *)v150 = v149;
  (*(void (**)(char *, uint64_t))(v79 + 8))(v83, v78);
  v148[10] = v72;
  v148[11] = v73;
  v69 = &v175;
  sub_1DC76F434();
  v68 = 1;
  v51 = sub_1DC76F464();
  v52 = v21;
  v22 = sub_1DC76F128();
  v60 = MEMORY[0x1E0DEA968];
  v148[9] = MEMORY[0x1E0DEA968];
  v148[6] = v22;
  v148[7] = v23;
  v148[4] = v51;
  v148[5] = v52;
  sub_1DC76F434();
  v57 = sub_1DC76F464();
  v58 = v24;
  v56 = sub_1DC76F1DC();
  v54 = v25;
  v55 = v26;
  sub_1DC759EF0(v56, v25, v26 & 1);
  v53 = v146;
  v146[0] = v56;
  v146[1] = v54;
  v147 = v55 & 1;
  v59 = v148;
  v148[3] = v60;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60100);
  sub_1DC76EFFC();
  sub_1DC759F20((uint64_t)v53);
  sub_1DC759F58(v56, v54, v55 & 1);
  v144 = v57;
  v145 = v58;
  sub_1DC76F434();
  v61 = sub_1DC76F464();
  v62 = v27;
  v28 = sub_1DC76F158();
  v143 = v60;
  v141 = v28;
  v142 = v29;
  v139 = v61;
  v140 = v62;
  sub_1DC76F434();
  v65 = 21;
  v63 = sub_1DC76F464();
  v64 = v30;
  v31 = sub_1DC76F188();
  v138 = v106;
  v137 = v31;
  v135 = v63;
  v136 = v64;
  sub_1DC76F434();
  v66 = sub_1DC76F464();
  v67 = v32;
  v33 = sub_1DC76F194();
  v134 = v106;
  v133 = v33;
  v131 = v66;
  v132 = v67;
  sub_1DC76F434();
  v70 = sub_1DC76F464();
  v71 = v34;
  v35 = sub_1DC76F14C();
  v130 = v106;
  v129 = v35;
  v127 = v70;
  v128 = v71;
  sub_1DC76F434();
  v125 = sub_1DC76F1AC();
  v126 = v36;
  v49 = v36 != 0;
  v48 = v49;
  sub_1DC75C200();
  if (v48)
  {
    v44 = sub_1DC76F464();
    v45 = v37;
    v46 = sub_1DC76F1AC();
    v47 = v38;
    if (v38)
    {
      v42 = v46;
      v43 = v47;
      v124 = MEMORY[0x1E0DEA968];
      v121 = v46;
      v122 = v47;
    }
    else
    {
      v121 = 0;
      v122 = 0;
      v123 = 0;
      v124 = 0;
    }
    v119 = v44;
    v120 = v45;
    sub_1DC76F434();
  }
  v40[1] = &v175;
  v41 = v175;
  swift_bridgeObjectRetain();
  sub_1DC75A0B4();
  return v41;
}

_BYTE *sub_1DC75AC60(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *result;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(_BYTE *, _QWORD);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(_BYTE *, _QWORD);
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[32];
  uint64_t v52;
  uint64_t v53;
  _BYTE v54[32];
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[4];
  char v58[32];
  _QWORD v59[4];
  char v60[32];
  _QWORD v61[4];
  char v62[32];
  _QWORD v63[4];
  char v64[32];
  _QWORD v65[4];
  _BYTE v66[40];
  char v67[32];
  _QWORD v68[4];
  char v69[32];
  _QWORD v70[4];
  char v71[32];
  _QWORD v72[4];
  void *v73;
  _BYTE v74[32];
  char v75[48];
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE __b[40];
  _BYTE v80[40];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  memset(__b, 0, sizeof(__b));
  v47 = 0;
  v48 = 0;
  v46 = 0;
  v44 = 0;
  v43 = 0;
  v50 = a1;
  v49 = v1;
  swift_bridgeObjectRetain();
  sub_1DC76F404();
  memcpy(__b, v80, sizeof(__b));
  while (1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60170);
    sub_1DC76F41C();
    sub_1DC75C228(v75, &v76);
    if (!v77)
    {
      result = __b;
      sub_1DC75C290();
      return result;
    }
    v32 = v76;
    v33 = v77;
    v47 = v76;
    v48 = v77;
    sub_1DC751E1C((uint64_t)&v78, (uint64_t)v74);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
    sub_1DC76F74C();
    v34 = v2;
    *v2 = sub_1DC76F464();
    v34[1] = v3;
    swift_bridgeObjectRetain();
    v34[5] = MEMORY[0x1E0DEA968];
    v34[2] = v32;
    v34[3] = v33;
    v34[6] = sub_1DC76F464();
    v34[7] = v4;
    sub_1DC75C30C((uint64_t)v74, (uint64_t)(v34 + 8));
    sub_1DC74CCA0();
    v46 = sub_1DC76F410();
    v73 = 0;
    v35 = (id)objc_opt_self();
    swift_bridgeObjectRetain();
    sub_1DC76F6E0();
    v37 = (id)sub_1DC76F3EC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v45 = v73;
    v38 = objc_msgSend(v35, sel_saveEvents_error_, v37, &v45);
    v36 = v45;
    v5 = v45;
    v6 = v73;
    v73 = v36;

    if (!v38)
    {
      v21 = v73;
      sub_1DC76EF6C();

      swift_willThrow();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v74);
      swift_bridgeObjectRelease();
      result = __b;
      sub_1DC75C290();
      return result;
    }
    v31 = sub_1DC76F3F8();

    v7 = swift_bridgeObjectRetain();
    (*(void (**)(uint64_t))((*v39 & *MEMORY[0x1E0DEEDD8]) + 0x60))(v7);
    MEMORY[0x1DF0CCDA0](v72);
    sub_1DC74CCE0();
    v30 = v72[3] == 0;
    sub_1DC7521C0((uint64_t)v72);
    swift_bridgeObjectRelease();
    if (v30)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60190);
      v52 = v31;
      v29 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))((*v39 & *MEMORY[0x1E0DEEDD8]) + 0x70))(v51, v8, v9);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
      sub_1DC76F434();
      v29(v51, 0);
      goto LABEL_29;
    }
    v10 = swift_bridgeObjectRetain();
    (*(void (**)(uint64_t))((*v39 & *MEMORY[0x1E0DEEDD8]) + 0x60))(v10);
    MEMORY[0x1DF0CCDA0](v70);
    sub_1DC74CCE0();
    if (!v70[3])
    {
      sub_1DC76F6C8();
      __break(1u);
    }
    sub_1DC751E1C((uint64_t)v70, (uint64_t)v71);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
    swift_dynamicCast();
    swift_bridgeObjectRelease();
    sub_1DC76F464();
    MEMORY[0x1DF0CCDA0](v68);
    sub_1DC74CCE0();
    if (!v68[3])
    {
      sub_1DC76F6C8();
      __break(1u);
    }
    sub_1DC751E1C((uint64_t)v68, (uint64_t)v69);
    v28 = MEMORY[0x1E0DEE9B8] + 8;
    swift_dynamicCast();
    sub_1DC76F464();
    sub_1DC76F704();
    MEMORY[0x1DF0CCDA0](v65, v66, v31, MEMORY[0x1E0DEC198], v28, MEMORY[0x1E0DEC1A0]);
    if (!v65[3])
    {
      sub_1DC76F6C8();
      __break(1u);
    }
    sub_1DC751E1C((uint64_t)v65, (uint64_t)v67);
    swift_dynamicCast();
    sub_1DC75C350((uint64_t)v66);
    sub_1DC74CCE0();
    sub_1DC76F464();
    MEMORY[0x1DF0CCDA0](v63);
    sub_1DC74CCE0();
    if (!v63[3])
    {
      sub_1DC76F6C8();
      __break(1u);
    }
    sub_1DC751E1C((uint64_t)v63, (uint64_t)v64);
    swift_dynamicCast();
    sub_1DC76F464();
    MEMORY[0x1DF0CCDA0](v61);
    sub_1DC74CCE0();
    if (!v61[3])
    {
      sub_1DC76F6C8();
      __break(1u);
    }
    sub_1DC751E1C((uint64_t)v61, (uint64_t)v62);
    swift_dynamicCast();
    sub_1DC76F464();
    MEMORY[0x1DF0CCDA0](v59);
    sub_1DC74CCE0();
    if (!v59[3])
    {
      sub_1DC76F6C8();
      __break(1u);
    }
    sub_1DC751E1C((uint64_t)v59, (uint64_t)v60);
    result = (_BYTE *)swift_dynamicCast();
    if (__OFADD__(v44, v42))
      break;
    v27 = v44 + v42;
    v44 += v42;
    sub_1DC76F464();
    MEMORY[0x1DF0CCDA0](v57);
    sub_1DC74CCE0();
    if (!v57[3])
    {
      sub_1DC76F6C8();
      __break(1u);
    }
    sub_1DC751E1C((uint64_t)v57, (uint64_t)v58);
    result = (_BYTE *)swift_dynamicCast();
    v26 = v43 + v41;
    if (__OFADD__(v43, v41))
      goto LABEL_33;
    v43 += v41;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60198);
    sub_1DC76F74C();
    v23 = v14;
    *v14 = sub_1DC76F464();
    v23[1] = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601B0);
    sub_1DC76F74C();
    v22 = v16;
    *v16 = sub_1DC76F464();
    v22[1] = v17;
    v22[2] = v27;
    v22[3] = sub_1DC76F464();
    v22[4] = v18;
    v22[5] = v26;
    sub_1DC74CCA0();
    v23[2] = sub_1DC76F410();
    sub_1DC74CCA0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60180);
    v24 = sub_1DC76F410();
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60178);
    v55 = v24;
    v25 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))((*v39 & *MEMORY[0x1E0DEEDD8]) + 0x70))(v54, v19, v20);
    sub_1DC76F434();
    v25(v54, 0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_29:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v74);
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

id FitCoreDQueryClass.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id FitCoreDQueryClass.init()()
{
  void *v0;
  id v1;
  id v2;
  uint64_t *v3;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  id v29;
  objc_super v30;
  void *v31;

  v1 = v0;
  v2 = v0;
  v31 = v0;
  v24 = OBJC_IVAR____TtC19AppleMediaDiscovery18FitCoreDQueryClass_tableUpdateSummary;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
  sub_1DC76F74C();
  *(_QWORD *)&v28[v24] = sub_1DC76F410();

  v27 = OBJC_IVAR____TtC19AppleMediaDiscovery18FitCoreDQueryClass_allFitnessTables;
  v26 = sub_1DC76F74C();
  v25 = v3;
  *v3 = sub_1DC76F464();
  v25[1] = v4;
  v25[2] = sub_1DC76F464();
  v25[3] = v5;
  v25[4] = sub_1DC76F464();
  v25[5] = v6;
  v25[6] = sub_1DC76F464();
  v25[7] = v7;
  v25[8] = sub_1DC76F464();
  v25[9] = v8;
  v25[10] = sub_1DC76F464();
  v25[11] = v9;
  v25[12] = sub_1DC76F464();
  v25[13] = v10;
  v25[14] = sub_1DC76F464();
  v25[15] = v11;
  v25[16] = sub_1DC76F464();
  v25[17] = v12;
  v25[18] = sub_1DC76F464();
  v25[19] = v13;
  v25[20] = sub_1DC76F464();
  v25[21] = v14;
  v25[22] = sub_1DC76F464();
  v25[23] = v15;
  v25[24] = sub_1DC76F464();
  v25[25] = v16;
  v25[26] = sub_1DC76F464();
  v25[27] = v17;
  v25[28] = sub_1DC76F464();
  v25[29] = v18;
  v25[30] = sub_1DC76F464();
  v25[31] = v19;
  v25[32] = sub_1DC76F464();
  v25[33] = v20;
  v25[34] = sub_1DC76F464();
  v25[35] = v21;
  sub_1DC74CCA0();
  *(_QWORD *)&v28[v27] = v26;

  v30.receiver = v31;
  v30.super_class = (Class)type metadata accessor for FitCoreDQueryClass();
  v29 = objc_msgSendSuper2(&v30, sel_init);
  v22 = v29;
  v31 = v29;

  return v29;
}

id FitCoreDQueryClass.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FitCoreDQueryClass();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC75C200()
{
  swift_bridgeObjectRelease();
}

void *sub_1DC75C228(const void *a1, void *a2)
{
  memcpy(a2, a1, 0x30uLL);
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC75C290()
{
  sub_1DC75C2CC();
}

uint64_t sub_1DC75C2CC()
{
  return swift_release();
}

uint64_t sub_1DC75C30C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC75C350(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  if ((*(_DWORD *)(*(_QWORD *)(v2 - 8) + 80) & 0x20000) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1);
}

uint64_t type metadata accessor for FitCoreDQueryClass()
{
  return objc_opt_self();
}

uint64_t method lookup function for FitCoreDQueryClass()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FitCoreDQueryClass.filterFitcoreDCatalog(catalogFilterConfig:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)((*v1 & *MEMORY[0x1E0DEEDD8]) + 0x90)
                                       + **(int **)((*v1 & *MEMORY[0x1E0DEEDD8]) + 0x90));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_1DC75C4B4;
  return v5(a1);
}

uint64_t sub_1DC75C4B4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of FitCoreDQueryClass.queryWorkoutReferences(workoutQueryConfig:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)((*v1 & *MEMORY[0x1E0DEEDD8]) + 0x98)
                                       + **(int **)((*v1 & *MEMORY[0x1E0DEEDD8]) + 0x98));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_1DC75C5B4;
  return v5(a1);
}

uint64_t sub_1DC75C5B4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of FitCoreDQueryClass.filterFitcoreDCatalogDebug(catalogFilterConfig:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)((*v1 & *MEMORY[0x1E0DEEDD8]) + 0xA0)
                                       + **(int **)((*v1 & *MEMORY[0x1E0DEEDD8]) + 0xA0));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_1DC75C6B4;
  return v5(a1);
}

uint64_t sub_1DC75C6B4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of FitCoreDQueryClass.fetchCatalogMetadata()()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  *(_QWORD *)(v1 + 16) = v1;
  v4 = (uint64_t (*)(void))(*(_QWORD *)((*v0 & *MEMORY[0x1E0DEEDD8]) + 0xA8)
                         + **(int **)((*v0 & *MEMORY[0x1E0DEEDD8]) + 0xA8));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_1DC75C7AC;
  return v4();
}

uint64_t sub_1DC75C7AC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t dispatch thunk of FitCoreDQueryClass.runBootstrapCatalogSync(bootstrapCatalogSyncConfig:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)((*v1 & *MEMORY[0x1E0DEEDD8]) + 0xB0)
                                       + **(int **)((*v1 & *MEMORY[0x1E0DEEDD8]) + 0xB0));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_1DC75C8AC;
  return v5(a1);
}

uint64_t sub_1DC75C8AC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t sub_1DC75C914(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if (result > 0)
    {
      sub_1DC76F08C();
      v1 = sub_1DC76F518();
      *(_QWORD *)(v1 + 16) = v4;
      v3 = v1;
    }
    else
    {
      v2 = MEMORY[0x1E0DEE9D8];
      swift_retain();
      v3 = v2;
    }
    sub_1DC76F08C();
    return v3;
  }
  return result;
}

uint64_t sub_1DC75C9CC(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

void sub_1DC75C9D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  unint64_t j;
  char *v20;
  _BYTE *v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  unint64_t v39;
  char *v40;
  _BYTE __dst[72];
  char v43;

  v33 = a1;
  v34 = *(_QWORD *)(sub_1DC76F08C() - 8);
  v35 = (*(_QWORD *)(v34 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = MEMORY[0x1E0C80A78](v33);
  v36 = (uint64_t)&v14 - v35;
  v37 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0;
  v3 = MEMORY[0x1E0C80A78](v1);
  v38 = (char *)&v14 - v37;
  v39 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = MEMORY[0x1E0C80A78](v3);
  v40 = (char *)&v14 - v39;
  if (sub_1DC75CEA0(v5))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AB30);
    v32 = sub_1DC76F65C();
  }
  else
  {
    v31 = MEMORY[0x1E0DEE9E8];
    swift_retain();
    v32 = v31;
  }
  v29 = v32;
  v30 = sub_1DC75C9CC(v33);
  if (v30)
  {
    v27 = v29 + 56;
    for (i = 0; ; i = v26)
    {
      v25 = i;
      v24 = sub_1DC75CEB4();
      sub_1DC75CEC0(v25, v24 & 1, v33);
      sub_1DC75CF1C(v25, v24 & 1, v33);
      v26 = v25 + 1;
      if (__OFADD__(v25, 1))
        break;
      sub_1DC75CFDC(v40, v38);
      v20 = &v43;
      sub_1DC76F770();
      v21 = __dst;
      memcpy(__dst, v20, sizeof(__dst));
      sub_1DC76F080();
      v7 = sub_1DC76F77C();
      v22 = (1 << (*(_BYTE *)(v29 + 32) & 0x3F)) - 1;
      v23 = v7 & v22;
      if ((*(_QWORD *)(v27 + 8 * (v23 / 0x40)) & (1 << ((v23 % 0x40) & 0x3F))) != 0)
      {
        for (j = v23; ; j = v16)
        {
          v17 = j;
          sub_1DC75D078();
          v18 = MEMORY[0x1DF0CC9EC](v36, v38);
          sub_1DC75D38C(v36);
          if ((v18 & 1) != 0)
            break;
          v16 = (v17 + 1) & v22;
          if ((*(_QWORD *)(v27 + 8 * (v16 / 0x40)) & (1 << ((v16 % 0x40) & 0x3F))) == 0)
          {
            v15 = v16;
            goto LABEL_18;
          }
        }
        sub_1DC75D38C((uint64_t)v38);
      }
      else
      {
        v15 = v23;
LABEL_18:
        v8 = v29;
        v9 = v38;
        v10 = v34;
        v11 = v15;
        *(_QWORD *)(v27 + 8 * (v15 / 0x40)) |= 1 << ((v15 % 0x40) & 0x3F);
        sub_1DC75CFDC(v9, (void *)(*(_QWORD *)(v8 + 48) + v11 * *(_QWORD *)(v10 + 72)));
        v12 = *(_QWORD *)(v29 + 16);
        v14 = v12 + 1;
        if (__OFADD__(v12, 1))
          goto LABEL_27;
        *(_QWORD *)(v29 + 16) = v14;
      }
      if (v26 == v30)
        goto LABEL_25;
    }
    __break(1u);
LABEL_27:
    __break(1u);
  }
  else
  {
LABEL_25:
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1DC75CEA0(uint64_t a1)
{
  return sub_1DC75C9CC(a1);
}

uint64_t sub_1DC75CEB4()
{
  return 1;
}

uint64_t sub_1DC75CEC0(uint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if (result < 0)
    {
      __break(1u);
    }
    else if (result < *(_QWORD *)(a3 + 16))
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

void sub_1DC75CF1C(uint64_t a1, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    sub_1DC76F08C();
    sub_1DC75D078();
  }
  else
  {
    sub_1DC75D4EC(a1, a3);
    if (*(_QWORD *)(*(_QWORD *)(sub_1DC76F08C() - 8) + 64) == 8)
    {
      sub_1DC75D078();
      swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
}

void *sub_1DC75CFDC(const void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v6;

  v6 = sub_1DC76F08C();
  if (swift_getEnumCaseMultiPayload() == 5)
  {
    v2 = sub_1DC76F02C();
    (*(void (**)(void *, const void *))(*(_QWORD *)(v2 - 8) + 32))(a2, a1);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a2, a1, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  return a2;
}

void sub_1DC75D078()
{
  char *v0;

  sub_1DC76F08C();
  v0 = (char *)&loc_1DC75D0BC + *((int *)qword_1DC75D360 + swift_getEnumCaseMultiPayload());
  __asm { BR              X8 }
}

uint64_t sub_1DC75D0CC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = *(_QWORD **)(v0 - 24);
  **(_QWORD **)(v0 - 32) = *v1;
  *(_QWORD *)(v0 - 40) = v1[1];
  swift_bridgeObjectRetain();
  *(_QWORD *)(*(_QWORD *)(v0 - 32) + 8) = *(_QWORD *)(v0 - 40);
  swift_storeEnumTagMultiPayload();
  return *(_QWORD *)(v0 - 32);
}

uint64_t sub_1DC75D38C(uint64_t a1)
{
  unint64_t EnumCaseMultiPayload;

  sub_1DC76F08C();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload <= 0xA)
    __asm { BR              X8 }
  return a1;
}

uint64_t sub_1DC75D4EC(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];
  int v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD v25[2];
  uint64_t v26;

  v21 = a1;
  v19 = a2;
  v20 = "Fatal error";
  v22 = sub_1DC76F08C();
  v23 = (*(_QWORD *)(*(_QWORD *)(v22 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  result = MEMORY[0x1E0C80A78](v21);
  v24 = (uint64_t)v9 - v23;
  if (result < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v21 >= *(_QWORD *)(v19 + 16))
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v17 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x20 + 8 * v21);
  v18 = &v26;
  v26 = v17;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  if ((swift_dynamicCast() & 1) == 0)
  {
    v3 = sub_1DC75D724(82);
    v11 = v25;
    v25[0] = v3;
    v25[1] = v4;
    v10 = 1;
    sub_1DC76F464();
    v9[0] = v5;
    sub_1DC76F47C();
    swift_bridgeObjectRelease();
    sub_1DC76F464();
    v9[1] = v6;
    sub_1DC76F47C();
    swift_bridgeObjectRelease();
    v16 = 11;
    sub_1DC76F464();
    v12 = v7;
    sub_1DC76F47C();
    swift_bridgeObjectRelease();
    ObjectType = swift_getObjectType();
    swift_unknownObjectRelease();
    v15 = 0;
    sub_1DC76F788();
    v14 = v8;
    sub_1DC76F47C();
    swift_bridgeObjectRelease();
    sub_1DC76F458();
    sub_1DC76F6D4();
    __break(1u);
  }
  sub_1DC75D38C(v24);
  return v17;
}

uint64_t sub_1DC75D724(uint64_t a1)
{
  swift_bridgeObjectRetain();
  if (a1 > 15)
    sub_1DC76F668();
  return 0;
}

unint64_t sub_1DC75D79C()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1EDB60208;
  if (!qword_1EDB60208)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1EDB60208);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;

  v3 = result;
  if ((*(_DWORD *)(*(_QWORD *)(result[3] - 8) + 80) & 0x20000) != 0)
  {
    v1 = swift_allocBox();
    result = v2;
    *v3 = v1;
  }
  return result;
}

uint64_t static AMDSwiftTests.strToInt(strValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v13;

  swift_bridgeObjectRetain();
  sub_1DC75DB80();
  sub_1DC75DBE8();
  sub_1DC76F6B0();
  if ((v13 & 1) != 0)
    v9 = sub_1DC76F464();
  else
    v9 = sub_1DC76F494();
  v10 = v2;
  sub_1DC76F5FC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AB40);
  sub_1DC76F74C();
  v7 = v3;
  swift_bridgeObjectRetain();
  v5 = MEMORY[0x1E0DEA968];
  v7[3] = MEMORY[0x1E0DEA968];
  v6 = sub_1DC75DC50();
  v7[4] = v6;
  *v7 = a1;
  v7[1] = a2;
  swift_bridgeObjectRetain();
  v7[8] = v5;
  v7[9] = v6;
  v7[5] = v9;
  v7[6] = v10;
  sub_1DC74CCA0();
  v8 = (id)sub_1DC75DCB8();
  sub_1DC76F3B0();

  swift_bridgeObjectRelease();
  return v9;
}

unint64_t sub_1DC75DB80()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1F039AB38;
  if (!qword_1F039AB38)
  {
    v0 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEDCB0], MEMORY[0x1E0DEDC60]);
    atomic_store(v0, (unint64_t *)&qword_1F039AB38);
    return v0;
  }
  return v2;
}

unint64_t sub_1DC75DBE8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EDB60160;
  if (!qword_1EDB60160)
  {
    v0 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(v0, (unint64_t *)&qword_1EDB60160);
    return v0;
  }
  return v2;
}

unint64_t sub_1DC75DC50()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1F039AB48;
  if (!qword_1F039AB48)
  {
    v0 = MEMORY[0x1DF0CD700](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(v0, (unint64_t *)&qword_1F039AB48);
    return v0;
  }
  return v2;
}

uint64_t sub_1DC75DCB8()
{
  sub_1DC75DE98();
  return sub_1DC76F614();
}

id AMDSwiftTests.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AMDSwiftTests.init()()
{
  id v0;
  id v2;
  objc_super v3;
  id v4;

  v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for AMDSwiftTests();
  v2 = objc_msgSendSuper2(&v3, sel_init);
  v0 = v2;
  v4 = v2;

  return v2;
}

uint64_t type metadata accessor for AMDSwiftTests()
{
  return objc_opt_self();
}

id AMDSwiftTests.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AMDSwiftTests();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1DC75DE98()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1F039AB78;
  if (!qword_1F039AB78)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1F039AB78);
    return ObjCClassMetadata;
  }
  return v2;
}

uint64_t sub_1DC75DEFC()
{
  uint64_t v1;

  v1 = sub_1DC76F3D4();
  __swift_allocate_value_buffer(v1, qword_1EDB60310);
  __swift_project_value_buffer(v1, (uint64_t)qword_1EDB60310);
  return sub_1DC76F3C8();
}

uint64_t sub_1DC75DF44()
{
  uint64_t v0;

  if (qword_1EDB602F8 != -1)
    swift_once();
  v0 = sub_1DC76F3D4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EDB60310);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
    return *(_QWORD *)a2;
  return v3;
}

uint64_t sub_1DC75DFE4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2[2] = v2;
  v2[3] = 0;
  v2[4] = 0;
  v2[3] = a1;
  v2[4] = v1;
  return swift_task_switch();
}

uint64_t sub_1DC75E01C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v7;

  *(_QWORD *)(v0 + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
  sub_1DC76F74C();
  v7 = v1;
  *v1 = sub_1DC76F464();
  v7[1] = v2;
  v3 = sub_1DC76F464();
  v7[5] = MEMORY[0x1E0DEA968];
  v7[2] = v3;
  v7[3] = v4;
  sub_1DC74CCA0();
  v5 = sub_1DC76F410();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v0 + 16) + 8))(v5);
}

uint64_t sub_1DC75E1A4(void *a1, const void *a2, void *a3)
{
  _QWORD *v3;
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v10;
  uint64_t v11;

  v3[4] = a3;
  v3[3] = a1;
  v3[2] = v3;
  v5 = a1;
  v3[5] = _Block_copy(a2);
  v6 = a3;
  v11 = sub_1DC76F3F8();
  v3[6] = v11;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v10 + 56) = v7;
  *v7 = *(_QWORD *)(v10 + 16);
  v7[1] = sub_1DC75E26C;
  return sub_1DC75DFE4(v11);
}

uint64_t sub_1DC75E26C()
{
  uint64_t *v0;
  void *v2;
  void *v3;
  id v4;
  void (**aBlock)(void);
  uint64_t v6;

  v6 = *v0;
  aBlock = *(void (***)(void))(*v0 + 40);
  v3 = *(void **)(*v0 + 32);
  v2 = *(void **)(*v0 + 24);
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  v4 = (id)sub_1DC76F3EC();
  aBlock[2]();

  _Block_release(aBlock);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v6 + 16) + 8))();
}

uint64_t sub_1DC75E358()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1DC75E3A4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  const void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)(v1 + 16) = v1;
  v6 = (void *)v0[2];
  v4 = (const void *)v0[3];
  v5 = (void *)v0[4];
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = *(_QWORD *)(v1 + 16);
  v2[1] = sub_1DC75E450;
  return ((uint64_t (*)(void *, const void *, void *))((char *)&dword_1F039AB88 + dword_1F039AB88))(v6, v4, v5);
}

uint64_t sub_1DC75E450()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  *(_QWORD *)(*v0 + 16) = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 16) + 8))();
}

id SearchToolQueryHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SearchToolQueryHandler.init()()
{
  id v0;
  id v2;
  objc_super v3;
  id v4;

  v4 = 0;
  v3.receiver = 0;
  v3.super_class = (Class)type metadata accessor for SearchToolQueryHandler();
  v2 = objc_msgSendSuper2(&v3, sel_init);
  v0 = v2;
  v4 = v2;

  return v2;
}

uint64_t type metadata accessor for SearchToolQueryHandler()
{
  return objc_opt_self();
}

id SearchToolQueryHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;
  void *v3;

  v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchToolQueryHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SearchToolQueryHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SearchToolQueryHandler.querySearchTool(searchtoolQueryConfig:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = v2;
  v5 = (uint64_t (*)(uint64_t))(*(_QWORD *)((*v1 & *MEMORY[0x1E0DEEDD8]) + 0x50)
                                       + **(int **)((*v1 & *MEMORY[0x1E0DEEDD8]) + 0x50));
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = *(_QWORD *)(v2 + 16);
  v3[1] = sub_1DC75E680;
  return v5(a1);
}

uint64_t sub_1DC75E680(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(*v1 + 16) = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 16) + 8))(a1);
}

uint64_t __swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v5;

  v5 = a2;
  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v2 = swift_slowAlloc();
    *a2 = v2;
    return v2;
  }
  return (uint64_t)v5;
}

uint64_t sub_1DC75E758()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v7 = sub_1DC76F74C();
  v6 = v0;
  *v0 = sub_1DC76F464();
  v6[1] = v1;
  v6[2] = sub_1DC76F464();
  v6[3] = v2;
  v3 = sub_1DC76F464();
  result = v7;
  v6[4] = v3;
  v6[5] = v5;
  sub_1DC74CCA0();
  qword_1EDB60308 = v7;
  return result;
}

uint64_t *sub_1DC75E82C()
{
  if (qword_1EDB602F0 != -1)
    swift_once();
  return &qword_1EDB60308;
}

uint64_t sub_1DC75E880()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;

  v5 = sub_1DC76F74C();
  v4 = v0;
  v1 = sub_1DC76F464();
  result = v5;
  *v4 = v1;
  v4[1] = v3;
  sub_1DC74CCA0();
  qword_1F039AE90 = v5;
  return result;
}

uint64_t *sub_1DC75E8FC()
{
  if (qword_1F039ACC8 != -1)
    swift_once();
  return &qword_1F039AE90;
}

uint64_t sub_1DC75E950(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      return 0;
    case 2:
      return 1;
    case 3:
      return 2;
    case 4:
      return 3;
  }
  return 4;
}

void sub_1DC75EA0C(char a1)
{
  __asm { BR              X8 }
}

uint64_t sub_1DC75EA44()
{
  return 1;
}

uint64_t sub_1DC75EA90()
{
  sub_1DC75EAD8();
  return sub_1DC76F758() & 1;
}

unint64_t sub_1DC75EAD8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1F039ABC8;
  if (!qword_1F039ABC8)
  {
    v0 = MEMORY[0x1DF0CD700](&unk_1DC774058, &unk_1EA4B69E0);
    atomic_store(v0, (unint64_t *)&qword_1F039ABC8);
    return v0;
  }
  return v2;
}

uint64_t sub_1DC75EB44()
{
  sub_1DC75EAD8();
  return sub_1DC76F4C4();
}

uint64_t sub_1DC75EB80()
{
  sub_1DC75EAD8();
  return sub_1DC76F4DC();
}

uint64_t sub_1DC75EBC4()
{
  sub_1DC75EAD8();
  return sub_1DC76F4D0();
}

uint64_t sub_1DC75EC08@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_1DC75E950(*a1);
  *a2 = result;
  return result;
}

void sub_1DC75EC34(_QWORD *a1@<X8>)
{
  char *v1;
  uint64_t v2;

  sub_1DC75EA0C(*v1);
  *a1 = v2;
}

uint64_t sub_1DC75EC60()
{
  uint64_t v0;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client);
  swift_retain();
  return v2;
}

id AMDVectorDBManager.__allocating_init(vectorDBConfig:)(uint64_t a1)
{
  objc_class *v1;
  id v2;
  uint64_t v4;
  uint64_t v5;
  id v7;

  v2 = objc_allocWithZone(v1);
  v7 = AMDVectorDBManager.init(vectorDBConfig:)(a1);
  if (v5)
    return (id)v4;
  else
    return v7;
}

id AMDVectorDBManager.init(vectorDBConfig:)(uint64_t a1)
{
  void *v1;
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
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  _QWORD v97[3];
  id v98;
  uint64_t v99;
  _BYTE *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  _BYTE *v110;
  uint64_t v111;
  uint64_t v112;
  _BYTE *v113;
  uint64_t v114;
  _BYTE *v115;
  uint64_t v116;
  uint64_t v117;
  objc_class *v118;
  uint64_t v119;
  _BYTE *v120;
  uint64_t v121;
  _BYTE *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  _BYTE *v126;
  uint64_t v127;
  uint64_t v128;
  _BYTE *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint8_t *v134;
  uint64_t v135;
  uint64_t v136;
  _BYTE **v137;
  uint64_t *v138;
  uint64_t *v139;
  uint64_t v140;
  uint32_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  _QWORD *v151;
  NSObject *v152;
  int v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  int v158;
  unint64_t v159;
  uint64_t v160;
  uint64_t *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t *v164;
  uint64_t v165;
  uint64_t v166;
  id v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  id v173;
  _BOOL4 v174;
  _BOOL4 v175;
  id v176;
  _BYTE *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  id v182;
  uint64_t v183;
  void (*v184)(char *, uint64_t);
  id v185;
  id v186;
  id v187;
  id v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint8_t *v193;
  uint64_t v194;
  uint64_t v195;
  _BYTE **v196;
  uint64_t *v197;
  uint64_t *v198;
  uint64_t v199;
  void (*v200)(char *, uint64_t, uint64_t);
  unint64_t v201;
  unint64_t v202;
  uint64_t *v203;
  unint64_t v204;
  uint32_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  _QWORD *v215;
  uint64_t v216;
  NSObject *v217;
  int v218;
  _BYTE *v219;
  _QWORD *v220;
  _BOOL4 v221;
  _BOOL4 v222;
  _BYTE *v223;
  _BYTE *v224;
  _BYTE *v225;
  uint64_t v226;
  uint64_t v227;
  _QWORD *v228;
  _QWORD *v229;
  int v230;
  uint64_t *v231;
  uint64_t v232;
  uint64_t v233;
  id v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  id v241;
  uint64_t v242;
  _BOOL4 v243;
  _BOOL4 v244;
  char *v245;
  uint64_t v246;
  const char *v247;
  const char *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  unint64_t v252;
  char *v253;
  unint64_t v254;
  char *v255;
  uint64_t v256;
  uint64_t v257;
  unint64_t v258;
  char *v259;
  unint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  unint64_t v264;
  char *v265;
  unint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  unint64_t v271;
  char *v272;
  unint64_t v273;
  char *v274;
  uint64_t v275;
  _QWORD *v276;
  unint64_t v277;
  char *v278;
  unint64_t v279;
  char *v280;
  uint64_t v281;
  _QWORD *v282;
  uint64_t v283;
  _QWORD v284[2];
  uint64_t (*v285)(uint64_t, uint64_t, uint64_t);
  uint64_t v286;
  _BYTE *v287[3];
  uint64_t v288;
  uint64_t v289;
  uint64_t (*v290)(uint64_t, uint64_t, uint64_t);
  uint64_t v291;
  _BYTE *v292;
  objc_super v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint32_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  id v321;
  uint64_t v322;
  uint32_t v323;
  _QWORD v324[2];
  uint64_t v325;
  _BYTE *v326;
  _BYTE *v327;
  _BYTE *v328;
  _BYTE *v329;
  _QWORD v330[2];
  _QWORD v331[2];
  uint64_t v332;
  id v333;
  char *v334;
  char *v335;
  char *v336;
  char *v337;
  _QWORD v338[4];
  _BYTE v339[32];
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  _QWORD v344[4];
  _BYTE v345[40];
  _BYTE v346[32];
  _QWORD v347[4];
  _BYTE v348[40];
  _BYTE v349[32];
  _QWORD v350[4];
  _BYTE v351[40];
  _BYTE v352[32];
  _QWORD v353[4];
  _BYTE v354[40];
  _BYTE v355[32];
  _QWORD v356[4];
  _BYTE v357[40];
  void *v358;
  _QWORD v359[4];
  _QWORD v360[4];
  _BYTE v361[32];
  _QWORD v362[5];

  v281 = a1;
  v247 = "Fatal error";
  v248 = "Unexpectedly found nil while unwrapping an Optional value";
  v249 = "AppleMediaDiscovery/AMDVectorDB.swift";
  v362[4] = *MEMORY[0x1E0C80C00];
  v337 = 0;
  v336 = 0;
  v335 = 0;
  v334 = 0;
  v333 = 0;
  v332 = 0;
  v326 = 0;
  v327 = 0;
  v325 = 0;
  v320 = 0;
  v310 = 0;
  v311 = 0;
  v304 = 0;
  v305 = 0;
  v300 = 0;
  v294 = 0;
  v295 = 0;
  v268 = 0;
  v250 = sub_1DC76F29C();
  v251 = *(_QWORD *)(v250 - 8);
  v252 = (*(_QWORD *)(v251 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](0);
  v253 = (char *)v97 - v252;
  v254 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v2);
  v255 = (char *)v97 - v254;
  v337 = (char *)v97 - v254;
  v256 = sub_1DC76F2E4();
  v257 = *(_QWORD *)(v256 - 8);
  v258 = (*(_QWORD *)(v257 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x1E0C80A78](v268);
  v259 = (char *)v97 - v258;
  v260 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v4);
  v261 = (uint64_t)v97 - v260;
  v336 = (char *)v97 - v260;
  v262 = sub_1DC76F2B4();
  v263 = *(_QWORD *)(v262 - 8);
  v264 = (*(_QWORD *)(v263 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x1E0C80A78](v268);
  v265 = (char *)v97 - v264;
  v266 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v6);
  v267 = (uint64_t)v97 - v266;
  v335 = (char *)v97 - v266;
  v269 = sub_1DC76EFB4();
  v270 = *(_QWORD *)(v269 - 8);
  v271 = (*(_QWORD *)(v270 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = MEMORY[0x1E0C80A78](v268);
  v272 = (char *)v97 - v271;
  v273 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v8);
  v274 = (char *)v97 - v273;
  v334 = (char *)v97 - v273;
  v275 = sub_1DC76F3D4();
  v276 = *(_QWORD **)(v275 - 8);
  v277 = (v276[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = MEMORY[0x1E0C80A78](v281);
  v278 = (char *)v97 - v277;
  v279 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = MEMORY[0x1E0C80A78](v10);
  v280 = (char *)v97 - v279;
  v332 = v12;
  v13 = v1;
  v333 = v1;
  v14 = sub_1DC76F464();
  v282 = v331;
  v331[0] = v14;
  v331[1] = v15;
  MEMORY[0x1DF0CCDA0](v362);
  sub_1DC74CCE0();
  v244 = v362[3] == 0;
  v243 = v244;
  sub_1DC7521C0((uint64_t)v362);
  if (v243)
  {

    sub_1DC76D228();
    v230 = 1;
    v239 = sub_1DC76F464();
    v237 = v16;
    sub_1DC75EA0C(0);
    v238 = v17;
    v233 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
    v232 = sub_1DC76F74C();
    v231 = v18;
    v234 = (id)*MEMORY[0x1E0CB2D50];
    v19 = v234;
    v20 = sub_1DC76F44C();
    v21 = v231;
    *v231 = v20;
    v21[1] = v22;
    v23 = sub_1DC76F464();
    v24 = v231;
    v25 = v23;
    v26 = v232;
    v236 = MEMORY[0x1E0DEA968];
    v231[5] = MEMORY[0x1E0DEA968];
    v24[2] = v25;
    v24[3] = v27;
    sub_1DC74CCA0();
    v235 = v26;

    v28 = sub_1DC76F410();
    v241 = sub_1DC7609B8(v239, v237, v238, v28);
    swift_willThrow();
    v242 = (uint64_t)v241;
LABEL_38:
    v97[1] = v242;
    swift_bridgeObjectRelease();
    v97[2] = v333;
    type metadata accessor for AMDVectorDBManager();
    swift_deallocPartialClassInstance();
    return (id)v240;
  }
  v29 = sub_1DC76F464();
  v229 = v330;
  v330[0] = v29;
  v330[1] = v30;
  MEMORY[0x1DF0CCDA0](v360);
  sub_1DC74CCE0();
  if (!v360[3])
  {
    sub_1DC76F6C8();
    __break(1u);
  }
  v223 = v361;
  sub_1DC751E1C((uint64_t)v360, (uint64_t)v361);
  v227 = MEMORY[0x1E0DEE9B8] + 8;
  v226 = MEMORY[0x1E0DEA968];
  swift_dynamicCast();
  v224 = v328;
  v225 = v329;
  v326 = v328;
  v327 = v329;
  v325 = 50;
  v31 = sub_1DC76F464();
  v228 = v324;
  v324[0] = v31;
  v324[1] = v32;
  MEMORY[0x1DF0CCDA0](v359);
  sub_1DC74CCE0();
  v222 = v359[3] != 0;
  v221 = v222;
  sub_1DC7521C0((uint64_t)v359);
  if (v221)
  {
    v33 = sub_1DC76F464();
    v220 = v284;
    v284[0] = v33;
    v284[1] = v34;
    MEMORY[0x1DF0CCDA0](v338);
    sub_1DC74CCE0();
    if (!v338[3])
    {
      sub_1DC76F6C8();
      __break(1u);
    }
    v219 = v339;
    sub_1DC751E1C((uint64_t)v338, (uint64_t)v339);
    swift_dynamicCast();
    v325 = v283;
  }
  v35 = v280;
  v36 = sub_1DC75DF44();
  v200 = (void (*)(char *, uint64_t, uint64_t))v276[2];
  v200(v35, v36, v275);
  swift_bridgeObjectRetain();
  v207 = 32;
  v208 = 7;
  v37 = swift_allocObject();
  v38 = v225;
  v209 = v37;
  *(_QWORD *)(v37 + 16) = v224;
  *(_QWORD *)(v37 + 24) = v38;
  v217 = sub_1DC76F3BC();
  v218 = sub_1DC76F5F0();
  v203 = &v322;
  v322 = 12;
  v201 = sub_1DC76ADD8();
  v202 = sub_1DC76AE40();
  v204 = sub_1DC76AEA8();
  sub_1DC76F4B8();
  v205 = v323;
  v206 = 17;
  v211 = swift_allocObject();
  *(_BYTE *)(v211 + 16) = 32;
  v212 = swift_allocObject();
  *(_BYTE *)(v212 + 16) = 8;
  v39 = swift_allocObject();
  v40 = v209;
  v210 = v39;
  *(_QWORD *)(v39 + 16) = sub_1DC760A78;
  *(_QWORD *)(v39 + 24) = v40;
  v41 = swift_allocObject();
  v42 = v210;
  v214 = v41;
  *(_QWORD *)(v41 + 16) = sub_1DC76D078;
  *(_QWORD *)(v41 + 24) = v42;
  v216 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60248);
  v213 = sub_1DC76F74C();
  v215 = v43;
  swift_retain();
  v44 = v211;
  v45 = v215;
  *v215 = sub_1DC76D004;
  v45[1] = v44;
  swift_retain();
  v46 = v212;
  v47 = v215;
  v215[2] = sub_1DC76D034;
  v47[3] = v46;
  swift_retain();
  v48 = v214;
  v49 = v215;
  v215[4] = sub_1DC76D0C0;
  v49[5] = v48;
  sub_1DC74CCA0();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v217, (os_log_type_t)v218))
  {
    v193 = (uint8_t *)sub_1DC76F638();
    v192 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60210);
    v194 = sub_1DC76AF10(0);
    v195 = sub_1DC76AF10(1);
    v196 = v287;
    v287[0] = v193;
    v197 = &v341;
    v341 = v194;
    v198 = &v340;
    v340 = v195;
    sub_1DC76AF68(2, v287);
    sub_1DC76AF68(1, v196);
    v50 = v246;
    v285 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76D004;
    v286 = v211;
    sub_1DC76AF7C(&v285, (uint64_t)v196, (uint64_t)v197, (uint64_t)v198);
    v199 = v50;
    if (v50)
    {
      __break(1u);
    }
    else
    {
      v285 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76D034;
      v286 = v212;
      sub_1DC76AF7C(&v285, (uint64_t)v287, (uint64_t)&v341, (uint64_t)&v340);
      v190 = 0;
      v51 = v190;
      v285 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76D0C0;
      v286 = v214;
      sub_1DC76AF7C(&v285, (uint64_t)v287, (uint64_t)&v341, (uint64_t)&v340);
      v189 = v51;
      _os_log_impl(&dword_1DC678000, v217, (os_log_type_t)v218, "Fetching vectorDB config for dbName: %s", v193, v205);
      sub_1DC76AFC0(v194);
      sub_1DC76AFC0(v195);
      sub_1DC76F620();
      swift_release();
      swift_release();
      swift_release();
      v191 = v189;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    v191 = v246;
  }
  v183 = v191;

  v184 = (void (*)(char *, uint64_t))v276[1];
  v184(v280, v275);
  v358 = 0;
  v185 = (id)objc_opt_self();
  swift_bridgeObjectRetain();
  v187 = (id)sub_1DC76F440();
  swift_bridgeObjectRelease();
  v321 = v358;
  v188 = objc_msgSend(v185, sel_fetchVectorDBConfigForDBName_error_, v187, &v321);
  v186 = v321;
  v52 = v321;
  v53 = v358;
  v358 = v186;

  if (!v188)
  {

    v98 = v358;
    v99 = sub_1DC76EF6C();

    swift_willThrow();
    swift_bridgeObjectRelease();
    v242 = v99;
    goto LABEL_38;
  }
  v182 = v188;
  v176 = v188;
  v179 = MEMORY[0x1E0DEC198];
  v180 = MEMORY[0x1E0DEE9B8] + 8;
  v181 = MEMORY[0x1E0DEC1A0];
  v178 = sub_1DC76F3F8();
  v320 = v178;

  v318 = sub_1DC76F464();
  v319 = v54;
  v177 = v357;
  sub_1DC76F704();
  MEMORY[0x1DF0CCDA0](v356, v177, v178, v179, v180, v181);
  v175 = v356[3] == 0;
  v174 = v175;
  sub_1DC7521C0((uint64_t)v356);
  sub_1DC75C350((uint64_t)v357);
  sub_1DC74CCE0();
  if (v174)
  {

    v157 = 0;
    v159 = sub_1DC76D228();
    v158 = 1;
    v172 = sub_1DC76F464();
    v170 = v55;
    sub_1DC75EA0C(v158);
    v171 = v56;
    v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
    v154 = 1;
    v165 = sub_1DC76F74C();
    v164 = v57;
    v167 = (id)*MEMORY[0x1E0CB2D50];
    v58 = v167;
    v59 = sub_1DC76F44C();
    v60 = v164;
    *v164 = v59;
    v60[1] = v61;
    v155 = 30;
    v62 = sub_1DC76F740();
    v161 = &v288;
    v288 = v62;
    v289 = v63;
    sub_1DC76F464();
    v156 = v64;
    sub_1DC76F734();
    swift_bridgeObjectRelease();
    v287[1] = v224;
    v287[2] = v225;
    v169 = MEMORY[0x1E0DEA968];
    sub_1DC76F728();
    sub_1DC76F464();
    v160 = v65;
    sub_1DC76F734();
    swift_bridgeObjectRelease();
    v163 = v288;
    v162 = v289;
    swift_bridgeObjectRetain();
    sub_1DC76D28C();
    v66 = sub_1DC76F458();
    v67 = v164;
    v68 = v66;
    v69 = v165;
    v164[5] = v169;
    v67[2] = v68;
    v67[3] = v70;
    sub_1DC74CCA0();
    v168 = v69;

    v71 = sub_1DC76F410();
    v173 = sub_1DC7609B8(v172, v170, v171, v71);
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v242 = (uint64_t)v173;
    goto LABEL_38;
  }
  v72 = v278;
  v73 = sub_1DC75DF44();
  v200(v72, v73, v275);
  swift_bridgeObjectRetain();
  v143 = 32;
  v144 = 7;
  v74 = swift_allocObject();
  v75 = v225;
  v145 = v74;
  *(_QWORD *)(v74 + 16) = v224;
  *(_QWORD *)(v74 + 24) = v75;
  v152 = sub_1DC76F3BC();
  v153 = sub_1DC76F5F0();
  v316 = 12;
  sub_1DC76F4B8();
  v141 = v317;
  v142 = 17;
  v147 = swift_allocObject();
  *(_BYTE *)(v147 + 16) = 32;
  v148 = swift_allocObject();
  *(_BYTE *)(v148 + 16) = 8;
  v76 = swift_allocObject();
  v77 = v145;
  v146 = v76;
  *(_QWORD *)(v76 + 16) = sub_1DC76D12C;
  *(_QWORD *)(v76 + 24) = v77;
  v78 = swift_allocObject();
  v79 = v146;
  v150 = v78;
  *(_QWORD *)(v78 + 16) = sub_1DC76D1D4;
  *(_QWORD *)(v78 + 24) = v79;
  v149 = sub_1DC76F74C();
  v151 = v80;
  swift_retain();
  v81 = v147;
  v82 = v151;
  *v151 = sub_1DC76D160;
  v82[1] = v81;
  swift_retain();
  v83 = v148;
  v84 = v151;
  v151[2] = sub_1DC76D190;
  v84[3] = v83;
  swift_retain();
  v85 = v150;
  v86 = v151;
  v151[4] = sub_1DC76D21C;
  v86[5] = v85;
  sub_1DC74CCA0();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v152, (os_log_type_t)v153))
  {
    v134 = (uint8_t *)sub_1DC76F638();
    v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60210);
    v135 = sub_1DC76AF10(0);
    v136 = sub_1DC76AF10(1);
    v137 = &v292;
    v292 = v134;
    v138 = &v343;
    v343 = v135;
    v139 = &v342;
    v342 = v136;
    sub_1DC76AF68(2, &v292);
    sub_1DC76AF68(1, v137);
    v87 = v183;
    v290 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76D160;
    v291 = v147;
    sub_1DC76AF7C(&v290, (uint64_t)v137, (uint64_t)v138, (uint64_t)v139);
    v140 = v87;
    if (v87)
    {
      __break(1u);
    }
    else
    {
      v290 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76D190;
      v291 = v148;
      sub_1DC76AF7C(&v290, (uint64_t)&v292, (uint64_t)&v343, (uint64_t)&v342);
      v131 = 0;
      v88 = v131;
      v290 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76D21C;
      v291 = v150;
      sub_1DC76AF7C(&v290, (uint64_t)&v292, (uint64_t)&v343, (uint64_t)&v342);
      v130 = v88;
      _os_log_impl(&dword_1DC678000, v152, (os_log_type_t)v153, "Successfully fetched config for dbName: %s", v134, v141);
      sub_1DC76AFC0(v135);
      sub_1DC76AFC0(v136);
      sub_1DC76F620();
      swift_release();
      swift_release();
      swift_release();
      v132 = v130;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    v132 = v183;
  }
  v128 = v132;

  v184(v278, v275);
  v314 = sub_1DC76F464();
  v315 = v89;
  v129 = v354;
  sub_1DC76F704();
  MEMORY[0x1DF0CCDA0](v353, v129, v178, MEMORY[0x1E0DEC198], MEMORY[0x1E0DEE9B8] + 8, MEMORY[0x1E0DEC1A0]);
  if (!v353[3])
  {
    sub_1DC76F6C8();
    __break(1u);
  }
  v122 = v355;
  sub_1DC751E1C((uint64_t)v353, (uint64_t)v355);
  v127 = MEMORY[0x1E0DEE9B8] + 8;
  v125 = MEMORY[0x1E0DEA968];
  swift_dynamicCast();
  v124 = v312;
  v123 = v313;
  v310 = v312;
  v311 = v313;
  sub_1DC75C350((uint64_t)v354);
  sub_1DC74CCE0();
  sub_1DC76EF84();
  v308 = sub_1DC76F464();
  v309 = v90;
  v126 = v351;
  sub_1DC76F704();
  MEMORY[0x1DF0CCDA0](v350, v126, v178, MEMORY[0x1E0DEC198], v127, MEMORY[0x1E0DEC1A0]);
  if (!v350[3])
  {
    sub_1DC76F6C8();
    __break(1u);
  }
  v115 = v352;
  sub_1DC751E1C((uint64_t)v350, (uint64_t)v352);
  v121 = MEMORY[0x1E0DEE9B8] + 8;
  v119 = MEMORY[0x1E0DEA968];
  swift_dynamicCast();
  v117 = v306;
  v116 = v307;
  v304 = v306;
  v305 = v307;
  sub_1DC75C350((uint64_t)v351);
  sub_1DC74CCE0();
  v118 = (objc_class *)type metadata accessor for AMDVectorDBManager();
  sub_1DC76429C(v267);
  v302 = sub_1DC76F464();
  v303 = v91;
  v120 = v348;
  sub_1DC76F704();
  MEMORY[0x1DF0CCDA0](v347, v120, v178, MEMORY[0x1E0DEC198], v121, MEMORY[0x1E0DEC1A0]);
  if (!v347[3])
  {
    sub_1DC76F6C8();
    __break(1u);
  }
  v110 = v349;
  sub_1DC751E1C((uint64_t)v347, (uint64_t)v349);
  v112 = 8;
  v114 = MEMORY[0x1E0DEE9B8] + 8;
  swift_dynamicCast();
  v111 = v301;
  v300 = v301;
  sub_1DC75C350((uint64_t)v348);
  sub_1DC74CCE0();
  v298 = sub_1DC76F464();
  v299 = v92;
  v113 = v345;
  sub_1DC76F704();
  MEMORY[0x1DF0CCDA0](v344, v113, v178, MEMORY[0x1E0DEC198], v114, MEMORY[0x1E0DEC1A0]);
  if (!v344[3])
  {
    sub_1DC76F6C8();
    __break(1u);
  }
  v100 = v346;
  sub_1DC751E1C((uint64_t)v344, (uint64_t)v346);
  swift_dynamicCast();
  v101 = v296;
  v108 = v297;
  v294 = v296;
  v295 = v297;
  sub_1DC75C350((uint64_t)v345);
  sub_1DC74CCE0();
  sub_1DC764414(v261);
  (*(void (**)(char *, char *, uint64_t))(v270 + 16))(v272, v274, v269);
  (*(void (**)(char *, uint64_t, uint64_t))(v263 + 16))(v265, v267, v262);
  v107 = 0;
  sub_1DC76F2F0();
  v103 = sub_1DC76F74C();
  v104 = v325;
  (*(void (**)(char *, uint64_t, uint64_t))(v257 + 16))(v259, v261, v256);
  v105 = sub_1DC760AB4();
  v106 = sub_1DC760AC0();
  v102 = sub_1DC760ACC();
  sub_1DC760AD8();
  sub_1DC76F290();
  sub_1DC76F284();
  (*(void (**)(char *, char *, uint64_t))(v251 + 16))(v253, v255, v250);
  v93 = sub_1DC76F230();
  v94 = v245;
  *(_QWORD *)&v245[OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client] = v93;

  (*(void (**)(char *, uint64_t))(v251 + 8))(v255, v250);
  (*(void (**)(uint64_t, uint64_t))(v257 + 8))(v261, v256);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v263 + 8))(v267, v262);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v270 + 8))(v274, v269);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v293.receiver = v333;
  v293.super_class = v118;
  v109 = objc_msgSendSuper2(&v293, sel_init);
  v95 = v109;
  v333 = v109;
  swift_bridgeObjectRelease();

  return v109;
}

id sub_1DC7609B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  return sub_1DC76ACF4(a1, a2, a3, a4);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC760A0C()
{
  swift_bridgeObjectRetain();
}

uint64_t sub_1DC760A3C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DC760A78()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  sub_1DC760A0C();
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC760A84()
{
  swift_bridgeObjectRetain();
}

uint64_t sub_1DC760AB4()
{
  return 100;
}

uint64_t sub_1DC760AC0()
{
  return 64;
}

uint64_t sub_1DC760ACC()
{
  return 3;
}

float sub_1DC760AD8()
{
  return 10.0;
}

id AMDVectorDBManager.__deallocating_deinit()
{
  uint64_t v0;
  void *v2;
  objc_super v3;
  uint64_t v4;

  v4 = v0;
  swift_retain();
  sub_1DC76F26C();
  swift_release();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for AMDVectorDBManager();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1DC760CDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  void *v44;
  void *v45;
  void *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE **v61;
  uint64_t *v62;
  uint64_t *v63;
  void *v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t *v68;
  uint32_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  NSObject *v81;
  int v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  void *v95;
  int v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  unint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  char *v130;
  unint64_t v131;
  char *v132;
  uint64_t v133;
  _BYTE *v134;
  char *v135;
  size_t v136;
  void *v137;
  void *i;
  uint64_t v139;
  uint64_t v140;
  char v141;
  uint64_t v142;
  char v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t (*v148)(uint64_t, uint64_t, uint64_t);
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  _BYTE *v152;
  uint64_t v153;
  uint32_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _BYTE __b[40];
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  char v165;

  v133 = a1;
  v164 = 0;
  v163 = 0;
  v162 = 0;
  v161 = 0;
  v134 = __b;
  v136 = 40;
  memset(__b, 0, sizeof(__b));
  v156 = 0;
  v155 = 0;
  v146 = 0;
  v147 = 0;
  v145 = 0;
  v139 = 0;
  v125 = 0;
  v121 = sub_1DC76F3D4();
  v122 = *(_QWORD *)(v121 - 8);
  v123 = (*(_QWORD *)(v122 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v124 = (char *)&v44 - v123;
  v126 = sub_1DC76F308();
  v127 = *(_QWORD *)(v126 - 8);
  v129 = *(_QWORD *)(v127 + 64);
  v128 = (v129 + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](v125);
  v130 = (char *)&v44 - v128;
  v131 = (v129 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v2);
  v132 = (char *)&v44 - v131;
  v164 = (char *)&v44 - v131;
  v163 = v3;
  v162 = v1;
  v161 = sub_1DC76F74C();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F039ABE0);
  v135 = &v165;
  sub_1DC76F404();
  v4 = v137;
  memcpy(v134, v135, v136);
  for (i = v4; ; i = v116)
  {
    v116 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F039ABE8);
    sub_1DC76F41C();
    v117 = v157;
    v118 = v158;
    v119 = v159;
    if (!v158)
      break;
    v113 = v117;
    v114 = v118;
    v115 = v119;
    v110 = v119;
    v111 = v118;
    v112 = v117;
    v146 = v117;
    v147 = v118;
    v145 = v119;
    swift_bridgeObjectRetain();
    sub_1DC75DB80();
    sub_1DC76F6BC();
    v140 = v142;
    v141 = v143 & 1;
    if ((v143 & 1) != 0)
      v144 = -1;
    else
      v144 = v140;
    v109 = v144;
    v139 = v144;
    if (v144 == -1)
    {
      sub_1DC76D228();
      v96 = 1;
      v105 = sub_1DC76F464();
      v103 = v5;
      sub_1DC75EA0C(3);
      v104 = v6;
      v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
      v98 = sub_1DC76F74C();
      v97 = v7;
      v100 = (id)*MEMORY[0x1E0CB2D50];
      v8 = v100;
      v9 = sub_1DC76F44C();
      v10 = v97;
      *v97 = v9;
      v10[1] = v11;
      v12 = sub_1DC76F464();
      v13 = v97;
      v14 = v12;
      v15 = v98;
      v102 = MEMORY[0x1E0DEA968];
      v97[5] = MEMORY[0x1E0DEA968];
      v13[2] = v14;
      v13[3] = v16;
      sub_1DC74CCA0();
      v101 = v15;

      v17 = sub_1DC76F410();
      v107 = sub_1DC7609B8(v105, v103, v104, v17);
      swift_willThrow();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1DC76D2B4();
      sub_1DC76D330();
      v108 = v107;
      return v106;
    }
    sub_1DC76F2FC();
    (*(void (**)(char *, char *, uint64_t))(v127 + 16))(v130, v132, v126);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F039ABF0);
    sub_1DC76F53C();
    (*(void (**)(char *, uint64_t))(v127 + 8))(v132, v126);
    swift_bridgeObjectRelease();
  }
  sub_1DC76D2B4();
  v18 = v116;
  v91 = *(_QWORD *)(v120 + OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client);
  swift_retain();
  v92 = v161;
  swift_bridgeObjectRetain();
  v19 = sub_1DC76F248();
  v93 = v18;
  v94 = v19;
  v95 = v18;
  if (v18)
  {
    v46 = v95;
    swift_bridgeObjectRelease();
    swift_release();
    sub_1DC76D330();
    v108 = v46;
    return v106;
  }
  v87 = v94;
  swift_bridgeObjectRelease();
  swift_release();
  v20 = v93;
  v156 = v87;
  v88 = *(_QWORD *)(v120 + OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client);
  swift_retain();
  sub_1DC76F260();
  v89 = v20;
  v90 = v20;
  if (v20)
  {
    v45 = v90;
    swift_release();
    sub_1DC76D330();
    v108 = v45;
    return v106;
  }
  swift_release();
  v21 = v89;
  v83 = *(_QWORD *)(v120 + OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client);
  swift_retain();
  v22 = sub_1DC76F224();
  v84 = v21;
  v85 = v22;
  v86 = v21;
  if (v21)
  {
    v44 = v86;
    swift_release();
    sub_1DC76D330();
    v108 = v44;
    return v106;
  }
  v23 = v124;
  v65 = v85;
  swift_release();
  v155 = v65;
  v24 = sub_1DC75DF44();
  (*(void (**)(char *, uint64_t, uint64_t))(v122 + 16))(v23, v24, v121);
  v72 = 7;
  v73 = swift_allocObject();
  *(_QWORD *)(v73 + 16) = v65;
  v81 = sub_1DC76F3BC();
  v82 = sub_1DC76F5F0();
  v68 = &v153;
  v153 = 12;
  v66 = sub_1DC76ADD8();
  v67 = sub_1DC76AE40();
  sub_1DC76AEA8();
  sub_1DC76F4B8();
  v69 = v154;
  v70 = 17;
  v75 = swift_allocObject();
  *(_BYTE *)(v75 + 16) = 0;
  v76 = swift_allocObject();
  *(_BYTE *)(v76 + 16) = 8;
  v71 = 32;
  v25 = swift_allocObject();
  v26 = v73;
  v74 = v25;
  *(_QWORD *)(v25 + 16) = sub_1DC76D380;
  *(_QWORD *)(v25 + 24) = v26;
  v27 = swift_allocObject();
  v28 = v74;
  v78 = v27;
  *(_QWORD *)(v27 + 16) = sub_1DC76D67C;
  *(_QWORD *)(v27 + 24) = v28;
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60248);
  v77 = sub_1DC76F74C();
  v79 = v29;
  swift_retain();
  v30 = v75;
  v31 = v79;
  *v79 = sub_1DC76D3B0;
  v31[1] = v30;
  swift_retain();
  v32 = v76;
  v33 = v79;
  v79[2] = sub_1DC76D3E0;
  v33[3] = v32;
  swift_retain();
  v34 = v78;
  v35 = v79;
  v79[4] = sub_1DC76D6C4;
  v35[5] = v34;
  sub_1DC74CCA0();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v81, (os_log_type_t)v82))
  {
    v58 = (uint8_t *)sub_1DC76F638();
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60210);
    v57 = 0;
    v59 = sub_1DC76AF10(0);
    v60 = sub_1DC76AF10(v57);
    v61 = &v152;
    v152 = v58;
    v62 = &v151;
    v151 = v59;
    v63 = &v150;
    v150 = v60;
    sub_1DC76AF68(0, &v152);
    sub_1DC76AF68(1, v61);
    v36 = v84;
    v148 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76D3B0;
    v149 = v75;
    sub_1DC76AF7C(&v148, (uint64_t)v61, (uint64_t)v62, (uint64_t)v63);
    v64 = v36;
    if (v36)
    {
      __break(1u);
    }
    else
    {
      v148 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76D3E0;
      v149 = v76;
      sub_1DC76AF7C(&v148, (uint64_t)&v152, (uint64_t)&v151, (uint64_t)&v150);
      v54 = 0;
      v37 = v54;
      v148 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76D6C4;
      v149 = v78;
      sub_1DC76AF7C(&v148, (uint64_t)&v152, (uint64_t)&v151, (uint64_t)&v150);
      v53 = v37;
      _os_log_impl(&dword_1DC678000, v81, (os_log_type_t)v82, "Post data insertion database has: %lld entries", v58, v69);
      v52 = 0;
      sub_1DC76AFC0(v59);
      sub_1DC76AFC0(v60);
      sub_1DC76F620();
      swift_release();
      swift_release();
      swift_release();
      v55 = v53;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    v55 = v84;
  }
  v50 = v55;

  (*(void (**)(char *, uint64_t))(v122 + 8))(v124, v121);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
  v48 = sub_1DC76F74C();
  v47 = v38;
  v39 = sub_1DC76F464();
  v40 = v47;
  v41 = v87;
  *v47 = v39;
  v40[1] = v42;
  v40[5] = MEMORY[0x1E0DEB418];
  v40[2] = v41;
  sub_1DC74CCA0();
  v51 = sub_1DC76F410();
  sub_1DC76D330();
  return v51;
}

uint64_t sub_1DC7619C4(uint64_t a1)
{
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
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE **v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint32_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  NSObject *v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint8_t *v97;
  uint64_t v98;
  uint64_t v99;
  unsigned int v100;
  uint64_t *v101;
  uint64_t *v102;
  _BYTE **v103;
  uint64_t *v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint32_t v109;
  int v110;
  NSObject *v111;
  _BYTE *v112;
  void (*v113)(char *, uint64_t);
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  _QWORD *v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  int v124;
  int v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint8_t *v136;
  uint64_t v137;
  uint64_t v138;
  unsigned int v139;
  uint64_t *v140;
  uint64_t *v141;
  _BYTE **v142;
  uint64_t *v143;
  uint64_t *v144;
  uint64_t v145;
  uint64_t v146;
  void (*v147)(char *, uint64_t, uint64_t);
  unint64_t v148;
  unint64_t v149;
  uint64_t *v150;
  unint64_t v151;
  uint32_t v152;
  uint64_t v153;
  int v154;
  NSObject *v155;
  uint64_t v156;
  _QWORD *v157;
  _BOOL4 v158;
  uint64_t v159;
  _BYTE *v160;
  uint64_t v161;
  uint64_t v162;
  _QWORD *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  const char *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  char *v176;
  unint64_t v177;
  char *v178;
  uint64_t v179;
  _QWORD *v180;
  unint64_t v181;
  char *v182;
  unint64_t v183;
  char *v184;
  unint64_t v185;
  char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  _QWORD *v191;
  uint64_t v192;
  _QWORD v193[4];
  _QWORD v194[5];
  uint64_t v195;
  uint64_t v196;
  _BYTE *v197[2];
  uint64_t v198;
  uint64_t v199;
  _BYTE *v200;
  uint64_t (*v201)(uint64_t, uint64_t, uint64_t);
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  _BYTE *v205;
  _QWORD v206[2];
  uint64_t v207;
  char v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint32_t v213;
  uint64_t v214;
  uint64_t v215;
  uint32_t v216;
  uint64_t v217;
  _QWORD v218[2];
  uint64_t v219;
  uint32_t v220;
  unsigned __int8 v221;
  uint64_t v222;
  _QWORD v223[2];
  _QWORD v224[3];
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  _QWORD v228[2];
  _QWORD v229[4];
  _BYTE v230[32];
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  char *v234;

  v190 = a1;
  v170 = "Fatal error";
  v171 = "Unexpectedly found nil while unwrapping an Optional value";
  v172 = "AppleMediaDiscovery/AMDVectorDB.swift";
  v234 = 0;
  v233 = 0;
  v232 = 0;
  v231 = 0;
  v226 = 0;
  v222 = 0;
  v221 = 0;
  v217 = 0;
  v214 = 0;
  v210 = 0;
  v211 = 0;
  v187 = 0;
  v173 = sub_1DC76F2D8();
  v174 = *(_QWORD *)(v173 - 8);
  v175 = (*(_QWORD *)(v174 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v173);
  v176 = (char *)&v50 - v175;
  v234 = (char *)&v50 - v175;
  v177 = (*(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F039ABF8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v187);
  v178 = (char *)&v50 - v177;
  v179 = sub_1DC76F3D4();
  v180 = *(_QWORD **)(v179 - 8);
  v181 = (v180[8] + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](v190);
  v182 = (char *)&v50 - v181;
  v183 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x1E0C80A78](v2);
  v184 = (char *)&v50 - v183;
  v185 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x1E0C80A78](v4);
  v186 = (char *)&v50 - v185;
  v233 = v6;
  v232 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AC00);
  sub_1DC76F74C();
  v188 = MEMORY[0x1E0DEA968];
  v189 = MEMORY[0x1E0DEA978];
  v231 = sub_1DC76F410();
  v7 = sub_1DC76F464();
  v191 = v228;
  v228[0] = v7;
  v228[1] = v8;
  MEMORY[0x1DF0CCDA0](v229);
  sub_1DC74CCE0();
  if (!v229[3])
  {
    LOBYTE(v47) = 2;
    v48 = 91;
    LODWORD(v49) = 0;
    sub_1DC76F6C8();
    __break(1u);
  }
  v160 = v230;
  sub_1DC751E1C((uint64_t)v229, (uint64_t)v230);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AC08);
  v162 = MEMORY[0x1E0DEE9B8] + 8;
  swift_dynamicCast();
  v161 = v227;
  v226 = v227;
  v9 = sub_1DC76F464();
  v163 = v223;
  v223[0] = v9;
  v223[1] = v10;
  MEMORY[0x1DF0CCDA0](v224);
  sub_1DC74CCE0();
  v11 = v169;
  v164 = *(_QWORD *)(v168 + OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client);
  swift_retain();
  v12 = sub_1DC76F224();
  v165 = v11;
  v166 = v12;
  v167 = v11;
  if (v11)
  {
    v52 = v167;
    swift_release();
    sub_1DC7521C0((uint64_t)v224);
    swift_bridgeObjectRelease();
    sub_1DC76D724();
    v53 = v52;
    return v68;
  }
  v159 = v166;
  swift_release();
  v222 = v159;
  v221 = 1;
  v158 = v225 != 0;
  if (v225)
  {
    sub_1DC751DA4((uint64_t)v224, (uint64_t)v193);
    if (!v193[3])
    {
      LOBYTE(v47) = 2;
      v48 = 96;
      LODWORD(v49) = 0;
      sub_1DC76F6C8();
      __break(1u);
    }
    v157 = v194;
    sub_1DC751E1C((uint64_t)v193, (uint64_t)v194);
    swift_dynamicCast();
    v222 = v192;
    v221 = 0;
  }
  v13 = v186;
  v14 = sub_1DC75DF44();
  v147 = (void (*)(char *, uint64_t, uint64_t))v180[2];
  v147(v13, v14, v179);
  v155 = sub_1DC76F3BC();
  v154 = sub_1DC76F5F0();
  v150 = &v219;
  v219 = 2;
  v148 = sub_1DC76ADD8();
  v149 = sub_1DC76AE40();
  v151 = sub_1DC76AEA8();
  sub_1DC76F4B8();
  v152 = v220;
  v153 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60248);
  v156 = sub_1DC76F74C();
  if (os_log_type_enabled(v155, (os_log_type_t)v154))
  {
    v136 = (uint8_t *)sub_1DC76F638();
    v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60210);
    v135 = 0;
    v137 = sub_1DC76AF10(0);
    v138 = sub_1DC76AF10(v135);
    v142 = v197;
    v197[0] = v136;
    v143 = &v196;
    v196 = v137;
    v140 = &v195;
    v195 = v138;
    v139 = 0;
    sub_1DC76AF68(0, v197);
    sub_1DC76AF68(v139, v142);
    v194[4] = v156;
    v141 = &v50;
    MEMORY[0x1E0C80A78](&v50);
    v15 = v143;
    v16 = &v50 - 6;
    v144 = &v50 - 6;
    v16[2] = (uint64_t)v142;
    v16[3] = (uint64_t)v15;
    v16[4] = v17;
    v145 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AC48);
    sub_1DC76DB78();
    v18 = v165;
    sub_1DC76F4A0();
    v146 = v18;
    if (v18)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_1DC678000, v155, (os_log_type_t)v154, "Starting DB Search", v136, v152);
      v132 = 0;
      sub_1DC76AFC0(v137);
      sub_1DC76AFC0(v138);
      sub_1DC76F620();
      swift_bridgeObjectRelease();
      v133 = v146;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v133 = v165;
  }
  v127 = v133;

  v113 = (void (*)(char *, uint64_t))v180[1];
  v113(v186, v179);
  v119 = *(_QWORD *)(v168 + OBJC_IVAR____TtC19AppleMediaDiscovery18AMDVectorDBManager_client);
  swift_retain();
  v128 = sub_1DC76F50C();
  v120 = v19;
  v114 = 0;
  v115 = MEMORY[0x1E0DEDC60];
  v121 = sub_1DC76F74C();
  sub_1DC76F2A8();
  v122 = sub_1DC76F74C();
  v118 = v218;
  v218[0] = v222;
  v116 = sub_1DC76D74C();
  v117 = sub_1DC76D7B4();
  sub_1DC76D81C();
  sub_1DC76F4E8();
  v123 = v218[1];
  v124 = v221;
  v125 = sub_1DC762BC4();
  v126 = sub_1DC762BD0();
  v20 = sub_1DC762BDC();
  v21 = v127;
  v47 = 0;
  LOBYTE(v48) = 1;
  v49 = v20;
  v22 = sub_1DC76F254();
  v129 = v21;
  v130 = v22;
  v131 = v21;
  if (v21)
  {
    v51 = v131;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1DC76D884(v128, v120);
    swift_release();
    sub_1DC7521C0((uint64_t)v224);
    swift_bridgeObjectRelease();
    sub_1DC76D724();
    v53 = v51;
    return v68;
  }
  v23 = v184;
  v108 = v130;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DC76D884(v128, v120);
  swift_release();
  v217 = v108;
  v24 = sub_1DC75DF44();
  v147(v23, v24, v179);
  v111 = sub_1DC76F3BC();
  v110 = sub_1DC76F5F0();
  v215 = 2;
  sub_1DC76F4B8();
  v109 = v216;
  v112 = (_BYTE *)sub_1DC76F74C();
  if (os_log_type_enabled(v111, (os_log_type_t)v110))
  {
    v97 = (uint8_t *)sub_1DC76F638();
    v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60210);
    v96 = 0;
    v98 = sub_1DC76AF10(0);
    v99 = sub_1DC76AF10(v96);
    v103 = &v200;
    v200 = v97;
    v104 = &v199;
    v199 = v98;
    v101 = &v198;
    v198 = v99;
    v100 = 0;
    sub_1DC76AF68(0, &v200);
    sub_1DC76AF68(v100, v103);
    v197[1] = v112;
    v102 = &v50;
    MEMORY[0x1E0C80A78](&v50);
    v25 = v104;
    v26 = &v50 - 6;
    v105 = &v50 - 6;
    v26[2] = (uint64_t)v103;
    v26[3] = (uint64_t)v25;
    v26[4] = v27;
    v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AC48);
    sub_1DC76DB78();
    v28 = v129;
    sub_1DC76F4A0();
    v107 = v28;
    if (v28)
    {
      __break(1u);
    }
    else
    {
      _os_log_impl(&dword_1DC678000, v111, (os_log_type_t)v110, "Completed DB Search", v97, v109);
      v93 = 0;
      sub_1DC76AFC0(v98);
      sub_1DC76AFC0(v99);
      sub_1DC76F620();
      swift_bridgeObjectRelease();
      v94 = v107;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v94 = v129;
  }
  v29 = v182;
  v78 = v94;

  v113(v184, v179);
  v79 = MEMORY[0x1DF0CCE9C](v108, v173);
  v214 = v79;
  v30 = sub_1DC75DF44();
  v147(v29, v30, v179);
  v83 = 7;
  v84 = swift_allocObject();
  *(_QWORD *)(v84 + 16) = v79;
  v91 = sub_1DC76F3BC();
  v92 = sub_1DC76F5F0();
  v212 = 12;
  sub_1DC76F4B8();
  v80 = v213;
  v81 = 17;
  v86 = swift_allocObject();
  *(_BYTE *)(v86 + 16) = 0;
  v87 = swift_allocObject();
  *(_BYTE *)(v87 + 16) = 8;
  v82 = 32;
  v31 = swift_allocObject();
  v32 = v84;
  v85 = v31;
  *(_QWORD *)(v31 + 16) = sub_1DC76D934;
  *(_QWORD *)(v31 + 24) = v32;
  v33 = swift_allocObject();
  v34 = v85;
  v89 = v33;
  *(_QWORD *)(v33 + 16) = sub_1DC76DA0C;
  *(_QWORD *)(v33 + 24) = v34;
  v88 = sub_1DC76F74C();
  v90 = v35;
  swift_retain();
  v36 = v86;
  v37 = v90;
  *v90 = sub_1DC76D964;
  v37[1] = v36;
  swift_retain();
  v38 = v87;
  v39 = v90;
  v90[2] = sub_1DC76D994;
  v39[3] = v38;
  swift_retain();
  v40 = v89;
  v41 = v90;
  v90[4] = sub_1DC76DA54;
  v41[5] = v40;
  sub_1DC74CCA0();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v91, (os_log_type_t)v92))
  {
    v71 = (uint8_t *)sub_1DC76F638();
    v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60210);
    v70 = 0;
    v72 = sub_1DC76AF10(0);
    v73 = sub_1DC76AF10(v70);
    v74 = &v205;
    v205 = v71;
    v75 = &v204;
    v204 = v72;
    v76 = &v203;
    v203 = v73;
    sub_1DC76AF68(0, &v205);
    sub_1DC76AF68(1, v74);
    v42 = v78;
    v201 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76D964;
    v202 = v86;
    sub_1DC76AF7C(&v201, (uint64_t)v74, (uint64_t)v75, (uint64_t)v76);
    v77 = v42;
    if (v42)
    {
      __break(1u);
    }
    else
    {
      v201 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76D994;
      v202 = v87;
      sub_1DC76AF7C(&v201, (uint64_t)&v205, (uint64_t)&v204, (uint64_t)&v203);
      v66 = 0;
      v43 = v66;
      v201 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76DA54;
      v202 = v89;
      sub_1DC76AF7C(&v201, (uint64_t)&v205, (uint64_t)&v204, (uint64_t)&v203);
      v65 = v43;
      _os_log_impl(&dword_1DC678000, v91, (os_log_type_t)v92, "Search returned: %ld results", v71, v80);
      v64 = 0;
      sub_1DC76AFC0(v72);
      sub_1DC76AFC0(v73);
      sub_1DC76F620();
      swift_release();
      swift_release();
      swift_release();
      v67 = v65;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    v67 = v78;
  }
  v62 = v67;

  v113(v182, v179);
  swift_bridgeObjectRetain();
  v209 = v108;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AC28);
  sub_1DC76DAB4();
  sub_1DC76F5E4();
  for (i = v62; ; i = v60)
  {
    v60 = i;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AC38);
    sub_1DC76F698();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v174 + 48))(v178, 1, v173) == 1)
      break;
    (*(void (**)(char *, char *, uint64_t))(v174 + 32))(v176, v178, v173);
    v56 = sub_1DC76F2C0();
    v57 = v44;
    sub_1DC76F2CC();
    v59 = &v207;
    v207 = v45;
    v208 = 0;
    v58 = v206;
    v206[0] = v56;
    v206[1] = v57;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AC40);
    sub_1DC76F434();
    (*(void (**)(char *, uint64_t))(v174 + 8))(v176, v173);
  }
  sub_1DC76DB24();
  v54 = &v231;
  v55 = v231;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1DC7521C0((uint64_t)v224);
  swift_bridgeObjectRelease();
  sub_1DC76D724();
  return v55;
}

uint64_t sub_1DC762BC4()
{
  return 0;
}

uint64_t sub_1DC762BD0()
{
  return 10;
}

uint64_t sub_1DC762BDC()
{
  return 2;
}

uint64_t sub_1DC762D64(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v11;
  uint64_t v12;

  if (a1)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    v8 = sub_1DC76F23C();
    if (!v12)
    {
      swift_bridgeObjectRelease();
      swift_release();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
      sub_1DC76F74C();
      v7 = v3;
      *v3 = sub_1DC76F464();
      v7[1] = v4;
      v7[5] = MEMORY[0x1E0DEB418];
      v7[2] = v8;
      sub_1DC74CCA0();
      return sub_1DC76F410();
    }
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_retain();
    v11 = sub_1DC76F224();
    if (!v12)
    {
      swift_release();
      swift_retain();
      sub_1DC76F278();
      swift_release();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
      sub_1DC76F74C();
      v9 = v1;
      *v1 = sub_1DC76F464();
      v9[1] = v2;
      v9[5] = MEMORY[0x1E0DEDC60];
      v9[2] = v11;
      sub_1DC74CCA0();
      return sub_1DC76F410();
    }
    swift_release();
  }
  return v6;
}

uint64_t sub_1DC763308@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  id v38[2];
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE **v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  void (*v53)(char *, char *, uint64_t);
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t *v58;
  uint32_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  NSObject *v71;
  int v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  unint64_t v84;
  unint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;
  int v110;
  id v111;
  id v112;
  id v113;
  unsigned int v114;
  uint64_t (*v115)(uint64_t, uint64_t, uint64_t);
  uint64_t v116;
  _BYTE *v117;
  uint64_t v118;
  uint32_t v119;
  id v120;
  _QWORD v121[4];
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;

  v73 = a3;
  v92 = a1;
  v93 = a2;
  v132 = *MEMORY[0x1E0C80C00];
  v128 = 0;
  v127 = 0;
  v125 = 0;
  v126 = 0;
  v124 = 0;
  v88 = 0;
  v75 = sub_1DC76F3D4();
  v76 = *(_QWORD *)(v75 - 8);
  v77 = (*(_QWORD *)(v76 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v78 = (char *)v38 - v77;
  v105 = sub_1DC76EF78();
  v103 = *(_QWORD *)(v105 - 8);
  v79 = (*(_QWORD *)(v103 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](v88);
  v104 = (uint64_t)v38 - v79;
  v87 = sub_1DC76EFB4();
  v80 = *(_QWORD *)(v87 - 8);
  v81 = *(_QWORD *)(v80 + 64);
  v82 = (v81 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x1E0C80A78](v92);
  v83 = (char *)v38 - v82;
  v84 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x1E0C80A78](v4);
  v102 = (char *)v38 - v84;
  v128 = (char *)v38 - v84;
  v85 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = MEMORY[0x1E0C80A78](v6);
  v95 = (char *)v38 - v85;
  v127 = (char *)v38 - v85;
  v125 = v8;
  v126 = v9;
  v124 = v3;
  v107 = 0x1E0CB3000uLL;
  v10 = (void *)objc_opt_self();
  v108 = 0x1F25F1000uLL;
  v86 = objc_msgSend(v10, (SEL)0x1F25F12B7);
  v94 = 1;
  v90 = objc_msgSend(v86, sel_URLsForDirectory_inDomains_, 14);

  v89 = sub_1DC76F500();
  sub_1DC76F560();
  swift_bridgeObjectRelease();

  v11 = sub_1DC76F740();
  v97 = &v122;
  v122 = v11;
  v123 = v12;
  v110 = 1;
  sub_1DC76F464();
  v91 = v13;
  sub_1DC76F734();
  swift_bridgeObjectRelease();
  v121[2] = v92;
  v121[3] = v93;
  v100 = MEMORY[0x1E0DEA968];
  sub_1DC76F728();
  sub_1DC76F464();
  v96 = v14;
  sub_1DC76F734();
  swift_bridgeObjectRelease();
  v99 = v122;
  v98 = v123;
  swift_bridgeObjectRetain();
  sub_1DC76D28C();
  v15 = sub_1DC76F458();
  v106 = v121;
  v121[0] = v15;
  v121[1] = v16;
  v101 = sub_1DC75DBE8();
  sub_1DC764068(v104);
  sub_1DC76EFA8();
  (*(void (**)(uint64_t, uint64_t))(v103 + 8))(v104, v105);
  sub_1DC74CCE0();
  v131 = 0;
  v113 = objc_msgSend((id)objc_opt_self(), (SEL)(v108 + 695));
  sub_1DC76EF9C();
  v109 = v17;
  v112 = (id)sub_1DC76F440();
  swift_bridgeObjectRelease();
  v120 = v131;
  v114 = objc_msgSend(v113, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v112, v110 & 1, 0, &v120);
  v111 = v120;
  v18 = v120;
  v19 = v131;
  v131 = v111;

  if ((v114 & 1) != 0)
  {
    v20 = v78;
    v21 = sub_1DC75DF44();
    (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v20, v21, v75);
    v53 = *(void (**)(char *, char *, uint64_t))(v80 + 16);
    v53(v83, v102, v87);
    v54 = (*(unsigned __int8 *)(v80 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80);
    v62 = 7;
    v55 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v80 + 32))(v55 + v54, v83, v87);
    swift_retain();
    v61 = 32;
    v22 = swift_allocObject();
    v23 = v55;
    v63 = v22;
    *(_QWORD *)(v22 + 16) = sub_1DC76DC84;
    *(_QWORD *)(v22 + 24) = v23;
    swift_release();
    v71 = sub_1DC76F3BC();
    v72 = sub_1DC76F5F0();
    v58 = &v118;
    v118 = 12;
    v56 = sub_1DC76ADD8();
    v57 = sub_1DC76AE40();
    sub_1DC76AEA8();
    sub_1DC76F4B8();
    v59 = v119;
    v60 = 17;
    v65 = swift_allocObject();
    *(_BYTE *)(v65 + 16) = 32;
    v66 = swift_allocObject();
    *(_BYTE *)(v66 + 16) = 8;
    v24 = swift_allocObject();
    v25 = v63;
    v64 = v24;
    *(_QWORD *)(v24 + 16) = sub_1DC76DD00;
    *(_QWORD *)(v24 + 24) = v25;
    v26 = swift_allocObject();
    v27 = v64;
    v68 = v26;
    *(_QWORD *)(v26 + 16) = sub_1DC76DE54;
    *(_QWORD *)(v26 + 24) = v27;
    v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60248);
    v67 = sub_1DC76F74C();
    v69 = v28;
    swift_retain();
    v29 = v65;
    v30 = v69;
    *v69 = sub_1DC76DDE0;
    v30[1] = v29;
    swift_retain();
    v31 = v66;
    v32 = v69;
    v69[2] = sub_1DC76DE10;
    v32[3] = v31;
    swift_retain();
    v33 = v68;
    v34 = v69;
    v69[4] = sub_1DC76DE9C;
    v34[5] = v33;
    sub_1DC74CCA0();
    swift_bridgeObjectRelease();
    if (os_log_type_enabled(v71, (os_log_type_t)v72))
    {
      v46 = (uint8_t *)sub_1DC76F638();
      v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60210);
      v47 = sub_1DC76AF10(0);
      v48 = sub_1DC76AF10(1);
      v49 = &v117;
      v117 = v46;
      v50 = &v130;
      v130 = v47;
      v51 = &v129;
      v129 = v48;
      sub_1DC76AF68(2, &v117);
      sub_1DC76AF68(1, v49);
      v35 = v74;
      v115 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76DDE0;
      v116 = v65;
      sub_1DC76AF7C(&v115, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51);
      v52 = v35;
      if (v35)
      {
        __break(1u);
      }
      else
      {
        v115 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76DE10;
        v116 = v66;
        sub_1DC76AF7C(&v115, (uint64_t)&v117, (uint64_t)&v130, (uint64_t)&v129);
        v43 = 0;
        v36 = v43;
        v115 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76DE9C;
        v116 = v68;
        sub_1DC76AF7C(&v115, (uint64_t)&v117, (uint64_t)&v130, (uint64_t)&v129);
        v42 = v36;
        _os_log_impl(&dword_1DC678000, v71, (os_log_type_t)v72, "Created Vector DB Directory: %s", v46, v59);
        sub_1DC76AFC0(v47);
        sub_1DC76AFC0(v48);
        sub_1DC76F620();
        swift_release();
        swift_release();
        swift_release();
        v44 = v42;
      }
    }
    else
    {
      swift_release();
      swift_release();
      swift_release();
      v44 = v74;
    }
    v40 = v44;

    (*(void (**)(char *, uint64_t))(v76 + 8))(v78, v75);
    v53(v73, v102, v87);
    v41 = *(void (**)(char *, uint64_t))(v80 + 8);
    v41(v102, v87);
    return ((uint64_t (*)(char *, uint64_t))v41)(v95, v87);
  }
  else
  {
    v38[0] = v131;
    v38[1] = (id)sub_1DC76EF6C();

    swift_willThrow();
    v39 = *(void (**)(char *, uint64_t))(v80 + 8);
    v39(v102, v87);
    return ((uint64_t (*)(char *, uint64_t))v39)(v95, v87);
  }
}

uint64_t sub_1DC764068@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v3;

  v3 = *MEMORY[0x1E0CAFD78];
  v1 = sub_1DC76EF78();
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 8) + 104))(a1, v3);
}

uint64_t sub_1DC7640B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = sub_1DC76EFB4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a2, a1);
}

uint64_t sub_1DC76429C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  char v7;
  unsigned int v8;
  uint64_t v10;

  sub_1DC76F464();
  v10 = sub_1DC76F470();
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
  {
    v8 = *MEMORY[0x1E0DC66F8];
    v1 = sub_1DC76F2B4();
    return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 8) + 104))(a1, v8);
  }
  else
  {
    sub_1DC76F464();
    v7 = sub_1DC76F470();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
    {
      v6 = *MEMORY[0x1E0DC6700];
      v3 = sub_1DC76F2B4();
      return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 8) + 104))(a1, v6);
    }
    else
    {
      v5 = *MEMORY[0x1E0DC66F0];
      v4 = sub_1DC76F2B4();
      return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 8) + 104))(a1, v5);
    }
  }
}

uint64_t sub_1DC764414@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v3;

  v3 = *MEMORY[0x1E0DC6750];
  v1 = sub_1DC76F2E4();
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 8) + 104))(a1, v3);
}

uint64_t sub_1DC764478@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unsigned int v3;

  v3 = *MEMORY[0x1E0DC6750];
  v1 = sub_1DC76F2E4();
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 8) + 104))(a1, v3);
}

uint64_t sub_1DC7644DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v68;
  id v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  id v87;
  id v88;
  id v89;
  unsigned int v90;
  id v91;
  _BYTE *v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  id v96;
  id v97;
  id v98;
  _BYTE *v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  _QWORD *v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  _BOOL4 v108;
  _BOOL4 v109;
  uint64_t v110;
  _BYTE *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint8_t *v116;
  uint64_t v117;
  uint64_t v118;
  _BYTE **v119;
  uint64_t *v120;
  uint64_t *v121;
  uint64_t v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint32_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _QWORD *v136;
  NSObject *v137;
  int v138;
  id v139;
  _BYTE *v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  id v144;
  id v145;
  id v146;
  int v147;
  uint64_t *v148;
  uint64_t v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  id v156;
  uint64_t v157;
  _BOOL4 v158;
  uint64_t v159;
  void (*v160)(char *, uint64_t);
  _QWORD *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint8_t *v167;
  uint64_t v168;
  uint64_t v169;
  _BYTE **v170;
  uint64_t *v171;
  uint64_t *v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  const char *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  unint64_t v180;
  char *v181;
  unint64_t v182;
  uint64_t v183;
  char *v184;
  unint64_t v185;
  char *v186;
  uint64_t v187;
  uint64_t v188;
  _QWORD *v189;
  uint64_t v190;
  void (*v191)(char *, uint64_t, uint64_t);
  uint64_t v192;
  uint64_t v193;
  unint64_t v194;
  unint64_t v195;
  uint64_t *v196;
  unint64_t v197;
  uint32_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  _QWORD *v208;
  uint64_t v209;
  NSObject *v210;
  int v211;
  uint64_t (*v212)(uint64_t, uint64_t, uint64_t);
  uint64_t v213;
  _BYTE *v214;
  uint64_t (*v215)(uint64_t, uint64_t, uint64_t);
  uint64_t v216;
  _BYTE *v217;
  _QWORD v218[4];
  id v219;
  _QWORD v220[2];
  uint64_t v221;
  id v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint32_t v232;
  uint64_t v233;
  id v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  _QWORD v239[2];
  uint64_t v240;
  uint32_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  _QWORD v249[8];
  void *v250;
  _QWORD v251[4];
  void *v252;
  _QWORD v253[4];
  _BYTE v254[40];
  _BYTE v255[32];
  _QWORD v256[4];
  _BYTE v257[40];
  void *v258;
  _BYTE v259[24];
  uint64_t v260;
  _BYTE v261[32];
  _QWORD v262[3];
  uint64_t v263;
  uint64_t v264;

  v192 = a1;
  v175 = "Fatal error";
  v176 = "Unexpectedly found nil while unwrapping an Optional value";
  v177 = "AppleMediaDiscovery/AMDVectorDB.swift";
  v264 = *MEMORY[0x1E0C80C00];
  v244 = 0;
  v243 = 0;
  v242 = 0;
  v235 = 0;
  v236 = 0;
  v233 = 0;
  v223 = 0;
  v224 = 0;
  v221 = 0;
  v187 = 0;
  v178 = sub_1DC76EFB4();
  v179 = *(_QWORD *)(v178 - 8);
  v180 = (*(_QWORD *)(v179 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v181 = (char *)&v68 - v180;
  v190 = sub_1DC76F3D4();
  v189 = *(_QWORD **)(v190 - 8);
  v183 = v189[8];
  v182 = (v183 + 15) & 0xFFFFFFFFFFFFFFF0;
  v1 = MEMORY[0x1E0C80A78](v192);
  v184 = (char *)&v68 - v182;
  v185 = (v183 + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v68 - v185;
  v186 = (char *)&v68 - v185;
  v244 = v2;
  v243 = v4;
  v188 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
  sub_1DC76F74C();
  v242 = sub_1DC76F410();
  v5 = sub_1DC75DF44();
  v191 = (void (*)(char *, uint64_t, uint64_t))v189[2];
  v191(v3, v5, v190);
  swift_bridgeObjectRetain();
  v201 = 7;
  v193 = swift_allocObject();
  *(_QWORD *)(v193 + 16) = v192;
  swift_retain();
  v200 = 32;
  v6 = swift_allocObject();
  v7 = v193;
  v202 = v6;
  *(_QWORD *)(v6 + 16) = sub_1DC76DEE4;
  *(_QWORD *)(v6 + 24) = v7;
  swift_release();
  v210 = sub_1DC76F3BC();
  v211 = sub_1DC76F5F0();
  v196 = &v240;
  v240 = 12;
  v194 = sub_1DC76ADD8();
  v195 = sub_1DC76AE40();
  v197 = sub_1DC76AEA8();
  sub_1DC76F4B8();
  v198 = v241;
  v199 = 17;
  v204 = swift_allocObject();
  *(_BYTE *)(v204 + 16) = 32;
  v205 = swift_allocObject();
  *(_BYTE *)(v205 + 16) = 8;
  v8 = swift_allocObject();
  v9 = v202;
  v203 = v8;
  *(_QWORD *)(v8 + 16) = sub_1DC76DF28;
  *(_QWORD *)(v8 + 24) = v9;
  v10 = swift_allocObject();
  v11 = v203;
  v207 = v10;
  *(_QWORD *)(v10 + 16) = sub_1DC76E080;
  *(_QWORD *)(v10 + 24) = v11;
  v209 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60248);
  v206 = sub_1DC76F74C();
  v208 = v12;
  swift_retain();
  v13 = v204;
  v14 = v208;
  *v208 = sub_1DC76E00C;
  v14[1] = v13;
  swift_retain();
  v15 = v205;
  v16 = v208;
  v208[2] = sub_1DC76E03C;
  v16[3] = v15;
  swift_retain();
  v17 = v207;
  v18 = v208;
  v208[4] = sub_1DC76E0C8;
  v18[5] = v17;
  sub_1DC74CCA0();
  swift_bridgeObjectRelease();
  if (os_log_type_enabled(v210, (os_log_type_t)v211))
  {
    v167 = (uint8_t *)sub_1DC76F638();
    v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60210);
    v168 = sub_1DC76AF10(0);
    v169 = sub_1DC76AF10(1);
    v170 = &v214;
    v214 = v167;
    v171 = &v246;
    v246 = v168;
    v172 = &v245;
    v245 = v169;
    sub_1DC76AF68(2, &v214);
    sub_1DC76AF68(1, v170);
    v19 = v174;
    v212 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E00C;
    v213 = v204;
    sub_1DC76AF7C(&v212, (uint64_t)v170, (uint64_t)v171, (uint64_t)v172);
    v173 = v19;
    if (v19)
    {
      __break(1u);
    }
    else
    {
      v212 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E03C;
      v213 = v205;
      sub_1DC76AF7C(&v212, (uint64_t)&v214, (uint64_t)&v246, (uint64_t)&v245);
      v163 = 0;
      v20 = v163;
      v212 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E0C8;
      v213 = v207;
      sub_1DC76AF7C(&v212, (uint64_t)&v214, (uint64_t)&v246, (uint64_t)&v245);
      v162 = v20;
      _os_log_impl(&dword_1DC678000, v210, (os_log_type_t)v211, "Deletion Payload: %s", v167, v198);
      sub_1DC76AFC0(v168);
      sub_1DC76AFC0(v169);
      sub_1DC76F620();
      swift_release();
      swift_release();
      swift_release();
      v164 = v162;
    }
  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    v164 = v174;
  }
  v159 = v164;

  v160 = (void (*)(char *, uint64_t))v189[1];
  v160(v186, v190);
  v21 = sub_1DC76F464();
  v161 = v239;
  v239[0] = v21;
  v239[1] = v22;
  MEMORY[0x1DF0CCDA0](v262);
  sub_1DC74CCE0();
  v158 = v263 == 0;
  if (v263)
  {
    sub_1DC751DA4((uint64_t)v262, (uint64_t)v259);
    if (!v260)
    {
      sub_1DC76F6C8();
      __break(1u);
    }
    v140 = v261;
    sub_1DC751E1C((uint64_t)v259, (uint64_t)v261);
    swift_dynamicCast();
    v141 = v237;
    v142 = v238;
    v235 = v237;
    v236 = v238;
    v258 = 0;
    v143 = (id)objc_opt_self();
    swift_bridgeObjectRetain();
    v145 = (id)sub_1DC76F440();
    swift_bridgeObjectRelease();
    v234 = v258;
    v146 = objc_msgSend(v143, sel_fetchVectorDBConfigForDBName_error_, v145, &v234);
    v144 = v234;
    v36 = v234;
    v37 = v258;
    v258 = v144;

    if (v146)
    {
      v139 = v146;
      v38 = v184;
      v123 = v146;
      v124 = sub_1DC76F3F8();
      v233 = v124;

      v39 = sub_1DC75DF44();
      v191(v38, v39, v190);
      swift_bridgeObjectRetain();
      v129 = 7;
      v125 = swift_allocObject();
      *(_QWORD *)(v125 + 16) = v124;
      swift_retain();
      v128 = 32;
      v40 = swift_allocObject();
      v41 = v125;
      v130 = v40;
      *(_QWORD *)(v40 + 16) = sub_1DC76E110;
      *(_QWORD *)(v40 + 24) = v41;
      swift_release();
      v137 = sub_1DC76F3BC();
      v138 = sub_1DC76F5F0();
      v231 = 12;
      sub_1DC76F4B8();
      v126 = v232;
      v127 = 17;
      v132 = swift_allocObject();
      *(_BYTE *)(v132 + 16) = 32;
      v133 = swift_allocObject();
      *(_BYTE *)(v133 + 16) = 8;
      v42 = swift_allocObject();
      v43 = v130;
      v131 = v42;
      *(_QWORD *)(v42 + 16) = sub_1DC76E154;
      *(_QWORD *)(v42 + 24) = v43;
      v44 = swift_allocObject();
      v45 = v131;
      v135 = v44;
      *(_QWORD *)(v44 + 16) = sub_1DC76E2AC;
      *(_QWORD *)(v44 + 24) = v45;
      v134 = sub_1DC76F74C();
      v136 = v46;
      swift_retain();
      v47 = v132;
      v48 = v136;
      *v136 = sub_1DC76E238;
      v48[1] = v47;
      swift_retain();
      v49 = v133;
      v50 = v136;
      v136[2] = sub_1DC76E268;
      v50[3] = v49;
      swift_retain();
      v51 = v135;
      v52 = v136;
      v136[4] = sub_1DC76E2F4;
      v52[5] = v51;
      sub_1DC74CCA0();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v137, (os_log_type_t)v138))
      {
        v116 = (uint8_t *)sub_1DC76F638();
        v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60210);
        v117 = sub_1DC76AF10(0);
        v118 = sub_1DC76AF10(1);
        v119 = &v217;
        v217 = v116;
        v120 = &v248;
        v248 = v117;
        v121 = &v247;
        v247 = v118;
        sub_1DC76AF68(2, &v217);
        sub_1DC76AF68(1, v119);
        v53 = v159;
        v215 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E238;
        v216 = v132;
        sub_1DC76AF7C(&v215, (uint64_t)v119, (uint64_t)v120, (uint64_t)v121);
        v122 = v53;
        if (v53)
        {
          __break(1u);
        }
        else
        {
          v215 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E268;
          v216 = v133;
          sub_1DC76AF7C(&v215, (uint64_t)&v217, (uint64_t)&v248, (uint64_t)&v247);
          v113 = 0;
          v54 = v113;
          v215 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E2F4;
          v216 = v135;
          sub_1DC76AF7C(&v215, (uint64_t)&v217, (uint64_t)&v248, (uint64_t)&v247);
          v112 = v54;
          _os_log_impl(&dword_1DC678000, v137, (os_log_type_t)v138, "Fetched the config: %s", v116, v126);
          sub_1DC76AFC0(v117);
          sub_1DC76AFC0(v118);
          sub_1DC76F620();
          swift_release();
          swift_release();
          swift_release();
          v114 = v112;
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        v114 = v159;
      }
      v110 = v114;

      v160(v184, v190);
      v229 = sub_1DC76F464();
      v230 = v55;
      v111 = v257;
      sub_1DC76F704();
      MEMORY[0x1DF0CCDA0](v256, v111, v124, MEMORY[0x1E0DEC198], MEMORY[0x1E0DEE9B8] + 8, MEMORY[0x1E0DEC1A0]);
      v109 = v256[3] == 0;
      v108 = v109;
      sub_1DC7521C0((uint64_t)v256);
      sub_1DC75C350((uint64_t)v257);
      sub_1DC74CCE0();
      if (v108)
      {
        v100 = 1;
        v101 = sub_1DC76F464();
        v102 = v56;
        v57 = sub_1DC76F464();
        v104 = v249;
        v249[3] = MEMORY[0x1E0DEA968];
        v249[0] = v57;
        v249[1] = v58;
        v103 = v218;
        v218[0] = v101;
        v218[1] = v102;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
        v105 = &v242;
        sub_1DC76F434();
        v106 = v242;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1DC7521C0((uint64_t)v262);
        sub_1DC75A0B4();
        v107 = v106;
      }
      else
      {
        v227 = sub_1DC76F464();
        v228 = v59;
        v99 = v254;
        sub_1DC76F704();
        MEMORY[0x1DF0CCDA0](v253, v99, v124, MEMORY[0x1E0DEC198], MEMORY[0x1E0DEE9B8] + 8, MEMORY[0x1E0DEC1A0]);
        if (!v253[3])
        {
          sub_1DC76F6C8();
          __break(1u);
        }
        v92 = v255;
        sub_1DC751E1C((uint64_t)v253, (uint64_t)v255);
        swift_dynamicCast();
        v93 = v225;
        v94 = v226;
        v223 = v225;
        v224 = v226;
        sub_1DC75C350((uint64_t)v254);
        sub_1DC74CCE0();
        v252 = 0;
        v95 = (id)objc_opt_self();
        swift_bridgeObjectRetain();
        v97 = (id)sub_1DC76F440();
        swift_bridgeObjectRelease();
        v222 = v252;
        v98 = objc_msgSend(v95, sel_deleteVectorDBEntryForDBName_error_, v97, &v222);
        v96 = v222;
        v60 = v222;
        v61 = v252;
        v252 = v96;

        if (!v98)
        {
          v71 = v252;
          v72 = sub_1DC76EF6C();

          swift_willThrow();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1DC7521C0((uint64_t)v262);
          sub_1DC75A0B4();
          v157 = v72;
          return v165;
        }
        v91 = v98;
        v80 = v98;
        v81 = sub_1DC76F3F8();
        v221 = v81;

        v83 = sub_1DC76F464();
        v82 = v62;
        swift_bridgeObjectRetain();
        v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60190);
        v85 = v251;
        v251[3] = v63;
        v251[0] = v81;
        v84 = v220;
        v220[0] = v83;
        v220[1] = v82;
        v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
        sub_1DC76F434();
        v250 = 0;
        v89 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
        sub_1DC76EF84();
        v88 = (id)sub_1DC76EF90();
        (*(void (**)(char *, uint64_t))(v179 + 8))(v181, v178);
        v219 = v250;
        v90 = objc_msgSend(v89, sel_removeItemAtURL_error_, v88, &v219);
        v87 = v219;
        v64 = v219;
        v65 = v250;
        v250 = v87;

        if ((v90 & 1) == 0)
        {
          v69 = v250;
          v70 = sub_1DC76EF6C();

          swift_willThrow();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1DC7521C0((uint64_t)v262);
          sub_1DC75A0B4();
          v157 = v70;
          return v165;
        }
        v76 = sub_1DC76F464();
        v77 = v66;
        swift_bridgeObjectRetain();
        v249[7] = MEMORY[0x1E0DEA968];
        v249[4] = v93;
        v249[5] = v94;
        v218[2] = v76;
        v218[3] = v77;
        v78 = &v242;
        sub_1DC76F434();
        v79 = v242;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_1DC7521C0((uint64_t)v262);
        sub_1DC75A0B4();
        v107 = v79;
      }
      v75 = v107;
      return v107;
    }
    v73 = v258;
    v74 = sub_1DC76EF6C();

    swift_willThrow();
    swift_bridgeObjectRelease();
    sub_1DC7521C0((uint64_t)v262);
    sub_1DC75A0B4();
    v157 = v74;
  }
  else
  {
    sub_1DC76D228();
    v147 = 1;
    v155 = sub_1DC76F464();
    v153 = v23;
    sub_1DC75EA0C(0);
    v154 = v24;
    v149 = sub_1DC76F74C();
    v148 = v25;
    v150 = (id)*MEMORY[0x1E0CB2D50];
    v26 = v150;
    v27 = sub_1DC76F44C();
    v28 = v148;
    *v148 = v27;
    v28[1] = v29;
    v30 = sub_1DC76F464();
    v31 = v148;
    v32 = v30;
    v33 = v149;
    v152 = MEMORY[0x1E0DEA968];
    v148[5] = MEMORY[0x1E0DEA968];
    v31[2] = v32;
    v31[3] = v34;
    sub_1DC74CCA0();
    v151 = v33;

    v35 = sub_1DC76F410();
    v156 = sub_1DC7609B8(v155, v153, v154, v35);
    swift_willThrow();
    sub_1DC7521C0((uint64_t)v262);
    sub_1DC75A0B4();
    v157 = (uint64_t)v156;
  }
  return v165;
}

uint64_t sub_1DC765AB8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;

  swift_bridgeObjectRetain();
  result = a1;
  *a2 = a1;
  return result;
}

uint64_t sub_1DC765AE8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;

  swift_bridgeObjectRetain();
  result = a1;
  *a2 = a1;
  return result;
}

uint64_t sub_1DC765C98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50[7];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[4];
  char v66[32];
  void *v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE v70[24];
  uint64_t v71;
  char v72[32];
  _QWORD v73[4];
  _BYTE v74[24];
  uint64_t v75;
  char v76[32];
  _QWORD v77[5];

  v77[4] = *MEMORY[0x1E0C80C00];
  v61 = 0;
  v56 = 0;
  v55 = 0;
  v51 = 0;
  v62 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
  sub_1DC76F74C();
  v60 = sub_1DC76F410();
  v58 = sub_1DC76F464();
  v59 = v1;
  MEMORY[0x1DF0CCDA0](v77);
  sub_1DC74CCE0();
  if (v77[3])
  {
    sub_1DC751DA4((uint64_t)v77, (uint64_t)v74);
    if (!v75)
    {
      sub_1DC76F6C8();
      __break(1u);
    }
    sub_1DC751E1C((uint64_t)v74, (uint64_t)v76);
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
    swift_dynamicCast();
    v56 = v57;
    type metadata accessor for AMDVectorDBManager();
    swift_bridgeObjectRetain();
    v41 = AMDVectorDBManager.__allocating_init(vectorDBConfig:)(v57);
    if (v48)
    {
      swift_bridgeObjectRelease();
      sub_1DC7521C0((uint64_t)v77);
      sub_1DC75A0B4();
    }
    else
    {
      v55 = v41;
      v53 = sub_1DC76F464();
      v54 = v10;
      MEMORY[0x1DF0CCDA0](v73);
      sub_1DC74CCE0();
      if (v73[3])
      {
        sub_1DC751DA4((uint64_t)v73, (uint64_t)v70);
        if (!v71)
        {
          sub_1DC76F6C8();
          __break(1u);
        }
        sub_1DC751E1C((uint64_t)v70, (uint64_t)v72);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AC68);
        swift_dynamicCast();
        v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))((*v41 & *MEMORY[0x1E0DEEDD8]) + 0x60))(v52, v19, v20);
        swift_bridgeObjectRelease();
        v51 = v34;
        v31 = (void *)sub_1DC76F464();
        v32 = v21;
        swift_bridgeObjectRetain();
        v69 = v40;
        v68 = v34;
        v50[5] = v31;
        v50[6] = v32;
        sub_1DC76F434();
        v67 = 0;
        v33 = (id)objc_opt_self();
        v50[3] = (id)sub_1DC76F464();
        v50[4] = v22;
        MEMORY[0x1DF0CCDA0](v65);
        sub_1DC74CCE0();
        if (!v65[3])
        {
          sub_1DC76F6C8();
          __break(1u);
        }
        sub_1DC751E1C((uint64_t)v65, (uint64_t)v66);
        swift_dynamicCast();
        v29 = (id)sub_1DC76F440();
        swift_bridgeObjectRelease();
        v50[0] = v67;
        v30 = objc_msgSend(v33, sel_updateLastVectorDBRefreshTimestamp_error_, v29, v50);
        v28 = v50[0];
        v23 = v50[0];
        v24 = v67;
        v67 = v28;

        if (v30)
        {
          v49 = sub_1DC76F3F8();

          sub_1DC76F464();
          swift_bridgeObjectRetain();
          v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60190);
          v63 = v49;
          sub_1DC76F434();
          v27 = v60;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1DC7521C0((uint64_t)v73);

          swift_bridgeObjectRelease();
          sub_1DC7521C0((uint64_t)v77);
          sub_1DC75A0B4();
          return v27;
        }
        v26 = v67;
        sub_1DC76EF6C();

        swift_willThrow();
        swift_bridgeObjectRelease();
        sub_1DC7521C0((uint64_t)v73);

        swift_bridgeObjectRelease();
        sub_1DC7521C0((uint64_t)v77);
        sub_1DC75A0B4();
      }
      else
      {
        sub_1DC76D228();
        v39 = sub_1DC76F464();
        v37 = v11;
        sub_1DC75EA0C(3);
        v38 = v12;
        sub_1DC76F74C();
        v35 = v13;
        v36 = (id)*MEMORY[0x1E0CB2D50];
        v14 = (id)*MEMORY[0x1E0CB2D50];
        *v35 = sub_1DC76F44C();
        v35[1] = v15;
        v16 = sub_1DC76F464();
        v35[5] = MEMORY[0x1E0DEA968];
        v35[2] = v16;
        v35[3] = v17;
        sub_1DC74CCA0();

        v18 = sub_1DC76F410();
        sub_1DC7609B8(v39, v37, v38, v18);
        swift_willThrow();
        sub_1DC7521C0((uint64_t)v73);

        swift_bridgeObjectRelease();
        sub_1DC7521C0((uint64_t)v77);
        sub_1DC75A0B4();
      }
    }
  }
  else
  {
    sub_1DC76D228();
    v46 = sub_1DC76F464();
    v44 = v2;
    sub_1DC75EA0C(2);
    v45 = v3;
    sub_1DC76F74C();
    v42 = v4;
    v43 = (id)*MEMORY[0x1E0CB2D50];
    v5 = (id)*MEMORY[0x1E0CB2D50];
    *v42 = sub_1DC76F44C();
    v42[1] = v6;
    v7 = sub_1DC76F464();
    v42[5] = MEMORY[0x1E0DEA968];
    v42[2] = v7;
    v42[3] = v8;
    sub_1DC74CCA0();

    v9 = sub_1DC76F410();
    sub_1DC7609B8(v46, v44, v45, v9);
    swift_willThrow();
    sub_1DC7521C0((uint64_t)v77);
    sub_1DC75A0B4();
  }
  return v47;
}

uint64_t sub_1DC7668E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  id v5;
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
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[24];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  _QWORD *v33;
  uint64_t v34;
  _BYTE v35[24];
  uint64_t v36;
  char v37[32];
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[6];

  v40[4] = 0;
  v33 = 0;
  v40[5] = a1;
  v38 = sub_1DC76F464();
  v39 = v1;
  MEMORY[0x1DF0CCDA0](v40);
  sub_1DC74CCE0();
  if (!v40[3])
  {
    sub_1DC76D228();
    v24 = sub_1DC76F464();
    v22 = v2;
    sub_1DC75EA0C(2);
    v23 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
    sub_1DC76F74C();
    v20 = v4;
    v21 = (id)*MEMORY[0x1E0CB2D50];
    v5 = (id)*MEMORY[0x1E0CB2D50];
    *v20 = sub_1DC76F44C();
    v20[1] = v6;
    v7 = sub_1DC76F464();
    v20[5] = MEMORY[0x1E0DEA968];
    v20[2] = v7;
    v20[3] = v8;
    sub_1DC74CCA0();

    v9 = sub_1DC76F410();
    sub_1DC7609B8(v24, v22, v23, v9);
    swift_willThrow();
    sub_1DC7521C0((uint64_t)v40);
    return v25;
  }
  type metadata accessor for AMDVectorDBManager();
  sub_1DC751DA4((uint64_t)v40, (uint64_t)v35);
  if (!v36)
  {
    sub_1DC76F6C8();
    __break(1u);
  }
  sub_1DC751E1C((uint64_t)v35, (uint64_t)v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
  swift_dynamicCast();
  v19 = AMDVectorDBManager.__allocating_init(vectorDBConfig:)(v34);
  if (v26)
  {
    sub_1DC7521C0((uint64_t)v40);
    return v25;
  }
  v33 = v19;
  v30 = sub_1DC76F464();
  v31 = v10;
  MEMORY[0x1DF0CCDA0](v32);
  sub_1DC74CCE0();
  if (v32[3])
  {
    sub_1DC751DA4((uint64_t)v32, (uint64_t)v28);
    if (v29)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AC70);
      if ((swift_dynamicCast() & 1) != 0)
        v16 = v27;
      else
        v16 = 0;
      v15 = v16;
    }
    else
    {
      sub_1DC7521C0((uint64_t)v28);
      v15 = 0;
    }
    v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))((*v19 & *MEMORY[0x1E0DEEDD8]) + 0x70))(v15, v11, v12);
    swift_bridgeObjectRelease();
    sub_1DC7521C0((uint64_t)v32);

    sub_1DC7521C0((uint64_t)v40);
    return v14;
  }
  else
  {
    v18 = (*(uint64_t (**)(_QWORD))((*v19 & *MEMORY[0x1E0DEEDD8]) + 0x70))(0);
    sub_1DC7521C0((uint64_t)v32);

    sub_1DC7521C0((uint64_t)v40);
    return v18;
  }
}

uint64_t sub_1DC767064(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[24];
  uint64_t v38;
  char v39[32];
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  _QWORD *v43;
  uint64_t v44;
  _BYTE v45[24];
  uint64_t v46;
  char v47[32];
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[6];

  v50[4] = 0;
  v43 = 0;
  v50[5] = a1;
  v48 = sub_1DC76F464();
  v49 = v1;
  MEMORY[0x1DF0CCDA0](v50);
  sub_1DC74CCE0();
  if (!v50[3])
  {
    sub_1DC76D228();
    v33 = sub_1DC76F464();
    v31 = v2;
    sub_1DC75EA0C(2);
    v32 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
    sub_1DC76F74C();
    v29 = v4;
    v30 = (id)*MEMORY[0x1E0CB2D50];
    v5 = (id)*MEMORY[0x1E0CB2D50];
    *v29 = sub_1DC76F44C();
    v29[1] = v6;
    v7 = sub_1DC76F464();
    v29[5] = MEMORY[0x1E0DEA968];
    v29[2] = v7;
    v29[3] = v8;
    sub_1DC74CCA0();

    v9 = sub_1DC76F410();
    sub_1DC7609B8(v33, v31, v32, v9);
    swift_willThrow();
    sub_1DC7521C0((uint64_t)v50);
    return v34;
  }
  type metadata accessor for AMDVectorDBManager();
  sub_1DC751DA4((uint64_t)v50, (uint64_t)v45);
  if (!v46)
  {
    sub_1DC76F6C8();
    __break(1u);
  }
  sub_1DC751E1C((uint64_t)v45, (uint64_t)v47);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
  swift_dynamicCast();
  v28 = AMDVectorDBManager.__allocating_init(vectorDBConfig:)(v44);
  if (v35)
  {
    sub_1DC7521C0((uint64_t)v50);
    return v34;
  }
  v43 = v28;
  v40 = sub_1DC76F464();
  v41 = v10;
  MEMORY[0x1DF0CCDA0](v42);
  sub_1DC74CCE0();
  if (!v42[3])
  {
    sub_1DC76D228();
    v27 = sub_1DC76F464();
    v25 = v11;
    sub_1DC75EA0C(3);
    v26 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
    sub_1DC76F74C();
    v23 = v13;
    v24 = (id)*MEMORY[0x1E0CB2D50];
    v14 = (id)*MEMORY[0x1E0CB2D50];
    *v23 = sub_1DC76F44C();
    v23[1] = v15;
    v16 = sub_1DC76F464();
    v23[5] = MEMORY[0x1E0DEA968];
    v23[2] = v16;
    v23[3] = v17;
    sub_1DC74CCA0();

    v18 = sub_1DC76F410();
    sub_1DC7609B8(v27, v25, v26, v18);
    swift_willThrow();
    sub_1DC7521C0((uint64_t)v42);

    sub_1DC7521C0((uint64_t)v50);
    return v34;
  }
  sub_1DC751DA4((uint64_t)v42, (uint64_t)v37);
  if (!v38)
  {
    sub_1DC76F6C8();
    __break(1u);
  }
  sub_1DC751E1C((uint64_t)v37, (uint64_t)v39);
  swift_dynamicCast();
  v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))((*v28 & *MEMORY[0x1E0DEEDD8]) + 0x68))(v36, v19, v20);
  swift_bridgeObjectRelease();
  sub_1DC7521C0((uint64_t)v42);

  sub_1DC7521C0((uint64_t)v50);
  return v22;
}

uint64_t sub_1DC767890(uint64_t a1)
{
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
  uint64_t *v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
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
  uint64_t *v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
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
  uint64_t *v47;
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  id v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  void *v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  _BYTE *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _QWORD *v131;
  uint64_t v132;
  _QWORD *v133;
  uint64_t v134;
  _QWORD *v135;
  uint64_t v136;
  _QWORD *v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  _BYTE *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  _QWORD *v149;
  uint64_t v150;
  _QWORD *v151;
  uint64_t v152;
  _QWORD *v153;
  uint64_t v154;
  _QWORD *v155;
  void *v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  id v161;
  void *v162;
  uint64_t *v163;
  uint64_t v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t *v167;
  _BYTE *v168;
  uint64_t v169;
  void *v170;
  id v171;
  uint64_t *v172;
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t *v183;
  uint64_t v184;
  char *v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  _BYTE *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  _QWORD *v195;
  uint64_t v196;
  _QWORD *v197;
  uint64_t v198;
  _QWORD *v199;
  uint64_t v200;
  _QWORD *v201;
  void *v202;
  void *v203;
  char *v204;
  uint64_t v205;
  uint64_t *v206;
  uint64_t *v207;
  uint64_t v208;
  uint64_t v209;
  id v210;
  void *v211;
  uint64_t v212;
  char v213;
  uint64_t v214;
  int v215;
  uint64_t v216;
  id v217;
  uint64_t v218;
  id v219;
  _QWORD *v220;
  _QWORD *v221;
  uint64_t v222;
  id v223;
  uint64_t v224;
  id v225;
  id v226;
  id v227;
  id v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint8_t *v233;
  uint64_t v234;
  uint64_t v235;
  unsigned int v236;
  uint64_t *v237;
  uint64_t *v238;
  _BYTE **v239;
  uint64_t *v240;
  uint64_t *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint32_t v245;
  int v246;
  NSObject *v247;
  _BYTE *v248;
  void *v249;
  void *v250;
  void *v251;
  uint64_t v252;
  uint8_t *v253;
  uint64_t v254;
  uint64_t v255;
  _BYTE **v256;
  uint64_t *v257;
  uint64_t *v258;
  void *v259;
  void *v260;
  id v261;
  uint32_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  _QWORD *v272;
  NSObject *v273;
  int v274;
  id v275;
  uint64_t v276;
  uint64_t v277;
  id v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t *v281;
  id v282;
  int v283;
  uint64_t *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  id v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  void *v298;
  void *v299;
  id v300;
  uint64_t v301;
  unint64_t v302;
  uint64_t *v303;
  id v304;
  unsigned int v305;
  id v306;
  id v307;
  id v308;
  id v309;
  id v310;
  id v311;
  void (*v312)(_QWORD, _QWORD);
  void *v313;
  uint64_t v314;
  void *v315;
  uint64_t v316;
  void *v317;
  void *v318;
  void *v319;
  uint64_t v320;
  uint8_t *v321;
  uint64_t v322;
  uint64_t v323;
  _BYTE **v324;
  _QWORD *v325;
  uint64_t *v326;
  void *v327;
  void (*v328)(_QWORD, _QWORD, _QWORD);
  unint64_t v329;
  unint64_t v330;
  uint64_t *v331;
  unint64_t v332;
  uint32_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  _QWORD *v343;
  uint64_t v344;
  NSObject *v345;
  int v346;
  _QWORD *v347;
  _QWORD *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint8_t *v354;
  uint64_t v355;
  uint64_t v356;
  _BYTE **v357;
  uint64_t *v358;
  uint64_t *v359;
  void *v360;
  unint64_t v361;
  unint64_t v362;
  uint64_t *v363;
  uint32_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  _QWORD *v374;
  uint64_t v375;
  NSObject *v376;
  int v377;
  _BOOL4 v378;
  _BOOL4 v379;
  id v380;
  _BYTE *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  id v386;
  _BYTE *v387;
  uint64_t v388;
  id v389;
  id v390;
  id v391;
  id v392;
  _QWORD *v393;
  int v394;
  uint64_t *v395;
  uint64_t v396;
  id v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  id v403;
  _BOOL4 v404;
  _BOOL4 v405;
  _QWORD *v406;
  int v407;
  uint64_t *v408;
  uint64_t v409;
  id v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  id v416;
  _BYTE *v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t *v421;
  int v422;
  _QWORD *v423;
  int v424;
  uint64_t *v425;
  uint64_t v426;
  id v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  id v433;
  _BOOL4 v434;
  _BOOL4 v435;
  _QWORD *v436;
  int v437;
  uint64_t *v438;
  uint64_t v439;
  id v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  id v446;
  _BYTE *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  _QWORD *v452;
  unint64_t v453;
  uint64_t *v454;
  int v455;
  _QWORD *v456;
  int v457;
  uint64_t *v458;
  uint64_t v459;
  id v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  id v466;
  _BOOL4 v467;
  _BOOL4 v468;
  _BYTE *v469;
  _BYTE *v470;
  _BYTE *v471;
  uint64_t v472;
  uint64_t v473;
  _QWORD *v474;
  _QWORD *v475;
  int v476;
  uint64_t *v477;
  uint64_t v478;
  id v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  id v485;
  _BOOL4 v486;
  _BOOL4 v487;
  uint64_t v488;
  _QWORD *v489;
  uint64_t v490;
  void *v491;
  uint64_t v492;
  _BYTE *v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t i;
  _QWORD *v497;
  int v498;
  uint64_t *v499;
  uint64_t v500;
  id v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  id v508;
  uint64_t v509;
  _BOOL4 v510;
  _BOOL4 v511;
  uint64_t v512;
  const char *v513;
  const char *v514;
  const char *v515;
  uint64_t v516;
  uint64_t v517;
  unint64_t v518;
  char *v519;
  uint64_t v520;
  uint64_t v521;
  unint64_t v522;
  char *v523;
  unint64_t v524;
  char *v525;
  unint64_t v526;
  char *v527;
  unint64_t v528;
  char *v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  _QWORD *v536;
  uint64_t (*v537)(uint64_t, uint64_t, uint64_t);
  uint64_t v538;
  _BYTE *v539;
  _QWORD v540[2];
  uint64_t v541;
  uint32_t v542;
  uint64_t (*v543)(uint64_t, uint64_t, uint64_t);
  uint64_t v544;
  _BYTE *v545[3];
  id v546;
  uint64_t (*v547)(uint64_t, uint64_t, uint64_t);
  uint64_t v548;
  _BYTE *v549[2];
  _BYTE *v550;
  _QWORD v551[2];
  uint64_t v552;
  id v553[2];
  uint32_t v554;
  uint64_t v555;
  uint32_t v556;
  id v557;
  uint64_t v558;
  uint64_t v559;
  id v560;
  uint64_t v561;
  unsigned int v562;
  uint64_t v563;
  uint32_t v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  id v568;
  uint64_t v569;
  uint64_t v570;
  _QWORD v571[2];
  _QWORD v572[4];
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  _QWORD v578[2];
  _QWORD v579[2];
  _QWORD v580[2];
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  uint64_t v585;
  _QWORD v586[2];
  _QWORD v587[2];
  _BYTE *v588;
  _BYTE *v589;
  _BYTE *v590;
  _BYTE *v591;
  _QWORD v592[2];
  _QWORD v593[2];
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  _QWORD v600[2];
  _QWORD v601[2];
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  char *v605;
  uint64_t v606;
  uint64_t v607;
  _QWORD v608[4];
  uint64_t v609;
  _QWORD v610[5];
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  _QWORD v615[4];
  void *v616;
  void *v617;
  _QWORD v618[4];
  _BYTE v619[40];
  void *v620;
  _QWORD v621[4];
  _BYTE v622[32];
  _QWORD v623[4];
  _QWORD v624[4];
  _BYTE v625[32];
  _QWORD v626[4];
  _QWORD v627[4];
  _BYTE v628[32];
  _QWORD v629[4];
  _QWORD v630[4];
  _BYTE v631[32];
  _QWORD v632[4];
  uint64_t v633;
  _QWORD v634[4];
  _BYTE v635[32];
  _QWORD v636[5];

  v535 = a1;
  v513 = "Fatal error";
  v514 = "Unexpectedly found nil while unwrapping an Optional value";
  v515 = "AppleMediaDiscovery/AMDVectorDB.swift";
  v636[4] = *MEMORY[0x1E0C80C00];
  v605 = 0;
  v604 = 0;
  v603 = 0;
  v602 = 0;
  v598 = 0;
  v596 = 0;
  v597 = 0;
  v594 = 0;
  v588 = 0;
  v589 = 0;
  v582 = 0;
  v583 = 0;
  v574 = 0;
  v575 = 0;
  v569 = 0;
  v567 = 0;
  v559 = 0;
  v558 = 0;
  v557 = 0;
  v552 = 0;
  v546 = 0;
  v530 = 0;
  v516 = sub_1DC76EFB4();
  v517 = *(_QWORD *)(v516 - 8);
  v518 = (*(_QWORD *)(v517 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x1E0C80A78](0);
  v519 = (char *)&v216 - v518;
  v605 = (char *)&v216 - v518;
  v520 = sub_1DC76F3D4();
  v521 = *(_QWORD *)(v520 - 8);
  v522 = (*(_QWORD *)(v521 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v2 = MEMORY[0x1E0C80A78](v535);
  v523 = (char *)&v216 - v522;
  v524 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = MEMORY[0x1E0C80A78](v2);
  v525 = (char *)&v216 - v524;
  v526 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = MEMORY[0x1E0C80A78](v4);
  v527 = (char *)&v216 - v526;
  v528 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  v8 = MEMORY[0x1E0C80A78](v6);
  v529 = (char *)&v216 - v528;
  v604 = v8;
  v603 = v1;
  v531 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB600B8);
  sub_1DC76F74C();
  v532 = MEMORY[0x1E0DEA968];
  v533 = MEMORY[0x1E0DEE9B8] + 8;
  v534 = MEMORY[0x1E0DEA978];
  v602 = sub_1DC76F410();
  v9 = sub_1DC76F464();
  v536 = v601;
  v601[0] = v9;
  v601[1] = v10;
  MEMORY[0x1DF0CCDA0](v636);
  sub_1DC74CCE0();
  v511 = v636[3] == 0;
  v510 = v511;
  sub_1DC7521C0((uint64_t)v636);
  if (v510)
  {
    sub_1DC76D228();
    v498 = 1;
    v506 = sub_1DC76F464();
    v504 = v11;
    sub_1DC75EA0C(3);
    v505 = v12;
    v500 = sub_1DC76F74C();
    v499 = v13;
    v501 = (id)*MEMORY[0x1E0CB2D50];
    v14 = v501;
    v15 = sub_1DC76F44C();
    v16 = v499;
    *v499 = v15;
    v16[1] = v17;
    v18 = sub_1DC76F464();
    v19 = v499;
    v20 = v18;
    v21 = v500;
    v503 = MEMORY[0x1E0DEA968];
    v499[5] = MEMORY[0x1E0DEA968];
    v19[2] = v20;
    v19[3] = v22;
    sub_1DC74CCA0();
    v502 = v21;

    v23 = sub_1DC76F410();
    v508 = sub_1DC7609B8(v506, v504, v505, v23);
    swift_willThrow();
    sub_1DC75A0B4();
    v509 = (uint64_t)v508;
  }
  else
  {
    v24 = sub_1DC76F464();
    v497 = v600;
    v600[0] = v24;
    v600[1] = v25;
    MEMORY[0x1DF0CCDA0](v634);
    sub_1DC74CCE0();
    if (!v634[3])
    {
      v213 = 2;
      v214 = 239;
      v215 = 0;
      sub_1DC76F6C8();
      __break(1u);
    }
    v493 = v635;
    sub_1DC751E1C((uint64_t)v634, (uint64_t)v635);
    v495 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601B8);
    swift_dynamicCast();
    v494 = v599;
    v598 = v599;
    swift_bridgeObjectRetain();
    v595 = v494;
    sub_1DC76E300();
    sub_1DC76F5E4();
    for (i = v512; ; i = v224)
    {
      while (1)
      {
        while (1)
        {
          v491 = (void *)i;
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDB60218);
          sub_1DC76F698();
          v492 = v633;
          if (!v633)
          {
            sub_1DC76E370();
            v281 = &v602;
            v280 = v602;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            sub_1DC75A0B4();
            return v280;
          }
          v490 = v492;
          v488 = v492;
          v594 = v492;
          v26 = sub_1DC76F464();
          v489 = v593;
          v593[0] = v26;
          v593[1] = v27;
          MEMORY[0x1DF0CCDA0](v632);
          sub_1DC74CCE0();
          v487 = v632[3] == 0;
          v486 = v487;
          sub_1DC7521C0((uint64_t)v632);
          if (v486)
          {
            sub_1DC76D228();
            v476 = 1;
            v484 = sub_1DC76F464();
            v482 = v28;
            sub_1DC75EA0C(3);
            v483 = v29;
            v478 = sub_1DC76F74C();
            v477 = v30;
            v479 = (id)*MEMORY[0x1E0CB2D50];
            v31 = v479;
            v32 = sub_1DC76F44C();
            v33 = v477;
            *v477 = v32;
            v33[1] = v34;
            v35 = sub_1DC76F464();
            v36 = v477;
            v37 = v35;
            v38 = v478;
            v481 = MEMORY[0x1E0DEA968];
            v477[5] = MEMORY[0x1E0DEA968];
            v36[2] = v37;
            v36[3] = v39;
            sub_1DC74CCA0();
            v480 = v38;

            v40 = sub_1DC76F410();
            v485 = sub_1DC7609B8(v484, v482, v483, v40);
            swift_willThrow();
            swift_bridgeObjectRelease();
            sub_1DC76E370();
            swift_bridgeObjectRelease();
            sub_1DC75A0B4();
            v509 = (uint64_t)v485;
            return v507;
          }
          v41 = sub_1DC76F464();
          v475 = v592;
          v592[0] = v41;
          v592[1] = v42;
          MEMORY[0x1DF0CCDA0](v630);
          sub_1DC74CCE0();
          if (!v630[3])
          {
            v213 = 2;
            v214 = 244;
            v215 = 0;
            sub_1DC76F6C8();
            __break(1u);
          }
          v469 = v631;
          sub_1DC751E1C((uint64_t)v630, (uint64_t)v631);
          v473 = MEMORY[0x1E0DEE9B8] + 8;
          v472 = MEMORY[0x1E0DEA968];
          swift_dynamicCast();
          v470 = v590;
          v471 = v591;
          v588 = v590;
          v589 = v591;
          v43 = sub_1DC76F464();
          v474 = v587;
          v587[0] = v43;
          v587[1] = v44;
          MEMORY[0x1DF0CCDA0](v629);
          sub_1DC74CCE0();
          v468 = v629[3] == 0;
          v467 = v468;
          sub_1DC7521C0((uint64_t)v629);
          if (v467)
          {
            sub_1DC76D228();
            v457 = 1;
            v465 = sub_1DC76F464();
            v463 = v45;
            sub_1DC75EA0C(3);
            v464 = v46;
            v459 = sub_1DC76F74C();
            v458 = v47;
            v460 = (id)*MEMORY[0x1E0CB2D50];
            v48 = v460;
            v49 = sub_1DC76F44C();
            v50 = v458;
            *v458 = v49;
            v50[1] = v51;
            v52 = sub_1DC76F464();
            v53 = v458;
            v54 = v52;
            v55 = v459;
            v462 = MEMORY[0x1E0DEA968];
            v458[5] = MEMORY[0x1E0DEA968];
            v53[2] = v54;
            v53[3] = v56;
            sub_1DC74CCA0();
            v461 = v55;

            v57 = sub_1DC76F410();
            v466 = sub_1DC7609B8(v465, v463, v464, v57);
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1DC76E370();
            swift_bridgeObjectRelease();
            sub_1DC75A0B4();
            v509 = (uint64_t)v466;
            return v507;
          }
          v58 = sub_1DC76F464();
          v456 = v586;
          v586[0] = v58;
          v586[1] = v59;
          MEMORY[0x1DF0CCDA0](v627);
          sub_1DC74CCE0();
          if (!v627[3])
          {
            v213 = 2;
            v214 = 248;
            v215 = 0;
            sub_1DC76F6C8();
            __break(1u);
          }
          v447 = v628;
          sub_1DC751E1C((uint64_t)v627, (uint64_t)v628);
          swift_dynamicCast();
          v449 = v584;
          v450 = v585;
          v582 = v584;
          v583 = v585;
          v448 = *sub_1DC75E82C();
          swift_bridgeObjectRetain();
          v454 = &v581;
          v581 = v448;
          v452 = v580;
          v580[0] = v449;
          v580[1] = v450;
          v451 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601C8);
          v453 = sub_1DC7531A8();
          v455 = sub_1DC76F4AC();
          sub_1DC752198();
          if ((v455 & 1) == 0)
          {
            sub_1DC76D228();
            v437 = 1;
            v445 = sub_1DC76F464();
            v443 = v60;
            sub_1DC75EA0C(3);
            v444 = v61;
            v439 = sub_1DC76F74C();
            v438 = v62;
            v440 = (id)*MEMORY[0x1E0CB2D50];
            v63 = v440;
            v64 = sub_1DC76F44C();
            v65 = v438;
            *v438 = v64;
            v65[1] = v66;
            v67 = sub_1DC76F464();
            v68 = v438;
            v69 = v67;
            v70 = v439;
            v442 = MEMORY[0x1E0DEA968];
            v438[5] = MEMORY[0x1E0DEA968];
            v68[2] = v69;
            v68[3] = v71;
            sub_1DC74CCA0();
            v441 = v70;

            v72 = sub_1DC76F410();
            v446 = sub_1DC7609B8(v445, v443, v444, v72);
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1DC76E370();
            swift_bridgeObjectRelease();
            sub_1DC75A0B4();
            v509 = (uint64_t)v446;
            return v507;
          }
          v73 = sub_1DC76F464();
          v436 = v579;
          v579[0] = v73;
          v579[1] = v74;
          MEMORY[0x1DF0CCDA0](v626);
          sub_1DC74CCE0();
          v435 = v626[3] == 0;
          v434 = v435;
          sub_1DC7521C0((uint64_t)v626);
          if (v434)
          {
            sub_1DC76D228();
            v424 = 1;
            v432 = sub_1DC76F464();
            v430 = v75;
            sub_1DC75EA0C(3);
            v431 = v76;
            v426 = sub_1DC76F74C();
            v425 = v77;
            v427 = (id)*MEMORY[0x1E0CB2D50];
            v78 = v427;
            v79 = sub_1DC76F44C();
            v80 = v425;
            *v425 = v79;
            v80[1] = v81;
            v82 = sub_1DC76F464();
            v83 = v425;
            v84 = v82;
            v85 = v426;
            v429 = MEMORY[0x1E0DEA968];
            v425[5] = MEMORY[0x1E0DEA968];
            v83[2] = v84;
            v83[3] = v86;
            sub_1DC74CCA0();
            v428 = v85;

            v87 = sub_1DC76F410();
            v433 = sub_1DC7609B8(v432, v430, v431, v87);
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1DC76E370();
            swift_bridgeObjectRelease();
            sub_1DC75A0B4();
            v509 = (uint64_t)v433;
            return v507;
          }
          v88 = sub_1DC76F464();
          v423 = v578;
          v578[0] = v88;
          v578[1] = v89;
          MEMORY[0x1DF0CCDA0](v624);
          sub_1DC74CCE0();
          if (!v624[3])
          {
            v213 = 2;
            v214 = 256;
            v215 = 0;
            sub_1DC76F6C8();
            __break(1u);
          }
          v417 = v625;
          sub_1DC751E1C((uint64_t)v624, (uint64_t)v625);
          swift_dynamicCast();
          v418 = v576;
          v419 = v577;
          v574 = v576;
          v575 = v577;
          v420 = *sub_1DC75E82C();
          swift_bridgeObjectRetain();
          v421 = &v573;
          v573 = v420;
          v572[2] = v449;
          v572[3] = v450;
          v422 = sub_1DC76F4AC();
          sub_1DC752198();
          if ((v422 & 1) == 0)
          {
            sub_1DC76D228();
            v407 = 1;
            v415 = sub_1DC76F464();
            v413 = v90;
            sub_1DC75EA0C(3);
            v414 = v91;
            v409 = sub_1DC76F74C();
            v408 = v92;
            v410 = (id)*MEMORY[0x1E0CB2D50];
            v93 = v410;
            v94 = sub_1DC76F44C();
            v95 = v408;
            *v408 = v94;
            v95[1] = v96;
            v97 = sub_1DC76F464();
            v98 = v408;
            v99 = v97;
            v100 = v409;
            v412 = MEMORY[0x1E0DEA968];
            v408[5] = MEMORY[0x1E0DEA968];
            v98[2] = v99;
            v98[3] = v101;
            sub_1DC74CCA0();
            v411 = v100;

            v102 = sub_1DC76F410();
            v416 = sub_1DC7609B8(v415, v413, v414, v102);
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1DC76E370();
            swift_bridgeObjectRelease();
            sub_1DC75A0B4();
            v509 = (uint64_t)v416;
            return v507;
          }
          v103 = sub_1DC76F464();
          v406 = v572;
          v572[0] = v103;
          v572[1] = v104;
          MEMORY[0x1DF0CCDA0](v623);
          sub_1DC74CCE0();
          v405 = v623[3] == 0;
          v404 = v405;
          sub_1DC7521C0((uint64_t)v623);
          if (v404)
          {
            sub_1DC76D228();
            v394 = 1;
            v402 = sub_1DC76F464();
            v400 = v105;
            sub_1DC75EA0C(3);
            v401 = v106;
            v396 = sub_1DC76F74C();
            v395 = v107;
            v397 = (id)*MEMORY[0x1E0CB2D50];
            v108 = v397;
            v109 = sub_1DC76F44C();
            v110 = v395;
            *v395 = v109;
            v110[1] = v111;
            v112 = sub_1DC76F464();
            v113 = v395;
            v114 = v112;
            v115 = v396;
            v399 = MEMORY[0x1E0DEA968];
            v395[5] = MEMORY[0x1E0DEA968];
            v113[2] = v114;
            v113[3] = v116;
            sub_1DC74CCA0();
            v398 = v115;

            v117 = sub_1DC76F410();
            v403 = sub_1DC7609B8(v402, v400, v401, v117);
            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1DC76E370();
            swift_bridgeObjectRelease();
            sub_1DC75A0B4();
            v509 = (uint64_t)v403;
            return v507;
          }
          v118 = sub_1DC76F464();
          v393 = v571;
          v571[0] = v118;
          v571[1] = v119;
          MEMORY[0x1DF0CCDA0](v621);
          sub_1DC74CCE0();
          if (!v621[3])
          {
            v213 = 2;
            v214 = 264;
            v215 = 0;
            sub_1DC76F6C8();
            __break(1u);
          }
          v387 = v622;
          sub_1DC751E1C((uint64_t)v621, (uint64_t)v622);
          swift_dynamicCast();
          v388 = v570;
          v569 = v570;
          v620 = 0;
          v389 = (id)objc_opt_self();
          swift_bridgeObjectRetain();
          v391 = (id)sub_1DC76F440();
          swift_bridgeObjectRelease();
          v568 = v620;
          v392 = objc_msgSend(v389, sel_fetchVectorDBConfigForDBName_error_, v391, &v568);
          v390 = v568;
          v120 = v568;
          v121 = v620;
          v620 = v390;

          if (!v392)
          {
            v278 = v620;
            v279 = sub_1DC76EF6C();

            swift_willThrow();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_1DC76E370();
            swift_bridgeObjectRelease();
            sub_1DC75A0B4();
            v509 = v279;
            return v507;
          }
          v386 = v392;
          v380 = v392;
          v383 = MEMORY[0x1E0DEC198];
          v384 = MEMORY[0x1E0DEE9B8] + 8;
          v385 = MEMORY[0x1E0DEC1A0];
          v382 = sub_1DC76F3F8();
          v567 = v382;

          v565 = sub_1DC76F464();
          v566 = v122;
          v381 = v619;
          sub_1DC76F704();
          MEMORY[0x1DF0CCDA0](v618, v381, v382, v383, v384, v385);
          v379 = v618[3] != 0;
          v378 = v379;
          sub_1DC7521C0((uint64_t)v618);
          sub_1DC75C350((uint64_t)v619);
          sub_1DC74CCE0();
          if (!v378)
            break;
          v123 = v529;
          v124 = sub_1DC75DF44();
          (*(void (**)(char *, uint64_t, uint64_t))(v521 + 16))(v123, v124, v520);
          swift_bridgeObjectRetain();
          v366 = 32;
          v367 = 7;
          v125 = swift_allocObject();
          v126 = v471;
          v368 = v125;
          *(_QWORD *)(v125 + 16) = v470;
          *(_QWORD *)(v125 + 24) = v126;
          v376 = sub_1DC76F3BC();
          v377 = sub_1DC76F5F0();
          v363 = &v541;
          v541 = 12;
          v361 = sub_1DC76ADD8();
          v362 = sub_1DC76AE40();
          sub_1DC76AEA8();
          sub_1DC76F4B8();
          v364 = v542;
          v365 = 17;
          v370 = swift_allocObject();
          *(_BYTE *)(v370 + 16) = 32;
          v371 = swift_allocObject();
          *(_BYTE *)(v371 + 16) = 8;
          v127 = swift_allocObject();
          v128 = v368;
          v369 = v127;
          *(_QWORD *)(v127 + 16) = sub_1DC76E740;
          *(_QWORD *)(v127 + 24) = v128;
          v129 = swift_allocObject();
          v130 = v369;
          v373 = v129;
          *(_QWORD *)(v129 + 16) = sub_1DC76E7E8;
          *(_QWORD *)(v129 + 24) = v130;
          v375 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60248);
          v372 = sub_1DC76F74C();
          v374 = v131;
          swift_retain();
          v132 = v370;
          v133 = v374;
          *v374 = sub_1DC76E774;
          v133[1] = v132;
          swift_retain();
          v134 = v371;
          v135 = v374;
          v374[2] = sub_1DC76E7A4;
          v135[3] = v134;
          swift_retain();
          v136 = v373;
          v137 = v374;
          v374[4] = sub_1DC76E830;
          v137[5] = v136;
          sub_1DC74CCA0();
          swift_bridgeObjectRelease();
          if (os_log_type_enabled(v376, (os_log_type_t)v377))
          {
            v354 = (uint8_t *)sub_1DC76F638();
            v353 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60210);
            v355 = sub_1DC76AF10(0);
            v356 = sub_1DC76AF10(1);
            v357 = &v539;
            v539 = v354;
            v358 = &v607;
            v607 = v355;
            v359 = &v606;
            v606 = v356;
            sub_1DC76AF68(2, &v539);
            sub_1DC76AF68(1, v357);
            v138 = v491;
            v537 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E774;
            v538 = v370;
            sub_1DC76AF7C(&v537, (uint64_t)v357, (uint64_t)v358, (uint64_t)v359);
            v360 = v138;
            if (v138)
            {
              __break(1u);
            }
            else
            {
              v537 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E7A4;
              v538 = v371;
              sub_1DC76AF7C(&v537, (uint64_t)&v539, (uint64_t)&v607, (uint64_t)&v606);
              v351 = 0;
              v139 = (uint64_t)v351;
              v537 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E830;
              v538 = v373;
              sub_1DC76AF7C(&v537, (uint64_t)&v539, (uint64_t)&v607, (uint64_t)&v606);
              v350 = v139;
              _os_log_impl(&dword_1DC678000, v376, (os_log_type_t)v377, "DB exists with name:%s", v354, v364);
              sub_1DC76AFC0(v355);
              sub_1DC76AFC0(v356);
              sub_1DC76F620();
              swift_release();
              swift_release();
              swift_release();
              v352 = v350;
            }
          }
          else
          {
            swift_release();
            swift_release();
            swift_release();
            v352 = (uint64_t)v491;
          }
          v349 = v352;

          (*(void (**)(char *, uint64_t))(v521 + 8))(v529, v520);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60190);
          v348 = v608;
          v608[3] = v140;
          v608[0] = v382;
          v347 = v540;
          v540[0] = v470;
          v540[1] = v471;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
          sub_1DC76F434();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          i = v349;
        }
        v141 = v527;
        v142 = sub_1DC75DF44();
        v328 = *(void (**)(_QWORD, _QWORD, _QWORD))(v521 + 16);
        v328(v141, v142, v520);
        swift_bridgeObjectRetain();
        v335 = 32;
        v336 = 7;
        v143 = swift_allocObject();
        v144 = v471;
        v337 = v143;
        *(_QWORD *)(v143 + 16) = v470;
        *(_QWORD *)(v143 + 24) = v144;
        v345 = sub_1DC76F3BC();
        v346 = sub_1DC76F5F0();
        v331 = &v563;
        v563 = 12;
        v329 = sub_1DC76ADD8();
        v330 = sub_1DC76AE40();
        v332 = sub_1DC76AEA8();
        sub_1DC76F4B8();
        v333 = v564;
        v334 = 17;
        v339 = swift_allocObject();
        *(_BYTE *)(v339 + 16) = 32;
        v340 = swift_allocObject();
        *(_BYTE *)(v340 + 16) = 8;
        v145 = swift_allocObject();
        v146 = v337;
        v338 = v145;
        *(_QWORD *)(v145 + 16) = sub_1DC76E3D4;
        *(_QWORD *)(v145 + 24) = v146;
        v147 = swift_allocObject();
        v148 = v338;
        v342 = v147;
        *(_QWORD *)(v147 + 16) = sub_1DC76E47C;
        *(_QWORD *)(v147 + 24) = v148;
        v344 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60248);
        v341 = sub_1DC76F74C();
        v343 = v149;
        swift_retain();
        v150 = v339;
        v151 = v343;
        *v343 = sub_1DC76E408;
        v151[1] = v150;
        swift_retain();
        v152 = v340;
        v153 = v343;
        v343[2] = sub_1DC76E438;
        v153[3] = v152;
        swift_retain();
        v154 = v342;
        v155 = v343;
        v343[4] = sub_1DC76E4C4;
        v155[5] = v154;
        sub_1DC74CCA0();
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v345, (os_log_type_t)v346))
        {
          v321 = (uint8_t *)sub_1DC76F638();
          v320 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60210);
          v322 = sub_1DC76AF10(0);
          v323 = sub_1DC76AF10(1);
          v324 = v545;
          v545[0] = v321;
          v325 = v610;
          v610[0] = v322;
          v326 = &v609;
          v609 = v323;
          sub_1DC76AF68(2, v545);
          sub_1DC76AF68(1, v324);
          v156 = v491;
          v543 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E408;
          v544 = v339;
          sub_1DC76AF7C(&v543, (uint64_t)v324, (uint64_t)v325, (uint64_t)v326);
          v327 = v156;
          if (v156)
          {
            __break(1u);
          }
          else
          {
            v543 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E438;
            v544 = v340;
            sub_1DC76AF7C(&v543, (uint64_t)v545, (uint64_t)v610, (uint64_t)&v609);
            v318 = 0;
            v157 = v318;
            v543 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E4C4;
            v544 = v342;
            sub_1DC76AF7C(&v543, (uint64_t)v545, (uint64_t)v610, (uint64_t)&v609);
            v317 = v157;
            _os_log_impl(&dword_1DC678000, v345, (os_log_type_t)v346, "New vector DB name: %s. Instantiating new vectorDB", v321, v333);
            sub_1DC76AFC0(v322);
            sub_1DC76AFC0(v323);
            sub_1DC76F620();
            swift_release();
            swift_release();
            swift_release();
            v319 = v317;
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
          v319 = v491;
        }
        v313 = v319;

        v312 = *(void (**)(_QWORD, _QWORD))(v521 + 8);
        v312(v527, v520);
        v158 = type metadata accessor for AMDVectorDBManager();
        v159 = v313;
        v314 = v158;
        sub_1DC763308((uint64_t)v470, (uint64_t)v471, v519);
        v315 = v159;
        v316 = (uint64_t)v159;
        if (v159)
        {
          v277 = v316;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1DC76E370();
          swift_bridgeObjectRelease();
          sub_1DC75A0B4();
          v509 = v277;
          return v507;
        }
        v617 = 0;
        v304 = (id)objc_opt_self();
        sub_1DC76EF9C();
        v301 = v160;
        v310 = (id)sub_1DC76F440();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        v309 = (id)sub_1DC76F440();
        swift_bridgeObjectRelease();
        v303 = &v561;
        v561 = v388;
        v302 = sub_1DC76E4D0();
        sub_1DC76E538();
        sub_1DC76F4E8();
        v305 = v562;
        swift_bridgeObjectRetain();
        v308 = (id)sub_1DC76F440();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        v307 = (id)sub_1DC76F440();
        swift_bridgeObjectRelease();
        v560 = v617;
        v311 = objc_msgSend(v304, sel_persistVectorDBPath_forDBName_withVectorDimension_andDataType_withDistanceMetric_error_, v310, v309, v305, v308, v307, &v560);
        v306 = v560;
        v161 = v560;
        v162 = v617;
        v617 = v306;

        if (!v311)
        {
          v275 = v617;
          v276 = sub_1DC76EF6C();

          swift_willThrow();
          (*(void (**)(char *, uint64_t))(v517 + 8))(v519, v516);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_1DC76E370();
          swift_bridgeObjectRelease();
          sub_1DC75A0B4();
          v509 = v276;
          return v507;
        }
        v300 = v311;
        v288 = v311;
        v295 = MEMORY[0x1E0DEE9B8] + 8;
        v289 = sub_1DC76F3F8();
        v559 = v289;

        v292 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB601A0);
        v290 = sub_1DC76F74C();
        v291 = v163;
        v164 = sub_1DC76F464();
        v165 = v291;
        *v291 = v164;
        v165[1] = v166;
        swift_bridgeObjectRetain();
        v167 = v291;
        v168 = v471;
        v291[2] = (uint64_t)v470;
        v167[3] = (uint64_t)v168;
        sub_1DC74CCA0();
        v294 = MEMORY[0x1E0DEA968];
        v296 = MEMORY[0x1E0DEA978];
        v293 = sub_1DC76F410();
        v558 = v293;
        swift_bridgeObjectRetain();
        v169 = sub_1DC76F6E0();
        v170 = v315;
        v171 = AMDVectorDBManager.__allocating_init(vectorDBConfig:)(v169);
        v297 = (uint64_t)v170;
        v298 = v171;
        v299 = v170;
        if (v170)
          break;
        v282 = v298;
        swift_bridgeObjectRelease();
        v546 = v282;

        swift_bridgeObjectRetain();
        v285 = sub_1DC76F74C();
        v284 = v172;
        v283 = 1;
        v173 = sub_1DC76F464();
        v174 = v284;
        *v284 = v173;
        v174[1] = v175;
        v176 = sub_1DC76EF9C();
        v177 = v284;
        v286 = MEMORY[0x1E0DEA968];
        v284[5] = MEMORY[0x1E0DEA968];
        v177[2] = v176;
        v177[3] = v178;
        v179 = sub_1DC76F464();
        v180 = v284;
        v284[6] = v179;
        v180[7] = v181;
        swift_bridgeObjectRetain();
        v182 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60190);
        v183 = v284;
        v184 = v289;
        v284[11] = v182;
        v183[8] = v184;
        sub_1DC74CCA0();
        v287 = sub_1DC76F410();
        v610[4] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
        v610[1] = v287;
        v545[1] = v470;
        v545[2] = v471;
        sub_1DC76F434();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v517 + 8))(v519, v516);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        i = v297;
      }
      v186 = v525;
      v261 = v299;
      v260 = 0;
      swift_bridgeObjectRelease();
      v187 = v261;
      v557 = v261;
      v188 = sub_1DC75DF44();
      v328(v186, v188, v520);
      swift_bridgeObjectRetain();
      v264 = 32;
      v265 = 7;
      v189 = swift_allocObject();
      v190 = v471;
      v266 = v189;
      *(_QWORD *)(v189 + 16) = v470;
      *(_QWORD *)(v189 + 24) = v190;
      v273 = sub_1DC76F3BC();
      v274 = sub_1DC76F5F0();
      v555 = 12;
      sub_1DC76F4B8();
      v262 = v556;
      v263 = 17;
      v268 = swift_allocObject();
      *(_BYTE *)(v268 + 16) = 32;
      v269 = swift_allocObject();
      *(_BYTE *)(v269 + 16) = 8;
      v191 = swift_allocObject();
      v192 = v266;
      v267 = v191;
      *(_QWORD *)(v191 + 16) = sub_1DC76E5DC;
      *(_QWORD *)(v191 + 24) = v192;
      v193 = swift_allocObject();
      v194 = v267;
      v271 = v193;
      *(_QWORD *)(v193 + 16) = sub_1DC76E684;
      *(_QWORD *)(v193 + 24) = v194;
      v270 = sub_1DC76F74C();
      v272 = v195;
      swift_retain();
      v196 = v268;
      v197 = v272;
      *v272 = sub_1DC76E610;
      v197[1] = v196;
      swift_retain();
      v198 = v269;
      v199 = v272;
      v272[2] = sub_1DC76E640;
      v199[3] = v198;
      swift_retain();
      v200 = v271;
      v201 = v272;
      v272[4] = sub_1DC76E6CC;
      v201[5] = v200;
      sub_1DC74CCA0();
      swift_bridgeObjectRelease();
      if (os_log_type_enabled(v273, (os_log_type_t)v274))
      {
        v253 = (uint8_t *)sub_1DC76F638();
        v252 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60210);
        v254 = sub_1DC76AF10(0);
        v255 = sub_1DC76AF10(1);
        v256 = v549;
        v549[0] = v253;
        v257 = &v612;
        v612 = v254;
        v258 = &v611;
        v611 = v255;
        sub_1DC76AF68(2, v549);
        sub_1DC76AF68(1, v256);
        v202 = v260;
        v547 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E610;
        v548 = v268;
        sub_1DC76AF7C(&v547, (uint64_t)v256, (uint64_t)v257, (uint64_t)v258);
        v259 = v202;
        if (v202)
        {
          __break(1u);
        }
        else
        {
          v547 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E640;
          v548 = v269;
          sub_1DC76AF7C(&v547, (uint64_t)v549, (uint64_t)&v612, (uint64_t)&v611);
          v250 = 0;
          v203 = v250;
          v547 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1DC76E6CC;
          v548 = v271;
          sub_1DC76AF7C(&v547, (uint64_t)v549, (uint64_t)&v612, (uint64_t)&v611);
          v249 = v203;
          _os_log_impl(&dword_1DC678000, v273, (os_log_type_t)v274, "VectorDB instantiation failed for dbName: %s", v253, v262);
          sub_1DC76AFC0(v254);
          sub_1DC76AFC0(v255);
          sub_1DC76F620();
          swift_release();
          swift_release();
          swift_release();
          v251 = v249;
        }
      }
      else
      {
        swift_release();
        swift_release();
        swift_release();
        v251 = v260;
      }
      v204 = v523;
      v244 = v251;

      v312(v525, v520);
      v205 = sub_1DC75DF44();
      v328(v204, v205, v520);
      v247 = sub_1DC76F3BC();
      v246 = sub_1DC76F5F0();
      v553[1] = (id)2;
      sub_1DC76F4B8();
      v245 = v554;
      v248 = (_BYTE *)sub_1DC76F74C();
      if (os_log_type_enabled(v247, (os_log_type_t)v246))
      {
        v233 = (uint8_t *)sub_1DC76F638();
        v231 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60210);
        v232 = 0;
        v234 = sub_1DC76AF10(0);
        v235 = sub_1DC76AF10(v232);
        v239 = &v550;
        v550 = v233;
        v240 = &v614;
        v614 = v234;
        v237 = &v613;
        v613 = v235;
        v236 = 0;
        sub_1DC76AF68(0, &v550);
        sub_1DC76AF68(v236, v239);
        v549[1] = v248;
        v238 = &v216;
        MEMORY[0x1E0C80A78](&v216);
        v206 = v240;
        v207 = &v216 - 6;
        v241 = &v216 - 6;
        v207[2] = (uint64_t)v239;
        v207[3] = (uint64_t)v206;
        v207[4] = v208;
        v242 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F039AC48);
        sub_1DC76DB78();
        v209 = (uint64_t)v244;
        sub_1DC76F4A0();
        v243 = v209;
        if (v209)
        {
          __break(1u);
        }
        else
        {
          _os_log_impl(&dword_1DC678000, v247, (os_log_type_t)v246, "Performing cleanup of SQL table", v233, v245);
          v229 = 0;
          sub_1DC76AFC0(v234);
          sub_1DC76AFC0(v235);
          sub_1DC76F620();
          swift_bridgeObjectRelease();
          v230 = v243;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        v230 = (uint64_t)v244;
      }
      v224 = v230;

      v312(v523, v520);
      v616 = 0;
      v225 = (id)objc_opt_self();
      swift_bridgeObjectRetain();
      v227 = (id)sub_1DC76F440();
      swift_bridgeObjectRelease();
      v553[0] = v616;
      v228 = objc_msgSend(v225, sel_deleteVectorDBEntryForDBName_error_, v227, v553);
      v226 = v553[0];
      v210 = v553[0];
      v211 = v616;
      v616 = v226;

      if (!v228)
        break;
      v223 = v228;
      v219 = v228;
      v222 = sub_1DC76F3F8();
      v552 = v222;

      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v212 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60190);
      v221 = v615;
      v615[3] = v212;
      v615[0] = v222;
      v220 = v551;
      v551[0] = v470;
      v551[1] = v471;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
      sub_1DC76F434();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v517 + 8))(v519, v516);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v217 = v616;
    v218 = sub_1DC76EF6C();

    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v517 + 8))(v519, v516);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1DC76E370();
    swift_bridgeObjectRelease();
    sub_1DC75A0B4();
    v509 = v218;
  }
  return v507;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC76A990()
{
  swift_bridgeObjectRetain();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC76A9C0()
{
  swift_bridgeObjectRetain();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC76A9F0()
{
  swift_bridgeObjectRetain();
}

id AMDVectorDBManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t AMDVectorDBManager.init()()
{
  uint64_t result;
  uint64_t v1;

  if (!"AppleMediaDiscovery.AMDVectorDBManager")
  {
    sub_1DC76F6C8();
    __break(1u);
  }
  result = sub_1DC76B448((uint64_t)"AppleMediaDiscovery.AMDVectorDBManager", 38, (unint64_t)"init()", 6, 2, (unint64_t)"AppleMediaDiscovery/AMDVectorDB.swift", 37, 2, v1, 0x17uLL, 0x1BuLL);
  __break(1u);
  return result;
}

id sub_1DC76ACF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v11;

  v11 = (void *)sub_1DC76F440();
  if (a4)
  {
    v6 = sub_1DC76F3EC();
    swift_bridgeObjectRelease();
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }
  v5 = objc_msgSend(v9, sel_initWithDomain_code_userInfo_, v11, a3);

  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_1DC76ADD8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EDB60240;
  if (!qword_1EDB60240)
  {
    v0 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEE148], MEMORY[0x1E0DEE0F8]);
    atomic_store(v0, (unint64_t *)&qword_1EDB60240);
    return v0;
  }
  return v2;
}

unint64_t sub_1DC76AE40()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EDB60238;
  if (!qword_1EDB60238)
  {
    v0 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEE120], MEMORY[0x1E0DEE0F8]);
    atomic_store(v0, (unint64_t *)&qword_1EDB60238);
    return v0;
  }
  return v2;
}

unint64_t sub_1DC76AEA8()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EDB60168;
  if (!qword_1EDB60168)
  {
    v0 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEB460], MEMORY[0x1E0DEB418]);
    atomic_store(v0, (unint64_t *)&qword_1EDB60168);
    return v0;
  }
  return v2;
}

uint64_t sub_1DC76AF10(uint64_t a1)
{
  if (a1)
    return sub_1DC76F638();
  else
    return 0;
}

uint64_t sub_1DC76AF68(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1DC76AF7C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1DC76AFC0(uint64_t result)
{
  if (result)
  {
    sub_1DC76F62C();
    return sub_1DC76F620();
  }
  return result;
}

uint64_t sub_1DC76B02C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v4)(void);
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v12 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a3 - 8);
  v8 = (*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4 = (void (*)(void))MEMORY[0x1E0C80A78](a1);
  v11 = (char *)&v7 - v8;
  v4();
  v13 = sub_1DC76F710();
  v14 = v5;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v11, v12);
  return v13;
}

uint64_t sub_1DC76B0D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_1DC76B104(uint64_t (*a1)(uint64_t *, uint64_t), uint64_t a2, unsigned int a3)
{
  uint64_t result;
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;
  uint64_t v8;

  if (a3 < 0x80uLL)
  {
    if (a3 > 0xFF)
      goto LABEL_12;
    v5 = (a3 + 1);
  }
  else
  {
    v7 = (a3 & 0x3F) << 8;
    if (a3 >> 6 < 0x20uLL)
    {
      v5 = (v7 | (a3 >> 6)) + 33217;
    }
    else
    {
      v6 = (v7 | (a3 >> 6) & 0x3F) << 8;
      if (a3 >> 12 < 0x10uLL)
        v5 = (v6 | (a3 >> 12)) + 8487393;
      else
        v5 = ((a3 >> 18) | ((v6 | (a3 >> 12) & 0x3F) << 8)) - 2122219023;
    }
  }
  v4 = 4 - ((uint64_t)__clz(v5) >> 3);
  v8 = (v5 - 0x101010101010101) & ((1 << ((8 * v4) & 0x3F)) - 1);
  if (v4 >= 0)
    return a1(&v8, v4);
  sub_1DC76F6EC();
  __break(1u);
LABEL_12:
  result = sub_1DC76F6C8();
  __break(1u);
  return result;
}

uint64_t sub_1DC76B448@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, unint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, unint64_t a10, unint64_t a11)
{
  unsigned int v11;
  uint64_t result;
  char v13[8];
  uint64_t v14;
  uint64_t (*v15)@<X0>(uint64_t@<X0>, uint64_t@<X1>, uint64_t@<X8>);
  char *v16;
  uint64_t v17[2];
  uint64_t *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;

  v20 = a9;
  v21 = a1;
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a10;
  v29 = a11;
  v30 = "Fatal error";
  v31 = "Unexpectedly found nil while unwrapping an Optional value";
  v32 = "Swift/StaticString.swift";
  v33 = "Not enough bits to represent the passed value";
  v34 = "Swift/Integers.swift";
  v35 = "UnsafeBufferPointer with negative count";
  v36 = "Swift/UnsafeBufferPointer.swift";
  v37 = 0;
  v39 = a6;
  v40 = a7;
  v41 = a8;
  v42 = a1;
  v43 = a2;
  v44 = a10;
  v45 = a11;
  if ((a5 & 1) != 0)
  {
    if (v23 <= 0xFFFFFFFF)
    {
      v19 = v23;
      if ((v23 < 0xD800 || v19 > 0xDFFF) && v19 <= 0x10FFFF)
      {
        v18 = v17;
        MEMORY[0x1E0C80A78](v17);
        v15 = sub_1DC76EE18;
        v16 = &v38;
        sub_1DC76B104((uint64_t (*)(uint64_t *, uint64_t))sub_1DC76EE58, (uint64_t)v13, v11);
        return (uint64_t)v18;
      }
      v13[0] = 2;
      v14 = 148;
      LODWORD(v15) = 0;
      sub_1DC76F6C8();
      __break(1u);
    }
    v13[0] = 2;
    v14 = 3455;
    LODWORD(v15) = 0;
    sub_1DC76F6C8();
    __break(1u);
  }
  if (v23)
    v46 = v23;
  else
    v46 = 0;
  v17[0] = v46;
  if (!v46)
  {
    v13[0] = 2;
    v14 = 136;
    LODWORD(v15) = 0;
    sub_1DC76F6C8();
    __break(1u);
  }
  if (v24 >= 0)
    return sub_1DC76B80C(v17[0], v24, v25, v26, v27, v21, v22, v28, v20, v29);
  result = sub_1DC76F6EC();
  __break(1u);
  return result;
}

uint64_t sub_1DC76B80C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, unint64_t a10)
{
  unsigned int v10;
  uint64_t result;
  char v12[8];
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;

  v20 = a9;
  v21 = a1;
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a10;
  v29 = "Fatal error";
  v30 = "Unexpectedly found nil while unwrapping an Optional value";
  v31 = "Swift/StaticString.swift";
  v32 = "Not enough bits to represent the passed value";
  v33 = "Swift/Integers.swift";
  v34 = "UnsafeBufferPointer with negative count";
  v35 = "Swift/UnsafeBufferPointer.swift";
  v36 = 0;
  v38 = a6;
  v39 = a7;
  v40 = a1;
  v41 = a2;
  v42 = a8;
  v43 = a10;
  if ((a5 & 1) != 0)
  {
    if (v23 <= 0xFFFFFFFF)
    {
      v19 = v23;
      if ((v23 < 0xD800 || v19 > 0xDFFF) && v19 <= 0x10FFFF)
      {
        v18 = &v16;
        MEMORY[0x1E0C80A78](&v16);
        v14 = sub_1DC76EE80;
        v15 = &v37;
        sub_1DC76B104((uint64_t (*)(uint64_t *, uint64_t))sub_1DC76EE9C, (uint64_t)v12, v10);
        return (uint64_t)v18;
      }
      v12[0] = 2;
      v13 = 148;
      LODWORD(v14) = 0;
      sub_1DC76F6C8();
      __break(1u);
    }
    v12[0] = 2;
    v13 = 3455;
    LODWORD(v14) = 0;
    sub_1DC76F6C8();
    __break(1u);
  }
  if (v23)
    v44 = v23;
  else
    v44 = 0;
  v17 = v44;
  if (!v44)
  {
    v12[0] = 2;
    v13 = 136;
    LODWORD(v14) = 0;
    sub_1DC76F6C8();
    __break(1u);
  }
  if (v24 >= 0)
    return sub_1DC76BBA0(v17, v24, v25, v26, v21, v22, v27, v28);
  result = sub_1DC76F6EC();
  __break(1u);
  return result;
}

uint64_t sub_1DC76BBA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, unint64_t a8)
{
  uint64_t result;

  if (!a3)
  {
    sub_1DC76F6C8();
    __break(1u);
  }
  if (a4 >= (uint64_t)0xFFFFFFFF80000000)
  {
    if (a4 <= 0x7FFFFFFF)
    {
      if (!a5)
      {
        sub_1DC76F6C8();
        __break(1u);
      }
      if (a6 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a6 <= 0x7FFFFFFF)
        {
          if (!a1)
          {
            sub_1DC76F6C8();
            __break(1u);
          }
          if (a2 >= (uint64_t)0xFFFFFFFF80000000)
          {
            if (a2 <= 0x7FFFFFFF)
            {
              if (a7 <= 0xFFFFFFFF)
              {
                if (a8 <= 0xFFFFFFFF)
                  return _swift_stdlib_reportUnimplementedInitializerInFile();
                sub_1DC76F6C8();
                __break(1u);
              }
              sub_1DC76F6C8();
              __break(1u);
            }
            sub_1DC76F6C8();
            __break(1u);
          }
          sub_1DC76F6C8();
          __break(1u);
        }
        sub_1DC76F6C8();
        __break(1u);
      }
      sub_1DC76F6C8();
      __break(1u);
    }
    sub_1DC76F6C8();
    __break(1u);
  }
  result = sub_1DC76F6C8();
  __break(1u);
  return result;
}

uint64_t sub_1DC76C0E8(uint64_t (*a1)(void))
{
  return a1();
}

_QWORD *sub_1DC76C108(_QWORD *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  uint64_t v8;

  v4 = a4();
  sub_1DC76C184(v4, v5, a3);
  v8 = *a1;
  sub_1DC76F644();
  swift_bridgeObjectRelease();
  result = a1;
  *a1 = v8 + 8;
  return result;
}

uint64_t sub_1DC76C184(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  __int16 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[4];
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  v14 = sub_1DC76C2F4((uint64_t)&v17, 0, 0, 1, a1, a2);
  v15 = v3;
  v16 = v4;
  v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    v6 = *a3;
    if (*a3)
    {
      sub_1DC75C30C((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  }
  else
  {
    v13[3] = MEMORY[0x1E0DEC2B8];
    v13[0] = a1;
    v13[1] = a2;
    v7 = *a3;
    if (*a3)
    {
      sub_1DC75C30C((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  return v11;
}

uint64_t sub_1DC76C2F4(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char v13;
  char v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  _QWORD v21[4];
  char v22;
  char v23;
  uint64_t v24;

  v17 = (_QWORD *)result;
  v24 = a6;
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3)
          __break(1u);
        v16 = a3 - (_QWORD)a2;
      }
      else
      {
        v16 = 0;
      }
      v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v21[0] = a5;
          v21[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_1DC76C668(v21, v15, a2);
          sub_1DC76F650();
          *v17 = a2;
          v11 = 0;
          v12 = v15;
          v13 = 1;
          v14 = 0;
LABEL_26:
          v21[2] = v11;
          v21[3] = v12;
          v22 = v13 & 1;
          v23 = v14 & 1;
          return (uint64_t)v11;
        }
        goto LABEL_28;
      }
    }
LABEL_13:
    v6 = sub_1DC76C6A4(a5, a6);
    *v17 = v7;
    v11 = v6;
    v12 = v8;
    v13 = 0;
    v14 = 1;
    goto LABEL_26;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0)
    {
      v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }
    __break(1u);
  }
  result = sub_1DC76F680();
  if (!result)
    goto LABEL_29;
  v10 = result;
LABEL_21:
  *v17 = v10;
  if (a6 < 0)
  {
    v9 = 0;
LABEL_25:
    v11 = (_QWORD *)v9;
    v12 = a5 & 0xFFFFFFFFFFFFLL;
    v13 = 0;
    v14 = 0;
    goto LABEL_26;
  }
  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_1DC76C668(const void *a1, size_t a2, void *__dst)
{
  memcpy(__dst, a1, a2);
  return __dst;
}

_QWORD *sub_1DC76C6A4(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v6 = sub_1DC76C754(a1, a2);
  sub_1DC76C8CC();
  v4 = v6[2];
  sub_1DC76C940(v4);
  sub_1DC76C9C0(v4, 0);
  sub_1DC76CA2C();
  swift_retain();
  v5 = sub_1DC76CA38((uint64_t)v6);
  swift_bridgeObjectRelease();
  result = (_QWORD *)v5;
  if (!__OFSUB__(v5, 1))
    return v6;
  __break(1u);
  return result;
}

_QWORD *sub_1DC76C754(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  char v3;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[3];

  v8[2] = a2;
  if ((a2 & 0x1000000000000000) != 0)
  {
    v7 = sub_1DC76F488();
  }
  else if ((a2 & 0x2000000000000000) != 0)
  {
    v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }
  else
  {
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v7)
    return (_QWORD *)sub_1DC76CBB4();
  v5 = sub_1DC76CA4C(v7, 0);
  swift_retain();
  swift_release();
  result = (_QWORD *)sub_1DC76F674();
  v6 = result;
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    result = v8;
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    sub_1DC76EF20();
    if (v6 == (_QWORD *)v7)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DC76C8CC()
{
  uint64_t *v0;
  uint64_t result;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v0;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v0 = v4;
  if ((result & 1) == 0)
  {
    v2 = sub_1DC76CA38(*v3);
    result = sub_1DC76CBE0(0, v2 + 1, 1, *v3);
    *v3 = result;
  }
  return result;
}

uint64_t sub_1DC76C940(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 < result + 1)
  {
    result = sub_1DC76CBE0(*(_QWORD *)(*(_QWORD *)v1 + 24) >> 1 != 0, result + 1, 1, *v2);
    *v2 = result;
  }
  return result;
}

uint64_t sub_1DC76C9C0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + 1;
  v4 = *v2;
  swift_bridgeObjectRetain();
  *(_QWORD *)(v4 + 16) = v5;
  swift_release();
  v6 = *v2;
  swift_retain();
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release();
}

void sub_1DC76CA2C()
{
  _QWORD *v0;

  *v0 = *v0;
}

uint64_t sub_1DC76CA38(uint64_t a1)
{
  return sub_1DC76CEDC(a1);
}

_QWORD *sub_1DC76CA4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  size_t v4;
  _QWORD *v6;
  uint64_t v7;

  if (a2 < a1)
    v7 = a1;
  else
    v7 = a2;
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F039AC80);
    v6 = (_QWORD *)swift_allocObject();
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v4 = (size_t)v6 + _swift_stdlib_malloc_size(v6);
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * (v4 - (_QWORD)(v6 + 4));
    }
    else
    {
      swift_retain();
      v6[2] = a1;
      v6[3] = 2 * v7;
    }
    swift_release();
    return v6;
  }
  else
  {
    v3 = MEMORY[0x1E0DEE9D8];
    swift_retain();
    return (_QWORD *)v3;
  }
}

uint64_t sub_1DC76CBB4()
{
  uint64_t v1;

  v1 = MEMORY[0x1E0DEE9D8];
  swift_retain();
  return v1;
}

uint64_t sub_1DC76CBE0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t result;
  char *v5;
  size_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v16;

  swift_retain();
  result = swift_retain();
  v16 = *(_QWORD *)(a4 + 24) >> 1;
  if ((a3 & 1) != 0)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }
      if (2 * v16 < a2)
        v11 = a2;
      else
        v11 = 2 * v16;
    }
    else
    {
      v11 = *(_QWORD *)(a4 + 24) >> 1;
    }
  }
  else
  {
    v11 = a2;
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v11 < v10)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v11;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F039AC80);
    v8 = (_QWORD *)swift_allocObject();
    if ((_swift_stdlib_has_malloc_size() & 1) != 0)
    {
      v6 = (size_t)v8 + _swift_stdlib_malloc_size(v8);
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * (v6 - (_QWORD)(v8 + 4));
    }
    else
    {
      swift_retain();
      v8[2] = v10;
      v8[3] = 2 * v9;
    }
    swift_release();
    v7 = (char *)v8;
  }
  else
  {
    v5 = (char *)MEMORY[0x1E0DEE9D8];
    swift_retain();
    v7 = v5;
  }
  if ((a1 & 1) != 0)
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_1DC76CF18((char *)(a4 + 32), v10, v7 + 32);
    *(_QWORD *)(a4 + 16) = 0;
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_retain();
    swift_release();
    sub_1DC76CEE4((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease();
  }
  return (uint64_t)v7;
}

uint64_t sub_1DC76CEDC(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

void *sub_1DC76CEE4(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_1DC76CF18(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result)
    return (char *)memmove(a3, result, a2);
  return result;
}

_BYTE **sub_1DC76CFC8(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_1DC76CFDC()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76D004(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76D00C()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76D034(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76D03C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76D078()
{
  uint64_t v0;

  return sub_1DC76C0E8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1DC76D084()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_1DC76D0C0(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1DC76C108(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t type metadata accessor for AMDVectorDBManager()
{
  return objc_opt_self();
}

uint64_t sub_1DC76D0F0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DC76D12C()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  sub_1DC760A84();
  return result;
}

uint64_t sub_1DC76D138()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76D160(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76D168()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76D190(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76D198()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76D1D4()
{
  uint64_t v0;

  return sub_1DC76C0E8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1DC76D1E0()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_1DC76D21C(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1DC76C108(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_1DC76D228()
{
  unint64_t ObjCClassMetadata;
  uint64_t v2;

  v2 = qword_1F039ABD8;
  if (!qword_1F039ABD8)
  {
    objc_opt_self();
    ObjCClassMetadata = swift_getObjCClassMetadata();
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_1F039ABD8);
    return ObjCClassMetadata;
  }
  return v2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC76D28C()
{
  swift_bridgeObjectRelease();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC76D2B4()
{
  sub_1DC76D2F0();
}

uint64_t sub_1DC76D2F0()
{
  return swift_release();
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC76D330()
{
  swift_bridgeObjectRelease();
}

uint64_t sub_1DC76D358()
{
  return swift_deallocObject();
}

uint64_t sub_1DC76D380()
{
  uint64_t v0;

  return nullsub_1(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1DC76D388()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76D3B0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76D3B8()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76D3E0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76D3E8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[16];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v15 = a1;
  v18 = a6;
  v13[1] = a7;
  v22 = a6;
  v16 = *(_QWORD *)(a6 - 8);
  v13[0] = (*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = MEMORY[0x1E0C80A78](a1);
  v17 = (uint64_t)v13 - v13[0];
  v8(v7);
  v14 = sub_1DC76F6A4() >> 3;
  v20 = *v15;
  v21 = v20 + v14;
  sub_1DC76D528(v17, sub_1DC76EEC4, (uint64_t)v19, v18, MEMORY[0x1E0DEDCE8], MEMORY[0x1E0DEE9C0] + 8, MEMORY[0x1E0DEDD18], v13[2]);
  v9 = v16;
  v10 = v17;
  v11 = v18;
  *v15 += v14;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
}

uint64_t sub_1DC76D504()
{
  return sub_1DC76F644();
}

uint64_t sub_1DC76D528(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t (*v17)(void);
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v17 = a2;
  v13 = a5;
  v14 = a8;
  v23 = a4;
  v22 = a5;
  v21 = a6;
  v15 = *(_QWORD *)(a5 - 8);
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v9 = MEMORY[0x1E0C80A78]();
  v18 = (char *)&v12 - v16;
  v20 = v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64);
  result = v17();
  v19 = v8;
  if (v8)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v14, v18, v13);
  return result;
}

uint64_t sub_1DC76D60C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1DC76D640()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76D67C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1DC76D60C(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_1DC76D688()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76D6C4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = sub_1DC75DB80();
  return sub_1DC76D3E8(a1, a2, a3, v8, v9, MEMORY[0x1E0DEDC60], v4);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC76D724()
{
  swift_bridgeObjectRelease();
}

unint64_t sub_1DC76D74C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1F039AC10;
  if (!qword_1F039AC10)
  {
    v0 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEB470], MEMORY[0x1E0DEB418]);
    atomic_store(v0, (unint64_t *)&qword_1F039AC10);
    return v0;
  }
  return v2;
}

unint64_t sub_1DC76D7B4()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1F039AC18;
  if (!qword_1F039AC18)
  {
    v0 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEB440], MEMORY[0x1E0DEB418]);
    atomic_store(v0, (unint64_t *)&qword_1F039AC18);
    return v0;
  }
  return v2;
}

unint64_t sub_1DC76D81C()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1F039AC20;
  if (!qword_1F039AC20)
  {
    v0 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEDCA0], MEMORY[0x1E0DEDC60]);
    atomic_store(v0, (unint64_t *)&qword_1F039AC20);
    return v0;
  }
  return v2;
}

uint64_t sub_1DC76D884(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (((a2 >> 62) & 3) == 1)
    return swift_release();
  if (((a2 >> 62) & 3) == 2)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1DC76D90C()
{
  return swift_deallocObject();
}

uint64_t sub_1DC76D934()
{
  uint64_t v0;

  return nullsub_2(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1DC76D93C()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76D964(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76D96C()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76D994(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76D99C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1DC76D9D0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76DA0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1DC76D99C(*(uint64_t (**)(void))(v1 + 16), a1);
}

uint64_t sub_1DC76DA18()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76DA54(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v3 + 16);
  v9 = *(_QWORD *)(v3 + 24);
  v4 = sub_1DC76D74C();
  return sub_1DC76D3E8(a1, a2, a3, v8, v9, MEMORY[0x1E0DEB418], v4);
}

unint64_t sub_1DC76DAB4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1F039AC30;
  if (!qword_1F039AC30)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F039AC28);
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEAF50], v0);
    atomic_store(v1, (unint64_t *)&qword_1F039AC30);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC76DB24()
{
  swift_bridgeObjectRelease();
}

uint64_t sub_1DC76DB4C(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return sub_1DC76AF7C(a1, v1[2], v1[3], v1[4]);
}

unint64_t sub_1DC76DB78()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1F039AC50;
  if (!qword_1F039AC50)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F039AC48);
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEAF38], v0);
    atomic_store(v1, (unint64_t *)&qword_1F039AC50);
    return v1;
  }
  return v3;
}

uint64_t sub_1DC76DBE8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return sub_1DC76AF7C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1DC76DC14()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(sub_1DC76EFB4() - 8);
  (*(void (**)(unint64_t))(v1 + 8))(v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80)));
  return swift_deallocObject();
}

uint64_t sub_1DC76DC84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(sub_1DC76EFB4() - 8) + 80);
  return sub_1DC7640B8(v1 + ((v2 + 16) & ~v2), a1);
}

uint64_t sub_1DC76DCC4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76DD00()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = sub_1DC76EFB4();
  v1 = sub_1DC76DD48();
  return sub_1DC76B02C(v5, v3, v4, v1);
}

unint64_t sub_1DC76DD48()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EDB600E8;
  if (!qword_1EDB600E8)
  {
    v0 = sub_1DC76EFB4();
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0CB0048], v0);
    atomic_store(v1, (unint64_t *)&qword_1EDB600E8);
    return v1;
  }
  return v3;
}

uint64_t sub_1DC76DDB8()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76DDE0(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76DDE8()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76DE10(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76DE18()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76DE54()
{
  uint64_t v0;

  return sub_1DC76C0E8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1DC76DE60()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_1DC76DE9C(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1DC76C108(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_1DC76DEA8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DC76DEE4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1DC765AB8(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_1DC76DEEC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76DF28()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60188);
  v1 = sub_1DC76DF74();
  return sub_1DC76B02C(v5, v3, v4, v1);
}

unint64_t sub_1DC76DF74()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1F039AC58;
  if (!qword_1F039AC58)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDB60188);
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEA0E8], v0);
    atomic_store(v1, (unint64_t *)&qword_1F039AC58);
    return v1;
  }
  return v3;
}

uint64_t sub_1DC76DFE4()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76E00C(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76E014()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76E03C(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76E044()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76E080()
{
  uint64_t v0;

  return sub_1DC76C0E8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1DC76E08C()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_1DC76E0C8(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1DC76C108(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_1DC76E0D4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DC76E110@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1DC765AE8(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_1DC76E118()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76E154()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDB60190);
  v1 = sub_1DC76E1A0();
  return sub_1DC76B02C(v5, v3, v4, v1);
}

unint64_t sub_1DC76E1A0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1F039AC60;
  if (!qword_1F039AC60)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDB60190);
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEA0E8], v0);
    atomic_store(v1, (unint64_t *)&qword_1F039AC60);
    return v1;
  }
  return v3;
}

uint64_t sub_1DC76E210()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76E238(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76E240()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76E268(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76E270()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76E2AC()
{
  uint64_t v0;

  return sub_1DC76C0E8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1DC76E2B8()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_1DC76E2F4(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1DC76C108(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_1DC76E300()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  v3 = qword_1EDB601C0;
  if (!qword_1EDB601C0)
  {
    v0 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDB601B8);
    v1 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEAF50], v0);
    atomic_store(v1, (unint64_t *)&qword_1EDB601C0);
    return v1;
  }
  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC76E370()
{
  swift_bridgeObjectRelease();
}

uint64_t sub_1DC76E398()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DC76E3D4()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  sub_1DC76A9C0();
  return result;
}

uint64_t sub_1DC76E3E0()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76E408(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76E410()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76E438(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76E440()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76E47C()
{
  uint64_t v0;

  return sub_1DC76C0E8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1DC76E488()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_1DC76E4C4(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1DC76C108(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_1DC76E4D0()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EDB60230;
  if (!qword_1EDB60230)
  {
    v0 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEDC10], MEMORY[0x1E0DEDBC8]);
    atomic_store(v0, (unint64_t *)&qword_1EDB60230);
    return v0;
  }
  return v2;
}

unint64_t sub_1DC76E538()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1EDB60228;
  if (!qword_1EDB60228)
  {
    v0 = MEMORY[0x1DF0CD700](MEMORY[0x1E0DEDBF0], MEMORY[0x1E0DEDBC8]);
    atomic_store(v0, (unint64_t *)&qword_1EDB60228);
    return v0;
  }
  return v2;
}

uint64_t sub_1DC76E5A0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DC76E5DC()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  sub_1DC76A9F0();
  return result;
}

uint64_t sub_1DC76E5E8()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76E610(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76E618()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76E640(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76E648()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76E684()
{
  uint64_t v0;

  return sub_1DC76C0E8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1DC76E690()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_1DC76E6CC(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1DC76C108(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_1DC76E6D8(uint64_t (**a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;

  return sub_1DC76AF7C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1DC76E704()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DC76E740()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  sub_1DC76A990();
  return result;
}

uint64_t sub_1DC76E74C()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76E774(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76E77C()
{
  return swift_deallocObject();
}

_BYTE **sub_1DC76E7A4(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1DC76CFC8(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1DC76E7AC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DC76E7E8()
{
  uint64_t v0;

  return sub_1DC76C0E8(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1DC76E7F4()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *sub_1DC76E830(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1DC76C108(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

unint64_t sub_1DC76E83C()
{
  return sub_1DC76E850();
}

unint64_t sub_1DC76E850()
{
  unint64_t v0;
  uint64_t v2;

  v2 = qword_1F039AC78;
  if (!qword_1F039AC78)
  {
    v0 = MEMORY[0x1DF0CD700](&unk_1DC773FF0, &unk_1EA4B69E0);
    atomic_store(v0, (unint64_t *)&qword_1F039AC78);
    return v0;
  }
  return v2;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_1DC76E8CC(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v5;
  int v6;
  unsigned int v7;
  int v8;

  if (a2)
  {
    if (a2 <= 0xFC)
      goto LABEL_15;
    v7 = ((a2 + 3) >> 8) + 1;
    v8 = 1;
    if (v7 >= 0x100)
    {
      if (v7 >= 0x10000)
        v2 = 4;
      else
        v2 = 2;
      v8 = v2;
    }
    if (v8 == 1)
      v6 = a1[1];
    else
      v6 = v8 == 2 ? *(unsigned __int16 *)(a1 + 1) : *(_DWORD *)(a1 + 1);
    if (v6)
    {
      v5 = (*a1 | ((v6 - 1) << 8)) + 252;
    }
    else
    {
LABEL_15:
      v3 = *a1 - 4;
      if (v3 < 0)
        v3 = -1;
      v5 = v3;
    }
  }
  else
  {
    v5 = -1;
  }
  return (v5 + 1);
}

_BYTE *sub_1DC76EA7C(_BYTE *result, unsigned int a2, unsigned int a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  v7 = 0;
  if (a3 > 0xFC)
  {
    v5 = ((a3 + 3) >> 8) + 1;
    v6 = 1;
    if (v5 >= 0x100)
    {
      if (v5 >= 0x10000)
        v3 = 4;
      else
        v3 = 2;
      v6 = v3;
    }
    v7 = v6;
  }
  if (a2 > 0xFC)
  {
    v4 = ((a2 - 253) >> 8) + 1;
    *result = a2 + 3;
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = v4;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = v4;
      }
      else
      {
        *(_DWORD *)(result + 1) = v4;
      }
    }
  }
  else
  {
    if (v7)
    {
      if (v7 == 1)
      {
        result[1] = 0;
      }
      else if (v7 == 2)
      {
        *(_WORD *)(result + 1) = 0;
      }
      else
      {
        *(_DWORD *)(result + 1) = 0;
      }
    }
    if (a2)
      *result = a2 + 3;
  }
  return result;
}

uint64_t sub_1DC76ECC0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1DC76ECCC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void *type metadata accessor for VectorDBError()
{
  return &unk_1EA4B69E0;
}

uint64_t method lookup function for AMDVectorDBManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AMDVectorDBManager.__allocating_init(vectorDBConfig:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of AMDVectorDBManager.insertVectors(vectorDict:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E0DEEDD8]) + 0x60))();
}

uint64_t dispatch thunk of AMDVectorDBManager.searchVectorDB(queryDict:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E0DEEDD8]) + 0x68))();
}

uint64_t dispatch thunk of AMDVectorDBManager.deleteVectors(identifiers:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*v0 & *MEMORY[0x1E0DEEDD8]) + 0x70))();
}

uint64_t dispatch thunk of static AMDVectorDBManager.deleteVectorDatabase(deletionPayload:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of static AMDVectorDBManager.insertVectorsHandler(insertVectorsPayload:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of static AMDVectorDBManager.clearVectorsHandler(clearVectorDBPayload:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of static AMDVectorDBManager.runVectorDBSearch(searchPayload:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of static AMDVectorDBManager.createVectorDB(createDBPayload:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t sub_1DC76EE18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_1DC76B80C(a1, a2, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_BYTE *)(v3 + 32), *(_QWORD *)(v3 + 40), *(_QWORD *)(v3 + 48), *(_QWORD *)(v3 + 56), a3, *(_QWORD *)(v3 + 64));
}

uint64_t sub_1DC76EE58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1DC76B0D4(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_1DC76EE80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1DC76BBA0(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

uint64_t sub_1DC76EE9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1DC76B0D4(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_1DC76EEC4()
{
  return sub_1DC76D504();
}

uint64_t _swift_stdlib_has_malloc_size()
{
  return 1;
}

size_t _swift_stdlib_malloc_size(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1DC76EF20()
{
  swift_bridgeObjectRelease();
}

uint64_t sub_1DC76EF48()
{
  return MEMORY[0x1E0CAEA48]();
}

uint64_t sub_1DC76EF54()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1DC76EF60()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1DC76EF6C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1DC76EF78()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1DC76EF84()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1DC76EF90()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1DC76EF9C()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1DC76EFA8()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_1DC76EFB4()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1DC76EFC0()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1DC76EFCC()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1DC76EFD8()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_1DC76EFE4()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1DC76EFF0()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1DC76EFFC()
{
  return MEMORY[0x1E0D90868]();
}

uint64_t sub_1DC76F008()
{
  return MEMORY[0x1E0D90B18]();
}

uint64_t sub_1DC76F014()
{
  return MEMORY[0x1E0D90B50]();
}

uint64_t sub_1DC76F020()
{
  return MEMORY[0x1E0D90D38]();
}

uint64_t sub_1DC76F02C()
{
  return MEMORY[0x1E0D90D68]();
}

uint64_t sub_1DC76F038()
{
  return MEMORY[0x1E0D915C8]();
}

uint64_t sub_1DC76F044()
{
  return MEMORY[0x1E0D91FF0]();
}

uint64_t sub_1DC76F050()
{
  return MEMORY[0x1E0D92038]();
}

uint64_t sub_1DC76F05C()
{
  return MEMORY[0x1E0D929B0]();
}

uint64_t sub_1DC76F068()
{
  return MEMORY[0x1E0D929D0]();
}

uint64_t sub_1DC76F074()
{
  return MEMORY[0x1E0D933A8]();
}

uint64_t sub_1DC76F080()
{
  return MEMORY[0x1E0D933B0]();
}

uint64_t sub_1DC76F08C()
{
  return MEMORY[0x1E0D933B8]();
}

uint64_t sub_1DC76F098()
{
  return MEMORY[0x1E0D933D0]();
}

uint64_t sub_1DC76F0A4()
{
  return MEMORY[0x1E0D93E48]();
}

uint64_t sub_1DC76F0B0()
{
  return MEMORY[0x1E0D93E50]();
}

uint64_t sub_1DC76F0BC()
{
  return MEMORY[0x1E0D93E60]();
}

uint64_t sub_1DC76F0C8()
{
  return MEMORY[0x1E0D93E68]();
}

uint64_t sub_1DC76F0D4()
{
  return MEMORY[0x1E0D93E70]();
}

uint64_t sub_1DC76F0E0()
{
  return MEMORY[0x1E0D93E78]();
}

uint64_t sub_1DC76F0EC()
{
  return MEMORY[0x1E0D93E80]();
}

uint64_t sub_1DC76F0F8()
{
  return MEMORY[0x1E0D93E88]();
}

uint64_t sub_1DC76F104()
{
  return MEMORY[0x1E0D93E90]();
}

uint64_t sub_1DC76F110()
{
  return MEMORY[0x1E0D93E98]();
}

uint64_t sub_1DC76F11C()
{
  return MEMORY[0x1E0D93EB8]();
}

uint64_t sub_1DC76F128()
{
  return MEMORY[0x1E0D93ED8]();
}

uint64_t sub_1DC76F134()
{
  return MEMORY[0x1E0D93EE0]();
}

uint64_t sub_1DC76F140()
{
  return MEMORY[0x1E0D93EE8]();
}

uint64_t sub_1DC76F14C()
{
  return MEMORY[0x1E0D93EF0]();
}

uint64_t sub_1DC76F158()
{
  return MEMORY[0x1E0D93EF8]();
}

uint64_t sub_1DC76F164()
{
  return MEMORY[0x1E0D93F00]();
}

uint64_t sub_1DC76F170()
{
  return MEMORY[0x1E0D93F10]();
}

uint64_t sub_1DC76F17C()
{
  return MEMORY[0x1E0D93F18]();
}

uint64_t sub_1DC76F188()
{
  return MEMORY[0x1E0D93F20]();
}

uint64_t sub_1DC76F194()
{
  return MEMORY[0x1E0D93F28]();
}

uint64_t sub_1DC76F1A0()
{
  return MEMORY[0x1E0D93F30]();
}

uint64_t sub_1DC76F1AC()
{
  return MEMORY[0x1E0D93F38]();
}

uint64_t sub_1DC76F1B8()
{
  return MEMORY[0x1E0D93F40]();
}

uint64_t sub_1DC76F1C4()
{
  return MEMORY[0x1E0D93F48]();
}

uint64_t sub_1DC76F1D0()
{
  return MEMORY[0x1E0D93F50]();
}

uint64_t sub_1DC76F1DC()
{
  return MEMORY[0x1E0D93F58]();
}

uint64_t sub_1DC76F1E8()
{
  return MEMORY[0x1E0D93F80]();
}

uint64_t sub_1DC76F1F4()
{
  return MEMORY[0x1E0D94360]();
}

uint64_t sub_1DC76F200()
{
  return MEMORY[0x1E0D94380]();
}

uint64_t sub_1DC76F20C()
{
  return MEMORY[0x1E0D95550]();
}

uint64_t sub_1DC76F218()
{
  return MEMORY[0x1E0D8D8C8]();
}

uint64_t sub_1DC76F224()
{
  return MEMORY[0x1E0DC6648]();
}

uint64_t sub_1DC76F230()
{
  return MEMORY[0x1E0DC6650]();
}

uint64_t sub_1DC76F23C()
{
  return MEMORY[0x1E0DC6660]();
}

uint64_t sub_1DC76F248()
{
  return MEMORY[0x1E0DC6668]();
}

uint64_t sub_1DC76F254()
{
  return MEMORY[0x1E0DC6670]();
}

uint64_t sub_1DC76F260()
{
  return MEMORY[0x1E0DC6690]();
}

uint64_t sub_1DC76F26C()
{
  return MEMORY[0x1E0DC6698]();
}

uint64_t sub_1DC76F278()
{
  return MEMORY[0x1E0DC66A0]();
}

uint64_t sub_1DC76F284()
{
  return MEMORY[0x1E0DC66A8]();
}

uint64_t sub_1DC76F290()
{
  return MEMORY[0x1E0DC66B8]();
}

uint64_t sub_1DC76F29C()
{
  return MEMORY[0x1E0DC66D0]();
}

uint64_t sub_1DC76F2A8()
{
  return MEMORY[0x1E0DC66E0]();
}

uint64_t sub_1DC76F2B4()
{
  return MEMORY[0x1E0DC6708]();
}

uint64_t sub_1DC76F2C0()
{
  return MEMORY[0x1E0DC6720]();
}

uint64_t sub_1DC76F2CC()
{
  return MEMORY[0x1E0DC6728]();
}

uint64_t sub_1DC76F2D8()
{
  return MEMORY[0x1E0DC6740]();
}

uint64_t sub_1DC76F2E4()
{
  return MEMORY[0x1E0DC6758]();
}

uint64_t sub_1DC76F2F0()
{
  return MEMORY[0x1E0DC6798]();
}

uint64_t sub_1DC76F2FC()
{
  return MEMORY[0x1E0DC6830]();
}

uint64_t sub_1DC76F308()
{
  return MEMORY[0x1E0DC6838]();
}

uint64_t sub_1DC76F314()
{
  return MEMORY[0x1E0D8DA18]();
}

uint64_t sub_1DC76F320()
{
  return MEMORY[0x1E0D8DA20]();
}

uint64_t sub_1DC76F32C()
{
  return MEMORY[0x1E0D8DA28]();
}

uint64_t sub_1DC76F338()
{
  return MEMORY[0x1E0D8DA30]();
}

uint64_t sub_1DC76F344()
{
  return MEMORY[0x1E0D8DA38]();
}

uint64_t sub_1DC76F350()
{
  return MEMORY[0x1E0D8DA48]();
}

uint64_t sub_1DC76F35C()
{
  return MEMORY[0x1E0D8DA50]();
}

uint64_t sub_1DC76F368()
{
  return MEMORY[0x1E0D8DA60]();
}

uint64_t sub_1DC76F374()
{
  return MEMORY[0x1E0D8EF40]();
}

uint64_t sub_1DC76F380()
{
  return MEMORY[0x1E0D8EF48]();
}

uint64_t sub_1DC76F38C()
{
  return MEMORY[0x1E0D8EF58]();
}

uint64_t sub_1DC76F398()
{
  return MEMORY[0x1E0D8F7E0]();
}

uint64_t sub_1DC76F3A4()
{
  return MEMORY[0x1E0D8F800]();
}

uint64_t sub_1DC76F3B0()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1DC76F3BC()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1DC76F3C8()
{
  return MEMORY[0x1E0DF2250]();
}

uint64_t sub_1DC76F3D4()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1DC76F3E0()
{
  return MEMORY[0x1E0DE9D80]();
}

uint64_t sub_1DC76F3EC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1DC76F3F8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1DC76F404()
{
  return MEMORY[0x1E0DE9E50]();
}

uint64_t sub_1DC76F410()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1DC76F41C()
{
  return MEMORY[0x1E0DE9FD8]();
}

uint64_t sub_1DC76F428()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1DC76F434()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1DC76F440()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DC76F44C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DC76F458()
{
  return MEMORY[0x1E0DEA708]();
}

uint64_t sub_1DC76F464()
{
  return MEMORY[0x1E0DEA718]();
}

uint64_t sub_1DC76F470()
{
  return MEMORY[0x1E0DEA730]();
}

uint64_t sub_1DC76F47C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DC76F488()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1DC76F494()
{
  return MEMORY[0x1E0DEAA48]();
}

uint64_t sub_1DC76F4A0()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t sub_1DC76F4AC()
{
  return MEMORY[0x1E0DEABA0]();
}

uint64_t sub_1DC76F4B8()
{
  return MEMORY[0x1E0DEABC0]();
}

uint64_t sub_1DC76F4C4()
{
  return MEMORY[0x1E0DEAD00]();
}

uint64_t sub_1DC76F4D0()
{
  return MEMORY[0x1E0DEAD08]();
}

uint64_t sub_1DC76F4DC()
{
  return MEMORY[0x1E0DEAD10]();
}

uint64_t sub_1DC76F4E8()
{
  return MEMORY[0x1E0DEAD90]();
}

uint64_t sub_1DC76F4F4()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1DC76F500()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1DC76F50C()
{
  return MEMORY[0x1E0DC6848]();
}

uint64_t sub_1DC76F518()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1DC76F524()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1DC76F530()
{
  return MEMORY[0x1E0DEFFC8]();
}

uint64_t sub_1DC76F53C()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1DC76F548()
{
  return MEMORY[0x1E0DEFFD8]();
}

uint64_t sub_1DC76F554()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1DC76F560()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1DC76F56C()
{
  return MEMORY[0x1E0DF0010]();
}

uint64_t sub_1DC76F578()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1DC76F584()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1DC76F590()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1DC76F59C()
{
  return MEMORY[0x1E0D96890]();
}

uint64_t sub_1DC76F5A8()
{
  return MEMORY[0x1E0DEAFF8]();
}

uint64_t sub_1DC76F5B4()
{
  return MEMORY[0x1E0DEB028]();
}

uint64_t sub_1DC76F5C0()
{
  return MEMORY[0x1E0DEB250]();
}

uint64_t sub_1DC76F5CC()
{
  return MEMORY[0x1E0DEB308]();
}

uint64_t sub_1DC76F5D8()
{
  return MEMORY[0x1E0DEB3B0]();
}

uint64_t sub_1DC76F5E4()
{
  return MEMORY[0x1E0DEB6B8]();
}

uint64_t sub_1DC76F5F0()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1DC76F5FC()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1DC76F608()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1DC76F614()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1DC76F620()
{
  return MEMORY[0x1E0DEB8C8]();
}

uint64_t sub_1DC76F62C()
{
  return MEMORY[0x1E0DEB8E8]();
}

uint64_t sub_1DC76F638()
{
  return MEMORY[0x1E0DEB908]();
}

uint64_t sub_1DC76F644()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1DC76F650()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1DC76F65C()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1DC76F668()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1DC76F674()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1DC76F680()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1DC76F68C()
{
  return MEMORY[0x1E0DEC8D8]();
}

uint64_t sub_1DC76F698()
{
  return MEMORY[0x1E0DEC8F0]();
}

uint64_t sub_1DC76F6A4()
{
  return MEMORY[0x1E0DEC9F0]();
}

uint64_t sub_1DC76F6B0()
{
  return MEMORY[0x1E0DECA90]();
}

uint64_t sub_1DC76F6BC()
{
  return MEMORY[0x1E0DECA98]();
}

uint64_t sub_1DC76F6C8()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1DC76F6D4()
{
  return MEMORY[0x1E0DECBF0]();
}

uint64_t sub_1DC76F6E0()
{
  return MEMORY[0x1E0DECC00]();
}

uint64_t sub_1DC76F6EC()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1DC76F6F8()
{
  return MEMORY[0x1E0DECDB0]();
}

uint64_t sub_1DC76F704()
{
  return MEMORY[0x1E0DECF20]();
}

uint64_t sub_1DC76F710()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1DC76F71C()
{
  return MEMORY[0x1E0DED510]();
}

uint64_t sub_1DC76F728()
{
  return MEMORY[0x1E0DED558]();
}

uint64_t sub_1DC76F734()
{
  return MEMORY[0x1E0DED560]();
}

uint64_t sub_1DC76F740()
{
  return MEMORY[0x1E0DED568]();
}

uint64_t sub_1DC76F74C()
{
  return MEMORY[0x1E0DED5E8]();
}

uint64_t sub_1DC76F758()
{
  return MEMORY[0x1E0DED788]();
}

uint64_t sub_1DC76F764()
{
  return MEMORY[0x1E0DED988]();
}

uint64_t sub_1DC76F770()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DC76F77C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1DC76F788()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1E0D034A8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1E0D034B8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1E0D034C0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

SparseMatrix_Float *__cdecl _SparseConvertFromCoordinate_Float(SparseMatrix_Float *__return_ptr retstr, int m, int n, uint64_t nBlock, uint8_t blockSize, SparseAttributes_t attributes, const int *row, const int *col, const float *val, char *storage, int *workspace)
{
  return (SparseMatrix_Float *)MEMORY[0x1E0C8BA68](retstr, *(_QWORD *)&m, *(_QWORD *)&n, nBlock, blockSize, *(_QWORD *)&attributes, row, col, val);
}

void _SparseSpMV_Float(float alpha, SparseMatrix_Float *A, DenseMatrix_Float *x, BOOL accumulate, DenseMatrix_Float *y)
{
  MEMORY[0x1E0C8BAA0](A, x, accumulate, y, alpha);
}

void _SparseTrap(void)
{
  MEMORY[0x1E0C8BAB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __memset_chk()
{
  return MEMORY[0x1E0C80B78]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1E0C80BE0](a1, a2, *(_QWORD *)&a3, a4, a5);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializerInFile()
{
  return MEMORY[0x1E0DEEA48]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x1E0DE5290](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE52A0](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x1E0DE52B0](stream, *(_QWORD *)&flags);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1E0DE92B0](crc, buf, *(_QWORD *)&len);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8640](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE8648](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8658](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
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

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

