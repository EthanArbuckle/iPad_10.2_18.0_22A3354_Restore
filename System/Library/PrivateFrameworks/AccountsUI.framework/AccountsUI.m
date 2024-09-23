id getSKUIItemOfferButtonClass()
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
  v8 = getSKUIItemOfferButtonClass_softClass;
  v13 = getSKUIItemOfferButtonClass_softClass;
  if (!getSKUIItemOfferButtonClass_softClass)
  {
    v2 = MEMORY[0x1E0C809B0];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSKUIItemOfferButtonClass_block_invoke;
    v6 = &unk_1E9A150B0;
    v7 = &v9;
    __getSKUIItemOfferButtonClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSKUIItemOfferButtonClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;
  id v3;
  id v4;

  StoreKitUILibrary();
  Class = objc_getClass("SKUIItemOfferButton");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v4 = (id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSKUIItemOfferButtonClass(void)_block_invoke");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", "SKUIItemOfferButton");

    __break(1u);
    JUMPOUT(0x1D57412E0);
  }
  getSKUIItemOfferButtonClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t StoreKitUILibrary()
{
  id v1;
  id v2;
  uint64_t v3;

  v3 = StoreKitUILibraryCore();
  if (!v3)
  {
    v2 = (id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *StoreKitUILibrary(void)");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x1D5741404);
  }
  return v3;
}

uint64_t StoreKitUILibraryCore()
{
  if (!StoreKitUILibraryCore_frameworkLibrary)
    __StoreKitUILibraryCore_block_invoke();
  return StoreKitUILibraryCore_frameworkLibrary;
}

uint64_t __os_log_helper_16_2_3_8_32_4_0_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 64;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_4_0_8_64_4_0(uint64_t result, uint64_t a2, int a3, uint64_t a4, int a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 64;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  *(_BYTE *)(result + 28) = 0;
  *(_BYTE *)(result + 29) = 4;
  *(_DWORD *)(result + 30) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_4_0_8_64_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 64;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  *(_BYTE *)(result + 28) = 64;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  return result;
}

void sub_1D57427E0()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_2_8_32_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 2;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_1D57432F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23,uint64_t a24)
{
  uint64_t v24;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v24 - 56));
  _Unwind_Resume(a1);
}

id _ACUILogSystem()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&_ACUILogSystem_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_0);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)_ACUILogSystem_log;
}

uint64_t __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_66(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 66;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 66;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_4_0_8_66(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 66;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  return result;
}

double UIRectGetMaxX(double a1, double a2, double a3)
{
  return a1 + a3;
}

double CGRound(double a1)
{
  return round(a1);
}

double CGRound_0(double a1)
{
  return round(a1);
}

void sub_1D5751010()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
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

uint64_t __os_log_helper_16_2_4_8_32_4_0_8_66_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 66;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  *(_BYTE *)(result + 28) = 64;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  return result;
}

uint64_t __UseGoogleMail()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&__UseGoogleMail_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_4);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return __UseGoogleMail__useGoogleMail & 1;
}

uint64_t PreferencesExtendedLibrary()
{
  id v1;
  id v2;
  uint64_t v3;

  v3 = PreferencesExtendedLibraryCore();
  if (!v3)
  {
    v2 = (id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PreferencesExtendedLibrary(void)");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x1D57571D4);
  }
  return v3;
}

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

void sub_1D5759B54()
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

void sub_1D575B9C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,_Unwind_Exception *exception_object,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  uint64_t v30;

  objc_destroyWeak(&a30);
  objc_destroyWeak((id *)(v30 - 104));
  _Unwind_Resume(a1);
}

uint64_t PreferencesExtendedLibraryCore()
{
  if (!PreferencesExtendedLibraryCore_frameworkLibrary)
    __PreferencesExtendedLibraryCore_block_invoke();
  return PreferencesExtendedLibraryCore_frameworkLibrary;
}

id __MailRegionCode()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&__MailRegionCode_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_303);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)__MailRegionCode__regionCode;
}

uint64_t __os_log_helper_16_2_3_8_32_4_0_8_32(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 32;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  return result;
}

id getIMAPAccountClass()
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
  v8 = getIMAPAccountClass_softClass;
  v13 = getIMAPAccountClass_softClass;
  if (!getIMAPAccountClass_softClass)
  {
    v2 = MEMORY[0x1E0C809B0];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getIMAPAccountClass_block_invoke;
    v6 = &unk_1E9A150B0;
    v7 = &v9;
    __getIMAPAccountClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getIMAPAccountClass_block_invoke(uint64_t a1)
{
  Class Class;
  uint64_t result;
  id v3;
  id v4;

  IMAPLibrary();
  Class = objc_getClass("IMAPAccount");
  result = a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Class;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v4 = (id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIMAPAccountClass(void)_block_invoke");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", "IMAPAccount");

    __break(1u);
    JUMPOUT(0x1D5762608);
  }
  getIMAPAccountClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t IMAPLibrary()
{
  id v1;
  id v2;
  uint64_t v3;

  v3 = IMAPLibraryCore();
  if (!v3)
  {
    v2 = (id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IMAPLibrary(void)");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x1D576272CLL);
  }
  return v3;
}

uint64_t IMAPLibraryCore()
{
  if (!IMAPLibraryCore_frameworkLibrary)
    __IMAPLibraryCore_block_invoke();
  return IMAPLibraryCore_frameworkLibrary;
}

uint64_t PreferencesExtendedLibrary_0()
{
  id v1;
  id v2;
  uint64_t v3;

  v3 = PreferencesExtendedLibraryCore_0();
  if (!v3)
  {
    v2 = (id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PreferencesExtendedLibrary(void)");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x1D5763FE0);
  }
  return v3;
}

uint64_t __os_log_helper_16_2_4_8_32_4_0_8_66_4_0(uint64_t result, uint64_t a2, int a3, uint64_t a4, int a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 66;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  *(_BYTE *)(result + 28) = 0;
  *(_BYTE *)(result + 29) = 4;
  *(_DWORD *)(result + 30) = a5;
  return result;
}

void sub_1D5767FC8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1D576849C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_4_8_32_4_0_8_0_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 0;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  *(_BYTE *)(result + 28) = 64;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  return result;
}

void sub_1D5769100(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  *(_QWORD *)(v10 - 48) = a1;
  *(_DWORD *)(v10 - 52) = a2;
  objc_destroyWeak((id *)(v10 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 48));
}

uint64_t __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 5;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 66;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  *(_BYTE *)(result + 38) = 64;
  *(_BYTE *)(result + 39) = 8;
  *(_QWORD *)(result + 40) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_4_0_8_66_8_66(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 4;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 66;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  *(_BYTE *)(result + 28) = 66;
  *(_BYTE *)(result + 29) = 8;
  *(_QWORD *)(result + 30) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_4_0_8_0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_BYTE *)result = 2;
  *(_BYTE *)(result + 1) = 3;
  *(_BYTE *)(result + 2) = 32;
  *(_BYTE *)(result + 3) = 8;
  *(_QWORD *)(result + 4) = a2;
  *(_BYTE *)(result + 12) = 0;
  *(_BYTE *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(_BYTE *)(result + 18) = 0;
  *(_BYTE *)(result + 19) = 8;
  *(_QWORD *)(result + 20) = a4;
  return result;
}

void sub_1D576C188()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1D576C784(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object)
{
  uint64_t v9;

  *(_QWORD *)(v9 - 112) = a1;
  *(_DWORD *)(v9 - 116) = a2;
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v9 - 112));
}

void sub_1D576E45C()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1D576EFC8()
{
  _Unwind_Exception *v0;

  _Unwind_Resume(v0);
}

void sub_1D576F3A8(uint64_t a1, int a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 88) = a1;
  *(_DWORD *)(v2 - 92) = a2;
  _Block_object_dispose((const void *)(v2 - 64), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 88));
}

uint64_t PreferencesExtendedLibraryCore_0()
{
  if (!PreferencesExtendedLibraryCore_frameworkLibrary_0)
    __PreferencesExtendedLibraryCore_block_invoke_0();
  return PreferencesExtendedLibraryCore_frameworkLibrary_0;
}

id _SortIdentities(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v23;
  id v24;
  uint64_t v25;
  int v26;
  id v27;
  _QWORD v28[8];
  id v29;
  id v30;
  id v31;
  unsigned int v32;
  SecCertificateRef certificateRef;
  _QWORD v34[8];
  SecIdentityRef v35;
  _QWORD __b[8];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id location;
  id v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  location = 0;
  objc_storeStrong(&location, a1);
  v41 = 0;
  objc_storeStrong(&v41, a2);
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = objc_alloc(MEMORY[0x1E0C99E20]);
  v38 = (id)objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v41, "count"));
  memset(__b, 0, sizeof(__b));
  v24 = v41;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
  if (v25)
  {
    v19 = *(_QWORD *)__b[2];
    v20 = 0;
    v21 = v25;
    while (1)
    {
      v18 = v20;
      if (*(_QWORD *)__b[2] != v19)
        objc_enumerationMutation(v24);
      v37 = *(id *)(__b[1] + 8 * v20);
      v16 = v38;
      v17 = (id)objc_msgSend(v37, "lowercaseString");
      objc_msgSend(v16, "addObject:");

      ++v20;
      if (v18 + 1 >= v21)
      {
        v20 = 0;
        v21 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
        if (!v21)
          break;
      }
    }
  }

  memset(v34, 0, sizeof(v34));
  v14 = location;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v34, v45, 16);
  if (v15)
  {
    v11 = *(_QWORD *)v34[2];
    v12 = 0;
    v13 = v15;
    while (1)
    {
      v10 = v12;
      if (*(_QWORD *)v34[2] != v11)
        objc_enumerationMutation(v14);
      v35 = *(SecIdentityRef *)(v34[1] + 8 * v12);
      certificateRef = 0;
      v32 = 0;
      v32 = SecIdentityCopyCertificate(v35, &certificateRef);
      if (v32)
      {
        NSLog(CFSTR("%s: SecIdentityCopyCertificate returned %d"), "_SortIdentities", v32);
      }
      else if (certificateRef)
      {
        v43 = (id)SecCertificateCopyRFC822Names();
        v31 = v43;
        v30 = v39;
        memset(v28, 0, sizeof(v28));
        v8 = v31;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v28, v44, 16);
        if (v9)
        {
          v5 = *(_QWORD *)v28[2];
          v6 = 0;
          v7 = v9;
          while (1)
          {
            v4 = v6;
            if (*(_QWORD *)v28[2] != v5)
              objc_enumerationMutation(v8);
            v29 = *(id *)(v28[1] + 8 * v6);
            v27 = (id)objc_msgSend(v29, "lowercaseString");
            if ((objc_msgSend(v38, "containsObject:", v27) & 1) != 0)
            {
              objc_storeStrong(&v30, v40);
              v26 = 6;
            }
            else
            {
              v26 = 0;
            }
            objc_storeStrong(&v27, 0);
            if (v26)
              break;
            ++v6;
            if (v4 + 1 >= v7)
            {
              v6 = 0;
              v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v28, v44, 16);
              if (!v7)
                break;
            }
          }
        }

        objc_msgSend(v30, "addObject:", v35);
        CFRelease(certificateRef);
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
      }
      ++v12;
      if (v10 + 1 >= v13)
      {
        v12 = 0;
        v13 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v34, v45, 16);
        if (!v13)
          break;
      }
    }
  }

  objc_msgSend(v40, "addObjectsFromArray:", v39);
  if (!objc_msgSend(v40, "count"))
    objc_storeStrong(&v40, 0);
  v3 = v40;
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&location, 0);
  return v3;
}

BOOL _SecIdentityEqual(const void *a1, const void *a2)
{
  BOOL v3;

  v3 = 0;
  if (a1 == a2)
  {
    return 1;
  }
  else if (a1 && a2)
  {
    return CFEqual(a1, a2) != 0;
  }
  return v3;
}

id _domainForAddress(id obj)
{
  uint64_t v1;
  id v2;
  id v3;
  id v5;
  __int128 v6;
  id v7;
  id location;
  __int128 v9;
  __int128 v10;

  location = 0;
  objc_storeStrong(&location, obj);
  v7 = 0;
  *(_QWORD *)&v6 = objc_msgSend(location, "rangeOfString:", CFSTR("@"));
  *((_QWORD *)&v6 + 1) = v1;
  if ((_QWORD)v6 == 0x7FFFFFFFFFFFFFFFLL
    || (v10 = v6, (uint64_t)v6 + v1 >= (unint64_t)objc_msgSend(location, "length")))
  {
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v9 = v6;
    v2 = (id)objc_msgSend(location, "substringFromIndex:", (_QWORD)v6 + *((_QWORD *)&v6 + 1));
    v3 = v7;
    v7 = v2;

  }
  v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

id ACUIDescriptionFromEmailAddress(id obj)
{
  id v1;
  id v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v8 = 0;
  v7 = _domainForAddress(location);
  v6 = (id)objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("."));
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_storeStrong(&v8, location);
  }
  else if (objc_msgSend(v6, "count") == 2)
  {
    v5 = (id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v1 = (id)objc_msgSend(v5, "capitalizedString");
    v2 = v8;
    v8 = v1;

  }
  else
  {
    objc_storeStrong(&v8, v7);
  }
  v4 = v8;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
  return v4;
}

uint64_t ACUIIsSharedIPadMode()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&ACUIIsSharedIPadMode_onceToken;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_7);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return ACUIIsSharedIPadMode_isSharedIPadMode & 1;
}

id ACUIOrderedDataClassList(id obj)
{
  id v2;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v2 = +[ACUIUtils sortedDataclassesFrom:](ACUIUtils, "sortedDataclassesFrom:", location);
  objc_storeStrong(&location, 0);
  return v2;
}

id ACUIVisibleAccountTypes()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&ACUIVisibleAccountTypes_token;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_12);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)ACUIVisibleAccountTypes_visibleTypes;
}

id ACUISortedAccountTypes()
{
  dispatch_block_t block;
  dispatch_once_t *predicate;

  predicate = (dispatch_once_t *)&ACUISortedAccountTypes_token;
  block = 0;
  objc_storeStrong(&block, &__block_literal_global_14);
  if (*predicate != -1)
    dispatch_once(predicate, block);
  objc_storeStrong(&block, 0);
  return (id)ACUISortedAccountTypes_sortedTypes;
}

id ACUIFetchSettingTitle(int a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  switch(a1)
  {
    case 0:
      v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AUTOMATICALLY"), &stru_1E9A15E98, CFSTR("Localizable"));

      return v7;
    case 900:
      v3 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (id)objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("15_MIN"), &stru_1E9A15E98, CFSTR("Localizable"));

      break;
    case 1800:
      v4 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("30_MIN"), &stru_1E9A15E98, CFSTR("Localizable"));

      return v9;
    case 3600:
      v5 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HOURLY"), &stru_1E9A15E98, CFSTR("Localizable"));

      break;
    default:
      v2 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (id)objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OFF"), &stru_1E9A15E98, CFSTR("Localizable"));

      return v10;
  }
  return v8;
}

uint64_t ACUIFetchSettingFromNumber(id obj)
{
  unsigned int v2;
  id location;

  location = 0;
  objc_storeStrong(&location, obj);
  v2 = objc_msgSend(location, "intValue");
  objc_storeStrong(&location, 0);
  return v2;
}

uint64_t PreferencesExtendedLibrary_1()
{
  id v1;
  id v2;
  uint64_t v3;

  v3 = PreferencesExtendedLibraryCore_1();
  if (!v3)
  {
    v2 = (id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PreferencesExtendedLibrary(void)");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x1D5775D78);
  }
  return v3;
}

uint64_t PreferencesExtendedLibraryCore_1()
{
  if (!PreferencesExtendedLibraryCore_frameworkLibrary_1)
    __PreferencesExtendedLibraryCore_block_invoke_1();
  return PreferencesExtendedLibraryCore_frameworkLibrary_1;
}

uint64_t ACDAccountSyncAccountIsSyncable()
{
  return MEMORY[0x1E0CF4EE8]();
}

uint64_t ACDAccountSyncDevices()
{
  return MEMORY[0x1E0CF4EF0]();
}

uint64_t ACDAccountSyncEnabled()
{
  return MEMORY[0x1E0CF4EF8]();
}

uint64_t ACDAccountSyncMarkAccountDeleted()
{
  return MEMORY[0x1E0CF4F00]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x1E0CFA2A0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MKBUserTypeDeviceMode()
{
  return MEMORY[0x1E0D4E580]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PCSettingsGetClassPollInterval()
{
  return MEMORY[0x1E0D70A48]();
}

uint64_t PCSettingsGetClassPushEnabled()
{
  return MEMORY[0x1E0D70A50]();
}

uint64_t PSSiriImage()
{
  return MEMORY[0x1E0D80900]();
}

uint64_t SBAddDownloadingIconForDisplayIdentifier()
{
  return MEMORY[0x1E0DAB0A8]();
}

uint64_t SBGetApplicationNetworkFlags()
{
  return MEMORY[0x1E0DAB270]();
}

uint64_t SBSCopyLocalizedApplicationNameForDisplayIdentifier()
{
  return MEMORY[0x1E0DAB610]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x1E0DAB9A8]();
}

uint64_t SBSetApplicationNetworkFlags()
{
  return MEMORY[0x1E0DABAB0]();
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x1E0CD5FC0]();
}

uint64_t SecCertificateCopyRFC822Names()
{
  return MEMORY[0x1E0CD5FC8]();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1E0CD5FF8](certificate);
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1E0CD6270](identityRef, certificateRef);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0CEB418](category);
}

uint64_t _ACLogSystem()
{
  return MEMORY[0x1E0C8F300]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
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

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

