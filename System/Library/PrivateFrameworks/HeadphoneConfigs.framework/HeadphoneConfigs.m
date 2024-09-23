void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1DB31D93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB327450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1DB3277EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB335A84(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DB335B3C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB336268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB336348(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB338934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t isPreferredLanguageEnglish()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("en")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "hasPrefix:", CFSTR("en-"));

  return v2;
}

void sub_1DB3458F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 168));
  _Unwind_Resume(a1);
}

void sub_1DB347884(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 104));
  _Unwind_Resume(a1);
}

void sub_1DB3480A4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB3483B4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB34950C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
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

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id sharedBluetoothSettingsLogComponent()
{
  if (sharedBluetoothSettingsLogComponent_onceToken != -1)
    dispatch_once(&sharedBluetoothSettingsLogComponent_onceToken, &__block_literal_global_8);
  return (id)sharedBluetoothSettingsLogComponent_sharedBTSLog;
}

void __sharedBluetoothSettingsLogComponent_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bluetooth", "BluetoothSettings");
  v1 = (void *)sharedBluetoothSettingsLogComponent_sharedBTSLog;
  sharedBluetoothSettingsLogComponent_sharedBTSLog = (uint64_t)v0;

}

void sub_1DB34EF9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a36);
  _Unwind_Resume(a1);
}

id createWarningCellTitle()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v0 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v0, "setEditable:", 0);
  objc_msgSend(v0, "setSelectable:", 1);
  objc_msgSend(v0, "setUserInteractionEnabled:", 1);
  objc_msgSend(v0, "setScrollEnabled:", 0);
  objc_msgSend(v0, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFont:", v1);

  objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v0, "setTextColor:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setTextColor:", v4);

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBackgroundColor:", v5);

  LODWORD(v6) = 1144750080;
  objc_msgSend(v0, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1144750080;
  objc_msgSend(v0, "setContentHuggingPriority:forAxis:", 0, v7);
  LODWORD(v8) = 1144750080;
  objc_msgSend(v0, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  LODWORD(v9) = 1144750080;
  objc_msgSend(v0, "setContentHuggingPriority:forAxis:", 1, v9);
  objc_msgSend(v0, "sizeToFit");
  return v0;
}

id createWarningCellBody()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v0 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
  objc_msgSend(v0, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v0, "setEditable:", 0);
  objc_msgSend(v0, "setSelectable:", 1);
  objc_msgSend(v0, "setUserInteractionEnabled:", 1);
  objc_msgSend(v0, "setScrollEnabled:", 0);
  objc_msgSend(v0, "_setInteractiveTextSelectionDisabled:", 0);
  objc_msgSend(v0, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v0, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFont:", v1);

  objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v0, "setTextColor:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setTextColor:", v4);

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBackgroundColor:", v5);

  LODWORD(v6) = 1144750080;
  objc_msgSend(v0, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1144750080;
  objc_msgSend(v0, "setContentHuggingPriority:forAxis:", 0, v7);
  LODWORD(v8) = 1144750080;
  objc_msgSend(v0, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  LODWORD(v9) = 1144750080;
  objc_msgSend(v0, "setContentHuggingPriority:forAxis:", 1, v9);
  objc_msgSend(v0, "sizeToFit");
  return v0;
}

void sub_1DB353168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB35381C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
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

void sub_1DB353C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB354814(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1DB354A38(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB355014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DB3552F4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t cbTapActionForBT(int a1)
{
  uint64_t result;

  switch(a1)
  {
    case 1:
      result = 2;
      break;
    case 2:
      result = 3;
      break;
    case 3:
      result = 4;
      break;
    case 4:
      result = 5;
      break;
    default:
      result = a1 != 15 && a1 != 0xFFFF;
      break;
  }
  return result;
}

void sub_1DB35D3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1DB366E14(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

void sub_1DB3682E8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB3686B4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB36907C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB3693E0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DB36A968(_Unwind_Exception *a1)
{
  uint64_t v1;

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

uint64_t static HPSCaseEngravingView.getEngravedCaseImage(_:productID:)(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, int);

  v9 = (uint64_t (*)(uint64_t, uint64_t, int))((char *)&dword_1F02DA0F8 + dword_1F02DA0F8);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1DB380504;
  return v9(a1, a2, a3);
}

uint64_t sub_1DB380504(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_1DB380554()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = sub_1DB3BBDAC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0D817F0], v0);
  v4 = sub_1DB3BBDB8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

id sub_1DB3805F0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  void *v3;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = (void *)v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_1DB380628()
{
  return 0;
}

uint64_t sub_1DB380764(int a1, int a2, void *aBlock)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t, uint64_t, int);

  v3[2] = _Block_copy(aBlock);
  v5 = sub_1DB3BC340();
  v7 = v6;
  v3[3] = v6;
  v10 = (uint64_t (*)(uint64_t, uint64_t, int))((char *)&dword_1F02DA0F8 + dword_1F02DA0F8);
  v8 = (_QWORD *)swift_task_alloc();
  v3[4] = v8;
  *v8 = v3;
  v8[1] = sub_1DB3807F8;
  return v10(v5, v7, a2);
}

uint64_t sub_1DB3807F8(const void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v5;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  ((void (**)(_QWORD, const void *))v3)[2](v3, a1);
  _Block_release(v3);
  _Block_release(a1);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

id HPSCaseEngravingView.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HPSCaseEngravingView.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HPSCaseEngravingView();
  return objc_msgSendSuper2(&v2, sel_init);
}

id HPSCaseEngravingView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HPSCaseEngravingView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DB380934(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1DB38190C;
  return v6();
}

uint64_t sub_1DB380988(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1DB38190C;
  return v7();
}

uint64_t sub_1DB3809DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DB3BC430();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1DB3BC424();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1DB38168C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DB3BC418();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1DB380B20(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1DB380B84;
  return v6(a1);
}

uint64_t sub_1DB380B84()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DB380BD0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_DWORD *)(v3 + 344) = a3;
  *(_QWORD *)(v3 + 176) = a1;
  *(_QWORD *)(v3 + 184) = a2;
  v4 = sub_1DB3BBDC4();
  *(_QWORD *)(v3 + 192) = v4;
  v5 = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 200) = v5;
  *(_QWORD *)(v3 + 208) = *(_QWORD *)(v5 + 64);
  *(_QWORD *)(v3 + 216) = swift_task_alloc();
  *(_QWORD *)(v3 + 224) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA170);
  *(_QWORD *)(v3 + 232) = swift_task_alloc();
  v6 = sub_1DB3BBDA0();
  *(_QWORD *)(v3 + 240) = v6;
  *(_QWORD *)(v3 + 248) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 256) = swift_task_alloc();
  *(_QWORD *)(v3 + 264) = swift_task_alloc();
  v7 = sub_1DB3BBDE8();
  *(_QWORD *)(v3 + 272) = v7;
  *(_QWORD *)(v3 + 280) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v3 + 288) = swift_task_alloc();
  *(_QWORD *)(v3 + 296) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DB380CDC()
{
  uint64_t v0;
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
  _QWORD *v12;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  *(_QWORD *)(v0 + 304) = sub_1DB381760();
  *(_QWORD *)(v0 + 312) = sub_1DB3BC55C();
  sub_1DB3BBDDC();
  v15 = *(_QWORD *)(v0 + 280);
  v16 = *(_QWORD *)(v0 + 288);
  v17 = *(_QWORD *)(v0 + 272);
  v18 = *(_QWORD *)(v0 + 296);
  v19 = *(_QWORD *)(v0 + 264);
  v20 = *(_QWORD *)(v0 + 248);
  v1 = *(_QWORD *)(v0 + 232);
  v21 = *(_QWORD *)(v0 + 256);
  v22 = *(_QWORD *)(v0 + 240);
  v14 = *(_DWORD *)(v0 + 344);
  *(_QWORD *)(v0 + 128) = sub_1DB3BC358();
  *(_QWORD *)(v0 + 136) = v2;
  *(_QWORD *)(v0 + 144) = 58;
  *(_QWORD *)(v0 + 152) = 0xE100000000000000;
  *(_QWORD *)(v0 + 160) = 45;
  *(_QWORD *)(v0 + 168) = 0xE100000000000000;
  sub_1DB3817B4();
  sub_1DB3817F8();
  v3 = MEMORY[0x1E0DEA968];
  sub_1DB3BC460();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 120);
  swift_bridgeObjectRetain();
  sub_1DB3BC484();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA190);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1DB3C16B0;
  *(_QWORD *)(v6 + 56) = v3;
  *(_QWORD *)(v6 + 64) = sub_1DB38183C();
  v7 = MEMORY[0x1E0DEE0F8];
  *(_QWORD *)(v6 + 32) = v4;
  *(_QWORD *)(v6 + 40) = v5;
  v8 = MEMORY[0x1E0DEE168];
  *(_QWORD *)(v6 + 96) = v7;
  *(_QWORD *)(v6 + 104) = v8;
  *(_DWORD *)(v6 + 72) = v14;
  sub_1DB3BC0A0();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v16, v18, v17);
  sub_1DB3BBDF4();
  sub_1DB3BBD88();
  sub_1DB3BBE00();
  v9 = *MEMORY[0x1E0D81840];
  v10 = sub_1DB3BBE0C();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 104))(v1, v9, v10);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v1, 0, 1, v10);
  sub_1DB3BBD94();
  sub_1DB3BBD7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v21, v19, v22);
  *(_QWORD *)(v0 + 320) = sub_1DB3BBDD0();
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 328) = v12;
  *v12 = v0;
  v12[1] = sub_1DB3810DC;
  return sub_1DB3BBD70();
}

uint64_t sub_1DB3810DC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 336) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DB381140()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(unint64_t, uint64_t, uint64_t);
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  v1 = (void *)v0[39];
  v2 = v0[34];
  v3 = v0[35];
  v4 = v0[33];
  v5 = v0[30];
  v6 = v0[31];
  v7 = v0[27];
  v15 = v0[37];
  v16 = v0[28];
  v8 = v0[25];
  v9 = v0[24];
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v15, v2);
  v10 = *(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 32);
  v10(v7, v16, v9);
  v11 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = swift_allocObject();
  v10(v12 + v11, v7, v9);
  v0[12] = sub_1DB3818E0;
  v0[13] = v12;
  v0[8] = MEMORY[0x1E0C809B0];
  v0[9] = 1107296256;
  v0[10] = sub_1DB3805F0;
  v0[11] = &block_descriptor_25;
  v13 = _Block_copy(v0 + 8);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void *))v0[1])(v13);
}

uint64_t sub_1DB3812B8()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v1 = (void *)v0[39];
  v2 = v0[37];
  v3 = v0[34];
  v4 = v0[35];
  v5 = v0[33];
  v6 = v0[30];
  v7 = v0[31];
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  v8 = (void *)v0[42];
  v9 = (void *)sub_1DB3BC550();
  sub_1DB3BC484();
  sub_1DB3BC094();

  v0[6] = sub_1DB380628;
  v0[7] = 0;
  v0[2] = MEMORY[0x1E0C809B0];
  v0[3] = 1107296256;
  v0[4] = sub_1DB3805F0;
  v0[5] = &block_descriptor;
  v10 = _Block_copy(v0 + 2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void *))v0[1])(v10);
}

uint64_t type metadata accessor for HPSCaseEngravingView()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0AD368]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1DB38146C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_1DB381498()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  void *v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_DWORD *)(v0 + 24);
  v4 = *(void **)(v0 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1DB381514;
  return ((uint64_t (*)(int, int, void *))((char *)&dword_1F02DA130 + dword_1F02DA130))(v2, v3, v4);
}

uint64_t sub_1DB381514()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DB381560()
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
  v5[1] = sub_1DB38190C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1F02DA140 + dword_1F02DA140))(v2, v3, v4);
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DB381608(uint64_t a1)
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
  v7[1] = sub_1DB38190C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1F02DA150 + dword_1F02DA150))(a1, v4, v5, v6);
}

uint64_t sub_1DB38168C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA128);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DB3816CC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DB3816F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DB381514;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F02DA160 + dword_1F02DA160))(a1, v4);
}

unint64_t sub_1DB381760()
{
  unint64_t result;

  result = qword_1F02DA178;
  if (!qword_1F02DA178)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F02DA178);
  }
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

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_1DB3817B4()
{
  unint64_t result;

  result = qword_1F02DA180;
  if (!qword_1F02DA180)
  {
    result = MEMORY[0x1DF0AD380](MEMORY[0x1E0DEA9B0], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1F02DA180);
  }
  return result;
}

unint64_t sub_1DB3817F8()
{
  unint64_t result;

  result = qword_1F02DA188;
  if (!qword_1F02DA188)
  {
    result = MEMORY[0x1DF0AD380](MEMORY[0x1E0DEA9A8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1F02DA188);
  }
  return result;
}

unint64_t sub_1DB38183C()
{
  unint64_t result;

  result = qword_1F02DA198;
  if (!qword_1F02DA198)
  {
    result = MEMORY[0x1DF0AD380](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1F02DA198);
  }
  return result;
}

uint64_t sub_1DB381880()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1DB3BBDC4();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1DB3818E0()
{
  sub_1DB3BBDC4();
  return sub_1DB380554();
}

uint64_t sub_1DB381918()
{
  uint64_t v0;

  v0 = sub_1DB3BC0DC();
  __swift_allocate_value_buffer(v0, qword_1F02DB098);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB098);
  sub_1DB3BC0B8();
  return sub_1DB3BC0D0();
}

uint64_t sub_1DB381980()
{
  uint64_t v0;

  if (qword_1F02DD050 != -1)
    swift_once();
  v0 = sub_1DB3BC0DC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB098);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1DB3819E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F02DD050 != -1)
    swift_once();
  v2 = sub_1DB3BC0DC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02DB098);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

void *sub_1DB381A98()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1DB381B60(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  sub_1DB381BC8();
}

void sub_1DB381BC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  id *v24;
  uint64_t *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void (*v30)(char *, _QWORD *);
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void (**v37)(char *, uint64_t);
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  void *v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  _QWORD v53[2];
  void (**v54)(char *, uint64_t);
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  uint64_t v77;
  id v78;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA248);
  v67 = *(_QWORD *)(v1 - 8);
  v68 = v1;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v65 = (char *)v53 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA250);
  v70 = *(_QWORD *)(v3 - 8);
  v71 = v3;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v69 = (char *)v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA258);
  v73 = *(_QWORD *)(v5 - 8);
  v74 = v5;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v72 = (char *)v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_1DB3BC4C0();
  v63 = *(_QWORD *)(v64 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v62 = (char *)v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1B8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v66 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA260);
  v10 = *(v9 - 1);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v12 = (char *)v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1B0);
  v14 = *(v13 - 1);
  v15 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v17 = (char *)v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)v53 - v18;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA268);
  v54 = *(void (***)(char *, uint64_t))(v55 - 8);
  MEMORY[0x1E0C80A78](v55);
  v21 = (char *)v53 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA270);
  v57 = *(_QWORD *)(v58 - 8);
  MEMORY[0x1E0C80A78](v58);
  v56 = (char *)v53 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA278);
  v60 = *(_QWORD *)(v61 - 8);
  MEMORY[0x1E0C80A78](v61);
  v59 = (char *)v53 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = (id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice);
  swift_beginAccess();
  v75 = *v24;
  if (v75)
  {
    v53[1] = v0;
    v25 = (uint64_t *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_listeners);
    swift_beginAccess();
    v53[0] = v25;
    v26 = *v25;
    if ((v26 & 0xC000000000000001) != 0)
    {
      v27 = v75;
      swift_bridgeObjectRetain();
      v28 = sub_1DB3BC5C8();
      swift_bridgeObjectRelease();
      if (v28)
      {
LABEL_5:

        return;
      }
    }
    else
    {
      v51 = *(_QWORD *)(v26 + 16);
      v52 = v75;
      if (v51)
        goto LABEL_5;
    }
    sub_1DB3BBF38();
    v29 = (void *)sub_1DB38A000(v13);
    v30 = *(void (**)(char *, _QWORD *))(v14 + 8);
    v30(v19, v13);
    v76 = v29;
    sub_1DB3BBE54();
    v31 = (void *)sub_1DB38A000(v9);
    (*(void (**)(char *, _QWORD *))(v10 + 8))(v12, v9);
    v78 = v31;
    sub_1DB3BBE60();
    v32 = sub_1DB38A000(v13);
    v30(v17, v13);
    v77 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA280);
    v33 = MEMORY[0x1E0C95D90];
    sub_1DB383980(&qword_1F02DA1F0, &qword_1F02DA1E8, MEMORY[0x1E0C95D90]);
    sub_1DB383980(&qword_1F02DA288, &qword_1F02DA280, v33);
    sub_1DB3BC190();
    sub_1DB383980(&qword_1F02DA290, &qword_1F02DA268, MEMORY[0x1E0C956B8]);
    v34 = v55;
    v35 = (void *)sub_1DB3BC22C();
    v54[1](v21, v34);
    v76 = v35;
    sub_1DB3832D8();
    v78 = (id)sub_1DB3BC4CC();
    v36 = sub_1DB3BC4A8();
    v37 = *(void (***)(char *, uint64_t))(*(_QWORD *)(v36 - 8) + 56);
    v38 = (uint64_t)v66;
    v55 = v36;
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v37)(v66, 1, 1, v36);
    v54 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA298);
    sub_1DB383980(&qword_1F02DA2A0, &qword_1F02DA298, MEMORY[0x1E0C95D90]);
    sub_1DB383314();
    v39 = v56;
    sub_1DB3BC250();
    sub_1DB38335C(v38);

    swift_release();
    v40 = v62;
    sub_1DB3BC4B4();
    v76 = (id)sub_1DB3BC4CC();
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v37)(v38, 1, 1, v36);
    sub_1DB383980(&qword_1F02DA2A8, &qword_1F02DA270, MEMORY[0x1E0C95CB8]);
    v41 = v59;
    v42 = v58;
    sub_1DB3BC25C();
    sub_1DB38335C(v38);

    (*(void (**)(char *, uint64_t))(v63 + 8))(v40, v64);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v39, v42);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1DB383980(&qword_1F02DA2B0, &qword_1F02DA278, MEMORY[0x1E0C95BB0]);
    v43 = v61;
    sub_1DB3BC274();
    swift_release();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v41, v43);
    swift_beginAccess();
    sub_1DB3BC1A8();
    swift_endAccess();
    swift_release();
    sub_1DB3BBE24();
    v44 = v65;
    sub_1DB3BC004();
    swift_release();
    v45 = v68;
    v46 = (void *)sub_1DB3BBE18();
    (*(void (**)(char *, uint64_t))(v67 + 8))(v44, v45);
    v76 = v46;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA2B8);
    sub_1DB383980(&qword_1F02DA2C0, &qword_1F02DA2B8, MEMORY[0x1E0C95D90]);
    v47 = v69;
    sub_1DB3BC268();
    swift_release();
    v76 = (id)sub_1DB3BC4CC();
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v54)(v38, 1, 1, v55);
    sub_1DB383980(&qword_1F02DA2C8, &qword_1F02DA250, MEMORY[0x1E0C95988]);
    v49 = v71;
    v48 = v72;
    sub_1DB3BC250();
    sub_1DB38335C(v38);

    (*(void (**)(char *, uint64_t))(v70 + 8))(v47, v49);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_1DB383980(&qword_1F02DA2D0, &qword_1F02DA258, MEMORY[0x1E0C95CB8]);
    v50 = v74;
    sub_1DB3BC274();
    swift_release();
    (*(void (**)(char *, uint64_t))(v73 + 8))(v48, v50);
    swift_beginAccess();
    sub_1DB3BC1A8();
    swift_endAccess();
    swift_release();
    goto LABEL_5;
  }
}

void (*sub_1DB382538(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_1DB382580;
}

void sub_1DB382580(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_1DB381BC8();
}

uint64_t sub_1DB3825B0()
{
  return MEMORY[0x1E0DEE9E8];
}

uint64_t sub_1DB3825BC()
{
  return sub_1DB3BC1E4();
}

uint64_t sub_1DB382664()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_1DB3BC214();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1DB382740()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_1DB3BC220();
}

uint64_t sub_1DB3827A8@<X0>(_QWORD **a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **a1) + 0xB0))();
  *a2 = result & 1;
  return result;
}

uint64_t sub_1DB3827EC(unsigned __int8 *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x1E0DEEDD8] & **a2) + 0xB8))(*a1);
}

void (*sub_1DB382828(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_1DB3BC208();
  return sub_1DB3828A0;
}

void sub_1DB3828A0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_1DB3828EC()
{
  return 1;
}

uint64_t sub_1DB3828F4()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1A8);
  sub_1DB3BC1F0();
  return swift_endAccess();
}

uint64_t sub_1DB382954(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1B0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1A8);
  sub_1DB3BC1FC();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*sub_1DB382A28(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1B0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver__reloadTriggered;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1A8);
  sub_1DB3BC1F0();
  swift_endAccess();
  return sub_1DB382AF0;
}

void sub_1DB382AF0(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_1DB3BC1FC();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_1DB3BC1FC();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t sub_1DB382C08()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_1DB382C50(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_reloadListener);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*sub_1DB382CA0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

_QWORD *sub_1DB382CE8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  id v11;

  v11 = objc_allocWithZone(v5);
  return sub_1DB382D48(a1, a2, a3, a4, a5);
}

_QWORD *sub_1DB382D48(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void **v21;
  char *v22;
  char *v23;
  void *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  objc_class *v29;
  _QWORD *v30;
  void (*v31)(void);
  _QWORD *v32;
  void *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  id v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  objc_super v59;
  char v60;

  v45 = a4;
  v46 = a5;
  v44 = a3;
  v43 = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1B8);
  MEMORY[0x1E0C80A78](v7);
  v52 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DB3BC4C0();
  v55 = *(_QWORD *)(v9 - 8);
  v56 = v9;
  MEMORY[0x1E0C80A78](v9);
  v49 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1B0);
  v47 = *(v11 - 1);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1C0);
  v53 = *(_QWORD *)(v51 - 8);
  MEMORY[0x1E0C80A78](v51);
  v15 = (char *)&v43 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1C8);
  v57 = *(_QWORD *)(v54 - 8);
  MEMORY[0x1E0C80A78](v54);
  v48 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1A8);
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (void **)&v5[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice];
  *(_QWORD *)&v5[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_headphoneDevice] = 0;
  *(_QWORD *)&v5[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_listeners] = MEMORY[0x1E0DEE9E8];
  v22 = &v5[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver__reloadTriggered];
  v60 = 1;
  v23 = v5;
  sub_1DB3BC1E4();
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v22, v20, v17);
  *(_QWORD *)&v23[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_reloadListener] = 0;
  swift_beginAccess();
  v24 = *v21;
  *v21 = a1;
  v50 = a1;

  v25 = &v23[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_action];
  v26 = v44;
  *(_QWORD *)v25 = v43;
  *((_QWORD *)v25 + 1) = v26;
  v27 = &v23[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_reloadAllAction];
  v28 = v46;
  *(_QWORD *)v27 = v45;
  *((_QWORD *)v27 + 1) = v28;
  swift_retain();
  swift_retain();

  v29 = (objc_class *)type metadata accessor for BTSHeadphoneDevicePropertyObserver();
  v59.receiver = v23;
  v59.super_class = v29;
  v30 = objc_msgSendSuper2(&v59, sel_init);
  v31 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v30) + 0xC8);
  v32 = v30;
  v31();
  v33 = (void *)sub_1DB38A000(v11);
  (*(void (**)(char *, _QWORD *))(v47 + 8))(v13, v11);
  v58 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1E8);
  sub_1DB383980(&qword_1F02DA1F0, &qword_1F02DA1E8, MEMORY[0x1E0C95D90]);
  sub_1DB3BC268();
  swift_release();
  v34 = v49;
  sub_1DB3BC4B4();
  sub_1DB3832D8();
  v58 = (id)sub_1DB3BC4CC();
  v35 = sub_1DB3BC4A8();
  v36 = (uint64_t)v52;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v52, 1, 1, v35);
  sub_1DB383980(&qword_1F02DA200, &qword_1F02DA1C0, MEMORY[0x1E0C95988]);
  sub_1DB383314();
  v37 = v48;
  v38 = v51;
  sub_1DB3BC25C();
  sub_1DB38335C(v36);

  (*(void (**)(char *, uint64_t))(v55 + 8))(v34, v56);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v15, v38);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1DB383980(&qword_1F02DA210, &qword_1F02DA1C8, MEMORY[0x1E0C95BB0]);
  v39 = v54;
  v40 = sub_1DB3BC274();

  swift_release();
  swift_release();
  swift_release();

  (*(void (**)(char *, uint64_t))(v57 + 8))(v37, v39);
  v41 = (_QWORD *)((char *)v32 + OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_reloadListener);
  swift_beginAccess();
  *v41 = v40;
  swift_release();
  return v32;
}

uint64_t type metadata accessor for BTSHeadphoneDevicePropertyObserver()
{
  uint64_t result;

  result = qword_1F02DD070;
  if (!qword_1F02DD070)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0AD374](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1DB3832D8()
{
  unint64_t result;

  result = qword_1F02DA1F8;
  if (!qword_1F02DA1F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F02DA1F8);
  }
  return result;
}

unint64_t sub_1DB383314()
{
  unint64_t result;
  unint64_t v1;

  result = qword_1F02DA208;
  if (!qword_1F02DA208)
  {
    v1 = sub_1DB3832D8();
    result = MEMORY[0x1DF0AD380](MEMORY[0x1E0DEF7F8], v1);
    atomic_store(result, (unint64_t *)&qword_1F02DA208);
  }
  return result;
}

uint64_t sub_1DB38335C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DB38339C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DB3833C0(uint64_t a1)
{
  return sub_1DB3837E8(a1, &OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_reloadAllAction);
}

uint64_t sub_1DB383478()
{
  _QWORD *v0;

  return (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))(1);
}

id sub_1DB3834EC()
{
  char *v0;
  char *v1;
  objc_super v3;

  v1 = &v0[OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_listeners];
  swift_beginAccess();
  *(_QWORD *)v1 = MEMORY[0x1E0DEE9E8];
  swift_bridgeObjectRelease();
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for BTSHeadphoneDevicePropertyObserver();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_1DB383680()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void sub_1DB3836A0()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1DB3836CC()
{
  return type metadata accessor for BTSHeadphoneDevicePropertyObserver();
}

void sub_1DB383700()
{
  unint64_t v0;

  sub_1DB383A38(319, &qword_1F02DA240, MEMORY[0x1E0DEAFA0], MEMORY[0x1E0C96198]);
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t sub_1DB3837AC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1DB3837D0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1DB3837DC(uint64_t a1)
{
  return sub_1DB3837E8(a1, &OBJC_IVAR____TtC16HeadphoneConfigs34BTSHeadphoneDevicePropertyObserver_action);
}

uint64_t sub_1DB3837E8(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t result;
  void *v5;
  void (*v6)(void);

  swift_beginAccess();
  result = MEMORY[0x1DF0AD470](v2 + 16);
  if (result)
  {
    v5 = (void *)result;
    v6 = *(void (**)(void))(result + *a2);
    swift_retain();

    v6();
    return swift_release();
  }
  return result;
}

void sub_1DB383864()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  void *v7;

  v1 = v0 + 16;
  if (qword_1F02DD050 != -1)
    swift_once();
  v2 = sub_1DB3BC0DC();
  __swift_project_value_buffer(v2, (uint64_t)qword_1F02DB098);
  v3 = sub_1DB3BC0C4();
  v4 = sub_1DB3BC484();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB30C000, v3, v4, "btsPropertyObserver: $bobbleCapability changed trigger reload", v5, 2u);
    MEMORY[0x1DF0AD404](v5, -1, -1);
  }

  swift_beginAccess();
  v6 = (_QWORD *)MEMORY[0x1DF0AD470](v1);
  if (v6)
  {
    v7 = v6;
    (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v6) + 0x100))();

  }
}

uint64_t sub_1DB383980(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1DF0AD380](a3, v6);
    atomic_store(result, a1);
  }
  return result;
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

void type metadata accessor for CBListeningMode(uint64_t a1)
{
  sub_1DB383A38(a1, &qword_1F02DA2D8, (uint64_t)&unk_1EA29BCB8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEEC78]);
}

void type metadata accessor for AAFeatureCapability(uint64_t a1)
{
  sub_1DB383A38(a1, &qword_1F02DA2E0, (uint64_t)&unk_1EA29BCD8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEEC78]);
}

void sub_1DB383A38(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

void sub_1DB383A7C()
{
  swift_deletedMethodError();
  __break(1u);
}

id sub_1DB383A94()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___stackView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___stackView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___stackView);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3CA8]), sel_init);
    objc_msgSend(v4, sel_setAxis_, 1);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v4, sel_setSpacing_, 5.0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1DB383B40()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___titleView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___titleView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___titleView);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    v5 = objc_msgSend((id)objc_opt_self(), sel__preferredFontForTextStyle_weight_, *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC1448]);
    objc_msgSend(v4, sel_setFont_, v5);

    v6 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
    objc_msgSend(v4, sel_setTextColor_, v6);

    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v7 = (void *)sub_1DB3BC31C();
    objc_msgSend(v4, sel_setText_, v7);

    objc_msgSend(v4, sel_setNumberOfLines_, 0);
    v8 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

id sub_1DB383CAC(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_1DB383CEC(a1, a2);
}

id sub_1DB383CEC(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  *(_QWORD *)&v2[OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___stackView] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___titleView] = 0;
  v3 = &v2[OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView_listTitle];
  *(_QWORD *)v3 = a1;
  *((_QWORD *)v3 + 1) = a2;
  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for NumberedBulletListContentView();
  v4 = objc_msgSendSuper2(&v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v5 = sub_1DB383A94();
  objc_msgSend(v4, sel_addSubview_, v5);

  v6 = sub_1DB383A94();
  objc_msgSend(v6, sel_pinToOther_, v4);

  v7 = sub_1DB383A94();
  v8 = sub_1DB383B40();
  objc_msgSend(v7, sel_addArrangedSubview_, v8);

  return v4;
}

uint64_t type metadata accessor for NumberedBulletListContentView()
{
  return objc_opt_self();
}

void sub_1DB383E04()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___stackView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs29NumberedBulletListContentView____lazy_storage___titleView] = 0;

  sub_1DB3BC664();
  __break(1u);
}

void sub_1DB383EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  _QWORD *v7;
  id v15;
  void *v16;
  id v17;

  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v15, sel_setNumberOfLines_, 0);
  v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))((*MEMORY[0x1E0DEEDD8] & *v7) + 0xA8))(a1, a2, a3, a4, a5, a6, a7);
  objc_msgSend(v15, sel_setAttributedText_, v16);

  v17 = sub_1DB383A94();
  objc_msgSend(v17, sel_addArrangedSubview_, v15);

}

char *sub_1DB384018(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t inited;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char *result;
  id v49;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAE70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DB3C16B0;
  v11 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  v12 = sub_1DB38507C(0, &qword_1F02DA300);
  *(_QWORD *)(inited + 40) = a6;
  v13 = (void *)*MEMORY[0x1E0DC1140];
  *(_QWORD *)(inited + 64) = v12;
  *(_QWORD *)(inited + 72) = v13;
  *(_QWORD *)(inited + 104) = sub_1DB38507C(0, &qword_1F02DA308);
  *(_QWORD *)(inited + 80) = a7;
  v14 = v11;
  v15 = a6;
  v16 = v13;
  v17 = a7;
  sub_1DB384594(inited);
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC1288]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1DB3C1800;
  v20 = objc_allocWithZone(MEMORY[0x1E0DC1328]);
  type metadata accessor for OptionKey(0);
  sub_1DB384718(&qword_1F02DA310, (uint64_t (*)(uint64_t))type metadata accessor for OptionKey, (uint64_t)&unk_1DB3C1B44);
  v21 = (void *)sub_1DB3BC2EC();
  v22 = objc_msgSend(v20, sel_initWithTextAlignment_location_options_, 4, v21, a1);

  *(_QWORD *)(v19 + 32) = v22;
  sub_1DB3BC3DC();
  sub_1DB38507C(0, &qword_1F02DA318);
  v23 = (void *)sub_1DB3BC3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setTabStops_, v23);

  objc_msgSend(v18, sel_setDefaultTabInterval_, a1);
  objc_msgSend(v18, sel_setHeadIndent_, a1);
  swift_bridgeObjectRetain();
  sub_1DB3BC388();
  sub_1DB3BC388();
  sub_1DB3BC388();
  v24 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
  v25 = (void *)sub_1DB3BC31C();
  v26 = objc_msgSend(v24, sel_initWithString_, v25);

  v27 = swift_initStackObject();
  *(_OWORD *)(v27 + 16) = xmmword_1DB3C1810;
  v28 = (void *)*MEMORY[0x1E0DC1178];
  *(_QWORD *)(v27 + 32) = *MEMORY[0x1E0DC1178];
  *(_QWORD *)(v27 + 64) = sub_1DB38507C(0, &qword_1F02DA320);
  *(_QWORD *)(v27 + 40) = v18;
  v29 = v28;
  v49 = v18;
  sub_1DB384594(v27);
  type metadata accessor for Key(0);
  sub_1DB384718(&qword_1F02DA328, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1DB3C1B00);
  v30 = (void *)sub_1DB3BC2EC();
  swift_bridgeObjectRelease();
  objc_msgSend(v26, sel_addAttributes_range_, v30, 0, objc_msgSend(v26, sel_length));

  v31 = (void *)sub_1DB3BC2EC();
  objc_msgSend(v26, sel_addAttributes_range_, v31, 0, objc_msgSend(v26, sel_length));

  v32 = objc_allocWithZone(MEMORY[0x1E0CB3940]);
  v33 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  v34 = objc_msgSend(v32, sel_initWithString_, v33);

  v35 = (void *)sub_1DB3BC31C();
  v36 = objc_msgSend(v34, sel_rangeOfString_, v35);
  v38 = v37;

  v39 = (void *)sub_1DB3BC2EC();
  swift_bridgeObjectRelease();
  objc_msgSend(v26, sel_addAttributes_range_, v39, v36, v38);

  v40 = objc_msgSend(v26, sel_string);
  v41 = sub_1DB3BC340();
  v43 = v42;

  v44 = sub_1DB384758(v41, v43);
  v46 = v45;
  swift_bridgeObjectRelease();
  if (!v46)
    goto LABEL_8;
  if (v44 == 10 && v46 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v47 = sub_1DB3BC6D0();
    swift_bridgeObjectRelease();
    if ((v47 & 1) == 0)
    {
LABEL_8:

      return (char *)v26;
    }
  }
  result = (char *)objc_msgSend(v26, sel_length);
  if (!__OFSUB__(result, 1))
  {
    objc_msgSend(v26, sel_deleteCharactersInRange_, result - 1, 1);
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

unint64_t sub_1DB384594(uint64_t a1)
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
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAEA0);
  v2 = sub_1DB3BC694();
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
    sub_1DB385A60(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_1DB3859E0(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_1DB385AA8(&v14, (_OWORD *)(v3[7] + 32 * result));
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

void type metadata accessor for OptionKey(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DA3B0);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DA3B8);
}

void sub_1DB3846D4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1DB384718(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1DF0AD380](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DB384758(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return 0;
  sub_1DB3BC37C();
  return sub_1DB3BC3A0();
}

void sub_1DB3847D4()
{
  sub_1DB385380();
}

id sub_1DB384804()
{
  return sub_1DB3853EC(type metadata accessor for NumberedBulletListContentView);
}

id sub_1DB38485C()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v0;
}

id sub_1DB3848A4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___numberedBulletedList;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___numberedBulletedList);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___numberedBulletedList);
  }
  else
  {
    v4 = v0;
    v5 = v0 + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_listTitle;
    v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_listTitle);
    v7 = *(_QWORD *)(v5 + 8);
    objc_allocWithZone((Class)type metadata accessor for NumberedBulletListContentView());
    swift_bridgeObjectRetain();
    v8 = sub_1DB383CEC(v6, v7);
    objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v9 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

id sub_1DB384950()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___iconView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___iconView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___iconView);
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_self(), sel_configurationWithPointSize_weight_, 4, 39.0);
    swift_bridgeObjectRetain();
    v5 = v4;
    v6 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
    v7 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v6, v5);

    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithImage_, v7);
    v9 = objc_msgSend((id)objc_opt_self(), sel_systemGray2Color);
    objc_msgSend(v8, sel_setTintColor_, v9);

    objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    LODWORD(v10) = 1148846080;
    objc_msgSend(v8, sel_setContentHuggingPriority_forAxis_, 1, v10);
    LODWORD(v11) = 1148846080;
    objc_msgSend(v8, sel_setContentHuggingPriority_forAxis_, 0, v11);
    LODWORD(v12) = 1148846080;
    objc_msgSend(v8, sel_setContentCompressionResistancePriority_forAxis_, 0, v12);
    LODWORD(v13) = 1148846080;
    objc_msgSend(v8, sel_setContentCompressionResistancePriority_forAxis_, 1, v13);

    v14 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v8;
    v3 = v8;

    v2 = 0;
  }
  v15 = v2;
  return v3;
}

char *sub_1DB384B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return sub_1DB384B88(a1, a2, a3, a4);
}

char *sub_1DB384B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v9;
  id v10;
  char *v11;
  id v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  char *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  id v52;
  objc_super v53;

  v9 = OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_containerView;
  v10 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v11 = v4;
  v12 = objc_msgSend(v10, sel_init);
  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v4[v9] = v12;
  *(_QWORD *)&v11[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___numberedBulletedList] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___iconView] = 0;
  v13 = &v11[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_listTitle];
  *(_QWORD *)v13 = a1;
  *((_QWORD *)v13 + 1) = a2;
  v14 = &v11[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_symbol];
  *(_QWORD *)v14 = a3;
  *((_QWORD *)v14 + 1) = a4;

  v53.receiver = v11;
  v53.super_class = (Class)type metadata accessor for IconWithNumberedBulletList();
  v15 = (char *)objc_msgSendSuper2(&v53, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v16 = OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_containerView;
  v17 = *(void **)&v15[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_containerView];
  v18 = v15;
  v19 = v17;
  v20 = sub_1DB384950();
  objc_msgSend(v19, sel_addSubview_, v20);

  v21 = *(id *)&v15[v16];
  v22 = sub_1DB3848A4();
  objc_msgSend(v21, (SEL)&ResourceBundleClass, v22);

  v52 = (id)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1DB3C1820;
  v24 = sub_1DB384950();
  v25 = objc_msgSend(v24, sel_leadingAnchor);

  v26 = objc_msgSend(*(id *)&v15[v16], sel_leadingAnchor);
  v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v26, 15.0);

  *(_QWORD *)(v23 + 32) = v27;
  v28 = sub_1DB384950();
  v29 = objc_msgSend(v28, sel_topAnchor);

  v30 = objc_msgSend(*(id *)&v15[v16], sel_topAnchor);
  v31 = objc_msgSend(v29, sel_constraintEqualToAnchor_, v30);

  *(_QWORD *)(v23 + 40) = v31;
  v32 = sub_1DB3848A4();
  v33 = objc_msgSend(v32, sel_leadingAnchor);

  v34 = sub_1DB384950();
  v35 = objc_msgSend(v34, sel_trailingAnchor);

  v36 = objc_msgSend(v33, sel_constraintEqualToAnchor_constant_, v35, 24.0);
  *(_QWORD *)(v23 + 48) = v36;
  v37 = sub_1DB3848A4();
  v38 = objc_msgSend(v37, sel_topAnchor);

  v39 = objc_msgSend(*(id *)&v15[v16], sel_topAnchor);
  v40 = objc_msgSend(v38, sel_constraintEqualToAnchor_, v39);

  *(_QWORD *)(v23 + 56) = v40;
  v41 = sub_1DB3848A4();
  v42 = objc_msgSend(v41, sel_trailingAnchor);

  v43 = objc_msgSend(*(id *)&v15[v16], sel_trailingAnchor);
  v44 = objc_msgSend(v42, sel_constraintEqualToAnchor_constant_, v43, 10.0);

  *(_QWORD *)(v23 + 64) = v44;
  v45 = sub_1DB3848A4();
  v46 = objc_msgSend(v45, sel_bottomAnchor);

  v47 = objc_msgSend(*(id *)&v15[v16], sel_bottomAnchor);
  v48 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v47);

  *(_QWORD *)(v23 + 72) = v48;
  sub_1DB3BC3DC();
  sub_1DB38507C(0, (unint64_t *)&qword_1F02DA358);
  v49 = (void *)sub_1DB3BC3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v52, sel_activateConstraints_, v49);

  objc_msgSend(v18, sel_addSubview_, *(_QWORD *)&v15[v16]);
  v50 = *(id *)&v15[v16];
  objc_msgSend(v50, sel_pinToOther_, v18);

  return v18;
}

uint64_t type metadata accessor for IconWithNumberedBulletList()
{
  return objc_opt_self();
}

uint64_t sub_1DB38507C(uint64_t a1, unint64_t *a2)
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

id sub_1DB3850B4(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_1DB3850F4()
{
  char *v0;
  uint64_t v1;
  id v2;

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList_containerView;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v0[v1] = v2;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___numberedBulletedList] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs26IconWithNumberedBulletList____lazy_storage___iconView] = 0;

  sub_1DB3BC664();
  __break(1u);
}

void sub_1DB385270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7)
{
  _QWORD *v14;

  v14 = sub_1DB3848A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))((*MEMORY[0x1E0DEEDD8] & *v14)
                                                                                       + 0xA0))(a1, a2, a3, a4, a5, a6, a7);

}

id sub_1DB385318(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void sub_1DB385368()
{
  sub_1DB385380();
}

void sub_1DB385380()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1DB3853B8()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1DB3853E0()
{
  return sub_1DB3853EC(type metadata accessor for IconWithNumberedBulletList);
}

id sub_1DB3853EC(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1DB38548C(uint64_t a1, uint64_t a2)
{
  return sub_1DB385568(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1DB3854AC(uint64_t a1, uint64_t a2)
{
  return sub_1DB385568(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1DB3854B8()
{
  sub_1DB3BC340();
  sub_1DB3BC370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DB3854F8()
{
  uint64_t v0;

  sub_1DB3BC340();
  sub_1DB3BC70C();
  sub_1DB3BC370();
  v0 = sub_1DB3BC724();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1DB385568(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1DB3BC340();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1DB3855A4(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1DB3BC328();
  *a2 = 0;
  return result;
}

uint64_t sub_1DB385618(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1DB3BC334();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1DB385694@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1DB3BC340();
  v2 = sub_1DB3BC31C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1DB3856D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1DB3BC340();
  v2 = v1;
  if (v0 == sub_1DB3BC340() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1DB3BC6D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1DB385764()
{
  sub_1DB384718(&qword_1F02DA328, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1DB3C1B00);
  sub_1DB384718(&qword_1F02DA3E8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1DB3C1954);
  return sub_1DB3BC6AC();
}

uint64_t sub_1DB3857E8()
{
  return sub_1DB384718((unint64_t *)&unk_1F02DAEC0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1DB3C1918);
}

uint64_t sub_1DB385814()
{
  return sub_1DB384718(&qword_1F02DA3C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1DB3C18EC);
}

uint64_t sub_1DB385840@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1DB3BC31C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1DB385884@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1DB3BC340();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DB3858AC()
{
  sub_1DB384718(&qword_1F02DA310, (uint64_t (*)(uint64_t))type metadata accessor for OptionKey, (uint64_t)&unk_1DB3C1B44);
  sub_1DB384718(&qword_1F02DA3E0, (uint64_t (*)(uint64_t))type metadata accessor for OptionKey, (uint64_t)&unk_1DB3C1A60);
  return sub_1DB3BC6AC();
}

uint64_t sub_1DB385930()
{
  return sub_1DB384718(&qword_1F02DA3C8, (uint64_t (*)(uint64_t))type metadata accessor for OptionKey, (uint64_t)&unk_1DB3C1A28);
}

uint64_t sub_1DB38595C()
{
  return sub_1DB384718(&qword_1F02DA3D0, (uint64_t (*)(uint64_t))type metadata accessor for OptionKey, (uint64_t)&unk_1DB3C1A00);
}

uint64_t sub_1DB385988()
{
  return sub_1DB384718((unint64_t *)&unk_1F02DAED0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_1DB3C1988);
}

uint64_t sub_1DB3859B4()
{
  return sub_1DB384718(&qword_1F02DA3D8, (uint64_t (*)(uint64_t))type metadata accessor for OptionKey, (uint64_t)&unk_1DB3C1A90);
}

unint64_t sub_1DB3859E0(uint64_t a1)
{
  uint64_t v2;

  sub_1DB3BC340();
  sub_1DB3BC70C();
  sub_1DB3BC370();
  v2 = sub_1DB3BC724();
  swift_bridgeObjectRelease();
  return sub_1DB385AB8(a1, v2);
}

uint64_t sub_1DB385A60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA3F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_1DB385AA8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1DB385AB8(uint64_t a1, uint64_t a2)
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
    v6 = sub_1DB3BC340();
    v8 = v7;
    if (v6 == sub_1DB3BC340() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_1DB3BC6D0();
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
          v13 = sub_1DB3BC340();
          v15 = v14;
          if (v13 == sub_1DB3BC340() && v15 == v16)
            break;
          v18 = sub_1DB3BC6D0();
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

uint64_t sub_1DB385C38()
{
  uint64_t v0;

  v0 = sub_1DB3BC0DC();
  __swift_allocate_value_buffer(v0, qword_1F02DB0B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB0B8);
  return sub_1DB3BC0D0();
}

uint64_t sub_1DB385CAC()
{
  uint64_t v0;

  if (qword_1F02DD680 != -1)
    swift_once();
  v0 = sub_1DB3BC0DC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB0B8);
}

uint64_t sub_1DB385CF4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F02DD680 != -1)
    swift_once();
  v2 = sub_1DB3BC0DC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02DB0B8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DB385D64()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for HPSAdaptiveVolumeSliderCell();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1DB3BBC8C();

  return v2;
}

uint64_t type metadata accessor for HPSAdaptiveVolumeSliderCell()
{
  return objc_opt_self();
}

uint64_t AAAutoANCStrength.description.getter(int a1)
{
  uint64_t result;

  if (a1 > 1049)
  {
    if (a1 == 1050)
      return 0x6D756964656DLL;
    if (a1 == 1100)
      return 1751607624;
  }
  else
  {
    if (!a1)
      return 1061109567;
    if (a1 == 1000)
      return 7827308;
  }
  type metadata accessor for AAAutoANCStrength();
  result = sub_1DB3BC6DC();
  __break(1u);
  return result;
}

void type metadata accessor for AAAutoANCStrength()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1F02DA4D8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1F02DA4D8);
  }
}

uint64_t sub_1DB385F2C(int a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = 0;
  if (a1 <= 1049)
  {
    if (a1)
    {
      if (a1 == 1000)
        return 2;
      goto LABEL_9;
    }
    return v1;
  }
  if (a1 == 1100)
    return v1;
  if (a1 == 1050)
    return 1;
LABEL_9:
  type metadata accessor for AAAutoANCStrength();
  result = sub_1DB3BC6DC();
  __break(1u);
  return result;
}

uint64_t sub_1DB385FA4()
{
  int *v0;

  return AAAutoANCStrength.description.getter(*v0);
}

uint64_t sub_1DB385FAC()
{
  int *v0;
  uint64_t v1;
  int v2;
  uint64_t result;

  v1 = 0;
  v2 = *v0;
  if (*v0 > 1049)
  {
    if (v2 == 1100)
      return v1;
    if (v2 == 1050)
      return 1;
  }
  else
  {
    if (!v2)
      return v1;
    if (v2 == 1000)
      return 2;
  }
  result = sub_1DB3BC6DC();
  __break(1u);
  return result;
}

id sub_1DB38601C()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(_QWORD *, _QWORD);
  void *v25;
  id v26;
  _QWORD v28[4];

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider;
  v2 = *(void **)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider);
  if (v2)
  {
    v3 = *(id *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider);
  }
  else
  {
    v4 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA520);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1DB3C1B90;
    type metadata accessor for HPSAdaptiveVolumeSliderCell();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v7 = (void *)objc_opt_self();
    v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
    v9 = sub_1DB3BBC8C();
    v11 = v10;

    *(_QWORD *)(v5 + 32) = v9;
    *(_QWORD *)(v5 + 40) = v11;
    v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
    v13 = sub_1DB3BBC8C();
    v15 = v14;

    *(_QWORD *)(v5 + 48) = v13;
    *(_QWORD *)(v5 + 56) = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA528);
    v16 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
    v17 = sub_1DB3BBC8C();
    v19 = v18;

    *(_QWORD *)(v5 + 64) = v17;
    *(_QWORD *)(v5 + 72) = v19;
    v20 = (void *)sub_1DB3A257C(v5, (unint64_t)&unk_1EA29BDE8);
    objc_msgSend(v20, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0, 0xE000000000000000);
    sub_1DB383980(&qword_1F02DA530, &qword_1F02DA528, (uint64_t)&unk_1DB3C2350);
    v28[0] = sub_1DB3BC1C0();
    v21 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v22 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = v21;
    *(_QWORD *)(v23 + 24) = v22;
    sub_1DB3BC1D8();
    sub_1DB3BC274();
    swift_release();
    swift_release();
    v24 = (void (*)(_QWORD *, _QWORD))(*(uint64_t (**)(_QWORD *))((*MEMORY[0x1E0DEEDD8] & *v4)
                                                                                     + 0x90))(v28);
    sub_1DB3BC1A8();
    swift_release();
    v24(v28, 0);
    v25 = *(void **)((char *)v4 + v1);
    *(_QWORD *)((char *)v4 + v1) = v20;
    v3 = v20;

    v2 = 0;
  }
  v26 = v2;
  return v3;
}

void sub_1DB3863A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  int v30;
  uint64_t v31;
  uint64_t v32;

  v4 = sub_1DB3BC0DC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v8 = MEMORY[0x1DF0AD470](a1 + 16);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = *(void **)(v8 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice);
    if (!v10 || (swift_beginAccess(), (v11 = MEMORY[0x1DF0AD470](a2 + 16)) == 0))
    {

      return;
    }
    v12 = (void *)v11;
    v13 = qword_1F02DD680;
    v14 = v10;
    if (v13 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v4, (uint64_t)qword_1F02DB0B8);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v15, v4);
    v16 = v12;
    v17 = sub_1DB3BC0C4();
    v18 = sub_1DB3BC484();
    v19 = os_log_type_enabled(v17, v18);
    v20 = (_QWORD *)MEMORY[0x1E0DEEDD8];
    if (!v19)
    {

      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
LABEL_19:
      sub_1DB3BBE24();
      (*(void (**)(uint64_t *__return_ptr))((*v20 & *v16) + 0xC0))(&v32);
      sub_1DB3BBFD4();
      swift_release();

      return;
    }
    v21 = swift_slowAlloc();
    v28 = swift_slowAlloc();
    v32 = v28;
    *(_DWORD *)v21 = 136315394;
    v31 = sub_1DB388E4C(0x726564696C73, 0xE600000000000000, &v32);
    v22 = sub_1DB3BC58C();
    *(_WORD *)(v21 + 12) = 2080;
    (*(void (**)(uint64_t *__return_ptr, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v16) + 0xC0))(&v31, v22);
    v23 = v31;
    v29 = v14;
    if ((int)v31 > 1049)
    {
      if ((_DWORD)v31 == 1050)
      {
        v24 = 0xE600000000000000;
        v25 = 0x6D756964656DLL;
        goto LABEL_18;
      }
      if ((_DWORD)v31 == 1100)
      {
        v24 = 0xE400000000000000;
        v25 = 1751607624;
        goto LABEL_18;
      }
    }
    else
    {
      if (!(_DWORD)v31)
      {
        v24 = 0xE400000000000000;
        v25 = 1061109567;
LABEL_18:
        v31 = sub_1DB388E4C(v25, v24, &v32);
        sub_1DB3BC58C();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1DB30C000, v17, v18, "%s: HPSAdaptiveVolumeSliderCell %s", (uint8_t *)v21, 0x16u);
        v26 = v28;
        swift_arrayDestroy();
        MEMORY[0x1DF0AD404](v26, -1, -1);
        MEMORY[0x1DF0AD404](v21, -1, -1);

        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        v14 = v29;
        v20 = (_QWORD *)MEMORY[0x1E0DEEDD8];
        goto LABEL_19;
      }
      if ((_DWORD)v31 == 1000)
      {
        v24 = 0xE300000000000000;
        v25 = 7827308;
        goto LABEL_18;
      }
    }

    type metadata accessor for AAAutoANCStrength();
    v30 = v23;
    sub_1DB3BC6DC();
    __break(1u);
  }
}

void sub_1DB38675C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider) = a1;

}

void (*sub_1DB386770(id *a1))(uint64_t *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = sub_1DB38601C();
  return sub_1DB3867A4;
}

void sub_1DB3867A4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *a1;
  v1 = a1[1];
  v3 = *(void **)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider) = v2;

}

uint64_t sub_1DB3867BC()
{
  return sub_1DB3879E0();
}

uint64_t sub_1DB3867C8(uint64_t a1)
{
  return sub_1DB387A30(a1, &OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_listeners);
}

uint64_t (*sub_1DB3867D4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_1DB386818(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  void (*v35)(id *, _QWORD);
  id v36;
  id v37;
  unint64_t v38;
  uint64_t (*v39)(void);
  void *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  void *v48;
  id v49;
  int v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  char *v82;
  uint64_t v83;
  _QWORD *v84;
  void *v85;
  __int128 v86;
  __int128 v87;
  id v88[3];
  uint64_t v89;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA408);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA410);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DB3BC544();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA418);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA420);
  v83 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v82 = (char *)&v76 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (objc_msgSend(a1, sel_userInfo))
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    v86 = 0u;
    v87 = 0u;
  }
  sub_1DB3872D4((uint64_t)&v86, (uint64_t)v88);
  if (!v89)
    goto LABEL_16;
  sub_1DB38507C(0, &qword_1F02DA428);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_17;
  v80 = v16;
  v18 = v85;
  v19 = (void *)sub_1DB3BC31C();
  v81 = v18;
  v20 = objc_msgSend(v18, sel_objectForKey_, v19);

  if (v20)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    v86 = 0u;
    v87 = 0u;
  }
  sub_1DB3872D4((uint64_t)&v86, (uint64_t)v88);
  if (!v89)
  {

LABEL_16:
    sub_1DB3894E4((uint64_t)v88, (uint64_t *)&unk_1F02DAD60);
    goto LABEL_17;
  }
  sub_1DB3BBF68();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v78 = v13;
    v22 = v84;
    v21 = v85;
    v23 = OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice;
    v24 = *(void **)((char *)v84 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice);
    *(_QWORD *)((char *)v84 + OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice) = v85;
    v77 = v21;

    v79 = v23;
    v25 = *(void **)((char *)v22 + v23);
    if (v25)
    {
      v26 = v25;
      sub_1DB3BBE24();

      sub_1DB3BBFE0();
      swift_release();
      sub_1DB3BC538();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
      v88[0] = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
      v27 = sub_1DB3BC52C();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v4, 1, 1, v27);
      sub_1DB38507C(0, &qword_1F02DA438);
      sub_1DB383980(&qword_1F02DA440, &qword_1F02DA418, MEMORY[0x1E0D28818]);
      sub_1DB38948C();
      v28 = v82;
      sub_1DB3BC244();
      sub_1DB3894E4((uint64_t)v4, &qword_1F02DA408);

      sub_1DB3894E4((uint64_t)v7, &qword_1F02DA410);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      (*(void (**)(char *, uint64_t))(v78 + 8))(v15, v12);
      v29 = swift_allocObject();
      v30 = v84;
      swift_unknownObjectWeakInit();
      v31 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v32 = swift_allocObject();
      *(_QWORD *)(v32 + 16) = v29;
      *(_QWORD *)(v32 + 24) = v31;
      sub_1DB383980(&qword_1F02DA450, &qword_1F02DA420, MEMORY[0x1E0C95A20]);
      v33 = v80;
      sub_1DB3BC274();
      swift_release();
      (*(void (**)(char *, uint64_t))(v83 + 8))(v28, v33);
      v34 = (_QWORD *)MEMORY[0x1E0DEEDD8];
      v35 = (void (*)(id *, _QWORD))(*(uint64_t (**)(id *))((*MEMORY[0x1E0DEEDD8] & *v30) + 0x90))(v88);
      sub_1DB3BC1A8();
      swift_release();
      v35(v88, 0);
      v36 = objc_msgSend(v30, sel_contentView);
      v37 = objc_msgSend(v36, sel_subviews);

      sub_1DB38507C(0, &qword_1F02DA458);
      v38 = sub_1DB3BC3C4();

      v39 = *(uint64_t (**)(void))((*v34 & *v30) + 0x68);
      v40 = (void *)v39();
      LOBYTE(v33) = sub_1DB38731C((uint64_t)v40, v38);

      v41 = swift_bridgeObjectRelease();
      v42 = (_QWORD *)((uint64_t (*)(uint64_t))v39)(v41);
      v43 = v42;
      if ((v33 & 1) != 0)
      {
        objc_msgSend(v42, sel_layoutIfNeeded);

        objc_msgSend(v30, sel_layoutIfNeeded);
      }
      else
      {
        v49 = v77;
        sub_1DB3BBE24();
        v50 = sub_1DB3BBFC8();
        swift_release();
        LODWORD(v88[0]) = v50;
        (*(void (**)(id *))((*v34 & *v43) + 0xC8))(v88);

        v51 = objc_msgSend(v30, sel_contentView);
        v52 = (void *)v39();
        objc_msgSend(v51, sel_addSubview_, v52);

        v53 = (void *)objc_opt_self();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
        v54 = swift_allocObject();
        *(_OWORD *)(v54 + 16) = xmmword_1DB3C1BA0;
        v55 = (void *)v39();
        v56 = objc_msgSend(v55, sel_topAnchor);

        v57 = objc_msgSend(v30, sel_contentView);
        v58 = objc_msgSend(v57, sel_topAnchor);

        v59 = objc_msgSend(v56, sel_constraintEqualToAnchor_constant_, v58, 0.0);
        *(_QWORD *)(v54 + 32) = v59;
        v60 = (void *)v39();
        v61 = objc_msgSend(v60, sel_leadingAnchor);

        v62 = objc_msgSend(v30, sel_contentView);
        v63 = objc_msgSend(v62, sel_leadingAnchor);

        v64 = objc_msgSend(v61, sel_constraintEqualToAnchor_constant_, v63, 20.0);
        *(_QWORD *)(v54 + 40) = v64;
        v65 = (void *)v39();
        v66 = objc_msgSend(v65, sel_trailingAnchor);

        v67 = objc_msgSend(v30, sel_contentView);
        v68 = objc_msgSend(v67, sel_trailingAnchor);

        v69 = objc_msgSend(v66, sel_constraintEqualToAnchor_constant_, v68, -20.0);
        *(_QWORD *)(v54 + 48) = v69;
        v70 = (void *)v39();
        v71 = objc_msgSend(v70, sel_bottomAnchor);

        v72 = objc_msgSend(v30, sel_contentView);
        v73 = objc_msgSend(v72, sel_bottomAnchor);

        v74 = objc_msgSend(v71, sel_constraintEqualToAnchor_constant_, v73, 0.0);
        *(_QWORD *)(v54 + 56) = v74;
        v88[0] = (id)v54;
        sub_1DB3BC3DC();
        sub_1DB38507C(0, (unint64_t *)&qword_1F02DA358);
        v75 = (void *)sub_1DB3BC3B8();
        swift_bridgeObjectRelease();
        objc_msgSend(v53, sel_activateConstraints_, v75);

      }
      return;
    }
LABEL_26:
    __break(1u);
    return;
  }

LABEL_17:
  if (qword_1F02DD680 != -1)
    swift_once();
  v44 = sub_1DB3BC0DC();
  __swift_project_value_buffer(v44, (uint64_t)qword_1F02DB0B8);
  v45 = sub_1DB3BC0C4();
  v46 = sub_1DB3BC478();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    v48 = (void *)swift_slowAlloc();
    v88[0] = v48;
    *(_DWORD *)v47 = 136315138;
    *(_QWORD *)&v86 = sub_1DB388E4C(0xD00000000000001ALL, 0x80000001DB3C9670, (uint64_t *)v88);
    sub_1DB3BC58C();
    _os_log_impl(&dword_1DB30C000, v45, v46, "%s HPSAdaptiveVolumeSliderCell Depedencies not meet, bailing out of HPSAdaptiveVolumeSliderCell refresh", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v48, -1, -1);
    MEMORY[0x1DF0AD404](v47, -1, -1);
  }

}

uint64_t sub_1DB3872D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DB38731C(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char v14;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1DB3BC670())
  {
    v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x1DF0AC9FC](0, a2);
LABEL_5:
      v6 = v5;
      sub_1DB38507C(0, &qword_1F02DA458);
      v7 = sub_1DB3BC508();

      if ((v7 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = 5;
      while (1)
      {
        v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
          break;
        v13 = *(id *)(a2 + 8 * v4);
        v14 = sub_1DB3BC508();

        if ((v14 & 1) != 0)
          goto LABEL_6;
        ++v4;
        if (v12 == v3)
          goto LABEL_18;
      }
      __break(1u);
    }
    v9 = 1;
    while (1)
    {
      MEMORY[0x1DF0AC9FC](v9, a2);
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v11 = sub_1DB3BC508();
      swift_unknownObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_6;
      ++v9;
      if (v10 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

id sub_1DB3874E8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_class *v4;
  objc_class *v5;
  void *v8;
  id v9;

  v5 = v4;
  if (a3)
  {
    v8 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(objc_allocWithZone(v5), sel_initWithStyle_reuseIdentifier_specifier_, a1, v8, a4);

  return v9;
}

id sub_1DB387574(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  char *v4;
  void *v7;
  id v8;
  id v9;
  objc_super v11;

  *(_QWORD *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_listeners] = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice] = 0;
  if (a3)
  {
    v7 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for HPSAdaptiveVolumeSliderCell();
  v8 = objc_msgSendSuper2(&v11, sel_initWithStyle_reuseIdentifier_specifier_, a1, v7, a4);

  v9 = v8;
  if (v9)

  return v9;
}

id sub_1DB3876B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a3)
  {
    v6 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id sub_1DB387728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  void *v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_listeners] = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice] = 0;
  if (a3)
  {
    v5 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for HPSAdaptiveVolumeSliderCell();
  v6 = objc_msgSendSuper2(&v8, sel_initWithStyle_reuseIdentifier_, a1, v5);

  return v6;
}

id sub_1DB387898(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell____lazy_storage___slider] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_listeners] = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs27HPSAdaptiveVolumeSliderCell_headphoneDevice] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HPSAdaptiveVolumeSliderCell();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_1DB387980()
{
  return sub_1DB3853EC(type metadata accessor for HPSAdaptiveVolumeSliderCell);
}

uint64_t sub_1DB3879D4()
{
  return sub_1DB3879E0();
}

uint64_t sub_1DB3879E0()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DB387A24(uint64_t a1)
{
  return sub_1DB387A30(a1, &OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_listeners);
}

uint64_t sub_1DB387A30(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DB387A7C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1DB387AC0(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id sub_1DB387B34(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  void *v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_listeners] = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection] = 0;
  if (a2)
  {
    v5 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for HPSAdaptiveVolumeDetailController();
  v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

void sub_1DB387C38()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_listeners] = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection] = 0;

  sub_1DB3BC664();
  __break(1u);
}

uint64_t sub_1DB387D54()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t ObjCClassFromMetadata;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  __n128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[4];
  _QWORD v21[20];

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection;
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection])
  {
    v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection];
  }
  else
  {
    v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4F8);
    type metadata accessor for HPSAdaptiveVolumeSliderCell();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v6 = sub_1DB3BBC8C();
    v8 = v7;

    v9 = sub_1DB38CD8C();
    v11 = sub_1DB38CD98(v9, v10, v6, v8);
    v12 = (*(uint64_t (**)(void (*)(void *), _QWORD))(*(_QWORD *)v11 + 144))(sub_1DB387F84, 0);
    swift_release();
    v20[3] = type metadata accessor for HPSAdaptiveVolumeDetailController();
    v20[0] = v0;
    v13 = v0;
    v14 = sub_1DB38CB14();
    v15 = sub_1DB38CCD8(0, 0, 0, 0, (uint64_t)v20, 0, 0, -1, (uint64_t)v21, 0, v14 & 1, 0, 0, (__n128)0, 0);
    v16 = (*(uint64_t (**)(_QWORD *, __n128))(*(_QWORD *)v12 + 160))(v21, v15);
    swift_release();
    sub_1DB389DF8(v21);
    v21[2] = v13;
    v17 = (*(uint64_t (**)(void (*)(void *), _QWORD *))(*(_QWORD *)v16 + 168))(sub_1DB389E2C, v21);
    v18 = swift_release();
    v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v17 + 176))(v18);
    swift_release();
    *(_QWORD *)&v3[v1] = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

void sub_1DB387F84(void *a1)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  id v4;

  type metadata accessor for HPSAdaptiveVolumeSliderCell();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1DB3BBC8C();

  v4 = (id)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setProperty_forKey_, v4, *MEMORY[0x1E0D80848], 0xE000000000000000);

}

unint64_t sub_1DB38807C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA510);
  v2 = (_QWORD *)sub_1DB3BC694();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_1DB389660(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
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

uint64_t sub_1DB388194(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DB3881AC(uint64_t *a1))(_QWORD *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1DB387D54();
  return sub_1DB3881E0;
}

uint64_t sub_1DB3881E0(_QWORD *a1)
{
  *(_QWORD *)(a1[1]
            + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController____lazy_storage___sliderSection) = *a1;
  return swift_bridgeObjectRelease();
}

void sub_1DB3881F8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  objc_class *v16;
  id v17;
  uint64_t ObjCClassFromMetadata;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  objc_super v34;
  id v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38[3];
  uint64_t v39;

  v1 = v0;
  v2 = sub_1DB3BC0DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v0, sel_specifier);
  if (!v6)
  {
    __break(1u);
    return;
  }
  v7 = v6;
  v8 = objc_msgSend(v6, sel_userInfo);

  if (v8)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    v36 = 0u;
    v37 = 0u;
  }
  sub_1DB3872D4((uint64_t)&v36, (uint64_t)v38);
  if (!v39)
  {
LABEL_15:
    sub_1DB3894E4((uint64_t)v38, (uint64_t *)&unk_1F02DAD60);
    goto LABEL_16;
  }
  sub_1DB38507C(0, &qword_1F02DA428);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v9 = v35;
    v10 = (void *)sub_1DB3BC31C();
    v11 = objc_msgSend(v9, sel_objectForKey_, v10);

    if (v11)
    {
      sub_1DB3BC5B0();
      swift_unknownObjectRelease();
    }
    else
    {
      v36 = 0u;
      v37 = 0u;
    }
    sub_1DB3872D4((uint64_t)&v36, (uint64_t)v38);
    if (v39)
    {
      sub_1DB38507C(0, (unint64_t *)&qword_1F02DA478);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v12 = v35;
        v13 = objc_msgSend(v35, sel_headphoneDevice);
        if (v13)
        {
          v14 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice];
          *(_QWORD *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice] = v13;
          v15 = v13;

          v16 = (objc_class *)type metadata accessor for HPSAdaptiveVolumeDetailController();
          v34.receiver = v1;
          v34.super_class = v16;
          objc_msgSendSuper2(&v34, sel_viewDidLoad);
          v17 = objc_msgSend(v1, sel_navigationItem);
          type metadata accessor for HPSAdaptiveVolumeSliderCell();
          ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
          v19 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
          sub_1DB3BBC8C();

          v20 = (void *)sub_1DB3BC31C();
          swift_bridgeObjectRelease();
          objc_msgSend(v17, sel_setTitle_, v20);

          return;
        }

      }
      else
      {

      }
      goto LABEL_16;
    }

    goto LABEL_15;
  }
LABEL_16:
  if (qword_1F02DD680 != -1)
    swift_once();
  v21 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02DB0B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v21, v2);
  v22 = sub_1DB3BC0C4();
  v23 = sub_1DB3BC478();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v33 = v5;
    v26 = v25;
    v38[0] = v25;
    *(_DWORD *)v24 = 136315394;
    *(_QWORD *)&v36 = sub_1DB388E4C(0x4C64694477656976, 0xED0000292864616FLL, v38);
    sub_1DB3BC58C();
    *(_WORD *)(v24 + 12) = 2080;
    sub_1DB3BBF98();
    v27 = (void *)sub_1DB3BBF8C();
    sub_1DB3BBF80();

    sub_1DB3BBF68();
    v28 = sub_1DB3BC310();
    v32 = v2;
    v30 = v29;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v36 = sub_1DB388E4C(v28, v30, v38);
    sub_1DB3BC58C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1DB30C000, v22, v23, "%s: HPSAdaptiveVolumeDetailController Depedencies not meet! %s", (uint8_t *)v24, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v26, -1, -1);
    MEMORY[0x1DF0AD404](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v33, v32);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_1DB38878C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v1 = v0;
  v2 = sub_1DB3BC0DC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice))
  {
    v7 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))(v4);
    v27 = MEMORY[0x1E0DEE9D8];
    sub_1DB3897A4(v7);
    v8 = v27;
    sub_1DB38507C(0, &qword_1F02DA480);
    v9 = (void *)sub_1DB3BC3B8();
    v10 = (void *)sub_1DB3BC31C();
    objc_msgSend(v1, sel_setValue_forKey_, v9, v10);

    v11 = sub_1DB388B3C(v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1DB38507C(0, &qword_1F02DA480);
    v12 = (void *)sub_1DB3BC3B8();
    v13 = (void *)sub_1DB3BC31C();
    objc_msgSend(v1, sel_setValue_forKey_, v12, v13);

    if (qword_1F02DD680 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02DB0B8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v14, v2);
    v15 = sub_1DB3BC0C4();
    v16 = sub_1DB3BC478();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = swift_slowAlloc();
      v25 = swift_slowAlloc();
      v27 = v25;
      *(_DWORD *)v17 = 136315394;
      v26 = sub_1DB388E4C(0x6569666963657073, 0xEC00000029287372, (uint64_t *)&v27);
      sub_1DB3BC58C();
      *(_WORD *)(v17 + 12) = 2080;
      v24 = v17 + 14;
      sub_1DB3BBF98();
      v18 = (void *)sub_1DB3BBF8C();
      sub_1DB3BBF80();

      sub_1DB3BBF68();
      v19 = sub_1DB3BC310();
      v21 = v20;
      swift_bridgeObjectRelease();
      v26 = sub_1DB388E4C(v19, v21, (uint64_t *)&v27);
      sub_1DB3BC58C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DB30C000, v15, v16, "%s: HPSAdaptiveVolumeDetailController Depedencies not meet! %s", (uint8_t *)v17, 0x16u);
      v22 = v25;
      swift_arrayDestroy();
      MEMORY[0x1DF0AD404](v22, -1, -1);
      MEMORY[0x1DF0AD404](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    return 0;
  }
  return v11;
}

uint64_t sub_1DB388B3C(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1DB3BC670();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x1E0DEE9D8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x1E0DEE9D8];
  result = sub_1DB38995C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x1DF0AC9FC](i, a1);
        sub_1DB38507C(0, &qword_1F02DA480);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1DB38995C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_1DB38995C(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_1DB385AA8(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_1DB38507C(0, &qword_1F02DA480);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1DB38995C(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_1DB38995C(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_1DB385AA8(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

id sub_1DB388DF8()
{
  return sub_1DB3853EC(type metadata accessor for HPSAdaptiveVolumeDetailController);
}

uint64_t sub_1DB388E4C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1DB388F1C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1DB389F80((uint64_t)v12, *a3);
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
      sub_1DB389F80((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1DB388F1C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1DB3BC598();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1DB3890D4(a5, a6);
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
  v8 = sub_1DB3BC610();
  if (!v8)
  {
    sub_1DB3BC658();
    __break(1u);
LABEL_17:
    result = sub_1DB3BC6A0();
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

uint64_t sub_1DB3890D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1DB389168(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1DB389340(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1DB389340(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1DB389168(uint64_t a1, unint64_t a2)
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
      v3 = sub_1DB3892DC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1DB3BC5EC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1DB3BC658();
      __break(1u);
LABEL_10:
      v2 = sub_1DB3BC394();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1DB3BC6A0();
    __break(1u);
LABEL_14:
    result = sub_1DB3BC658();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1DB3892DC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA518);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1DB389340(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA518);
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
  result = sub_1DB3BC6A0();
  __break(1u);
  return result;
}

unint64_t sub_1DB38948C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F02DA448;
  if (!qword_1F02DA448)
  {
    v1 = sub_1DB38507C(255, &qword_1F02DA438);
    result = MEMORY[0x1DF0AD380](MEMORY[0x1E0CB2358], v1);
    atomic_store(result, (unint64_t *)&qword_1F02DA448);
  }
  return result;
}

uint64_t sub_1DB3894E4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DB389520()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1DB389548()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  int v10;
  int v11;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = v1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1DF0AD470](v3);
  if (v4)
  {
    v5 = (_QWORD *)v4;
    swift_beginAccess();
    v6 = MEMORY[0x1DF0AD470](v2 + 16);
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (_QWORD *)MEMORY[0x1E0DEEDD8];
      v9 = (_QWORD *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v5) + 0x68))();
      sub_1DB3BBE24();
      v10 = sub_1DB3BBFC8();
      swift_release();
      v11 = v10;
      (*(void (**)(int *))((*v8 & *v9) + 0xC8))(&v11);

    }
    else
    {

    }
  }
}

uint64_t type metadata accessor for HPSAdaptiveVolumeDetailController()
{
  return objc_opt_self();
}

unint64_t sub_1DB389660(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1DB3BC70C();
  sub_1DB3BC370();
  v4 = sub_1DB3BC724();
  return sub_1DB3896C4(a1, a2, v4);
}

unint64_t sub_1DB3896C4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1DB3BC6D0() & 1) == 0)
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
      while (!v14 && (sub_1DB3BC6D0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1DB3897A4(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1DB3BC670();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1DB3BC670();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x1DF0ACA08](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1DB389AE4(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1DB3BC670();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_1DB3BC3DC();
  }
  __break(1u);
  return result;
}

uint64_t sub_1DB38995C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DB389978(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DB389978(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4E0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1DB3BC6A0();
  __break(1u);
  return result;
}

uint64_t sub_1DB389AE4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1DB3BC670();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1DB3BC670();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1DB383980((unint64_t *)&qword_1F02DA4F0, &qword_1F02DA4E8, MEMORY[0x1E0DEAF50]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4E8);
          v12 = sub_1DB389D00(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1DB38507C(0, &qword_1F02DA480);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1DB3BC6A0();
  __break(1u);
  return result;
}

void (*sub_1DB389D00(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1DB389D80(v6, a2, a3);
  return sub_1DB389D54;
}

void sub_1DB389D54(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1DB389D80(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x1DF0AC9FC](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_1DB389DEC;
  }
  __break(1u);
  return result;
}

void sub_1DB389DEC(id *a1)
{

}

_QWORD *sub_1DB389DF8(_QWORD *a1)
{
  destroy for AnyBindable(a1);
  return a1;
}

void sub_1DB389E2C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t inited;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v3 = *(_QWORD *)(v1 + 16);
  type metadata accessor for HPSAdaptiveVolumeSliderCell();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA500);
  objc_msgSend(a1, sel_setProperty_forKey_, sub_1DB3BC6E8(), *MEMORY[0x1E0D80780]);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA508);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DB3C1810;
  *(_QWORD *)(inited + 32) = 0x6E6F687064616568;
  *(_QWORD *)(inited + 40) = 0xEF65636976654465;
  v5 = *(void **)(v3 + OBJC_IVAR____TtC16HeadphoneConfigs33HPSAdaptiveVolumeDetailController_headphoneDevice);
  if (v5)
  {
    v6 = inited;
    *(_QWORD *)(inited + 48) = v5;
    v7 = v5;
    sub_1DB38807C(v6);
    sub_1DB3BBF68();
    v8 = (void *)sub_1DB3BC2EC();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setUserInfo_, v8);

  }
  else
  {
    __break(1u);
  }
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

uint64_t sub_1DB389F80(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t objectdestroy_5Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1DB389FEC()
{
  uint64_t v0;

  sub_1DB3863A0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1DB38A000(void *a1)
{
  uint64_t v2;
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v14[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA408);
  MEMORY[0x1E0C80A78]();
  v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (void *)sub_1DB38507C(255, &qword_1F02DA438);
  v5 = (void *)MEMORY[0x1DF0AD380](MEMORY[0x1E0C96190], a1);
  v6 = (void *)sub_1DB38C72C((unint64_t *)&qword_1F02DA448, &qword_1F02DA438, 0x1E0C99E58, MEMORY[0x1E0CB2358]);
  v14[0] = a1;
  v14[1] = v4;
  v14[2] = v5;
  v14[3] = v6;
  v7 = sub_1DB3BC19C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  v10 = (char *)v14 - v9;
  v14[0] = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  v11 = sub_1DB3BC52C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v3, 1, 1, v11);
  sub_1DB3BC250();
  sub_1DB3894E4((uint64_t)v3, &qword_1F02DA408);

  MEMORY[0x1DF0AD380](MEMORY[0x1E0C95CB8], v7);
  v12 = sub_1DB3BC22C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v12;
}

id sub_1DB38A1C8(void *a1, char a2, double a3, double a4, double a5, double a6)
{
  objc_class *v6;
  id v8;

  v8 = objc_msgSend(objc_allocWithZone(v6), sel_initWithFrame_device_darkMode_, a1, a2 & 1, a3, a4, a5, a6);

  return v8;
}

_QWORD *sub_1DB38A248(void *a1, char a2, double a3, double a4, double a5, double a6)
{
  char *v6;
  _QWORD *v13;
  id v14;
  objc_super v16;

  *(_QWORD *)&v6[OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners] = MEMORY[0x1E0DEE9E8];
  v16.receiver = v6;
  v16.super_class = (Class)type metadata accessor for ModernBatteryStatusView();
  v13 = objc_msgSendSuper2(&v16, sel_initWithFrame_device_darkMode_, a1, a2 & 1, a3, a4, a5, a6);
  v14 = objc_msgSend(a1, sel_headphoneDevice);
  (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v13) + 0x78))();

  return v13;
}

uint64_t type metadata accessor for ModernBatteryStatusView()
{
  return objc_opt_self();
}

uint64_t sub_1DB38A440@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  char v15;
  unsigned __int8 v16;
  char v17;
  NSObject *v18;
  os_log_type_t v19;
  _DWORD *v20;
  _DWORD *v21;
  _DWORD *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  _BOOL4 v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;

  v2 = sub_1DB3BC0DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_1DB3BBE78();
  v8 = v7 * 100.0;
  if ((~COERCE_INT(v7 * 100.0) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v8 <= -1.0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v8 >= 256.0)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  result = sub_1DB3BBE84();
  v10 = v9 * 100.0;
  if ((~COERCE_INT(v9 * 100.0) & 0x7F800000) == 0)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (v10 <= -1.0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (v10 >= 256.0)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  result = sub_1DB3BBF08();
  v12 = v11 * 100.0;
  if ((~COERCE_INT(v11 * 100.0) & 0x7F800000) == 0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v12 <= -1.0)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (v12 >= 256.0)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  result = sub_1DB3BBE90();
  v14 = v13 * 100.0;
  if ((~LODWORD(v14) & 0x7F800000) == 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v14 <= -1.0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  if (v14 >= 256.0)
  {
LABEL_39:
    __break(1u);
    return result;
  }
  v35 = v3;
  v39 = (int)v10;
  v40 = (int)v8;
  v37 = (int)v14;
  v38 = (int)v12;
  v36 = sub_1DB3BBE9C();
  v15 = sub_1DB3BBEA8();
  v16 = sub_1DB3BBF14();
  v17 = sub_1DB3BBEB4();
  sub_1DB3BC0AC();
  v18 = sub_1DB3BC0C4();
  v19 = sub_1DB3BC484();
  if (os_log_type_enabled(v18, v19))
  {
    v32 = v16 == 1;
    v33 = v17 == 1;
    v30 = v36 == 1;
    v31 = v15 == 1;
    v20 = (_DWORD *)swift_slowAlloc();
    v34 = v2;
    v21 = v20;
    *v20 = 16779264;
    LOBYTE(v41) = v40;
    sub_1DB3BC58C();
    *(_WORD *)((char *)v21 + 5) = 256;
    LOBYTE(v41) = v39;
    sub_1DB3BC58C();
    *((_WORD *)v21 + 4) = 256;
    LOBYTE(v41) = v38;
    sub_1DB3BC58C();
    *(_WORD *)((char *)v21 + 11) = 256;
    LOBYTE(v41) = v37;
    sub_1DB3BC58C();
    *((_WORD *)v21 + 7) = 1024;
    v41 = v30;
    sub_1DB3BC58C();
    *((_WORD *)v21 + 10) = 1024;
    v41 = v31;
    sub_1DB3BC58C();
    *((_WORD *)v21 + 13) = 1024;
    v41 = v32;
    sub_1DB3BC58C();
    *((_WORD *)v21 + 16) = 1024;
    v41 = v33;
    sub_1DB3BC58C();
    _os_log_impl(&dword_1DB30C000, v18, v19, "ModernBatteryStatusView: %hhu %hhu %hhu %hhu | %{BOOL}d %{BOOL}d %{BOOL}d %{BOOL}d", (uint8_t *)v21, 0x26u);
    v22 = v21;
    v2 = v34;
    MEMORY[0x1DF0AD404](v22, -1, -1);
  }
  v23 = v16;
  v24 = v36;

  if (v17 == 1)
    v25 = -1;
  else
    v25 = 0;
  if (v23 == 1)
    v26 = -1;
  else
    v26 = 0;
  if (v15 == 1)
    v27 = -1;
  else
    v27 = 0;
  if (v24 == 1)
    v28 = -1;
  else
    v28 = 0;
  result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v5, v2);
  *(_BYTE *)a1 = v37;
  *(_DWORD *)(a1 + 4) = v25;
  *(_BYTE *)(a1 + 8) = v38;
  *(_DWORD *)(a1 + 12) = v26;
  *(_BYTE *)(a1 + 16) = v39;
  *(_DWORD *)(a1 + 20) = v27;
  *(_BYTE *)(a1 + 24) = v40;
  *(_DWORD *)(a1 + 28) = v28;
  *(_BYTE *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 36) = 0;
  return result;
}

void sub_1DB38A884(void *a1)
{
  char *v1;
  char *v2;
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
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  void *v47;
  void *v48;
  char *v49;
  uint64_t v50;
  BOOL v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  unsigned int v57;
  uint64_t v58;
  void (*v59)(_QWORD, _QWORD);
  _QWORD *v60;
  void *v61;
  id v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD *v65;
  void *v66;
  char *v67;
  uint64_t v68;
  _QWORD *v69;
  void *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  _QWORD *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void (*v93)(char *, uint64_t);
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  char *v99;
  void *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  NSObject *v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  char *v115;
  NSObject *v116;
  os_log_type_t v117;
  uint8_t *v118;
  NSObject *v119;
  void (*v120)(_QWORD, _QWORD);
  void *v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  char *v127;
  uint64_t v128;
  _QWORD *v129;
  char *v130;
  uint64_t v131;
  void *v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  NSObject *v136;
  char *v137;
  uint64_t v138;
  void (*v139)(char *, uint64_t, uint64_t, uint64_t);
  char *v140;
  NSObject *v141;
  os_log_type_t v142;
  uint8_t *v143;
  NSObject *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  void *v148;
  char *v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  char *v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  _QWORD *v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  uint64_t v170;
  uint64_t v171;
  char *v172;
  uint64_t v173;
  void (*v174)(char *, uint64_t, uint64_t, uint64_t);
  char *v175;
  uint64_t v176;
  char *v177;
  char *v178;
  char *v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  char *v184;
  uint64_t v185;
  uint64_t v186;
  char *v187;
  uint64_t v188;
  uint64_t v189;
  char *v190;
  uint64_t v191;
  void (*v192)(_QWORD, _QWORD);
  char *v193;
  void (*v194)(char *, uint64_t);
  _QWORD *v195;
  uint64_t v196;
  char *v197;
  id v198;
  id v199;
  id v200;

  v2 = v1;
  v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA540);
  v170 = *(_QWORD *)(v171 - 8);
  MEMORY[0x1E0C80A78](v171);
  v169 = (char *)&v147 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v174 = (void (*)(char *, uint64_t, uint64_t, uint64_t))__swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA548);
  v173 = *((_QWORD *)v174 - 1);
  MEMORY[0x1E0C80A78](v174);
  v172 = (char *)&v147 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v162 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA550);
  v161 = *(_QWORD *)(v162 - 8);
  MEMORY[0x1E0C80A78](v162);
  v160 = (char *)&v147 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v165 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA558);
  v164 = *(v165 - 1);
  MEMORY[0x1E0C80A78](v165);
  v163 = (char *)&v147 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DB3BC0DC();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v175 = (char *)&v147 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v190 = (char *)&v147 - v12;
  v180 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA560);
  v176 = *(_QWORD *)(v180 - 8);
  MEMORY[0x1E0C80A78](v180);
  v179 = (char *)&v147 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v196 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA568);
  v194 = *(void (**)(char *, uint64_t))(v196 - 8);
  v14 = MEMORY[0x1E0C80A78](v196);
  v178 = (char *)&v147 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v14);
  v177 = (char *)&v147 - v17;
  MEMORY[0x1E0C80A78](v16);
  v193 = (char *)&v147 - v18;
  v183 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA570);
  v182 = *(_QWORD *)(v183 - 8);
  MEMORY[0x1E0C80A78](v183);
  v181 = (char *)&v147 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA578);
  v185 = *(_QWORD *)(v20 - 8);
  v186 = v20;
  MEMORY[0x1E0C80A78](v20);
  v184 = (char *)&v147 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA580);
  v188 = *(_QWORD *)(v22 - 8);
  v189 = v22;
  MEMORY[0x1E0C80A78](v22);
  v187 = (char *)&v147 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA1B8);
  MEMORY[0x1E0C80A78](v24);
  v26 = (char *)&v147 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA408);
  MEMORY[0x1E0C80A78](v27);
  v197 = (char *)&v147 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v195 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA588);
  v29 = *(v195 - 1);
  MEMORY[0x1E0C80A78](v195);
  v31 = (char *)&v147 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA590);
  v191 = *(_QWORD *)(v32 - 8);
  v192 = (void (*)(_QWORD, _QWORD))v32;
  v33 = MEMORY[0x1E0C80A78](v32);
  v156 = (char *)&v147 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = MEMORY[0x1E0C80A78](v33);
  v37 = (char *)&v147 - v36;
  MEMORY[0x1E0C80A78](v35);
  v39 = (char *)&v147 - v38;
  v159 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA598);
  v158 = *(_QWORD *)(v159 - 8);
  MEMORY[0x1E0C80A78](v159);
  v157 = (char *)&v147 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA5A0);
  v167 = *(_QWORD *)(v168 - 8);
  MEMORY[0x1E0C80A78](v168);
  v166 = (char *)&v147 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA5A8);
  v43 = MEMORY[0x1E0C80A78](v42);
  v46 = (char *)&v147 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v47 = a1;
    v150 = v46;
    v151 = v44;
    v152 = v43;
    v155 = v26;
    v154 = v9;
    v48 = v2;
    v49 = &v2[OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners];
    swift_beginAccess();
    v50 = *(_QWORD *)v49;
    v51 = (*(_QWORD *)v49 & 0xC000000000000001) == 0;
    v153 = v8;
    if (v51)
    {
      v54 = *(_QWORD *)(v50 + 16);
      v55 = a1;
      if (v54)
        goto LABEL_4;
    }
    else
    {
      v52 = a1;
      swift_bridgeObjectRetain();
      v53 = sub_1DB3BC5C8();
      swift_bridgeObjectRelease();
      if (v53)
      {
LABEL_4:

        return;
      }
    }
    v56 = v48;
    v57 = objc_msgSend(v48, sel_untethered);
    v149 = v49;
    if (v57)
    {
      v148 = a1;
      sub_1DB3BBEC0();
      v172 = (char *)objc_opt_self();
      v199 = objc_msgSend(v172, sel_mainRunLoop);
      v171 = sub_1DB3BC52C();
      v174 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v171 - 8) + 56);
      v58 = (uint64_t)v197;
      v174(v197, 1, 1, v171);
      v147 = v56;
      v173 = sub_1DB38507C(0, &qword_1F02DA438);
      v170 = sub_1DB383980(&qword_1F02DA5B0, &qword_1F02DA590, MEMORY[0x1E0C96190]);
      v175 = (char *)sub_1DB38C72C((unint64_t *)&qword_1F02DA448, &qword_1F02DA438, 0x1E0C99E58, MEMORY[0x1E0CB2358]);
      v59 = v192;
      sub_1DB3BC250();
      sub_1DB3894E4(v58, &qword_1F02DA408);

      v169 = (char *)sub_1DB383980(&qword_1F02DA600, &qword_1F02DA588, MEMORY[0x1E0C95CB8]);
      v60 = v195;
      v61 = (void *)sub_1DB3BC22C();
      v165 = *(_QWORD **)(v29 + 8);
      ((void (*)(char *, _QWORD *))v165)(v31, v60);
      v191 = *(_QWORD *)(v191 + 8);
      ((void (*)(char *, _QWORD))v191)(v39, v59);
      v199 = v61;
      sub_1DB3BBECC();
      v62 = v172;
      v200 = objc_msgSend(v172, sel_mainRunLoop);
      v63 = v171;
      v64 = v174;
      v174((char *)v58, 1, 1, v171);
      sub_1DB3BC250();
      sub_1DB3894E4(v58, &qword_1F02DA408);

      v65 = v195;
      v66 = (void *)sub_1DB3BC22C();
      ((void (*)(char *, _QWORD *))v165)(v31, v65);
      ((void (*)(char *, _QWORD))v191)(v37, v59);
      v200 = v66;
      v67 = v156;
      sub_1DB3BBF20();
      v198 = objc_msgSend(v62, sel_mainRunLoop);
      v68 = (uint64_t)v197;
      v64(v197, 1, 1, v63);
      sub_1DB3BC250();
      sub_1DB3894E4(v68, &qword_1F02DA408);

      v69 = v195;
      v70 = (void *)sub_1DB3BC22C();
      ((void (*)(char *, _QWORD *))v165)(v31, v69);
      ((void (*)(char *, _QWORD))v191)(v67, v59);
      v198 = v70;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA5B8);
      v71 = MEMORY[0x1E0C95D90];
      sub_1DB383980(&qword_1F02DA5C0, &qword_1F02DA5B8, MEMORY[0x1E0C95D90]);
      v72 = v157;
      sub_1DB3BC190();
      sub_1DB383980(&qword_1F02DA608, &qword_1F02DA598, MEMORY[0x1E0C956B8]);
      v73 = v159;
      v74 = (void *)sub_1DB3BC22C();
      (*(void (**)(char *, uint64_t))(v158 + 8))(v72, v73);
      v199 = v74;
      v164 = sub_1DB38507C(0, (unint64_t *)&qword_1F02DA1F8);
      v200 = (id)sub_1DB3BC4CC();
      v191 = sub_1DB3BC4A8();
      v170 = *(_QWORD *)(*(_QWORD *)(v191 - 8) + 56);
      v75 = (uint64_t)v155;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v170)(v155, 1, 1, v191);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA610);
      sub_1DB383980(&qword_1F02DA618, &qword_1F02DA610, v71);
      v169 = (char *)sub_1DB38C72C((unint64_t *)&qword_1F02DA208, (unint64_t *)&qword_1F02DA1F8, 0x1E0C80610, MEMORY[0x1E0DEF7F8]);
      v76 = v166;
      sub_1DB3BC250();
      sub_1DB3894E4(v75, &qword_1F02DA1B8);

      swift_release();
      v77 = swift_allocObject();
      v78 = v147;
      swift_unknownObjectWeakInit();
      v79 = swift_allocObject();
      *(_QWORD *)(v79 + 16) = v77;
      v80 = v148;
      *(_QWORD *)(v79 + 24) = v148;
      type metadata accessor for BTDeviceBatteryStatus(0);
      v165 = v81;
      sub_1DB383980(&qword_1F02DA620, &qword_1F02DA5A0, MEMORY[0x1E0C95CB8]);
      v195 = v80;
      v82 = v150;
      v83 = v168;
      sub_1DB3BC238();
      swift_release();
      (*(void (**)(char *, uint64_t))(v167 + 8))(v76, v83);
      swift_getKeyPath();
      v199 = v78;
      sub_1DB383980(&qword_1F02DA628, &qword_1F02DA5A8, MEMORY[0x1E0C95950]);
      v84 = v152;
      sub_1DB3BC280();
      swift_release();
      (*(void (**)(char *, uint64_t))(v151 + 8))(v82, v84);
      swift_beginAccess();
      sub_1DB3BC1A8();
      swift_endAccess();
      swift_release();
      v85 = v193;
      sub_1DB3BBEE4();
      v86 = v172;
      v199 = objc_msgSend(v172, sel_mainRunLoop);
      v87 = (uint64_t)v197;
      v88 = v171;
      v174(v197, 1, 1, v171);
      v168 = sub_1DB383980(&qword_1F02DA5D8, &qword_1F02DA568, MEMORY[0x1E0C96190]);
      v89 = v179;
      v90 = v196;
      sub_1DB3BC250();
      sub_1DB3894E4(v87, &qword_1F02DA408);

      v167 = sub_1DB383980(&qword_1F02DA630, &qword_1F02DA560, MEMORY[0x1E0C95CB8]);
      v91 = v180;
      v92 = (void *)sub_1DB3BC22C();
      v192 = *(void (**)(_QWORD, _QWORD))(v176 + 8);
      v192(v89, v91);
      v93 = (void (*)(char *, uint64_t))*((_QWORD *)v194 + 1);
      v93(v85, v90);
      v194 = v93;
      v199 = v92;
      v94 = v177;
      sub_1DB3BBEF0();
      v200 = objc_msgSend(v86, sel_mainRunLoop);
      v95 = (uint64_t)v197;
      v174(v197, 1, 1, v88);
      v96 = v95;
      v97 = v196;
      sub_1DB3BC250();
      sub_1DB3894E4(v95, &qword_1F02DA408);

      v98 = (void *)sub_1DB3BC22C();
      v192(v89, v91);
      v93(v94, v97);
      v200 = v98;
      v99 = v178;
      sub_1DB3BBF2C();
      v198 = objc_msgSend(v172, sel_mainRunLoop);
      v174((char *)v96, 1, 1, v171);
      sub_1DB3BC250();
      sub_1DB3894E4(v96, &qword_1F02DA408);

      v100 = (void *)sub_1DB3BC22C();
      v192(v89, v91);
      v194(v99, v97);
      v198 = v100;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA5E0);
      v101 = MEMORY[0x1E0C95D90];
      sub_1DB383980(&qword_1F02DA5E8, &qword_1F02DA5E0, MEMORY[0x1E0C95D90]);
      v102 = v181;
      sub_1DB3BC190();
      sub_1DB383980(&qword_1F02DA638, &qword_1F02DA570, MEMORY[0x1E0C956B8]);
      v103 = v183;
      v104 = (void *)sub_1DB3BC22C();
      (*(void (**)(char *, uint64_t))(v182 + 8))(v102, v103);
      v199 = v104;
      v200 = (id)sub_1DB3BC4CC();
      v105 = (uint64_t)v155;
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v170)(v155, 1, 1, v191);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA640);
      sub_1DB383980(&qword_1F02DA648, &qword_1F02DA640, v101);
      v106 = v184;
      sub_1DB3BC250();
      sub_1DB3894E4(v105, &qword_1F02DA1B8);

      swift_release();
      v107 = swift_allocObject();
      v108 = v147;
      swift_unknownObjectWeakInit();
      v109 = swift_allocObject();
      v110 = v195;
      *(_QWORD *)(v109 + 16) = v107;
      *(_QWORD *)(v109 + 24) = v110;
      sub_1DB383980(&qword_1F02DA650, &qword_1F02DA578, MEMORY[0x1E0C95CB8]);
      v111 = v110;
      v112 = v186;
      v113 = v187;
      sub_1DB3BC238();
      swift_release();
      (*(void (**)(char *, uint64_t))(v185 + 8))(v106, v112);
      swift_getKeyPath();
      v199 = v108;
      sub_1DB383980(&qword_1F02DA658, &qword_1F02DA580, MEMORY[0x1E0C95950]);
      v114 = v189;
      sub_1DB3BC280();
      swift_release();
      (*(void (**)(char *, uint64_t))(v188 + 8))(v113, v114);
      swift_beginAccess();
      sub_1DB3BC1A8();
      swift_endAccess();
      swift_release();
      v115 = v190;
      sub_1DB3BC0AC();
      v116 = sub_1DB3BC0C4();
      v117 = sub_1DB3BC484();
      if (os_log_type_enabled(v116, v117))
      {
        v118 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v118 = 0;
        _os_log_impl(&dword_1DB30C000, v116, v117, "Battery view listening for untetheredSingle publishers where we listen to both left and right", v118, 2u);
        MEMORY[0x1DF0AD404](v118, -1, -1);
        v119 = v111;
      }
      else
      {
        v119 = v116;
        v116 = v111;
      }
      v145 = v153;

      (*(void (**)(char *, uint64_t))(v154 + 8))(v115, v145);
    }
    else
    {
      sub_1DB3BBED8();
      sub_1DB383980(&qword_1F02DA5B0, &qword_1F02DA590, MEMORY[0x1E0C96190]);
      v120 = v192;
      v121 = (void *)sub_1DB3BC22C();
      (*(void (**)(char *, _QWORD))(v191 + 8))(v39, v120);
      v199 = v121;
      sub_1DB38507C(0, (unint64_t *)&qword_1F02DA1F8);
      v200 = (id)sub_1DB3BC4CC();
      v197 = (char *)sub_1DB3BC4A8();
      v195 = *(_QWORD **)(*((_QWORD *)v197 - 1) + 56);
      v122 = (uint64_t)v155;
      ((void (*)(char *, uint64_t, uint64_t, char *))v195)(v155, 1, 1, v197);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA5B8);
      sub_1DB383980(&qword_1F02DA5C0, &qword_1F02DA5B8, MEMORY[0x1E0C95D90]);
      v192 = (void (*)(_QWORD, _QWORD))sub_1DB38C72C((unint64_t *)&qword_1F02DA208, (unint64_t *)&qword_1F02DA1F8, 0x1E0C80610, MEMORY[0x1E0DEF7F8]);
      v123 = v160;
      sub_1DB3BC250();
      sub_1DB3894E4(v122, &qword_1F02DA1B8);

      swift_release();
      v124 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v125 = swift_allocObject();
      *(_QWORD *)(v125 + 16) = v124;
      *(_QWORD *)(v125 + 24) = v47;
      type metadata accessor for BTDeviceBatteryStatus(0);
      sub_1DB383980(&qword_1F02DA5C8, &qword_1F02DA550, MEMORY[0x1E0C95CB8]);
      v126 = v47;
      v127 = v163;
      v128 = v162;
      sub_1DB3BC238();
      swift_release();
      (*(void (**)(char *, uint64_t))(v161 + 8))(v123, v128);
      swift_getKeyPath();
      v199 = v48;
      sub_1DB383980(&qword_1F02DA5D0, &qword_1F02DA558, MEMORY[0x1E0C95950]);
      v129 = v165;
      sub_1DB3BC280();
      swift_release();
      (*(void (**)(char *, _QWORD *))(v164 + 8))(v127, v129);
      swift_beginAccess();
      sub_1DB3BC1A8();
      swift_endAccess();
      swift_release();
      v130 = v193;
      sub_1DB3BBEFC();
      sub_1DB383980(&qword_1F02DA5D8, &qword_1F02DA568, MEMORY[0x1E0C96190]);
      v131 = v196;
      v132 = (void *)sub_1DB3BC22C();
      (*((void (**)(char *, uint64_t))v194 + 1))(v130, v131);
      v199 = v132;
      v200 = (id)sub_1DB3BC4CC();
      ((void (*)(uint64_t, uint64_t, uint64_t, char *))v195)(v122, 1, 1, v197);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA5E0);
      sub_1DB383980(&qword_1F02DA5E8, &qword_1F02DA5E0, MEMORY[0x1E0C95D90]);
      v133 = v169;
      sub_1DB3BC250();
      sub_1DB3894E4(v122, &qword_1F02DA1B8);

      swift_release();
      v134 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v135 = swift_allocObject();
      *(_QWORD *)(v135 + 16) = v134;
      *(_QWORD *)(v135 + 24) = v126;
      sub_1DB383980(&qword_1F02DA5F0, &qword_1F02DA540, MEMORY[0x1E0C95CB8]);
      v136 = v126;
      v137 = v172;
      v138 = v171;
      sub_1DB3BC238();
      swift_release();
      (*(void (**)(char *, uint64_t))(v170 + 8))(v133, v138);
      swift_getKeyPath();
      v199 = v56;
      sub_1DB383980(&qword_1F02DA5F8, &qword_1F02DA548, MEMORY[0x1E0C95950]);
      v139 = v174;
      sub_1DB3BC280();
      swift_release();
      (*(void (**)(char *, void (*)(char *, uint64_t, uint64_t, uint64_t)))(v173 + 8))(v137, v139);
      swift_beginAccess();
      sub_1DB3BC1A8();
      swift_endAccess();
      swift_release();
      v140 = v175;
      sub_1DB3BC0AC();
      v141 = sub_1DB3BC0C4();
      v142 = sub_1DB3BC484();
      if (os_log_type_enabled(v141, v142))
      {
        v143 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v143 = 0;
        _os_log_impl(&dword_1DB30C000, v141, v142, "Battery view listening for untetheredSingle publishers where we listen to both left and right", v143, 2u);
        MEMORY[0x1DF0AD404](v143, -1, -1);
        v144 = v136;
      }
      else
      {
        v144 = v141;
        v141 = v136;
      }
      v146 = v153;

      (*(void (**)(char *, uint64_t))(v154 + 8))(v140, v146);
    }
  }
}

id sub_1DB38C1EC@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  id result;
  int v4;
  char v5;
  int v6;
  char v7;
  int v8;
  char v9;
  int v10;
  char v11;
  int v12;
  char v13;
  int v14;
  char v15;
  int v16;
  char v17;
  int v18;
  char v19;
  int v20;
  char v21;
  int v22;

  result = objc_msgSend(*a1, sel_status);
  v4 = v14;
  v5 = v15;
  v6 = v16;
  v7 = v17;
  v8 = v18;
  v9 = v19;
  v10 = v20;
  v11 = v21;
  v12 = v22;
  *(_BYTE *)a2 = v13;
  *(_DWORD *)(a2 + 4) = v4;
  *(_BYTE *)(a2 + 8) = v5;
  *(_DWORD *)(a2 + 12) = v6;
  *(_BYTE *)(a2 + 16) = v7;
  *(_DWORD *)(a2 + 20) = v8;
  *(_BYTE *)(a2 + 24) = v9;
  *(_DWORD *)(a2 + 28) = v10;
  *(_BYTE *)(a2 + 32) = v11;
  *(_DWORD *)(a2 + 36) = v12;
  return result;
}

id sub_1DB38C274(char *a1, void **a2)
{
  char v2;
  int v3;
  char v4;
  int v5;
  char v6;
  int v7;
  char v8;
  int v9;
  char v10;
  int v11;
  void *v12;
  _BYTE v14[4];
  int v15;
  char v16;
  int v17;
  char v18;
  int v19;
  char v20;
  int v21;
  char v22;
  int v23;

  v2 = *a1;
  v3 = *((_DWORD *)a1 + 1);
  v4 = a1[8];
  v5 = *((_DWORD *)a1 + 3);
  v6 = a1[16];
  v7 = *((_DWORD *)a1 + 5);
  v8 = a1[24];
  v9 = *((_DWORD *)a1 + 7);
  v10 = a1[32];
  v11 = *((_DWORD *)a1 + 9);
  v12 = *a2;
  v14[0] = v2;
  v15 = v3;
  v16 = v4;
  v17 = v5;
  v18 = v6;
  v19 = v7;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v23 = v11;
  return objc_msgSend(v12, sel_setStatus_, v14);
}

void sub_1DB38C2F0(uint64_t a1@<X0>, uint64_t a2@<X1>, const char *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  __int128 v17;
  _BYTE v18[24];
  _OWORD v19[2];
  uint64_t v20;

  v8 = sub_1DB3BC0DC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  v12 = MEMORY[0x1DF0AD470](a1 + 16);
  if (v12)
  {
    v13 = (_QWORD *)v12;
    sub_1DB3BC0AC();
    v14 = sub_1DB3BC0C4();
    v15 = sub_1DB3BC484();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1DB30C000, v14, v15, a3, v16, 2u);
      MEMORY[0x1DF0AD404](v16, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
    (*(void (**)(_OWORD *__return_ptr, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v13) + 0x70))(v19, a2);

    v17 = v19[1];
    *(_OWORD *)a4 = v19[0];
    *(_OWORD *)(a4 + 16) = v17;
    *(_QWORD *)(a4 + 32) = v20;
  }
  else
  {
    *(_BYTE *)a4 = 0;
    *(_DWORD *)(a4 + 4) = 0;
    *(_BYTE *)(a4 + 8) = 0;
    *(_DWORD *)(a4 + 12) = 0;
    *(_BYTE *)(a4 + 16) = 0;
    *(_DWORD *)(a4 + 20) = 0;
    *(_BYTE *)(a4 + 24) = 0;
    *(_DWORD *)(a4 + 28) = 0;
    *(_BYTE *)(a4 + 32) = 0;
    *(_DWORD *)(a4 + 36) = 0;
  }
}

void sub_1DB38C4E4()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners] = MEMORY[0x1E0DEE9E8];

  sub_1DB3BC664();
  __break(1u);
}

uint64_t sub_1DB38C5D0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs23ModernBatteryStatusView_listeners);
  swift_beginAccess();
  *v1 = MEMORY[0x1E0DEE9E8];
  return swift_bridgeObjectRelease();
}

void sub_1DB38C678()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1DB38C6D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ModernBatteryStatusView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unsigned __int8 *sub_1DB38C710@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1DB38C720(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t sub_1DB38C72C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_1DB38507C(255, a2);
    result = MEMORY[0x1DF0AD380](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DB38C76C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void type metadata accessor for BTDeviceBatteryStatus(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DA688);
}

char *keypath_get_selector_status()
{
  return sel_status;
}

void sub_1DB38C7BC(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_1DB38C2F0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), "Battery view levelPublisher triggered", a1);
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_1DB38C80C(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_1DB38C2F0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), "Battery view chargingPublisher triggered", a1);
}

uint64_t initializeBufferWithCopyOfBuffer for AnyBindable(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy40_4(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_1DB38C874(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1DB38C894(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
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
  *(_BYTE *)(result + 40) = v3;
  return result;
}

void type metadata accessor for CBBatteryState(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DA690);
}

uint64_t sub_1DB38C8E4()
{
  return 0;
}

uint64_t sub_1DB38C8F0()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DB38C91C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_1DB38C950())()
{
  return nullsub_1;
}

uint64_t sub_1DB38C964()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DB38C990(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_1DB38C9C4())()
{
  return nullsub_1;
}

double sub_1DB38C9D4@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

uint64_t sub_1DB38C9E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DB38C9EC(v1 + 32, a1);
}

uint64_t sub_1DB38C9EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DB38CA34(uint64_t a1)
{
  uint64_t v1;

  return sub_1DB38CA3C(a1, v1 + 32);
}

uint64_t sub_1DB38CA3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1DB38CA84())()
{
  return nullsub_1;
}

uint64_t sub_1DB38CA94()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t sub_1DB38CA9C(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = result;
  return result;
}

uint64_t (*sub_1DB38CAA4())()
{
  return nullsub_1;
}

uint64_t sub_1DB38CAB4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t sub_1DB38CABC(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = result;
  return result;
}

uint64_t (*sub_1DB38CAC4())()
{
  return nullsub_1;
}

uint64_t sub_1DB38CAD4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t sub_1DB38CADC(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = result;
  return result;
}

uint64_t (*sub_1DB38CAE4())()
{
  return nullsub_1;
}

uint64_t sub_1DB38CAF4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 88);
}

uint64_t sub_1DB38CAFC(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = result;
  return result;
}

uint64_t (*sub_1DB38CB04())()
{
  return nullsub_1;
}

uint64_t sub_1DB38CB14()
{
  return 0;
}

uint64_t sub_1DB38CB1C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 96);
}

uint64_t sub_1DB38CB24(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 96) = result;
  return result;
}

uint64_t (*sub_1DB38CB2C())()
{
  return nullsub_1;
}

uint64_t sub_1DB38CB3C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 104);
}

uint64_t sub_1DB38CB44(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 104) = result;
  return result;
}

uint64_t (*sub_1DB38CB4C())()
{
  return nullsub_1;
}

uint64_t sub_1DB38CB5C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  sub_1DB38CC74(v1);
  return v1;
}

uint64_t sub_1DB38CB8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1DB38CCB8(*(_QWORD *)(v2 + 112));
  *(_QWORD *)(v2 + 112) = a1;
  *(_QWORD *)(v2 + 120) = a2;
  return result;
}

uint64_t (*sub_1DB38CBC0())()
{
  return nullsub_1;
}

uint64_t sub_1DB38CBD0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 128);
  sub_1DB38CC74(v1);
  return v1;
}

uint64_t sub_1DB38CC00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1DB38CCB8(*(_QWORD *)(v2 + 128));
  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = a2;
  return result;
}

uint64_t (*sub_1DB38CC34())()
{
  return nullsub_1;
}

uint64_t sub_1DB38CC44()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 144);
  sub_1DB38CC74(v1);
  return v1;
}

uint64_t sub_1DB38CC74(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1DB38CC84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1DB38CCB8(*(_QWORD *)(v2 + 144));
  *(_QWORD *)(v2 + 144) = a1;
  *(_QWORD *)(v2 + 152) = a2;
  return result;
}

uint64_t sub_1DB38CCB8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t (*sub_1DB38CCC8())()
{
  return nullsub_1;
}

__n128 sub_1DB38CCD8@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, char a11, __int128 a12, __int128 a13, __n128 a14, uint64_t a15)
{
  __n128 result;

  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  sub_1DB3872D4(a5, a9 + 32);
  *(_QWORD *)(a9 + 64) = a6;
  *(_QWORD *)(a9 + 72) = a7;
  *(_QWORD *)(a9 + 80) = a8;
  *(_QWORD *)(a9 + 88) = a10;
  *(_BYTE *)(a9 + 96) = a11;
  *(_OWORD *)(a9 + 104) = a12;
  *(_OWORD *)(a9 + 120) = a13;
  result = a14;
  *(__n128 *)(a9 + 136) = a14;
  *(_QWORD *)(a9 + 152) = a15;
  return result;
}

uint64_t sub_1DB38CD80()
{
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1DB38CD8C()
{
  return 0;
}

uint64_t sub_1DB38CD98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  sub_1DB38CDFC(a1, a2, a3, a4);
  return v8;
}

void sub_1DB38CDFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  id v9;

  *(_QWORD *)(v4 + 24) = MEMORY[0x1E0DEE9D8];
  if (a2)
  {
    v6 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
    if (a4)
    {
LABEL_3:
      v7 = (void *)sub_1DB3BC31C();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 0;
    if (a4)
      goto LABEL_3;
  }
  v7 = 0;
LABEL_6:
  v8 = objc_msgSend((id)objc_opt_self(), sel_groupSpecifierWithID_name_, v6, v7);

  if (v8)
  {
    *(_QWORD *)(v4 + 16) = v8;
    swift_beginAccess();
    v9 = v8;
    MEMORY[0x1DF0AC7B0]();
    if (*(_QWORD *)((*(_QWORD *)(v4 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v4 + 24) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_1DB3BC3E8();
    sub_1DB3BC3F4();
    sub_1DB3BC3DC();
    swift_endAccess();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1DB38CF30(void (*a1)(_QWORD))
{
  uint64_t v1;

  a1(*(_QWORD *)(v1 + 16));
  return swift_retain();
}

uint64_t sub_1DB38CF60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (**v2)(_QWORD, _QWORD);
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
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;

  v1 = v0;
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v2 = *(uint64_t (***)(_QWORD, _QWORD))(*(_QWORD *)v0 + 88);
  v4 = v2[2](v3, v2);
  v22 = v5;
  v23 = v4;
  v6 = v2[11](v3, v2);
  v8 = v7;
  v9 = v2[10](v3, v2);
  v11 = v10;
  v12 = v2[9](v3, v2);
  v13 = v2[6](v3, v2);
  v14 = v2[12](v3, v2);
  v16 = v15;
  v17 = objc_allocWithZone((Class)type metadata accessor for HeadphoneSpecifier());
  HeadphoneSpecifier.init(name:setAction:getAction:detail:cell:edit:buttonAction:)(v23, v22, v6, v8, v9, v11, v12, v13, 0, v14, v16);
  v19 = v18;
  swift_beginAccess();
  v20 = v19;
  MEMORY[0x1DF0AC7B0]();
  if (*(_QWORD *)((*(_QWORD *)(v1 + 24) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v1 + 24) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_1DB3BC3E8();
  sub_1DB3BC3F4();
  sub_1DB3BC3DC();
  swift_endAccess();

  return swift_retain();
}

__n128 HeadphoneSpecifier.__allocating_init(name:setAction:getAction:detail:cell:edit:buttonAction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10)
{
  objc_class *v10;
  id v19;
  __n128 result;

  v19 = objc_allocWithZone(v10);
  HeadphoneSpecifier.init(name:setAction:getAction:detail:cell:edit:buttonAction:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10);
  return result;
}

uint64_t type metadata accessor for HeadphoneSpecifier()
{
  return objc_opt_self();
}

uint64_t sub_1DB38D1AC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjCClassFromMetadata;
  void *v14;
  id v15;
  uint64_t result;
  id v17;
  _QWORD v18[3];
  uint64_t v19;

  v2 = *(_QWORD *)(*v0 + 80);
  v1 = *(_QWORD *)(*v0 + 88);
  (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v2, v1);
  if (v3)
  {
    v4 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v1 + 24))(v18, v2, v1);
  v5 = v19;
  if (v19)
  {
    v6 = __swift_project_boxed_opaque_existential_0(v18, v19);
    v7 = *(_QWORD *)(v5 - 8);
    MEMORY[0x1E0C80A78](v6);
    v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    v10 = sub_1DB3BC6C4();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  }
  else
  {
    v10 = 0;
  }
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 40))(v2, v1);
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 32))(v2, v1);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(v1 + 72))(v2, v1))
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  else
    ObjCClassFromMetadata = 0;
  v14 = (void *)objc_opt_self();
  v15 = objc_msgSend(v14, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v4, v10, v11, v12, ObjCClassFromMetadata, (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 48))(v2, v1), 0);

  result = swift_unknownObjectRelease();
  if (v15)
  {
    swift_beginAccess();
    v17 = v15;
    MEMORY[0x1DF0AC7B0]();
    if (*(_QWORD *)((v0[3] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v0[3] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1DB3BC3E8();
    sub_1DB3BC3F4();
    sub_1DB3BC3DC();
    swift_endAccess();

    return swift_retain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_1DB38D3FC(void (*a1)(void *))
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  unint64_t result;
  id v6;
  void *v7;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 24);
  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();
    swift_retain();
    return v1;
  }
  swift_bridgeObjectRetain();
  v4 = sub_1DB3BC670();
  if (!v4)
    goto LABEL_10;
LABEL_3:
  result = v4 - 1;
  if (__OFSUB__(v4, 1))
  {
    __break(1u);
    goto LABEL_13;
  }
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_13:
    v6 = (id)MEMORY[0x1DF0AC9FC](result, v3);
    goto LABEL_8;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v6 = *(id *)(v3 + 8 * result + 32);
LABEL_8:
    v7 = v6;
    swift_bridgeObjectRelease();
    a1(v7);
    swift_retain();

    return v1;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DB38D510()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DB38D544()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1DB38D568()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t HeadphoneSpecifier.getAction.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_getAction);
  sub_1DB38CC74(v1);
  return v1;
}

uint64_t HeadphoneSpecifier.setAction.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_setAction);
  sub_1DB38CC74(v1);
  return v1;
}

uint64_t HeadphoneSpecifier.buttonTapAction.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_buttonTapAction);
  sub_1DB38CC74(v1);
  return v1;
}

void HeadphoneSpecifier.init(name:setAction:getAction:detail:cell:edit:buttonAction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  char *v11;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  uint64_t ObjCClassFromMetadata;
  objc_class *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  objc_super v27;
  objc_super v28;
  objc_super v29;

  v15 = (uint64_t *)&v11[OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_getAction];
  *v15 = a5;
  v15[1] = a6;
  v16 = (uint64_t *)&v11[OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_setAction];
  *v16 = a3;
  v16[1] = a4;
  v17 = (uint64_t *)&v11[OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_buttonTapAction];
  *v17 = a10;
  v17[1] = a11;
  if (a2)
  {
    sub_1DB38CC74(a10);
    sub_1DB38CC74(a3);
    sub_1DB38CC74(a5);
    v18 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
    v19 = a9;
    if (a7)
      goto LABEL_3;
  }
  else
  {
    sub_1DB38CC74(a10);
    sub_1DB38CC74(a3);
    sub_1DB38CC74(a5);
    v18 = 0;
    v19 = a9;
    if (a7)
    {
LABEL_3:
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v25 = a3;
      if (!v19)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  ObjCClassFromMetadata = 0;
  v25 = a3;
  if (v19)
LABEL_4:
    v19 = swift_getObjCClassFromMetadata();
LABEL_5:
  v21 = (objc_class *)type metadata accessor for HeadphoneSpecifier();
  v29.receiver = v11;
  v29.super_class = v21;
  v22 = objc_msgSendSuper2(&v29, sel_initWithName_target_set_get_detail_cell_edit_, v18, 0, sel_setSepcifierEnabledWithEnabled_, sel_specifierEnabled, ObjCClassFromMetadata, a8, v19);

  if (v22)
  {
    v28.receiver = v22;
    v28.super_class = v21;
    v23 = v22;
    objc_msgSendSuper2(&v28, sel_setTarget_, v23);
    v27.receiver = v23;
    v27.super_class = v21;
    v24 = v23;
    objc_msgSendSuper2(&v27, sel_setButtonAction_, sel_buttonTappedWithSender_);
    sub_1DB38CCB8(a10);
    sub_1DB38CCB8(a5);
    sub_1DB38CCB8(v25);

  }
  else
  {
    __break(1u);
  }
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t HeadphoneSpecifier.buttonTapped(sender:)()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t result;

  v1 = *(uint64_t (**)(void))(v0 + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_buttonTapAction);
  if (v1)
    return v1();
  return result;
}

NSNumber __swiftcall HeadphoneSpecifier.specifierEnabled()()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(v0 + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_getAction);
  if (v1)
    return (NSNumber)v1();
  sub_1DB38D974();
  return (NSNumber)sub_1DB3BC4FC();
}

unint64_t sub_1DB38D974()
{
  unint64_t result;

  result = qword_1F02DA6B0;
  if (!qword_1F02DA6B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F02DA6B0);
  }
  return result;
}

Swift::Void __swiftcall HeadphoneSpecifier.setSepcifierEnabled(enabled:)(NSNumber enabled)
{
  uint64_t v1;
  void (*v2)(Class);

  v2 = *(void (**)(Class))(v1 + OBJC_IVAR____TtC16HeadphoneConfigs18HeadphoneSpecifier_setAction);
  if (v2)
    v2(enabled.super.super.isa);
}

id HeadphoneSpecifier.__allocating_init(name:target:set:get:detail:cell:edit:)(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t ObjCClassFromMetadata, uint64_t a7, uint64_t a8)
{
  objc_class *v8;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v24 = a5;
  v25 = a7;
  v23 = a4;
  if (a2)
  {
    v12 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
    v13 = a3[3];
    if (v13)
      goto LABEL_3;
  }
  else
  {
    v12 = 0;
    v13 = a3[3];
    if (v13)
    {
LABEL_3:
      v14 = __swift_project_boxed_opaque_existential_0(a3, v13);
      v15 = *(_QWORD *)(v13 - 8);
      MEMORY[0x1E0C80A78](v14);
      v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v15 + 16))(v17);
      v18 = sub_1DB3BC6C4();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)a3);
      if (!ObjCClassFromMetadata)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  v18 = 0;
  if (ObjCClassFromMetadata)
LABEL_4:
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
LABEL_5:
  if (a8)
    a8 = swift_getObjCClassFromMetadata();
  v19 = objc_allocWithZone(v8);
  v20 = objc_msgSend(v19, sel_initWithName_target_set_get_detail_cell_edit_, v12, v18, v23, v24, ObjCClassFromMetadata, v25, a8);

  swift_unknownObjectRelease();
  return v20;
}

void HeadphoneSpecifier.init(name:target:set:get:detail:cell:edit:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HeadphoneSpecifier.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void HeadphoneSpecifier.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HeadphoneSpecifier.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneSpecifier();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t destroy for AnyBindable(_QWORD *a1)
{
  uint64_t result;

  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (a1[7])
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)(a1 + 4));
  if (a1[14])
    result = swift_release();
  if (a1[16])
    result = swift_release();
  if (a1[18])
    return swift_release();
  return result;
}

uint64_t initializeWithCopy for AnyBindable(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = (_OWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v7)
  {
    *(_QWORD *)(a1 + 56) = v7;
    (**(void (***)(uint64_t, _OWORD *, uint64_t))(v7 - 8))(a1 + 32, v6, v7);
  }
  else
  {
    v8 = v6[1];
    *(_OWORD *)(a1 + 32) = *v6;
    *(_OWORD *)(a1 + 48) = v8;
  }
  v9 = *(_QWORD *)(a2 + 112);
  v10 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v10;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  if (v9)
  {
    v11 = *(_QWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 112) = v9;
    *(_QWORD *)(a1 + 120) = v11;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  }
  v12 = *(_QWORD *)(a2 + 128);
  if (v12)
  {
    v13 = *(_QWORD *)(a2 + 136);
    *(_QWORD *)(a1 + 128) = v12;
    *(_QWORD *)(a1 + 136) = v13;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  }
  v14 = *(_QWORD *)(a2 + 144);
  if (v14)
  {
    v15 = *(_QWORD *)(a2 + 152);
    *(_QWORD *)(a1 + 144) = v14;
    *(_QWORD *)(a1 + 152) = v15;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  }
  return a1;
}

uint64_t assignWithCopy for AnyBindable(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
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

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 56);
  if (*(_QWORD *)(a1 + 56))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_0((uint64_t *)(a1 + 32), (uint64_t *)(a2 + 32));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_0(a1 + 32);
  }
  else if (v4)
  {
    *(_QWORD *)(a1 + 56) = v4;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 32, a2 + 32);
    goto LABEL_8;
  }
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
LABEL_8:
  v6 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  v7 = *(_QWORD *)(a2 + 112);
  if (v6)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a2 + 120);
      *(_QWORD *)(a1 + 112) = v7;
      *(_QWORD *)(a1 + 120) = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = *(_QWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 112) = v7;
    *(_QWORD *)(a1 + 120) = v9;
    swift_retain();
    goto LABEL_15;
  }
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
LABEL_15:
  v10 = *(_QWORD *)(a2 + 128);
  if (*(_QWORD *)(a1 + 128))
  {
    if (v10)
    {
      v11 = *(_QWORD *)(a2 + 136);
      *(_QWORD *)(a1 + 128) = v10;
      *(_QWORD *)(a1 + 136) = v11;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    v12 = *(_QWORD *)(a2 + 136);
    *(_QWORD *)(a1 + 128) = v10;
    *(_QWORD *)(a1 + 136) = v12;
    swift_retain();
    goto LABEL_22;
  }
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
LABEL_22:
  v13 = *(_QWORD *)(a2 + 144);
  if (!*(_QWORD *)(a1 + 144))
  {
    if (v13)
    {
      v15 = *(_QWORD *)(a2 + 152);
      *(_QWORD *)(a1 + 144) = v13;
      *(_QWORD *)(a1 + 152) = v15;
      swift_retain();
      return a1;
    }
LABEL_28:
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    return a1;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_28;
  }
  v14 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = v13;
  *(_QWORD *)(a1 + 152) = v14;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy160_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

uint64_t assignWithTake for AnyBindable(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 56))
    __swift_destroy_boxed_opaque_existential_0(a1 + 32);
  v6 = *(_OWORD *)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v6;
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v9;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  if (v8)
  {
    if (v7)
    {
      v10 = *(_QWORD *)(a2 + 120);
      *(_QWORD *)(a1 + 112) = v7;
      *(_QWORD *)(a1 + 120) = v10;
      swift_release();
      goto LABEL_10;
    }
    swift_release();
  }
  else if (v7)
  {
    v11 = *(_QWORD *)(a2 + 120);
    *(_QWORD *)(a1 + 112) = v7;
    *(_QWORD *)(a1 + 120) = v11;
    goto LABEL_10;
  }
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
LABEL_10:
  v12 = *(_QWORD *)(a2 + 128);
  if (*(_QWORD *)(a1 + 128))
  {
    if (v12)
    {
      v13 = *(_QWORD *)(a2 + 136);
      *(_QWORD *)(a1 + 128) = v12;
      *(_QWORD *)(a1 + 136) = v13;
      swift_release();
      goto LABEL_17;
    }
    swift_release();
  }
  else if (v12)
  {
    v14 = *(_QWORD *)(a2 + 136);
    *(_QWORD *)(a1 + 128) = v12;
    *(_QWORD *)(a1 + 136) = v14;
    goto LABEL_17;
  }
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
LABEL_17:
  v15 = *(_QWORD *)(a2 + 144);
  if (!*(_QWORD *)(a1 + 144))
  {
    if (v15)
    {
      v17 = *(_QWORD *)(a2 + 152);
      *(_QWORD *)(a1 + 144) = v15;
      *(_QWORD *)(a1 + 152) = v17;
      return a1;
    }
LABEL_23:
    *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
    return a1;
  }
  if (!v15)
  {
    swift_release();
    goto LABEL_23;
  }
  v16 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = v15;
  *(_QWORD *)(a1 + 152) = v16;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AnyBindable(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 160))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AnyBindable(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 152) = 0;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 160) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 160) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnyBindable()
{
  return &type metadata for AnyBindable;
}

uint64_t sub_1DB38E51C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PSSpecifierGroupBuilder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PSSpecifierGroupBuilder);
}

void type metadata accessor for PSTableCellType()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1F02DA6E0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1F02DA6E0);
  }
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1DF0AD320](a1, v6, a5);
}

char *sub_1DB38E5F8()
{
  return &byte_1F02DB0D0;
}

uint64_t sub_1DB38E604()
{
  swift_beginAccess();
  return byte_1F02DB0D0;
}

uint64_t sub_1DB38E644(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_1F02DB0D0 = a1;
  return result;
}

uint64_t (*sub_1DB38E688())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1DB38E6C8(void *a1)
{
  id v1;
  char v2;

  v1 = a1;
  v2 = sub_1DB38E6F8();

  return v2 & 1;
}

uint64_t sub_1DB38E6F8()
{
  void *v0;
  id v1;
  uint64_t result;
  unsigned __int8 v3;
  _OWORD v4[2];
  _BYTE v5[24];
  uint64_t v6;

  swift_beginAccess();
  v1 = objc_getAssociatedObject(v0, &byte_1F02DB0D0);
  swift_endAccess();
  if (v1)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_1DB3872D4((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    result = swift_dynamicCast();
    if ((_DWORD)result)
      return v3;
  }
  else
  {
    sub_1DB38E7C8((uint64_t)v5);
    return 0;
  }
  return result;
}

uint64_t sub_1DB38E7C8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1DB38E808(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  v2 = (void *)sub_1DB3BC40C();
  swift_beginAccess();
  objc_setAssociatedObject(v1, &byte_1F02DB0D0, v2, (void *)1);
  swift_endAccess();

}

void sub_1DB38E888()
{
  void *v0;
  void *v1;

  v1 = (void *)sub_1DB3BC40C();
  swift_beginAccess();
  objc_setAssociatedObject(v0, &byte_1F02DB0D0, v1, (void *)1);
  swift_endAccess();

}

void sub_1DB38E8F4()
{
  qword_1F02DB0D8 = MEMORY[0x1E0DEE9E0];
}

uint64_t *sub_1DB38E908()
{
  if (qword_1F02DD820 != -1)
    swift_once();
  return &qword_1F02DB0D8;
}

uint64_t sub_1DB38E948()
{
  if (qword_1F02DD820 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DB38EA58(uint64_t a1)
{
  if (qword_1F02DD820 != -1)
    swift_once();
  swift_beginAccess();
  qword_1F02DB0D8 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DB38EB68())()
{
  if (qword_1F02DD820 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void HPSHeadphoneManager.addTopLevelEntry(hpDevice:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  id v31;
  os_log_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  os_log_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  id v61;
  char v62[32];
  _OWORD v63[2];
  __int128 v64;
  uint64_t v65;

  v3 = sub_1DB3BBCA4();
  v58 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DB3BC28C();
  v60 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v59 = (uint64_t *)((char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = sub_1DB3BC0DC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB3BC0AC();
  v12 = v1;
  v13 = a1;
  v14 = v12;
  v15 = v13;
  v16 = sub_1DB3BC0C4();
  v56 = sub_1DB3BC484();
  if (os_log_type_enabled(v16, (os_log_type_t)v56))
  {
    v51 = v16;
    v52 = v11;
    v53 = v9;
    v54 = v8;
    v55 = v6;
    v57 = v14;
    v17 = swift_slowAlloc();
    v18 = (_QWORD *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    *(_QWORD *)&v64 = v19;
    *(_DWORD *)v17 = 136315650;
    if (qword_1F02DD820 != -1)
      swift_once();
    swift_beginAccess();
    v20 = swift_bridgeObjectRetain();
    sub_1DB390360(v20);
    v22 = v21;
    swift_bridgeObjectRelease();
    v23 = MEMORY[0x1DF0AC7D4](v22, MEMORY[0x1E0DEA968]);
    v25 = v24;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v63[0] = sub_1DB388E4C(v23, v25, (uint64_t *)&v64);
    sub_1DB3BC58C();
    v26 = v57;

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    v50 = v17 + 14;
    sub_1DB3BBF98();
    v27 = (void *)sub_1DB3BBF8C();
    sub_1DB3BBF80();

    sub_1DB3BBF68();
    v28 = sub_1DB3BC304();
    v30 = v29;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v63[0] = sub_1DB388E4C(v28, v30, (uint64_t *)&v64);
    sub_1DB3BC58C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2112;
    *(_QWORD *)&v63[0] = v15;
    v31 = v15;
    sub_1DB3BC58C();
    *v18 = v15;

    v32 = v51;
    _os_log_impl(&dword_1DB30C000, v51, (os_log_type_t)v56, "HPMHeadphoneManager: addTopLevelEntry %s  %s %@", (uint8_t *)v17, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA6F8);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v18, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v19, -1, -1);
    v33 = v17;
    v14 = v57;
    MEMORY[0x1DF0AD404](v33, -1, -1);

    (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v54);
    v6 = v55;
    v34 = (_QWORD *)&unk_1F02DD000;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v34 = &unk_1F02DD000;
  }
  sub_1DB3832D8();
  v35 = sub_1DB3BC4CC();
  v37 = v59;
  v36 = v60;
  *v59 = v35;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v36 + 104))(v37, *MEMORY[0x1E0DEF740], v6);
  v38 = sub_1DB3BC298();
  (*(void (**)(uint64_t *, uint64_t))(v36 + 8))(v37, v6);
  if ((v38 & 1) == 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (v34[260] != -1)
LABEL_19:
    swift_once();
  v39 = sub_1DB3BBF5C();
  v41 = v40;
  swift_beginAccess();
  v42 = qword_1F02DB0D8;
  if (*(_QWORD *)(qword_1F02DB0D8 + 16) && (v43 = sub_1DB389660(v39, v41), (v44 & 1) != 0))
  {
    v45 = *(void **)(*(_QWORD *)(v42 + 56) + 8 * v43);
    v46 = v45;
  }
  else
  {
    v45 = 0;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  objc_msgSend(v15, sel_setHasBackend_, 1);
  objc_msgSend(v45, sel_setHasBackend_, 1);
  sub_1DB391210(v45, v15);
  sub_1DB38F32C();
  v47 = objc_msgSend(v14, sel_weakHashTblCopy);
  v48 = objc_msgSend(v47, sel_objectEnumerator);

  v49 = v48;
  sub_1DB3BC46C();

  sub_1DB384718(&qword_1F02DA6E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFB58], MEMORY[0x1E0CAFB80]);
  sub_1DB3BC580();
  while (v65)
  {
    sub_1DB385AA8(&v64, v63);
    sub_1DB389F80((uint64_t)v63, (uint64_t)v62);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA6F0);
    if (swift_dynamicCast())
    {
      objc_msgSend(v61, sel_addTopLevelEntryWithHpDevice_, v15);
      swift_unknownObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v63);
    sub_1DB3BC580();
  }
  (*(void (**)(char *, uint64_t))(v58 + 8))(v5, v3);

}

uint64_t sub_1DB38F298()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_1F02DD820 != -1)
    swift_once();
  swift_beginAccess();
  v0 = swift_bridgeObjectRetain();
  sub_1DB390360(v0);
  v2 = v1;
  swift_bridgeObjectRelease();
  return v2;
}

void sub_1DB38F32C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void (*v7)(uint64_t *, _QWORD);
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  _QWORD v52[2];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  id v58;
  unint64_t v59;
  void (*v60)(uint64_t *, _QWORD);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63[5];

  v0 = sub_1DB3BC0DC();
  v1 = *(uint64_t **)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (uint64_t)v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (id)sub_1DB3BBF98();
  v5 = (void *)sub_1DB3BBF8C();
  objc_sync_enter(v5);

  v6 = (void *)sub_1DB3BBF8C();
  v7 = (void (*)(uint64_t *, _QWORD))sub_1DB3BBF74();
  v9 = v8;
  swift_bridgeObjectRelease();
  *v9 = MEMORY[0x1E0DEE9E0];
  v7(v63, 0);

  if (qword_1F02DD820 != -1)
LABEL_25:
    swift_once();
  swift_beginAccess();
  v10 = swift_bridgeObjectRetain();
  sub_1DB390738(v10);
  v12 = v11;
  v52[0] = 0;
  v54 = v1;
  v55 = v0;
  v53 = v3;
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v0 = sub_1DB3BC670();
    swift_bridgeObjectRelease();
    if (v0)
      goto LABEL_4;
  }
  else
  {
    v0 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v0)
    {
LABEL_4:
      v58 = v4;
      v59 = v12 & 0xC000000000000001;
      v3 = 4;
      v56 = v0;
      v57 = v12;
      do
      {
        if (v59)
          v14 = (id)MEMORY[0x1DF0AC9FC](v3 - 4, v12);
        else
          v14 = *(id *)(v12 + 8 * v3);
        v15 = v14;
        if (__OFADD__(v3 - 4, 1))
        {
          __break(1u);
LABEL_23:
          __break(1u);
LABEL_24:
          __break(1u);
          goto LABEL_25;
        }
        v61 = v3 - 3;
        v16 = (void *)sub_1DB3BBF8C();
        v0 = sub_1DB3BBF5C();
        v18 = v17;
        v4 = v15;
        v60 = (void (*)(uint64_t *, _QWORD))sub_1DB3BBF74();
        v1 = v19;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v62 = *v1;
        v21 = v62;
        *v1 = 0x8000000000000000;
        v23 = sub_1DB389660(v0, v18);
        v24 = *(_QWORD *)(v21 + 16);
        v25 = (v22 & 1) == 0;
        v26 = v24 + v25;
        if (__OFADD__(v24, v25))
          goto LABEL_23;
        v27 = v22;
        if (*(_QWORD *)(v21 + 24) >= v26)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            v30 = (_QWORD *)v62;
            if ((v22 & 1) != 0)
              goto LABEL_5;
          }
          else
          {
            sub_1DB390E54();
            v30 = (_QWORD *)v62;
            if ((v27 & 1) != 0)
              goto LABEL_5;
          }
        }
        else
        {
          sub_1DB3909EC(v26, isUniquelyReferenced_nonNull_native);
          v28 = sub_1DB389660(v0, v18);
          if ((v27 & 1) != (v29 & 1))
          {
            sub_1DB3BC6F4();
            __break(1u);
            return;
          }
          v23 = v28;
          v30 = (_QWORD *)v62;
          if ((v27 & 1) != 0)
          {
LABEL_5:
            v13 = v30[7];

            *(_QWORD *)(v13 + 8 * v23) = v4;
            goto LABEL_6;
          }
        }
        v30[(v23 >> 6) + 8] |= 1 << v23;
        v31 = (uint64_t *)(v30[6] + 16 * v23);
        *v31 = v0;
        v31[1] = v18;
        *(_QWORD *)(v30[7] + 8 * v23) = v4;
        v32 = v30[2];
        v33 = __OFADD__(v32, 1);
        v34 = v32 + 1;
        if (v33)
          goto LABEL_24;
        v30[2] = v34;
        swift_bridgeObjectRetain();
LABEL_6:
        *v1 = (uint64_t)v30;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v60(v63, 0);

        ++v3;
        v0 = v56;
        v12 = v57;
        v4 = v58;
      }
      while (v61 != v56);
    }
  }
  swift_bridgeObjectRelease_n();
  v35 = v53;
  sub_1DB3BC0AC();
  v36 = (id)v52[1];
  v37 = sub_1DB3BC0C4();
  v38 = sub_1DB3BC484();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = swift_slowAlloc();
    v61 = swift_slowAlloc();
    v63[0] = v61;
    *(_DWORD *)v39 = 136315394;
    v40 = swift_bridgeObjectRetain();
    sub_1DB390360(v40);
    v42 = v41;
    swift_bridgeObjectRelease();
    v43 = MEMORY[0x1DF0AC7D4](v42, MEMORY[0x1E0DEA968]);
    v45 = v44;
    swift_bridgeObjectRelease();
    v62 = sub_1DB388E4C(v43, v45, v63);
    sub_1DB3BC58C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 12) = 2080;
    v46 = (void *)sub_1DB3BBF8C();
    sub_1DB3BBF80();

    sub_1DB3BBF68();
    v47 = sub_1DB3BC304();
    v49 = v48;
    swift_bridgeObjectRelease();
    v62 = sub_1DB388E4C(v47, v49, v63);
    sub_1DB3BC58C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1DB30C000, v37, v38, "HPMHeadphoneManager: updateConnectedForHPM %s  %s", (uint8_t *)v39, 0x16u);
    v50 = v61;
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v50, -1, -1);
    MEMORY[0x1DF0AD404](v39, -1, -1);

  }
  else
  {

  }
  ((void (*)(uint64_t, uint64_t))v54[1])(v35, v55);
  v51 = (void *)sub_1DB3BBF8C();
  objc_sync_exit(v51);

}

void HPSHeadphoneManager.updateTopLevelEntry(hpDevice:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[2];
  _BYTE v26[32];
  _OWORD v27[2];
  __int128 v28;
  uint64_t v29;

  v2 = v1;
  v4 = sub_1DB3BBCA4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DB3BC28C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (_QWORD *)((char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DB3832D8();
  *v11 = sub_1DB3BC4CC();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF740], v8);
  v12 = sub_1DB3BC298();
  (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (qword_1F02DD820 != -1)
LABEL_14:
    swift_once();
  v13 = sub_1DB3BBF5C();
  v15 = v14;
  swift_beginAccess();
  v16 = qword_1F02DB0D8;
  v17 = *(_QWORD *)(qword_1F02DB0D8 + 16);
  v25[0] = v5;
  if (v17 && (v18 = sub_1DB389660(v13, v15), (v19 & 1) != 0))
  {
    v20 = *(void **)(*(_QWORD *)(v16 + 56) + 8 * v18);
    v21 = v20;
  }
  else
  {
    v20 = 0;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_1DB391210(v20, a1);
  v22 = objc_msgSend(v2, sel_weakHashTblCopy);
  v23 = objc_msgSend(v22, sel_objectEnumerator);

  v24 = v23;
  sub_1DB3BC46C();

  sub_1DB384718(&qword_1F02DA6E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFB58], MEMORY[0x1E0CAFB80]);
  sub_1DB3BC580();
  while (v29)
  {
    sub_1DB385AA8(&v28, v27);
    sub_1DB389F80((uint64_t)v27, (uint64_t)v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA6F0);
    if (swift_dynamicCast())
    {
      objc_msgSend((id)v25[1], sel_updateTopLevelEntryWithHpDevice_, a1);
      swift_unknownObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
    sub_1DB3BC580();
  }
  (*(void (**)(char *, uint64_t))(v25[0] + 8))(v7, v4);

}

void HPSHeadphoneManager.removeTopLevelEntry(hpDevice:)(void *a1)
{
  void *v1;
  id v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  char v14;
  id v15;
  id v16;
  NSObject *v17;
  int v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  _QWORD *v33;
  os_log_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  _QWORD *v48;
  int v49;
  uint64_t v50;
  os_log_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  char v57[32];
  _OWORD v58[2];
  __int128 v59;
  uint64_t v60;

  v2 = v1;
  v4 = sub_1DB3BBCA4();
  v55 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = sub_1DB3BC0DC();
  v7 = *(_QWORD *)(v54 - 8);
  MEMORY[0x1E0C80A78](v54);
  v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_QWORD *)sub_1DB3BC28C();
  v11 = *(v10 - 1);
  MEMORY[0x1E0C80A78](v10);
  v13 = (uint64_t *)((char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DB3832D8();
  *v13 = sub_1DB3BC4CC();
  (*(void (**)(uint64_t *, _QWORD, _QWORD *))(v11 + 104))(v13, *MEMORY[0x1E0DEF740], v10);
  v14 = sub_1DB3BC298();
  (*(void (**)(uint64_t *, _QWORD *))(v11 + 8))(v13, v10);
  if ((v14 & 1) == 0)
  {
    __break(1u);
LABEL_19:
    swift_once();
    goto LABEL_8;
  }
  v53 = v7;
  sub_1DB3BC0AC();
  v15 = v2;
  v16 = a1;
  v10 = v15;
  v2 = v16;
  v17 = sub_1DB3BC0C4();
  v18 = sub_1DB3BC484();
  v19 = &unk_1F02DD000;
  if (os_log_type_enabled(v17, (os_log_type_t)v18))
  {
    v49 = v18;
    v51 = v17;
    v52 = v9;
    v20 = v10;
    v21 = swift_slowAlloc();
    v48 = (_QWORD *)swift_slowAlloc();
    v50 = swift_slowAlloc();
    *(_QWORD *)&v59 = v50;
    *(_DWORD *)v21 = 136315650;
    if (qword_1F02DD820 != -1)
      swift_once();
    swift_beginAccess();
    v22 = swift_bridgeObjectRetain();
    sub_1DB390360(v22);
    v24 = v23;
    swift_bridgeObjectRelease();
    v25 = MEMORY[0x1DF0AC7D4](v24, MEMORY[0x1E0DEA968]);
    v27 = v26;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v58[0] = sub_1DB388E4C(v25, v27, (uint64_t *)&v59);
    sub_1DB3BC58C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 12) = 2080;
    sub_1DB3BBF98();
    v28 = (void *)sub_1DB3BBF8C();
    sub_1DB3BBF80();

    sub_1DB3BBF68();
    v29 = sub_1DB3BC304();
    v31 = v30;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v58[0] = sub_1DB388E4C(v29, v31, (uint64_t *)&v59);
    sub_1DB3BC58C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v21 + 22) = 2112;
    *(_QWORD *)&v58[0] = v2;
    v32 = v2;
    v10 = v20;
    sub_1DB3BC58C();
    v33 = v48;
    *v48 = v2;

    v34 = v51;
    _os_log_impl(&dword_1DB30C000, v51, (os_log_type_t)v49, "HPMHeadphoneManager: removeTopLevelEntry %s  %s %@", (uint8_t *)v21, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA6F8);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v33, -1, -1);
    v35 = v50;
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v35, -1, -1);
    MEMORY[0x1DF0AD404](v21, -1, -1);

    (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v54);
    v19 = (_QWORD *)&unk_1F02DD000;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v53 + 8))(v9, v54);
  }
  if (v19[260] != -1)
    goto LABEL_19;
LABEL_8:
  v36 = sub_1DB3BBF5C();
  v38 = v37;
  swift_beginAccess();
  v39 = qword_1F02DB0D8;
  if (*(_QWORD *)(qword_1F02DB0D8 + 16) && (v40 = sub_1DB389660(v36, v38), (v41 & 1) != 0))
  {
    v42 = *(void **)(*(_QWORD *)(v39 + 56) + 8 * v40);
    v43 = v42;
  }
  else
  {
    v42 = 0;
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  objc_msgSend(v2, sel_setHasBackend_, 0);
  objc_msgSend(v42, sel_setHasBackend_, 0);
  sub_1DB391210(v42, v2);
  sub_1DB38F32C();
  v44 = objc_msgSend(v10, sel_weakHashTblCopy);
  v45 = objc_msgSend(v44, sel_objectEnumerator);

  v46 = v45;
  sub_1DB3BC46C();

  sub_1DB384718(&qword_1F02DA6E8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFB58], MEMORY[0x1E0CAFB80]);
  sub_1DB3BC580();
  while (v60)
  {
    sub_1DB385AA8(&v59, v58);
    sub_1DB389F80((uint64_t)v58, (uint64_t)v57);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA6F0);
    if (swift_dynamicCast())
    {
      objc_msgSend(v56, sel_removeTopLevelEntryWithHpDevice_, v2);
      swift_unknownObjectRelease();
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v58);
    sub_1DB3BC580();
  }
  (*(void (**)(char *, uint64_t))(v55 + 8))(v6, v4);

}

void sub_1DB390360(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = a1;
    v29 = MEMORY[0x1E0DEE9D8];
    sub_1DB391004(0, v1, 0);
    v3 = v29;
    v4 = sub_1DB391188(v2);
    v6 = v5;
    v7 = 0;
    v8 = v2 + 64;
    v24 = v2 + 80;
    v25 = v1;
    v26 = v2 + 64;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(_BYTE *)(v2 + 32))
    {
      v11 = (unint64_t)v4 >> 6;
      if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v4 >> 6)) & (1 << v4)) == 0)
        goto LABEL_25;
      if (*(_DWORD *)(v2 + 36) != v6)
        goto LABEL_26;
      v28 = v3;
      v12 = *(id *)(*(_QWORD *)(v2 + 56) + 8 * v4);
      sub_1DB3BC5E0();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA190);
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_1DB3C1810;
      *(_QWORD *)(v13 + 56) = sub_1DB3BBF68();
      *(_QWORD *)(v13 + 64) = sub_1DB384718((unint64_t *)&qword_1F02DA700, (uint64_t (*)(uint64_t))MEMORY[0x1E0D288F8], MEMORY[0x1E0DEFD08]);
      *(_QWORD *)(v13 + 32) = v12;
      v14 = v12;
      sub_1DB3BC34C();
      sub_1DB3BC388();
      swift_bridgeObjectRelease();
      sub_1DB3BC388();
      sub_1DB3BBF5C();
      sub_1DB3BC388();
      swift_bridgeObjectRelease();
      sub_1DB3BC388();
      objc_msgSend(v14, sel_hasBackend);
      sub_1DB3BC388();
      swift_bridgeObjectRelease();
      sub_1DB3BC388();
      if (v27)
      {
        swift_release();

        return;
      }
      v15 = v2;

      v3 = v28;
      v17 = *(_QWORD *)(v28 + 16);
      v16 = *(_QWORD *)(v28 + 24);
      if (v17 >= v16 >> 1)
      {
        sub_1DB391004(v16 > 1, v17 + 1, 1);
        v3 = v28;
      }
      *(_QWORD *)(v3 + 16) = v17 + 1;
      v18 = v3 + 16 * v17;
      *(_QWORD *)(v18 + 32) = 0xD000000000000011;
      *(_QWORD *)(v18 + 40) = 0x80000001DB3C9C80;
      v9 = 1 << *(_BYTE *)(v15 + 32);
      if (v4 >= v9)
        goto LABEL_27;
      v8 = v26;
      v19 = *(_QWORD *)(v26 + 8 * v11);
      if ((v19 & (1 << v4)) == 0)
        goto LABEL_28;
      v2 = v15;
      if (*(_DWORD *)(v15 + 36) != v6)
        goto LABEL_29;
      v20 = v19 & (-2 << (v4 & 0x3F));
      if (v20)
      {
        v9 = __clz(__rbit64(v20)) | v4 & 0xFFFFFFFFFFFFFFC0;
        v10 = v25;
      }
      else
      {
        v21 = v11 + 1;
        v22 = (unint64_t)(v9 + 63) >> 6;
        v10 = v25;
        if (v11 + 1 < v22)
        {
          v23 = *(_QWORD *)(v26 + 8 * v21);
          if (v23)
          {
LABEL_21:
            v9 = __clz(__rbit64(v23)) + (v21 << 6);
          }
          else
          {
            while (v22 - 2 != v11)
            {
              v23 = *(_QWORD *)(v24 + 8 * v11++);
              if (v23)
              {
                v21 = v11 + 1;
                goto LABEL_21;
              }
            }
          }
        }
      }
      ++v7;
      v4 = v9;
      if (v7 == v10)
        return;
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
  }
}

void sub_1DB390738(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  id v14;

  v2 = 0;
  v4 = a1 + 64;
  v3 = *(_QWORD *)(a1 + 64);
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & v3;
  v8 = (unint64_t)(v5 + 63) >> 6;
  if ((v6 & v3) != 0)
    goto LABEL_6;
LABEL_7:
  v11 = v2 + 1;
  if (!__OFADD__(v2, 1))
  {
    if (v11 < v8)
    {
      v12 = *(_QWORD *)(v4 + 8 * v11);
      ++v2;
      if (v12)
        goto LABEL_22;
      v2 = v11 + 1;
      if (v11 + 1 >= v8)
        goto LABEL_26;
      v12 = *(_QWORD *)(v4 + 8 * v2);
      if (v12)
        goto LABEL_22;
      v2 = v11 + 2;
      if (v11 + 2 >= v8)
        goto LABEL_26;
      v12 = *(_QWORD *)(v4 + 8 * v2);
      if (v12)
        goto LABEL_22;
      v2 = v11 + 3;
      if (v11 + 3 >= v8)
        goto LABEL_26;
      v12 = *(_QWORD *)(v4 + 8 * v2);
      if (v12)
      {
LABEL_22:
        v7 = (v12 - 1) & v12;
        for (i = __clz(__rbit64(v12)) + (v2 << 6); ; i = v9 | (v2 << 6))
        {
          v14 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * i);
          if (objc_msgSend(v14, sel_hasBackend))
          {
            sub_1DB3BC61C();
            sub_1DB3BC640();
            sub_1DB3BC64C();
            sub_1DB3BC628();
            if (!v7)
              goto LABEL_7;
          }
          else
          {

            if (!v7)
              goto LABEL_7;
          }
LABEL_6:
          v9 = __clz(__rbit64(v7));
          v7 &= v7 - 1;
        }
      }
      v13 = v11 + 4;
      if (v13 < v8)
      {
        v12 = *(_QWORD *)(v4 + 8 * v13);
        if (v12)
        {
          v2 = v13;
          goto LABEL_22;
        }
        while (1)
        {
          v2 = v13 + 1;
          if (__OFADD__(v13, 1))
            goto LABEL_28;
          if (v2 >= v8)
            break;
          v12 = *(_QWORD *)(v4 + 8 * v2);
          ++v13;
          if (v12)
            goto LABEL_22;
        }
      }
    }
LABEL_26:
    swift_release();
    return;
  }
  __break(1u);
LABEL_28:
  __break(1u);
}

uint64_t sub_1DB3908F8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  id v4;
  id v5;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA190);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1DB3C1810;
  v2 = sub_1DB3BBF68();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D288F8];
  *(_QWORD *)(v1 + 56) = v2;
  *(_QWORD *)(v1 + 64) = sub_1DB384718((unint64_t *)&qword_1F02DA700, v3, MEMORY[0x1E0DEFD08]);
  *(_QWORD *)(v1 + 32) = v0;
  v4 = v0;
  v7 = sub_1DB3BC34C();
  sub_1DB3BC388();
  v5 = objc_msgSend(v4, sel_description);
  sub_1DB3BC340();

  sub_1DB3BC388();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1DB3909EC(uint64_t a1, char a2)
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
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA510);
  v38 = a2;
  v6 = sub_1DB3BC688();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
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
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_1DB3BC70C();
    sub_1DB3BC370();
    result = sub_1DB3BC724();
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
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void sub_1DB390CF8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1DB389660(a2, a3);
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
    sub_1DB390E54();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_1DB3909EC(v15, a4 & 1);
  v20 = sub_1DB389660(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_1DB3BC6F4();
  __break(1u);
}

id sub_1DB390E54()
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
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA510);
  v2 = *v0;
  v3 = sub_1DB3BC67C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
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
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
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

uint64_t sub_1DB391004(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DB391020(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DB391020(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA520);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1DB3BC6A0();
  __break(1u);
  return result;
}

uint64_t sub_1DB391188(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_1DB391210(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t (*v14)(NSObject *, uint64_t);
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  char isUniquelyReferenced_nonNull_native;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  id v32;
  _QWORD *v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint8_t *v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  id v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t (*v63)(NSObject *, uint64_t);
  uint64_t v64;
  uint64_t v65[3];

  v4 = sub_1DB3BC0DC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = ((char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v56 - v10;
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v56 - v12;
  if (a1)
  {
    v60 = sub_1DB3908F8();
    v63 = v14;
    v15 = a1;
    sub_1DB3BBE24();
    v16 = (void *)sub_1DB3BBFF8();
    swift_release();
    v61 = v4;
    v17 = (void *)sub_1DB3BBE3C();
    if (v16)
    {
      sub_1DB3BBF50();

    }
    else
    {
      sub_1DB3BBF44();
    }

    v24 = (void *)sub_1DB3BBE48();
    v25 = (void *)sub_1DB3BBFB0();

    v26 = (unint64_t)v63;
    v62 = v15;
    if (v25)
    {
      v59 = v5;
      v27 = (void *)sub_1DB3BBE48();
      sub_1DB3BBFA4();

      sub_1DB3BC0AC();
      swift_bridgeObjectRetain_n();
      v28 = v25;
      v29 = sub_1DB3BC0C4();
      v30 = sub_1DB3BC484();
      v58 = v29;
      if (os_log_type_enabled(v29, v30))
      {
        v31 = swift_slowAlloc();
        v56 = (_QWORD *)swift_slowAlloc();
        v57 = swift_slowAlloc();
        v65[0] = v57;
        *(_DWORD *)v31 = 136315394;
        swift_bridgeObjectRetain();
        v64 = sub_1DB388E4C(v60, v26, v65);
        sub_1DB3BC58C();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v31 + 12) = 2112;
        v64 = (uint64_t)v28;
        v32 = v28;
        v26 = (unint64_t)v63;
        sub_1DB3BC58C();
        v33 = v56;
        *v56 = v25;

        v34 = v58;
        _os_log_impl(&dword_1DB30C000, v58, v30, "HPMHeadphoneManager updateHeadphoneDevice hearing record for fetched:%s with updated record %@", (uint8_t *)v31, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA6F8);
        swift_arrayDestroy();
        MEMORY[0x1DF0AD404](v33, -1, -1);
        v35 = v57;
        swift_arrayDestroy();
        MEMORY[0x1DF0AD404](v35, -1, -1);
        MEMORY[0x1DF0AD404](v31, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v45 = *(void (**)(char *, uint64_t))(v59 + 8);
      v46 = v61;
      v45(v13, v61);
    }
    else
    {
      v58 = v8;
      sub_1DB3BC0AC();
      v36 = a2;
      v37 = sub_1DB3BC0C4();
      v38 = sub_1DB3BC484();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = (uint8_t *)swift_slowAlloc();
        v40 = swift_slowAlloc();
        v59 = v5;
        v41 = v40;
        v65[0] = v40;
        *(_DWORD *)v39 = 136315138;
        v42 = sub_1DB3908F8();
        v64 = sub_1DB388E4C(v42, v43, v65);
        sub_1DB3BC58C();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1DB30C000, v37, v38, "HPMHeadphoneManager no incoming record for incomingDevice:%s", v39, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1DF0AD404](v41, -1, -1);
        v44 = v39;
        v26 = (unint64_t)v63;
        MEMORY[0x1DF0AD404](v44, -1, -1);

        v45 = *(void (**)(char *, uint64_t))(v59 + 8);
      }
      else
      {

        v45 = *(void (**)(char *, uint64_t))(v5 + 8);
      }
      v46 = v61;
      v45(v11, v61);
      v8 = v58;
    }
    sub_1DB3BC0AC();
    v47 = a2;
    swift_bridgeObjectRetain();
    v48 = v47;
    v49 = sub_1DB3BC0C4();
    v50 = sub_1DB3BC484();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = swift_slowAlloc();
      v52 = swift_slowAlloc();
      v65[0] = v52;
      *(_DWORD *)v51 = 136315394;
      swift_bridgeObjectRetain();
      v53 = sub_1DB388E4C(v60, v26, v65);
      v63 = (uint64_t (*)(NSObject *, uint64_t))v45;
      v64 = v53;
      sub_1DB3BC58C();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v51 + 12) = 2080;
      v54 = sub_1DB3908F8();
      v64 = sub_1DB388E4C(v54, v55, v65);
      sub_1DB3BC58C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1DB30C000, v49, v50, "HPMHeadphoneManager updateHeadphoneDevice fetchedDevice:%s ::::: incomingDevice:%s", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1DF0AD404](v52, -1, -1);
      MEMORY[0x1DF0AD404](v51, -1, -1);

      return v63(v8, v46);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      return ((uint64_t (*)(NSObject *, uint64_t))v45)(v8, v46);
    }
  }
  else
  {
    if (qword_1F02DD820 != -1)
      swift_once();
    v18 = sub_1DB3BBF5C();
    v20 = v19;
    swift_beginAccess();
    v21 = a2;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v64 = qword_1F02DB0D8;
    qword_1F02DB0D8 = 0x8000000000000000;
    sub_1DB390CF8((uint64_t)v21, v18, v20, isUniquelyReferenced_nonNull_native);
    qword_1F02DB0D8 = v64;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
}

ValueMetadata *_s14AssociatedKeysVMa()
{
  return &_s14AssociatedKeysVN;
}

uint64_t sub_1DB391938()
{
  uint64_t v0;

  v0 = sub_1DB3BC0DC();
  __swift_allocate_value_buffer(v0, qword_1F02DB0E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB0E0);
  return sub_1DB3BC0D0();
}

uint64_t sub_1DB3919A4()
{
  uint64_t v0;

  if (qword_1F02DD830 != -1)
    swift_once();
  v0 = sub_1DB3BC0DC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB0E0);
}

uint64_t sub_1DB3919EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F02DD830 != -1)
    swift_once();
  v2 = sub_1DB3BC0DC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02DB0E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DB391A5C()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  sub_1DB38507C(0, &qword_1F02DA708);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1DB3BBC8C();

  return v2;
}

void sub_1DB391B24()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = (void *)sub_1DB3BC31C();
  v2 = objc_msgSend((id)objc_opt_self(), sel_presenterForPrivacySplashWithIdentifier_, v1);

  if (v2)
    objc_msgSend(v2, sel_setPresentingViewController_, v0);
  objc_msgSend(v2, sel_present);

}

uint64_t BTSDeviceConfigController.b498Specifiers.getter()
{
  void *v0;
  id v1;
  uint64_t ObjCClassFromMetadata;
  void *v3;
  id v4;
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
  uint64_t v18;
  id v19;
  char v20;
  __n128 v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  __int128 v34;
  __int128 v35;
  __n128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[21];

  if (!objc_msgSend(v0, sel_device))
    return MEMORY[0x1E0DEE9D8];
  swift_getObjectType();
  v1 = sub_1DB397518();
  swift_unknownObjectRelease();
  if (!v1)
    return MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4F8);
  sub_1DB38507C(0, &qword_1F02DA708);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  v5 = sub_1DB3BBC8C();
  v7 = v6;

  v8 = sub_1DB38CD8C();
  v10 = sub_1DB38CD98(v5, v7, v8, v9);
  v11 = MEMORY[0x1E0C80A78](v10);
  v12 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v11 + 144))(sub_1DB392540);
  swift_release();
  v13 = objc_msgSend(v3, (SEL)&off_1EA2B1700 + 1, ObjCClassFromMetadata);
  v14 = sub_1DB3BBC8C();
  v16 = v15;

  v38 = 0u;
  v37 = 0u;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v1;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v1;
  v19 = v1;
  v20 = sub_1DB38CB14();
  *((_QWORD *)&v35 + 1) = sub_1DB3925C0;
  *((_QWORD *)&v34 + 1) = sub_1DB39256C;
  *(_QWORD *)&v35 = v17;
  *(_QWORD *)&v34 = 0;
  v21 = sub_1DB38CCD8(0, 0, v14, v16, (uint64_t)&v37, 0, 0, 6, (uint64_t)v39, 0, v20 & 1, v34, v35, (__n128)(unint64_t)v18, 0);
  v22 = (*(uint64_t (**)(_QWORD *, __n128))(*(_QWORD *)v12 + 152))(v39, v21);
  swift_release();
  sub_1DB389DF8(v39);
  v23 = (*(uint64_t (**)(void (*)(void *), _QWORD))(*(_QWORD *)v22 + 168))(sub_1DB39260C, 0);
  swift_release();
  v24 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  v25 = sub_1DB3BBC8C();
  v27 = v26;

  v38 = 0u;
  v37 = 0u;
  v28 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v29 = sub_1DB38CB14();
  v36.n128_u64[1] = (unint64_t)sub_1DB392684;
  v36.n128_u64[0] = 0;
  sub_1DB38CCD8(0, 0, v25, v27, (uint64_t)&v37, 0, 0, 13, (uint64_t)v39, 0, v29 & 1, 0, 0, v36, v28);
  swift_release();
  v30 = (*(uint64_t (**)(_QWORD *))(*(_QWORD *)v23 + 152))(v39);
  swift_release();
  v31 = sub_1DB389DF8(v39);
  v32 = (*(uint64_t (**)(_QWORD *))(*(_QWORD *)v30 + 176))(v31);

  swift_release();
  return v32;
}

void sub_1DB392164(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t ObjCClassFromMetadata;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  objc_class *v21;
  NSString *v22;
  id v23;
  void *v24;
  NSString *v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSRange v34;

  v28 = a2;
  v29 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA7B0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB38507C(0, &qword_1F02DA708);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  v8 = sub_1DB3BBC8C();
  v10 = v9;

  v11 = objc_msgSend(v6, sel_bundleForClass_, ObjCClassFromMetadata);
  v12 = sub_1DB3BBC8C();
  v14 = v13;

  v32 = v8;
  v33 = v10;
  v30 = v12;
  v31 = v14;
  v15 = sub_1DB3BBD28();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v4, 1, 1, v15);
  sub_1DB397260();
  v16 = sub_1DB3BC5A4();
  v18 = v17;
  v20 = v19;
  sub_1DB3972A4((uint64_t)v4);
  swift_bridgeObjectRelease();
  if ((v20 & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1DB38507C(0, &qword_1F02DA7C0);
    v21 = (objc_class *)swift_getObjCClassFromMetadata();
    v22 = NSStringFromClass(v21);
    if (!v22)
    {
      sub_1DB3BC340();
      v22 = (NSString *)sub_1DB3BC31C();
      swift_bridgeObjectRelease();
    }
    v23 = v29;
    objc_msgSend(v29, sel_setProperty_forKey_, v22, *MEMORY[0x1E0D80818], v28);

    v24 = (void *)sub_1DB3BC31C();
    objc_msgSend(v23, sel_setProperty_forKey_, v24, *MEMORY[0x1E0D80838]);

    v32 = v16;
    v33 = v18;
    v30 = v8;
    v31 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA7C8);
    sub_1DB3972E4();
    v34.location = sub_1DB3BC520();
    v25 = NSStringFromRange(v34);
    if (!v25)
    {
      sub_1DB3BC340();
      v25 = (NSString *)sub_1DB3BC31C();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v23, sel_setProperty_forKey_, v25, *MEMORY[0x1E0D80828]);

    v26 = objc_msgSend((id)objc_opt_self(), sel_valueWithNonretainedObject_, v28);
    objc_msgSend(v23, sel_setProperty_forKey_, v26, *MEMORY[0x1E0D80830]);

    v27 = (void *)sub_1DB3BC31C();
    objc_msgSend(v23, sel_setProperty_forKey_, v27, *MEMORY[0x1E0D80820]);

  }
}

void sub_1DB392540(void *a1)
{
  uint64_t v1;

  sub_1DB392164(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1DB392548()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1DB39256C()
{
  int v0;

  sub_1DB3BBE24();
  v0 = sub_1DB3BC034();
  swift_release();
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, v0 == 1);
}

uint64_t sub_1DB3925C0(void *a1)
{
  sub_1DB3BBE24();
  objc_msgSend(a1, sel_BOOLValue);
  sub_1DB3BC040();
  return swift_release();
}

void sub_1DB39260C(void *a1)
{
  id v2;

  v2 = (id)sub_1DB3BC40C();
  objc_msgSend(a1, sel_setProperty_forKey_, v2, *MEMORY[0x1E0D80808]);

}

uint64_t sub_1DB392660()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1DB392684()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  _BYTE v7[72];

  v1 = v0 + 16;
  sub_1DB396414((uint64_t)v7);
  v2 = objc_allocWithZone((Class)type metadata accessor for B498TutorialController());
  v3 = sub_1DB393254((uint64_t)v7);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3A40]), sel_initWithRootViewController_, v3);

  swift_beginAccess();
  v5 = (void *)MEMORY[0x1DF0AD470](v1);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_presentViewController_animated_completion_, v4, 1, 0);

  }
}

uint64_t sub_1DB392738@<X0>(uint64_t a1@<X8>)
{
  _BYTE v3[72];

  sub_1DB396414((uint64_t)v3);
  return sub_1DB396AA0((uint64_t)v3, a1);
}

id sub_1DB392770(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return sub_1DB393254(a1);
}

void sub_1DB3927A0()
{
  uint64_t v0;
  _BYTE v1[80];

  sub_1DB396AA0(v0, (uint64_t)v1);
  __asm { BR              X13 }
}

__n128 sub_1DB392808()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __n128 result;
  __int128 v18;
  uint64_t v19;
  _QWORD v20[4];
  __n128 v21;
  __int128 v22;

  sub_1DB38507C(0, &qword_1F02DA708);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v19 = sub_1DB3BBC8C();
  v5 = v4;

  v6 = objc_msgSend(v2, (SEL)&off_1EA2B1700 + 1, ObjCClassFromMetadata, 0xE000000000000000);
  v7 = sub_1DB3BBC8C();
  v9 = v8;

  v10 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v11 = sub_1DB3BBC8C();
  v13 = v12;

  sub_1DB398BA8(v19, v5, v7, v9, v11, v13, 0, 0, v20);
  v14 = v20[1];
  v15 = v20[2];
  v16 = v20[3];
  result = v21;
  v18 = v22;
  *(_QWORD *)v0 = v20[0];
  *(_QWORD *)(v0 + 8) = v14;
  *(_QWORD *)(v0 + 16) = v15;
  *(_QWORD *)(v0 + 24) = v16;
  *(__n128 *)(v0 + 32) = result;
  *(_OWORD *)(v0 + 48) = v18;
  *(_BYTE *)(v0 + 64) = 1;
  return result;
}

__n128 sub_1DB392D3C@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __int128 v6;
  __int128 v7;
  __n128 v8;
  _OWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  sub_1DB396AA0(v1, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  v7 = v9[1];
  v8 = (__n128)v9[2];
  v6 = v9[0];
  sub_1DB3971FC(v1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB396AC8);
  *(_OWORD *)a1 = v6;
  *(_OWORD *)(a1 + 16) = v7;
  result = v8;
  *(__n128 *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 48) = v3;
  *(_QWORD *)(a1 + 56) = v4;
  return result;
}

void *sub_1DB392DB4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___player;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___player);
  v3 = v2;
  if (v2 == (void *)1)
  {
    v3 = (void *)sub_1DB392E20(v0);
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    v5 = v3;
    sub_1DB396C7C(v4);
  }
  sub_1DB396FF4(v2);
  return v3;
}

uint64_t sub_1DB392E20(uint64_t a1)
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
  id v12;
  uint64_t ObjCClassFromMetadata;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t result;
  id v20;
  void *v21;
  uint64_t v22;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA788);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DB3BBCD4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v22 - v10;
  v12 = 0;
  if (*(_BYTE *)(a1 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 64) != 3)
    return (uint64_t)v12;
  swift_getObjectType();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v14 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v15 = (void *)sub_1DB3BC31C();
  v16 = (void *)sub_1DB3BC31C();
  v17 = objc_msgSend(v14, sel_URLForResource_withExtension_, v15, v16);

  if (v17)
  {
    sub_1DB3BBCBC();

    v18 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v18(v4, v9, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
    if ((_DWORD)result != 1)
    {
      v18(v11, v4, v5);
      v20 = objc_allocWithZone((Class)HPSMovieLoopPlayer);
      v21 = (void *)sub_1DB3BBCB0();
      v12 = objc_msgSend(v20, sel_initWithFrame_urlForResource_, v21, 0.0, 0.0, 0.0, 0.0);

      objc_msgSend(v12, sel_load);
      objc_msgSend(v12, sel_setDesiredBounds_, 0.0, 0.0, 150.0, 150.0);
      objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
      return (uint64_t)v12;
    }
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  __break(1u);
  return result;
}

id sub_1DB3930D0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___continueButton;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___continueButton);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___continueButton);
  }
  else
  {
    v4 = v0;
    v5 = objc_msgSend((id)objc_opt_self(), sel_boldButton);
    v6 = *(_QWORD *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 40);
    v7 = *(void **)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 48);
    sub_1DB396AC8(*(_QWORD *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType), *(_QWORD *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 8), *(_QWORD *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 16), *(_QWORD *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 24), *(_QWORD *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 32), v6, v7, *(_QWORD *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 56), *(_BYTE *)(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 64));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    if (v6)
    {
      v8 = (void *)sub_1DB3BC31C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v5, sel_setTitle_forState_, v8, 0);

    v9 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    sub_1DB3B0188((uint64_t)sub_1DB397004, v9);
    swift_release_n();
    v10 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v11 = v2;
  return v3;
}

id sub_1DB393254(uint64_t a1)
{
  char *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;
  _BYTE v11[8];
  void *v12;
  _BYTE v13[8];
  void *v14;
  _QWORD v15[7];

  *(_QWORD *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___player] = 1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController____lazy_storage___continueButton] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_contentHeightConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_micaView] = 0;
  sub_1DB396AA0(a1, (uint64_t)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType]);
  sub_1DB396AA0(a1, (uint64_t)v15);
  v3 = (void *)v15[6];
  sub_1DB3971FC(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB396AC8);
  sub_1DB3971FC(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB396AC8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v4 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  sub_1DB396AA0(a1, (uint64_t)v13);
  v5 = v14;
  sub_1DB3971FC(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB396AC8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v6 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  sub_1DB396AA0(a1, (uint64_t)v11);
  v7 = v12;
  sub_1DB3971FC(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB396AC8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for B498TutorialController();
  v8 = objc_msgSendSuper2(&v10, sel_initWithTitle_detailText_icon_contentLayout_, v4, v6, v7, 2);
  sub_1DB3971FC(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB396B64);

  return v8;
}

uint64_t sub_1DB39343C()
{
  void *v0;
  void *v1;
  uint64_t ObjectType;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  objc_super v20;

  v1 = v0;
  ObjectType = swift_getObjectType();
  v20.receiver = v0;
  v20.super_class = (Class)type metadata accessor for B498TutorialController();
  objc_msgSendSuper2(&v20, sel_viewDidLoad);
  objc_msgSend(v0, sel_setModalInPresentation_, 1);
  v3 = objc_msgSend(v0, sel_navigationItem);
  objc_msgSend(v3, sel_setHidesBackButton_, 1);

  v4 = objc_msgSend(v1, sel_contentView);
  v5 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v4, sel_setBackgroundColor_, v5);

  v6 = objc_msgSend(v1, sel_buttonTray);
  v7 = sub_1DB3930D0();
  objc_msgSend(v6, sel_addButton_, v7);

  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 1, v1, 0);
  v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1DB3B066C((uint64_t)sub_1DB396BD0, v9);
  swift_release_n();
  v10 = objc_msgSend(v1, sel_navigationItem);
  objc_msgSend(v10, sel_setLeftBarButtonItem_, v8);

  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = swift_retain();
  sub_1DB39371C(v12);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA738);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1DB3C16B0;
  v14 = sub_1DB3BC0E8();
  v15 = MEMORY[0x1E0DC2160];
  *(_QWORD *)(v13 + 32) = v14;
  *(_QWORD *)(v13 + 40) = v15;
  v16 = sub_1DB3BC184();
  v17 = MEMORY[0x1E0DC29B0];
  *(_QWORD *)(v13 + 48) = v16;
  *(_QWORD *)(v13 + 56) = v17;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = sub_1DB396C30;
  v18[3] = v11;
  v18[4] = ObjectType;
  swift_retain();
  sub_1DB3BC49C();

  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

void sub_1DB39371C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = (_QWORD *)MEMORY[0x1DF0AD470](v1);
  if (v2)
  {
    v3 = v2;
    (*(void (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2)
                      + 8
                      * qword_1DB3C20D0[*((char *)v2
                                        + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType
                                        + 64)]))();

  }
}

void sub_1DB3937D4()
{
  char *v0;
  void *v1;
  id v2;
  double v3;
  double v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double Width;
  objc_super v15;
  CGRect v16;

  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for B498TutorialController();
  objc_msgSendSuper2(&v15, sel_viewDidLayoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_contentHeightConstraint];
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v0, sel_availableContentViewHeight);
    v4 = v3;
    v5 = objc_msgSend(v0, sel_contentView);
    objc_msgSend(v5, sel_bounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v16.origin.x = v7;
    v16.origin.y = v9;
    v16.size.width = v11;
    v16.size.height = v13;
    Width = CGRectGetWidth(v16);
    if (v4 > Width)
      Width = v4;
    objc_msgSend(v2, sel_setConstant_, Width);

  }
}

void sub_1DB3938F0(char a1)
{
  char *v1;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for B498TutorialController();
  objc_msgSendSuper2(&v8, sel_viewDidAppear_, a1 & 1);
  v3 = sub_1DB392DB4();
  objc_msgSend(v3, sel_play);

  v4 = objc_msgSend(v1, sel_traitCollection);
  objc_msgSend(v4, sel_userInterfaceStyle);

  v5 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_micaView];
  if (v5)
  {
    v6 = v5;
    v7 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setState_animated_, v7, 1);

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void sub_1DB393A58()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v2 = *(void **)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 48);
  v1 = *(_QWORD *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 56);
  sub_1DB396AC8(*(_QWORD *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType), *(_QWORD *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 8), *(_QWORD *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 16), *(_QWORD *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 24), *(_QWORD *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 32), *(_QWORD *)((char *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 40), v2, v1, *((_BYTE *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType + 64));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v1)
  {
    v3 = objc_msgSend(v0, sel_contentView);
    v4 = objc_msgSend(v3, sel_subviews);

    sub_1DB38507C(0, &qword_1F02DA458);
    v5 = sub_1DB3BC3C4();

    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      v6 = sub_1DB3BC670();
      swift_bridgeObjectRelease();
    }
    else
    {
      v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (!v6)
    {
      v7 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x110))(v1);
      swift_bridgeObjectRelease();
      v8 = *(_QWORD *)(v7 + 16);
      if (v8)
      {
        v16 = v0;
        swift_bridgeObjectRetain();
        v9 = v7 + 48;
        do
        {
          v11 = *(void **)(v9 + 32);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v12 = v11;
          v13 = (void *)sub_1DB3BC31C();
          v14 = (void *)sub_1DB3BC31C();
          v15 = v12;
          if (!v11)
            v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3870]), sel_init);
          v10 = v12;
          objc_msgSend(v16, sel_addBulletedListItemWithTitle_description_image_, v13, v14, v15);
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          v9 += 64;
          --v8;
        }
        while (v8);
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
  }
}

void sub_1DB393D04(void *a1)
{
  char *v1;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
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
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;

  v3 = objc_msgSend(v1, sel_contentView);
  v4 = objc_msgSend(v3, sel_heightAnchor);

  v5 = objc_msgSend(v4, sel_constraintEqualToConstant_, 200.0);
  v6 = OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_contentHeightConstraint;
  v7 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_contentHeightConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_contentHeightConstraint] = v5;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1DB3C1E90;
  v9 = objc_msgSend(a1, sel_centerYAnchor);
  v10 = objc_msgSend(v1, sel_contentView);
  v11 = objc_msgSend(v10, sel_centerYAnchor);

  v12 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v11);
  *(_QWORD *)(v8 + 32) = v12;
  v13 = objc_msgSend(a1, sel_centerXAnchor);
  v14 = objc_msgSend(v1, sel_contentView);
  v15 = objc_msgSend(v14, sel_centerXAnchor);

  v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
  *(_QWORD *)(v8 + 40) = v16;
  v17 = objc_msgSend(a1, sel_widthAnchor);
  v18 = objc_msgSend(v1, sel_contentView);
  v19 = objc_msgSend(v18, sel_widthAnchor);

  v20 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v19);
  *(_QWORD *)(v8 + 48) = v20;
  v21 = objc_msgSend(a1, sel_heightAnchor);
  v22 = objc_msgSend(a1, sel_widthAnchor);
  v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

  *(_QWORD *)(v8 + 56) = v23;
  v24 = *(void **)&v1[v6];
  if (v24)
  {
    v25 = (void *)objc_opt_self();
    *(_QWORD *)(v8 + 64) = v24;
    sub_1DB3BC3DC();
    sub_1DB38507C(0, (unint64_t *)&qword_1F02DA358);
    v26 = v24;
    v27 = (id)sub_1DB3BC3B8();
    swift_bridgeObjectRelease();
    objc_msgSend(v25, sel_activateConstraints_, v27);

  }
  else
  {
    __break(1u);
  }
}

void sub_1DB394020()
{
  char *v0;
  id v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  id v8;
  uint64_t ObjCClassFromMetadata;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;

  v1 = objc_msgSend(v0, sel_contentView);
  v2 = objc_msgSend(v1, sel_subviews);

  sub_1DB38507C(0, &qword_1F02DA458);
  v3 = sub_1DB3BC3C4();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_1DB3BC670();
    if (!v4)
      goto LABEL_10;
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v4)
      goto LABEL_10;
  }
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_20;
  }
  for (i = 0; i != v4; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0)
      v6 = (id)MEMORY[0x1DF0AC9FC](i, v3);
    else
      v6 = *(id *)(v3 + 8 * i + 32);
    v7 = v6;
    objc_msgSend(v6, sel_removeFromSuperview);

  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  v8 = objc_msgSend(v0, sel_traitCollection);
  objc_msgSend(v8, sel_userInterfaceStyle);

  type metadata accessor for B498TutorialController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v10 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v11 = objc_allocWithZone(MEMORY[0x1E0D01910]);
  v12 = (void *)sub_1DB3BC31C();
  v13 = objc_msgSend(v11, sel_initWithPackageName_inBundle_, v12, v10);

  v14 = OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_micaView;
  v15 = *(void **)&v0[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_micaView];
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_micaView] = v13;

  v16 = *(void **)&v0[v14];
  if (!v16)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v17 = objc_msgSend(v0, sel_view);
  if (!v17)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v18 = v17;
  v19 = objc_msgSend(v17, sel_window);

  if (v19 && (v20 = *(void **)&v0[v14]) != 0)
  {
    v21 = v20;
    v22 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_setState_animated_, v22, 1);

  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v23 = objc_msgSend(v0, sel_contentView);
  if (!*(_QWORD *)&v0[v14])
    goto LABEL_22;
  v24 = v23;
  objc_msgSend(v23, sel_addSubview_);

  v25 = *(void **)&v0[v14];
  if (v25)
  {
    v26 = v25;
    sub_1DB393D04(v26);

    return;
  }
LABEL_23:
  __break(1u);
}

void sub_1DB39436C()
{
  _QWORD *v0;
  id v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  uint64_t ObjCClassFromMetadata;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v1 = objc_msgSend(v0, sel_contentView);
  v2 = objc_msgSend(v1, sel_subviews);

  sub_1DB38507C(0, &qword_1F02DA458);
  v3 = sub_1DB3BC3C4();

  if (!(v3 >> 62))
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    type metadata accessor for B498TutorialController();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v9 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v10 = (void *)sub_1DB3BC31C();
    v11 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v10, v9);

    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithImage_, v11);
    objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v13, sel_setContentMode_, 1);
    (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x100))(v13);
    v12 = objc_msgSend(v0, sel_contentView);
    objc_msgSend(v12, sel_addSubview_, v13);

    sub_1DB393D04(v13);
    return;
  }
  swift_bridgeObjectRetain();
  v4 = sub_1DB3BC670();
  if (!v4)
    goto LABEL_10;
LABEL_3:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x1DF0AC9FC](i, v3);
      else
        v6 = *(id *)(v3 + 8 * i + 32);
      v7 = v6;
      objc_msgSend(v6, sel_removeFromSuperview);

    }
    goto LABEL_10;
  }
  __break(1u);
}

void sub_1DB3945D8(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  float v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  float v28;
  __int128 v29;
  int v30;
  float v31;
  __int128 v32;
  int v33;
  float v34;
  __int128 v35;
  uint64_t v36;
  int v37;

  v2 = v1;
  sub_1DB3BC340();
  v4 = objc_allocWithZone(MEMORY[0x1E0CD2780]);
  v5 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithType_, v5);

  sub_1DB3BC340();
  v7 = objc_allocWithZone(MEMORY[0x1E0CD2780]);
  v8 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_initWithType_, v8);

  v10 = objc_msgSend(v2, sel_traitCollection);
  v11 = objc_msgSend(v10, sel_userInterfaceStyle);

  v12 = MEMORY[0x1E0CD2338];
  if (v11 == (id)1)
    v13 = 1.0;
  else
    v13 = 0.98;
  v14 = *(_DWORD *)(MEMORY[0x1E0CD2338] + 20);
  v15 = *(_DWORD *)(MEMORY[0x1E0CD2338] + 44);
  v16 = *(_DWORD *)(MEMORY[0x1E0CD2338] + 76);
  v17 = (void *)objc_opt_self();
  v28 = v13;
  v29 = *(_OWORD *)(v12 + 4);
  v30 = v14;
  v31 = v13;
  v32 = *(_OWORD *)(v12 + 28);
  v33 = v15;
  v34 = v13;
  v35 = *(_OWORD *)(v12 + 52);
  v36 = *(_QWORD *)(v12 + 68);
  v37 = v16;
  v18 = objc_msgSend(v17, sel_valueWithCAColorMatrix_, &v28);
  v19 = (void *)sub_1DB3BC31C();
  objc_msgSend(v6, sel_setValue_forKey_, v18, v19);

  v20 = (void *)sub_1DB3BC43C();
  v21 = (void *)sub_1DB3BC31C();
  objc_msgSend(v9, sel_setValue_forKey_, v20, v21);

  v22 = objc_msgSend(a1, sel_layer);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4E0);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1DB3C16B0;
  v24 = sub_1DB38507C(0, &qword_1F02DA740);
  *(_QWORD *)(v23 + 32) = v6;
  *(_QWORD *)(v23 + 88) = v24;
  *(_QWORD *)(v23 + 56) = v24;
  *(_QWORD *)(v23 + 64) = v9;
  v25 = v6;
  v26 = v9;
  v27 = (void *)sub_1DB3BC3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setFilters_, v27);

}

void sub_1DB3948F4()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t ObjCClassFromMetadata;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void (*v42)(uint64_t, uint64_t, uint64_t, unint64_t, id, id, double);
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  double v58;
  id v59;
  void *v60;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  id v90;
  id v91;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_contentView);
  v3 = objc_msgSend(v2, sel_subviews);

  sub_1DB38507C(0, &qword_1F02DA458);
  v4 = sub_1DB3BC3C4();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1DB3BC670();
    if (!v5)
      goto LABEL_10;
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v5)
      goto LABEL_10;
  }
  if (v5 < 1)
  {
    __break(1u);
    goto LABEL_17;
  }
  for (i = 0; i != v5; ++i)
  {
    if ((v4 & 0xC000000000000001) != 0)
      v7 = (id)MEMORY[0x1DF0AC9FC](i, v4);
    else
      v7 = *(id *)(v4 + 8 * i + 32);
    v8 = v7;
    objc_msgSend(v7, sel_removeFromSuperview);

  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  v9 = sub_1DB392DB4();
  if (!v9)
    return;
  v10 = v9;
  v11 = objc_msgSend(v1, sel_contentView);
  objc_msgSend(v11, sel_addSubview_, v10);

  v12 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1DB3C1BA0;
  v14 = objc_msgSend(v10, sel_topAnchor);
  v15 = objc_msgSend(v1, sel_contentView);
  v16 = objc_msgSend(v15, sel_topAnchor);

  v17 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v16);
  *(_QWORD *)(v13 + 32) = v17;
  v18 = objc_msgSend(v10, sel_centerXAnchor);
  v19 = objc_msgSend(v1, sel_contentView);
  v20 = objc_msgSend(v19, sel_centerXAnchor);

  v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v20);
  *(_QWORD *)(v13 + 40) = v21;
  v22 = objc_msgSend(v10, sel_widthAnchor);
  v23 = objc_msgSend(v22, sel_constraintEqualToConstant_, 150.0);

  *(_QWORD *)(v13 + 48) = v23;
  v24 = objc_msgSend(v10, sel_heightAnchor);
  v25 = objc_msgSend(v10, sel_widthAnchor);
  v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

  *(_QWORD *)(v13 + 56) = v26;
  sub_1DB3BC3DC();
  sub_1DB38507C(0, (unint64_t *)&qword_1F02DA358);
  v27 = (void *)sub_1DB3BC3B8();
  swift_bridgeObjectRelease();
  v88 = v12;
  objc_msgSend(v12, sel_activateConstraints_, v27);

  v90 = v10;
  objc_msgSend(v10, sel_load);
  type metadata accessor for IconWithNumberedBulletList();
  sub_1DB38507C(0, &qword_1F02DA708);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v29 = (void *)objc_opt_self();
  v30 = objc_msgSend(v29, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1DB3BBC8C();
  v87 = v1;

  v31 = sub_1DB3BC364();
  v33 = v32;
  swift_bridgeObjectRelease();
  v34 = sub_1DB384B30(v31, v33, 0xD000000000000013, 0x80000001DB3C9FD0);
  objc_msgSend(v34, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0, 0xE000000000000000);
  v91 = objc_msgSend((id)objc_opt_self(), sel__preferredFontForTextStyle_weight_, *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC1440]);
  if (!v91)
  {
LABEL_17:
    __break(1u);
    return;
  }
  v35 = objc_msgSend(v29, sel_bundleForClass_, ObjCClassFromMetadata);
  v36 = sub_1DB3BBC8C();
  v38 = v37;

  v39 = (void *)objc_opt_self();
  v40 = v29;
  v41 = objc_msgSend(v39, sel_secondaryLabelColor, 0xE000000000000000);
  v42 = *(void (**)(uint64_t, uint64_t, uint64_t, unint64_t, id, id, double))((*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v34)
                                                                                           + 0xC8);
  v42(v36, v38, 49, 0xE100000000000000, v91, v41, 20.0);
  swift_bridgeObjectRelease();

  v43 = objc_msgSend(v40, sel_bundleForClass_, ObjCClassFromMetadata);
  v44 = sub_1DB3BBC8C();
  v46 = v45;

  v47 = objc_msgSend(v39, sel_secondaryLabelColor, 0xE000000000000000);
  v42(v44, v46, 50, 0xE100000000000000, v91, v47, 20.0);
  swift_bridgeObjectRelease();

  v48 = objc_msgSend(v40, sel_bundleForClass_, ObjCClassFromMetadata);
  v49 = sub_1DB3BBC8C();
  v51 = v50;

  v52 = objc_msgSend(v39, sel_secondaryLabelColor, 0xE000000000000000);
  v42(v49, v51, 51, 0xE100000000000000, v91, v52, 20.0);
  swift_bridgeObjectRelease();

  v53 = objc_msgSend(v87, sel_contentView);
  objc_msgSend(v53, sel_addSubview_, v34);

  v54 = objc_msgSend((id)objc_opt_self(), sel_accessoryButton);
  objc_msgSend(v54, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v55 = objc_msgSend(v40, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1DB3BBC8C();

  v56 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  objc_msgSend(v54, sel_setTitle_forState_, v56, 0, 0xE000000000000000);

  sub_1DB38507C(0, &qword_1F02DA748);
  v57 = (void *)sub_1DB3BC514();
  objc_msgSend(v54, sel_addAction_forControlEvents_, v57, 64, 0, 0, 0, sub_1DB39561C, 0);

  LODWORD(v58) = 1148846080;
  objc_msgSend(v54, sel_setContentCompressionResistancePriority_forAxis_, 1, v58);
  v59 = objc_msgSend(v54, sel_titleLabel);
  v60 = v59;
  if (v59)
  {
    objc_msgSend(v59, sel_setFont_, v91);

  }
  v61 = objc_msgSend(v87, sel_contentView);
  objc_msgSend(v61, sel_addSubview_, v54);

  v62 = swift_allocObject();
  *(_OWORD *)(v62 + 16) = xmmword_1DB3C1EA0;
  v63 = objc_msgSend(v34, sel_topAnchor);
  v64 = objc_msgSend(v90, sel_bottomAnchor);
  v65 = objc_msgSend(v63, sel_constraintEqualToAnchor_constant_, v64, 35.0);

  *(_QWORD *)(v62 + 32) = v65;
  v66 = objc_msgSend(v34, sel_leadingAnchor);
  v67 = objc_msgSend(v87, sel_contentView);
  v68 = objc_msgSend(v67, (SEL)&selRef_date + 6);

  v69 = objc_msgSend(v66, sel_constraintEqualToAnchor_, v68);
  *(_QWORD *)(v62 + 40) = v69;
  v70 = objc_msgSend(v34, sel_trailingAnchor);
  v71 = objc_msgSend(v87, (SEL)&selRef_isSmallScreenDevice);
  v72 = objc_msgSend(v71, sel_trailingAnchor);

  v73 = objc_msgSend(v70, sel_constraintEqualToAnchor_, v72);
  *(_QWORD *)(v62 + 48) = v73;
  v74 = objc_msgSend(v54, sel_topAnchor);
  v75 = objc_msgSend(v34, sel_bottomAnchor);
  v76 = objc_msgSend(v74, sel_constraintEqualToAnchor_constant_, v75, 24.0);

  *(_QWORD *)(v62 + 56) = v76;
  v77 = objc_msgSend(v54, sel_leadingAnchor);
  v78 = objc_msgSend(v34, sel_leadingAnchor);
  v79 = objc_msgSend(v77, sel_constraintEqualToAnchor_constant_, v78, 40.0);

  *(_QWORD *)(v62 + 64) = v79;
  v80 = objc_msgSend(v54, sel_trailingAnchor);
  v81 = objc_msgSend(v34, sel_trailingAnchor);
  v82 = objc_msgSend(v80, sel_constraintEqualToAnchor_constant_, v81, -40.0);

  *(_QWORD *)(v62 + 72) = v82;
  v83 = objc_msgSend(v87, sel_contentView);
  v84 = objc_msgSend(v83, sel_bottomAnchor);

  v85 = objc_msgSend(v54, sel_bottomAnchor);
  v86 = objc_msgSend(v84, sel_constraintEqualToAnchor_, v85);

  *(_QWORD *)(v62 + 80) = v86;
  sub_1DB3BC3DC();
  v89 = (id)sub_1DB3BC3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v88, sel_activateConstraints_, v89);

}

uint64_t sub_1DB39561C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA788);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v15 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1DB3BBCD4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB3BBCC8();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    v8 = (void *)objc_opt_self();
    v9 = objc_msgSend(v8, sel_sharedApplication);
    v10 = (void *)sub_1DB3BBCB0();
    v11 = objc_msgSend(v9, sel_canOpenURL_, v10);

    if (v11)
    {
      v12 = objc_msgSend(v8, sel_sharedApplication);
      v13 = (void *)sub_1DB3BBCB0();
      sub_1DB395818(MEMORY[0x1E0DEE9D8]);
      type metadata accessor for OpenExternalURLOptionsKey();
      sub_1DB39739C(&qword_1F02DA790, (uint64_t)&unk_1DB3C2084);
      v14 = (void *)sub_1DB3BC2EC();
      swift_bridgeObjectRelease();
      objc_msgSend(v12, sel_openURL_options_completionHandler_, v13, v14, 0);

    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

unint64_t sub_1DB395818(uint64_t a1)
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
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA798);
  v2 = sub_1DB3BC694();
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
    sub_1DB396FAC(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_1DB3859E0(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_1DB385AA8(&v14, (_OWORD *)(v3[7] + 32 * result));
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

id sub_1DB395930()
{
  id v0;
  uint64_t ObjCClassFromMetadata;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t inited;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v20;

  v0 = objc_msgSend((id)objc_opt_self(), sel_currentTraitCollection);
  objc_msgSend(v0, sel_userInterfaceStyle);

  sub_1DB3BC388();
  swift_getObjectType();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_imageNamed_inBundle_, v4, v3);

  sub_1DB3BC388();
  v7 = objc_msgSend(v2, (SEL)&off_1EA2B1700 + 1, ObjCClassFromMetadata);
  v8 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v5, sel_imageNamed_inBundle_, v8, v7);

  sub_1DB3BC388();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v11 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v5, sel_imageNamed_inBundle_, v11, v10);

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA750);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DB3C1B90;
  *(_QWORD *)(inited + 32) = v6;
  *(_QWORD *)(inited + 40) = v9;
  *(_QWORD *)(inited + 48) = v12;
  v20 = inited;
  sub_1DB3BC3DC();
  v14 = v6;
  v15 = v9;
  v16 = v12;
  v17 = swift_bridgeObjectRetain();
  v18 = sub_1DB395C34(v17, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v18;
}

id sub_1DB395C34(uint64_t a1, uint64_t a2)
{
  int64_t v4;
  uint64_t v5;
  void **v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id result;
  void *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  _OWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;
  unint64_t v24;
  void **v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  unint64_t v33;
  unint64_t v34;
  _OWORD *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  int64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  void **v48;
  void **v49;
  unint64_t v50;
  uint64_t v51;
  _OWORD v52[4];
  _OWORD v53[4];
  uint64_t v54;

  v43 = *(_QWORD *)(a1 + 16);
  if (*(_QWORD *)(a2 + 16) >= v43)
    v4 = *(_QWORD *)(a1 + 16);
  else
    v4 = *(_QWORD *)(a2 + 16);
  v54 = MEMORY[0x1E0DEE9D8];
  sub_1DB3962F8(0, v4, 0);
  v5 = v54;
  v41 = a2;
  v42 = a1;
  v39 = v4;
  if (v4)
  {
    v6 = (void **)(a2 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v7 = (uint64_t *)(a1 + 48);
    while (1)
    {
      v8 = *(v7 - 1);
      v45 = *(v7 - 2);
      v47 = v4;
      v9 = *v7;
      v10 = v7[1];
      v11 = (void *)v7[4];
      v12 = *v6;
      v49 = v6 + 1;
      v51 = v5;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v13 = v11;
      swift_bridgeObjectRetain();
      result = v12;
      if (!v8)
        break;
      v15 = result;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v16 = v15;
      sub_1DB398BA8(v45, v8, v9, v10, 0, 0, (uint64_t)v12, 0, v53);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = (id)swift_bridgeObjectRelease();
      v5 = v51;
      v54 = v51;
      v18 = *(_QWORD *)(v51 + 16);
      v17 = *(_QWORD *)(v51 + 24);
      if (v18 >= v17 >> 1)
      {
        result = sub_1DB3962F8((char *)(v17 > 1), v18 + 1, 1);
        v5 = v54;
      }
      *(_QWORD *)(v5 + 16) = v18 + 1;
      v19 = (_OWORD *)(v5 + (v18 << 6));
      v20 = v53[0];
      v21 = v53[1];
      v22 = v53[3];
      v19[4] = v53[2];
      v19[5] = v22;
      v19[2] = v20;
      v19[3] = v21;
      v7 += 8;
      v6 = v49;
      v4 = v47 - 1;
      if (v47 == 1)
        goto LABEL_12;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
    result = (id)swift_bridgeObjectRetain();
LABEL_12:
    if (v43 <= v40)
    {
LABEL_19:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (id)v5;
    }
    v23 = v40 - v39;
    v24 = v43 - v39;
    v25 = (void **)(v41 + 8 * v39 + 32);
    v26 = (uint64_t *)(v42 + (v39 << 6) + 48);
    while (v24)
    {
      if (v23)
      {
        v50 = v24;
        v27 = *(v26 - 1);
        v28 = v26[1];
        v44 = *v26;
        v46 = *(v26 - 2);
        v29 = (void *)v26[4];
        v30 = *v25;
        v48 = v25;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        v31 = v30;
        swift_bridgeObjectRetain();
        v32 = v29;
        sub_1DB398BA8(v46, v27, v44, v28, 0, 0, (uint64_t)v30, 0, v52);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        result = (id)swift_bridgeObjectRelease();
        v54 = v5;
        v34 = *(_QWORD *)(v5 + 16);
        v33 = *(_QWORD *)(v5 + 24);
        if (v34 >= v33 >> 1)
        {
          result = sub_1DB3962F8((char *)(v33 > 1), v34 + 1, 1);
          v5 = v54;
        }
        *(_QWORD *)(v5 + 16) = v34 + 1;
        v35 = (_OWORD *)(v5 + (v34 << 6));
        v36 = v52[0];
        v37 = v52[1];
        v38 = v52[3];
        v35[4] = v52[2];
        v35[5] = v38;
        v35[2] = v36;
        v35[3] = v37;
        --v23;
        v25 = v48 + 1;
        v26 += 8;
        v24 = v50 - 1;
        if (v50 != 1)
          continue;
      }
      goto LABEL_19;
    }
    __break(1u);
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1DB395F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_class *v7;
  objc_class *v8;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = v7;
  v12 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    v13 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  v13 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v14 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
LABEL_6:
  v15 = objc_msgSend(objc_allocWithZone(v8), sel_initWithTitle_detailText_symbolName_contentLayout_, v12, v13, v14, a7);

  return v15;
}

void sub_1DB39606C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1DB3960C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  objc_class *v6;
  objc_class *v7;
  void *v11;
  void *v12;
  id v13;

  v7 = v6;
  v11 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v12 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(objc_allocWithZone(v7), sel_initWithTitle_detailText_icon_contentLayout_, v11, v12, a5, a6);

  return v13;
}

void sub_1DB396178()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1DB3961D4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for B498TutorialController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DB39628C()
{
  sub_1DB39739C(&qword_1F02DA790, (uint64_t)&unk_1DB3C2084);
  sub_1DB39739C(&qword_1F02DA7F8, (uint64_t)&unk_1DB3C1FD8);
  return sub_1DB3BC6AC();
}

char *sub_1DB3962F8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1DB396314(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1DB396314(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA780);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 + 31;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[64 * v8])
      memmove(v13, v14, v8 << 6);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

double sub_1DB396414@<D0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  double result;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v66;
  _OWORD v67[4];
  _OWORD v68[4];
  _OWORD v69[4];
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;

  sub_1DB38507C(0, &qword_1F02DA708);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = sub_1DB3BBC8C();
  v63 = v5;
  v64 = v4;

  v6 = objc_msgSend(v2, (SEL)&off_1EA2B1700 + 1, ObjCClassFromMetadata, 0xE000000000000000);
  v7 = sub_1DB3BBC8C();
  v61 = v8;
  v62 = v7;

  v9 = objc_msgSend(v2, (SEL)&off_1EA2B1700 + 1, ObjCClassFromMetadata, 0xE000000000000000);
  v10 = sub_1DB3BBC8C();
  v59 = v11;
  v60 = v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA780);
  v12 = (_OWORD *)swift_allocObject();
  v12[1] = xmmword_1DB3C1B90;
  v13 = objc_msgSend(v2, (SEL)&off_1EA2B1700 + 1, ObjCClassFromMetadata, 0xE000000000000000);
  v14 = sub_1DB3BBC8C();
  v55 = v15;
  v57 = v14;

  v16 = objc_msgSend(v2, (SEL)&off_1EA2B1700 + 1, ObjCClassFromMetadata, 0xE000000000000000);
  v17 = sub_1DB3BBC8C();
  v19 = v18;

  v20 = objc_msgSend(v2, (SEL)&off_1EA2B1700 + 1, ObjCClassFromMetadata, 0xE000000000000000);
  v21 = (void *)sub_1DB3BC31C();
  v66 = (id)objc_opt_self();
  v22 = objc_msgSend(v66, sel_imageNamed_inBundle_, v21, v20);

  sub_1DB398BA8(v57, v55, v17, v19, 0, 0, (uint64_t)v22, 0, v67);
  v23 = v67[1];
  v12[2] = v67[0];
  v12[3] = v23;
  v24 = v67[3];
  v12[4] = v67[2];
  v12[5] = v24;
  v25 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v26 = sub_1DB3BBC8C();
  v56 = v27;
  v58 = v26;

  v28 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v29 = sub_1DB3BBC8C();
  v31 = v30;

  v32 = objc_msgSend(v2, (SEL)&off_1EA2B1700 + 1, ObjCClassFromMetadata, 0xE000000000000000);
  v33 = (void *)sub_1DB3BC31C();
  v34 = objc_msgSend(v66, sel_imageNamed_inBundle_, v33, v32);

  sub_1DB398BA8(v58, v56, v29, v31, 0, 0, (uint64_t)v34, 0, v68);
  v35 = v68[1];
  v12[6] = v68[0];
  v12[7] = v35;
  v36 = v68[3];
  v12[8] = v68[2];
  v12[9] = v36;
  v37 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata);
  v38 = sub_1DB3BBC8C();
  v40 = v39;

  v41 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v42 = sub_1DB3BBC8C();
  v44 = v43;

  v45 = objc_msgSend(v2, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v46 = (void *)sub_1DB3BC31C();
  v47 = objc_msgSend(v66, sel_imageNamed_inBundle_, v46, v45);

  sub_1DB398BA8(v38, v40, v42, v44, 0, 0, (uint64_t)v47, 0, v69);
  v48 = v69[1];
  v12[10] = v69[0];
  v12[11] = v48;
  v49 = v69[3];
  v12[12] = v69[2];
  v12[13] = v49;
  sub_1DB398BA8(v64, v63, v62, v61, v60, v59, 0, (uint64_t)v12, &v70);
  result = *(double *)&v70;
  v51 = v71;
  v52 = v72;
  v53 = v73;
  v54 = v74;
  *(_OWORD *)a1 = v70;
  *(_QWORD *)(a1 + 16) = v51;
  *(_QWORD *)(a1 + 24) = v52;
  *(_OWORD *)(a1 + 32) = v53;
  *(_OWORD *)(a1 + 48) = v54;
  *(_BYTE *)(a1 + 64) = 0;
  return result;
}

uint64_t sub_1DB396AA0(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a2 = *(_OWORD *)a1;
  v2 = *(_OWORD *)(a1 + 16);
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  *(_BYTE *)(a2 + 64) = *(_BYTE *)(a1 + 64);
  *(_OWORD *)(a2 + 32) = v3;
  *(_OWORD *)(a2 + 48) = v4;
  *(_OWORD *)(a2 + 16) = v2;
  return a2;
}

id sub_1DB396AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  id result;

  if (a9 <= 3u)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a7;
  }
  return result;
}

uint64_t type metadata accessor for B498TutorialController()
{
  return objc_opt_self();
}

uint64_t sub_1DB396B64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t result;

  if (a9 <= 3u)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1DB396BD0()
{
  uint64_t v0;
  void *v1;
  void *v2;

  swift_beginAccess();
  v1 = (void *)MEMORY[0x1DF0AD470](v0 + 16);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_dismissViewControllerAnimated_completion_, 1, 0);

  }
}

void sub_1DB396C30()
{
  uint64_t v0;

  sub_1DB39371C(v0);
}

uint64_t sub_1DB396C38()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DB396C5C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1DB396C7C(id a1)
{
  if (a1 != (id)1)

}

uint64_t destroy for B498TutorialPanesType(uint64_t a1)
{
  return sub_1DB396B64(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
}

uint64_t initializeWithCopy for B498TutorialPanesType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned __int8 v11;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(void **)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_BYTE *)(a2 + 64);
  sub_1DB396AC8(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_BYTE *)(a1 + 64) = v11;
  return a1;
}

uint64_t assignWithCopy for B498TutorialPanesType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unsigned __int8 v20;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(void **)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_BYTE *)(a2 + 64);
  sub_1DB396AC8(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(void **)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_BYTE *)(a1 + 64);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_BYTE *)(a1 + 64) = v11;
  sub_1DB396B64(v12, v13, v14, v15, v16, v17, v18, v19, v20);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for B498TutorialPanesType(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unsigned __int8 v12;
  __int128 v13;
  __int128 v14;

  v3 = *(_BYTE *)(a2 + 64);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_BYTE *)(a1 + 64);
  v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  v14 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v14;
  *(_BYTE *)(a1 + 64) = v3;
  sub_1DB396B64(v4, v6, v5, v7, v8, v9, v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for B498TutorialPanesType(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 65))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 64);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for B498TutorialPanesType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 65) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 65) = 0;
    if (a2)
      *(_BYTE *)(result + 64) = -(char)a2;
  }
  return result;
}

uint64_t sub_1DB396F38(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 64);
}

uint64_t sub_1DB396F40(uint64_t result, char a2)
{
  *(_BYTE *)(result + 64) = a2;
  return result;
}

ValueMetadata *type metadata accessor for B498TutorialPanesType()
{
  return &type metadata for B498TutorialPanesType;
}

void type metadata accessor for OpenExternalURLOptionsKey()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1F02DA7D8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1F02DA7D8);
  }
}

uint64_t sub_1DB396FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA7A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_1DB396FF4(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

void sub_1DB397004()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _BYTE v11[72];
  _BYTE v12[72];
  _BYTE v13[72];
  _BYTE v14[72];

  v1 = v0 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1DF0AD470](v0 + 16);
  if (v2)
  {
    v3 = (void *)v2;
    swift_beginAccess();
    v4 = MEMORY[0x1DF0AD470](v0 + 16);
    if (v4)
    {
      v5 = (void *)v4;
      sub_1DB396AA0(v4 + OBJC_IVAR____TtC16HeadphoneConfigs22B498TutorialController_b498PaneType, (uint64_t)v14);
      sub_1DB3971FC((uint64_t)v14, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB396AC8);

      sub_1DB3927A0();
      sub_1DB3971FC((uint64_t)v14, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB396B64);
      sub_1DB3971B4((uint64_t)v11, (uint64_t)v12);
      if (v12[64] != 255)
      {
        sub_1DB396AA0((uint64_t)v12, (uint64_t)v13);
        v6 = objc_allocWithZone((Class)type metadata accessor for B498TutorialController());
        sub_1DB3971FC((uint64_t)v13, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB396AC8);
        v7 = sub_1DB393254((uint64_t)v13);
        v8 = objc_msgSend(v3, sel_navigationController);
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v8, sel_pushViewController_animated_, v7, 1);

          sub_1DB3971FC((uint64_t)v11, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB397248);
          v7 = v9;
        }
        else
        {

          sub_1DB3971FC((uint64_t)v11, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB397248);
        }
        goto LABEL_9;
      }
    }

  }
  swift_beginAccess();
  v10 = (void *)MEMORY[0x1DF0AD470](v1);
  if (!v10)
    return;
  v7 = v10;
  objc_msgSend(v10, sel_dismissViewControllerAnimated_completion_, 1, 0);
LABEL_9:

}

uint64_t sub_1DB3971B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA7A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DB3971FC(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 64);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v4);
  return a1;
}

uint64_t sub_1DB397248(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 != 255)
    return sub_1DB396B64(result, a2, a3, a4, a5, a6, a7, a8, a9);
  return result;
}

unint64_t sub_1DB397260()
{
  unint64_t result;

  result = qword_1F02DA7B8;
  if (!qword_1F02DA7B8)
  {
    result = MEMORY[0x1DF0AD380](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1F02DA7B8);
  }
  return result;
}

uint64_t sub_1DB3972A4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA7B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1DB3972E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F02DA7D0;
  if (!qword_1F02DA7D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F02DA7C8);
    result = MEMORY[0x1DF0AD380](MEMORY[0x1E0DEB8A8], v1);
    atomic_store(result, (unint64_t *)&qword_1F02DA7D0);
  }
  return result;
}

uint64_t sub_1DB397330()
{
  return sub_1DB39739C(&qword_1F02DA7E0, (uint64_t)&unk_1DB3C1F9C);
}

uint64_t sub_1DB397354()
{
  return sub_1DB39739C(&qword_1F02DA7E8, (uint64_t)&unk_1DB3C1F70);
}

uint64_t sub_1DB397378()
{
  return sub_1DB39739C(&qword_1F02DA7F0, (uint64_t)&unk_1DB3C200C);
}

uint64_t sub_1DB39739C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    result = MEMORY[0x1DF0AD380](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DB3973E4()
{
  uint64_t v0;

  v0 = sub_1DB3BC0DC();
  __swift_allocate_value_buffer(v0, qword_1F02DB0F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB0F8);
  return sub_1DB3BC0D0();
}

uint64_t sub_1DB397460()
{
  uint64_t v0;

  if (qword_1F02DDB40 != -1)
    swift_once();
  v0 = sub_1DB3BC0DC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB0F8);
}

uint64_t sub_1DB3974A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F02DDB40 != -1)
    swift_once();
  v2 = sub_1DB3BC0DC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02DB0F8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

id sub_1DB397518()
{
  id result;

  objc_opt_self();
  result = (id)swift_dynamicCastObjCClass();
  if (result)
    return objc_msgSend(result, sel_headphoneDevice);
  return result;
}

void *sub_1DB397558()
{
  void *v0;
  id v1;
  void *v2;

  objc_opt_self();
  v0 = (void *)swift_dynamicCastObjCClass();
  if (v0)
  {
    swift_unknownObjectRetain();
    v1 = objc_msgSend(v0, sel_address);
    if (v1)
    {
      v2 = v1;
      v0 = (void *)sub_1DB3BC340();

      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      return 0;
    }
  }
  return v0;
}

id BTSDeviceConfigController.addTopLevelEntry(hpDevice:)()
{
  void *v0;

  return objc_msgSend(v0, sel_reloadSpecifiers);
}

id BTSDeviceConfigController.removeTopLevelEntry(hpDevice:)()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v20;

  v1 = v0;
  if (objc_msgSend(v0, sel_device))
  {
    v2 = sub_1DB397518();
    swift_unknownObjectRelease();
    if (v2)
    {
      v3 = sub_1DB3BBF5C();
      v5 = v4;
      if (v3 == sub_1DB3BBF5C() && v5 == v6)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v8 = sub_1DB3BC6D0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v8 & 1) == 0)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      v9 = objc_msgSend(v0, sel_navigationController);
      if (v9)
      {
        v10 = v9;
        v11 = objc_msgSend(v9, sel_presentedViewController);

        if (v11)
        {

          v12 = objc_msgSend(v1, sel_navigationController);
          if (v12)
          {
            v13 = v12;
            objc_msgSend(v12, sel_dismissViewControllerAnimated_completion_, 1, 0);

          }
        }
      }
      goto LABEL_14;
    }
  }
LABEL_15:
  if (qword_1F02DDB40 != -1)
    swift_once();
  v14 = sub_1DB3BC0DC();
  __swift_project_value_buffer(v14, (uint64_t)qword_1F02DB0F8);
  v15 = sub_1DB3BC0C4();
  v16 = sub_1DB3BC484();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v20 = v18;
    *(_DWORD *)v17 = 136315138;
    sub_1DB388E4C(0xD00000000000001ELL, 0x80000001DB3CA480, &v20);
    sub_1DB3BC58C();
    _os_log_impl(&dword_1DB30C000, v15, v16, "Connected Headphones: %s removing device", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v18, -1, -1);
    MEMORY[0x1DF0AD404](v17, -1, -1);
  }

  return objc_msgSend(v1, sel_reloadSpecifiers);
}

uint64_t BTSDeviceConfigController.adaptiveVolumeSupported.getter()
{
  return sub_1DB3979F8(20, 0xD000000000000017, 0x80000001DB3CA4A0);
}

uint64_t BTSDeviceConfigController.conversationDetectSupported.getter()
{
  return sub_1DB3979F8(19, 0xD00000000000001BLL, 0x80000001DB3CA4C0);
}

uint64_t sub_1DB3979F8(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  id v6;
  char v7;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (objc_msgSend(v3, sel_device)
    && (v6 = sub_1DB397518(), swift_unknownObjectRelease(), v6))
  {
    v7 = sub_1DB3BBE6C();

    return v7 & 1;
  }
  else
  {
    if (qword_1F02DDB40 != -1)
      swift_once();
    v9 = sub_1DB3BC0DC();
    __swift_project_value_buffer(v9, (uint64_t)qword_1F02DB0F8);
    v10 = sub_1DB3BC0C4();
    v11 = sub_1DB3BC478();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v14 = v13;
      *(_DWORD *)v12 = 136315138;
      sub_1DB388E4C(a2, a3, &v14);
      sub_1DB3BC58C();
      _os_log_impl(&dword_1DB30C000, v10, v11, "HeadphoneConfigs: %s no device!", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1DF0AD404](v13, -1, -1);
      MEMORY[0x1DF0AD404](v12, -1, -1);
    }

    return 0;
  }
}

uint64_t sub_1DB397C38()
{
  void *v0;
  id v1;
  char v2;

  if (!objc_msgSend(v0, sel_device))
    return 0;
  v1 = sub_1DB397518();
  swift_unknownObjectRelease();
  if (!v1)
    return 0;
  v2 = sub_1DB3BBE6C();

  return v2 & 1;
}

id _sSo25BTSDeviceConfigControllerC16HeadphoneConfigsE19updateTopLevelEntry8hpDevicey0D7Manager0dK0C_tF_0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v8;

  v1 = v0;
  if (qword_1F02DDB40 != -1)
    swift_once();
  v2 = sub_1DB3BC0DC();
  __swift_project_value_buffer(v2, (uint64_t)qword_1F02DB0F8);
  v3 = sub_1DB3BC0C4();
  v4 = sub_1DB3BC484();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v8 = v6;
    *(_DWORD *)v5 = 136315138;
    sub_1DB388E4C(0xD00000000000001ELL, 0x80000001DB3CA550, &v8);
    sub_1DB3BC58C();
    _os_log_impl(&dword_1DB30C000, v3, v4, "Connected Headphones: %s update device", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v6, -1, -1);
    MEMORY[0x1DF0AD404](v5, -1, -1);
  }

  return objc_msgSend(v1, sel_reloadSpecifiers);
}

uint64_t sub_1DB397EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v16;
  id v17;
  _BYTE v18[32];

  v4 = sub_1DB3BC0DC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = 1;
  if (a2 != 8212 && a2 != 8228)
  {
    sub_1DB389F80(a1, (uint64_t)v18);
    sub_1DB398040();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v9 = v17;
      v10 = objc_msgSend(v17, sel_headphoneDevice);
      if (v10)
      {
        v11 = v10;
        v8 = sub_1DB3BBE6C();

        return v8 & 1;
      }

    }
    sub_1DB3BC0AC();
    v12 = sub_1DB3BC0C4();
    v13 = sub_1DB3BC478();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1DB30C000, v12, v13, "BTSDeviceConfig: shouldShowCaseSoundForNewAccessories no device!", v14, 2u);
      MEMORY[0x1DF0AD404](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v8 = 0;
  }
  return v8 & 1;
}

unint64_t sub_1DB398040()
{
  unint64_t result;

  result = qword_1F02DA478;
  if (!qword_1F02DA478)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F02DA478);
  }
  return result;
}

uint64_t sub_1DB39807C()
{
  return sub_1DB3BC010();
}

uint64_t sub_1DB39809C()
{
  return sub_1DB3BC01C();
}

uint64_t (*sub_1DB3980BC(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)a1 = *(_QWORD *)(v1 + 24);
  *(_BYTE *)(a1 + 8) = sub_1DB3BC010();
  return sub_1DB3980F4;
}

uint64_t sub_1DB3980F4()
{
  return sub_1DB3BC01C();
}

uint64_t sub_1DB398118()
{
  return sub_1DB3BC04C();
}

uint64_t sub_1DB398138(unsigned __int8 a1)
{
  return sub_1DB398238(a1, MEMORY[0x1E0D289A0], MEMORY[0x1E0D289B8]);
}

uint64_t sub_1DB39814C(unsigned __int8 a1)
{
  uint64_t result;

  if (a1 < 4u)
    return 0x10200u >> (8 * a1);
  type metadata accessor for AAHeadGestureConfig(0);
  result = sub_1DB3BC6DC();
  __break(1u);
  return result;
}

void type metadata accessor for AAHeadGestureConfig(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DA950);
}

uint64_t (*sub_1DB3981B8(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;

  *(_QWORD *)a1 = *(_QWORD *)(v1 + 24);
  *(_BYTE *)(a1 + 8) = sub_1DB3BC04C();
  return sub_1DB3981F0;
}

uint64_t sub_1DB3981F0(uint64_t a1, uint64_t a2)
{
  return sub_1DB398300(a1, a2, MEMORY[0x1E0D289A0], MEMORY[0x1E0D289B8]);
}

uint64_t sub_1DB398204()
{
  return sub_1DB3BC064();
}

uint64_t sub_1DB398224(unsigned __int8 a1)
{
  return sub_1DB398238(a1, MEMORY[0x1E0D289B8], MEMORY[0x1E0D289A0]);
}

uint64_t sub_1DB398238(unsigned __int8 a1, void (*a2)(void), uint64_t (*a3)(_QWORD))
{
  unsigned int v4;
  uint64_t result;

  v4 = a1;
  a2();
  if (v4 < 4)
    return a3(0x10200u >> (8 * v4));
  type metadata accessor for AAHeadGestureConfig(0);
  result = sub_1DB3BC6DC();
  __break(1u);
  return result;
}

uint64_t (*sub_1DB3982B4(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;

  *(_QWORD *)a1 = *(_QWORD *)(v1 + 24);
  *(_BYTE *)(a1 + 8) = sub_1DB3BC064();
  return sub_1DB3982EC;
}

uint64_t sub_1DB3982EC(uint64_t a1, uint64_t a2)
{
  return sub_1DB398300(a1, a2, MEMORY[0x1E0D289B8], MEMORY[0x1E0D289A0]);
}

uint64_t sub_1DB398300(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t (*a4)(_QWORD))
{
  unsigned int v5;
  _BYTE *v6;
  uint64_t result;

  v5 = *(unsigned __int8 *)(a1 + 8);
  v6 = (_BYTE *)(a1 + 9);
  a3(*(unsigned __int8 *)(a1 + 8));
  if (v5 < 4)
    return a4(0x10200u >> (8 * v5));
  type metadata accessor for AAHeadGestureConfig(0);
  *v6 = v5;
  result = sub_1DB3BC6DC();
  __break(1u);
  return result;
}

uint64_t sub_1DB398388()
{
  return swift_retain();
}

uint64_t sub_1DB398390(char a1, char a2, char a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  sub_1DB3983F4(a1, a2, a3, a4);
  return v8;
}

uint64_t sub_1DB3983F4(char a1, char a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v5 = v4;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = sub_1DB3BC0DC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v5 + 24) = a4;
  *(_BYTE *)(v5 + 16) = a1;
  *(_BYTE *)(v5 + 17) = a2;
  *(_BYTE *)(v5 + 18) = a3;
  swift_retain();
  v14 = sub_1DB3988C4();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  swift_retain();
  v15 = sub_1DB3BC0C4();
  v16 = sub_1DB3BC484();
  if (os_log_type_enabled(v15, v16))
  {
    v23 = v10;
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v17 = 138412290;
    v19 = sub_1DB3BBFF8();
    v20 = v19;
    if (v19)
      v24 = v19;
    else
      v24 = 0;
    sub_1DB3BC58C();
    *v18 = v20;
    swift_release();
    _os_log_impl(&dword_1DB30C000, v15, v16, "Bobble: reload for value change %@", v17, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA6F8);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v18, -1, -1);
    MEMORY[0x1DF0AD404](v17, -1, -1);

    v10 = v23;
  }
  else
  {

    swift_release();
  }
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return v5;
}

uint64_t sub_1DB398610()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t sub_1DB39862C()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1DB398650()
{
  uint64_t v0;
  char v1;
  char v2;
  char v3;
  uint64_t v4;

  v1 = sub_1DB3BC010();
  v2 = sub_1DB3BC04C();
  v3 = sub_1DB3BC064();
  type metadata accessor for BobbleSettingsViewModel();
  v4 = swift_allocObject();
  swift_retain();
  sub_1DB3983F4(v1, v2, v3, v0);
  return v4;
}

uint64_t sub_1DB3986C8(char a1)
{
  uint64_t result;

  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      result = sub_1DB398ADC();
      break;
    default:
      type metadata accessor for AAHeadGestureConfig(0);
      result = sub_1DB3BC6DC();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_1DB39877C(char a1)
{
  uint64_t result;

  if (!a1 || a1 == 2 || a1 == 1)
    return sub_1DB398ADC();
  type metadata accessor for AAMultiState(0);
  result = sub_1DB3BC6DC();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BobbleSettingsViewModel()
{
  return objc_opt_self();
}

void type metadata accessor for AAMultiState(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DA948);
}

uint64_t sub_1DB398854()
{
  uint64_t v0;

  v0 = sub_1DB3BC0DC();
  __swift_allocate_value_buffer(v0, qword_1F02DB110);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB110);
  return sub_1DB3BC0D0();
}

uint64_t sub_1DB3988C4()
{
  uint64_t v0;

  if (qword_1F02DDB48 != -1)
    swift_once();
  v0 = sub_1DB3BC0DC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB110);
}

uint64_t sub_1DB39890C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F02DDB48 != -1)
    swift_once();
  v2 = sub_1DB3BC0DC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02DB110);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

void sub_1DB39897C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  type metadata accessor for BobbleTutorialController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v9 = sub_1DB3BBC8C();
  v11 = v10;

  swift_bridgeObjectRetain();
  v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v13 = sub_1DB3BBC8C();
  v15 = v14;

  *(_QWORD *)a3 = v9;
  *(_QWORD *)(a3 + 8) = v11;
  *(_QWORD *)(a3 + 16) = a1;
  *(_QWORD *)(a3 + 24) = a2;
  *(_QWORD *)(a3 + 32) = v13;
  *(_QWORD *)(a3 + 40) = v15;
  *(_QWORD *)(a3 + 48) = 0;
  *(_QWORD *)(a3 + 56) = 0;
  *(_BYTE *)(a3 + 64) = 1;
}

uint64_t sub_1DB398ADC()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  type metadata accessor for BobbleTutorialController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1DB3BBC8C();

  return v2;
}

uint64_t type metadata accessor for BobbleTutorialController()
{
  return objc_opt_self();
}

uint64_t sub_1DB398BA8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  return result;
}

void sub_1DB398BBC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  type metadata accessor for BobbleTutorialController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v9 = sub_1DB3BBC8C();
  v11 = v10;

  swift_bridgeObjectRetain();
  v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v13 = sub_1DB3BBC8C();
  v15 = v14;

  *(_QWORD *)a3 = v9;
  *(_QWORD *)(a3 + 8) = v11;
  *(_QWORD *)(a3 + 16) = a1;
  *(_QWORD *)(a3 + 24) = a2;
  *(_QWORD *)(a3 + 32) = v13;
  *(_QWORD *)(a3 + 40) = v15;
  *(_QWORD *)(a3 + 48) = 0;
  *(_QWORD *)(a3 + 56) = 0;
  *(_BYTE *)(a3 + 64) = 2;
}

void sub_1DB398D1C(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v4;
  char v5;
  uint64_t ObjCClassFromMetadata;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  _BYTE v39[64];
  char v40;
  _BYTE v41[64];

  v2 = v1;
  v4 = sub_1DB3BC064();
  v5 = sub_1DB3BC04C();
  sub_1DB396AA0(v2, (uint64_t)v39);
  if (v40)
  {
    if (v40 == 1)
    {
      sub_1DB39C758((uint64_t)v39, (uint64_t)v41, &qword_1F02DA958);
      type metadata accessor for BobbleTutorialController();
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v7 = (void *)objc_opt_self();
      v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
      v9 = sub_1DB3BBC8C();
      v11 = v10;

      if (v4 == 2)
      {
        v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
        v13 = sub_1DB3BBC8C();
        v15 = v14;
      }
      else
      {
        if (v5 == 2)
        {
          v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
        }
        else
        {
          if (qword_1F02DDB48 != -1)
            swift_once();
          v25 = sub_1DB3BC0DC();
          __swift_project_value_buffer(v25, (uint64_t)qword_1F02DB110);
          v26 = sub_1DB3BC0C4();
          v27 = sub_1DB3BC478();
          if (os_log_type_enabled(v26, v27))
          {
            v28 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v28 = 0;
            _os_log_impl(&dword_1DB30C000, v26, v27, "AADevice did not have mappings for accept / decline defaulting to nod -> accept shake -> decline", v28, 2u);
            MEMORY[0x1DF0AD404](v28, -1, -1);
          }

          v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
        }
        v13 = sub_1DB3BBC8C();
        v15 = v29;
      }

      v30 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
      v22 = sub_1DB3BBC8C();
      v23 = v31;

      v24 = 2;
    }
    else
    {
      sub_1DB39C758((uint64_t)v39, (uint64_t)v41, &qword_1F02DA958);
      v9 = 0;
      v11 = 0;
      v13 = 0;
      v15 = 0;
      v22 = 0;
      v23 = 0;
      v24 = -1;
    }
  }
  else
  {
    sub_1DB39C758((uint64_t)v39, (uint64_t)v41, &qword_1F02DA958);
    type metadata accessor for BobbleTutorialController();
    v16 = swift_getObjCClassFromMetadata();
    v17 = (void *)objc_opt_self();
    v18 = objc_msgSend(v17, sel_bundleForClass_, v16);
    v9 = sub_1DB3BBC8C();
    v11 = v19;

    if (v4 == 1)
    {
      v20 = objc_msgSend(v17, sel_bundleForClass_, v16, 0xE000000000000000);
      v13 = sub_1DB3BBC8C();
      v15 = v21;
    }
    else
    {
      if (v5 == 1)
      {
        v20 = objc_msgSend(v17, sel_bundleForClass_, v16, 0xE000000000000000);
      }
      else
      {
        if (qword_1F02DDB48 != -1)
          swift_once();
        v32 = sub_1DB3BC0DC();
        __swift_project_value_buffer(v32, (uint64_t)qword_1F02DB110);
        v33 = sub_1DB3BC0C4();
        v34 = sub_1DB3BC478();
        if (os_log_type_enabled(v33, v34))
        {
          v35 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v35 = 0;
          _os_log_impl(&dword_1DB30C000, v33, v34, "AADevice did not have mappings for accept / decline defaulting to nod -> accept shake -> decline", v35, 2u);
          MEMORY[0x1DF0AD404](v35, -1, -1);
        }

        v20 = objc_msgSend(v17, sel_bundleForClass_, v16, 0xE000000000000000);
      }
      v13 = sub_1DB3BBC8C();
      v15 = v36;
    }

    v37 = objc_msgSend(v17, sel_bundleForClass_, v16, 0xE000000000000000);
    v22 = sub_1DB3BBC8C();
    v23 = v38;

    v24 = 1;
  }
  *(_QWORD *)a1 = v9;
  *(_QWORD *)(a1 + 8) = v11;
  *(_QWORD *)(a1 + 16) = v13;
  *(_QWORD *)(a1 + 24) = v15;
  *(_QWORD *)(a1 + 32) = v22;
  *(_QWORD *)(a1 + 40) = v23;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 64) = v24;
}

__n128 sub_1DB3993D0@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  __n128 result;
  __int128 v6;
  __int128 v7;
  __n128 v8;
  _OWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  sub_1DB396AA0(v1, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  v7 = v9[1];
  v8 = (__n128)v9[2];
  v6 = v9[0];
  sub_1DB3971FC(v1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB39B370);
  *(_OWORD *)a1 = v6;
  *(_OWORD *)(a1 + 16) = v7;
  result = v8;
  *(__n128 *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 48) = v3;
  *(_QWORD *)(a1 + 56) = v4;
  return result;
}

uint64_t sub_1DB399448@<X0>(uint64_t a1@<X8>)
{
  _BYTE v3[72];

  sub_1DB39B3E8((uint64_t)v3);
  return sub_1DB396AA0((uint64_t)v3, a1);
}

uint64_t sub_1DB399480()
{
  uint64_t v0;
  unsigned int v1;
  char *v2;
  uint64_t v3;
  _BYTE v5[64];
  char v6;
  char v7;
  char v8;

  sub_1DB396AA0(v0, (uint64_t)v5);
  if (v6 == 1)
    v1 = 2;
  else
    v1 = 3;
  if (v6)
    v2 = &v8;
  else
    v2 = &v7;
  if (v6)
    v3 = v1;
  else
    v3 = 0;
  sub_1DB39C758((uint64_t)v5, (uint64_t)v2, &qword_1F02DA958);
  return v3;
}

uint64_t sub_1DB3994F0()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  _BYTE v4[64];
  unsigned __int8 v5;
  char v6;
  char v7;

  sub_1DB396AA0(v0, (uint64_t)v4);
  if (v5)
    v1 = &v7;
  else
    v1 = &v6;
  if (v5)
    v2 = v5;
  else
    v2 = 1;
  sub_1DB39C758((uint64_t)v4, (uint64_t)v1, &qword_1F02DA958);
  return v2;
}

char *sub_1DB399558(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return sub_1DB3995A0(a1, a2, a3);
}

char *sub_1DB3995A0(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  id v7;
  void *v8;
  void *v9;
  id v10;
  char *v11;
  void *v12;
  objc_super v14;
  _BYTE v15[8];
  uint64_t v16;
  _QWORD v17[9];

  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_listeners] = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topAsset] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topSucessMark] = 0;
  sub_1DB396AA0(a1, (uint64_t)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType]);
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_hpDevice] = a3;
  sub_1DB396AA0(a1, (uint64_t)v17);
  if (v17[1])
    swift_bridgeObjectRetain();
  v7 = a3;
  sub_1DB3971FC(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB39B370);
  v8 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  sub_1DB396AA0(a1, (uint64_t)v15);
  if (v16)
    swift_bridgeObjectRetain();
  v9 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  v14.receiver = v3;
  v14.super_class = (Class)type metadata accessor for BobbleTutorialController();
  v10 = objc_msgSendSuper2(&v14, sel_initWithTitle_detailText_icon_contentLayout_, v8, v9, 0, 1);

  v11 = (char *)v10;
  if (a2)
  {

    sub_1DB3971FC(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB39B598);
    v12 = *(void **)&v11[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
    *(_QWORD *)&v11[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager] = a2;
  }
  else
  {
    sub_1DB39A9E8();

    sub_1DB3971FC(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB39B598);
    v12 = v11;
  }

  return v11;
}

void sub_1DB399764(char a1)
{
  void *v1;
  id v3;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for BobbleTutorialController();
  objc_msgSendSuper2(&v4, sel_viewWillAppear_, a1 & 1);
  v3 = sub_1DB39A560();
  objc_msgSend(v3, sel_play);

}

uint64_t sub_1DB399834()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  objc_class *v5;
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v38;
  uint64_t v39;
  _QWORD aBlock[6];
  objc_super v41;

  v1 = v0;
  v2 = sub_1DB3BC4D8();
  v39 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (objc_class *)type metadata accessor for BobbleTutorialController();
  v41.receiver = v0;
  v41.super_class = v5;
  objc_msgSendSuper2(&v41, sel_viewDidLoad);
  objc_msgSend(v0, sel_setModalInPresentation_, 1);
  v6 = objc_msgSend((id)objc_opt_self(), sel_boldButton);
  v7 = &v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType];
  v8 = *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 8];
  v9 = *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 40];
  v10 = v7[64];
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
    swift_bridgeObjectRelease();
  else
    swift_bridgeObjectRetain();
  v12 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setTitle_forState_, v12, 0);

  v13 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1DB3B0188((uint64_t)sub_1DB39B628, v13);
  swift_release_n();
  v14 = objc_msgSend(v1, sel_buttonTray);
  objc_msgSend(v14, sel_addButton_, v6);

  v15 = objc_msgSend(v1, sel_navigationItem);
  objc_msgSend(v15, sel_setHidesBackButton_, 1);

  v16 = objc_msgSend(v1, sel_contentView);
  v17 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v16, sel_setBackgroundColor_, v17);

  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC34F0]), sel_initWithBarButtonSystemItem_target_action_, 1, v1, 0);
  v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  sub_1DB3B066C((uint64_t)sub_1DB39BC64, v19);
  swift_release_n();
  v20 = objc_msgSend(v1, sel_navigationItem);
  objc_msgSend(v20, sel_setLeftBarButtonItem_, v18);

  if (v10)
  {
    v21 = OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager;
    v22 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
    if (v22)
    {
      v23 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v24 = swift_allocObject();
      *(_QWORD *)(v24 + 16) = v23;
      *(_QWORD *)(v24 + 24) = v6;
      aBlock[4] = sub_1DB39BE24;
      aBlock[5] = v24;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DB399830;
      aBlock[3] = &block_descriptor_0;
      v25 = _Block_copy(aBlock);
      v26 = v22;
      v27 = v6;
      swift_release();
      objc_msgSend(v26, sel_setHeadGestureUpdatedHandler_, v25);
      _Block_release(v25);

    }
    objc_msgSend(v6, sel_setEnabled_, 0);
    v28 = *(void **)&v1[v21];
    if (v28)
      objc_msgSend(v28, sel_setHeadGestureUpdateFlags_, 3);
    if (qword_1F02DDB48 != -1)
      swift_once();
    v29 = sub_1DB3BC0DC();
    __swift_project_value_buffer(v29, (uint64_t)qword_1F02DB110);
    v30 = sub_1DB3BC0C4();
    v31 = sub_1DB3BC484();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1DB30C000, v30, v31, "HG ViewDidLoad: button enabled == false, setting unumte [.headGesture, .audioFeedback].", v32, 2u);
      MEMORY[0x1DF0AD404](v32, -1, -1);
    }

  }
  v33 = sub_1DB39A560();
  v34 = objc_msgSend(v1, sel_contentView);
  objc_msgSend(v34, sel_addSubview_, v33);

  v35 = objc_msgSend(v1, sel_contentView);
  objc_msgSend(v33, sel_pinToOther_, v35);

  objc_msgSend(v33, sel_load);
  v36 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  sub_1DB3BC4E4();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1DB39C06C();
  sub_1DB3BC274();
  swift_release();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v4, v2);
  swift_beginAccess();
  sub_1DB3BC1A8();
  swift_endAccess();

  return swift_release();
}

uint64_t sub_1DB399E28(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1DB399E54(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *);
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  char **v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unsigned __int8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  id v35;
  void *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  id v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t aBlock[9];
  uint64_t v58;

  v53 = a3;
  v5 = sub_1DB3BC0DC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a2 + 16;
  if (qword_1F02DDB48 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v5, (uint64_t)qword_1F02DB110);
  v11 = *(void (**)(char *))(v6 + 16);
  v55 = v10;
  v11(v8);
  v12 = a1;
  v13 = sub_1DB3BC0C4();
  v14 = sub_1DB3BC484();
  v15 = os_log_type_enabled(v13, v14);
  v16 = &selRef_cellStyle;
  v56 = v9;
  if (v15)
  {
    v17 = swift_slowAlloc();
    v18 = swift_slowAlloc();
    aBlock[0] = v18;
    *(_DWORD *)v17 = 136315394;
    v58 = sub_1DB388E4C(0x4C64694477656976, 0xED0000292864616FLL, aBlock);
    sub_1DB3BC58C();
    *(_WORD *)(v17 + 12) = 256;
    LOBYTE(v58) = objc_msgSend(v12, sel_detectedHeadGesture);
    v16 = &selRef_cellStyle;
    v9 = v56;
    sub_1DB3BC58C();

    _os_log_impl(&dword_1DB30C000, v13, v14, "%s Headgesture detected: %hhu", (uint8_t *)v17, 0xFu);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v18, -1, -1);
    MEMORY[0x1DF0AD404](v17, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v19 = objc_msgSend(v12, v16[283]);
  swift_beginAccess();
  v20 = MEMORY[0x1DF0AD470](v9);
  if (!v20)
    goto LABEL_18;
  v21 = (void *)v20;
  v22 = *(_QWORD *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType);
  v23 = *(_QWORD *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 8);
  v24 = *(_QWORD *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 16);
  v25 = *(_QWORD *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 24);
  v26 = *(_QWORD *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 32);
  v27 = *(_QWORD *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 40);
  v28 = *(void **)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 48);
  v29 = *(_QWORD *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 56);
  v54 = v19;
  v30 = *(_BYTE *)(v20 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 64);
  sub_1DB39B370(v22, v23, v24, v25, v26, v27, v28, v29, v30);

  v31 = v22;
  v32 = v56;
  sub_1DB39B598(v31, v23, v24, v25, v26, v27, v28, v29, v30);
  if (v54 == ((0x30200u >> (8 * v30)) & 3))
  {
    swift_beginAccess();
    v33 = MEMORY[0x1DF0AD470](v32);
    if (v33)
    {
      v34 = (char *)v33;
      v35 = v53;
      if ((objc_msgSend(v53, sel_isEnabled) & 1) == 0)
      {
        objc_msgSend(v35, sel_setEnabled_, 1);
        v36 = *(void **)&v34[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
        if (v36)
          objc_msgSend(v36, sel_setHeadGestureUpdateFlags_, 7);
        v37 = sub_1DB3BC0C4();
        v38 = sub_1DB3BC484();
        if (os_log_type_enabled(v37, v38))
        {
          v39 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v39 = 0;
          _os_log_impl(&dword_1DB30C000, v37, v38, "HG Callback: button enabled == true, setting mute: [.headGesture, .audioFeedback, .muteAudioFeedback].", v39, 2u);
          MEMORY[0x1DF0AD404](v39, -1, -1);
        }

        if (v34[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 64] == 2)
        {
          v40 = objc_msgSend(v34, sel_navigationItem);
          objc_msgSend(v40, sel_setLeftBarButtonItem_, 0);

        }
        v41 = sub_1DB39A680();
        objc_msgSend(v41, sel_setAlpha_, 0.0);

        v42 = objc_msgSend(v34, sel_contentView);
        v43 = sub_1DB39A680();
        objc_msgSend(v42, sel_addSubview_, v43);

        v44 = sub_1DB39A680();
        v45 = objc_msgSend(v34, sel_contentView);
        objc_msgSend(v44, sel_pinToOther_, v45);

        v46 = (void *)objc_opt_self();
        v47 = swift_allocObject();
        *(_QWORD *)(v47 + 16) = v34;
        aBlock[4] = (uint64_t)sub_1DB39C6C4;
        aBlock[5] = v47;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 1107296256;
        aBlock[2] = (uint64_t)sub_1DB399E28;
        aBlock[3] = (uint64_t)&block_descriptor_19;
        v48 = _Block_copy(aBlock);
        v34 = v34;
        swift_release();
        objc_msgSend(v46, sel_animateWithDuration_animations_, v48, 0.5);
        _Block_release(v48);
      }

    }
  }
  else
  {
LABEL_18:
    v49 = sub_1DB3BC0C4();
    v50 = sub_1DB3BC484();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      aBlock[0] = v52;
      *(_DWORD *)v51 = 136315138;
      aBlock[6] = sub_1DB388E4C(0x4C64694477656976, 0xED0000292864616FLL, aBlock);
      sub_1DB3BC58C();
      _os_log_impl(&dword_1DB30C000, v49, v50, "%s Headgesture detected not match:", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1DF0AD404](v52, -1, -1);
      MEMORY[0x1DF0AD404](v51, -1, -1);
    }

  }
}

void sub_1DB39A4DC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id sub_1DB39A560()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  char *v4;
  unsigned int v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topAsset;
  v2 = *(void **)&v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topAsset];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topAsset];
  }
  else
  {
    v4 = v0;
    v5 = v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType + 64];
    type metadata accessor for BobbleVideoLoopPlayer();
    v6 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v6, sel_userInterfaceStyle);

    if (v5 < 2)
      v7 = 1;
    else
      v7 = 2;
    v8 = (void *)sub_1DB3A6530(v7, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v8, sel_load);
    objc_msgSend(v8, sel_setDesiredBounds_, 0.0, 0.0, 130.0, 130.0);
    objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v9 = *(void **)&v4[v1];
    *(_QWORD *)&v4[v1] = v8;
    v3 = v8;

    v2 = 0;
  }
  v10 = v2;
  return v3;
}

id sub_1DB39A680()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topSucessMark;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topSucessMark);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController____lazy_storage___topSucessMark);
  }
  else
  {
    v4 = v0;
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v6 = (void *)sub_1DB3BC31C();
    v7 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v6);

    if (v7)
    {
      v8 = objc_msgSend((id)objc_opt_self(), sel_systemGreenColor);
      v9 = objc_msgSend(v7, sel_imageWithTintColor_renderingMode_, v8, 1);

    }
    else
    {
      v9 = 0;
    }
    v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithImage_, v9);

    objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v5, sel_addSubview_, v10);
    v11 = (void *)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_1DB3C1BA0;
    v13 = objc_msgSend(v10, sel_centerXAnchor);
    v14 = objc_msgSend(v5, sel_centerXAnchor);
    v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v14);

    *(_QWORD *)(v12 + 32) = v15;
    v16 = objc_msgSend(v10, sel_centerYAnchor);
    v17 = objc_msgSend(v5, sel_centerYAnchor);
    v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v17);

    *(_QWORD *)(v12 + 40) = v18;
    v19 = objc_msgSend(v10, sel_widthAnchor);
    v20 = objc_msgSend(v19, sel_constraintEqualToConstant_, 75.0);

    *(_QWORD *)(v12 + 48) = v20;
    v21 = objc_msgSend(v10, sel_heightAnchor);
    v22 = objc_msgSend(v21, sel_constraintEqualToConstant_, 75.0);

    *(_QWORD *)(v12 + 56) = v22;
    sub_1DB3BC3DC();
    sub_1DB39C5E4();
    v23 = (void *)sub_1DB3BC3B8();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_activateConstraints_, v23);

    v24 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v25 = v2;
  return v3;
}

void sub_1DB39A9E8()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CFEF18]), sel_init);
  v2 = OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager;
  v3 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager) = v1;

  v4 = *(void **)(v0 + v2);
  if (v4)
  {
    objc_msgSend(v4, sel_setHeadGestureUpdateFlags_, 7);
    v5 = *(void **)(v0 + v2);
    if (v5)
    {
      v21 = sub_1DB39ABFC;
      v22 = 0;
      v6 = MEMORY[0x1E0C809B0];
      v17 = MEMORY[0x1E0C809B0];
      v18 = 1107296256;
      v19 = sub_1DB399E28;
      v20 = &block_descriptor_31;
      v7 = _Block_copy(&v17);
      v8 = v5;
      objc_msgSend(v8, sel_setInterruptionHandler_, v7);
      _Block_release(v7);

      v9 = *(void **)(v0 + v2);
      if (v9)
      {
        v10 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v21 = sub_1DB39C7CC;
        v22 = v10;
        v17 = v6;
        v18 = 1107296256;
        v19 = sub_1DB399E28;
        v20 = &block_descriptor_35;
        v11 = _Block_copy(&v17);
        v12 = v9;
        swift_release();
        objc_msgSend(v12, sel_setInvalidationHandler_, v11);
        _Block_release(v11);

        v13 = *(void **)(v0 + v2);
        if (v13)
        {
          v14 = swift_allocObject();
          swift_unknownObjectWeakInit();
          v21 = sub_1DB39C9C0;
          v22 = v14;
          v17 = v6;
          v18 = 1107296256;
          v19 = sub_1DB39AD84;
          v20 = &block_descriptor_39;
          v15 = _Block_copy(&v17);
          v16 = v13;
          swift_release();
          objc_msgSend(v16, sel_activateWithCompletion_, v15);
          _Block_release(v15);

        }
      }
    }
  }
}

void sub_1DB39ABFC()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  uint64_t v3;
  NSObject *oslog;
  uint64_t v5;

  if (qword_1F02DDB48 != -1)
    swift_once();
  v0 = sub_1DB3BC0DC();
  __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB110);
  oslog = sub_1DB3BC0C4();
  v1 = sub_1DB3BC478();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    v3 = swift_slowAlloc();
    v5 = v3;
    *(_DWORD *)v2 = 136315138;
    sub_1DB388E4C(0xD000000000000016, 0x80000001DB3CA9D0, &v5);
    sub_1DB3BC58C();
    _os_log_impl(&dword_1DB30C000, oslog, v1, "%s aaDeviceManager interrupted!", v2, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v3, -1, -1);
    MEMORY[0x1DF0AD404](v2, -1, -1);

  }
  else
  {

  }
}

void sub_1DB39AD84(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

id sub_1DB39ADD8()
{
  char *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;
  _QWORD aBlock[6];

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager;
  v2 = *(void **)&v0[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
  if (v2)
  {
    aBlock[4] = nullsub_1;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DB399E28;
    aBlock[3] = &block_descriptor_9;
    v3 = _Block_copy(aBlock);
    v4 = v2;
    objc_msgSend(v4, sel_setInvalidationHandler_, v3);
    _Block_release(v3);

    v5 = *(void **)&v0[v1];
    if (v5)
      objc_msgSend(v5, sel_invalidate);
  }
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for BobbleTutorialController();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

void sub_1DB39AF60()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1DB39AFB8()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1DB39B014()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DB39B040(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

void *sub_1DB39B074()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 48);
  v2 = v1;
  return v1;
}

void sub_1DB39B098(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = a1;
}

uint64_t (*sub_1DB39B0C0())()
{
  return nullsub_1;
}

uint64_t sub_1DB39B0D0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DB39B0D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 56) = a1;
  return result;
}

uint64_t (*sub_1DB39B100())()
{
  return nullsub_1;
}

void sub_1DB39B110()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  char *v5;
  uint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  NSObject *oslog;
  uint64_t v11[9];

  v1 = v0;
  v2 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
  if (v2)
  {
    v3 = (void *)v2;
    sub_1DB39B3E8((uint64_t)v11);
    objc_allocWithZone((Class)type metadata accessor for BobbleTutorialController());
    v4 = v3;
    v5 = sub_1DB3995A0((uint64_t)v11, 0, v4);
    oslog = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3A40]), sel_initWithRootViewController_, v5);

    objc_msgSend(v1, sel_presentViewController_animated_completion_, oslog, 1, 0);
  }
  else
  {
    if (qword_1F02DDB48 != -1)
      swift_once();
    v6 = sub_1DB3BC0DC();
    __swift_project_value_buffer(v6, (uint64_t)qword_1F02DB110);
    oslog = sub_1DB3BC0C4();
    v7 = sub_1DB3BC478();
    if (os_log_type_enabled(oslog, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v11[0] = v9;
      *(_DWORD *)v8 = 136315138;
      sub_1DB388E4C(0xD000000000000018, 0x80000001DB3CA820, v11);
      sub_1DB3BC58C();
      _os_log_impl(&dword_1DB30C000, oslog, v7, "%s Unable to present tutorial with out depedencies", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1DF0AD404](v9, -1, -1);
      MEMORY[0x1DF0AD404](v8, -1, -1);

      return;
    }
  }

}

uint64_t sub_1DB39B370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 <= 2u)
    return (uint64_t)sub_1DB39B384(a1, a2, a3, a4, a5, a6, a7);
  return a1;
}

id sub_1DB39B384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a7;
  }
  return result;
}

void sub_1DB39B3E8(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  type metadata accessor for BobbleTutorialController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  v5 = sub_1DB3BBC8C();
  v7 = v6;

  v8 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v9 = sub_1DB3BBC8C();
  v11 = v10;

  v12 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v13 = sub_1DB3BBC8C();
  v15 = v14;

  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(a1 + 24) = v11;
  *(_QWORD *)(a1 + 32) = v13;
  *(_QWORD *)(a1 + 40) = v15;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 64) = 0;
}

uint64_t sub_1DB39B598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 <= 2u)
    return sub_1DB39B5AC(a1, a2, a3, a4, a5, a6, a7);
  return a1;
}

uint64_t sub_1DB39B5AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1DB39B604()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1DB39B628()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  char *v26;
  void *v27;
  char *v28;
  uint64_t ObjCClassFromMetadata;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  _BYTE v40[72];
  _BYTE v41[72];
  _QWORD aBlock[9];
  _BYTE v43[72];
  _QWORD v44[7];

  v1 = v0 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1DF0AD470](v0 + 16);
  if (v2)
  {
    v3 = (char *)v2;
    swift_beginAccess();
    v4 = MEMORY[0x1DF0AD470](v0 + 16);
    if (v4)
    {
      v5 = (void *)v4;
      sub_1DB396AA0(v4 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_bobblePaneType, (uint64_t)v43);
      sub_1DB3971FC((uint64_t)v43, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB39B370);

      v6 = OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_hpDevice;
      sub_1DB3BBE24();
      sub_1DB398D1C((uint64_t)v40);
      swift_release();
      sub_1DB3971FC((uint64_t)v43, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB39B598);
      sub_1DB39C758((uint64_t)v40, (uint64_t)v41, &qword_1F02DA9C0);
      if (v41[64] != 255)
      {
        sub_1DB396AA0((uint64_t)v41, (uint64_t)aBlock);
        v7 = (void *)sub_1DB3BBE3C();
        v8 = objc_msgSend(v7, sel_primaryPlacement);

        if (v8 == 1
          || (v9 = (void *)sub_1DB3BBE3C(),
              v10 = objc_msgSend(v9, sel_secondaryPlacement),
              v9,
              v10 == 1))
        {
          v11 = *(void **)&v3[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
          v12 = *(void **)&v3[v6];
          objc_allocWithZone((Class)type metadata accessor for BobbleTutorialController());
          v13 = v12;
          sub_1DB3971FC((uint64_t)v40, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB39C7B4);
          v14 = v11;
          v15 = sub_1DB3995A0((uint64_t)aBlock, (uint64_t)v11, v13);
          v16 = (char *)objc_msgSend(v3, sel_navigationController);
          if (v16)
          {
            v17 = v16;
            objc_msgSend(v16, sel_pushViewController_animated_, v15, 1);
            sub_1DB3971FC((uint64_t)v40, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB39C79C);

            v3 = v17;
          }
          else
          {
            sub_1DB3971FC((uint64_t)v40, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB39C79C);

          }
        }
        else
        {
          type metadata accessor for BobbleTutorialController();
          ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
          v30 = (void *)objc_opt_self();
          v31 = objc_msgSend(v30, sel_bundleForClass_, ObjCClassFromMetadata);
          sub_1DB3BBC8C();

          v32 = objc_msgSend(v30, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
          sub_1DB3BBC8C();

          v33 = (void *)sub_1DB3BC31C();
          swift_bridgeObjectRelease();
          v34 = (void *)sub_1DB3BC31C();
          swift_bridgeObjectRelease();
          v35 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v33, v34, 1, 0xE000000000000000);

          v36 = objc_msgSend(v30, sel_bundleForClass_, ObjCClassFromMetadata);
          sub_1DB3BBC8C();

          v37 = (void *)sub_1DB3BC31C();
          swift_bridgeObjectRelease();
          v44[4] = nullsub_1;
          v44[5] = 0;
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 1107296256;
          v44[2] = sub_1DB399830;
          v44[3] = &block_descriptor_28;
          v38 = _Block_copy(v44);
          swift_release();
          v39 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v37, 0, v38, 0xE000000000000000);
          _Block_release(v38);

          objc_msgSend(v35, sel_addAction_, v39);
          objc_msgSend(v3, sel_presentViewController_animated_completion_, v35, 1, 0);

          sub_1DB3971FC((uint64_t)v40, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1DB39C79C);
        }
        goto LABEL_18;
      }
    }

  }
  swift_beginAccess();
  v18 = MEMORY[0x1DF0AD470](v1);
  if (v18)
  {
    v19 = (void *)v18;
    v20 = *(void **)(v18 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);
    v21 = v20;

    if (v20)
    {
      aBlock[4] = nullsub_1;
      aBlock[5] = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DB399E28;
      aBlock[3] = &block_descriptor_25_0;
      v22 = _Block_copy(aBlock);
      objc_msgSend(v21, sel_setInvalidationHandler_, v22);
      _Block_release(v22);

    }
  }
  swift_beginAccess();
  v23 = MEMORY[0x1DF0AD470](v1);
  if (v23)
  {
    v24 = (void *)v23;
    v25 = *(id *)(v23 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);

    objc_msgSend(v25, sel_invalidate);
  }
  swift_beginAccess();
  v26 = (char *)MEMORY[0x1DF0AD470](v1);
  if (v26)
  {
    v27 = *(void **)&v26[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
    *(_QWORD *)&v26[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager] = 0;

  }
  swift_beginAccess();
  v28 = (char *)MEMORY[0x1DF0AD470](v1);
  if (v28)
  {
    v3 = v28;
    objc_msgSend(v28, sel_dismissViewControllerAnimated_completion_, 1, 0);
LABEL_18:

  }
}

void sub_1DB39BC64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD aBlock[6];

  v1 = v0 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x1DF0AD470](v0 + 16);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(void **)(v2 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);
    v5 = v4;

    if (v4)
    {
      aBlock[4] = nullsub_1;
      aBlock[5] = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DB399E28;
      aBlock[3] = &block_descriptor_22;
      v6 = _Block_copy(aBlock);
      objc_msgSend(v5, sel_setInvalidationHandler_, v6);
      _Block_release(v6);

    }
  }
  swift_beginAccess();
  v7 = MEMORY[0x1DF0AD470](v1);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = *(id *)(v7 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);

    objc_msgSend(v9, sel_invalidate);
  }
  swift_beginAccess();
  v10 = (char *)MEMORY[0x1DF0AD470](v1);
  if (v10)
  {
    v11 = *(void **)&v10[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
    *(_QWORD *)&v10[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager] = 0;

  }
  swift_beginAccess();
  v12 = (void *)MEMORY[0x1DF0AD470](v1);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, sel_dismissViewControllerAnimated_completion_, 1, 0);

  }
}

uint64_t sub_1DB39BDF8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_1DB39BE24(void *a1)
{
  uint64_t v1;

  sub_1DB399E54(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void sub_1DB39BE44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = v0 + 16;
  if (qword_1F02DDB48 != -1)
    swift_once();
  v3 = sub_1DB3BC0DC();
  __swift_project_value_buffer(v3, (uint64_t)qword_1F02DB110);
  v4 = sub_1DB3BC0C4();
  v5 = sub_1DB3BC484();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1DB30C000, v4, v5, "Invalidate device manager and dismissing.", v6, 2u);
    MEMORY[0x1DF0AD404](v6, -1, -1);
  }

  swift_beginAccess();
  v7 = MEMORY[0x1DF0AD470](v2);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = *(void **)(v7 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);
    v10 = v9;

    if (v9)
    {
      objc_msgSend(v10, sel_setInvalidationHandler_, 0);

    }
  }
  swift_beginAccess();
  v11 = MEMORY[0x1DF0AD470](v2);
  if (v11)
  {
    v12 = (void *)v11;
    v13 = *(id *)(v11 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager);

    objc_msgSend(v13, sel_invalidate);
  }
  swift_beginAccess();
  v14 = MEMORY[0x1DF0AD470](v2);
  if (v14)
  {
    v15 = (void *)v14;
    aBlock[4] = sub_1DB39C620;
    aBlock[5] = v1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DB399E28;
    aBlock[3] = &block_descriptor_13;
    v16 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v15, sel_dismissViewControllerAnimated_completion_, 1, v16);
    _Block_release(v16);

  }
}

unint64_t sub_1DB39C06C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F02DA990;
  if (!qword_1F02DA990)
  {
    v1 = sub_1DB3BC4D8();
    result = MEMORY[0x1DF0AD380](MEMORY[0x1E0CB1F20], v1);
    atomic_store(result, (unint64_t *)&qword_1F02DA990);
  }
  return result;
}

uint64_t destroy for BobbleTutorialPanesType(uint64_t a1)
{
  return sub_1DB39B598(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56), *(_BYTE *)(a1 + 64));
}

uint64_t initializeWithCopy for BobbleTutorialPanesType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned __int8 v11;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(void **)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_BYTE *)(a2 + 64);
  sub_1DB39B370(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_BYTE *)(a1 + 64) = v11;
  return a1;
}

uint64_t assignWithCopy for BobbleTutorialPanesType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  unsigned __int8 v20;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(void **)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_BYTE *)(a2 + 64);
  sub_1DB39B370(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(void **)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_BYTE *)(a1 + 64);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_BYTE *)(a1 + 64) = v11;
  sub_1DB39B598(v12, v13, v14, v15, v16, v17, v18, v19, v20);
  return a1;
}

uint64_t assignWithTake for BobbleTutorialPanesType(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unsigned __int8 v12;
  __int128 v13;
  __int128 v14;

  v3 = *(_BYTE *)(a2 + 64);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_BYTE *)(a1 + 64);
  v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  v14 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v14;
  *(_BYTE *)(a1 + 64) = v3;
  sub_1DB39B598(v4, v6, v5, v7, v8, v9, v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for BobbleTutorialPanesType(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 65))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 64);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BobbleTutorialPanesType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 65) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 65) = 0;
    if (a2)
      *(_BYTE *)(result + 64) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for BobbleTutorialPanesType()
{
  return &type metadata for BobbleTutorialPanesType;
}

uint64_t destroy for TutorialProvider(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TutorialProvider(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v7 = (void *)a2[6];
  v6 = a2[7];
  a1[6] = v7;
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = v7;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TutorialProvider(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[6];
  v5 = (void *)a2[6];
  a1[6] = v5;
  v6 = v5;

  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for TutorialProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  v6 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TutorialProvider(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TutorialProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TutorialProvider()
{
  return &type metadata for TutorialProvider;
}

unint64_t sub_1DB39C5E4()
{
  unint64_t result;

  result = qword_1F02DA358;
  if (!qword_1F02DA358)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F02DA358);
  }
  return result;
}

void sub_1DB39C620()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD *v3;

  swift_beginAccess();
  v1 = MEMORY[0x1DF0AD470](v0 + 16);
  if (v1)
  {
    v2 = (void *)v1;
    v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_listeners);
    swift_beginAccess();
    *v3 = MEMORY[0x1E0DEE9E8];
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_1DB39C6A0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1DB39C6C4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;

  v1 = *(void **)(v0 + 16);
  v2 = sub_1DB39A680();
  objc_msgSend(v2, sel_setAlpha_, 1.0);

  v3 = sub_1DB39A560();
  objc_msgSend(v3, sel_setAlpha_, 0.0);

  v4 = objc_msgSend(v1, sel_view);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_setNeedsLayout);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1DB39C758(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DB39C79C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 != 255)
    return sub_1DB39B598(result, a2, a3, a4, a5, a6, a7, a8, a9);
  return result;
}

uint64_t sub_1DB39C7B4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, unsigned __int8 a9)
{
  if (a9 != 255)
    return sub_1DB39B370(result, a2, a3, a4, a5, a6, a7, a8, a9);
  return result;
}

void sub_1DB39C7CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13[3];

  v1 = v0 + 16;
  if (qword_1F02DDB48 != -1)
    swift_once();
  v2 = sub_1DB3BC0DC();
  __swift_project_value_buffer(v2, (uint64_t)qword_1F02DB110);
  v3 = sub_1DB3BC0C4();
  v4 = sub_1DB3BC478();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v13[0] = v6;
    *(_DWORD *)v5 = 136315138;
    sub_1DB388E4C(0xD000000000000016, 0x80000001DB3CA9D0, v13);
    sub_1DB3BC58C();
    _os_log_impl(&dword_1DB30C000, v3, v4, "%s aaDeviceManager invalidated! reconstructing!", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v6, -1, -1);
    MEMORY[0x1DF0AD404](v5, -1, -1);
  }

  swift_beginAccess();
  v7 = MEMORY[0x1DF0AD470](v1);
  if (v7)
  {
    v8 = (char *)v7;
    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CFEF18]), sel_init);
    v10 = *(void **)&v8[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
    *(_QWORD *)&v8[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager] = v9;

  }
  swift_beginAccess();
  v11 = MEMORY[0x1DF0AD470](v1);
  if (v11)
  {
    v12 = (void *)v11;
    sub_1DB39A9E8(v11);

  }
}

void sub_1DB39C9C0(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  id v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16[3];

  if (a1)
  {
    v3 = v1 + 16;
    if (qword_1F02DDB48 != -1)
      swift_once();
    v4 = sub_1DB3BC0DC();
    __swift_project_value_buffer(v4, (uint64_t)qword_1F02DB110);
    v5 = a1;
    v6 = a1;
    v7 = sub_1DB3BC0C4();
    v8 = sub_1DB3BC478();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = swift_slowAlloc();
      v10 = (_QWORD *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v16[0] = v11;
      *(_DWORD *)v9 = 136315394;
      sub_1DB388E4C(0xD000000000000016, 0x80000001DB3CA9D0, v16);
      sub_1DB3BC58C();
      *(_WORD *)(v9 + 12) = 2112;
      v12 = a1;
      v15 = _swift_stdlib_bridgeErrorToNSError();
      sub_1DB3BC58C();
      *v10 = v15;

      _os_log_impl(&dword_1DB30C000, v7, v8, "%s unable to activate bobble gesture detection %@", (uint8_t *)v9, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA6F8);
      swift_arrayDestroy();
      MEMORY[0x1DF0AD404](v10, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1DF0AD404](v11, -1, -1);
      MEMORY[0x1DF0AD404](v9, -1, -1);
    }
    else
    {

    }
    swift_beginAccess();
    v13 = (char *)MEMORY[0x1DF0AD470](v3);
    if (v13)
    {
      v14 = *(void **)&v13[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager];
      *(_QWORD *)&v13[OBJC_IVAR____TtC16HeadphoneConfigs24BobbleTutorialController_aaDeviceManager] = 0;

    }
  }
}

void *sub_1DB39CC70()
{
  return &unk_1EA29C878;
}

unint64_t sub_1DB39CC7C()
{
  return 0xD00000000000002DLL;
}

void *sub_1DB39CCC4()
{
  return &unk_1EA29C888;
}

unint64_t sub_1DB39CCD0()
{
  return 0xD000000000000030;
}

id sub_1DB39CD18(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v7;
  id v8;
  id v9;
  objc_super v11;

  if (a3)
  {
    v7 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for HPSVisionOSSubtitleOnOffIndicatorCell();
  v8 = objc_msgSendSuper2(&v11, sel_initWithStyle_reuseIdentifier_specifier_, a1, v7, a4);

  if (v8)
  {

    v9 = v8;
    objc_msgSend(v9, sel_setAccessoryType_, 0);

  }
  return v8;
}

uint64_t type metadata accessor for HPSVisionOSSubtitleOnOffIndicatorCell()
{
  return objc_opt_self();
}

id sub_1DB39CE64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  objc_super v9;

  if (a3)
  {
    v5 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for HPSVisionOSSubtitleOnOffIndicatorCell();
  v6 = objc_msgSendSuper2(&v9, sel_initWithStyle_reuseIdentifier_, a1, v5);

  v7 = v6;
  objc_msgSend(v7, sel_setAccessoryType_, 0);
  objc_msgSend(v7, sel_setHoverStyle_, 0);

  return v7;
}

void sub_1DB39CFC8()
{
  sub_1DB3BC664();
  __break(1u);
}

void sub_1DB39D078(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  void (*v25)(uint64_t *, _QWORD);
  id v26;
  void (*v27)(uint64_t *, _QWORD);
  void (*v28)(uint64_t *, _QWORD);
  unsigned int v29;
  void *v30;
  char **v31;
  id v32;
  void (*v33)(uint64_t *, _QWORD);
  uint64_t *boxed_opaque_existential_1;
  uint64_t v35;
  void *v36;
  void *v37;
  char v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  uint64_t v48;
  _QWORD *v49;
  void *v50;
  unint64_t v51;
  uint64_t v52[3];
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;

  v3 = sub_1DB3BC130();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DB3BC178();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
    goto LABEL_40;
  }
  v11 = objc_msgSend(a1, sel_name);
  v45 = v8;
  v42 = v4;
  if (v11)
  {
    v12 = v11;
    sub_1DB3BC340();
    v48 = v13;

  }
  else
  {
    v48 = 0;
  }
  v14 = objc_msgSend(a1, sel_propertyForKey_, *MEMORY[0x1E0D80950]);
  v49 = v1;
  if (v14)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    v55 = 0u;
    v56 = 0u;
  }
  sub_1DB3872D4((uint64_t)&v55, (uint64_t)v52);
  v43 = v3;
  if (v53)
  {
    if (swift_dynamicCast())
    {
      v47 = v50;
      v15 = v51;
      goto LABEL_13;
    }
  }
  else
  {
    sub_1DB38E7C8((uint64_t)v52);
  }
  v47 = 0;
  v15 = 0xE000000000000000;
LABEL_13:
  v46 = v15;
  v16 = (void *)sub_1DB3BC31C();
  v17 = objc_msgSend(a1, sel_propertyForKey_, v16);

  if (v17)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    v55 = 0u;
    v56 = 0u;
  }
  sub_1DB3872D4((uint64_t)&v55, (uint64_t)v52);
  if (v53)
  {
    if (swift_dynamicCast())
    {
      v41 = (uint64_t)v50;
      v44 = v51;
      goto LABEL_21;
    }
  }
  else
  {
    sub_1DB38E7C8((uint64_t)v52);
  }
  v41 = (*(uint64_t (**)(uint64_t, unint64_t))((*MEMORY[0x1E0DEEDD8] & *v49) + 0x50))(0x42414C5F4C4C4543, 0xEE0046464F5F4C45);
  v44 = v18;
LABEL_21:
  v19 = (void *)sub_1DB3BC31C();
  v20 = objc_msgSend(a1, sel_propertyForKey_, v19, v41);

  if (v20)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    v55 = 0u;
    v56 = 0u;
  }
  sub_1DB3872D4((uint64_t)&v55, (uint64_t)v52);
  if (v53)
  {
    sub_1DB38D974();
    if (swift_dynamicCast())
    {
      v21 = v50;
      goto LABEL_29;
    }
  }
  else
  {
    sub_1DB38E7C8((uint64_t)v52);
  }
  sub_1DB38D974();
  v21 = (void *)sub_1DB3BC4FC();
LABEL_29:
  sub_1DB3BC0F4();
  sub_1DB3BC16C();
  v22 = (void *)objc_opt_self();
  v23 = *MEMORY[0x1E0DC4A88];
  v24 = *MEMORY[0x1E0DC1440];
  if (!objc_msgSend(v22, sel__preferredFontForTextStyle_weight_, *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC1440]))
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    return;
  }
  v25 = (void (*)(uint64_t *, _QWORD))sub_1DB3BC13C();
  sub_1DB3BC10C();
  v25(v52, 0);
  if (objc_msgSend(v21, sel_BOOLValue))
  {
    v26 = objc_msgSend((id)objc_opt_self(), sel_tertiaryLabelColor);
  }
  else
  {
    sub_1DB3BC148();
    sub_1DB3BC118();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v6, v43);
  }
  v27 = (void (*)(uint64_t *, _QWORD))sub_1DB3BC13C();
  sub_1DB3BC124();
  v27(v52, 0);
  sub_1DB3BC100();
  if (!objc_msgSend(v22, sel__preferredFontForTextStyle_weight_, *MEMORY[0x1E0DC4AB8], v24))
    goto LABEL_41;
  v28 = (void (*)(uint64_t *, _QWORD))sub_1DB3BC154();
  sub_1DB3BC10C();
  v28(v52, 0);
  v29 = objc_msgSend(v21, sel_BOOLValue);
  v30 = (void *)objc_opt_self();
  v31 = &selRef_tertiaryLabelColor;
  if (!v29)
    v31 = &selRef_secondaryLabelColor;
  v32 = objc_msgSend(v30, *v31);
  v33 = (void (*)(uint64_t *, _QWORD))sub_1DB3BC154();
  sub_1DB3BC124();
  v33(v52, 0);
  sub_1DB3BC160();
  v53 = v7;
  v54 = MEMORY[0x1E0DC2398];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v52);
  v35 = v45;
  (*(void (**)(uint64_t *, char *, uint64_t))(v45 + 16))(boxed_opaque_existential_1, v10, v7);
  v36 = v49;
  MEMORY[0x1DF0AC894](v52);
  sub_1DB38D974();
  v37 = (void *)sub_1DB3BC4FC();
  v38 = sub_1DB3BC508();

  if ((v38 & 1) != 0)
  {
    v39 = objc_msgSend(v22, sel__preferredFontForTextStyle_weight_, v23, *MEMORY[0x1E0DC1438]);
    objc_msgSend(v36, sel__setBadgeFont_, v39);

    v40 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
    objc_msgSend(v36, sel__setBadgeText_, v40);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v7);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v7);
    swift_bridgeObjectRelease();

  }
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1DB39D7C4()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  swift_getObjectType();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1DB3BBC8C();

  return v2;
}

id sub_1DB39D87C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HPSVisionOSSubtitleOnOffIndicatorCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DB39D8B0()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  sub_1DB38507C(0, &qword_1F02DA708);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_1DB3BBC8C();

  return v2;
}

uint64_t BTSDeviceConfigController.turnOffListeningModeSpecifiers.getter()
{
  return MEMORY[0x1E0DEE9D8];
}

id sub_1DB39D9CC()
{
  id v0;
  void *v1;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  objc_msgSend(v0, sel_setNumberOfLines_, 0);
  sub_1DB398ADC();
  v1 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setText_, v1);

  objc_msgSend(v0, sel_setTextAlignment_, 1);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_setUserInteractionEnabled_, 0);
  return v0;
}

id sub_1DB39DAA0()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label);
}

id sub_1DB39DB00(uint64_t a1)
{
  void *v1;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  return objc_msgSendSuper2(&v4, sel_addSubview_, a1);
}

id sub_1DB39DB84(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  char *v4;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  id v12;
  objc_super v14;

  v8 = OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label;
  v9 = v4;
  *(_QWORD *)&v4[v8] = sub_1DB39D9CC();
  *(_QWORD *)&v9[OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_headphoneDevice] = 0;

  if (a3)
  {
    v10 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  v12 = v11;
  if (v12)

  return v12;
}

id sub_1DB39DCC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  objc_super v11;

  v6 = OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label;
  v7 = v3;
  *(_QWORD *)&v3[v6] = sub_1DB39D9CC();
  *(_QWORD *)&v7[OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_headphoneDevice] = 0;

  if (a3)
  {
    v8 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  v9 = objc_msgSendSuper2(&v11, sel_initWithStyle_reuseIdentifier_, a1, v8);

  return v9;
}

id sub_1DB39DE4C(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label;
  v4 = v1;
  *(_QWORD *)&v1[v3] = sub_1DB39D9CC();
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_headphoneDevice] = 0;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for HPSCenterContentCell();
  v5 = objc_msgSendSuper2(&v7, sel_initWithCoder_, a1);

  return v5;
}

id sub_1DB39DF4C()
{
  return sub_1DB3853EC(type metadata accessor for HPSCenterContentCell);
}

uint64_t variable initialization expression of BobbleSettingsViewController.headphoneDevice()
{
  return 0;
}

void *sub_1DB39DFE0()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_1DB39E088(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t variable initialization expression of BobbleSettingsViewController.viewModel()
{
  return 0;
}

uint64_t variable initialization expression of BobbleSettingsViewController.listeners()
{
  return MEMORY[0x1E0DEE9E8];
}

id BobbleSettingsViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id BobbleSettingsViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  void *v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_listeners] = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___movieLoopView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___topAsset] = 0;
  if (a2)
  {
    v5 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for BobbleSettingsViewController();
  v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

uint64_t variable initialization expression of BobbleSettingsViewController.$__lazy_storage_$_headGesturesTopTextSection()
{
  return 0;
}

uint64_t variable initialization expression of BobbleSettingsViewController.$__lazy_storage_$_headGesturesSwitchSection()
{
  return 0;
}

uint64_t variable initialization expression of BobbleSettingsViewController.$__lazy_storage_$_headGestureMappingSection()
{
  return 0;
}

uint64_t variable initialization expression of BobbleSettingsViewController.$__lazy_storage_$_tryBobbleSection()
{
  return 0;
}

uint64_t variable initialization expression of BobbleSettingsViewController.$__lazy_storage_$_movieLoopView()
{
  return 0;
}

uint64_t variable initialization expression of BobbleSettingsViewController.$__lazy_storage_$_topAsset()
{
  return 0;
}

uint64_t sub_1DB39E304()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char v11;
  __n128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[4];
  _QWORD v18[20];

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection;
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection])
  {
    v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection];
  }
  else
  {
    v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4F8);
    v4 = sub_1DB38CD8C();
    v6 = v5;
    v7 = sub_1DB38CD8C();
    v9 = sub_1DB38CD98(v4, v6, v7, v8);
    v17[3] = type metadata accessor for BobbleSettingsViewController();
    v17[0] = v3;
    v10 = v3;
    v11 = sub_1DB38CB14();
    v12 = sub_1DB38CCD8(0, 0, 0, 0, (uint64_t)v17, 0, 0, -1, (uint64_t)v18, 0, v11 & 1, 0, 0, (__n128)0, 0);
    v13 = (*(uint64_t (**)(_QWORD *, __n128))(*(_QWORD *)v9 + 160))(v18, v12);
    swift_release();
    sub_1DB389DF8(v18);
    v14 = (*(uint64_t (**)(uint64_t (*)(void *), _QWORD))(*(_QWORD *)v13 + 168))(sub_1DB39E494, 0);
    v15 = swift_release();
    v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 176))(v15);
    swift_release();
    *(_QWORD *)&v3[v1] = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1DB39E494(void *a1)
{
  type metadata accessor for HPSCenterContentCell();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAB10);
  objc_msgSend(a1, sel_setProperty_forKey_, sub_1DB3BC6E8(), *MEMORY[0x1E0D80780]);
  return swift_unknownObjectRelease();
}

uint64_t sub_1DB39E504(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1
            + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DB39E51C(uint64_t *a1))(_QWORD *a1, uint64_t a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1DB39E304();
  return sub_1DB39E550;
}

uint64_t sub_1DB39E550(_QWORD *a1, uint64_t a2)
{
  return sub_1DB39EE84(a1, a2, &OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection);
}

uint64_t sub_1DB39E55C()
{
  char *v0;
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
  uint64_t v12;
  char *v13;
  char v14;
  __n128 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];
  _QWORD v20[20];

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection;
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection])
  {
    v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection];
  }
  else
  {
    v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4F8);
    v4 = sub_1DB38CD8C();
    v6 = v5;
    v7 = sub_1DB38CD8C();
    v9 = sub_1DB38CD98(v4, v6, v7, v8);
    v10 = sub_1DB398ADC();
    v12 = v11;
    v19[3] = type metadata accessor for BobbleSettingsViewController();
    v19[0] = v3;
    v13 = v3;
    v14 = sub_1DB38CB14();
    v15 = sub_1DB38CCD8(0, 0, v10, v12, (uint64_t)v19, (uint64_t)sel_headGesturesEnabled, (uint64_t)sel_setHeadGesturesEnabledWithEnabled_, 6, (uint64_t)v20, 0, v14 & 1, 0, 0, (__n128)0, 0);
    v16 = (*(uint64_t (**)(_QWORD *, __n128))(*(_QWORD *)v9 + 160))(v20, v15);
    swift_release();
    v17 = sub_1DB389DF8(v20);
    v2 = (*(uint64_t (**)(_QWORD *))(*(_QWORD *)v16 + 176))(v17);
    swift_release();
    *(_QWORD *)&v3[v1] = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1DB39E6F8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1
            + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DB39E710(uint64_t *a1))(_QWORD *a1, uint64_t a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1DB39E55C();
  return sub_1DB39E744;
}

uint64_t sub_1DB39E744(_QWORD *a1, uint64_t a2)
{
  return sub_1DB39EE84(a1, a2, &OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection);
}

uint64_t sub_1DB39E750()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[8];

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection;
  if (*(_QWORD *)(v0
                 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection))
  {
    v2 = *(_QWORD *)(v0
                   + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection);
  }
  else
  {
    swift_unknownObjectWeakInit();
    v2 = sub_1DB39E7D4((uint64_t)v4);
    swift_unknownObjectWeakDestroy();
    *(_QWORD *)(v0 + v1) = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1DB39E7D4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
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
  id v15;
  char v16;
  __n128 v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  char v25;
  __n128 v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v33[40];
  __int128 v34;
  _QWORD v35[3];
  uint64_t v36;
  _QWORD v37[20];

  swift_beginAccess();
  v2 = MEMORY[0x1DF0AD470](a1);
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
  v3 = (void *)v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4F8);
  v4 = sub_1DB38CD8C();
  v6 = v5;
  v7 = sub_1DB38CD8C();
  v9 = sub_1DB38CD98(v4, v6, v7, v8);
  v10 = sub_1DB398ADC();
  v12 = v11;
  v13 = type metadata accessor for BobbleSettingsViewController();
  v36 = v13;
  v35[0] = v3;
  v14 = type metadata accessor for BobbleMappingSelectionController();
  v15 = v3;
  v16 = sub_1DB38CB14();
  memset(&v33[8], 0, 32);
  *(_QWORD *)v33 = v14;
  v17 = sub_1DB38CCD8(0, 0, v10, v12, (uint64_t)v35, (uint64_t)sel_acceptReplyPlayPauseStringMapping, 0, 2, (uint64_t)v37, 0, v16 & 1, *(__int128 *)v33, *(__int128 *)&v33[16], (__n128)*(unint64_t *)&v33[32], 0);
  v18 = (*(uint64_t (**)(_QWORD *, __n128))(*(_QWORD *)v9 + 160))(v37, v17);
  swift_release();
  v19 = sub_1DB389DF8(v37);
  MEMORY[0x1E0C80A78](v19);
  *((_QWORD *)&v34 + 1) = v15;
  v20 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v18 + 168))(sub_1DB3A1B6C);
  swift_release();
  v21 = sub_1DB398ADC();
  v23 = v22;
  v36 = v13;
  v35[0] = v15;
  v24 = v15;
  v25 = sub_1DB38CB14();
  memset(&v33[8], 0, 32);
  *(_QWORD *)v33 = v14;
  v26 = sub_1DB38CCD8(0, 0, v21, v23, (uint64_t)v35, (uint64_t)sel_declineDismissSkipStringMapping, 0, 2, (uint64_t)v37, 0, v25 & 1, *(__int128 *)v33, *(__int128 *)&v33[16], (__n128)*(unint64_t *)&v33[32], 0);
  v27 = (*(uint64_t (**)(_QWORD *, __n128))(*(_QWORD *)v20 + 160))(v37, v26);
  swift_release();
  v28 = sub_1DB389DF8(v37);
  MEMORY[0x1E0C80A78](v28);
  *((_QWORD *)&v34 + 1) = v24;
  v29 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v27 + 168))(sub_1DB3A1B74);
  v30 = swift_release();
  v31 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v29 + 176))(v30);
  swift_release();

  return v31;
}

unint64_t sub_1DB39EAE4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAB00);
  v2 = sub_1DB3BC694();
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
    sub_1DB3A1C94(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_1DB389660(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1DB385AA8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_1DB39EC0C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1
            + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DB39EC24(uint64_t *a1))(_QWORD *a1, uint64_t a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1DB39E750();
  return sub_1DB39EC58;
}

uint64_t sub_1DB39EC58(_QWORD *a1, uint64_t a2)
{
  return sub_1DB39EE84(a1, a2, &OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection);
}

uint64_t sub_1DB39EC64()
{
  char *v0;
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
  uint64_t v12;
  char *v13;
  char v14;
  __n128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[4];
  _QWORD v21[20];

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection;
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection])
  {
    v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection];
  }
  else
  {
    v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4F8);
    v4 = sub_1DB38CD8C();
    v6 = v5;
    v7 = sub_1DB38CD8C();
    v9 = sub_1DB38CD98(v4, v6, v7, v8);
    v10 = sub_1DB398ADC();
    v12 = v11;
    v20[3] = type metadata accessor for BobbleSettingsViewController();
    v20[0] = v3;
    v13 = v3;
    v14 = sub_1DB38CB14();
    v15 = sub_1DB38CCD8(0, 0, v10, v12, (uint64_t)v20, 0, 0, 13, (uint64_t)v21, 0, v14 & 1, 0, 0, (__n128)0, 0);
    v16 = (*(uint64_t (**)(_QWORD *, __n128))(*(_QWORD *)v9 + 160))(v21, v15);
    swift_release();
    sub_1DB389DF8(v21);
    v17 = (*(uint64_t (**)(id (*)(void *), _QWORD))(*(_QWORD *)v16 + 168))(sub_1DB39EE18, 0);
    v18 = swift_release();
    v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v17 + 176))(v18);
    swift_release();
    *(_QWORD *)&v3[v1] = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

id sub_1DB39EE18(void *a1)
{
  return objc_msgSend(a1, sel_setButtonAction_, sel_presentBobbleTutorials);
}

uint64_t sub_1DB39EE2C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DB39EE44(uint64_t *a1))(_QWORD *a1, uint64_t a2)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1DB39EC64();
  return sub_1DB39EE78;
}

uint64_t sub_1DB39EE78(_QWORD *a1, uint64_t a2)
{
  return sub_1DB39EE84(a1, a2, &OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection);
}

uint64_t sub_1DB39EE84(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  *(_QWORD *)(a1[1] + *a3) = *a1;
  return swift_bridgeObjectRelease();
}

Swift::OpaquePointer_optional __swiftcall BobbleSettingsViewController.specifiers()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void **v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  id v33;
  NSObject *v34;
  int v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  unint64_t v41;
  uint8_t *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  Swift::Bool v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  _QWORD *v59;
  uint8_t *v60;
  uint64_t v61;
  _QWORD *v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  void *v68;
  void *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  uint64_t (*v75)(uint64_t);
  void *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  char *v83;
  uint64_t v84;
  uint64_t (*v85)(char *, uint64_t);
  uint64_t v86;
  void *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  int v97;
  _QWORD *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  id v102;
  uint64_t v103;
  id v104;
  char *v105;
  uint64_t v106;
  id v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  Swift::OpaquePointer_optional result;

  v1 = v0;
  v126 = *MEMORY[0x1E0C80C00];
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAA48);
  v2 = *(_QWORD *)(v111 - 8);
  v3 = MEMORY[0x1E0C80A78](v111);
  v5 = (char *)&v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v94 - v6;
  v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAA50);
  v8 = *(_QWORD *)(v113 - 8);
  MEMORY[0x1E0C80A78](v113);
  v112 = (char *)&v94 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAA58);
  v109 = *(_QWORD *)(v110 - 8);
  MEMORY[0x1E0C80A78](v110);
  v108 = (char *)&v94 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1DB3BC0DC();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v94 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v114 = (char *)&v94 - v16;
  v17 = objc_msgSend(v1, sel_specifier);
  if (!v17)
    __break(1u);
  v18 = v17;
  v19 = objc_msgSend(v17, sel_userInfo);

  if (v19)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    v122 = 0u;
    v123 = 0u;
  }
  sub_1DB3872D4((uint64_t)&v122, (uint64_t)&v124);
  if (!v125)
  {
    sub_1DB38E7C8((uint64_t)&v124);
    goto LABEL_22;
  }
  sub_1DB38507C(0, &qword_1F02DA428);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_22:
    sub_1DB38507C(0, &qword_1F02DA480);
    v45 = (void *)sub_1DB3BC3B8();
    v46 = (void *)sub_1DB3BC31C();
    objc_msgSend(v1, sel_setValue_forKey_, v45, v46);

    v47 = sub_1DB3988C4();
    v48 = v11;
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v47, v11);
    v49 = sub_1DB3BC0C4();
    v50 = sub_1DB3BC478();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = swift_slowAlloc();
      v52 = swift_slowAlloc();
      v124 = v52;
      *(_DWORD *)v51 = 136315394;
      *(_QWORD *)&v122 = sub_1DB388E4C(0x6569666963657073, 0xEC00000029287372, &v124);
      sub_1DB3BC58C();
      *(_WORD *)(v51 + 12) = 2048;
      *(_QWORD *)&v122 = 154;
      sub_1DB3BC58C();
      _os_log_impl(&dword_1DB30C000, v49, v50, "%s: %ld Depedencies not meet, bailing out of specifiers returning empty conroller!", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1DF0AD404](v52, -1, -1);
      MEMORY[0x1DF0AD404](v51, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v48);
    v54 = 0;
    goto LABEL_25;
  }
  v20 = v117;
  v21 = objc_msgSend((id)objc_opt_self(), sel_deviceKey);
  if (!v21)
  {
    sub_1DB3BC340();
    v105 = v7;
    v106 = v2;
    v21 = (id)sub_1DB3BC31C();
    v2 = v106;
    v7 = v105;
    swift_bridgeObjectRelease();
  }
  v107 = v20;
  v22 = objc_msgSend(v20, sel_objectForKey_, v21);

  if (v22)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    v122 = 0u;
    v123 = 0u;
  }
  sub_1DB3872D4((uint64_t)&v122, (uint64_t)&v124);
  v23 = v107;
  if (!v125)
  {

    sub_1DB38E7C8((uint64_t)&v124);
    goto LABEL_22;
  }
  sub_1DB38507C(0, (unint64_t *)&qword_1F02DA478);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_21:

    goto LABEL_22;
  }
  v103 = v8;
  v24 = v117;
  v25 = objc_msgSend(v117, sel_headphoneDevice);
  if (!v25)
  {

    goto LABEL_21;
  }
  v26 = v25;
  v104 = v24;
  v27 = (void **)((char *)v1 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice);
  swift_beginAccess();
  v28 = *v27;
  *v27 = v26;
  v29 = v26;

  sub_1DB3BBE24();
  v30 = sub_1DB398650();
  swift_release();
  *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel) = v30;
  swift_release();
  sub_1DB3988C4();
  v31 = v12;
  v32 = v114;
  (*(void (**)(void))(v12 + 16))();
  v33 = v29;
  v34 = sub_1DB3BC0C4();
  v35 = sub_1DB3BC484();
  v36 = os_log_type_enabled(v34, (os_log_type_t)v35);
  v101 = v5;
  v106 = v2;
  v105 = v7;
  if (v36)
  {
    v97 = v35;
    v100 = v31;
    v95 = v11;
    v96 = v34;
    v37 = swift_slowAlloc();
    v98 = (_QWORD *)swift_slowAlloc();
    v99 = swift_slowAlloc();
    *(_QWORD *)&v122 = v99;
    *(_DWORD *)v37 = 136315394;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA190);
    v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_1DB3C1810;
    *(_QWORD *)(v38 + 56) = sub_1DB3BBF68();
    *(_QWORD *)(v38 + 64) = sub_1DB3A1430();
    *(_QWORD *)(v38 + 32) = v33;
    v102 = v33;
    v39 = v33;
    v40 = sub_1DB3BC34C();
    v117 = (id)sub_1DB388E4C(v40, v41, (uint64_t *)&v122);
    sub_1DB3BC58C();
    swift_bridgeObjectRelease();

    *(_WORD *)(v37 + 12) = 2112;
    v42 = (uint8_t *)v37;
    v43 = v39;
    sub_1DB3BBE24();
    v44 = (void *)sub_1DB3BBFF8();
    swift_release();
    if (v44)
      v117 = v44;
    else
      v117 = 0;
    sub_1DB3BC58C();
    v57 = v96;
    v58 = v95;
    v59 = v98;
    *v98 = v44;

    v60 = v42;
    _os_log_impl(&dword_1DB30C000, v57, (os_log_type_t)v97, "Bobble: specifiers, HeadphoneDevice:%s aad: %@ ", v42, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA6F8);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v59, -1, -1);
    v61 = v99;
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v61, -1, -1);
    MEMORY[0x1DF0AD404](v60, -1, -1);

    v56 = (*(uint64_t (**)(char *, uint64_t))(v100 + 8))(v114, v58);
    v33 = v102;
  }
  else
  {

    v56 = (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v32, v11);
  }
  v62 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v118 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v1) + 0xE0))(v56);
  v119 = (*(uint64_t (**)(void))((*v62 & *v1) + 0xF8))();
  v120 = (*(uint64_t (**)(void))((*v62 & *v1) + 0x110))();
  v121 = (*(uint64_t (**)(void))((*v62 & *v1) + 0x128))();
  *(_QWORD *)&v122 = MEMORY[0x1E0DEE9D8];
  v63 = swift_bridgeObjectRetain();
  sub_1DB3897A4(v63);
  v64 = swift_bridgeObjectRetain();
  sub_1DB3897A4(v64);
  v65 = swift_bridgeObjectRetain();
  sub_1DB3897A4(v65);
  v66 = swift_bridgeObjectRetain();
  sub_1DB3897A4(v66);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4E8);
  swift_arrayDestroy();
  v67 = v122;
  sub_1DB3A0C58();
  sub_1DB38507C(0, &qword_1F02DA480);
  v68 = (void *)sub_1DB3BC3B8();
  v69 = (void *)sub_1DB3BC31C();
  objc_msgSend(v1, sel_setValue_forKey_, v68, v69);

  v70 = (char *)v1 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_listeners;
  v71 = swift_beginAccess();
  if ((*(_QWORD *)v70 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v72 = sub_1DB3BC5C8();
    v71 = swift_bridgeObjectRelease();
  }
  else
  {
    v72 = *(_QWORD *)(*(_QWORD *)v70 + 16);
  }
  v73 = v107;
  v74 = v104;
  if (!v72)
  {
    v102 = v33;
    v75 = *(uint64_t (**)(uint64_t))((*v62 & *v1) + 0x98);
    v55 = (void *)v75(v71);
    if (v55)
    {
      v76 = v55;
      v77 = v111;
      sub_1DB3BBE24();

      v78 = v112;
      sub_1DB3BC028();
      swift_release();
      v79 = v113;
      v80 = (void *)sub_1DB3BBE18();
      v81 = (*(uint64_t (**)(char *, uint64_t))(v103 + 8))(v78, v79);
      v117 = v80;
      v55 = (void *)v75(v81);
      if (v55)
      {
        v82 = v55;
        sub_1DB3BBE24();

        v83 = v105;
        sub_1DB3BC070();
        swift_release();
        v84 = sub_1DB3BBE18();
        v85 = *(uint64_t (**)(char *, uint64_t))(v106 + 8);
        v86 = v85(v83, v77);
        v116 = v84;
        v55 = (void *)v75(v86);
        if (v55)
        {
          v87 = v55;
          sub_1DB3BBE24();

          v88 = v101;
          sub_1DB3BC058();
          swift_release();
          v89 = sub_1DB3BBE18();
          v85(v88, v77);
          v115 = v89;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAA60);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAA68);
          v90 = MEMORY[0x1E0C95D90];
          sub_1DB383980(&qword_1F02DAA70, &qword_1F02DAA60, MEMORY[0x1E0C95D90]);
          sub_1DB383980(&qword_1F02DAA78, &qword_1F02DAA68, v90);
          v91 = v108;
          sub_1DB3BC190();
          sub_1DB383980(&qword_1F02DAA80, &qword_1F02DAA58, MEMORY[0x1E0C956B8]);
          v92 = v110;
          v93 = (void *)sub_1DB3BC22C();
          (*(void (**)(char *, uint64_t))(v109 + 8))(v91, v92);
          v117 = v93;
          swift_allocObject();
          swift_unknownObjectWeakInit();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAA88);
          sub_1DB383980(&qword_1F02DAA90, &qword_1F02DAA88, v90);
          sub_1DB3BC274();
          swift_release();
          swift_release();
          swift_beginAccess();
          sub_1DB3BC1A8();
          swift_endAccess();
          swift_release();
          v54 = sub_1DB388B3C(v67);
          swift_bridgeObjectRelease();

          goto LABEL_25;
        }
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_41;
  }
  v54 = sub_1DB388B3C(v67);
  swift_bridgeObjectRelease();

LABEL_25:
  v55 = (void *)v54;
LABEL_42:
  result.value._rawValue = v55;
  result.is_nil = v53;
  return result;
}

uint64_t sub_1DB39FC94(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v13;

  v2 = sub_1DB3BC0DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v6 = (void *)MEMORY[0x1DF0AD470](a1 + 16);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_reloadSpecifiers);

  }
  v8 = sub_1DB3988C4();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  v9 = sub_1DB3BC0C4();
  v10 = sub_1DB3BC484();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1DB30C000, v9, v10, "Bobble: reload for value change", v11, 2u);
    MEMORY[0x1DF0AD404](v11, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Void __swiftcall BobbleSettingsViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  void *v1;
  id v3;
  objc_super v4;

  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for BobbleSettingsViewController();
  objc_msgSendSuper2(&v4, sel_viewWillAppear_, a1);
  sub_1DB3A0C58();
  v3 = sub_1DB3A092C();
  objc_msgSend(v3, sel_play);

  objc_msgSend(v1, sel_reloadSpecifiers);
}

void sub_1DB39FF1C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v7;
  int v8;
  _BOOL4 v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v1 = sub_1DB3BC0DC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DB3988C4();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  v6 = v0;
  v7 = sub_1DB3BC0C4();
  v8 = sub_1DB3BC484();
  v9 = os_log_type_enabled(v7, (os_log_type_t)v8);
  v10 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  if (v9)
  {
    HIDWORD(v29) = v8;
    v11 = swift_slowAlloc();
    v31 = (_QWORD *)swift_slowAlloc();
    v30 = swift_slowAlloc();
    v33[0] = v30;
    *(_DWORD *)v11 = 136315650;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA190);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_1DB3C1810;
    v13 = *(uint64_t (**)(void))((*v10 & *v6) + 0x98);
    v14 = v13();
    if (v14)
    {
      v15 = v14;
      *(_QWORD *)(v12 + 56) = sub_1DB3BBF68();
      *(_QWORD *)(v12 + 64) = sub_1DB3A1430();
      *(_QWORD *)(v12 + 32) = v15;
      v16 = sub_1DB3BC34C();
      v32 = sub_1DB388E4C(v16, v17, v33);
      sub_1DB3BC58C();

      v18 = swift_bridgeObjectRelease();
      *(_WORD *)(v11 + 12) = 2112;
      v19 = ((uint64_t (*)(uint64_t))v13)(v18);
      if (v19)
      {
        v20 = (void *)v19;
        sub_1DB3BBE24();

        v21 = sub_1DB3BBFF8();
        swift_release();
        if (v21)
          v32 = v21;
        else
          v32 = 0;
        sub_1DB3BC58C();
        v23 = v31;
        *v31 = v21;

        *(_WORD *)(v11 + 22) = 256;
        v24 = v13();
        if (v24)
        {
          v25 = (void *)v24;
          sub_1DB3BBE24();

          LOBYTE(v25) = sub_1DB3BC010();
          swift_release();
          LOBYTE(v32) = (_BYTE)v25;
          sub_1DB3BC58C();

          _os_log_impl(&dword_1DB30C000, v7, BYTE4(v29), "Bobble: headGesturesEnabled, HeadphoneDevice:%s aad: %@ %hhd", (uint8_t *)v11, 0x19u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA6F8);
          swift_arrayDestroy();
          MEMORY[0x1DF0AD404](v23, -1, -1);
          v26 = v30;
          swift_arrayDestroy();
          MEMORY[0x1DF0AD404](v26, -1, -1);
          MEMORY[0x1DF0AD404](v11, -1, -1);

          v22 = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
          v10 = (_QWORD *)MEMORY[0x1E0DEEDD8];
          goto LABEL_10;
        }
LABEL_15:

        __break(1u);
        return;
      }
    }
    else
    {

      __break(1u);
    }

    __break(1u);
    goto LABEL_15;
  }

  v22 = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
LABEL_10:
  v27 = (*(uint64_t (**)(uint64_t))((*v10 & *v6) + 0x98))(v22);
  if (!v27)
    __break(1u);
  v28 = (void *)v27;
  sub_1DB38507C(0, (unint64_t *)&qword_1F02DA6B0);
  sub_1DB3BBE24();

  sub_1DB3BC010();
  swift_release();
  sub_1DB3BC4FC();
}

uint64_t sub_1DB3A038C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v2)
  {
    v3 = (void *)result;
    swift_retain();
    if (objc_msgSend(v3, sel_BOOLValue))
      v4 = 1;
    else
      v4 = 2;
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 144))(v4);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DB3A0474()
{
  return sub_1DB398ADC();
}

uint64_t sub_1DB3A05B0()
{
  uint64_t v0;
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
  char v12;
  __n128 v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  __int128 v18[2];
  _QWORD v19[4];
  _QWORD v20[20];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4F8);
  v2 = sub_1DB38CD8C();
  v4 = v3;
  v5 = sub_1DB38CD8C();
  v7 = sub_1DB38CD98(v2, v4, v5, v6);
  v8 = sub_1DB398ADC();
  v10 = v9;
  v19[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAA98);
  v19[0] = v1;
  v11 = type metadata accessor for BobbleSettingsViewController();
  v12 = sub_1DB38CB14();
  memset((char *)v18 + 8, 0, 24);
  *(_QWORD *)&v18[0] = v11;
  v13 = sub_1DB38CCD8(0, 0, v8, v10, (uint64_t)v19, (uint64_t)sel_headGestureOnInput_, 0, 2, (uint64_t)v20, 0, v12 & 1, v18[0], v18[1], (__n128)0, 0);
  v14 = (*(uint64_t (**)(_QWORD *, __n128))(*(_QWORD *)v7 + 160))(v20, v13);
  swift_release();
  v15 = sub_1DB389DF8(v20);
  v16 = (*(uint64_t (**)(_QWORD *))(*(_QWORD *)v14 + 176))(v15);
  swift_release();
  return v16;
}

void sub_1DB3A0774()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v1)
  {
    v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 232);
    v3 = swift_retain();
    LOBYTE(v2) = v2(v3);
    swift_release();
    sub_1DB3986C8((char)v2);
  }
  else
  {
    __break(1u);
  }
}

void sub_1DB3A0850()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v1)
  {
    v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 184);
    v3 = swift_retain();
    LOBYTE(v2) = v2(v3);
    swift_release();
    sub_1DB3986C8((char)v2);
  }
  else
  {
    __break(1u);
  }
}

id sub_1DB3A092C()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  char *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___movieLoopView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___movieLoopView];
  if (v2)
  {
    v3 = *(id *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___movieLoopView];
  }
  else
  {
    v4 = v0;
    type metadata accessor for BobbleVideoLoopPlayer();
    v5 = objc_msgSend(v0, sel_traitCollection);
    objc_msgSend(v5, sel_userInterfaceStyle);

    v6 = (void *)sub_1DB3A6530(0, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v6, sel_load);
    objc_msgSend(v6, sel_setDesiredBounds_, 0.0, 0.0, 130.0, 130.0);
    objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v7 = *(void **)&v4[v1];
    *(_QWORD *)&v4[v1] = v6;
    v3 = v6;

    v2 = 0;
  }
  v8 = v2;
  return v3;
}

id sub_1DB3A0A34()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___topAsset;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___topAsset);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___topAsset);
  }
  else
  {
    v4 = v0;
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
    v6 = sub_1DB3A092C();
    objc_msgSend(v5, sel_addSubview_, v6);

    v7 = (void *)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1DB3C2270;
    v9 = sub_1DB3A092C();
    v10 = objc_msgSend(v9, sel_centerXAnchor);

    v11 = objc_msgSend(v5, sel_centerXAnchor);
    v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

    *(_QWORD *)(v8 + 32) = v12;
    v13 = sub_1DB3A092C();
    v14 = objc_msgSend(v13, sel_centerYAnchor);

    v15 = objc_msgSend(v5, sel_centerYAnchor);
    v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v15, 20.0);

    *(_QWORD *)(v8 + 40) = v16;
    sub_1DB3BC3DC();
    sub_1DB38507C(0, (unint64_t *)&qword_1F02DA358);
    v17 = (void *)sub_1DB3BC3B8();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_activateConstraints_, v17);

    v18 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v19 = v2;
  return v3;
}

void sub_1DB3A0C58()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v15;
  id v16;

  v1 = v0;
  v2 = sub_1DB3A0A34();
  v3 = objc_msgSend(v1, sel_view);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    v6 = v5;

    objc_msgSend(v2, sel_setFrame_, 0.0, 0.0, v6, 180.0);
    v7 = objc_msgSend(v1, sel_table);
    if (!v7)
    {
LABEL_9:
      v15 = objc_msgSend(v1, sel_table);
      v16 = objc_msgSend(v15, sel_tableHeaderView);

      objc_msgSend(v16, sel_layoutIfNeeded);
      return;
    }
    v8 = v7;
    v9 = objc_msgSend(v7, sel_tableHeaderView);
    v10 = sub_1DB3A0A34();
    v11 = v10;
    if (v9)
    {
      sub_1DB38507C(0, &qword_1F02DA458);
      v12 = v9;
      v13 = sub_1DB3BC508();

      if ((v13 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    v14 = sub_1DB3A0A34();
    objc_msgSend(v8, sel_setTableHeaderView_, v14);

    v8 = v14;
LABEL_8:

    goto LABEL_9;
  }
  __break(1u);
}

id BobbleSettingsViewController.__deallocating_deinit()
{
  return sub_1DB3853EC(type metadata accessor for BobbleSettingsViewController);
}

void sub_1DB3A0EBC()
{
  char *v0;
  id v1;
  id v2;
  unint64_t v3;
  id v4;
  char v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v1 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v0, sel_setBackgroundColor_, v1);

  objc_msgSend(v0, sel_setSelectionStyle_, 0);
  v2 = objc_msgSend(v0, sel_subviews);
  sub_1DB38507C(0, &qword_1F02DA458);
  v3 = sub_1DB3BC3C4();

  v4 = *(id *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs20HPSCenterContentCell_label];
  v5 = sub_1DB38731C((uint64_t)v4, v3);
  swift_bridgeObjectRelease();

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v4, sel_layoutIfNeeded);
    objc_msgSend(v0, sel_layoutIfNeeded);
    return;
  }
  v6 = objc_msgSend(v0, sel_subviews);
  v7 = sub_1DB3BC3C4();

  if (!(v7 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_5;
LABEL_12:
    swift_bridgeObjectRelease_n();
    objc_msgSend(v0, sel_addSubview_, v4);
    v12 = (void *)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1DB3C1BA0;
    v14 = objc_msgSend(v4, sel_topAnchor);
    v15 = objc_msgSend(v0, sel_topAnchor);
    v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v15, 0.0);

    *(_QWORD *)(v13 + 32) = v16;
    v17 = objc_msgSend(v4, sel_leadingAnchor);
    v18 = objc_msgSend(v0, sel_leadingAnchor);
    v19 = objc_msgSend(v17, sel_constraintEqualToAnchor_constant_, v18, 20.0);

    *(_QWORD *)(v13 + 40) = v19;
    v20 = objc_msgSend(v4, sel_trailingAnchor);
    v21 = objc_msgSend(v0, sel_trailingAnchor);
    v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_constant_, v21, -20.0);

    *(_QWORD *)(v13 + 48) = v22;
    v23 = objc_msgSend(v4, sel_bottomAnchor);
    v24 = objc_msgSend(v0, sel_bottomAnchor);
    v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v24, 0.0);

    *(_QWORD *)(v13 + 56) = v25;
    sub_1DB3BC3DC();
    sub_1DB38507C(0, (unint64_t *)&qword_1F02DA358);
    v26 = (id)sub_1DB3BC3B8();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_activateConstraints_, v26);

    return;
  }
  swift_bridgeObjectRetain();
  v8 = sub_1DB3BC670();
  if (!v8)
    goto LABEL_12;
LABEL_5:
  if (v8 >= 1)
  {
    for (i = 0; i != v8; ++i)
    {
      if ((v7 & 0xC000000000000001) != 0)
        v10 = (id)MEMORY[0x1DF0AC9FC](i, v7);
      else
        v10 = *(id *)(v7 + 8 * i + 32);
      v11 = v10;
      objc_msgSend(v10, sel_removeFromSuperview);

    }
    goto LABEL_12;
  }
  __break(1u);
}

uint64_t type metadata accessor for HPSCenterContentCell()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for BobbleSettingsViewController()
{
  return objc_opt_self();
}

void sub_1DB3A1334()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_headphoneDevice] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_listeners] = MEMORY[0x1E0DEE9E8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesTopTextSection] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGesturesSwitchSection] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___headGestureMappingSection] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___tryBobbleSection] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___movieLoopView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController____lazy_storage___topAsset] = 0;

  sub_1DB3BC664();
  __break(1u);
}

uint64_t sub_1DB3A1404()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DB3A1428()
{
  uint64_t v0;

  return sub_1DB39FC94(v0);
}

unint64_t sub_1DB3A1430()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F02DA700;
  if (!qword_1F02DA700)
  {
    v1 = sub_1DB3BBF68();
    result = MEMORY[0x1DF0AD380](MEMORY[0x1E0DEFD08], v1);
    atomic_store(result, (unint64_t *)&qword_1F02DA700);
  }
  return result;
}

BOOL _s16HeadphoneConfigs28BobbleSettingsViewControllerC15bobbleSupportedySbyXlFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  int AppBooleanValue;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  os_log_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  int v36;
  _BYTE v37[4];
  int v38;
  os_log_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;

  v0 = sub_1DB3BC0DC();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = &v37[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v2);
  v6 = &v37[-v5];
  v7 = (__CFString *)sub_1DB3BC31C();
  CFPreferencesAppSynchronize(v7);

  v8 = (__CFString *)sub_1DB3BC31C();
  v9 = (__CFString *)sub_1DB3BC31C();
  AppBooleanValue = CFPreferencesGetAppBooleanValue(v8, v9, 0);

  if (AppBooleanValue)
    return 1;
  swift_unknownObjectRetain();
  objc_opt_self();
  v12 = (void *)swift_dynamicCastObjCClass();
  if (v12 && (v13 = objc_msgSend(v12, sel_headphoneDevice)) != 0)
  {
    v14 = v13;
    v15 = sub_1DB3988C4();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v1 + 16))(v6, v15, v0);
    v16 = v14;
    v17 = sub_1DB3BC0C4();
    v18 = sub_1DB3BC484();
    v19 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      v20 = swift_slowAlloc();
      v40 = swift_slowAlloc();
      v43 = v40;
      *(_DWORD *)v20 = 136315650;
      v39 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA190);
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_1DB3C1810;
      *(_QWORD *)(v21 + 56) = sub_1DB3BBF68();
      *(_QWORD *)(v21 + 64) = sub_1DB3A1430();
      *(_QWORD *)(v21 + 32) = v16;
      v22 = v16;
      v41 = v16;
      v23 = v22;
      v24 = sub_1DB3BC34C();
      v42 = sub_1DB388E4C(v24, v25, &v43);
      sub_1DB3BC58C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2080;
      v26 = (void *)sub_1DB3BBE30();
      v42 = (uint64_t)v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAAF0);
      v27 = sub_1DB3BC568();
      v38 = v19;
      v29 = v28;

      v42 = sub_1DB388E4C(v27, v29, &v43);
      sub_1DB3BC58C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 22) = 256;
      sub_1DB3BBE24();
      LOBYTE(v26) = sub_1DB3BBFEC();

      swift_release();
      LOBYTE(v42) = (_BYTE)v26;
      sub_1DB3BC58C();

      v16 = v41;
      v30 = v39;
      _os_log_impl(&dword_1DB30C000, v39, (os_log_type_t)v38, "Bobble: headGesturesEnabled, HeadphoneDevice:%s aad: %s %hhu", (uint8_t *)v20, 0x19u);
      v31 = v40;
      swift_arrayDestroy();
      MEMORY[0x1DF0AD404](v31, -1, -1);
      MEMORY[0x1DF0AD404](v20, -1, -1);

    }
    else
    {

    }
    (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v6, v0);
    sub_1DB3BBE24();
    v36 = sub_1DB3BBFEC();
    swift_release();

    swift_unknownObjectRelease();
    return v36 == 2;
  }
  else
  {
    swift_unknownObjectRelease();
    v32 = sub_1DB3988C4();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v1 + 16))(v4, v32, v0);
    v33 = sub_1DB3BC0C4();
    v34 = sub_1DB3BC484();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1DB30C000, v33, v34, "Bobble not supported!", v35, 2u);
      MEMORY[0x1DF0AD404](v35, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v4, v0);
    return 0;
  }
}

uint64_t sub_1DB3A193C(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  id v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[24];
  uint64_t v12;

  if (objc_msgSend(a1, sel_userInfo))
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }
  sub_1DB3872D4((uint64_t)&v9, (uint64_t)v11);
  if (!v12)
    goto LABEL_16;
  sub_1DB38507C(0, &qword_1F02DA428);
  if ((swift_dynamicCast() & 1) == 0)
    return sub_1DB398ADC();
  v1 = objc_msgSend((id)objc_opt_self(), sel_deviceKey);
  if (!v1)
  {
    sub_1DB3BC340();
    v1 = (id)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  v2 = objc_msgSend(v8, sel_objectForKey_, v1);

  if (v2)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
  }
  sub_1DB3872D4((uint64_t)&v9, (uint64_t)v11);
  if (!v12)
  {

LABEL_16:
    sub_1DB38E7C8((uint64_t)v11);
    return sub_1DB398ADC();
  }
  sub_1DB38507C(0, (unint64_t *)&qword_1F02DA478);
  if ((swift_dynamicCast() & 1) == 0)
  {

    return sub_1DB398ADC();
  }
  v3 = objc_msgSend(v8, sel_headphoneDevice);
  if (!v3)
  {

    return sub_1DB398ADC();
  }
  v4 = v3;
  sub_1DB3BBE24();

  v5 = sub_1DB3BC010();
  v6 = sub_1DB39877C(v5);

  swift_release();
  return v6;
}

void sub_1DB3A1B6C(void *a1)
{
  sub_1DB3A1B7C(a1, 0);
}

void sub_1DB3A1B74(void *a1)
{
  sub_1DB3A1B7C(a1, 1);
}

void sub_1DB3A1B7C(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = *(_QWORD *)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAAF8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DB3C16B0;
  *(_QWORD *)(inited + 32) = 0x65736163657375;
  *(_QWORD *)(inited + 40) = 0xE700000000000000;
  *(_BYTE *)(inited + 48) = a2;
  *(_QWORD *)(inited + 72) = &type metadata for BobbleMappingUseCase;
  *(_QWORD *)(inited + 80) = 0x65646F4D77656976;
  *(_QWORD *)(inited + 88) = 0xE90000000000006CLL;
  v7 = *(_QWORD *)(v5 + OBJC_IVAR____TtC16HeadphoneConfigs28BobbleSettingsViewController_viewModel);
  if (v7)
  {
    v8 = inited;
    *(_QWORD *)(inited + 120) = type metadata accessor for BobbleSettingsViewModel();
    *(_QWORD *)(v8 + 96) = v7;
    swift_retain();
    sub_1DB39EAE4(v8);
    v9 = (void *)sub_1DB3BC2EC();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setUserInfo_, v9);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1DB3A1C94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAB08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DB3A1CDC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DB3A1CEC()
{
  return swift_bridgeObjectRetain();
}

id sub_1DB3A1CFC()
{
  void *v0;

  objc_msgSend(v0, sel_bounds);
  return objc_msgSend(v0, sel_trackRectForBounds_);
}

float sub_1DB3A1D28()
{
  char *v0;
  float v1;

  objc_msgSend(v0, sel_maximumValue);
  return v1 / (float)(*(_QWORD *)(*(_QWORD *)&v0[qword_1F02DAB18] + 16) - 1);
}

double sub_1DB3A1D64()
{
  return 10.0;
}

double sub_1DB3A1D6C()
{
  return 27.0;
}

char *sub_1DB3A1D74()
{
  uint64_t v0;
  uint64_t v2;

  return sub_1DB3A1DC4((char *)sub_1DB3A478C, (uint64_t)&v2, 0, *(_QWORD *)(*(_QWORD *)(v0 + qword_1F02DAB18) + 16));
}

char *sub_1DB3A1DC4(char *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  char *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v19 = result;
  v5 = a4 - a3;
  if (__OFSUB__(a4, a3))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v6 = v4;
  v7 = MEMORY[0x1E0DEE9D8];
  if (!v5)
    return (char *)v7;
  v23 = MEMORY[0x1E0DEE9D8];
  result = sub_1DB3A3D94(0, v5 & ~(v5 >> 63), 0);
  if ((v5 & 0x8000000000000000) == 0)
  {
    v7 = v23;
    if (a4 <= a3)
      v10 = a3;
    else
      v10 = a4;
    v11 = a3;
    while (a4 != v11)
    {
      v20 = v11;
      result = (char *)((char *(*)(__int128 *__return_ptr, uint64_t *))v19)(&v21, &v20);
      if (v6)
      {
        swift_release();
        return (char *)v7;
      }
      v6 = 0;
      v12 = v21;
      v13 = v22;
      v23 = v7;
      v15 = *(_QWORD *)(v7 + 16);
      v14 = *(_QWORD *)(v7 + 24);
      if (v15 >= v14 >> 1)
      {
        v17 = v22;
        v18 = v21;
        result = sub_1DB3A3D94((char *)(v14 > 1), v15 + 1, 1);
        v13 = v17;
        v12 = v18;
        v7 = v23;
      }
      *(_QWORD *)(v7 + 16) = v15 + 1;
      v16 = v7 + 32 * v15;
      *(_OWORD *)(v16 + 32) = v12;
      *(_OWORD *)(v16 + 48) = v13;
      if (a4 < a3)
        goto LABEL_19;
      if (v10 == v11)
        goto LABEL_20;
      if (a4 == ++v11)
        return (char *)v7;
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_1DB3A1F10(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x1E0DEE9D8];
    if (!v6)
      break;
    v13 = MEMORY[0x1E0DEE9D8];
    result = sub_1DB3BC634();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
    v8 = 0;
    while (v6 != v8)
    {
      if ((a3 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x1DF0AC9FC](v8, a3);
      else
        v9 = *(id *)(a3 + 8 * v8 + 32);
      v10 = v9;
      v11 = v9;
      a1(&v12, &v11);

      if (v3)
        return swift_release();
      ++v8;
      sub_1DB3BC61C();
      sub_1DB3BC640();
      sub_1DB3BC64C();
      sub_1DB3BC628();
      if (v6 == v8)
        return v13;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    v6 = sub_1DB3BC670();
    swift_bridgeObjectRelease();
  }
  return result;
}

id sub_1DB3A2078(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  v2 = sub_1DB3A20A8();

  return v2;
}

id sub_1DB3A20A8()
{
  void *v0;
  float v1;

  objc_msgSend(v0, sel_value);
  return sub_1DB3A3918(v1);
}

void sub_1DB3A20C8(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = a1;
  sub_1DB3A2108(a3);

}

id sub_1DB3A2108(uint64_t a1)
{
  char *v1;
  float v2;
  float v3;
  double v4;

  v2 = (float)a1;
  objc_msgSend(v1, sel_maximumValue);
  *(float *)&v4 = (float)(v3 / (float)(*(_QWORD *)(*(_QWORD *)&v1[qword_1F02DAB18] + 16) - 1)) * v2;
  return objc_msgSend(v1, sel_setValue_animated_objectChange_, 1, 0, v4);
}

uint64_t sub_1DB3A2168()
{
  void *v0;

  objc_msgSend(v0, sel_selectedIndex);
  return sub_1DB3BC400();
}

uint64_t sub_1DB3A21C8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;

  v3 = *MEMORY[0x1E0DEEDD8] & *v1;
  sub_1DB3A3FBC();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 8))(a1);
}

void (*sub_1DB3A2214(_QWORD *a1))(_QWORD ***a1, char a2)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v1) + 0x50);
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  objc_msgSend(v1, sel_selectedIndex);
  sub_1DB3BC400();
  return sub_1DB3A22C8;
}

void sub_1DB3A22C8(_QWORD ***a1, char a2)
{
  _QWORD **v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  void (*v8)(_QWORD *, _QWORD *);

  v2 = *a1;
  v3 = (*a1)[3];
  v4 = (*a1)[4];
  v5 = (*a1)[1];
  v6 = (*a1)[2];
  v7 = **a1;
  if ((a2 & 1) != 0)
  {
    ((void (*)(_QWORD *, _QWORD *, _QWORD *))v6[2])((*a1)[3], v4, v5);
    objc_msgSend(v7, sel_setSelectedIndex_, (*(uint64_t (**)(_QWORD))(*(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v7) + 0x58) + 8))(*(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v7) + 0x50)));
    v8 = (void (*)(_QWORD *, _QWORD *))v6[1];
    v8(v3, v5);
  }
  else
  {
    objc_msgSend(v7, sel_setSelectedIndex_, (*(uint64_t (**)(_QWORD))(*(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v7) + 0x58) + 8))(*(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v7) + 0x50)));
    v8 = (void (*)(_QWORD *, _QWORD *))v6[1];
  }
  v8(v4, v5);
  free(v4);
  free(v3);
  free(v2);
}

double sub_1DB3A23C8(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;

  v1 = a1;
  sub_1DB3A2408((uint64_t)v1, v2, v3, v4);
  v6 = v5;

  return v6;
}

uint64_t sub_1DB3A2408(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  double v12;
  id v13;
  void *v14;
  double MaxY;
  objc_super v16;
  CGRect v17;

  v5 = (objc_class *)type metadata accessor for HeadphoneAccessoryLabeledSlider(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x58), a4);
  v16.receiver = v4;
  v16.super_class = v5;
  objc_msgSendSuper2(&v16, sel_intrinsicContentSize);
  v7 = v6;
  objc_msgSend(v4, sel_bounds);
  v8 = *(_QWORD *)((char *)v4 + qword_1F02DAB20);
  if (!(v8 >> 62))
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v9)
      goto LABEL_3;
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  result = sub_1DB3BC670();
  v9 = result;
  if (!result)
    return swift_bridgeObjectRelease_n();
LABEL_3:
  if (v9 >= 1)
  {
    v11 = 0;
    v12 = v7;
    do
    {
      if ((v8 & 0xC000000000000001) != 0)
        v13 = (id)MEMORY[0x1DF0AC9FC](v11, v8);
      else
        v13 = *(id *)(v8 + 8 * v11 + 32);
      v14 = v13;
      objc_msgSend(v13, sel_frame);
      MaxY = CGRectGetMaxY(v17);

      if (v12 <= MaxY)
        v12 = MaxY;
      ++v11;
    }
    while (v9 != v11);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t sub_1DB3A256C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DB3A257C(uint64_t a1, unint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_1DB3A25BC(a1, a2);
}

uint64_t sub_1DB3A25BC(uint64_t a1, unint64_t a2)
{
  unint64_t *v2;
  unint64_t v4;
  void *v5;
  unint64_t *v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_class *v26;
  id v27;
  id v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  objc_class *v32;
  id v33;
  double v34;
  uint64_t v35;
  char *v36;
  double v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t result;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[6];
  unint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  objc_super v54;
  objc_super v55;
  unint64_t v56;

  v4 = *v2;
  v51 = *MEMORY[0x1E0DEEDD8];
  *(unint64_t *)((char *)v2 + qword_1F02DAB30) = MEMORY[0x1E0DEE9D8];
  *(unint64_t *)((char *)v2 + qword_1F02DAB38) = 0x4024000000000000;
  *(unint64_t *)((char *)v2 + qword_1F02DAB40) = 0x403B000000000000;
  *(unint64_t *)((char *)v2 + qword_1F02DAB28) = a2;
  v5 = (void *)objc_opt_self();
  v6 = v2;
  v7 = objc_msgSend(v5, sel_sharedApplication);
  v8 = objc_msgSend(v7, sel_connectedScenes);

  sub_1DB38507C(0, &qword_1F02DAB48);
  sub_1DB3A401C();
  v9 = sub_1DB3BC448();

  sub_1DB3A2BCC(v9);
  v11 = v10;
  v53 = 0;
  swift_bridgeObjectRelease();
  if (v11 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    v47 = sub_1DB3BC670();
    swift_bridgeObjectRelease();
    v52 = v4;
    if (!v47)
    {
LABEL_16:
      swift_bridgeObjectRelease();
LABEL_17:
      swift_bridgeObjectRetain();
      v21 = a1;
      goto LABEL_18;
    }
  }
  else
  {
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    v52 = v4;
    if (!v12)
      goto LABEL_16;
  }
  if ((v11 & 0xC000000000000001) != 0)
  {
    v13 = (id)MEMORY[0x1DF0AC9FC](0, v11);
  }
  else
  {
    if (!*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_31;
    }
    v13 = *(id *)(v11 + 32);
  }
  v14 = v13;
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v14, sel_windows);

  sub_1DB38507C(0, &qword_1F02DAB58);
  v11 = sub_1DB3BC3C4();

  if (!(v11 >> 62))
  {
    v16 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v16)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_31:
  swift_bridgeObjectRetain();
  v16 = sub_1DB3BC670();
  if (!v16)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    v4 = v52;
    goto LABEL_16;
  }
LABEL_8:
  v4 = v11 & 0xC000000000000001;
  v17 = 4;
  while (1)
  {
    if (v4)
      v18 = (id)MEMORY[0x1DF0AC9FC](v17 - 4, v11);
    else
      v18 = *(id *)(v11 + 8 * v17);
    v19 = v18;
    v20 = v17 - 3;
    if (__OFADD__(v17 - 4, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if ((objc_msgSend(v18, sel_isKeyWindow) & 1) != 0)
      break;

    ++v17;
    if (v20 == v16)
      goto LABEL_15;
  }
  swift_bridgeObjectRelease_n();
  v44 = objc_msgSend(v19, sel_traitCollection);

  v45 = objc_msgSend(v44, sel_layoutDirection);
  v4 = v52;
  if (v45 != (id)1)
    goto LABEL_17;
  v46 = swift_bridgeObjectRetain();
  v21 = sub_1DB3A2EE4(v46);
LABEL_18:
  *(unint64_t *)((char *)v6 + qword_1F02DAB18) = v21;
  v22 = *(_QWORD *)(v21 + 16);
  v23 = MEMORY[0x1E0DEE9D8];
  if (v22)
  {
    v49 = v6;
    v50 = a1;
    v56 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1DB3BC634();
    v48[5] = v21;
    v24 = v21 + 40;
    v25 = *MEMORY[0x1E0DC4AB8];
    while (1)
    {
      v26 = (objc_class *)MEMORY[0x1E0DC3990];
      swift_bridgeObjectRetain();
      v27 = objc_msgSend(objc_allocWithZone(v26), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
      objc_msgSend(v27, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      v28 = sub_1DB3A3008(v25);
      objc_msgSend(v27, sel_setFont_, v28);

      v29 = (void *)sub_1DB3BC31C();
      objc_msgSend(v27, sel_setText_, v29);

      swift_bridgeObjectRelease();
      if (v53)
        break;
      v24 += 16;
      sub_1DB3BC61C();
      sub_1DB3BC640();
      sub_1DB3BC64C();
      sub_1DB3BC628();
      if (!--v22)
      {
        v23 = v56;
        swift_bridgeObjectRelease();
        v6 = v49;
        a1 = v50;
        v4 = v52;
        goto LABEL_23;
      }
    }
    result = swift_release();
    __break(1u);
  }
  else
  {
LABEL_23:
    v30 = v51 & v4;
    *(unint64_t *)((char *)v6 + qword_1F02DAB20) = v23;

    v32 = (objc_class *)type metadata accessor for HeadphoneAccessoryLabeledSlider(0, *(_QWORD *)(v30 + 80), *(_QWORD *)(v30 + 88), v31);
    v55.receiver = v6;
    v55.super_class = v32;
    v54.receiver = objc_msgSendSuper2(&v55, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    v54.super_class = v32;
    v33 = v54.receiver;
    objc_msgSendSuper2(&v54, sel__setTrackEnabled_, 1);
    LODWORD(v34) = 0;
    objc_msgSend(v33, sel_setMinimumValue_, v34);
    v35 = *(_QWORD *)(a1 + 16);
    v36 = (char *)v33;
    swift_bridgeObjectRelease();
    *(float *)&v37 = (float)(v35 - 1);
    objc_msgSend(v36, sel_setMaximumValue_, v37);

    v38 = *(_QWORD *)&v36[qword_1F02DAB20];
    MEMORY[0x1E0C80A78](v39);
    v48[2] = v36;
    swift_bridgeObjectRetain();
    v40 = sub_1DB3A1F10((void (*)(uint64_t *__return_ptr, id *))sub_1DB3A4074, (uint64_t)v48, v38);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v36[qword_1F02DAB30] = v40;
    swift_bridgeObjectRelease();
    v41 = (void *)objc_opt_self();
    sub_1DB38507C(0, (unint64_t *)&qword_1F02DA358);
    swift_bridgeObjectRetain();
    v42 = (void *)sub_1DB3BC3B8();
    swift_bridgeObjectRelease();
    objc_msgSend(v41, sel_activateConstraints_, v42);

    return (uint64_t)v36;
  }
  return result;
}

void sub_1DB3A2BCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v1 = a1;
  v23 = MEMORY[0x1E0DEE9D8];
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_1DB3BC5BC();
    sub_1DB38507C(0, &qword_1F02DAB48);
    sub_1DB3A401C();
    sub_1DB3BC454();
    v1 = v18;
    v16 = v19;
    v2 = v20;
    v3 = v21;
    v4 = v22;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v16 = a1 + 56;
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v3 = 0;
  }
  v8 = (unint64_t)(v2 + 64) >> 6;
  while (v1 < 0)
  {
    if (!sub_1DB3BC5D4())
      goto LABEL_37;
    sub_1DB38507C(0, &qword_1F02DAB48);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v12 = v17;
    swift_unknownObjectRelease();
    v11 = v3;
    v9 = v4;
    if (!v17)
      goto LABEL_37;
LABEL_33:
    objc_opt_self();
    if (swift_dynamicCastObjCClass())
    {
      MEMORY[0x1DF0AC7B0]();
      if (*(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_1DB3BC3E8();
      sub_1DB3BC3F4();
      sub_1DB3BC3DC();
    }
    else
    {

    }
    v3 = v11;
    v4 = v9;
  }
  if (v4)
  {
    v9 = (v4 - 1) & v4;
    v10 = __clz(__rbit64(v4)) | (v3 << 6);
    v11 = v3;
LABEL_32:
    v12 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v10);
    if (!v12)
      goto LABEL_37;
    goto LABEL_33;
  }
  v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v8)
      goto LABEL_37;
    v14 = *(_QWORD *)(v16 + 8 * v13);
    v11 = v3 + 1;
    if (!v14)
    {
      v11 = v3 + 2;
      if (v3 + 2 >= v8)
        goto LABEL_37;
      v14 = *(_QWORD *)(v16 + 8 * v11);
      if (!v14)
      {
        v11 = v3 + 3;
        if (v3 + 3 >= v8)
          goto LABEL_37;
        v14 = *(_QWORD *)(v16 + 8 * v11);
        if (!v14)
        {
          v11 = v3 + 4;
          if (v3 + 4 >= v8)
            goto LABEL_37;
          v14 = *(_QWORD *)(v16 + 8 * v11);
          if (!v14)
          {
            v11 = v3 + 5;
            if (v3 + 5 >= v8)
              goto LABEL_37;
            v14 = *(_QWORD *)(v16 + 8 * v11);
            if (!v14)
            {
              v15 = v3 + 6;
              while (v8 != v15)
              {
                v14 = *(_QWORD *)(v16 + 8 * v15++);
                if (v14)
                {
                  v11 = v15 - 1;
                  goto LABEL_31;
                }
              }
LABEL_37:
              sub_1DB3A4810();
              return;
            }
          }
        }
      }
    }
LABEL_31:
    v9 = (v14 - 1) & v14;
    v10 = __clz(__rbit64(v14)) + (v11 << 6);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t sub_1DB3A2EE4(uint64_t result)
{
  char *v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  unint64_t v15;

  v1 = (char *)result;
  v2 = *(_QWORD *)(result + 16);
  if (v2 < 2)
    return (uint64_t)v1;
  v3 = 0;
  v4 = 0;
  v5 = v2 >> 1;
  v6 = v2 - 1;
  v7 = 16 * v2 + 16;
  v15 = v2 >> 1;
  while (1)
  {
    if (v4 == v6)
      goto LABEL_4;
    v8 = *((_QWORD *)v1 + 2);
    if (v4 >= v8)
      break;
    if (v6 >= v8)
      goto LABEL_13;
    v10 = *(_QWORD *)&v1[v3 + 32];
    v9 = *(_QWORD *)&v1[v3 + 40];
    v12 = *(_QWORD *)&v1[v7];
    v11 = *(_QWORD *)&v1[v7 + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v1 = sub_1DB3A3EA8((uint64_t)v1);
    v13 = &v1[v3];
    result = swift_bridgeObjectRelease();
    *((_QWORD *)v13 + 4) = v12;
    *((_QWORD *)v13 + 5) = v11;
    if (v6 >= *((_QWORD *)v1 + 2))
      goto LABEL_14;
    v14 = &v1[v7];
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v14 = v10;
    *((_QWORD *)v14 + 1) = v9;
    v5 = v15;
LABEL_4:
    ++v4;
    --v6;
    v7 -= 16;
    v3 += 16;
    if (v5 == v4)
      return (uint64_t)v1;
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

id sub_1DB3A3008(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  id v30;
  id v31;
  char v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;

  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_sharedApplication);
  v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  v5 = sub_1DB3BC340();
  v7 = v6;
  if (v5 == sub_1DB3BC340() && v7 == v8)
    goto LABEL_13;
  v10 = sub_1DB3BC6D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
    goto LABEL_14;
  v11 = sub_1DB3BC340();
  v13 = v12;
  if (v11 == sub_1DB3BC340() && v13 == v14)
    goto LABEL_13;
  v16 = sub_1DB3BC6D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v16 & 1) != 0)
  {
LABEL_14:

    goto LABEL_15;
  }
  v17 = sub_1DB3BC340();
  v19 = v18;
  if (v17 == sub_1DB3BC340() && v19 == v20)
  {
LABEL_13:
    swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  v33 = sub_1DB3BC6D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v33 & 1) != 0)
    goto LABEL_14;
  v34 = (void *)*MEMORY[0x1E0DC4918];
  v35 = sub_1DB3BC340();
  v37 = v36;
  if (v35 == sub_1DB3BC340() && v37 == v38)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    v39 = sub_1DB3BC6D0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v39 & 1) == 0)
    {
      v22 = v34;
      goto LABEL_16;
    }
  }
LABEL_15:
  v21 = objc_msgSend(v2, sel_sharedApplication);
  v22 = objc_msgSend(v21, sel_preferredContentSizeCategory);

LABEL_16:
  v23 = objc_msgSend((id)objc_opt_self(), sel_traitCollectionWithPreferredContentSizeCategory_, v22);
  v24 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_compatibleWithTraitCollection_, a1, v23);
  v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC37F8]), sel_initForTextStyle_, a1);
  v26 = (void *)objc_opt_self();
  objc_msgSend(v24, sel_pointSize);
  v27 = objc_msgSend(v26, sel_systemFontOfSize_);
  objc_msgSend(v24, sel_pointSize);
  v29 = v28;
  v30 = v23;
  v31 = objc_msgSend(v25, sel_scaledFontForFont_maximumPointSize_compatibleWithTraitCollection_, v27, v30, v29);

  return v31;
}

void sub_1DB3A3390(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  sub_1DB3A4238();
}

void sub_1DB3A33B8(void *a1)
{
  id v1;

  v1 = a1;
  sub_1DB3A42D0();

}

id sub_1DB3A33EC()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  id result;
  uint64_t i;
  id v5;
  void *v6;
  float v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v11 = *v0;
  v10 = *MEMORY[0x1E0DEEDD8];
  v1 = *(uint64_t *)((char *)v0 + qword_1F02DAB30);
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (id)swift_bridgeObjectRetain_n();
    if (v2)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    v9 = (objc_class *)type metadata accessor for HeadphoneAccessoryLabeledSlider(0, *(_QWORD *)((v10 & v11) + 0x50), *(_QWORD *)((v10 & v11) + 0x58), v8);
    v12.receiver = v0;
    v12.super_class = v9;
    return objc_msgSendSuper2(&v12, sel_updateConstraints);
  }
  swift_bridgeObjectRetain_n();
  result = (id)sub_1DB3BC670();
  v2 = (uint64_t)result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v2 >= 1)
  {
    for (i = 0; i != v2; ++i)
    {
      if ((v1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1DF0AC9FC](i, v1);
      else
        v5 = *(id *)(v1 + 8 * i + 32);
      v6 = v5;
      objc_msgSend(v0, sel_maximumValue, v10, v11);
      objc_msgSend(v6, sel_setConstant_, sub_1DB3A3A04((float)(v7 / (float)(*(_QWORD *)(*(uint64_t *)((char *)v0 + qword_1F02DAB18) + 16) - 1)) * (float)i));

    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void sub_1DB3A356C(void *a1)
{
  id v1;

  v1 = a1;
  sub_1DB3A33EC();

}

id sub_1DB3A35A0(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  objc_class *v13;
  objc_super v15;

  v13 = (objc_class *)type metadata accessor for HeadphoneAccessoryLabeledSlider(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v8) + 0x50), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v8) + 0x58), a8);
  v15.receiver = v8;
  v15.super_class = v13;
  return objc_msgSendSuper2(&v15, sel_trackRectForBounds_, a1, a2, a3, a4);
}

double sub_1DB3A362C(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;

  v9 = a1;
  sub_1DB3A35A0(a2, a3, a4, a5, (uint64_t)v9, v10, v11, v12);
  v14 = v13;

  return v14;
}

void sub_1DB3A36A8(void *a1)
{
  id v1;

  v1 = a1;
  sub_1DB3A46E4();

}

id sub_1DB3A36EC(char a1, char a2, float a3)
{
  _QWORD *v3;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  uint64_t v10;
  objc_class *v11;
  double v12;
  id result;
  objc_super v14;

  v6 = *MEMORY[0x1E0DEEDD8] & *v3;
  v7 = (float)(uint64_t)sub_1DB3A3918(a3);
  objc_msgSend(v3, sel_maximumValue);
  v9 = (float)(v8 / (float)(*(_QWORD *)(*(_QWORD *)((char *)v3 + qword_1F02DAB18) + 16) - 1)) * v7;
  v11 = (objc_class *)type metadata accessor for HeadphoneAccessoryLabeledSlider(0, *(_QWORD *)(v6 + 80), *(_QWORD *)(v6 + 88), v10);
  v14.receiver = v3;
  v14.super_class = v11;
  *(float *)&v12 = v9;
  result = objc_msgSendSuper2(&v14, sel_setValue_animated_, a1 & 1, v12);
  if ((a2 & 1) != 0)
  {
    MEMORY[0x1DF0AD380](&unk_1DB3C2350, v11);
    sub_1DB3BC1C0();
    sub_1DB3BC1CC();
    return (id)swift_release();
  }
  return result;
}

void sub_1DB3A37CC(void *a1, float a2, uint64_t a3, char a4, char a5)
{
  id v8;

  v8 = a1;
  sub_1DB3A36EC(a4, a5, a2);

}

void sub_1DB3A3824()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;

  v1 = objc_msgSend(v0, sel__minTrackView);
  if (v1)
  {
    v5 = v1;
    v2 = objc_msgSend(v0, sel__maxTrackView);
    if (v2)
    {
      v3 = v2;
      objc_msgSend(v5, sel_setHidden_, 1);
      objc_msgSend(v3, sel_setHidden_, 1);

      v4 = v3;
    }
    else
    {
      v4 = v5;
    }

  }
}

float sub_1DB3A38CC(uint64_t a1)
{
  char *v1;
  float v2;
  float v3;

  v2 = (float)a1;
  objc_msgSend(v1, sel_maximumValue);
  return (float)(v3 / (float)(*(_QWORD *)(*(_QWORD *)&v1[qword_1F02DAB18] + 16) - 1)) * v2;
}

id sub_1DB3A3918(float a1)
{
  char *v1;
  id result;
  float v4;
  float v5;

  result = objc_msgSend(v1, sel_maximumValue);
  v5 = roundf(a1 / (float)(v4 / (float)(*(_QWORD *)(*(_QWORD *)&v1[qword_1F02DAB18] + 16) - 1)));
  if ((~LODWORD(v5) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v5 < 9.2234e18)
    return (id)(uint64_t)v5;
LABEL_7:
  __break(1u);
  return result;
}

CGFloat sub_1DB3A39A8(float a1)
{
  void *v1;
  CGFloat v2;
  CGRect v4;

  v2 = sub_1DB3A3A04(a1) + -1.0;
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v1, sel_trackRectForBounds_);
  CGRectGetMidY(v4);
  return v2;
}

CGFloat sub_1DB3A3A04(float a1)
{
  void *v1;
  float v3;
  float v4;
  float v5;
  float v6;
  CGFloat v7;
  double v8;
  CGRect v10;

  objc_msgSend(v1, sel_maximumValue);
  v4 = v3;
  objc_msgSend(v1, sel_minimumValue);
  v6 = v4 - v5;
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v1, sel_trackRectForBounds_);
  v7 = (CGRectGetWidth(v10) + -16.0) / v6 * a1;
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v1, sel_trackRectForBounds_);
  return v7 + v8 + 8.0;
}

id sub_1DB3A3AB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v6;
  unint64_t v7;
  uint64_t v8;
  id result;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  objc_super v15;

  v6 = (objc_class *)type metadata accessor for HeadphoneAccessoryLabeledSlider(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x58), a4);
  v15.receiver = v4;
  v15.super_class = v6;
  objc_msgSendSuper2(&v15, sel_traitCollectionDidChange_, a1);
  v7 = *(_QWORD *)((char *)v4 + qword_1F02DAB20);
  if (!(v7 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (id)swift_bridgeObjectRetain_n();
    if (v8)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease_n();
    return objc_msgSend(v4, sel_setNeedsDisplay);
  }
  swift_bridgeObjectRetain_n();
  result = (id)sub_1DB3BC670();
  v8 = (uint64_t)result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v8 >= 1)
  {
    v10 = 0;
    v11 = *MEMORY[0x1E0DC4AB8];
    do
    {
      if ((v7 & 0xC000000000000001) != 0)
        v12 = (id)MEMORY[0x1DF0AC9FC](v10, v7);
      else
        v12 = *(id *)(v7 + 8 * v10 + 32);
      v13 = v12;
      ++v10;
      v14 = sub_1DB3A3008(v11);
      objc_msgSend(v13, sel_setFont_, v14);

    }
    while (v8 != v10);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void sub_1DB3A3C20(void *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v8 = a1;
  sub_1DB3A3AB8((uint64_t)a3, (uint64_t)v8, v6, v7);

}

void sub_1DB3A3C78()
{
  sub_1DB3A46FC();
}

void sub_1DB3A3C94()
{
  sub_1DB3A46FC();
}

id sub_1DB3A3CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for HeadphoneAccessoryLabeledSlider(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_1DB3A3CFC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DB3A3D54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t result;

  type metadata accessor for HeadphoneAccessoryLabeledSlider(0, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), a2);
  result = sub_1DB3BC1C0();
  *a3 = result;
  return result;
}

char *sub_1DB3A3D94(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1DB3A3DB0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1DB3A3DB0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAB60);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 32 * v8);
  }
  swift_release();
  return v10;
}

char *sub_1DB3A3EA8(uint64_t a1)
{
  return sub_1DB3A3EBC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_1DB3A3EBC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA520);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

id sub_1DB3A3FBC()
{
  _QWORD *v0;

  return objc_msgSend(v0, sel_setSelectedIndex_, (*(uint64_t (**)(_QWORD))(*(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58) + 8))(*(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x50)));
}

uint64_t type metadata accessor for HeadphoneAccessoryLabeledSlider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HeadphoneAccessoryLabeledSlider);
}

unint64_t sub_1DB3A401C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F02DAB50;
  if (!qword_1F02DAB50)
  {
    v1 = sub_1DB38507C(255, &qword_1F02DAB48);
    result = MEMORY[0x1DF0AD380](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1F02DAB50);
  }
  return result;
}

void sub_1DB3A4074(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  float v14;
  id v15;

  v4 = *(void **)(v2 + 16);
  v5 = (void *)*a1;
  objc_msgSend(v4, sel_addSubview_, *a1);
  v6 = objc_msgSend(v5, sel_topAnchor);
  v7 = objc_msgSend(v4, sel_topAnchor);
  v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_constant_, v7, 47.0);

  objc_msgSend(v8, sel_setActive_, 1);
  v9 = objc_msgSend(v5, sel_bottomAnchor);
  v10 = objc_msgSend(v4, sel_bottomAnchor);
  v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  objc_msgSend(v11, sel_setActive_, 1);
  v12 = objc_msgSend(v5, sel_centerXAnchor);
  v13 = objc_msgSend(v4, sel_leftAnchor);
  objc_msgSend(v4, sel_value);
  v15 = objc_msgSend(v12, sel_constraintEqualToAnchor_constant_, v13, sub_1DB3A3A04(v14));

  *a2 = v15;
}

void sub_1DB3A4238()
{
  char *v0;

  *(_QWORD *)&v0[qword_1F02DAB30] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[qword_1F02DAB38] = 0x4024000000000000;
  *(_QWORD *)&v0[qword_1F02DAB40] = 0x403B000000000000;

  sub_1DB3BC664();
  __break(1u);
}

void sub_1DB3A42D0()
{
  char *v0;
  void *v1;
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  double v23;
  double v24;
  uint64_t v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  float v30;
  double v31;
  double v32;
  uint64_t v33;
  id v34;
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  id v39;
  CGFloat v40;
  id v41;
  char *v42;
  _BYTE v43[16];
  char *v44;
  CGRect v45;
  CGRect v46;

  sub_1DB3A3824();
  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_systemFillColor);
  objc_msgSend(v2, sel_set);

  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v0, sel_trackRectForBounds_);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v0, sel_trackRectForBounds_);
  v11 = CGRectGetHeight(v45) * 0.5;
  v12 = objc_msgSend((id)objc_opt_self(), sel_bezierPathWithRoundedRect_cornerRadius_, v4, v6, v8, v10, v11);
  objc_msgSend(v12, sel_fill);

  v13 = objc_msgSend(v1, sel_systemGray4Color);
  objc_msgSend(v13, sel_set);

  v14 = *(_QWORD *)(*(_QWORD *)&v0[qword_1F02DAB18] + 16);
  v44 = v0;
  v42 = sub_1DB3A1DC4((char *)sub_1DB3A478C, (uint64_t)v43, 0, v14);
  v15 = *((_QWORD *)v42 + 2);
  if (v15)
  {
    v16 = 0;
    v17 = (double *)(v42 + 56);
    while (1)
    {
      v18 = *(v17 - 3);
      v19 = *(v17 - 2);
      v20 = *(v17 - 1);
      v21 = *v17;
      objc_msgSend(v0, sel_maximumValue);
      v23 = sub_1DB3A3A04((float)(v22 / (float)(*(_QWORD *)(*(_QWORD *)&v0[qword_1F02DAB18] + 16) - 1)) * (float)(uint64_t)v16);
      if (v16)
      {
        v24 = v23;
      }
      else
      {
        v25 = *(_QWORD *)&v0[qword_1F02DAB20];
        if ((v25 & 0xC000000000000001) != 0)
        {
          v26 = (id)MEMORY[0x1DF0AC9FC](0, v23);
        }
        else
        {
          if (!*(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_31;
          v26 = *(id *)(v25 + 32);
        }
        v27 = v26;
        objc_msgSend(v26, sel_bounds);
        v29 = v28;

        v24 = v29 * 0.5;
      }
      objc_msgSend(v0, sel_maximumValue);
      if ((~LODWORD(v30) & 0x7F800000) == 0)
        break;
      if (v30 <= -9.2234e18)
        goto LABEL_27;
      if (v30 >= 9.2234e18)
        goto LABEL_28;
      if (v16 == (uint64_t)v30)
      {
        objc_msgSend(v0, sel_bounds);
        objc_msgSend(v0, sel_trackRectForBounds_);
        v32 = v31;
        v33 = *(_QWORD *)&v0[qword_1F02DAB20];
        if ((v33 & 0xC000000000000001) != 0)
        {
          v34 = (id)MEMORY[0x1DF0AC9FC](v16);
        }
        else
        {
          if (*(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10) <= v16)
            goto LABEL_30;
          v34 = *(id *)(v33 + 8 * v16 + 32);
        }
        v35 = v34;
        objc_msgSend(v34, sel_bounds);
        v37 = v36;

        v24 = v32 + v37 * -0.5;
      }
      v38 = *(_QWORD *)&v0[qword_1F02DAB30];
      if ((v38 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        v39 = (id)MEMORY[0x1DF0AC9FC](v16, v38);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (*(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10) <= v16)
          goto LABEL_29;
        v39 = *(id *)(v38 + 8 * v16 + 32);
      }
      ++v16;
      objc_msgSend(v39, sel_setConstant_, v24);

      v46.origin.x = v18;
      v46.origin.y = v19;
      v46.size.width = v20;
      v46.size.height = v21;
      v40 = CGRectGetWidth(v46) * 0.5;
      v41 = objc_msgSend((id)objc_opt_self(), sel_bezierPathWithRoundedRect_cornerRadius_, v18, v19, v20, v21, v40);
      objc_msgSend(v41, sel_fill);

      v17 += 4;
      if (v15 == v16)
        goto LABEL_25;
    }
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
  }
  else
  {
LABEL_25:
    swift_bridgeObjectRelease();
  }
}

id sub_1DB3A46E4()
{
  void *v0;

  return objc_msgSend(v0, sel_setValue_animated_objectChange_, 1, 1);
}

void sub_1DB3A46FC()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_1DB3A4728()
{
  return MEMORY[0x1E0C96020];
}

uint64_t sub_1DB3A4734()
{
  return swift_initClassMetadata2();
}

double sub_1DB3A478C@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char *v4;
  float v5;
  float v6;
  uint64_t v7;
  double result;

  v4 = *(char **)(v2 + 16);
  v5 = (float)*a1;
  objc_msgSend(v4, sel_maximumValue);
  *(CGFloat *)a2 = sub_1DB3A39A8((float)(v6 / (float)(*(_QWORD *)(*(_QWORD *)&v4[qword_1F02DAB18] + 16) - 1)) * v5);
  *(_QWORD *)(a2 + 8) = v7;
  result = 2.0;
  *(_OWORD *)(a2 + 16) = xmmword_1DB3C2340;
  return result;
}

uint64_t sub_1DB3A4810()
{
  return swift_release();
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

uint64_t sub_1DB3A4824(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1DB3A4844(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DAB68);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1DB3A4890(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1DB3A48B0(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DAB70);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DAB78);
}

uint64_t sub_1DB3A4908()
{
  uint64_t v0;

  v0 = sub_1DB3BC0DC();
  __swift_allocate_value_buffer(v0, qword_1F02DB128);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB128);
  return sub_1DB3BC0D0();
}

uint64_t sub_1DB3A497C()
{
  uint64_t v0;

  if (qword_1F02DDCD0 != -1)
    swift_once();
  v0 = sub_1DB3BC0DC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB128);
}

uint64_t sub_1DB3A49C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F02DDCD0 != -1)
    swift_once();
  v2 = sub_1DB3BC0DC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02DB128);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DB3A4A34(uint64_t result)
{
  return result;
}

uint64_t sub_1DB3A4A40(char a1)
{
  return *(_QWORD *)&aUnknown_4[8 * a1];
}

uint64_t sub_1DB3A4A60(char *a1, char *a2)
{
  return sub_1DB3A4A6C(*a1, *a2);
}

uint64_t sub_1DB3A4A6C(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aUnknown_4[8 * a1] == *(_QWORD *)&aUnknown_4[8 * a2] && qword_1DB3C2618[a1] == qword_1DB3C2618[a2])
    v3 = 1;
  else
    v3 = sub_1DB3BC6D0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_1DB3A4AF0()
{
  return sub_1DB3A4AF8();
}

uint64_t sub_1DB3A4AF8()
{
  sub_1DB3BC70C();
  sub_1DB3BC370();
  swift_bridgeObjectRelease();
  return sub_1DB3BC724();
}

uint64_t sub_1DB3A4B60()
{
  return sub_1DB3A4B68();
}

uint64_t sub_1DB3A4B68()
{
  sub_1DB3BC370();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DB3A4BA8()
{
  return sub_1DB3A4BB0();
}

uint64_t sub_1DB3A4BB0()
{
  sub_1DB3BC70C();
  sub_1DB3BC370();
  swift_bridgeObjectRelease();
  return sub_1DB3BC724();
}

uint64_t sub_1DB3A4C14@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1DB3A5EF4();
  *a1 = result;
  return result;
}

uint64_t sub_1DB3A4C40@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1DB3A4A40(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

char *sub_1DB3A4C68(unint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  unsigned int *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  char *result;
  uint64_t v10;

  v2 = *((_QWORD *)sub_1DB3A4DA0() + 2);
  swift_bridgeObjectRelease();
  if (v2 <= (uint64_t)a1)
  {
    if (qword_1F02DDCD0 == -1)
      goto LABEL_6;
  }
  else
  {
    v3 = sub_1DB3A4DA0();
    if ((a1 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v3[2] > a1)
    {
      v4 = (unsigned int *)v3 + a1 + 8;
LABEL_10:
      v10 = *v4;
      swift_bridgeObjectRelease();
      return (char *)v10;
    }
    __break(1u);
  }
  swift_once();
LABEL_6:
  v5 = sub_1DB3BC0DC();
  __swift_project_value_buffer(v5, (uint64_t)qword_1F02DB128);
  v6 = sub_1DB3BC0C4();
  v7 = sub_1DB3BC478();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DB30C000, v6, v7, "_modeForIndex: Index out of bounds!", v8, 2u);
    MEMORY[0x1DF0AD404](v8, -1, -1);
  }

  result = (char *)sub_1DB3A4DA0();
  if (*((_QWORD *)result + 2))
  {
    v4 = (unsigned int *)(result + 32);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

void *sub_1DB3A4DA0()
{
  void *v0;
  unsigned int v1;
  unsigned int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v1 = objc_msgSend(v0, sel_autoANCSupported);
  v2 = objc_msgSend(v0, sel_modeOffSupported);
  v3 = &unk_1EA29CC00;
  if (v2)
    v3 = &unk_1EA29CBD0;
  v4 = &unk_1EA29CC60;
  if (v2)
    v4 = &unk_1EA29CC30;
  if (v1)
    v5 = v3;
  else
    v5 = v4;
  if (qword_1F02DDCD0 != -1)
    swift_once();
  v6 = sub_1DB3BC0DC();
  __swift_project_value_buffer(v6, (uint64_t)qword_1F02DB128);
  v7 = v0;
  swift_bridgeObjectRetain_n();
  v8 = v7;
  v9 = sub_1DB3BC0C4();
  v10 = sub_1DB3BC484();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v22 = v12;
    *(_DWORD *)v11 = 67109634;
    v13 = objc_msgSend(v8, sel_autoANCSupported);

    LODWORD(v21) = v13;
    sub_1DB3BC58C();

    *(_WORD *)(v11 + 8) = 1024;
    objc_msgSend(v8, sel_modeOffSupported, v21);

    sub_1DB3BC58C();
    *(_WORD *)(v11 + 14) = 2080;
    type metadata accessor for BTAccessoryListeningMode(0);
    v15 = v14;
    v16 = swift_bridgeObjectRetain();
    v17 = MEMORY[0x1DF0AC7D4](v16, v15);
    v19 = v18;
    swift_bridgeObjectRelease();
    sub_1DB388E4C(v17, v19, &v22);
    sub_1DB3BC58C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1DB30C000, v9, v10, "validModes: autoANCSupported: %{BOOL}d, modeOffSupported:%{BOOL}d, modes:%s", (uint8_t *)v11, 0x18u);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v12, -1, -1);
    MEMORY[0x1DF0AD404](v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v5;
}

uint64_t sub_1DB3A5094(int a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  v2 = sub_1DB3A4DA0();
  v3 = v2[2];
  if (v3)
  {
    if (*((_DWORD *)v2 + 8) == a1)
    {
      v4 = 0;
      swift_bridgeObjectRelease();
      return v4;
    }
    v4 = 0;
    v5 = v3 - 1;
    while (v5 != v4)
    {
      v6 = *((_DWORD *)v2 + v4++ + 9);
      if (v6 == a1)
      {
        swift_bridgeObjectRelease();
        return v4;
      }
    }
  }
  swift_bridgeObjectRelease();
  if (qword_1F02DDCD0 != -1)
    swift_once();
  v7 = sub_1DB3BC0DC();
  __swift_project_value_buffer(v7, (uint64_t)qword_1F02DB128);
  v8 = sub_1DB3BC0C4();
  v9 = sub_1DB3BC478();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1DB30C000, v8, v9, "_indexForMode: No valid index found", v10, 2u);
    MEMORY[0x1DF0AD404](v10, -1, -1);
  }

  return 0;
}

void sub_1DB3A51F8(NSObject *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  os_log_type_t v30;
  uint8_t *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAB80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAB88);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1DB3A569C();
  if (v12)
  {
    if (!*(_QWORD *)(v12 + 16))
    {
      swift_bridgeObjectRelease();
      if (!a1)
        goto LABEL_13;
      goto LABEL_7;
    }
    sub_1DB389660(0x726576726573624FLL, 0xE800000000000000);
    v14 = v13;
    swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
      return;
  }
  if (!a1)
    goto LABEL_13;
LABEL_7:
  objc_opt_self();
  v15 = swift_dynamicCastObjCClass();
  if (v15)
  {
    v16 = (void *)v15;
    swift_unknownObjectRetain();
    v17 = objc_msgSend(v16, sel_headphoneDevice);
    if (v17)
    {
      v18 = v17;
      v35 = a1;
      sub_1DB3A569C();
      v33 = sub_1DB3BC1B4();
      v19 = (void *)sub_1DB3BC2EC();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      objc_setAssociatedObject(v2, &byte_1F02DB140, v19, (void *)1);
      swift_endAccess();

      v34 = sub_1DB3BBE48();
      sub_1DB3BBFBC();
      v20 = v9;
      v21 = sub_1DB3BBE18();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v36 = v21;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAB90);
      sub_1DB383980(&qword_1F02DAB98, &qword_1F02DAB90, MEMORY[0x1E0C95D90]);
      sub_1DB3BC268();
      swift_release();
      *(_QWORD *)(swift_allocObject() + 16) = v2;
      sub_1DB383980(&qword_1F02DABA0, &qword_1F02DAB88, MEMORY[0x1E0C95988]);
      v22 = v2;
      v23 = sub_1DB3BC274();
      swift_release();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v8);
      swift_retain();
      v24 = sub_1DB3A569C();
      if (v24)
      {
        v25 = v24;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v36 = v25;
        sub_1DB3A5BE4(v23, 0x726576726573624FLL, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
        v27 = v36;
        swift_bridgeObjectRelease();
        if (v27)
        {
          v28 = (void *)sub_1DB3BC2EC();
          swift_bridgeObjectRelease();
        }
        else
        {
          v28 = 0;
        }
        v32 = (void *)v34;
        swift_beginAccess();
        objc_setAssociatedObject(v22, &byte_1F02DB140, v28, (void *)1);
        swift_endAccess();

        swift_release();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }
      else
      {
        __break(1u);
      }
      return;
    }
    swift_unknownObjectRelease();
  }
LABEL_13:
  if (qword_1F02DDCD0 != -1)
    swift_once();
  v29 = sub_1DB3BC0DC();
  __swift_project_value_buffer(v29, (uint64_t)qword_1F02DB128);
  v35 = sub_1DB3BC0C4();
  v30 = sub_1DB3BC478();
  if (os_log_type_enabled(v35, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_1DB30C000, v35, v30, "startObservingOffModeChanges: Precondition not meet no record!", v31, 2u);
    MEMORY[0x1DF0AD404](v31, -1, -1);
  }

}

uint64_t sub_1DB3A569C()
{
  void *v0;
  id v1;
  uint64_t v3;
  _OWORD v4[2];
  _BYTE v5[24];
  uint64_t v6;

  swift_beginAccess();
  v1 = objc_getAssociatedObject(v0, &byte_1F02DB140);
  swift_endAccess();
  if (v1)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_1DB3872D4((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DABC8);
    if ((swift_dynamicCast() & 1) != 0)
      return v3;
  }
  else
  {
    sub_1DB38E7C8((uint64_t)v5);
  }
  return 0;
}

char *sub_1DB3A57C8()
{
  return &byte_1F02DB140;
}

uint64_t sub_1DB3A57D4()
{
  swift_beginAccess();
  return byte_1F02DB140;
}

uint64_t sub_1DB3A5814(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_1F02DB140 = a1;
  return result;
}

uint64_t (*sub_1DB3A5858())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

BOOL sub_1DB3A58A0(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *sub_1DB3A58B4@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_1DB3A58C4(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1DB3A58D0(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DABC0);
  v36 = a2;
  v6 = sub_1DB3BC688();
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
      swift_retain();
    }
    sub_1DB3BC70C();
    sub_1DB3BC370();
    result = sub_1DB3BC724();
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

uint64_t sub_1DB3A5BE4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_1DB389660(a2, a3);
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
    sub_1DB3A5D40();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
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
  sub_1DB3A58D0(v15, a4 & 1);
  v21 = sub_1DB389660(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1DB3BC6F4();
  __break(1u);
  return result;
}

void *sub_1DB3A5D40()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DABC0);
  v2 = *v0;
  v3 = sub_1DB3BC67C();
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
    result = (void *)swift_retain();
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

uint64_t sub_1DB3A5EF4()
{
  unint64_t v0;

  v0 = sub_1DB3BC6B8();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

void type metadata accessor for BTAccessoryListeningMode(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DABB8);
}

uint64_t sub_1DB3A5F50()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1DB3A5F74(unsigned __int8 *a1)
{
  uint64_t v1;
  void *v2;
  _BOOL4 v3;
  id result;

  v2 = *(void **)(v1 + 16);
  v3 = *a1 != 1;
  result = objc_msgSend(v2, sel_modeOffSupported);
  if (((v3 ^ result) & 1) == 0)
    return objc_msgSend(v2, sel_resetUI);
  return result;
}

unint64_t sub_1DB3A5FD0()
{
  unint64_t result;

  result = qword_1F02DABA8;
  if (!qword_1F02DABA8)
  {
    result = MEMORY[0x1DF0AD380](&unk_1DB3C244C, &_s4ModeON);
    atomic_store(result, (unint64_t *)&qword_1F02DABA8);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s4ModeOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s4ModeOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1DB3A60FC + 4 * byte_1DB3C2445[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1DB3A6130 + 4 * asc_1DB3C2440[v4]))();
}

uint64_t sub_1DB3A6130(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB3A6138(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DB3A6140);
  return result;
}

uint64_t sub_1DB3A614C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DB3A6154);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1DB3A6158(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB3A6160(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB3A616C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1DB3A6174(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *_s4ModeOMa()
{
  return &_s4ModeON;
}

ValueMetadata *_s14AssociatedKeysVMa_0()
{
  return &_s14AssociatedKeysVN_0;
}

void type metadata accessor for HMMultiState(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DABB0);
}

uint64_t static HPSSpatialProfileFeedback.getDraftViewController()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  id v5;
  uint64_t v7;

  v0 = sub_1DB3BC2B0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_allocWithZone((Class)sub_1DB3BC2C8());
  sub_1DB3BC2A4();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0D20FA0], v0);
  sub_1DB3BC2BC();
  v5 = objc_allocWithZone((Class)sub_1DB3BC2E0());
  return sub_1DB3BC2D4();
}

id HPSSpatialProfileFeedback.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HPSSpatialProfileFeedback.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HPSSpatialProfileFeedback();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for HPSSpatialProfileFeedback()
{
  return objc_opt_self();
}

id HPSSpatialProfileFeedback.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HPSSpatialProfileFeedback();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1DB3A6424(unint64_t result)
{
  if (result >= 3)
    return 3;
  return result;
}

uint64_t sub_1DB3A6434(uint64_t result)
{
  return result;
}

BOOL sub_1DB3A643C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1DB3A6450()
{
  sub_1DB3BC70C();
  sub_1DB3BC718();
  return sub_1DB3BC724();
}

uint64_t sub_1DB3A6494()
{
  return sub_1DB3BC718();
}

uint64_t sub_1DB3A64BC()
{
  sub_1DB3BC70C();
  sub_1DB3BC718();
  return sub_1DB3BC724();
}

uint64_t *sub_1DB3A64FC@<X0>(uint64_t *result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  if ((unint64_t)*result >= 3)
    LOBYTE(v2) = 3;
  *a2 = v2;
  return result;
}

void sub_1DB3A6514(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_1DB3A6520()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs21BobbleVideoLoopPlayer_videoUseCase);
}

uint64_t sub_1DB3A6530(int a1, double a2, double a3, double a4, double a5)
{
  objc_class *v5;
  id v11;

  v11 = objc_allocWithZone(v5);
  return sub_1DB3A65A0(a1, a2, a3, a4, a5);
}

uint64_t sub_1DB3A65A0(int a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  void *v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void (*v32)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v33;
  _BYTE *v34;
  _BYTE *v35;
  uint64_t ObjCClassFromMetadata;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t result;
  void *v50;
  objc_class *v51;
  id v52;
  _BYTE v53[4];
  int v54;
  _BYTE *v55;
  objc_super v56;
  _QWORD v57[2];

  v6 = v5;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA788);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = &v53[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = MEMORY[0x1E0C80A78](v13);
  v18 = &v53[-v17];
  MEMORY[0x1E0C80A78](v16);
  v20 = &v53[-v19];
  v21 = sub_1DB3BBCD4();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = MEMORY[0x1E0C80A78](v21);
  v25 = &v53[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v23);
  v55 = &v53[-v26];
  v54 = a1;
  if (!(_BYTE)a1)
  {
    swift_getObjectType();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v37 = (void *)objc_opt_self();
    v38 = v6;
    v15 = objc_msgSend(v37, sel_bundleForClass_, ObjCClassFromMetadata);
    v57[0] = 0;
    v57[1] = 0xE000000000000000;
    sub_1DB3BC5E0();
    swift_bridgeObjectRelease();
    v57[0] = 0xD000000000000010;
    v57[1] = 0x80000001DB3CB150;
    sub_1DB3BC388();
    swift_bridgeObjectRelease();
    v39 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
    v40 = (void *)sub_1DB3BC31C();
    v41 = objc_msgSend(v15, sel_URLForResource_withExtension_, v39, v40);

    if (v41)
    {
      sub_1DB3BBCBC();

      v32 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v22 + 32);
      v32(v20, v25, v21);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v20, 0, 1, v21);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) != 1)
      {
        v33 = v55;
        v34 = v55;
        v35 = v20;
        goto LABEL_12;
      }
      goto LABEL_16;
    }
LABEL_15:
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v20, 1, 1, v21);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a1 == 1)
  {
    swift_getObjectType();
    v27 = swift_getObjCClassFromMetadata();
    v28 = (void *)objc_opt_self();
    v29 = v6;
    v20 = objc_msgSend(v28, sel_bundleForClass_, v27);
    strcpy((char *)v57, "Bobble_Nod_");
    HIDWORD(v57[1]) = -352321536;
    sub_1DB3BC388();
    swift_bridgeObjectRelease();
    v15 = (_BYTE *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
    v30 = (void *)sub_1DB3BC31C();
    v31 = objc_msgSend(v20, sel_URLForResource_withExtension_, v15, v30);

    if (v31)
    {
      sub_1DB3BBCBC();

      v32 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v22 + 32);
      v32(v18, v25, v21);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v18, 0, 1, v21);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v22 + 48))(v18, 1, v21) != 1)
      {
        v33 = v55;
        v34 = v55;
        v35 = v18;
LABEL_12:
        v32(v34, v35, v21);
        *((_BYTE *)v6 + OBJC_IVAR____TtC16HeadphoneConfigs21BobbleVideoLoopPlayer_videoUseCase) = v54;

        v50 = (void *)sub_1DB3BBCB0();
        v51 = (objc_class *)type metadata accessor for BobbleVideoLoopPlayer();
        v56.receiver = v6;
        v56.super_class = v51;
        v52 = objc_msgSendSuper2(&v56, sel_initWithFrame_urlForResource_, v50, a2, a3, a4, a5);

        (*(void (**)(_BYTE *, uint64_t))(v22 + 8))(v33, v21);
        return (uint64_t)v52;
      }
    }
    else
    {
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v18, 1, 1, v21);
    }
    __break(1u);
    goto LABEL_15;
  }
  swift_getObjectType();
  v42 = swift_getObjCClassFromMetadata();
  v43 = (void *)objc_opt_self();
  v44 = v6;
  v45 = objc_msgSend(v43, sel_bundleForClass_, v42);
  strcpy((char *)v57, "Bobble_Shake_");
  HIWORD(v57[1]) = -4864;
  sub_1DB3BC388();
  swift_bridgeObjectRelease();
  v46 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  v47 = (void *)sub_1DB3BC31C();
  v48 = objc_msgSend(v45, sel_URLForResource_withExtension_, v46, v47);

  if (!v48)
  {
LABEL_17:
    result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v22 + 56))(v15, 1, 1, v21);
    goto LABEL_18;
  }
  sub_1DB3BBCBC();

  v32 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v22 + 32);
  v32(v15, v25, v21);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v15, 0, 1, v21);
  result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v22 + 48))(v15, 1, v21);
  if ((_DWORD)result != 1)
  {
    v33 = v55;
    v34 = v55;
    v35 = v15;
    goto LABEL_12;
  }
LABEL_18:
  __break(1u);
  return result;
}

void sub_1DB3A6B94()
{
  void *v0;
  void *v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t (*v11)(uint64_t, uint64_t *);
  uint64_t (*v12)(uint64_t, uint64_t *);
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t *);
  void *v23;
  void (*v24)(CMTimeValue, uint64_t, CMTimeEpoch);
  uint64_t v25;
  objc_super v26;

  v1 = v0;
  v26.receiver = v0;
  v26.super_class = (Class)type metadata accessor for BobbleVideoLoopPlayer();
  objc_msgSendSuper2(&v26, sel_load);
  if (!*((_BYTE *)v0 + OBJC_IVAR____TtC16HeadphoneConfigs21BobbleVideoLoopPlayer_videoUseCase))
  {
    swift_getObjectType();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v4 = (void *)sub_1DB3BC31C();
    v5 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_, v4, v3);

    if (v5)
    {
      v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_initWithImage_, v5);

      objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      v7 = objc_msgSend(v1, sel_videoPlayer);
      v8 = sub_1DB3BC4F0();
      v10 = v9;
      v12 = v11;
      v13 = HIDWORD(v9);
      sub_1DB38507C(0, (unint64_t *)&qword_1F02DA1F8);
      v14 = (void *)sub_1DB3BC4CC();
      v15 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v16 = swift_allocObject();
      *(_QWORD *)(v16 + 16) = v15;
      *(_QWORD *)(v16 + 24) = v6;
      v24 = sub_1DB3A7194;
      v25 = v16;
      v20 = MEMORY[0x1E0C809B0];
      v21 = 1107296256;
      v22 = sub_1DB3A6E20;
      v23 = &block_descriptor_1;
      v17 = _Block_copy(&v20);
      v18 = v6;
      swift_release();
      v20 = v8;
      v21 = __PAIR64__(v13, v10);
      v22 = v12;
      v19 = objc_msgSend(v7, sel_addPeriodicTimeObserverForInterval_queue_usingBlock_, &v20, v14, v17);
      _Block_release(v17);

      sub_1DB3BC5B0();
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v20);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_1DB3A6E20(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[2];
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(v2, v3, v4);
  return swift_release();
}

void sub_1DB3A6EA8()
{
  sub_1DB3BC664();
  __break(1u);
}

id sub_1DB3A6F58(uint64_t a1, double a2, double a3, double a4, double a5)
{
  objc_class *v5;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;

  v11 = objc_allocWithZone(v5);
  v12 = (void *)sub_1DB3BBCB0();
  v13 = objc_msgSend(v11, sel_initWithFrame_urlForResource_, v12, a2, a3, a4, a5);

  v14 = sub_1DB3BBCD4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a1, v14);
  return v13;
}

void sub_1DB3A7000()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1DB3A709C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1DB3A70F4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BobbleVideoLoopPlayer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BobbleVideoLoopPlayer()
{
  return objc_opt_self();
}

uint64_t sub_1DB3A7144()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DB3A7168()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_1DB3A7194(CMTimeValue a1, uint64_t a2, CMTimeEpoch a3)
{
  uint64_t v3;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CMTimeValue v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  CMTime v26;
  CGRect v27;
  CGRect v28;

  v7 = *(_QWORD *)(v3 + 16);
  v8 = *(void **)(v3 + 24);
  v9 = v7 + 16;
  swift_beginAccess();
  v10 = MEMORY[0x1DF0AD470](v9);
  if (v10)
  {
    v11 = (void *)v10;
    v26.value = a1;
    *(_QWORD *)&v26.timescale = a2;
    v26.epoch = a3;
    if (CMTimeGetSeconds(&v26) >= 4.3)
    {
      objc_msgSend(v11, sel_addSubview_, v8);
      v12 = (void *)objc_opt_self();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_1DB3C1BA0;
      v14 = objc_msgSend(v8, sel_widthAnchor);
      objc_msgSend(v11, sel_desiredBounds);
      v15 = objc_msgSend(v14, sel_constraintEqualToConstant_, CGRectGetWidth(v27));

      *(_QWORD *)(v13 + 32) = v15;
      v16 = objc_msgSend(v8, sel_heightAnchor);
      objc_msgSend(v11, sel_desiredBounds);
      v17 = objc_msgSend(v16, sel_constraintEqualToConstant_, CGRectGetHeight(v28));

      *(_QWORD *)(v13 + 40) = v17;
      v18 = objc_msgSend(v8, sel_centerXAnchor);
      v19 = objc_msgSend(v11, sel_centerXAnchor);
      v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

      *(_QWORD *)(v13 + 48) = v20;
      v21 = objc_msgSend(v8, sel_centerYAnchor);
      v22 = objc_msgSend(v11, sel_centerYAnchor);
      v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

      *(_QWORD *)(v13 + 56) = v23;
      v26.value = v13;
      sub_1DB3BC3DC();
      sub_1DB38507C(0, (unint64_t *)&qword_1F02DA358);
      v24 = (void *)sub_1DB3BC3B8();
      swift_bridgeObjectRelease();
      objc_msgSend(v12, sel_activateConstraints_, v24);

      v25 = objc_msgSend(v11, sel_playerLooper);
      objc_msgSend(v25, sel_disableLooping);

    }
  }
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_1DB3A7484()
{
  unint64_t result;

  result = qword_1F02DAC00;
  if (!qword_1F02DAC00)
  {
    result = MEMORY[0x1DF0AD380](&unk_1DB3C268C, &type metadata for BobbleVideoLoopPlayer.VideoUseCase);
    atomic_store(result, (unint64_t *)&qword_1F02DAC00);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BobbleVideoLoopPlayer.VideoUseCase(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BobbleVideoLoopPlayer.VideoUseCase(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1DB3A75A4 + 4 * byte_1DB3C2685[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1DB3A75D8 + 4 * asc_1DB3C2680[v4]))();
}

uint64_t sub_1DB3A75D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB3A75E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DB3A75E8);
  return result;
}

uint64_t sub_1DB3A75F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DB3A75FCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1DB3A7600(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB3A7608(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BobbleVideoLoopPlayer.VideoUseCase()
{
  return &type metadata for BobbleVideoLoopPlayer.VideoUseCase;
}

void *sub_1DB3A7624()
{
  return &unk_1DB3C2790;
}

void *sub_1DB3A7630()
{
  return &unk_1DB3C2798;
}

uint64_t type metadata accessor for HPSSpatialProfileSingleStepBottomContainer.HPSSpatialProfileSingleStepBottomContainerImpl()
{
  return objc_opt_self();
}

id sub_1DB3A7660()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HPSSpatialProfileSingleStepBottomContainer.HPSSpatialProfileSingleStepBottomContainerImpl()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

id sub_1DB3A76AC()
{
  uint64_t v0;

  return objc_retain(*(id *)(*(_QWORD *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView));
}

id sub_1DB3A76E4()
{
  uint64_t v0;

  return objc_retain(*(id *)(*(_QWORD *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewFirst));
}

id sub_1DB3A771C()
{
  uint64_t v0;

  return objc_retain(*(id *)(*(_QWORD *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_learnMoreView));
}

id sub_1DB3A7754()
{
  uint64_t v0;

  return objc_retain(*(id *)(*(_QWORD *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewSecond));
}

id sub_1DB3A778C()
{
  uint64_t v0;

  return objc_retain(*(id *)(*(_QWORD *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTrayEffectView));
}

id sub_1DB3A77C4()
{
  uint64_t v0;

  return objc_retain(*(id *)(*(_QWORD *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton));
}

id sub_1DB3A77FC()
{
  uint64_t v0;

  return objc_retain(*(id *)(*(_QWORD *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray));
}

id sub_1DB3A7834()
{
  uint64_t v0;

  return objc_retain(*(id *)(*(_QWORD *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_stackContainerView));
}

id sub_1DB3A786C()
{
  uint64_t v0;

  return objc_retain(*(id *)(*(_QWORD *)(v0
                                       + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                           + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_scrollView));
}

uint64_t sub_1DB3A7888()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _BYTE *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v1 = sub_1DB3BBD1C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (_BYTE *)(v0
               + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection);
  if (*(_BYTE *)(v0
                + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection
                + 8) != 1)
    return *(_QWORD *)v5;
  if (*(_QWORD *)(sub_1DB3BBCF8() + 16))
    swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_1DB3BBD04();
  v7 = sub_1DB3BBD10();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  result = v7 == 2;
  *(_QWORD *)v5 = result;
  v5[8] = 0;
  return result;
}

uint64_t sub_1DB3A7988()
{
  return 0;
}

char *sub_1DB3A7994(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_1DB3A79D4(a1, a2);
}

char *sub_1DB3A79D4(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  objc_class *v6;
  id v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  uint64_t v16;
  id v17;
  id v18;
  objc_super v20;

  v5 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  v6 = (objc_class *)type metadata accessor for HPSSpatialProfileSingleStepBottomContainer.HPSSpatialProfileSingleStepBottomContainerImpl();
  v7 = objc_allocWithZone(v6);
  v8 = v2;
  *(_QWORD *)&v2[v5] = objc_msgSend(v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v9 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  *(_QWORD *)&v8[v9] = objc_msgSend(objc_allocWithZone(v6), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v10 = &v8[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v8[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_budInEarStringBlock];
  *(_QWORD *)v11 = a1;
  *((_QWORD *)v11 + 1) = a2;
  swift_retain();

  v20.receiver = v8;
  v20.super_class = (Class)type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
  v12 = (char *)objc_msgSendSuper2(&v20, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v13 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  v14 = *(void **)&v12[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl];
  v15 = v12;
  objc_msgSend(v14, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v12[v13], sel_setAlpha_, 0.0);
  v16 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  objc_msgSend(*(id *)&v15[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v15, sel_addSubview_, *(_QWORD *)&v12[v13]);
  objc_msgSend(v15, sel_addSubview_, *(_QWORD *)&v15[v16]);
  v17 = *(id *)&v15[v16];
  sub_1DB3A9A30(v17);

  v18 = *(id *)&v12[v13];
  sub_1DB3A9A30(v18);

  swift_release();
  return v15;
}

uint64_t type metadata accessor for HPSSpatialProfileSingleStepBottomContainer()
{
  return objc_opt_self();
}

uint64_t sub_1DB3A7C00(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = (id)(*(uint64_t (**)(void))(a1 + 16))();
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1DB3BC340();

  return v3;
}

id sub_1DB3A7C5C(char a1)
{
  uint64_t v1;
  double v2;

  if ((a1 & 1) != 0)
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(*(_QWORD *)(v1+ OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray), sel_setAlpha_, v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(v1+ OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl)+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray), sel_setAlpha_, v2);
}

id sub_1DB3A7D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  objc_msgSend(*(id *)(*(_QWORD *)(v2+ OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton), sel_removeTarget_action_forControlEvents_, 0, 0, 0xFFFFFFFFLL);
  v6 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  objc_msgSend(*(id *)(*(_QWORD *)(v2+ OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl)+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton), sel_removeTarget_action_forControlEvents_, 0, 0, 0xFFFFFFFFLL);
  objc_msgSend(*(id *)(*(_QWORD *)(v2 + v5)+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton), sel_addTarget_action_forControlEvents_, a1, a2, 64);
  return objc_msgSend(*(id *)(*(_QWORD *)(v2 + v6)+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton), sel_addTarget_action_forControlEvents_, a1, a2, 64);
}

void sub_1DB3A7E50()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  id v4;

  v1 = objc_retain(*(id *)(*(_QWORD *)(v0
                                     + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                         + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton));
  v2 = (void *)sub_1DB3BC31C();
  objc_msgSend(v1, sel_setTitle_forState_, v2, 0);

  v3 = objc_retain(*(id *)(*(_QWORD *)(v0
                                     + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl)
                         + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton));
  v4 = (id)sub_1DB3BC31C();
  objc_msgSend(v3, sel_setTitle_forState_, v4, 0);

}

uint64_t sub_1DB3A7F7C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x138))(a1, a2, 0, 0);
}

uint64_t sub_1DB3A8010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & *v4)
                                                                                       + 0x140))(a1, a2, 0, 0, a3, a4);
}

void sub_1DB3A8108(int a1, int a2, id *a3, void **a4, uint64_t a5, uint64_t a6)
{
  uint64_t ObjCClassFromMetadata;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  switch(a2)
  {
    case 0:
    case 1:
    case 3:
    case 9:
    case 10:
    case 11:
      return;
    case 2:
      sub_1DB3A96C8();
      break;
    case 4:
      sub_1DB3A84B8();
      break;
    case 5:
      sub_1DB3A85C0(a3, a4, a5, a6);
      break;
    case 6:
      sub_1DB3A8EAC(a3, a4, a5, a6);
      break;
    case 7:
      sub_1DB3A948C(a1);
      break;
    case 8:
      if (a1 == 2)
      {
        type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
        ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
        v7 = (void *)objc_opt_self();
        v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
        v9 = sub_1DB3BBC8C();
        v11 = v10;

        v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
        v13 = sub_1DB3BBC8C();
        v15 = v14;

        sub_1DB3A8BB4(v9, v11, v13, v15, 0, 0, 0);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      break;
    case 12:
      sub_1DB3A9864();
      break;
    default:
      type metadata accessor for HPSSpatialProfileV2EnrollmentStep(0);
      sub_1DB3BC6DC();
      __break(1u);
      JUMPOUT(0x1DB3A83C0);
  }
}

void sub_1DB3A84B8()
{
  _QWORD *v0;
  void *v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  id v4;

  v1 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC8))();
  type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1DB3BBC8C();

  v4 = (id)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setTitle_forState_, v4, 0, 0xE000000000000000);

}

void sub_1DB3A85C0(id *a1, void **a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t ObjCClassFromMetadata;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  double v32;
  void *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  char *v39;
  _QWORD *v40;
  void *v41;
  char *v42;
  uint64_t v43;
  uint64_t aBlock;
  uint64_t v49;
  void *v50;
  void *v51;
  void (*v52)();
  _QWORD *v53;

  v5 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  v6 = *(void **)(*(_QWORD *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl]
                + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView);
  type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v8 = (void *)objc_opt_self();
  v9 = v6;
  v10 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1DB3BBC8C();

  v11 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setTitle_, v11, 0xE000000000000000);

  v12 = objc_retain(*(id *)(*(_QWORD *)&v4[v5]
                          + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView));
  v13 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1DB3BBC8C();

  v14 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setDetailText_, v14, 0xE000000000000000);

  v15 = objc_retain(*(id *)(*(_QWORD *)&v4[v5]
                          + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton));
  v16 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1DB3BBC8C();

  v17 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  objc_msgSend(v15, sel_setTitle_forState_, v17, 0, 0xE000000000000000);

  if (a1 && a2)
  {
    v18 = *a2;
    v19 = *(void **)&v4[v5];
    v20 = *a1;
    v21 = v19;
    v22 = v20;
    v23 = v21;
    v24 = v18;
    v25 = sub_1DB3A7888();
    objc_msgSend(v4, sel_bounds);
    if (v25)
      v27 = -0.5;
    else
      v27 = 0.5;
    v28 = v26 * v27;
    objc_msgSend(v23, sel_frame);
    objc_msgSend(v23, sel_setFrame_, v28);
    objc_msgSend(v23, sel_setAlpha_, 0.0);
    objc_msgSend(v23, sel_layoutIfNeeded);

    if (*(_QWORD *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection])
      v29 = -0.5;
    else
      v29 = 0.5;
    v30 = v22;
    objc_msgSend(v4, sel_bounds);
    v32 = v31 * v29;
    objc_msgSend(v30, sel_frame);
    objc_msgSend(v30, sel_setFrame_, v32);
    objc_msgSend(v30, sel_setAlpha_, 0.0);
    objc_msgSend(v30, sel_layoutIfNeeded);

    v33 = (void *)objc_opt_self();
    v34 = (_QWORD *)swift_allocObject();
    v34[2] = v4;
    v34[3] = v24;
    v34[4] = v30;
    v52 = sub_1DB3AC508;
    v53 = v34;
    v35 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v49 = 1107296256;
    v50 = sub_1DB399E28;
    v51 = &block_descriptor_28_0;
    v36 = _Block_copy(&aBlock);
    v37 = v30;
    v38 = v24;
    v39 = v4;
    swift_release();
    v40 = (_QWORD *)swift_allocObject();
    v40[2] = a3;
    v40[3] = a4;
    v40[4] = v39;
    v52 = sub_1DB3AC784;
    v53 = v40;
    aBlock = v35;
    v49 = 1107296256;
    v50 = sub_1DB3A8B78;
    v51 = &block_descriptor_34;
    v41 = _Block_copy(&aBlock);
    v42 = v39;
    sub_1DB38CC74(a3);
    swift_release();
    objc_msgSend(v33, sel_animateWithDuration_animations_completion_, v36, v41, 0.6);
    _Block_release(v41);
    _Block_release(v36);

  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4E0);
    v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_1DB3C1810;
    *(_QWORD *)(v43 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v43 + 32) = 0xD000000000000065;
    *(_QWORD *)(v43 + 40) = 0x80000001DB3CBB30;
    sub_1DB3BC700();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1DB3A8B78(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void sub_1DB3A8BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  char *v7;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  id v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char *v26;
  uint64_t v27;
  void *v28;
  char *v29;
  uint64_t aBlock;
  uint64_t v32;
  void *v33;
  void *v34;
  void (*v35)();
  uint64_t v36;

  v9 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  v10 = objc_retain(*(id *)(*(_QWORD *)&v7[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl]
                          + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView));
  v11 = (void *)sub_1DB3BC31C();
  objc_msgSend(v10, sel_setTitle_, v11);

  v12 = objc_retain(*(id *)(*(_QWORD *)&v7[v9]
                          + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView));
  v13 = (void *)sub_1DB3BC31C();
  objc_msgSend(v12, sel_setDetailText_, v13);

  if (a6)
  {
    v14 = objc_retain(*(id *)(*(_QWORD *)&v7[v9]
                            + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton));
    v15 = (void *)sub_1DB3BC31C();
    objc_msgSend(v14, sel_setTitle_forState_, v15, 0);

  }
  v16 = 0.0;
  if ((a7 & 1) != 0)
    v16 = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)&v7[v9]+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton), sel_setAlpha_, v16);
  v17 = *(id *)&v7[v9];
  v18 = sub_1DB3A7888();
  objc_msgSend(v7, sel_bounds);
  v20 = -0.5;
  if (!v18)
    v20 = 0.5;
  v21 = v19 * v20;
  objc_msgSend(v17, sel_frame);
  objc_msgSend(v17, sel_setFrame_, v21);

  objc_msgSend(*(id *)&v7[v9], sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)&v7[v9], sel_layoutIfNeeded);
  v22 = (void *)objc_opt_self();
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v7;
  v35 = sub_1DB3ACE84;
  v36 = v23;
  v24 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v32 = 1107296256;
  v33 = sub_1DB399E28;
  v34 = &block_descriptor_64;
  v25 = _Block_copy(&aBlock);
  v26 = v7;
  swift_release();
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v26;
  v35 = sub_1DB3AD034;
  v36 = v27;
  aBlock = v24;
  v32 = 1107296256;
  v33 = sub_1DB3A8B78;
  v34 = &block_descriptor_70;
  v28 = _Block_copy(&aBlock);
  v29 = v26;
  swift_release();
  objc_msgSend(v22, sel_animateWithDuration_animations_completion_, v25, v28, 0.6);
  _Block_release(v28);
  _Block_release(v25);
}

void sub_1DB3A8EAC(void **a1, void **a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t ObjCClassFromMetadata;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  char *v40;
  _QWORD *v41;
  void *v42;
  char *v43;
  char *v46;
  uint64_t v48;
  id v50;
  uint64_t aBlock;
  uint64_t v52;
  void *v53;
  void *v54;
  void (*v55)();
  _QWORD *v56;

  v5 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  v6 = *(void **)(*(_QWORD *)&v4[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl]
                + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView);
  type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v8 = (void *)objc_opt_self();
  v9 = v6;
  v10 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1DB3BBC8C();

  v11 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setTitle_, v11, 0xE000000000000000);

  v12 = objc_retain(*(id *)(*(_QWORD *)&v4[v5]
                          + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView));
  v13 = objc_msgSend(v8, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_1DB3BBC8C();

  v14 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setDetailText_, v14, 0xE000000000000000);

  v46 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)&v4[v5]+ OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton), sel_setAlpha_, 0.0);
  if (a1 && a2 && (v15 = *a1, v16 = *a2, objc_opt_self(), (v17 = swift_dynamicCastObjCClass()) != 0))
  {
    v48 = v17;
    v18 = *(void **)&v4[v5];
    v19 = v15;
    v50 = v16;
    v20 = v18;
    v21 = sub_1DB3A7888();
    objc_msgSend(v46, sel_bounds);
    v23 = -0.5;
    if (!v21)
      v23 = 0.5;
    v24 = v22 * v23;
    objc_msgSend(v20, sel_frame);
    objc_msgSend(v20, sel_setFrame_, v24);

    objc_msgSend(*(id *)&v46[v5], sel_setAlpha_, 0.0);
    objc_msgSend(*(id *)&v46[v5], sel_layoutIfNeeded);
    v25 = v19;
    v26 = objc_msgSend(v19, sel_subviews);
    sub_1DB38507C(0, &qword_1F02DA458);
    v27 = sub_1DB3BC3C4();

    if (v27 >> 62)
      goto LABEL_19;
    v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v28; v28 = sub_1DB3BC670())
    {
      v29 = 4;
      v30 = 0;
      if ((v27 & 0xC000000000000001) != 0)
      {
LABEL_9:
        v31 = (id)MEMORY[0x1DF0AC9FC](v30, v27);
        goto LABEL_11;
      }
      while (1)
      {
        v31 = *(id *)(v27 + 8 * v29);
LABEL_11:
        v32 = v31;
        if (__OFADD__(v30, 1))
          break;
        objc_opt_self();
        if (!swift_dynamicCastObjCClass())
          objc_msgSend(v32, sel_setAlpha_, 0.0);

        if (v30 + 1 == v28)
          goto LABEL_20;
        v30 = ++v29 - 4;
        if ((v27 & 0xC000000000000001) != 0)
          goto LABEL_9;
      }
      __break(1u);
LABEL_19:
      swift_bridgeObjectRetain();
    }
LABEL_20:
    swift_bridgeObjectRelease_n();
    objc_msgSend(v25, sel_layoutIfNeeded);
    v34 = (void *)objc_opt_self();
    v35 = (_QWORD *)swift_allocObject();
    v35[2] = v46;
    v35[3] = v48;
    v35[4] = v25;
    v55 = sub_1DB3AC918;
    v56 = v35;
    v36 = MEMORY[0x1E0C809B0];
    aBlock = MEMORY[0x1E0C809B0];
    v52 = 1107296256;
    v53 = sub_1DB399E28;
    v54 = &block_descriptor_46;
    v37 = _Block_copy(&aBlock);
    v38 = v25;
    v39 = v50;
    v40 = v46;
    swift_release();
    v41 = (_QWORD *)swift_allocObject();
    v41[2] = a3;
    v41[3] = a4;
    v41[4] = v40;
    v55 = sub_1DB3ACCAC;
    v56 = v41;
    aBlock = v36;
    v52 = 1107296256;
    v53 = sub_1DB3A8B78;
    v54 = &block_descriptor_52;
    v42 = _Block_copy(&aBlock);
    v43 = v40;
    sub_1DB38CC74(a3);
    swift_release();
    objc_msgSend(v34, sel_animateWithDuration_animations_completion_, v37, v42, 0.6);
    _Block_release(v42);
    _Block_release(v37);

  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4E0);
    v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_1DB3C1810;
    *(_QWORD *)(v33 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v33 + 32) = 0xD000000000000065;
    *(_QWORD *)(v33 + 40) = 0x80000001DB3CBB30;
    sub_1DB3BC700();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_1DB3A948C(int a1)
{
  uint64_t v1;
  void *v2;
  uint64_t ObjCClassFromMetadata;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (a1 == 6)
  {
    v2 = *(void **)(*(_QWORD *)(v1
                              + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl)
                  + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView);
    type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v4 = (void *)objc_opt_self();
    v5 = v2;
    v6 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
    v7 = sub_1DB3BBC8C();
    v9 = v8;

    v10 = sub_1DB3A7888();
    sub_1DB3AAAF4(v7, v9, v10);

  }
  else
  {
    type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
    v11 = swift_getObjCClassFromMetadata();
    v12 = (void *)objc_opt_self();
    v13 = objc_msgSend(v12, sel_bundleForClass_, v11);
    v14 = sub_1DB3BBC8C();
    v16 = v15;

    v17 = objc_msgSend(v12, sel_bundleForClass_, v11, 0xE000000000000000);
    v18 = sub_1DB3BBC8C();
    v20 = v19;

    sub_1DB3A8BB4(v14, v16, v18, v20, 0, 0, 0);
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DB3A96C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  void *v3;
  id v4;
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

  v1 = v0;
  type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  v5 = sub_1DB3BBC8C();
  v7 = v6;

  v9 = (*(uint64_t (**)(uint64_t))(v1
                                          + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_budInEarStringBlock))(v8);
  if (v10)
  {
    v11 = v9;
    v12 = v10;
  }
  else
  {
    v13 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
    v11 = sub_1DB3BBC8C();
    v12 = v14;

  }
  sub_1DB3A8BB4(v5, v7, v11, v12, 0, 0, 0);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DB3A9864()
{
  uint64_t ObjCClassFromMetadata;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  type metadata accessor for HPSSpatialProfileSingleStepBottomContainer();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_bundleForClass_, ObjCClassFromMetadata);
  v3 = sub_1DB3BBC8C();
  v5 = v4;

  v6 = objc_msgSend(v1, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v7 = sub_1DB3BBC8C();
  v9 = v8;

  v10 = objc_msgSend(v1, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v11 = sub_1DB3BBC8C();
  v13 = v12;

  sub_1DB3A8BB4(v3, v5, v7, v9, v11, v13, 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1DB3A9A30(void *a1)
{
  void *v1;
  void *v2;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
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

  v2 = v1;
  v4 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DB3C1BA0;
  v6 = objc_msgSend(a1, sel_leadingAnchor);
  v7 = objc_msgSend(v2, sel_leadingAnchor);
  v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

  *(_QWORD *)(v5 + 32) = v8;
  v9 = objc_msgSend(a1, sel_trailingAnchor);
  v10 = objc_msgSend(v2, sel_trailingAnchor);
  v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(_QWORD *)(v5 + 40) = v11;
  v12 = objc_msgSend(a1, sel_topAnchor);
  v13 = objc_msgSend(v2, sel_topAnchor);
  v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

  *(_QWORD *)(v5 + 48) = v14;
  v15 = objc_msgSend(a1, sel_bottomAnchor);
  v16 = objc_msgSend(v2, sel_bottomAnchor);
  v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(_QWORD *)(v5 + 56) = v17;
  sub_1DB3BC3DC();
  sub_1DB38507C(0, (unint64_t *)&qword_1F02DA358);
  v18 = (id)sub_1DB3BC3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_activateConstraints_, v18);

}

void type metadata accessor for HPSSpatialProfileV2EnrollmentStep(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DAD28);
}

id sub_1DB3A9CB0()
{
  id v0;
  id v1;
  id v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v0, sel_setLineBreakMode_, 0);
  objc_msgSend(v0, sel_setNumberOfLines_, 0);
  v1 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x1E0DC4AB8]);
  objc_msgSend(v0, sel_setFont_, v1);

  objc_msgSend(v0, sel_setAdjustsFontForContentSizeCategory_, 1);
  v2 = objc_msgSend((id)objc_opt_self(), sel_systemGrayColor);
  objc_msgSend(v0, sel_setTextColor_, v2);

  objc_msgSend(v0, sel_setTextAlignment_, 1);
  return v0;
}

double sub_1DB3A9E4C()
{
  uint64_t v0;
  void *v1;
  unsigned int v2;
  id v3;
  void *v4;
  int v5;
  double result;

  v1 = *(void **)(v0
                + OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton);
  sub_1DB38507C(0, (unint64_t *)&unk_1F02DAD40);
  v2 = objc_msgSend(v1, sel_isKindOfClass_, swift_getObjCClassFromMetadata());
  v3 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v4 = (void *)sub_1DB3BC31C();
  v5 = MGGetSInt32Answer();

  if (v5 < 0)
  {
    if ((v2 & 1) != 0)
      return 34.0;
    return 24.0;
  }
  if (!v2)
    return 24.0;
  result = 34.0;
  if (v5 == 2)
    return 5.0;
  return result;
}

id sub_1DB3A9F70()
{
  return sub_1DB3853EC(type metadata accessor for HPSSpatialProfileSingleStepBottomContainer.HPSSpatialProfileSingleStepBottomContainerImpl);
}

void sub_1DB3AA04C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1DB3AA0A4()
{
  return sub_1DB3853EC(type metadata accessor for HPSSpatialProfileSingleStepBottomContainer);
}

char *sub_1DB3AA0FC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  char *v4;
  void *v6;
  void *v7;
  id v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  char *result;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  char *v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  objc_super v68;
  _OWORD v69[2];
  id v70[5];

  v70[4] = *(id *)MEMORY[0x1E0C80C00];
  swift_bridgeObjectRelease();
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel] = 0;
  v6 = (void *)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_1DB3BC31C();
  v68.receiver = v4;
  v68.super_class = (Class)type metadata accessor for HPSHeaderView();
  v8 = objc_msgSendSuper2(&v68, sel_initWithTitle_detailText_icon_, v6, v7, a4);

  v9 = (char *)v8;
  v10 = (uint64_t)objc_msgSend(v9, sel_subviews);
  sub_1DB38507C(0, &qword_1F02DA458);
  v11 = sub_1DB3BC3C4();

  v70[0] = (id)MEMORY[0x1E0DEE9D8];
  if ((unint64_t)v11 >> 62)
  {
    if (v11 < 0)
      v10 = v11;
    else
      v10 = v11 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v12 = sub_1DB3BC670();
    swift_bridgeObjectRelease();
    if (v12)
      goto LABEL_3;
LABEL_27:
    swift_bridgeObjectRelease();
    v10 = MEMORY[0x1E0DEE9D8];
    if ((MEMORY[0x1E0DEE9D8] & 0x8000000000000000) != 0)
      goto LABEL_35;
    goto LABEL_28;
  }
  v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v12)
    goto LABEL_27;
LABEL_3:
  if (v12 < 1)
  {
    __break(1u);
    goto LABEL_59;
  }
  for (i = 0; i != v12; ++i)
  {
    if ((v11 & 0xC000000000000001) != 0)
      v14 = (id)MEMORY[0x1DF0AC9FC](i, v11);
    else
      v14 = *(id *)(v11 + 8 * i + 32);
    v15 = v14;
    objc_opt_self();
    v16 = swift_dynamicCastObjCClass();
    if (!v16)
    {

      continue;
    }
    v17 = (void *)v16;
    v18 = v15;
    v19 = objc_msgSend(v17, sel_text);
    if (v19)
    {
      v20 = v19;
      v21 = sub_1DB3BC340();
      v23 = v22;

      if (v21 == 0x64656C6961746564 && v23 == 0xE800000000000000)
      {
        swift_bridgeObjectRelease();

      }
      else
      {
        v25 = sub_1DB3BC6D0();
        swift_bridgeObjectRelease();

        if ((v25 & 1) == 0)
        {

          continue;
        }
      }
      sub_1DB3BC61C();
      sub_1DB3BC640();
      sub_1DB3BC64C();
      sub_1DB3BC628();
    }
    else
    {

    }
  }
  swift_bridgeObjectRelease();
  v10 = (uint64_t)v70[0];
  if (((unint64_t)v70[0] & 0x8000000000000000) != 0)
  {
LABEL_35:
    swift_bridgeObjectRetain();
    v29 = sub_1DB3BC670();
    swift_release();
    if (!v29)
      goto LABEL_36;
LABEL_30:
    if ((v10 & 0xC000000000000001) == 0)
    {
      if (!*(_QWORD *)(v10 + 16))
        __break(1u);
      v26 = *(id *)(v10 + 32);
LABEL_33:
      v27 = v26;
      swift_release();
      objc_opt_self();
      v28 = swift_dynamicCastObjCClass();
      if (!v28)
      {

        goto LABEL_37;
      }
      goto LABEL_38;
    }
LABEL_59:
    v26 = (id)MEMORY[0x1DF0AC9FC](0, v10);
    goto LABEL_33;
  }
LABEL_28:
  if ((v10 & 0x4000000000000000) != 0)
    goto LABEL_35;
  if (*(_QWORD *)(v10 + 16))
    goto LABEL_30;
LABEL_36:
  swift_release();
LABEL_37:
  v28 = 0;
LABEL_38:
  v30 = OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel;
  v31 = *(void **)&v9[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel];
  *(_QWORD *)&v9[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel] = v28;

  v32 = (void *)objc_opt_self();
  v70[0] = *(id *)&v9[v30];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAD30);
  v33 = sub_1DB3BC574();
  v70[0] = 0;
  v34 = objc_msgSend(v32, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v33, 0, v70);
  swift_unknownObjectRelease();
  v35 = v70[0];
  if (!v34)
  {
    v42 = v35;
    v43 = (void *)sub_1DB3BBC98();

    swift_willThrow();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4E0);
    v44 = swift_allocObject();
    *(_OWORD *)(v44 + 16) = xmmword_1DB3C1810;
    *(_QWORD *)(v44 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v44 + 32) = 0xD00000000000003ELL;
    *(_QWORD *)(v44 + 40) = 0x80000001DB3CB960;
    sub_1DB3BC700();
    swift_bridgeObjectRelease();

    return v9;
  }
  v36 = sub_1DB3BBCEC();
  v38 = v37;

  v39 = objc_allocWithZone(MEMORY[0x1E0CB3710]);
  sub_1DB3AC450(v36, v38);
  v40 = sub_1DB3AC394();
  sub_1DB3AC494(v36, v38);
  if (!v40)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4E0);
    v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_1DB3C1810;
    *(_QWORD *)(v41 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v41 + 32) = 0xD00000000000003DLL;
    *(_QWORD *)(v41 + 40) = 0x80000001DB3CB9A0;
    sub_1DB3BC700();
LABEL_41:
    swift_bridgeObjectRelease();

    goto LABEL_42;
  }
  objc_msgSend(v40, sel_setRequiresSecureCoding_, 0);
  if (objc_msgSend(v40, sel_decodeObjectForKey_, *MEMORY[0x1E0CB2CD0]))
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v69, 0, sizeof(v69));
  }
  sub_1DB3872D4((uint64_t)v69, (uint64_t)v70);
  if (!v70[3])
  {
    sub_1DB38E7C8((uint64_t)v70);
    goto LABEL_57;
  }
  sub_1DB38507C(0, &qword_1F02DAD38);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_57:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4E0);
    v63 = swift_allocObject();
    *(_OWORD *)(v63 + 16) = xmmword_1DB3C1810;
    *(_QWORD *)(v63 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v63 + 32) = 0xD000000000000049;
    *(_QWORD *)(v63 + 40) = 0x80000001DB3CB9E0;
    sub_1DB3BC700();

    goto LABEL_41;
  }
  v66 = a4;
  v46 = *(void **)&v9[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel];
  *(_QWORD *)&v9[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel] = v67;
  v47 = v67;

  objc_msgSend(v47, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v47, sel_setAlpha_, 0.0);
  objc_msgSend(v9, sel_addSubview_, v47);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
  v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_1DB3C1BA0;
  v65 = v47;
  v49 = objc_msgSend(v47, sel_leadingAnchor);
  result = *(char **)&v9[v30];
  if (!result)
  {
    __break(1u);
    goto LABEL_62;
  }
  v50 = objc_msgSend(result, sel_leadingAnchor);
  v51 = objc_msgSend(v49, sel_constraintEqualToAnchor_, v50);

  *(_QWORD *)(v48 + 32) = v51;
  v52 = objc_msgSend(v65, sel_trailingAnchor);
  result = *(char **)&v9[v30];
  if (!result)
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  v53 = objc_msgSend(result, sel_trailingAnchor);
  v54 = objc_msgSend(v52, sel_constraintEqualToAnchor_, v53);

  *(_QWORD *)(v48 + 40) = v54;
  v55 = objc_msgSend(v65, sel_topAnchor);
  result = *(char **)&v9[v30];
  if (!result)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  v56 = objc_msgSend(result, sel_topAnchor);
  v57 = objc_msgSend(v55, sel_constraintEqualToAnchor_, v56);

  *(_QWORD *)(v48 + 48) = v57;
  result = (char *)objc_msgSend(v65, sel_bottomAnchor);
  v58 = *(void **)&v9[v30];
  if (!v58)
  {
LABEL_64:
    __break(1u);
    return result;
  }
  v59 = result;
  v64 = (id)objc_opt_self();
  v60 = objc_msgSend(v58, sel_bottomAnchor);
  v61 = objc_msgSend(v59, sel_constraintEqualToAnchor_, v60);

  *(_QWORD *)(v48 + 56) = v61;
  v70[0] = (id)v48;
  sub_1DB3BC3DC();
  sub_1DB38507C(0, (unint64_t *)&qword_1F02DA358);
  v62 = (void *)sub_1DB3BC3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v64, sel_activateConstraints_, v62);

LABEL_42:
  sub_1DB3AC494(v36, v38);
  return v9;
}

void sub_1DB3AAAF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  char *v20;
  uint64_t v21;
  void *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void (*v28)();
  uint64_t v29;

  v5 = OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel;
  v6 = *(void **)&v3[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel];
  if (v6)
  {
    v7 = v6;
    v8 = (void *)sub_1DB3BC31C();
    objc_msgSend(v7, sel_setText_, v8);

    v9 = *(void **)&v3[v5];
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v3, sel_bounds);
      v12 = -0.5;
      if (!a3)
        v12 = 0.5;
      v13 = v11 * v12;
      objc_msgSend(v10, sel_frame);
      objc_msgSend(v10, sel_setFrame_, v13);

      v14 = *(void **)&v3[v5];
      if (v14)
      {
        objc_msgSend(v14, sel_setAlpha_, 0.0);
        v15 = *(void **)&v3[v5];
        if (v15)
          objc_msgSend(v15, sel_layoutIfNeeded);
      }
    }
  }
  v16 = (void *)objc_opt_self();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v3;
  *(_QWORD *)(v17 + 24) = a3;
  v28 = sub_1DB3AC0F0;
  v29 = v17;
  v18 = MEMORY[0x1E0C809B0];
  v24 = MEMORY[0x1E0C809B0];
  v25 = 1107296256;
  v26 = sub_1DB399E28;
  v27 = &block_descriptor_2;
  v19 = _Block_copy(&v24);
  v20 = v3;
  swift_release();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v20;
  v28 = sub_1DB3AC2F0;
  v29 = v21;
  v24 = v18;
  v25 = 1107296256;
  v26 = sub_1DB3A8B78;
  v27 = &block_descriptor_6;
  v22 = _Block_copy(&v24);
  v23 = v20;
  swift_release();
  objc_msgSend(v16, sel_animateWithDuration_animations_completion_, v19, v22, 0.6);
  _Block_release(v22);
  _Block_release(v19);
}

id sub_1DB3AAD40()
{
  return sub_1DB3853EC(type metadata accessor for HPSHeaderView);
}

_QWORD *sub_1DB3AAD84@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1DB3AAD94(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

char *sub_1DB3AADA0()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  int v64;
  double v65;
  double v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  void *v114;
  uint64_t v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  objc_super v122;

  v1 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView;
  v2 = objc_allocWithZone((Class)type metadata accessor for HPSHeaderView());
  v3 = v0;
  v4 = (void *)sub_1DB3BC31C();
  v5 = objc_msgSend(v2, sel_initWithTitle_detailText_icon_, v4, 0, 0);

  objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v0[v1] = v5;
  v6 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewFirst;
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v3[v6] = v7;
  v8 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_learnMoreView;
  *(_QWORD *)&v3[v8] = sub_1DB3A9CB0();
  v9 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewSecond;
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v3[v9] = v10;
  v11 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTrayEffectView;
  v12 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 6);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F58]), sel_initWithEffect_, v12);

  objc_msgSend(v13, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v13, sel_setAlpha_, 0.0);
  *(_QWORD *)&v3[v11] = v13;
  v14 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton;
  v15 = objc_msgSend((id)objc_opt_self(), sel_boldButton);
  objc_msgSend(v15, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v3[v14] = v15;
  v16 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray;
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v17, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v3[v16] = v17;
  v18 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_stackContainerView;
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3CA8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v19, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v19, sel_setAxis_, 1);
  objc_msgSend(v19, sel_setAlignment_, 3);
  objc_msgSend(v19, sel_setDistribution_, 3);
  *(_QWORD *)&v3[v18] = v19;
  v20 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_scrollView;
  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3C28]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v21, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v3[v20] = v21;

  v122.receiver = v3;
  v122.super_class = (Class)type metadata accessor for HPSSpatialProfileSingleStepBottomContainer.HPSSpatialProfileSingleStepBottomContainerImpl();
  v22 = (char *)objc_msgSendSuper2(&v122, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v22, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v23 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_scrollView;
  v24 = *(void **)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_scrollView];
  objc_msgSend(v22, sel_addSubview_, v24);
  v25 = *(void **)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_stackContainerView];
  v26 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_stackContainerView;
  objc_msgSend(v24, sel_addSubview_, v25);
  v121 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView;
  objc_msgSend(v25, sel_addArrangedSubview_, *(_QWORD *)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView]);
  v119 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewFirst;
  objc_msgSend(v25, sel_addArrangedSubview_, *(_QWORD *)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewFirst]);
  objc_msgSend(v25, sel_addArrangedSubview_, *(_QWORD *)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_learnMoreView]);
  v120 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewSecond;
  objc_msgSend(v25, sel_addArrangedSubview_, *(_QWORD *)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewSecond]);
  v27 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray;
  v28 = *(void **)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray];
  v117 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTrayEffectView;
  objc_msgSend(v28, sel_addSubview_, *(_QWORD *)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTrayEffectView]);
  v116 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton;
  objc_msgSend(v28, sel_addSubview_, *(_QWORD *)&v22[OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton]);
  objc_msgSend(v22, sel_addSubview_, v28);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_1DB3C2780;
  v30 = objc_msgSend(v24, sel_leadingAnchor);
  v31 = objc_msgSend(v22, (SEL)&selRef_date + 6);
  v32 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v31);

  *(_QWORD *)(v29 + 32) = v32;
  v33 = objc_msgSend(*(id *)&v22[v23], sel_trailingAnchor);
  v34 = objc_msgSend(v22, (SEL)&selRef_setSeparatorInset_);
  v35 = objc_msgSend(v33, (SEL)&selRef_reloadSpecifiers + 6, v34);

  *(_QWORD *)(v29 + 40) = v35;
  v36 = objc_msgSend(*(id *)&v22[v23], sel_topAnchor);
  v37 = objc_msgSend(v22, (SEL)&selRef_setTextAlignment_ + 4);
  v38 = objc_msgSend(v36, (SEL)&selRef_reloadSpecifiers + 6, v37);

  *(_QWORD *)(v29 + 48) = v38;
  v39 = objc_msgSend(*(id *)&v22[v23], sel_bottomAnchor);
  v40 = objc_msgSend(*(id *)&v22[v27], (SEL)&selRef_setTextAlignment_ + 4);
  v41 = objc_msgSend(v39, (SEL)&selRef_reloadSpecifiers + 6, v40);

  *(_QWORD *)(v29 + 56) = v41;
  v42 = objc_msgSend(*(id *)&v22[v26], sel_leadingAnchor);
  v43 = objc_msgSend(v22, sel_leadingAnchor);
  v44 = objc_msgSend(v42, sel_constraintEqualToAnchor_constant_, v43, 24.0);

  *(_QWORD *)(v29 + 64) = v44;
  v45 = objc_msgSend(*(id *)&v22[v26], sel_trailingAnchor);
  v46 = objc_msgSend(v22, sel_trailingAnchor);
  v47 = objc_msgSend(v45, sel_constraintEqualToAnchor_constant_, v46, -24.0);

  *(_QWORD *)(v29 + 72) = v47;
  v48 = objc_msgSend(*(id *)&v22[v26], (SEL)&selRef_setTextAlignment_ + 4);
  v49 = objc_msgSend(*(id *)&v22[v23], (SEL)&selRef_setTextAlignment_ + 4);
  v50 = objc_msgSend(v48, sel_constraintEqualToAnchor_constant_, v49, 24.0);

  *(_QWORD *)(v29 + 80) = v50;
  v51 = objc_msgSend(*(id *)&v22[v26], sel_bottomAnchor);
  v52 = objc_msgSend(*(id *)&v22[v23], sel_bottomAnchor);
  v53 = objc_msgSend(v51, sel_constraintEqualToAnchor_, v52);

  *(_QWORD *)(v29 + 88) = v53;
  v54 = objc_msgSend(*(id *)&v22[v116], sel_leadingAnchor);
  v55 = objc_msgSend(*(id *)&v22[v27], sel_leadingAnchor);
  v56 = objc_msgSend(v54, sel_constraintEqualToAnchor_constant_, v55, 24.0);

  *(_QWORD *)(v29 + 96) = v56;
  v57 = objc_msgSend(*(id *)&v22[v116], sel_trailingAnchor);
  v58 = objc_msgSend(*(id *)&v22[v27], sel_trailingAnchor);
  v59 = objc_msgSend(v57, sel_constraintEqualToAnchor_constant_, v58, -24.0);

  *(_QWORD *)(v29 + 104) = v59;
  v60 = objc_msgSend(*(id *)&v22[v116], (SEL)&off_1EA2B1388 + 5);
  v61 = objc_msgSend(*(id *)&v22[v27], (SEL)&off_1EA2B1388 + 5);
  v62 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v63 = (void *)sub_1DB3BC31C();
  v64 = MGGetSInt32Answer();

  if (v64 == 2)
    v65 = 89.0;
  else
    v65 = 60.0;
  v118 = (id)objc_opt_self();
  if (v64 >= 0)
    v66 = v65;
  else
    v66 = 60.0;
  v67 = objc_msgSend(v60, sel_constraintEqualToAnchor_constant_, v61, -v66);

  *(_QWORD *)(v29 + 112) = v67;
  v68 = objc_msgSend(*(id *)&v22[v117], sel_topAnchor);
  v69 = objc_msgSend(*(id *)&v22[v27], sel_topAnchor);
  v70 = objc_msgSend(v68, sel_constraintEqualToAnchor_, v69);

  *(_QWORD *)(v29 + 120) = v70;
  v71 = objc_msgSend(*(id *)&v22[v117], sel_topAnchor);
  v72 = objc_msgSend(*(id *)&v22[v116], sel_topAnchor);
  v73 = objc_msgSend(v71, sel_constraintEqualToAnchor_constant_, v72, -sub_1DB3A9E4C());

  *(_QWORD *)(v29 + 128) = v73;
  v74 = objc_msgSend(*(id *)&v22[v117], sel_trailingAnchor);
  v75 = objc_msgSend(*(id *)&v22[v27], sel_trailingAnchor);
  v76 = objc_msgSend(v74, sel_constraintEqualToAnchor_, v75);

  *(_QWORD *)(v29 + 136) = v76;
  v77 = objc_msgSend(*(id *)&v22[v117], sel_leadingAnchor);
  v78 = objc_msgSend(*(id *)&v22[v27], sel_leadingAnchor);
  v79 = objc_msgSend(v77, sel_constraintEqualToAnchor_, v78);

  *(_QWORD *)(v29 + 144) = v79;
  v80 = objc_msgSend(*(id *)&v22[v117], sel_bottomAnchor);
  v81 = objc_msgSend(*(id *)&v22[v27], sel_bottomAnchor);
  v82 = objc_msgSend(v80, sel_constraintEqualToAnchor_, v81);

  *(_QWORD *)(v29 + 152) = v82;
  v83 = objc_msgSend(*(id *)&v22[v119], sel_leadingAnchor);
  v84 = objc_msgSend(*(id *)&v22[v26], sel_leadingAnchor);
  v85 = objc_msgSend(v83, (SEL)&selRef_reloadSpecifiers + 6, v84);

  *(_QWORD *)(v29 + 160) = v85;
  v86 = objc_msgSend(*(id *)&v22[v119], sel_trailingAnchor);
  v87 = objc_msgSend(*(id *)&v22[v26], sel_trailingAnchor);
  v88 = objc_msgSend(v86, (SEL)&selRef_reloadSpecifiers + 6, v87);

  *(_QWORD *)(v29 + 168) = v88;
  v89 = objc_msgSend(*(id *)&v22[v119], sel_heightAnchor);
  v90 = objc_msgSend(v89, sel_constraintEqualToConstant_, 24.0);

  *(_QWORD *)(v29 + 176) = v90;
  v91 = objc_msgSend(*(id *)&v22[v120], sel_leadingAnchor);
  v92 = objc_msgSend(*(id *)&v22[v26], sel_leadingAnchor);
  v93 = objc_msgSend(v91, (SEL)&selRef_reloadSpecifiers + 6, v92);

  *(_QWORD *)(v29 + 184) = v93;
  v94 = objc_msgSend(*(id *)&v22[v120], sel_trailingAnchor);
  v95 = objc_msgSend(*(id *)&v22[v26], sel_trailingAnchor);
  v96 = objc_msgSend(v94, (SEL)&selRef_reloadSpecifiers + 6, v95);

  *(_QWORD *)(v29 + 192) = v96;
  v97 = objc_msgSend(*(id *)&v22[v120], sel_heightAnchor);
  v98 = objc_msgSend(v97, sel_constraintEqualToConstant_, 24.0);

  *(_QWORD *)(v29 + 200) = v98;
  v99 = objc_msgSend(*(id *)&v22[v121], sel_leadingAnchor);
  v100 = objc_msgSend(*(id *)&v22[v26], sel_leadingAnchor);
  v101 = objc_msgSend(v99, (SEL)&selRef_reloadSpecifiers + 6, v100);

  *(_QWORD *)(v29 + 208) = v101;
  v102 = objc_msgSend(*(id *)&v22[v121], sel_trailingAnchor);
  v103 = objc_msgSend(*(id *)&v22[v26], sel_trailingAnchor);
  v104 = objc_msgSend(v102, (SEL)&selRef_reloadSpecifiers + 6, v103);

  *(_QWORD *)(v29 + 216) = v104;
  v105 = objc_msgSend(*(id *)&v22[v27], sel_leadingAnchor);
  v106 = objc_msgSend(v22, sel_leadingAnchor);
  v107 = objc_msgSend(v105, (SEL)&selRef_reloadSpecifiers + 6, v106);

  *(_QWORD *)(v29 + 224) = v107;
  v108 = objc_msgSend(*(id *)&v22[v27], sel_trailingAnchor);
  v109 = objc_msgSend(v22, sel_trailingAnchor);
  v110 = objc_msgSend(v108, (SEL)&selRef_reloadSpecifiers + 6, v109);

  *(_QWORD *)(v29 + 232) = v110;
  v111 = objc_msgSend(*(id *)&v22[v27], sel_bottomAnchor);
  v112 = objc_msgSend(v22, sel_bottomAnchor);
  v113 = objc_msgSend(v111, (SEL)&selRef_reloadSpecifiers + 6, v112);

  *(_QWORD *)(v29 + 240) = v113;
  sub_1DB3BC3DC();
  sub_1DB38507C(0, (unint64_t *)&qword_1F02DA358);
  v114 = (void *)sub_1DB3BC3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v118, sel_activateConstraints_, v114);

  return v22;
}

void sub_1DB3ABCB0()
{
  char *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;

  v1 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_infoView;
  v2 = objc_allocWithZone((Class)type metadata accessor for HPSHeaderView());
  v3 = (void *)sub_1DB3BC31C();
  v4 = objc_msgSend(v2, sel_initWithTitle_detailText_icon_, v3, 0, 0);

  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v0[v1] = v4;
  v5 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewFirst;
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v0[v5] = v6;
  v7 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_learnMoreView;
  *(_QWORD *)&v0[v7] = sub_1DB3A9CB0();
  v8 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_spacerViewSecond;
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v9, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v0[v8] = v9;
  v10 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTrayEffectView;
  v11 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 6);
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F58]), sel_initWithEffect_, v11);

  objc_msgSend(v12, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v12, sel_setAlpha_, 0.0);
  *(_QWORD *)&v0[v10] = v12;
  v13 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_continueButton;
  v14 = objc_msgSend((id)objc_opt_self(), sel_boldButton);
  objc_msgSend(v14, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v0[v13] = v14;
  v15 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_buttonTray;
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v0[v15] = v16;
  v17 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_stackContainerView;
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3CA8]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v18, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v18, sel_setAxis_, 1);
  objc_msgSend(v18, sel_setAlignment_, 3);
  objc_msgSend(v18, sel_setDistribution_, 3);
  *(_QWORD *)&v0[v17] = v18;
  v19 = OBJC_IVAR____TtCC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainerP33_D51FEB6A68E3E202054F6E29D55400B046HPSSpatialProfileSingleStepBottomContainerImpl_scrollView;
  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3C28]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v20, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(_QWORD *)&v0[v19] = v20;

  sub_1DB3BC664();
  __break(1u);
}

void sub_1DB3ABFBC()
{
  char *v0;
  uint64_t v1;
  objc_class *v2;
  uint64_t v3;
  char *v4;

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  v2 = (objc_class *)type metadata accessor for HPSSpatialProfileSingleStepBottomContainer.HPSSpatialProfileSingleStepBottomContainerImpl();
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(v2), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v3 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  *(_QWORD *)&v0[v3] = objc_msgSend(objc_allocWithZone(v2), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v4 = &v0[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection];
  *(_QWORD *)v4 = 0;
  v4[8] = 1;

  sub_1DB3BC664();
  __break(1u);
}

uint64_t type metadata accessor for HPSHeaderView()
{
  return objc_opt_self();
}

void type metadata accessor for UITraitEnvironmentLayoutDirection(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DAD20);
}

uint64_t sub_1DB3AC0CC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1DB3AC0F0()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char *v18;
  _QWORD v19[6];

  v1 = *(char **)(v0 + 16);
  v2 = OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel;
  v3 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel];
  if (v3)
  {
    v4 = *(_QWORD *)(v0 + 24);
    v5 = v3;
    objc_msgSend(v1, sel_bounds);
    v7 = 0.5;
    if (!v4)
      v7 = -0.5;
    v8 = v7 * v6;
    objc_msgSend(v5, sel_frame);
    objc_msgSend(v5, sel_setFrame_, v8);

    v9 = *(void **)&v1[v2];
    if (v9)
    {
      objc_msgSend(v9, sel_setAlpha_, 0.0);
      v10 = *(void **)&v1[v2];
      if (v10)
        objc_msgSend(v10, sel_layoutIfNeeded);
    }
  }
  v11 = OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel;
  v12 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel];
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v13, sel_frame);
    objc_msgSend(v13, sel_setFrame_, 0.0);

    v14 = *(void **)&v1[v11];
    if (v14)
      objc_msgSend(v14, sel_layoutIfNeeded);
  }
  v15 = (void *)objc_opt_self();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v1;
  v19[4] = sub_1DB3AC33C;
  v19[5] = v16;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 1107296256;
  v19[2] = sub_1DB399E28;
  v19[3] = &block_descriptor_12;
  v17 = _Block_copy(v19);
  v18 = v1;
  swift_release();
  objc_msgSend(v15, sel_animateWithDuration_delay_options_animations_completion_, 0, v17, 0, 0.2, 0.2);
  _Block_release(v17);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_1DB3AC2CC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1DB3AC2F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel);
  v3 = OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel;
  v4 = *(void **)(v1
                + OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_hpsDetailedLabel);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel) = v4;
  v6 = *(id *)(v1 + v3);
  *(_QWORD *)(v1 + v3) = v2;
  v5 = v4;

}

id sub_1DB3AC33C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel;
  result = *(id *)(v1
                 + OBJC_IVAR____TtC16HeadphoneConfigsP33_D51FEB6A68E3E202054F6E29D55400B013HPSHeaderView_offScreenDetailedLabel);
  if (result)
  {
    objc_msgSend(result, sel_setAlpha_, 1.0);
    result = *(id *)(v1 + v2);
    if (result)
      return objc_msgSend(result, sel_layoutIfNeeded);
  }
  return result;
}

id sub_1DB3AC394()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x1E0C80C00];
  v1 = (void *)sub_1DB3BBCE0();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initForReadingFromData_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_1DB3BBC98();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_1DB3AC450(uint64_t a1, unint64_t a2)
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

uint64_t sub_1DB3AC494(uint64_t a1, unint64_t a2)
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

uint64_t sub_1DB3AC4D8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1DB3AC4FC()
{
  uint64_t v0;

  return sub_1DB3A7C00(*(_QWORD *)(v0 + 16));
}

void sub_1DB3AC508()
{
  _QWORD *v0;
  void *v1;
  char *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  char *v20;
  _QWORD v21[6];

  v2 = (char *)v0[2];
  v1 = (void *)v0[3];
  v3 = (void *)v0[4];
  v4 = *(id *)&v2[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl];
  v5 = v1;
  v6 = sub_1DB3A7888();
  objc_msgSend(v2, sel_bounds);
  if (v6)
    v8 = 0.5;
  else
    v8 = -0.5;
  v9 = v8 * v7;
  objc_msgSend(v4, sel_frame);
  objc_msgSend(v4, sel_setFrame_, v9);
  objc_msgSend(v4, sel_setAlpha_, 0.0);
  objc_msgSend(v4, sel_layoutIfNeeded);

  if (*(_QWORD *)&v2[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection])
    v10 = 0.5;
  else
    v10 = -0.5;
  v11 = v5;
  objc_msgSend(v2, sel_bounds);
  v13 = v10 * v12;
  objc_msgSend(v11, sel_frame);
  objc_msgSend(v11, sel_setFrame_, v13);
  objc_msgSend(v11, sel_setAlpha_, 0.0);
  objc_msgSend(v11, sel_layoutIfNeeded);

  objc_msgSend(v3, sel_frame);
  objc_msgSend(v3, sel_setFrame_, 0.0);
  objc_msgSend(v3, sel_layoutIfNeeded);
  v14 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  v15 = *(id *)&v2[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl];
  objc_msgSend(v15, sel_frame);
  objc_msgSend(v15, sel_setFrame_, 0.0);

  objc_msgSend(*(id *)&v2[v14], sel_layoutIfNeeded);
  v16 = (void *)objc_opt_self();
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v3;
  *(_QWORD *)(v17 + 24) = v2;
  v21[4] = sub_1DB3AC878;
  v21[5] = v17;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 1107296256;
  v21[2] = sub_1DB399E28;
  v21[3] = &block_descriptor_40;
  v18 = _Block_copy(v21);
  v19 = v3;
  v20 = v2;
  swift_release();
  objc_msgSend(v16, sel_animateWithDuration_delay_options_animations_completion_, 0, v18, 0, 0.2, 0.2);
  _Block_release(v18);
}

void sub_1DB3AC784()
{
  uint64_t v0;
  void (*v1)(void);
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v1 = *(void (**)(void))(v0 + 16);
  v2 = *(_QWORD **)(v0 + 32);
  if (v1)
    v1();
  v3 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v4 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xB0))();
  objc_msgSend(v4, sel_removeFromSuperview);

  v5 = (void *)(*(uint64_t (**)(void))((*v3 & *v2) + 0xB8))();
  objc_msgSend(v5, sel_removeFromSuperview);

  v6 = *(_QWORD *)((char *)v2
                 + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl);
  v7 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  v8 = *(void **)((char *)v2
                + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl);
  *(_QWORD *)((char *)v2
            + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl) = v8;
  v10 = *(id *)((char *)v2 + v7);
  *(_QWORD *)((char *)v2 + v7) = v6;
  v9 = v8;

}

uint64_t sub_1DB3AC84C()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1DB3AC878()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  objc_msgSend(v1, sel_setAlpha_, 1.0);
  objc_msgSend(v1, sel_layoutIfNeeded);
  v3 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  objc_msgSend(*(id *)(v2+ OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl), sel_setAlpha_, 1.0);
  return objc_msgSend(*(id *)(v2 + v3), sel_layoutIfNeeded);
}

uint64_t objectdestroy_24Tm()
{
  id *v0;

  return swift_deallocObject();
}

void sub_1DB3AC918()
{
  _QWORD *v0;
  char *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;
  void *v11;
  double v12;
  uint64_t v13;
  id v14;
  double v15;
  double v16;
  double v17;
  char v18;
  id v19;
  void *v20;
  double v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char *v27;
  id v28;
  void *v29;
  _QWORD aBlock[6];

  v1 = (char *)v0[2];
  v2 = (void *)v0[3];
  v29 = (void *)v0[4];
  v3 = *(id *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl];
  v4 = v2;
  v5 = sub_1DB3A7888();
  objc_msgSend(v1, sel_bounds);
  v7 = 0.5;
  if (!v5)
    v7 = -0.5;
  v8 = v7 * v6;
  sub_1DB38507C(0, &qword_1F02DA458);
  v9 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer____lazy_storage___layoutDirection;
  objc_msgSend(v3, sel_frame);
  objc_msgSend(v3, sel_setFrame_, v8);
  if ((sub_1DB3BC508() & 1) != 0)
  {
    objc_msgSend(v4, sel_setAlpha_, 0.0);
    v10 = objc_msgSend(v4, sel_playerLayer);
    v11 = v10;
    if (*(_QWORD *)&v1[v9])
      v12 = 100.0;
    else
      v12 = -100.0;
    objc_msgSend(v10, sel_frame);
    objc_msgSend(v11, sel_setFrame_, v12);

  }
  else
  {
    objc_msgSend(v3, sel_setAlpha_, 0.0);
  }
  objc_msgSend(v3, sel_layoutIfNeeded);

  v13 = *(_QWORD *)&v1[v9];
  v14 = v4;
  objc_msgSend(v1, sel_bounds);
  v16 = 0.5;
  if (!v13)
    v16 = -0.5;
  v17 = v16 * v15;
  objc_msgSend(v14, sel_frame);
  objc_msgSend(v14, sel_setFrame_, v17);
  v18 = sub_1DB3BC508();
  objc_msgSend(v14, sel_setAlpha_, 0.0);
  if ((v18 & 1) != 0)
  {
    v19 = objc_msgSend(v14, (SEL)&selRef_requestResultDataAtOffset_forLength_withCompletion_);
    v20 = v19;
    if (*(_QWORD *)&v1[v9])
      v21 = 100.0;
    else
      v21 = -100.0;
    objc_msgSend(v19, sel_frame);
    objc_msgSend(v20, sel_setFrame_, v21);

  }
  objc_msgSend(v14, sel_layoutIfNeeded);

  v22 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  v23 = *(id *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl];
  objc_msgSend(v23, sel_frame);
  objc_msgSend(v23, sel_setFrame_, 0.0);

  objc_msgSend(*(id *)&v1[v22], sel_layoutIfNeeded);
  v24 = (void *)objc_opt_self();
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = v1;
  *(_QWORD *)(v25 + 24) = v29;
  aBlock[4] = sub_1DB3ACD10;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DB399E28;
  aBlock[3] = &block_descriptor_58;
  v26 = _Block_copy(aBlock);
  v27 = v1;
  v28 = v29;
  swift_release();
  objc_msgSend(v24, sel_animateWithDuration_delay_options_animations_completion_, 0, v26, 0, 0.2, 0.2);
  _Block_release(v26);
}

uint64_t objectdestroy_30Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();

  return swift_deallocObject();
}

void sub_1DB3ACCAC()
{
  uint64_t v0;
  void (*v1)(void);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v1 = *(void (**)(void))(v0 + 16);
  v2 = *(_QWORD *)(v0 + 32);
  if (v1)
    v1();
  v3 = *(_QWORD *)(v2
                 + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl);
  v4 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  v5 = *(void **)(v2 + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl);
  *(_QWORD *)(v2
            + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl) = v5;
  v7 = *(id *)(v2 + v4);
  *(_QWORD *)(v2 + v4) = v3;
  v6 = v5;

}

uint64_t sub_1DB3ACD10()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  BOOL v11;
  uint64_t v12;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(void **)(v0 + 24);
  v3 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  objc_msgSend(*(id *)(v2+ OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl), sel_setAlpha_, 1.0);
  objc_msgSend(*(id *)(v2 + v3), sel_layoutIfNeeded);
  v4 = objc_msgSend(v1, sel_subviews);
  sub_1DB38507C(0, &qword_1F02DA458);
  v5 = sub_1DB3BC3C4();

  if (v5 >> 62)
    goto LABEL_13;
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_1DB3BC670())
  {
    v7 = 4;
    v8 = 0;
    if ((v5 & 0xC000000000000001) != 0)
    {
LABEL_4:
      v9 = (id)MEMORY[0x1DF0AC9FC](v8, v5);
      goto LABEL_6;
    }
    while (1)
    {
      v9 = *(id *)(v5 + 8 * v7);
LABEL_6:
      v10 = v9;
      v11 = __OFADD__(v8, 1);
      v12 = v8 + 1;
      if (v11)
        break;
      objc_opt_self();
      if (!swift_dynamicCastObjCClass())
        objc_msgSend(v10, sel_setAlpha_, 1.0);

      if (v12 == v6)
        return swift_bridgeObjectRelease_n();
      v8 = ++v7 - 4;
      if ((v5 & 0xC000000000000001) != 0)
        goto LABEL_4;
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRelease_n();
}

void sub_1DB3ACE84()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  _QWORD v14[6];

  v1 = *(char **)(v0 + 16);
  v2 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  v3 = *(id *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl];
  v4 = sub_1DB3A7888();
  objc_msgSend(v1, sel_bounds);
  v6 = 0.5;
  if (!v4)
    v6 = -0.5;
  v7 = v6 * v5;
  objc_msgSend(v3, sel_frame);
  objc_msgSend(v3, sel_setFrame_, v7);

  objc_msgSend(*(id *)&v1[v2], sel_setAlpha_, 0.0);
  objc_msgSend(*(id *)&v1[v2], sel_layoutIfNeeded);
  v8 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  v9 = *(id *)&v1[OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl];
  objc_msgSend(v9, sel_frame);
  objc_msgSend(v9, sel_setFrame_, 0.0);

  objc_msgSend(*(id *)&v1[v8], sel_layoutIfNeeded);
  v10 = (void *)objc_opt_self();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v1;
  v14[4] = sub_1DB3AD080;
  v14[5] = v11;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 1107296256;
  v14[2] = sub_1DB399E28;
  v14[3] = &block_descriptor_76;
  v12 = _Block_copy(v14);
  v13 = v1;
  swift_release();
  objc_msgSend(v10, sel_animateWithDuration_delay_options_animations_completion_, 0, v12, 0, 0.2, 0.2);
  _Block_release(v12);
}

void sub_1DB3AD034()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl);
  v3 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl;
  v4 = *(void **)(v1 + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_bottomContainerImpl);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl) = v4;
  v6 = *(id *)(v1 + v3);
  *(_QWORD *)(v1 + v3) = v2;
  v5 = v4;

}

id sub_1DB3AD080()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl;
  objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC16HeadphoneConfigs42HPSSpatialProfileSingleStepBottomContainer_offscreenBottomContainerImpl), sel_setAlpha_, 1.0);
  return objc_msgSend(*(id *)(v1 + v2), sel_layoutIfNeeded);
}

uint64_t sub_1DB3AD138()
{
  uint64_t v0;

  v0 = sub_1DB3BC0DC();
  __swift_allocate_value_buffer(v0, qword_1F02DB148);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB148);
  return sub_1DB3BC0D0();
}

uint64_t sub_1DB3AD1B8()
{
  uint64_t v0;

  if (qword_1F02DE260 != -1)
    swift_once();
  v0 = sub_1DB3BC0DC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1F02DB148);
}

uint64_t sub_1DB3AD200@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F02DE260 != -1)
    swift_once();
  v2 = sub_1DB3BC0DC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02DB148);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

void sub_1DB3AD270()
{
  char *v0;
  char *v1;
  id v2;
  char *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t inited;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  void **v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  char *v49;
  id v50;
  _OWORD v51[2];
  _OWORD v52[2];

  v1 = v0;
  v2 = objc_msgSend(v0, sel_text);
  if (v2)
  {

    v3 = &v0[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_linkRange];
    if (*(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_linkRange
                      + 8])
    {
      v4 = (void *)objc_opt_self();
      v5 = objc_msgSend(v4, sel_appearance);
      v6 = objc_msgSend(v5, sel_altTextColor);

      v50 = v6;
      if (!v6)
        v50 = (id)PreferencesTableViewFooterColor();
      v7 = objc_msgSend(v4, sel_appearance);
      v8 = objc_msgSend(v7, sel_footerHyperlinkColor);

      if (!v8)
        v8 = objc_msgSend((id)objc_opt_self(), sel_systemBlueColor);
      v9 = *(void **)&v1[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier];
      v10 = *MEMORY[0x1E0D80838];
      if (objc_msgSend(v9, sel_propertyForKey_, *MEMORY[0x1E0D80838]))
      {
        v48 = v8;
        v49 = v3;
        sub_1DB3BC5B0();
        swift_unknownObjectRelease();
        sub_1DB385AA8(v51, v52);
        swift_dynamicCast();
        v11 = (void *)sub_1DB3BC31C();
        swift_bridgeObjectRelease();
        v47 = objc_msgSend(v11, sel_length);

        if (objc_msgSend(v9, sel_propertyForKey_, v10))
        {
          sub_1DB3BC5B0();
          swift_unknownObjectRelease();
          sub_1DB385AA8(v51, v52);
          swift_dynamicCast();
          v12 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
          v13 = (void *)sub_1DB3BC31C();
          swift_bridgeObjectRelease();
          v14 = objc_msgSend(v12, sel_initWithString_, v13);

          __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAE70);
          inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_1DB3C16B0;
          v16 = (void *)*MEMORY[0x1E0DC1140];
          *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1140];
          v17 = v14;
          v18 = v16;
          v19 = objc_msgSend(v1, sel__accessibilityHigherContrastTintColorForColor_, v50);
          v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAE78);
          *(_QWORD *)(inited + 40) = v19;
          v21 = (void *)*MEMORY[0x1E0DC1138];
          *(_QWORD *)(inited + 64) = v20;
          *(_QWORD *)(inited + 72) = v21;
          v22 = v21;
          v23 = v1;
          v24 = (id)PreferencesTableViewFooterFont();
          v25 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAE80);
          *(_QWORD *)(inited + 104) = v25;
          *(_QWORD *)(inited + 80) = v24;
          sub_1DB384594(inited);
          type metadata accessor for Key(0);
          sub_1DB3B0100(&qword_1F02DA328, (uint64_t)&unk_1DB3C1B00);
          v26 = (void *)sub_1DB3BC2EC();
          swift_bridgeObjectRelease();
          objc_msgSend(v17, sel_addAttributes_range_, v26, 0, v47);

          v27 = swift_initStackObject();
          *(_OWORD *)(v27 + 16) = xmmword_1DB3C2920;
          *(_QWORD *)(v27 + 32) = v18;
          v28 = v18;
          *(_QWORD *)(v27 + 40) = objc_msgSend(v23, sel__accessibilityHigherContrastTintColorForColor_, v48);
          *(_QWORD *)(v27 + 64) = v20;
          *(_QWORD *)(v27 + 72) = v22;
          v29 = v22;
          v30 = (id)PreferencesTableViewFooterFont();
          v31 = (void **)MEMORY[0x1E0DC1160];
          *(_QWORD *)(v27 + 80) = v30;
          v32 = *v31;
          *(_QWORD *)(v27 + 104) = v25;
          *(_QWORD *)(v27 + 112) = v32;
          v33 = objc_allocWithZone(MEMORY[0x1E0C99E98]);
          v34 = v32;
          v35 = (void *)sub_1DB3BC31C();
          v36 = objc_msgSend(v33, sel_initWithString_, v35);

          v37 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAE90);
          *(_QWORD *)(v27 + 120) = v36;
          v38 = (void *)*MEMORY[0x1E0DC1248];
          *(_QWORD *)(v27 + 144) = v37;
          *(_QWORD *)(v27 + 152) = v38;
          v39 = sub_1DB38507C(0, (unint64_t *)&qword_1F02DA6B0);
          v40 = v38;
          v41 = sub_1DB3BC4FC();
          *(_QWORD *)(v27 + 184) = v39;
          *(_QWORD *)(v27 + 160) = v41;
          sub_1DB384594(v27);
          v42 = (void *)sub_1DB3BC2EC();
          swift_bridgeObjectRelease();
          objc_msgSend(v17, sel_addAttributes_range_, v42, *(_QWORD *)v49, *((_QWORD *)v49 + 1));

          v43 = swift_initStackObject();
          *(_OWORD *)(v43 + 16) = xmmword_1DB3C1810;
          *(_QWORD *)(v43 + 32) = v28;
          v44 = v28;
          v45 = objc_msgSend(v23, sel__accessibilityHigherContrastTintColorForColor_, v48);
          *(_QWORD *)(v43 + 64) = v20;
          *(_QWORD *)(v43 + 40) = v45;
          sub_1DB384594(v43);
          v46 = (void *)sub_1DB3BC2EC();
          swift_bridgeObjectRelease();
          objc_msgSend(v23, sel_setLinkTextAttributes_, v46);

          objc_msgSend(v23, sel_setAttributedText_, v17);
          return;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
    }
  }
}

id sub_1DB3AD834()
{
  return sub_1DB3ADA84(MEMORY[0x1E0D80838]);
}

id sub_1DB3AD840()
{
  uint64_t v0;
  id result;
  id v2;
  __int128 v3;
  _OWORD v4[2];
  id v5;
  __int128 v6;
  __int128 v7;

  result = objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier), sel_propertyForKey_, *MEMORY[0x1E0D80830]);
  if (result)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
    sub_1DB385AA8(&v6, &v7);
    sub_1DB38507C(0, &qword_1F02DAE68);
    swift_dynamicCast();
    v2 = objc_msgSend(v5, sel_nonretainedObjectValue);

    if (v2)
    {
      sub_1DB3BC5B0();
      swift_unknownObjectRelease();
      sub_1DB385AA8(&v3, v4);
    }
    else
    {
      memset(v4, 0, sizeof(v4));
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD60);
    if (swift_dynamicCast())
      return (id)v3;
    else
      return 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1DB3AD9DC()
{
  uint64_t v0;
  id result;
  uint64_t v2;
  __int128 v3;
  __int128 v4;

  result = objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier), sel_propertyForKey_, *MEMORY[0x1E0D80820]);
  if (result)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
    sub_1DB385AA8(&v3, &v4);
    swift_dynamicCast();
    return (id)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1DB3ADA78()
{
  return sub_1DB3ADA84(MEMORY[0x1E0D80828]);
}

id sub_1DB3ADA84(_QWORD *a1)
{
  uint64_t v1;
  id result;
  uint64_t v3;
  __int128 v4;
  __int128 v5;

  result = objc_msgSend(*(id *)(v1+ OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier), sel_propertyForKey_, *a1);
  if (result)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
    sub_1DB385AA8(&v4, &v5);
    swift_dynamicCast();
    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1DB3ADD94()
{
  return sub_1DB3853EC(type metadata accessor for MultiLinkableTextView);
}

void *sub_1DB3ADDB0()
{
  return &unk_1EA29D3F8;
}

unint64_t sub_1DB3ADDBC()
{
  return 0xD000000000000014;
}

void *sub_1DB3ADE04()
{
  return &unk_1EA29D408;
}

unint64_t sub_1DB3ADE10()
{
  return 0xD000000000000014;
}

void *sub_1DB3ADE58()
{
  return &unk_1EA29D418;
}

unint64_t sub_1DB3ADE64()
{
  return 0xD000000000000014;
}

void *sub_1DB3ADEAC()
{
  return &unk_1EA29D428;
}

unint64_t sub_1DB3ADEB8()
{
  return 0xD000000000000013;
}

void *sub_1DB3ADF00()
{
  return &unk_1EA29D438;
}

unint64_t sub_1DB3ADF0C()
{
  return 0xD000000000000014;
}

uint64_t variable initialization expression of MultiLinkableFooterView.heightConstraints()
{
  return MEMORY[0x1E0DEE9D8];
}

id sub_1DB3ADF60()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  objc_class *v14;
  char *v15;
  id v16;
  char *v17;
  id v18;
  id v19;
  void *v20;
  char *v21;
  id v22;
  id v23;
  double v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  NSString *v29;
  NSRange v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  _OWORD v50[2];
  objc_super v51[2];
  objc_super v52;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container);
  if (v1)
  {
    v2 = *(id *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container);
LABEL_14:
    v41 = v1;
    return v2;
  }
  v42 = OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3CA8]), sel_init);
  objc_msgSend(v3, sel_setAlignment_, 1);
  objc_msgSend(v3, sel_setAxis_, 1);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v43 = v0;
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView_backingStore);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain_n();
    result = (id)sub_1DB3BC670();
    v5 = (uint64_t)result;
    if (result)
      goto LABEL_5;
LABEL_13:
    swift_bridgeObjectRelease_n();
    objc_msgSend(v3, sel_setSpacing_, 5.0);
    v40 = *(void **)(v43 + v42);
    *(_QWORD *)(v43 + v42) = v3;
    v2 = v3;

    v1 = 0;
    goto LABEL_14;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = (id)swift_bridgeObjectRetain_n();
  if (!v5)
    goto LABEL_13;
LABEL_5:
  if (v5 < 1)
  {
    __break(1u);
  }
  else
  {
    v7 = 0;
    v48 = v4 & 0xC000000000000001;
    v8 = *MEMORY[0x1E0DC49E8];
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v10 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v46 = *MEMORY[0x1E0D80828];
    v47 = *MEMORY[0x1E0D80838];
    v44 = v5;
    v45 = v4;
    while (1)
    {
      v12 = v48 ? (id)MEMORY[0x1DF0AC9FC](v7, v4) : *(id *)(v4 + 8 * v7 + 32);
      v13 = v12;
      v14 = (objc_class *)type metadata accessor for MultiLinkableTextView();
      v15 = (char *)objc_allocWithZone(v14);
      v16 = v13;
      v17 = &v15[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_linkRange];
      *(_QWORD *)v17 = 0;
      *((_QWORD *)v17 + 1) = 0;
      *(_QWORD *)&v15[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier] = v16;
      v52.receiver = v15;
      v52.super_class = v14;
      v18 = v16;
      v19 = objc_msgSendSuper2(&v52, sel_initWithFrame_textContainer_, 0, 0.0, 0.0, 0.0, 0.0);
      objc_msgSend(v19, sel_setDelegate_, v19);
      objc_msgSend(v19, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      v20 = (void *)objc_opt_self();
      v21 = (char *)v19;
      v22 = objc_msgSend(v20, sel_clearColor);
      objc_msgSend(v21, sel_setBackgroundColor_, v22);

      objc_msgSend(v21, sel_setShowsVerticalScrollIndicator_, 0);
      objc_msgSend(v21, sel_setSelectable_, 1);
      objc_msgSend(v21, sel_setEditable_, 0);
      v23 = objc_msgSend(v21, sel_textContainer);
      objc_msgSend(v23, sel_setLineFragmentPadding_, 0.0);

      objc_msgSend(v21, sel_setTextContainerInset_, v8, v9, v10, v11);
      objc_msgSend(v21, sel_setScrollEnabled_, 0);
      LODWORD(v24) = 1148846080;
      objc_msgSend(v21, sel_setContentCompressionResistancePriority_forAxis_, 1, v24);
      objc_msgSend(v21, sel__setInteractiveTextSelectionDisabled_, 1);
      v25 = OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier;
      v26 = *(void **)&v21[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_specifier];
      v27 = v18;
      result = objc_msgSend(v26, sel_propertyForKey_, v47);
      if (!result)
        break;
      sub_1DB3BC5B0();
      swift_unknownObjectRelease();
      sub_1DB385AA8(v50, v51);
      swift_dynamicCast();
      v28 = (void *)sub_1DB3BC31C();
      swift_bridgeObjectRelease();
      objc_msgSend(v21, sel_setText_, v28);

      result = objc_msgSend(*(id *)&v21[v25], sel_propertyForKey_, v46);
      if (!result)
        goto LABEL_19;
      sub_1DB3BC5B0();
      swift_unknownObjectRelease();
      sub_1DB385AA8(v50, v51);
      swift_dynamicCast();
      v29 = (NSString *)sub_1DB3BC31C();
      swift_bridgeObjectRelease();
      v30 = NSRangeFromString(v29);

      *(NSRange *)&v21[OBJC_IVAR____TtC16HeadphoneConfigsP33_1D5819C84B8241152B4DC57C84788BF621MultiLinkableTextView_linkRange] = v30;
      sub_1DB3AD270();

      objc_msgSend(v21, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      objc_msgSend(v3, sel_addArrangedSubview_, v21);
      v49 = (id)objc_opt_self();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
      v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_1DB3C2270;
      v32 = objc_msgSend(v3, sel_leadingAnchor);
      v33 = objc_msgSend(v21, sel_leadingAnchor);
      v34 = v7 + 1;
      v35 = objc_msgSend(v32, sel_constraintEqualToAnchor_, v33);

      *(_QWORD *)(v31 + 32) = v35;
      v36 = objc_msgSend(v3, sel_trailingAnchor);
      v37 = objc_msgSend(v21, sel_trailingAnchor);
      v38 = objc_msgSend(v36, sel_constraintEqualToAnchor_, v37);

      *(_QWORD *)(v31 + 40) = v38;
      v7 = v34;
      v51[0].receiver = (id)v31;
      sub_1DB3BC3DC();
      sub_1DB38507C(0, (unint64_t *)&qword_1F02DA358);
      v39 = (void *)sub_1DB3BC3B8();
      swift_bridgeObjectRelease();
      objc_msgSend(v49, sel_activateConstraints_, v39);

      v4 = v45;
      if (v44 == v7)
        goto LABEL_13;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t variable initialization expression of MultiLinkableFooterView.$__lazy_storage_$_container()
{
  return 0;
}

id MultiLinkableFooterView.__allocating_init(specifier:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return MultiLinkableFooterView.init(specifier:)(a1);
}

id MultiLinkableFooterView.init(specifier:)(void *a1)
{
  uint64_t v1;
  unint64_t v2;
  char *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  _QWORD *v57;
  NSObject *v58;
  uint8_t *v59;
  void *v60;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  objc_super v67;
  uint64_t v68;
  _OWORD v69[2];
  _QWORD v70[4];

  *(_QWORD *)(v2 + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView_heightConstraints) = MEMORY[0x1E0DEE9D8];
  v7 = OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container) = 0;
  if (!a1)
  {
    __break(1u);
    goto LABEL_42;
  }
  v8 = v2;
  v6 = a1;
  v3 = (char *)(id)v2;
  if (objc_msgSend(v6, sel_userInfo))
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v69, 0, sizeof(v69));
  }
  sub_1DB3872D4((uint64_t)v69, (uint64_t)v70);
  if (!v70[3])
  {
    sub_1DB38E7C8((uint64_t)v70);
    goto LABEL_28;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAD70);
  if ((swift_dynamicCast() & 1) != 0)
  {
    if (*(_QWORD *)(v68 + 16))
    {
      v9 = sub_1DB389660(0xD000000000000014, 0x80000001DB3CBC40);
      if ((v10 & 1) != 0)
      {
        v70[0] = *(_QWORD *)(*(_QWORD *)(v68 + 56) + 8 * v9);
        swift_unknownObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAD78);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v4 = *(_QWORD **)&v69[0];
          if (*(_QWORD *)(v68 + 16))
          {
            v11 = sub_1DB389660(0xD000000000000014, 0x80000001DB3CBC60);
            if ((v12 & 1) != 0)
            {
              v70[0] = *(_QWORD *)(*(_QWORD *)(v68 + 56) + 8 * v11);
              swift_unknownObjectRetain();
              __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAD80);
              if ((swift_dynamicCast() & 1) != 0)
              {
                v65 = v7;
                v7 = *(_QWORD *)&v69[0];
                if (*(_QWORD *)(v68 + 16)
                  && (v13 = sub_1DB389660(0xD000000000000014, 0x80000001DB3CBC80), (v14 & 1) != 0))
                {
                  v70[0] = *(_QWORD *)(*(_QWORD *)(v68 + 56) + 8 * v13);
                  swift_unknownObjectRetain();
                  if ((swift_dynamicCast() & 1) == 0)
                  {
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    goto LABEL_38;
                  }
                  v5 = *(_QWORD **)&v69[0];
                  if (*(_QWORD *)(v68 + 16))
                  {
                    v15 = sub_1DB389660(0xD000000000000013, 0x80000001DB3CBCA0);
                    if ((v16 & 1) != 0)
                    {
                      v64 = v2;
                      v17 = *(_QWORD *)(*(_QWORD *)(v68 + 56) + 8 * v15);
                      swift_unknownObjectRetain();
                      swift_bridgeObjectRelease();
                      v70[0] = v17;
                      if ((swift_dynamicCast() & 1) == 0)
                      {
LABEL_44:
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
LABEL_45:
                        v8 = v64;
                        v7 = v65;
                        goto LABEL_28;
                      }
                      v2 = *(_QWORD *)&v69[0];
                      v1 = v4[2];
                      if (!(v7 >> 62))
                      {
                        if (v1 == *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
                          goto LABEL_21;
                        goto LABEL_43;
                      }
LABEL_42:
                      swift_bridgeObjectRetain();
                      v62 = sub_1DB3BC670();
                      swift_bridgeObjectRelease();
                      if (v1 == v62)
                      {
LABEL_21:
                        if (v1 == v5[2])
                        {
                          if (v2 >> 62)
                          {
                            swift_bridgeObjectRetain();
                            v63 = sub_1DB3BC670();
                            swift_bridgeObjectRelease();
                            if (v1 == v63)
                              goto LABEL_24;
                          }
                          else if (v1 == *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
                          {
LABEL_24:
                            v18 = sub_1DB3AF5F4(v4, v7, v5, v2);
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            v19 = sub_1DB3AF020(v18);
                            swift_release();
                            *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView_backingStore] = v19;

                            v20 = (void *)sub_1DB3BC31C();
                            v67.receiver = v3;
                            v67.super_class = (Class)type metadata accessor for MultiLinkableFooterView();
                            v21 = objc_msgSendSuper2(&v67, sel_initWithReuseIdentifier_, v20);

                            v22 = v21;
                            v23 = objc_msgSend(v22, sel_contentView);
                            v24 = sub_1DB3ADF60();
                            objc_msgSend(v23, sel_addSubview_, v24);

                            v25 = (void *)objc_opt_self();
                            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
                            v26 = swift_allocObject();
                            *(_OWORD *)(v26 + 16) = xmmword_1DB3C1BA0;
                            v27 = sub_1DB3ADF60();
                            v28 = objc_msgSend(v27, sel_leadingAnchor);

                            v29 = objc_msgSend(v22, sel_contentView);
                            v30 = objc_msgSend(v29, sel_layoutMarginsGuide);

                            v31 = objc_msgSend(v30, sel_leadingAnchor);
                            v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v31);

                            *(_QWORD *)(v26 + 32) = v32;
                            v33 = sub_1DB3ADF60();
                            v34 = objc_msgSend(v33, sel_trailingAnchor);

                            v35 = objc_msgSend(v22, sel_contentView);
                            v36 = objc_msgSend(v35, sel_layoutMarginsGuide);

                            v37 = objc_msgSend(v36, sel_trailingAnchor);
                            v38 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v37);

                            *(_QWORD *)(v26 + 40) = v38;
                            v39 = sub_1DB3ADF60();
                            v40 = objc_msgSend(v39, sel_topAnchor);

                            v41 = objc_msgSend(v22, sel_contentView);
                            v42 = objc_msgSend(v41, sel_layoutMarginsGuide);

                            v43 = objc_msgSend(v42, sel_topAnchor);
                            v44 = objc_msgSend(v40, sel_constraintEqualToAnchor_, v43);

                            *(_QWORD *)(v26 + 48) = v44;
                            v45 = sub_1DB3ADF60();
                            v46 = objc_msgSend(v45, sel_bottomAnchor);

                            v47 = objc_msgSend(v22, sel_contentView);
                            v48 = objc_msgSend(v47, sel_layoutMarginsGuide);

                            v49 = objc_msgSend(v48, sel_bottomAnchor);
                            v50 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v49);

                            *(_QWORD *)(v26 + 56) = v50;
                            v70[0] = v26;
                            sub_1DB3BC3DC();
                            sub_1DB38507C(0, (unint64_t *)&qword_1F02DA358);
                            v51 = (void *)sub_1DB3BC3B8();
                            swift_bridgeObjectRelease();
                            objc_msgSend(v25, sel_activateConstraints_, v51);

                            return v22;
                          }
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          swift_bridgeObjectRelease();
                          goto LABEL_45;
                        }
                      }
LABEL_43:
                      swift_bridgeObjectRelease();
                      goto LABEL_44;
                    }
                  }
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                }
                else
                {
                  swift_bridgeObjectRelease();
                }
                swift_bridgeObjectRelease();
LABEL_38:
                swift_bridgeObjectRelease();
                v7 = v65;
                goto LABEL_28;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_28;
            }
          }
          swift_bridgeObjectRelease();
        }
      }
    }
    swift_bridgeObjectRelease();
  }
LABEL_28:
  if (qword_1F02DE260 != -1)
    swift_once();
  v52 = sub_1DB3BC0DC();
  __swift_project_value_buffer(v52, (uint64_t)qword_1F02DB148);
  v53 = v6;
  v54 = sub_1DB3BC0C4();
  v55 = sub_1DB3BC478();
  if (os_log_type_enabled(v54, v55))
  {
    v66 = v7;
    v56 = (uint8_t *)swift_slowAlloc();
    v57 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v56 = 138412290;
    v70[0] = v53;
    v58 = v53;
    sub_1DB3BC58C();
    *v57 = v6;

    _os_log_impl(&dword_1DB30C000, v54, v55, "Depedencies not met %@", v56, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA6F8);
    swift_arrayDestroy();
    MEMORY[0x1DF0AD404](v57, -1, -1);
    v59 = v56;
    v7 = v66;
    MEMORY[0x1DF0AD404](v59, -1, -1);
  }
  else
  {

    v54 = v53;
  }

  swift_bridgeObjectRelease();
  v60 = *(void **)(v8 + v7);

  type metadata accessor for MultiLinkableFooterView();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t type metadata accessor for MultiLinkableFooterView()
{
  return objc_opt_self();
}

uint64_t sub_1DB3AF020(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v15 = MEMORY[0x1E0DEE9D8];
    sub_1DB3BC634();
    v13 = *MEMORY[0x1E0D80830];
    v14 = *MEMORY[0x1E0D80838];
    v11 = *MEMORY[0x1E0D80828];
    v12 = *MEMORY[0x1E0D80820];
    v4 = a1 + 40;
    do
    {
      v5 = *(_QWORD *)(v4 + 8);
      v6 = *(_QWORD *)(v4 + 32);
      v7 = objc_allocWithZone(MEMORY[0x1E0D804E8]);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      v8 = objc_msgSend(v7, sel_init);
      v9 = (void *)sub_1DB3BC31C();
      objc_msgSend(v8, sel_setProperty_forKey_, v9, v14);

      objc_msgSend(v8, sel_setProperty_forKey_, v5, v13);
      v10 = (void *)sub_1DB3BC31C();
      objc_msgSend(v8, sel_setProperty_forKey_, v10, v12);

      objc_msgSend(v8, sel_setProperty_forKey_, v6, v11);
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      sub_1DB3BC61C();
      sub_1DB3BC640();
      sub_1DB3BC64C();
      sub_1DB3BC628();
      v4 += 48;
      --v2;
    }
    while (v2);
    return v15;
  }
  return result;
}

Swift::Void __swiftcall MultiLinkableFooterView.refreshContents(with:)(PSSpecifier_optional *with)
{
  void *v1;

  objc_msgSend(v1, sel_setNeedsLayout);
  objc_msgSend(v1, sel_layoutIfNeeded);
}

double MultiLinkableFooterView.preferredHeight(forWidth:)()
{
  id v0;
  double v1;
  double v2;

  v0 = sub_1DB3ADF60();
  objc_msgSend(v0, sel_intrinsicContentSize);
  v2 = v1;

  return v2;
}

double MultiLinkableFooterView.preferredHeight(forWidth:in:)()
{
  id v0;
  double v1;
  double v2;

  v0 = sub_1DB3ADF60();
  objc_msgSend(v0, sel_intrinsicContentSize);
  v2 = v1;

  return v2;
}

void sub_1DB3AF3E0()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView_heightConstraints] = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs23MultiLinkableFooterView____lazy_storage___container] = 0;

  sub_1DB3BC664();
  __break(1u);
}

id MultiLinkableFooterView.__allocating_init(reuseIdentifier:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  void *v3;
  id v4;

  if (a2)
  {
    v3 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(objc_allocWithZone(v2), sel_initWithReuseIdentifier_, v3);

  return v4;
}

void MultiLinkableFooterView.init(reuseIdentifier:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id MultiLinkableFooterView.__deallocating_deinit()
{
  return sub_1DB3853EC(type metadata accessor for MultiLinkableFooterView);
}

uint64_t sub_1DB3AF5F4(_QWORD *a1, unint64_t a2, _QWORD *a3, unint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v8;
  _QWORD *v9;
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
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  BOOL v27;
  unint64_t v28;
  uint64_t result;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD *v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v69;

  v8 = a2;
  v9 = a1;
  v10 = a1[2];
  v66 = a2 >> 62;
  if (a2 >> 62)
    goto LABEL_114;
  v11 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  v54 = a3[2];
  v65 = a4 >> 62;
  if (a4 >> 62)
  {
    swift_bridgeObjectRetain();
    v12 = sub_1DB3BC670();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v13 = v54;
  if (v12 < v54)
    v13 = v12;
  if (v13 >= v11)
    v14 = v11;
  else
    v14 = v13;
  if (v14 >= v10)
    v15 = v10;
  else
    v15 = v14;
  v64 = v9;
  v67 = v8;
  v69 = a4;
  if (v15 <= 0)
  {
    if ((v15 & 0x8000000000000000) == 0)
    {
      v5 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v49 = (_QWORD *)(*(_QWORD *)(MEMORY[0x1E0DEE9D8] + 24) >> 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!v10)
        goto LABEL_61;
      v4 = (uint64_t)(v5 + 4);
      goto LABEL_51;
    }
    __break(1u);
  }
  else
  {
    v47 = v14;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAEB0);
    v6 = (_QWORD *)swift_allocObject();
    v4 = (uint64_t)(_swift_stdlib_malloc_size(v6) - 32) / 48;
    v50 = v15;
    v6[2] = v15;
    v6[3] = 2 * v4;
    if (!v10)
      goto LABEL_134;
    v5 = (_QWORD *)v9[4];
    v15 = v9[5];
    if (v66)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v16 = sub_1DB3BC670();
      swift_bridgeObjectRelease();
    }
    else
    {
      v16 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    if (!v16)
      goto LABEL_135;
    v11 = v8 & 0xC000000000000001;
    v52 = v6;
    if ((v8 & 0xC000000000000001) == 0)
    {
      if (!*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_119;
      v6 = *(_QWORD **)(v8 + 32);
      swift_unknownObjectRetain();
      if (!v54)
      {
LABEL_118:
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        __break(1u);
LABEL_119:
        __break(1u);
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
LABEL_123:
        __break(1u);
        goto LABEL_124;
      }
      goto LABEL_25;
    }
  }
  v6 = (_QWORD *)MEMORY[0x1DF0AC9FC](0, v8);
  if (!v54)
    goto LABEL_118;
LABEL_25:
  v9 = (_QWORD *)a3[4];
  v8 = a3[5];
  if (v65)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v17 = sub_1DB3BC670();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v45 = v10;
  if (!v17)
    goto LABEL_136;
  v10 = 0;
  a4 = 0;
  v18 = v67 & 0xFFFFFFFFFFFFFF8;
  if (v67 < 0)
    v18 = v67;
  v57 = v18;
  v49 = (_QWORD *)((v4 & 0x7FFFFFFFFFFFFFFFLL) - v50);
  v4 = (uint64_t)(v52 + 10);
  while (1)
  {
    if ((v69 & 0xC000000000000001) != 0)
    {
      v20 = MEMORY[0x1DF0AC9FC](a4, v69);
    }
    else
    {
      if (a4 >= *(_QWORD *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_113:
        __break(1u);
LABEL_114:
        swift_bridgeObjectRetain();
        v11 = sub_1DB3BC670();
        swift_bridgeObjectRelease();
        goto LABEL_3;
      }
      v20 = swift_unknownObjectRetain();
    }
    *(_QWORD *)(v4 - 48) = v5;
    *(_QWORD *)(v4 - 40) = v15;
    *(_QWORD *)(v4 - 32) = v6;
    *(_QWORD *)(v4 - 24) = v9;
    *(_QWORD *)(v4 - 16) = v8;
    *(_QWORD *)(v4 - 8) = v20;
    if (v50 - 1 == a4)
      break;
    v5 = *(_QWORD **)((char *)v64 + v10 + 48);
    v15 = *(_QWORD *)((char *)v64 + v10 + 56);
    v9 = (_QWORD *)v67;
    if (v66)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v21 = sub_1DB3BC670();
      swift_bridgeObjectRelease();
    }
    else
    {
      v21 = *(_QWORD *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    if (a4 + 1 == v21)
      goto LABEL_132;
    if (v11)
    {
      v6 = (_QWORD *)MEMORY[0x1DF0AC9FC]();
    }
    else
    {
      if (a4 + 1 >= *(_QWORD *)((v67 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_113;
      v6 = *(_QWORD **)(v67 + 40 + 8 * a4);
      swift_unknownObjectRetain();
    }
    if (v54 - 1 == a4)
      goto LABEL_133;
    v9 = *(_QWORD **)((char *)a3 + v10 + 48);
    v8 = *(_QWORD *)((char *)a3 + v10 + 56);
    if (v65)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v19 = sub_1DB3BC670();
      swift_bridgeObjectRelease();
    }
    else
    {
      v19 = *(_QWORD *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
    }
    v4 += 48;
    ++a4;
    v10 += 16;
    if (a4 == v19)
      goto LABEL_131;
  }
  v10 = v45;
  v14 = v47;
  v9 = v64;
  v8 = v67;
  a4 = v69;
  v15 = v50;
  v5 = v52;
  if (v45 <= v47)
    goto LABEL_61;
LABEL_51:
  if (v10 <= v14)
    goto LABEL_121;
  v22 = &v9[2 * v15];
  v6 = (_QWORD *)v22[4];
  v11 = v22[5];
  if (!v66)
  {
    v23 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v15 != v23)
      goto LABEL_54;
LABEL_60:
    swift_bridgeObjectRelease();
    goto LABEL_61;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24 = sub_1DB3BC670();
  swift_bridgeObjectRelease();
  if (v15 == v24)
    goto LABEL_60;
LABEL_54:
  v57 = v8 & 0xC000000000000001;
  if ((v8 & 0xC000000000000001) != 0)
    goto LABEL_125;
  if ((unint64_t)v15 < *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v63 = *(_QWORD *)(v8 + 8 * v15 + 32);
    swift_unknownObjectRetain();
    while (1)
    {
      if (v15 == v54)
      {
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        goto LABEL_61;
      }
      v62 = v6;
      if (v15 >= v54)
        goto LABEL_130;
      v30 = &a3[2 * v15];
      v6 = (_QWORD *)v30[5];
      v60 = v30[4];
      v51 = v6;
      if (v65)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v42 = sub_1DB3BC670();
        swift_bridgeObjectRelease();
        if (v15 == v42)
        {
LABEL_105:
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          goto LABEL_60;
        }
      }
      else
      {
        v31 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v15 == v31)
          goto LABEL_105;
      }
      v61 = v11;
      v53 = v5;
      v46 = a4 & 0xFFFFFFFFFFFFFF8;
      v48 = v8 & 0xFFFFFFFFFFFFFF8;
      v44 = a4 + 32;
      v55 = v10 - 1;
      v56 = a4 & 0xC000000000000001;
      v59 = 2 * v15;
      v43 = v8 + 40;
      v58 = a3;
      v6 = v9;
      v9 = v49;
      v32 = v51;
      do
      {
        if (v56)
        {
          v11 = MEMORY[0x1DF0AC9FC](v15, a4);
          if (v9)
            goto LABEL_89;
        }
        else
        {
          if ((unint64_t)v15 >= *(_QWORD *)(v46 + 16))
            goto LABEL_127;
          v11 = *(_QWORD *)(v44 + 8 * v15);
          swift_unknownObjectRetain();
          if (v9)
            goto LABEL_89;
        }
        v33 = v53[3];
        if ((uint64_t)((v33 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_128;
        v5 = v32;
        v34 = v33 & 0xFFFFFFFFFFFFFFFELL;
        if (v34 <= 1)
          v35 = 1;
        else
          v35 = v34;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAEB0);
        v8 = swift_allocObject();
        v36 = (uint64_t)(_swift_stdlib_malloc_size((const void *)v8) - 32) / 48;
        *(_QWORD *)(v8 + 16) = v35;
        *(_QWORD *)(v8 + 24) = 2 * v36;
        v37 = v8 + 32;
        v38 = v53[3] >> 1;
        if (v53[2])
        {
          if ((_QWORD *)v8 != v53 || v37 >= (unint64_t)&v53[6 * v38 + 4])
            memmove((void *)(v8 + 32), v53 + 4, 48 * v38);
          v53[2] = 0;
        }
        v4 = v37 + 48 * v38;
        v9 = (_QWORD *)((v36 & 0x7FFFFFFFFFFFFFFFLL) - v38);
        swift_release();
        v53 = (_QWORD *)v8;
        a4 = v69;
        v32 = v5;
LABEL_89:
        v27 = __OFSUB__(v9, 1);
        v9 = (_QWORD *)((char *)v9 - 1);
        if (v27)
          goto LABEL_120;
        *(_QWORD *)v4 = v62;
        *(_QWORD *)(v4 + 8) = v61;
        *(_QWORD *)(v4 + 16) = v63;
        *(_QWORD *)(v4 + 24) = v60;
        *(_QWORD *)(v4 + 32) = v32;
        *(_QWORD *)(v4 + 40) = v11;
        if (v55 == v15)
        {
          v49 = v9;
          goto LABEL_111;
        }
        v11 = v15 + 1;
        if (v15 + 1 >= v10)
          goto LABEL_122;
        v5 = (_QWORD *)v10;
        v10 = v6[v59 + 7];
        v62 = (_QWORD *)v6[v59 + 6];
        v61 = v10;
        if (v66)
        {
          v8 = (uint64_t)v9;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v40 = sub_1DB3BC670();
          swift_bridgeObjectRelease();
        }
        else
        {
          v40 = *(_QWORD *)(v48 + 16);
          swift_bridgeObjectRetain();
        }
        if (v11 == v40)
        {
          v49 = v9;
          goto LABEL_110;
        }
        v10 = (uint64_t)v5;
        if (v57)
        {
          v41 = MEMORY[0x1DF0AC9FC](v15 + 1, v67);
        }
        else
        {
          if ((unint64_t)v11 >= *(_QWORD *)(v48 + 16))
            goto LABEL_129;
          v41 = *(_QWORD *)(v43 + 8 * v15);
          swift_unknownObjectRetain();
        }
        if (v54 - 1 == v15)
        {
          v49 = v9;
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();
          goto LABEL_111;
        }
        if (v11 >= v54)
          goto LABEL_123;
        v63 = v41;
        v32 = (_QWORD *)v58[v59 + 7];
        v60 = v58[v59 + 6];
        if (v65)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v8 = sub_1DB3BC670();
          swift_bridgeObjectRelease();
        }
        else
        {
          v8 = *(_QWORD *)(v46 + 16);
          swift_bridgeObjectRetain();
        }
        v4 += 48;
        v6 += 2;
        v5 = v58 + 2;
        v58 += 2;
        ++v15;
      }
      while (v11 != v8);
      v49 = v9;
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
LABEL_110:
      swift_bridgeObjectRelease();
LABEL_111:
      v9 = v64;
      v8 = v67;
      v5 = v53;
LABEL_61:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v25 = v5[3];
      if (v25 < 2)
        return (uint64_t)v5;
      v26 = v25 >> 1;
      v27 = __OFSUB__(v26, v49);
      v28 = v26 - (_QWORD)v49;
      if (!v27)
      {
        v5[2] = v28;
        return (uint64_t)v5;
      }
LABEL_124:
      __break(1u);
LABEL_125:
      v63 = MEMORY[0x1DF0AC9FC](v15, v8);
    }
  }
  __break(1u);
LABEL_127:
  __break(1u);
LABEL_128:
  __break(1u);
LABEL_129:
  __break(1u);
LABEL_130:
  __break(1u);
LABEL_131:
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_132:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_133:
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  __break(1u);
LABEL_134:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __break(1u);
LABEL_135:
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_136:
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for MultiLinkableTextView()
{
  return objc_opt_self();
}

void type metadata accessor for _NSRange(uint64_t a1)
{
  sub_1DB3846D4(a1, &qword_1F02DAE60);
}

uint64_t sub_1DB3B00DC()
{
  return sub_1DB3B0100((unint64_t *)&unk_1F02DAEC0, (uint64_t)&unk_1DB3C1918);
}

uint64_t sub_1DB3B0100(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x1DF0AD380](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DB3B0140()
{
  return sub_1DB3B0100(&qword_1F02DA3C0, (uint64_t)&unk_1DB3C18EC);
}

uint64_t sub_1DB3B0164()
{
  return sub_1DB3B0100((unint64_t *)&unk_1F02DAED0, (uint64_t)&unk_1DB3C1988);
}

id sub_1DB3B0188(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  void *v6;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAFA0);
  v6 = (void *)sub_1DB3BC6E8();
  swift_beginAccess();
  objc_setAssociatedObject(v2, &unk_1F02DE570, v6, (void *)1);
  swift_endAccess();
  swift_unknownObjectRelease();
  return objc_msgSend(v2, sel_addTarget_action_forControlEvents_, v2, sel_buttonTapped, 64);
}

uint64_t sub_1DB3B0260(uint64_t a1, uint64_t a2)
{
  return sub_1DB3B076C(a1, a2, (uint64_t)&unk_1EA29D5B0, (uint64_t)sub_1DB3B0E90, &unk_1F02DE570);
}

uint64_t sub_1DB3B027C()
{
  uint64_t (*v0)();
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v0 = sub_1DB3B02E8();
  if (v0)
  {
    v2 = v0;
    v3 = v1;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v2;
    *(_QWORD *)(v4 + 24) = v3;
    v5 = sub_1DB396C5C;
  }
  else
  {
    v5 = nullsub_1;
  }
  v5();
  return swift_release();
}

uint64_t (*sub_1DB3B02E8())()
{
  void *v0;
  id v1;
  __int128 v3;
  _OWORD v4[2];
  _BYTE v5[24];
  uint64_t v6;

  swift_beginAccess();
  v1 = objc_getAssociatedObject(v0, &unk_1F02DE570);
  swift_endAccess();
  if (v1)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_1DB3872D4((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAFA0);
    if (swift_dynamicCast())
    {
      *(_OWORD *)(swift_allocObject() + 16) = v3;
      return sub_1DB396C5C;
    }
  }
  else
  {
    sub_1DB38E7C8((uint64_t)v5);
  }
  return 0;
}

uint64_t sub_1DB3B03E8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DB3B040C(void *a1)
{
  id v1;
  uint64_t (*v2)();
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v1 = a1;
  v2 = sub_1DB3B02E8();
  if (v2)
  {
    v4 = v2;
    v5 = v3;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_1DB396C5C;
  }
  else
  {
    v7 = nullsub_1;
  }
  v7();

  return swift_release();
}

void (*sub_1DB3B0488(_QWORD *a1))(uint64_t (***a1)(), char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  v3[3] = sub_1DB3B02E8();
  v3[4] = v4;
  return sub_1DB3B04D4;
}

void sub_1DB3B04D4(uint64_t (***a1)(), char a2)
{
  uint64_t (**v2)();
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t (*v9)();
  uint64_t (*v10)();

  v2 = *a1;
  v3 = (uint64_t)(*a1)[3];
  v4 = (*a1)[4];
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      v5 = swift_allocObject();
      *(_QWORD *)(v5 + 16) = v3;
      *(_QWORD *)(v5 + 24) = v4;
      *v2 = sub_1DB3B0E90;
      v2[1] = (uint64_t (*)())v5;
      swift_retain_n();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAFA0);
      v6 = (void *)sub_1DB3BC6E8();
    }
    else
    {
      v6 = 0;
    }
    v9 = v2[5];
    swift_beginAccess();
    objc_setAssociatedObject(v9, &unk_1F02DE570, v6, (void *)1);
    swift_endAccess();
    sub_1DB38CCB8(v3);
    swift_unknownObjectRelease();
    sub_1DB38CCB8((uint64_t)v2[3]);
  }
  else
  {
    if (v3)
    {
      v7 = swift_allocObject();
      *(_QWORD *)(v7 + 16) = v3;
      *(_QWORD *)(v7 + 24) = v4;
      *v2 = sub_1DB3B0E90;
      v2[1] = (uint64_t (*)())v7;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAFA0);
      v8 = (void *)sub_1DB3BC6E8();
    }
    else
    {
      v8 = 0;
    }
    v10 = v2[5];
    swift_beginAccess();
    objc_setAssociatedObject(v10, &unk_1F02DE570, v8, (void *)1);
    swift_endAccess();
    sub_1DB38CCB8(v3);
    swift_unknownObjectRelease();
  }
  free(v2);
}

id sub_1DB3B066C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  void *v6;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAFA0);
  v6 = (void *)sub_1DB3BC6E8();
  swift_beginAccess();
  objc_setAssociatedObject(v2, &unk_1F02DE571, v6, (void *)1);
  swift_endAccess();
  swift_unknownObjectRelease();
  objc_msgSend(v2, sel_setTarget_, v2);
  return objc_msgSend(v2, sel_setAction_, sel_buttonTapped);
}

uint64_t sub_1DB3B0750(uint64_t a1, uint64_t a2)
{
  return sub_1DB3B076C(a1, a2, (uint64_t)&unk_1EA29D6A0, (uint64_t)sub_1DB3B0E90, &unk_1F02DE571);
}

uint64_t sub_1DB3B076C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5)
{
  void *v5;
  void *v7;
  uint64_t v10;
  void *v11;

  v7 = v5;
  if (a1)
  {
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = a1;
    *(_QWORD *)(v10 + 24) = a2;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAFA0);
    v11 = (void *)sub_1DB3BC6E8();
  }
  else
  {
    v11 = 0;
  }
  swift_beginAccess();
  objc_setAssociatedObject(v7, a5, v11, (void *)1);
  swift_endAccess();
  sub_1DB38CCB8(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_1DB3B083C()
{
  uint64_t (*v0)();
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();

  v0 = sub_1DB3B08A8();
  if (v0)
  {
    v2 = v0;
    v3 = v1;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v2;
    *(_QWORD *)(v4 + 24) = v3;
    v5 = sub_1DB396C5C;
  }
  else
  {
    v5 = nullsub_1;
  }
  v5();
  return swift_release();
}

uint64_t (*sub_1DB3B08A8())()
{
  void *v0;
  id v1;
  __int128 v3;
  _OWORD v4[2];
  _BYTE v5[24];
  uint64_t v6;

  swift_beginAccess();
  v1 = objc_getAssociatedObject(v0, &unk_1F02DE571);
  swift_endAccess();
  if (v1)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_1DB3872D4((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAFA0);
    if (swift_dynamicCast())
    {
      *(_OWORD *)(swift_allocObject() + 16) = v3;
      return sub_1DB3B0E90;
    }
  }
  else
  {
    sub_1DB38E7C8((uint64_t)v5);
  }
  return 0;
}

uint64_t sub_1DB3B09A8(void *a1)
{
  id v1;
  uint64_t (*v2)();
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v1 = a1;
  v2 = sub_1DB3B08A8();
  if (v2)
  {
    v4 = v2;
    v5 = v3;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_1DB396C5C;
  }
  else
  {
    v7 = nullsub_1;
  }
  v7();

  return swift_release();
}

void (*sub_1DB3B0A24(_QWORD *a1))(uint64_t (***a1)(), char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  v3[3] = sub_1DB3B08A8();
  v3[4] = v4;
  return sub_1DB3B0A70;
}

void sub_1DB3B0A70(uint64_t (***a1)(), char a2)
{
  uint64_t (**v2)();
  uint64_t v3;
  uint64_t (*v4)();
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t (*v9)();
  uint64_t (*v10)();

  v2 = *a1;
  v3 = (uint64_t)(*a1)[3];
  v4 = (*a1)[4];
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      v5 = swift_allocObject();
      *(_QWORD *)(v5 + 16) = v3;
      *(_QWORD *)(v5 + 24) = v4;
      *v2 = sub_1DB3B0E90;
      v2[1] = (uint64_t (*)())v5;
      swift_retain_n();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAFA0);
      v6 = (void *)sub_1DB3BC6E8();
    }
    else
    {
      v6 = 0;
    }
    v9 = v2[5];
    swift_beginAccess();
    objc_setAssociatedObject(v9, &unk_1F02DE571, v6, (void *)1);
    swift_endAccess();
    sub_1DB38CCB8(v3);
    swift_unknownObjectRelease();
    sub_1DB38CCB8((uint64_t)v2[3]);
  }
  else
  {
    if (v3)
    {
      v7 = swift_allocObject();
      *(_QWORD *)(v7 + 16) = v3;
      *(_QWORD *)(v7 + 24) = v4;
      *v2 = sub_1DB3B0E90;
      v2[1] = (uint64_t (*)())v7;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAFA0);
      v8 = (void *)sub_1DB3BC6E8();
    }
    else
    {
      v8 = 0;
    }
    v10 = v2[5];
    swift_beginAccess();
    objc_setAssociatedObject(v10, &unk_1F02DE571, v8, (void *)1);
    swift_endAccess();
    sub_1DB38CCB8(v3);
    swift_unknownObjectRelease();
  }
  free(v2);
}

Swift::Void __swiftcall UIView.pinToOther(_:)(UIView *a1)
{
  void *v1;
  void *v2;
  void *v4;
  uint64_t v5;
  id v6;
  NSLayoutXAxisAnchor *v7;
  id v8;
  id v9;
  NSLayoutXAxisAnchor *v10;
  id v11;
  id v12;
  NSLayoutYAxisAnchor *v13;
  id v14;
  id v15;
  NSLayoutYAxisAnchor *v16;
  id v17;
  id v18;

  v2 = v1;
  v4 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F02DAD90);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DB3C1BA0;
  v6 = objc_msgSend(v2, sel_leadingAnchor);
  v7 = -[UIView leadingAnchor](a1, sel_leadingAnchor);
  v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

  *(_QWORD *)(v5 + 32) = v8;
  v9 = objc_msgSend(v2, sel_trailingAnchor);
  v10 = -[UIView trailingAnchor](a1, sel_trailingAnchor);
  v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

  *(_QWORD *)(v5 + 40) = v11;
  v12 = objc_msgSend(v2, sel_topAnchor);
  v13 = -[UIView topAnchor](a1, sel_topAnchor);
  v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

  *(_QWORD *)(v5 + 48) = v14;
  v15 = objc_msgSend(v2, sel_bottomAnchor);
  v16 = -[UIView bottomAnchor](a1, sel_bottomAnchor);
  v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  *(_QWORD *)(v5 + 56) = v17;
  sub_1DB3BC3DC();
  sub_1DB39C5E4();
  v18 = (id)sub_1DB3BC3B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_activateConstraints_, v18);

}

void sub_1DB3B0E3C(void *a1, uint64_t a2, void *a3)
{
  UIView *v4;
  id v5;

  v4 = a3;
  v5 = a1;
  UIView.pinToOther(_:)(v4);

}

BOOL sub_1DB3B0EC8(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1DB3B0ED8()
{
  return sub_1DB3BC718();
}

uint64_t sub_1DB3B0EFC()
{
  sub_1DB3BC70C();
  sub_1DB3BC718();
  return sub_1DB3BC724();
}

uint64_t variable initialization expression of BobbleMappingSelectionController.viewModel()
{
  return 0;
}

uint64_t variable initialization expression of BobbleMappingSelectionController.mapingUseCase()
{
  return 2;
}

id BobbleMappingSelectionController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id BobbleMappingSelectionController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  _BYTE *v3;
  void *v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel] = 0;
  v3[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase] = 2;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection] = 0;
  if (a2)
  {
    v5 = (void *)sub_1DB3BC31C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for BobbleMappingSelectionController();
  v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

uint64_t type metadata accessor for BobbleMappingSelectionController()
{
  return objc_opt_self();
}

uint64_t variable initialization expression of BobbleMappingSelectionController.$__lazy_storage_$_headGestureMappingSection()
{
  return 0;
}

void sub_1DB3B10EC()
{
  _BYTE *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel] = 0;
  v0[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase] = 2;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection] = 0;

  sub_1DB3BC664();
  __break(1u);
}

uint64_t sub_1DB3B1200()
{
  char *v0;
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
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char v15;
  __n128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char v23;
  __n128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[3];
  uint64_t v30;
  _QWORD v31[20];

  v1 = OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection;
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection])
  {
    v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection];
  }
  else
  {
    v3 = v0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DA4F8);
    v4 = sub_1DB38CD8C();
    v6 = v5;
    v7 = sub_1DB38CD8C();
    v9 = sub_1DB38CD98(v4, v6, v7, v8);
    v10 = sub_1DB398ADC();
    v12 = v11;
    v13 = type metadata accessor for BobbleMappingSelectionController();
    v30 = v13;
    v29[0] = v3;
    v14 = v3;
    v15 = sub_1DB38CB14();
    v16 = sub_1DB38CCD8(0, 0, v10, v12, (uint64_t)v29, 0, 0, 3, (uint64_t)v31, 0, v15 & 1, 0, 0, (__n128)0, 0);
    v17 = (*(uint64_t (**)(_QWORD *, __n128))(*(_QWORD *)v9 + 160))(v31, v16);
    swift_release();
    sub_1DB389DF8(v31);
    v18 = (*(uint64_t (**)(void (*)(void *), _QWORD))(*(_QWORD *)v17 + 168))(sub_1DB3B148C, 0);
    swift_release();
    v19 = sub_1DB398ADC();
    v21 = v20;
    v30 = v13;
    v29[0] = v14;
    v22 = v14;
    v23 = sub_1DB38CB14();
    v24 = sub_1DB38CCD8(0, 0, v19, v21, (uint64_t)v29, 0, 0, 3, (uint64_t)v31, 0, v23 & 1, 0, 0, (__n128)0, 0);
    v25 = (*(uint64_t (**)(_QWORD *, __n128))(*(_QWORD *)v18 + 160))(v31, v24);
    swift_release();
    sub_1DB389DF8(v31);
    v26 = (*(uint64_t (**)(void (*)(void *), _QWORD))(*(_QWORD *)v25 + 168))(sub_1DB3B14F4, 0);
    v27 = swift_release();
    v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v26 + 176))(v27);
    swift_release();
    *(_QWORD *)&v3[v1] = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

void sub_1DB3B148C(void *a1)
{
  id v2;

  v2 = (id)sub_1DB3BC31C();
  objc_msgSend(a1, sel_setProperty_forKey_, v2, *MEMORY[0x1E0D80868]);

}

void sub_1DB3B14F4(void *a1)
{
  id v2;

  sub_1DB398ADC();
  v2 = (id)sub_1DB3BC31C();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setProperty_forKey_, v2, *MEMORY[0x1E0D80868]);

}

uint64_t sub_1DB3B156C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1
            + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1DB3B1584(uint64_t *a1))(_QWORD *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = sub_1DB3B1200();
  return sub_1DB3B15B8;
}

uint64_t sub_1DB3B15B8(_QWORD *a1)
{
  *(_QWORD *)(a1[1]
            + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController____lazy_storage___headGestureMappingSection) = *a1;
  return swift_bridgeObjectRelease();
}

Swift::OpaquePointer_optional __swiftcall BobbleMappingSelectionController.specifiers()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  Swift::Bool v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33[3];
  uint64_t v34;
  Swift::OpaquePointer_optional result;

  v1 = v0;
  v2 = sub_1DB3BC0DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v1, sel_specifier);
  if (!v6)
  {
    __break(1u);
    goto LABEL_28;
  }
  v8 = v6;
  v9 = objc_msgSend(v6, sel_userInfo);

  if (v9)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }
  sub_1DB3872D4((uint64_t)&v31, (uint64_t)v33);
  if (!v34)
    goto LABEL_21;
  sub_1DB38507C(0, &qword_1F02DA428);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_22:
    sub_1DB38507C(0, &qword_1F02DA480);
    v23 = (void *)sub_1DB3BC3B8();
    v24 = (void *)sub_1DB3BC31C();
    objc_msgSend(v1, sel_setValue_forKey_, v23, v24);

    sub_1DB3BC0AC();
    v25 = sub_1DB3BC0C4();
    v26 = sub_1DB3BC478();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v28 = swift_slowAlloc();
      v33[0] = v28;
      *(_DWORD *)v27 = 136315394;
      *(_QWORD *)&v31 = sub_1DB388E4C(0x6569666963657073, 0xEC00000029287372, v33);
      sub_1DB3BC58C();
      *(_WORD *)(v27 + 12) = 2048;
      *(_QWORD *)&v31 = 61;
      sub_1DB3BC58C();
      _os_log_impl(&dword_1DB30C000, v25, v26, "%s: %ld Depedencies not meet, bailing out of specifiers returning empty conroller!", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1DF0AD404](v28, -1, -1);
      MEMORY[0x1DF0AD404](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v22 = 0;
    goto LABEL_25;
  }
  v10 = v30;
  v11 = (void *)sub_1DB3BC31C();
  v12 = objc_msgSend(v10, sel_objectForKey_, v11);

  if (v12)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }
  sub_1DB3872D4((uint64_t)&v31, (uint64_t)v33);
  if (!v34)
    goto LABEL_20;
  type metadata accessor for BobbleSettingsViewModel();
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_22;
  }
  v13 = v30;
  v14 = (void *)sub_1DB3BC31C();
  v15 = objc_msgSend(v10, sel_objectForKey_, v14);

  if (v15)
  {
    sub_1DB3BC5B0();
    swift_unknownObjectRelease();
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }
  sub_1DB3872D4((uint64_t)&v31, (uint64_t)v33);
  if (!v34)
  {
    swift_release();
LABEL_20:

LABEL_21:
    sub_1DB3894E4((uint64_t)v33, (uint64_t *)&unk_1F02DAD60);
    goto LABEL_22;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_release();

    goto LABEL_22;
  }
  v16 = (char)v30;
  *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel) = v13;
  swift_retain();
  v17 = swift_release();
  *((_BYTE *)v1 + OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase) = v16;
  v18 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v1) + 0x98))(v17);
  v33[0] = MEMORY[0x1E0DEE9D8];
  sub_1DB3897A4(v18);
  v19 = v33[0];
  sub_1DB38507C(0, &qword_1F02DA480);
  v20 = (void *)sub_1DB3BC3B8();
  v21 = (void *)sub_1DB3BC31C();
  objc_msgSend(v1, sel_setValue_forKey_, v20, v21);

  v22 = sub_1DB388B3C(v19);
  swift_release();
  swift_bridgeObjectRelease();
LABEL_25:
  v6 = (id)v22;
LABEL_28:
  result.value._rawValue = v6;
  result.is_nil = v7;
  return result;
}

uint64_t BobbleMappingSelectionController.tableView(_:cellForRowAt:)(uint64_t a1)
{
  char *v1;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t result;
  objc_super v14;

  v3 = (void *)sub_1DB3BBD34();
  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for BobbleMappingSelectionController();
  v4 = objc_msgSendSuper2(&v14, sel_tableView_cellForRowAtIndexPath_, a1, v3);

  objc_opt_self();
  v5 = swift_dynamicCastObjCClass();
  if (!v5)
    goto LABEL_24;
  v6 = (void *)v5;
  v7 = sub_1DB3BBD58();
  if (v1[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase])
  {
    if (v1[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase] == 1)
    {
      if (v7 == 1)
      {
        v8 = *(_QWORD **)&v1[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
        if (v8)
        {
          v9 = 2;
          goto LABEL_14;
        }
        goto LABEL_22;
      }
      if (!v7)
      {
        v8 = *(_QWORD **)&v1[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
        if (v8)
        {
          v9 = 1;
LABEL_14:
          v10 = 23;
LABEL_18:
          v11 = *(uint64_t (**)(uint64_t))(*v8 + 8 * v10);
          v12 = swift_retain();
          LOBYTE(v11) = v11(v12);
          swift_release();
          objc_msgSend(v6, sel_setChecked_, v9 == v11);
          return (uint64_t)v6;
        }
        __break(1u);
        goto LABEL_21;
      }
    }
    return (uint64_t)v6;
  }
  if (v7 != 1)
  {
    if (v7)
      return (uint64_t)v6;
    v8 = *(_QWORD **)&v1[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
    if (!v8)
    {
LABEL_21:
      __break(1u);
LABEL_22:
      __break(1u);
      goto LABEL_23;
    }
    v9 = 1;
LABEL_17:
    v10 = 29;
    goto LABEL_18;
  }
  v8 = *(_QWORD **)&v1[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
  if (v8)
  {
    v9 = 2;
    goto LABEL_17;
  }
LABEL_23:
  __break(1u);
LABEL_24:

  result = sub_1DB3BC664();
  __break(1u);
  return result;
}

void BobbleMappingSelectionController.listItemSelected(_:)(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  void *v12;
  void (*v13)(char *, uint64_t);
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  char *v33;

  v2 = v1;
  v32 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAFC0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DB3BBD64();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = v2;
  v10 = objc_msgSend(v2, sel_table);
  if (!v10)
  {
    __break(1u);
    goto LABEL_29;
  }
  v11 = v10;
  MEMORY[0x1DF0AC150](0, 0);
  v12 = (void *)sub_1DB3BBD34();
  v13 = *(void (**)(char *, uint64_t))(v7 + 8);
  v13(v9, v6);
  v14 = objc_msgSend(v11, sel_cellForRowAtIndexPath_, v12);

  if (!v14)
    return;
  objc_opt_self();
  v15 = swift_dynamicCastObjCClass();
  if (!v15)
    goto LABEL_26;
  v16 = (void *)v15;
  v31 = v14;
  v17 = objc_msgSend(v33, sel_table);
  if (!v17)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v18 = v17;
  MEMORY[0x1DF0AC150](1, 0);
  v19 = (void *)sub_1DB3BBD34();
  v13(v9, v6);
  v20 = objc_msgSend(v18, sel_cellForRowAtIndexPath_, v19);

  v14 = v31;
  if (v20)
  {
    objc_opt_self();
    v21 = swift_dynamicCastObjCClass();
    if (!v21)
      goto LABEL_25;
    v22 = (void *)v21;
    objc_msgSend(v16, sel_setChecked_, 0);
    objc_msgSend(v22, sel_setChecked_, 0);
    sub_1DB3B2270(v32, (uint64_t)v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
    {
      v23 = sub_1DB3BBD58();
      v13(v5, v6);
      if (v33[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase])
      {
        if (v33[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_mapingUseCase] != 1)
          goto LABEL_25;
        if (v23 != 1)
        {
          if (!v23)
          {
            v24 = *(_QWORD *)&v33[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
            if (v24)
            {
              v25 = *(void (**)(uint64_t))(*(_QWORD *)v24 + 192);
LABEL_18:
              swift_retain();
              v25(1);
LABEL_24:
              swift_release();
              objc_msgSend(v16, sel_setChecked_, 1);
              goto LABEL_25;
            }
            goto LABEL_31;
          }
LABEL_25:

          v14 = v31;
          goto LABEL_26;
        }
        v27 = *(_QWORD *)&v33[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
        if (!v27)
        {
LABEL_33:
          __break(1u);
          goto LABEL_34;
        }
        v28 = *(void (**)(uint64_t))(*(_QWORD *)v27 + 192);
      }
      else
      {
        if (v23 != 1)
        {
          if (!v23)
          {
            v26 = *(_QWORD *)&v33[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
            if (v26)
            {
              v25 = *(void (**)(uint64_t))(*(_QWORD *)v26 + 240);
              goto LABEL_18;
            }
            goto LABEL_32;
          }
          goto LABEL_25;
        }
        v29 = *(_QWORD *)&v33[OBJC_IVAR____TtC16HeadphoneConfigs32BobbleMappingSelectionController_viewModel];
        if (!v29)
        {
LABEL_34:
          __break(1u);
          return;
        }
        v28 = *(void (**)(uint64_t))(*(_QWORD *)v29 + 240);
      }
      swift_retain();
      v28(2);
      v16 = v22;
      goto LABEL_24;
    }
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
LABEL_26:

}

id BobbleMappingSelectionController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BobbleMappingSelectionController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DB3B2270(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02DAFC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1DB3B22BC()
{
  unint64_t result;

  result = qword_1F02DAFC8;
  if (!qword_1F02DAFC8)
  {
    result = MEMORY[0x1DF0AD380](&unk_1DB3C29DC, &type metadata for BobbleMappingUseCase);
    atomic_store(result, (unint64_t *)&qword_1F02DAFC8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for BobbleMappingUseCase(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1DB3B234C + 4 * byte_1DB3C29D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1DB3B2380 + 4 * byte_1DB3C29D0[v4]))();
}

uint64_t sub_1DB3B2380(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB3B2388(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DB3B2390);
  return result;
}

uint64_t sub_1DB3B239C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DB3B23A4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1DB3B23A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DB3B23B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BobbleMappingUseCase()
{
  return &type metadata for BobbleMappingUseCase;
}

unint64_t sub_1DB3B23CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F02DA4F0;
  if (!qword_1F02DA4F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F02DA4E8);
    result = MEMORY[0x1DF0AD380](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1F02DA4F0);
  }
  return result;
}

uint64_t sub_1DB3B2418()
{
  return swift_deallocClassInstance();
}

id sub_1DB3B2428()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_1F02DE688 = (uint64_t)result;
  return result;
}

uint64_t sub_1DB3B2478(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB160);
}

uint64_t sub_1DB3B249C()
{
  return sub_1DB3B2514(&qword_1F02DE690, (uint64_t)qword_1F02DB160);
}

uint64_t sub_1DB3B24B8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE690, (uint64_t)qword_1F02DB160, a1);
}

uint64_t sub_1DB3B24D4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB178);
}

uint64_t sub_1DB3B24F8()
{
  return sub_1DB3B2514(&qword_1F02DE698, (uint64_t)qword_1F02DB178);
}

uint64_t sub_1DB3B2514(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_1DB3BC088();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_1DB3B2554@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE698, (uint64_t)qword_1F02DB178, a1);
}

uint64_t sub_1DB3B2570@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_1DB3BC088();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_1DB3B25D8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB190);
}

uint64_t sub_1DB3B25FC()
{
  return sub_1DB3B2514(&qword_1F02DE6A0, (uint64_t)qword_1F02DB190);
}

uint64_t sub_1DB3B2618@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE6A0, (uint64_t)qword_1F02DB190, a1);
}

uint64_t sub_1DB3B2634(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB1A8);
}

uint64_t sub_1DB3B2650()
{
  return sub_1DB3B2514(&qword_1F02DE6A8, (uint64_t)qword_1F02DB1A8);
}

uint64_t sub_1DB3B266C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE6A8, (uint64_t)qword_1F02DB1A8, a1);
}

uint64_t sub_1DB3B2688(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB1C0);
}

uint64_t sub_1DB3B26A4()
{
  return sub_1DB3B2514(&qword_1F02DE6B0, (uint64_t)qword_1F02DB1C0);
}

uint64_t sub_1DB3B26C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE6B0, (uint64_t)qword_1F02DB1C0, a1);
}

uint64_t sub_1DB3B26DC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB1D8);
}

uint64_t sub_1DB3B26FC()
{
  return sub_1DB3B2514(&qword_1F02DE6B8, (uint64_t)qword_1F02DB1D8);
}

uint64_t sub_1DB3B2718@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE6B8, (uint64_t)qword_1F02DB1D8, a1);
}

uint64_t sub_1DB3B2734(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB1F0);
}

uint64_t sub_1DB3B2754()
{
  return sub_1DB3B2514(&qword_1F02DE6C0, (uint64_t)qword_1F02DB1F0);
}

uint64_t sub_1DB3B2770@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE6C0, (uint64_t)qword_1F02DB1F0, a1);
}

uint64_t sub_1DB3B278C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB208);
}

uint64_t sub_1DB3B27A8()
{
  return sub_1DB3B2514(&qword_1F02DE6C8, (uint64_t)qword_1F02DB208);
}

uint64_t sub_1DB3B27C4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE6C8, (uint64_t)qword_1F02DB208, a1);
}

uint64_t sub_1DB3B27E0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB220);
}

uint64_t sub_1DB3B2800()
{
  return sub_1DB3B2514(&qword_1F02DE6D0, (uint64_t)qword_1F02DB220);
}

uint64_t sub_1DB3B281C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE6D0, (uint64_t)qword_1F02DB220, a1);
}

uint64_t sub_1DB3B2838(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB238);
}

uint64_t sub_1DB3B2854()
{
  return sub_1DB3B2514(&qword_1F02DE6D8, (uint64_t)qword_1F02DB238);
}

uint64_t sub_1DB3B2870@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE6D8, (uint64_t)qword_1F02DB238, a1);
}

uint64_t sub_1DB3B288C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB250);
}

uint64_t sub_1DB3B28AC()
{
  return sub_1DB3B2514(&qword_1F02DE6E0, (uint64_t)qword_1F02DB250);
}

uint64_t sub_1DB3B28C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE6E0, (uint64_t)qword_1F02DB250, a1);
}

uint64_t sub_1DB3B28E4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB268);
}

uint64_t sub_1DB3B2904()
{
  return sub_1DB3B2514(&qword_1F02DE6E8, (uint64_t)qword_1F02DB268);
}

uint64_t sub_1DB3B2920@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE6E8, (uint64_t)qword_1F02DB268, a1);
}

uint64_t sub_1DB3B293C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB280);
}

uint64_t sub_1DB3B2964()
{
  return sub_1DB3B2514(&qword_1F02DE6F0, (uint64_t)qword_1F02DB280);
}

uint64_t sub_1DB3B2980@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE6F0, (uint64_t)qword_1F02DB280, a1);
}

uint64_t sub_1DB3B299C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB298);
}

uint64_t sub_1DB3B29C0()
{
  return sub_1DB3B2514(&qword_1F02DE6F8, (uint64_t)qword_1F02DB298);
}

uint64_t sub_1DB3B29DC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE6F8, (uint64_t)qword_1F02DB298, a1);
}

uint64_t sub_1DB3B29F8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB2B0);
}

uint64_t sub_1DB3B2A1C()
{
  return sub_1DB3B2514(&qword_1F02DE700, (uint64_t)qword_1F02DB2B0);
}

uint64_t sub_1DB3B2A38@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE700, (uint64_t)qword_1F02DB2B0, a1);
}

uint64_t sub_1DB3B2A54(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB2C8);
}

uint64_t sub_1DB3B2A78()
{
  return sub_1DB3B2514(&qword_1F02DE708, (uint64_t)qword_1F02DB2C8);
}

uint64_t sub_1DB3B2A94@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE708, (uint64_t)qword_1F02DB2C8, a1);
}

uint64_t sub_1DB3B2AB0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB2E0);
}

uint64_t sub_1DB3B2AD4()
{
  return sub_1DB3B2514(&qword_1F02DE710, (uint64_t)qword_1F02DB2E0);
}

uint64_t sub_1DB3B2AF0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE710, (uint64_t)qword_1F02DB2E0, a1);
}

uint64_t sub_1DB3B2B0C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB2F8);
}

uint64_t sub_1DB3B2B30()
{
  return sub_1DB3B2514(&qword_1F02DE718, (uint64_t)qword_1F02DB2F8);
}

uint64_t sub_1DB3B2B4C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE718, (uint64_t)qword_1F02DB2F8, a1);
}

uint64_t sub_1DB3B2B68(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB310);
}

uint64_t sub_1DB3B2B8C()
{
  return sub_1DB3B2514(&qword_1F02DE720, (uint64_t)qword_1F02DB310);
}

uint64_t sub_1DB3B2BA8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE720, (uint64_t)qword_1F02DB310, a1);
}

uint64_t sub_1DB3B2BC4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB328);
}

uint64_t sub_1DB3B2BE8()
{
  return sub_1DB3B2514(&qword_1F02DE728, (uint64_t)qword_1F02DB328);
}

uint64_t sub_1DB3B2C04@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE728, (uint64_t)qword_1F02DB328, a1);
}

uint64_t sub_1DB3B2C20(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB340);
}

uint64_t sub_1DB3B2C44()
{
  return sub_1DB3B2514(&qword_1F02DE730, (uint64_t)qword_1F02DB340);
}

uint64_t sub_1DB3B2C60@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE730, (uint64_t)qword_1F02DB340, a1);
}

uint64_t sub_1DB3B2C7C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB358);
}

uint64_t sub_1DB3B2C98()
{
  return sub_1DB3B2514(&qword_1F02DE738, (uint64_t)qword_1F02DB358);
}

uint64_t sub_1DB3B2CB4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE738, (uint64_t)qword_1F02DB358, a1);
}

uint64_t sub_1DB3B2CD0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB370);
}

uint64_t sub_1DB3B2CEC()
{
  return sub_1DB3B2514(&qword_1F02DE740, (uint64_t)qword_1F02DB370);
}

uint64_t sub_1DB3B2D08@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE740, (uint64_t)qword_1F02DB370, a1);
}

uint64_t sub_1DB3B2D24(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB388);
}

uint64_t sub_1DB3B2D44()
{
  return sub_1DB3B2514(&qword_1F02DE748, (uint64_t)qword_1F02DB388);
}

uint64_t sub_1DB3B2D60@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE748, (uint64_t)qword_1F02DB388, a1);
}

uint64_t sub_1DB3B2D7C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB3A0);
}

uint64_t sub_1DB3B2D9C()
{
  return sub_1DB3B2514(&qword_1F02DE750, (uint64_t)qword_1F02DB3A0);
}

uint64_t sub_1DB3B2DB8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE750, (uint64_t)qword_1F02DB3A0, a1);
}

uint64_t sub_1DB3B2DD4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB3B8);
}

uint64_t sub_1DB3B2DF4()
{
  return sub_1DB3B2514(&qword_1F02DE758, (uint64_t)qword_1F02DB3B8);
}

uint64_t sub_1DB3B2E10@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE758, (uint64_t)qword_1F02DB3B8, a1);
}

uint64_t sub_1DB3B2E2C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB3D0);
}

uint64_t sub_1DB3B2E4C()
{
  return sub_1DB3B2514(&qword_1F02DE760, (uint64_t)qword_1F02DB3D0);
}

uint64_t sub_1DB3B2E68@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE760, (uint64_t)qword_1F02DB3D0, a1);
}

uint64_t sub_1DB3B2E84(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB3E8);
}

uint64_t sub_1DB3B2EA4()
{
  return sub_1DB3B2514(&qword_1F02DE768, (uint64_t)qword_1F02DB3E8);
}

uint64_t sub_1DB3B2EC0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE768, (uint64_t)qword_1F02DB3E8, a1);
}

uint64_t sub_1DB3B2EDC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB400);
}

uint64_t sub_1DB3B2EFC()
{
  return sub_1DB3B2514(&qword_1F02DE770, (uint64_t)qword_1F02DB400);
}

uint64_t sub_1DB3B2F18@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE770, (uint64_t)qword_1F02DB400, a1);
}

uint64_t sub_1DB3B2F34(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB418);
}

uint64_t sub_1DB3B2F54()
{
  return sub_1DB3B2514(&qword_1F02DE778, (uint64_t)qword_1F02DB418);
}

uint64_t sub_1DB3B2F70@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE778, (uint64_t)qword_1F02DB418, a1);
}

uint64_t sub_1DB3B2F8C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB430);
}

uint64_t sub_1DB3B2FAC()
{
  return sub_1DB3B2514(&qword_1F02DE780, (uint64_t)qword_1F02DB430);
}

uint64_t sub_1DB3B2FC8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE780, (uint64_t)qword_1F02DB430, a1);
}

uint64_t sub_1DB3B2FE4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB448);
}

uint64_t sub_1DB3B3004()
{
  return sub_1DB3B2514(&qword_1F02DE788, (uint64_t)qword_1F02DB448);
}

uint64_t sub_1DB3B3020@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE788, (uint64_t)qword_1F02DB448, a1);
}

uint64_t sub_1DB3B303C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB460);
}

uint64_t sub_1DB3B305C()
{
  return sub_1DB3B2514(&qword_1F02DE790, (uint64_t)qword_1F02DB460);
}

uint64_t sub_1DB3B3078@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE790, (uint64_t)qword_1F02DB460, a1);
}

uint64_t sub_1DB3B3094(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB478);
}

uint64_t sub_1DB3B30B4()
{
  return sub_1DB3B2514(&qword_1F02DE798, (uint64_t)qword_1F02DB478);
}

uint64_t sub_1DB3B30D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE798, (uint64_t)qword_1F02DB478, a1);
}

uint64_t sub_1DB3B30EC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB490);
}

uint64_t sub_1DB3B310C()
{
  return sub_1DB3B2514(&qword_1F02DE7A0, (uint64_t)qword_1F02DB490);
}

uint64_t sub_1DB3B3128@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE7A0, (uint64_t)qword_1F02DB490, a1);
}

uint64_t sub_1DB3B3144(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB4A8);
}

uint64_t sub_1DB3B3164()
{
  return sub_1DB3B2514(&qword_1F02DE7A8, (uint64_t)qword_1F02DB4A8);
}

uint64_t sub_1DB3B3180@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE7A8, (uint64_t)qword_1F02DB4A8, a1);
}

uint64_t sub_1DB3B319C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB4C0);
}

uint64_t sub_1DB3B31C4()
{
  return sub_1DB3B2514(&qword_1F02DE7B0, (uint64_t)qword_1F02DB4C0);
}

uint64_t sub_1DB3B31E0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE7B0, (uint64_t)qword_1F02DB4C0, a1);
}

uint64_t sub_1DB3B31FC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB4D8);
}

uint64_t sub_1DB3B3218()
{
  return sub_1DB3B2514(&qword_1F02DE7B8, (uint64_t)qword_1F02DB4D8);
}

uint64_t sub_1DB3B3234@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE7B8, (uint64_t)qword_1F02DB4D8, a1);
}

uint64_t sub_1DB3B3250(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB4F0);
}

uint64_t sub_1DB3B326C()
{
  return sub_1DB3B2514(&qword_1F02DE7C0, (uint64_t)qword_1F02DB4F0);
}

uint64_t sub_1DB3B3288@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE7C0, (uint64_t)qword_1F02DB4F0, a1);
}

uint64_t sub_1DB3B32A4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB508);
}

uint64_t sub_1DB3B32C4()
{
  return sub_1DB3B2514(&qword_1F02DE7C8, (uint64_t)qword_1F02DB508);
}

uint64_t sub_1DB3B32E0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE7C8, (uint64_t)qword_1F02DB508, a1);
}

uint64_t sub_1DB3B32FC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB520);
}

uint64_t sub_1DB3B331C()
{
  return sub_1DB3B2514(&qword_1F02DE7D0, (uint64_t)qword_1F02DB520);
}

uint64_t sub_1DB3B3338@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE7D0, (uint64_t)qword_1F02DB520, a1);
}

uint64_t sub_1DB3B3354(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB538);
}

uint64_t sub_1DB3B3374()
{
  return sub_1DB3B2514(&qword_1F02DE7D8, (uint64_t)qword_1F02DB538);
}

uint64_t sub_1DB3B3390@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE7D8, (uint64_t)qword_1F02DB538, a1);
}

uint64_t sub_1DB3B33AC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB550);
}

uint64_t sub_1DB3B33CC()
{
  return sub_1DB3B2514(&qword_1F02DE7E0, (uint64_t)qword_1F02DB550);
}

uint64_t sub_1DB3B33E8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE7E0, (uint64_t)qword_1F02DB550, a1);
}

uint64_t sub_1DB3B3404(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB568);
}

uint64_t sub_1DB3B3424()
{
  return sub_1DB3B2514(&qword_1F02DE7E8, (uint64_t)qword_1F02DB568);
}

uint64_t sub_1DB3B3440@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE7E8, (uint64_t)qword_1F02DB568, a1);
}

uint64_t sub_1DB3B345C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB580);
}

uint64_t sub_1DB3B347C()
{
  return sub_1DB3B2514(&qword_1F02DE7F0, (uint64_t)qword_1F02DB580);
}

uint64_t sub_1DB3B3498@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE7F0, (uint64_t)qword_1F02DB580, a1);
}

uint64_t sub_1DB3B34B4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB598);
}

uint64_t sub_1DB3B34D4()
{
  return sub_1DB3B2514(&qword_1F02DE7F8, (uint64_t)qword_1F02DB598);
}

uint64_t sub_1DB3B34F0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE7F8, (uint64_t)qword_1F02DB598, a1);
}

uint64_t sub_1DB3B350C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB5B0);
}

uint64_t sub_1DB3B352C()
{
  return sub_1DB3B2514(&qword_1F02DE800, (uint64_t)qword_1F02DB5B0);
}

uint64_t sub_1DB3B3548@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE800, (uint64_t)qword_1F02DB5B0, a1);
}

uint64_t sub_1DB3B3564(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB5C8);
}

uint64_t sub_1DB3B3584()
{
  return sub_1DB3B2514(&qword_1F02DE808, (uint64_t)qword_1F02DB5C8);
}

uint64_t sub_1DB3B35A0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE808, (uint64_t)qword_1F02DB5C8, a1);
}

uint64_t sub_1DB3B35BC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB5E0);
}

uint64_t sub_1DB3B35DC()
{
  return sub_1DB3B2514(&qword_1F02DE810, (uint64_t)qword_1F02DB5E0);
}

uint64_t sub_1DB3B35F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE810, (uint64_t)qword_1F02DB5E0, a1);
}

uint64_t sub_1DB3B3614(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB5F8);
}

uint64_t sub_1DB3B3634()
{
  return sub_1DB3B2514(&qword_1F02DE818, (uint64_t)qword_1F02DB5F8);
}

uint64_t sub_1DB3B3650@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE818, (uint64_t)qword_1F02DB5F8, a1);
}

uint64_t sub_1DB3B366C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB610);
}

uint64_t sub_1DB3B368C()
{
  return sub_1DB3B2514(&qword_1F02DE820, (uint64_t)qword_1F02DB610);
}

uint64_t sub_1DB3B36A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE820, (uint64_t)qword_1F02DB610, a1);
}

uint64_t sub_1DB3B36C4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB628);
}

uint64_t sub_1DB3B36E4()
{
  return sub_1DB3B2514(&qword_1F02DE828, (uint64_t)qword_1F02DB628);
}

uint64_t sub_1DB3B3700@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE828, (uint64_t)qword_1F02DB628, a1);
}

uint64_t sub_1DB3B371C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB640);
}

uint64_t sub_1DB3B373C()
{
  return sub_1DB3B2514(&qword_1F02DE830, (uint64_t)qword_1F02DB640);
}

uint64_t sub_1DB3B3758@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE830, (uint64_t)qword_1F02DB640, a1);
}

uint64_t sub_1DB3B3774(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB658);
}

uint64_t sub_1DB3B3794()
{
  return sub_1DB3B2514(&qword_1F02DE838, (uint64_t)qword_1F02DB658);
}

uint64_t sub_1DB3B37B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE838, (uint64_t)qword_1F02DB658, a1);
}

uint64_t sub_1DB3B37CC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB670);
}

uint64_t sub_1DB3B37EC()
{
  return sub_1DB3B2514(&qword_1F02DE840, (uint64_t)qword_1F02DB670);
}

uint64_t sub_1DB3B3808@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE840, (uint64_t)qword_1F02DB670, a1);
}

uint64_t sub_1DB3B3824(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB688);
}

uint64_t sub_1DB3B3840()
{
  return sub_1DB3B2514(&qword_1F02DE848, (uint64_t)qword_1F02DB688);
}

uint64_t sub_1DB3B385C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE848, (uint64_t)qword_1F02DB688, a1);
}

uint64_t sub_1DB3B3878(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB6A0);
}

uint64_t sub_1DB3B3898()
{
  return sub_1DB3B2514(&qword_1F02DE850, (uint64_t)qword_1F02DB6A0);
}

uint64_t sub_1DB3B38B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE850, (uint64_t)qword_1F02DB6A0, a1);
}

uint64_t sub_1DB3B38D0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB6B8);
}

uint64_t sub_1DB3B38F0()
{
  return sub_1DB3B2514(&qword_1F02DE858, (uint64_t)qword_1F02DB6B8);
}

uint64_t sub_1DB3B390C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE858, (uint64_t)qword_1F02DB6B8, a1);
}

uint64_t sub_1DB3B3928(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB6D0);
}

uint64_t sub_1DB3B3948()
{
  return sub_1DB3B2514(&qword_1F02DE860, (uint64_t)qword_1F02DB6D0);
}

uint64_t sub_1DB3B3964@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE860, (uint64_t)qword_1F02DB6D0, a1);
}

uint64_t sub_1DB3B3980(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB6E8);
}

uint64_t sub_1DB3B39A0()
{
  return sub_1DB3B2514(&qword_1F02DE868, (uint64_t)qword_1F02DB6E8);
}

uint64_t sub_1DB3B39BC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE868, (uint64_t)qword_1F02DB6E8, a1);
}

uint64_t sub_1DB3B39D8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB700);
}

uint64_t sub_1DB3B39F4()
{
  return sub_1DB3B2514(&qword_1F02DE870, (uint64_t)qword_1F02DB700);
}

uint64_t sub_1DB3B3A10@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE870, (uint64_t)qword_1F02DB700, a1);
}

uint64_t sub_1DB3B3A2C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB718);
}

uint64_t sub_1DB3B3A48()
{
  return sub_1DB3B2514(&qword_1F02DE878, (uint64_t)qword_1F02DB718);
}

uint64_t sub_1DB3B3A64@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE878, (uint64_t)qword_1F02DB718, a1);
}

uint64_t sub_1DB3B3A80(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB730);
}

uint64_t sub_1DB3B3A9C()
{
  return sub_1DB3B2514(&qword_1F02DE880, (uint64_t)qword_1F02DB730);
}

uint64_t sub_1DB3B3AB8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE880, (uint64_t)qword_1F02DB730, a1);
}

uint64_t sub_1DB3B3AD4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB748);
}

uint64_t sub_1DB3B3AF4()
{
  return sub_1DB3B2514(&qword_1F02DE888, (uint64_t)qword_1F02DB748);
}

uint64_t sub_1DB3B3B10@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE888, (uint64_t)qword_1F02DB748, a1);
}

uint64_t sub_1DB3B3B2C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB760);
}

uint64_t sub_1DB3B3B4C()
{
  return sub_1DB3B2514(&qword_1F02DE890, (uint64_t)qword_1F02DB760);
}

uint64_t sub_1DB3B3B68@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE890, (uint64_t)qword_1F02DB760, a1);
}

uint64_t sub_1DB3B3B84(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB778);
}

uint64_t sub_1DB3B3BAC()
{
  return sub_1DB3B2514(&qword_1F02DE898, (uint64_t)qword_1F02DB778);
}

uint64_t sub_1DB3B3BC8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE898, (uint64_t)qword_1F02DB778, a1);
}

uint64_t sub_1DB3B3BE4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB790);
}

uint64_t sub_1DB3B3C00()
{
  return sub_1DB3B2514(&qword_1F02DE8A0, (uint64_t)qword_1F02DB790);
}

uint64_t sub_1DB3B3C1C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE8A0, (uint64_t)qword_1F02DB790, a1);
}

uint64_t sub_1DB3B3C38(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB7A8);
}

uint64_t sub_1DB3B3C54()
{
  return sub_1DB3B2514(&qword_1F02DE8A8, (uint64_t)qword_1F02DB7A8);
}

uint64_t sub_1DB3B3C70@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE8A8, (uint64_t)qword_1F02DB7A8, a1);
}

uint64_t sub_1DB3B3C8C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB7C0);
}

uint64_t sub_1DB3B3CA8()
{
  return sub_1DB3B2514(&qword_1F02DE8B0, (uint64_t)qword_1F02DB7C0);
}

uint64_t sub_1DB3B3CC4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE8B0, (uint64_t)qword_1F02DB7C0, a1);
}

uint64_t sub_1DB3B3CE0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB7D8);
}

uint64_t sub_1DB3B3D08()
{
  return sub_1DB3B2514(&qword_1F02DE8B8, (uint64_t)qword_1F02DB7D8);
}

uint64_t sub_1DB3B3D24@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE8B8, (uint64_t)qword_1F02DB7D8, a1);
}

uint64_t sub_1DB3B3D40(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB7F0);
}

uint64_t sub_1DB3B3D5C()
{
  return sub_1DB3B2514(&qword_1F02DE8C0, (uint64_t)qword_1F02DB7F0);
}

uint64_t sub_1DB3B3D78@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE8C0, (uint64_t)qword_1F02DB7F0, a1);
}

uint64_t sub_1DB3B3D94(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB808);
}

uint64_t sub_1DB3B3DB4()
{
  return sub_1DB3B2514(&qword_1F02DE8C8, (uint64_t)qword_1F02DB808);
}

uint64_t sub_1DB3B3DD0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE8C8, (uint64_t)qword_1F02DB808, a1);
}

uint64_t sub_1DB3B3DEC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB820);
}

uint64_t sub_1DB3B3E0C()
{
  return sub_1DB3B2514(&qword_1F02DE8D0, (uint64_t)qword_1F02DB820);
}

uint64_t sub_1DB3B3E28@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE8D0, (uint64_t)qword_1F02DB820, a1);
}

uint64_t sub_1DB3B3E44(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB838);
}

uint64_t sub_1DB3B3E64()
{
  return sub_1DB3B2514(&qword_1F02DE8D8, (uint64_t)qword_1F02DB838);
}

uint64_t sub_1DB3B3E80@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE8D8, (uint64_t)qword_1F02DB838, a1);
}

uint64_t sub_1DB3B3E9C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB850);
}

uint64_t sub_1DB3B3EC4()
{
  return sub_1DB3B2514(&qword_1F02DE8E0, (uint64_t)qword_1F02DB850);
}

uint64_t sub_1DB3B3EE0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE8E0, (uint64_t)qword_1F02DB850, a1);
}

uint64_t sub_1DB3B3EFC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB868);
}

uint64_t sub_1DB3B3F18()
{
  return sub_1DB3B2514(&qword_1F02DE8E8, (uint64_t)qword_1F02DB868);
}

uint64_t sub_1DB3B3F34@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE8E8, (uint64_t)qword_1F02DB868, a1);
}

uint64_t sub_1DB3B3F50(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB880);
}

uint64_t sub_1DB3B3F70()
{
  return sub_1DB3B2514(&qword_1F02DE8F0, (uint64_t)qword_1F02DB880);
}

uint64_t sub_1DB3B3F8C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE8F0, (uint64_t)qword_1F02DB880, a1);
}

uint64_t sub_1DB3B3FA8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB898);
}

uint64_t sub_1DB3B3FC8()
{
  return sub_1DB3B2514(&qword_1F02DE8F8, (uint64_t)qword_1F02DB898);
}

uint64_t sub_1DB3B3FE4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE8F8, (uint64_t)qword_1F02DB898, a1);
}

uint64_t sub_1DB3B4000(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB8B0);
}

uint64_t sub_1DB3B4020()
{
  return sub_1DB3B2514(&qword_1F02DE900, (uint64_t)qword_1F02DB8B0);
}

uint64_t sub_1DB3B403C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE900, (uint64_t)qword_1F02DB8B0, a1);
}

uint64_t sub_1DB3B4058(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB8C8);
}

uint64_t sub_1DB3B4078()
{
  return sub_1DB3B2514(&qword_1F02DE908, (uint64_t)qword_1F02DB8C8);
}

uint64_t sub_1DB3B4094@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE908, (uint64_t)qword_1F02DB8C8, a1);
}

uint64_t sub_1DB3B40B0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB8E0);
}

uint64_t sub_1DB3B40D0()
{
  return sub_1DB3B2514(&qword_1F02DE910, (uint64_t)qword_1F02DB8E0);
}

uint64_t sub_1DB3B40EC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE910, (uint64_t)qword_1F02DB8E0, a1);
}

uint64_t sub_1DB3B4108(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB8F8);
}

uint64_t sub_1DB3B4130()
{
  return sub_1DB3B2514(&qword_1F02DE918, (uint64_t)qword_1F02DB8F8);
}

uint64_t sub_1DB3B414C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE918, (uint64_t)qword_1F02DB8F8, a1);
}

uint64_t sub_1DB3B4168(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB910);
}

uint64_t sub_1DB3B4184()
{
  return sub_1DB3B2514(&qword_1F02DE920, (uint64_t)qword_1F02DB910);
}

uint64_t sub_1DB3B41A0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE920, (uint64_t)qword_1F02DB910, a1);
}

uint64_t sub_1DB3B41BC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB928);
}

uint64_t sub_1DB3B41D8()
{
  return sub_1DB3B2514(&qword_1F02DE928, (uint64_t)qword_1F02DB928);
}

uint64_t sub_1DB3B41F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE928, (uint64_t)qword_1F02DB928, a1);
}

uint64_t sub_1DB3B4210(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB940);
}

uint64_t sub_1DB3B422C()
{
  return sub_1DB3B2514(&qword_1F02DE930, (uint64_t)qword_1F02DB940);
}

uint64_t sub_1DB3B4248@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE930, (uint64_t)qword_1F02DB940, a1);
}

uint64_t sub_1DB3B4264(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB958);
}

uint64_t sub_1DB3B4284()
{
  return sub_1DB3B2514(&qword_1F02DE938, (uint64_t)qword_1F02DB958);
}

uint64_t sub_1DB3B42A0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE938, (uint64_t)qword_1F02DB958, a1);
}

uint64_t sub_1DB3B42BC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB970);
}

uint64_t sub_1DB3B42DC()
{
  return sub_1DB3B2514(&qword_1F02DE940, (uint64_t)qword_1F02DB970);
}

uint64_t sub_1DB3B42F8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE940, (uint64_t)qword_1F02DB970, a1);
}

uint64_t sub_1DB3B4314(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB988);
}

uint64_t sub_1DB3B4330()
{
  return sub_1DB3B2514(&qword_1F02DE948, (uint64_t)qword_1F02DB988);
}

uint64_t sub_1DB3B434C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE948, (uint64_t)qword_1F02DB988, a1);
}

uint64_t sub_1DB3B4368(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB9A0);
}

uint64_t sub_1DB3B4388()
{
  return sub_1DB3B2514(&qword_1F02DE950, (uint64_t)qword_1F02DB9A0);
}

uint64_t sub_1DB3B43A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE950, (uint64_t)qword_1F02DB9A0, a1);
}

uint64_t sub_1DB3B43C0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB9B8);
}

uint64_t sub_1DB3B43E0()
{
  return sub_1DB3B2514(&qword_1F02DE958, (uint64_t)qword_1F02DB9B8);
}

uint64_t sub_1DB3B43FC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE958, (uint64_t)qword_1F02DB9B8, a1);
}

uint64_t sub_1DB3B4418(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB9D0);
}

uint64_t sub_1DB3B4438()
{
  return sub_1DB3B2514(&qword_1F02DE960, (uint64_t)qword_1F02DB9D0);
}

uint64_t sub_1DB3B4454@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE960, (uint64_t)qword_1F02DB9D0, a1);
}

uint64_t sub_1DB3B4470(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DB9E8);
}

uint64_t sub_1DB3B4490()
{
  return sub_1DB3B2514(&qword_1F02DE968, (uint64_t)qword_1F02DB9E8);
}

uint64_t sub_1DB3B44AC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE968, (uint64_t)qword_1F02DB9E8, a1);
}

uint64_t sub_1DB3B44C8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBA00);
}

uint64_t sub_1DB3B44E8()
{
  return sub_1DB3B2514(&qword_1F02DE970, (uint64_t)qword_1F02DBA00);
}

uint64_t sub_1DB3B4504@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE970, (uint64_t)qword_1F02DBA00, a1);
}

uint64_t sub_1DB3B4520(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBA18);
}

uint64_t sub_1DB3B4540()
{
  return sub_1DB3B2514(&qword_1F02DE978, (uint64_t)qword_1F02DBA18);
}

uint64_t sub_1DB3B455C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE978, (uint64_t)qword_1F02DBA18, a1);
}

uint64_t sub_1DB3B4578(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBA30);
}

uint64_t sub_1DB3B4598()
{
  return sub_1DB3B2514(&qword_1F02DE980, (uint64_t)qword_1F02DBA30);
}

uint64_t sub_1DB3B45B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE980, (uint64_t)qword_1F02DBA30, a1);
}

uint64_t sub_1DB3B45D0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBA48);
}

uint64_t sub_1DB3B45F8()
{
  return sub_1DB3B2514(&qword_1F02DE988, (uint64_t)qword_1F02DBA48);
}

uint64_t sub_1DB3B4614@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE988, (uint64_t)qword_1F02DBA48, a1);
}

uint64_t sub_1DB3B4630(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBA60);
}

uint64_t sub_1DB3B4658()
{
  return sub_1DB3B2514(&qword_1F02DE990, (uint64_t)qword_1F02DBA60);
}

uint64_t sub_1DB3B4674@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE990, (uint64_t)qword_1F02DBA60, a1);
}

uint64_t sub_1DB3B4690(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBA78);
}

uint64_t sub_1DB3B46B8()
{
  return sub_1DB3B2514(&qword_1F02DE998, (uint64_t)qword_1F02DBA78);
}

uint64_t sub_1DB3B46D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE998, (uint64_t)qword_1F02DBA78, a1);
}

uint64_t sub_1DB3B46F0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBA90);
}

uint64_t sub_1DB3B4718()
{
  return sub_1DB3B2514(&qword_1F02DE9A0, (uint64_t)qword_1F02DBA90);
}

uint64_t sub_1DB3B4734@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE9A0, (uint64_t)qword_1F02DBA90, a1);
}

uint64_t sub_1DB3B4750(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBAA8);
}

uint64_t sub_1DB3B4778()
{
  return sub_1DB3B2514(&qword_1F02DE9A8, (uint64_t)qword_1F02DBAA8);
}

uint64_t sub_1DB3B4794@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE9A8, (uint64_t)qword_1F02DBAA8, a1);
}

uint64_t sub_1DB3B47B0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBAC0);
}

uint64_t sub_1DB3B47D8()
{
  return sub_1DB3B2514(&qword_1F02DE9B0, (uint64_t)qword_1F02DBAC0);
}

uint64_t sub_1DB3B47F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE9B0, (uint64_t)qword_1F02DBAC0, a1);
}

uint64_t sub_1DB3B4810(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBAD8);
}

uint64_t sub_1DB3B4838()
{
  return sub_1DB3B2514(&qword_1F02DE9B8, (uint64_t)qword_1F02DBAD8);
}

uint64_t sub_1DB3B4854@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE9B8, (uint64_t)qword_1F02DBAD8, a1);
}

uint64_t sub_1DB3B4870(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBAF0);
}

uint64_t sub_1DB3B4898()
{
  return sub_1DB3B2514(&qword_1F02DE9C0, (uint64_t)qword_1F02DBAF0);
}

uint64_t sub_1DB3B48B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE9C0, (uint64_t)qword_1F02DBAF0, a1);
}

uint64_t sub_1DB3B48D0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBB08);
}

uint64_t sub_1DB3B48F8()
{
  return sub_1DB3B2514(&qword_1F02DE9C8, (uint64_t)qword_1F02DBB08);
}

uint64_t sub_1DB3B4914@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE9C8, (uint64_t)qword_1F02DBB08, a1);
}

uint64_t sub_1DB3B4930(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBB20);
}

uint64_t sub_1DB3B4954()
{
  return sub_1DB3B2514(&qword_1F02DE9D0, (uint64_t)qword_1F02DBB20);
}

uint64_t sub_1DB3B4970@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE9D0, (uint64_t)qword_1F02DBB20, a1);
}

uint64_t sub_1DB3B498C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBB38);
}

uint64_t sub_1DB3B49B4()
{
  return sub_1DB3B2514(&qword_1F02DE9D8, (uint64_t)qword_1F02DBB38);
}

uint64_t sub_1DB3B49D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE9D8, (uint64_t)qword_1F02DBB38, a1);
}

uint64_t sub_1DB3B49EC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBB50);
}

uint64_t sub_1DB3B4A14()
{
  return sub_1DB3B2514(&qword_1F02DE9E0, (uint64_t)qword_1F02DBB50);
}

uint64_t sub_1DB3B4A30@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE9E0, (uint64_t)qword_1F02DBB50, a1);
}

uint64_t sub_1DB3B4A4C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBB68);
}

uint64_t sub_1DB3B4A78()
{
  return sub_1DB3B2514(&qword_1F02DE9E8, (uint64_t)qword_1F02DBB68);
}

uint64_t sub_1DB3B4A94@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE9E8, (uint64_t)qword_1F02DBB68, a1);
}

uint64_t sub_1DB3B4AB0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBB80);
}

uint64_t sub_1DB3B4ADC()
{
  return sub_1DB3B2514(&qword_1F02DE9F0, (uint64_t)qword_1F02DBB80);
}

uint64_t sub_1DB3B4AF8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE9F0, (uint64_t)qword_1F02DBB80, a1);
}

uint64_t sub_1DB3B4B14(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBB98);
}

uint64_t sub_1DB3B4B3C()
{
  return sub_1DB3B2514(&qword_1F02DE9F8, (uint64_t)qword_1F02DBB98);
}

uint64_t sub_1DB3B4B58@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DE9F8, (uint64_t)qword_1F02DBB98, a1);
}

uint64_t sub_1DB3B4B74(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBBB0);
}

uint64_t sub_1DB3B4B9C()
{
  return sub_1DB3B2514(&qword_1F02DEA00, (uint64_t)qword_1F02DBBB0);
}

uint64_t sub_1DB3B4BB8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA00, (uint64_t)qword_1F02DBBB0, a1);
}

uint64_t sub_1DB3B4BD4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBBC8);
}

uint64_t sub_1DB3B4BFC()
{
  return sub_1DB3B2514(&qword_1F02DEA08, (uint64_t)qword_1F02DBBC8);
}

uint64_t sub_1DB3B4C18@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA08, (uint64_t)qword_1F02DBBC8, a1);
}

uint64_t sub_1DB3B4C34(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBBE0);
}

uint64_t sub_1DB3B4C5C()
{
  return sub_1DB3B2514(&qword_1F02DEA10, (uint64_t)qword_1F02DBBE0);
}

uint64_t sub_1DB3B4C78@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA10, (uint64_t)qword_1F02DBBE0, a1);
}

uint64_t sub_1DB3B4C94(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBBF8);
}

uint64_t sub_1DB3B4CB8()
{
  return sub_1DB3B2514(&qword_1F02DEA18, (uint64_t)qword_1F02DBBF8);
}

uint64_t sub_1DB3B4CD4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA18, (uint64_t)qword_1F02DBBF8, a1);
}

uint64_t sub_1DB3B4CF0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBC10);
}

uint64_t sub_1DB3B4D18()
{
  return sub_1DB3B2514(&qword_1F02DEA20, (uint64_t)qword_1F02DBC10);
}

uint64_t sub_1DB3B4D34@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA20, (uint64_t)qword_1F02DBC10, a1);
}

uint64_t sub_1DB3B4D50(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBC28);
}

uint64_t sub_1DB3B4D78()
{
  return sub_1DB3B2514(&qword_1F02DEA28, (uint64_t)qword_1F02DBC28);
}

uint64_t sub_1DB3B4D94@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA28, (uint64_t)qword_1F02DBC28, a1);
}

uint64_t sub_1DB3B4DB0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBC40);
}

uint64_t sub_1DB3B4DD8()
{
  return sub_1DB3B2514(&qword_1F02DEA30, (uint64_t)qword_1F02DBC40);
}

uint64_t sub_1DB3B4DF4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA30, (uint64_t)qword_1F02DBC40, a1);
}

uint64_t sub_1DB3B4E10(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBC58);
}

uint64_t sub_1DB3B4E38()
{
  return sub_1DB3B2514(&qword_1F02DEA38, (uint64_t)qword_1F02DBC58);
}

uint64_t sub_1DB3B4E54@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA38, (uint64_t)qword_1F02DBC58, a1);
}

uint64_t sub_1DB3B4E70(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBC70);
}

uint64_t sub_1DB3B4E98()
{
  return sub_1DB3B2514(&qword_1F02DEA40, (uint64_t)qword_1F02DBC70);
}

uint64_t sub_1DB3B4EB4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA40, (uint64_t)qword_1F02DBC70, a1);
}

uint64_t sub_1DB3B4ED0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBC88);
}

uint64_t sub_1DB3B4EF8()
{
  return sub_1DB3B2514(&qword_1F02DEA48, (uint64_t)qword_1F02DBC88);
}

uint64_t sub_1DB3B4F14@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA48, (uint64_t)qword_1F02DBC88, a1);
}

uint64_t sub_1DB3B4F30(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBCA0);
}

uint64_t sub_1DB3B4F58()
{
  return sub_1DB3B2514(&qword_1F02DEA50, (uint64_t)qword_1F02DBCA0);
}

uint64_t sub_1DB3B4F74@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA50, (uint64_t)qword_1F02DBCA0, a1);
}

uint64_t sub_1DB3B4F90(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBCB8);
}

uint64_t sub_1DB3B4FB4()
{
  return sub_1DB3B2514(&qword_1F02DEA58, (uint64_t)qword_1F02DBCB8);
}

uint64_t sub_1DB3B4FD0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA58, (uint64_t)qword_1F02DBCB8, a1);
}

uint64_t sub_1DB3B4FEC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBCD0);
}

uint64_t sub_1DB3B5008()
{
  return sub_1DB3B2514(&qword_1F02DEA60, (uint64_t)qword_1F02DBCD0);
}

uint64_t sub_1DB3B5024@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA60, (uint64_t)qword_1F02DBCD0, a1);
}

uint64_t sub_1DB3B5040(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBCE8);
}

uint64_t sub_1DB3B505C()
{
  return sub_1DB3B2514(&qword_1F02DEA68, (uint64_t)qword_1F02DBCE8);
}

uint64_t sub_1DB3B5078@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA68, (uint64_t)qword_1F02DBCE8, a1);
}

uint64_t sub_1DB3B5094(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBD00);
}

uint64_t sub_1DB3B50B0()
{
  return sub_1DB3B2514(&qword_1F02DEA70, (uint64_t)qword_1F02DBD00);
}

uint64_t sub_1DB3B50CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA70, (uint64_t)qword_1F02DBD00, a1);
}

uint64_t sub_1DB3B50E8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBD18);
}

uint64_t sub_1DB3B5104()
{
  return sub_1DB3B2514(&qword_1F02DEA78, (uint64_t)qword_1F02DBD18);
}

uint64_t sub_1DB3B5120@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA78, (uint64_t)qword_1F02DBD18, a1);
}

uint64_t sub_1DB3B513C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBD30);
}

uint64_t sub_1DB3B5158()
{
  return sub_1DB3B2514(&qword_1F02DEA80, (uint64_t)qword_1F02DBD30);
}

uint64_t sub_1DB3B5174@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA80, (uint64_t)qword_1F02DBD30, a1);
}

uint64_t sub_1DB3B5190(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBD48);
}

uint64_t sub_1DB3B51AC()
{
  return sub_1DB3B2514(&qword_1F02DEA88, (uint64_t)qword_1F02DBD48);
}

uint64_t sub_1DB3B51C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA88, (uint64_t)qword_1F02DBD48, a1);
}

uint64_t sub_1DB3B51E4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBD60);
}

uint64_t sub_1DB3B5200()
{
  return sub_1DB3B2514(&qword_1F02DEA90, (uint64_t)qword_1F02DBD60);
}

uint64_t sub_1DB3B521C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA90, (uint64_t)qword_1F02DBD60, a1);
}

uint64_t sub_1DB3B5238(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBD78);
}

uint64_t sub_1DB3B5260()
{
  return sub_1DB3B2514(&qword_1F02DEA98, (uint64_t)qword_1F02DBD78);
}

uint64_t sub_1DB3B527C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEA98, (uint64_t)qword_1F02DBD78, a1);
}

uint64_t sub_1DB3B5298(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBD90);
}

uint64_t sub_1DB3B52C0()
{
  return sub_1DB3B2514(&qword_1F02DEAA0, (uint64_t)qword_1F02DBD90);
}

uint64_t sub_1DB3B52DC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEAA0, (uint64_t)qword_1F02DBD90, a1);
}

uint64_t sub_1DB3B52F8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBDA8);
}

uint64_t sub_1DB3B5320()
{
  return sub_1DB3B2514(&qword_1F02DEAA8, (uint64_t)qword_1F02DBDA8);
}

uint64_t sub_1DB3B533C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEAA8, (uint64_t)qword_1F02DBDA8, a1);
}

uint64_t sub_1DB3B5358(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBDC0);
}

uint64_t sub_1DB3B5380()
{
  return sub_1DB3B2514(&qword_1F02DEAB0, (uint64_t)qword_1F02DBDC0);
}

uint64_t sub_1DB3B539C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEAB0, (uint64_t)qword_1F02DBDC0, a1);
}

uint64_t sub_1DB3B53B8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBDD8);
}

uint64_t sub_1DB3B53E0()
{
  return sub_1DB3B2514(&qword_1F02DEAB8, (uint64_t)qword_1F02DBDD8);
}

uint64_t sub_1DB3B53FC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEAB8, (uint64_t)qword_1F02DBDD8, a1);
}

uint64_t sub_1DB3B5418(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBDF0);
}

uint64_t sub_1DB3B5440()
{
  return sub_1DB3B2514(&qword_1F02DEAC0, (uint64_t)qword_1F02DBDF0);
}

uint64_t sub_1DB3B545C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEAC0, (uint64_t)qword_1F02DBDF0, a1);
}

uint64_t sub_1DB3B5478(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBE08);
}

uint64_t sub_1DB3B54A0()
{
  return sub_1DB3B2514(&qword_1F02DEAC8, (uint64_t)qword_1F02DBE08);
}

uint64_t sub_1DB3B54BC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEAC8, (uint64_t)qword_1F02DBE08, a1);
}

uint64_t sub_1DB3B54D8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBE20);
}

uint64_t sub_1DB3B5500()
{
  return sub_1DB3B2514(&qword_1F02DEAD0, (uint64_t)qword_1F02DBE20);
}

uint64_t sub_1DB3B551C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEAD0, (uint64_t)qword_1F02DBE20, a1);
}

uint64_t sub_1DB3B5538(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBE38);
}

uint64_t sub_1DB3B5560()
{
  return sub_1DB3B2514(&qword_1F02DEAD8, (uint64_t)qword_1F02DBE38);
}

uint64_t sub_1DB3B557C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEAD8, (uint64_t)qword_1F02DBE38, a1);
}

uint64_t sub_1DB3B5598(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBE50);
}

uint64_t sub_1DB3B55B4()
{
  return sub_1DB3B2514(&qword_1F02DEAE0, (uint64_t)qword_1F02DBE50);
}

uint64_t sub_1DB3B55D0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEAE0, (uint64_t)qword_1F02DBE50, a1);
}

uint64_t sub_1DB3B55EC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBE68);
}

uint64_t sub_1DB3B5608()
{
  return sub_1DB3B2514(&qword_1F02DEAE8, (uint64_t)qword_1F02DBE68);
}

uint64_t sub_1DB3B5624@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEAE8, (uint64_t)qword_1F02DBE68, a1);
}

uint64_t sub_1DB3B5640(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBE80);
}

uint64_t sub_1DB3B565C()
{
  return sub_1DB3B2514(&qword_1F02DEAF0, (uint64_t)qword_1F02DBE80);
}

uint64_t sub_1DB3B5678@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEAF0, (uint64_t)qword_1F02DBE80, a1);
}

uint64_t sub_1DB3B5694(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBE98);
}

uint64_t sub_1DB3B56B0()
{
  return sub_1DB3B2514(&qword_1F02DEAF8, (uint64_t)qword_1F02DBE98);
}

uint64_t sub_1DB3B56CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEAF8, (uint64_t)qword_1F02DBE98, a1);
}

uint64_t sub_1DB3B56E8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBEB0);
}

uint64_t sub_1DB3B5704()
{
  return sub_1DB3B2514(&qword_1F02DEB00, (uint64_t)qword_1F02DBEB0);
}

uint64_t sub_1DB3B5720@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB00, (uint64_t)qword_1F02DBEB0, a1);
}

uint64_t sub_1DB3B573C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBEC8);
}

uint64_t sub_1DB3B5758()
{
  return sub_1DB3B2514(&qword_1F02DEB08, (uint64_t)qword_1F02DBEC8);
}

uint64_t sub_1DB3B5774@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB08, (uint64_t)qword_1F02DBEC8, a1);
}

uint64_t sub_1DB3B5790(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBEE0);
}

uint64_t sub_1DB3B57B8()
{
  return sub_1DB3B2514(&qword_1F02DEB10, (uint64_t)qword_1F02DBEE0);
}

uint64_t sub_1DB3B57D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB10, (uint64_t)qword_1F02DBEE0, a1);
}

uint64_t sub_1DB3B57F0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBEF8);
}

uint64_t sub_1DB3B5818()
{
  return sub_1DB3B2514(&qword_1F02DEB18, (uint64_t)qword_1F02DBEF8);
}

uint64_t sub_1DB3B5834@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB18, (uint64_t)qword_1F02DBEF8, a1);
}

uint64_t sub_1DB3B5850(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBF10);
}

uint64_t sub_1DB3B5878()
{
  return sub_1DB3B2514(&qword_1F02DEB20, (uint64_t)qword_1F02DBF10);
}

uint64_t sub_1DB3B5894@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB20, (uint64_t)qword_1F02DBF10, a1);
}

uint64_t sub_1DB3B58B0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBF28);
}

uint64_t sub_1DB3B58D8()
{
  return sub_1DB3B2514(&qword_1F02DEB28, (uint64_t)qword_1F02DBF28);
}

uint64_t sub_1DB3B58F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB28, (uint64_t)qword_1F02DBF28, a1);
}

uint64_t sub_1DB3B5910(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBF40);
}

uint64_t sub_1DB3B5938()
{
  return sub_1DB3B2514(&qword_1F02DEB30, (uint64_t)qword_1F02DBF40);
}

uint64_t sub_1DB3B5954@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB30, (uint64_t)qword_1F02DBF40, a1);
}

uint64_t sub_1DB3B5970(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBF58);
}

uint64_t sub_1DB3B5998()
{
  return sub_1DB3B2514(&qword_1F02DEB38, (uint64_t)qword_1F02DBF58);
}

uint64_t sub_1DB3B59B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB38, (uint64_t)qword_1F02DBF58, a1);
}

uint64_t sub_1DB3B59D0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBF70);
}

uint64_t sub_1DB3B59F8()
{
  return sub_1DB3B2514(&qword_1F02DEB40, (uint64_t)qword_1F02DBF70);
}

uint64_t sub_1DB3B5A14@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB40, (uint64_t)qword_1F02DBF70, a1);
}

uint64_t sub_1DB3B5A30(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBF88);
}

uint64_t sub_1DB3B5A58()
{
  return sub_1DB3B2514(&qword_1F02DEB48, (uint64_t)qword_1F02DBF88);
}

uint64_t sub_1DB3B5A74@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB48, (uint64_t)qword_1F02DBF88, a1);
}

uint64_t sub_1DB3B5A90(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBFA0);
}

uint64_t sub_1DB3B5AB8()
{
  return sub_1DB3B2514(&qword_1F02DEB50, (uint64_t)qword_1F02DBFA0);
}

uint64_t sub_1DB3B5AD4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB50, (uint64_t)qword_1F02DBFA0, a1);
}

uint64_t sub_1DB3B5AF0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBFB8);
}

uint64_t sub_1DB3B5B18()
{
  return sub_1DB3B2514(&qword_1F02DEB58, (uint64_t)qword_1F02DBFB8);
}

uint64_t sub_1DB3B5B34@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB58, (uint64_t)qword_1F02DBFB8, a1);
}

uint64_t sub_1DB3B5B50(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBFD0);
}

uint64_t sub_1DB3B5B74()
{
  return sub_1DB3B2514(&qword_1F02DEB60, (uint64_t)qword_1F02DBFD0);
}

uint64_t sub_1DB3B5B90@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB60, (uint64_t)qword_1F02DBFD0, a1);
}

uint64_t sub_1DB3B5BAC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DBFE8);
}

uint64_t sub_1DB3B5BD4()
{
  return sub_1DB3B2514(&qword_1F02DEB68, (uint64_t)qword_1F02DBFE8);
}

uint64_t sub_1DB3B5BF0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB68, (uint64_t)qword_1F02DBFE8, a1);
}

uint64_t sub_1DB3B5C0C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC000);
}

uint64_t sub_1DB3B5C34()
{
  return sub_1DB3B2514(&qword_1F02DEB70, (uint64_t)qword_1F02DC000);
}

uint64_t sub_1DB3B5C50@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB70, (uint64_t)qword_1F02DC000, a1);
}

uint64_t sub_1DB3B5C6C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC018);
}

uint64_t sub_1DB3B5C94()
{
  return sub_1DB3B2514(&qword_1F02DEB78, (uint64_t)qword_1F02DC018);
}

uint64_t sub_1DB3B5CB0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB78, (uint64_t)qword_1F02DC018, a1);
}

uint64_t sub_1DB3B5CCC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC030);
}

uint64_t sub_1DB3B5CF4()
{
  return sub_1DB3B2514(&qword_1F02DEB80, (uint64_t)qword_1F02DC030);
}

uint64_t sub_1DB3B5D10@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB80, (uint64_t)qword_1F02DC030, a1);
}

uint64_t sub_1DB3B5D2C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC048);
}

uint64_t sub_1DB3B5D54()
{
  return sub_1DB3B2514(&qword_1F02DEB88, (uint64_t)qword_1F02DC048);
}

uint64_t sub_1DB3B5D70@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB88, (uint64_t)qword_1F02DC048, a1);
}

uint64_t sub_1DB3B5D8C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC060);
}

uint64_t sub_1DB3B5DB4()
{
  return sub_1DB3B2514(&qword_1F02DEB90, (uint64_t)qword_1F02DC060);
}

uint64_t sub_1DB3B5DD0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB90, (uint64_t)qword_1F02DC060, a1);
}

uint64_t sub_1DB3B5DEC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC078);
}

uint64_t sub_1DB3B5E14()
{
  return sub_1DB3B2514(&qword_1F02DEB98, (uint64_t)qword_1F02DC078);
}

uint64_t sub_1DB3B5E30@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEB98, (uint64_t)qword_1F02DC078, a1);
}

uint64_t sub_1DB3B5E4C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC090);
}

uint64_t sub_1DB3B5E74()
{
  return sub_1DB3B2514(&qword_1F02DEBA0, (uint64_t)qword_1F02DC090);
}

uint64_t sub_1DB3B5E90@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEBA0, (uint64_t)qword_1F02DC090, a1);
}

uint64_t sub_1DB3B5EAC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC0A8);
}

uint64_t sub_1DB3B5ED4()
{
  return sub_1DB3B2514(&qword_1F02DEBA8, (uint64_t)qword_1F02DC0A8);
}

uint64_t sub_1DB3B5EF0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEBA8, (uint64_t)qword_1F02DC0A8, a1);
}

uint64_t sub_1DB3B5F0C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC0C0);
}

uint64_t sub_1DB3B5F34()
{
  return sub_1DB3B2514(&qword_1F02DEBB0, (uint64_t)qword_1F02DC0C0);
}

uint64_t sub_1DB3B5F50@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEBB0, (uint64_t)qword_1F02DC0C0, a1);
}

uint64_t sub_1DB3B5F6C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC0D8);
}

uint64_t sub_1DB3B5F90()
{
  return sub_1DB3B2514(&qword_1F02DEBB8, (uint64_t)qword_1F02DC0D8);
}

uint64_t sub_1DB3B5FAC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEBB8, (uint64_t)qword_1F02DC0D8, a1);
}

uint64_t sub_1DB3B5FC8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC0F0);
}

uint64_t sub_1DB3B5FF0()
{
  return sub_1DB3B2514(&qword_1F02DEBC0, (uint64_t)qword_1F02DC0F0);
}

uint64_t sub_1DB3B600C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEBC0, (uint64_t)qword_1F02DC0F0, a1);
}

uint64_t sub_1DB3B6028(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC108);
}

uint64_t sub_1DB3B6050()
{
  return sub_1DB3B2514(&qword_1F02DEBC8, (uint64_t)qword_1F02DC108);
}

uint64_t sub_1DB3B606C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEBC8, (uint64_t)qword_1F02DC108, a1);
}

uint64_t sub_1DB3B6088(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC120);
}

uint64_t sub_1DB3B60B0()
{
  return sub_1DB3B2514(&qword_1F02DEBD0, (uint64_t)qword_1F02DC120);
}

uint64_t sub_1DB3B60CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEBD0, (uint64_t)qword_1F02DC120, a1);
}

uint64_t sub_1DB3B60E8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC138);
}

uint64_t sub_1DB3B6110()
{
  return sub_1DB3B2514(&qword_1F02DEBD8, (uint64_t)qword_1F02DC138);
}

uint64_t sub_1DB3B612C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEBD8, (uint64_t)qword_1F02DC138, a1);
}

uint64_t sub_1DB3B6148(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC150);
}

uint64_t sub_1DB3B6170()
{
  return sub_1DB3B2514(&qword_1F02DEBE0, (uint64_t)qword_1F02DC150);
}

uint64_t sub_1DB3B618C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEBE0, (uint64_t)qword_1F02DC150, a1);
}

uint64_t sub_1DB3B61A8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC168);
}

uint64_t sub_1DB3B61D0()
{
  return sub_1DB3B2514(&qword_1F02DEBE8, (uint64_t)qword_1F02DC168);
}

uint64_t sub_1DB3B61EC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEBE8, (uint64_t)qword_1F02DC168, a1);
}

uint64_t sub_1DB3B6208(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC180);
}

uint64_t sub_1DB3B6230()
{
  return sub_1DB3B2514(&qword_1F02DEBF0, (uint64_t)qword_1F02DC180);
}

uint64_t sub_1DB3B624C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEBF0, (uint64_t)qword_1F02DC180, a1);
}

uint64_t sub_1DB3B6268(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC198);
}

uint64_t sub_1DB3B6290()
{
  return sub_1DB3B2514(&qword_1F02DEBF8, (uint64_t)qword_1F02DC198);
}

uint64_t sub_1DB3B62AC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEBF8, (uint64_t)qword_1F02DC198, a1);
}

uint64_t sub_1DB3B62C8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC1B0);
}

uint64_t sub_1DB3B62F0()
{
  return sub_1DB3B2514(&qword_1F02DEC00, (uint64_t)qword_1F02DC1B0);
}

uint64_t sub_1DB3B630C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC00, (uint64_t)qword_1F02DC1B0, a1);
}

uint64_t sub_1DB3B6328(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC1C8);
}

uint64_t sub_1DB3B6350()
{
  return sub_1DB3B2514(&qword_1F02DEC08, (uint64_t)qword_1F02DC1C8);
}

uint64_t sub_1DB3B636C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC08, (uint64_t)qword_1F02DC1C8, a1);
}

uint64_t sub_1DB3B6388(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC1E0);
}

uint64_t sub_1DB3B63AC()
{
  return sub_1DB3B2514(&qword_1F02DEC10, (uint64_t)qword_1F02DC1E0);
}

uint64_t sub_1DB3B63C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC10, (uint64_t)qword_1F02DC1E0, a1);
}

uint64_t sub_1DB3B63E4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC1F8);
}

uint64_t sub_1DB3B640C()
{
  return sub_1DB3B2514(&qword_1F02DEC18, (uint64_t)qword_1F02DC1F8);
}

uint64_t sub_1DB3B6428@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC18, (uint64_t)qword_1F02DC1F8, a1);
}

uint64_t sub_1DB3B6444(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC210);
}

uint64_t sub_1DB3B646C()
{
  return sub_1DB3B2514(&qword_1F02DEC20, (uint64_t)qword_1F02DC210);
}

uint64_t sub_1DB3B6488@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC20, (uint64_t)qword_1F02DC210, a1);
}

uint64_t sub_1DB3B64A4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC228);
}

uint64_t sub_1DB3B64CC()
{
  return sub_1DB3B2514(&qword_1F02DEC28, (uint64_t)qword_1F02DC228);
}

uint64_t sub_1DB3B64E8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC28, (uint64_t)qword_1F02DC228, a1);
}

uint64_t sub_1DB3B6504(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC240);
}

uint64_t sub_1DB3B652C()
{
  return sub_1DB3B2514(&qword_1F02DEC30, (uint64_t)qword_1F02DC240);
}

uint64_t sub_1DB3B6548@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC30, (uint64_t)qword_1F02DC240, a1);
}

uint64_t sub_1DB3B6564(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC258);
}

uint64_t sub_1DB3B6588()
{
  return sub_1DB3B2514(&qword_1F02DEC38, (uint64_t)qword_1F02DC258);
}

uint64_t sub_1DB3B65A4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC38, (uint64_t)qword_1F02DC258, a1);
}

uint64_t sub_1DB3B65C0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC270);
}

uint64_t sub_1DB3B65E4()
{
  return sub_1DB3B2514(&qword_1F02DEC40, (uint64_t)qword_1F02DC270);
}

uint64_t sub_1DB3B6600@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC40, (uint64_t)qword_1F02DC270, a1);
}

uint64_t sub_1DB3B661C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC288);
}

uint64_t sub_1DB3B6640()
{
  return sub_1DB3B2514(&qword_1F02DEC48, (uint64_t)qword_1F02DC288);
}

uint64_t sub_1DB3B665C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC48, (uint64_t)qword_1F02DC288, a1);
}

uint64_t sub_1DB3B6678(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC2A0);
}

uint64_t sub_1DB3B669C()
{
  return sub_1DB3B2514(&qword_1F02DEC50, (uint64_t)qword_1F02DC2A0);
}

uint64_t sub_1DB3B66B8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC50, (uint64_t)qword_1F02DC2A0, a1);
}

uint64_t sub_1DB3B66D4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC2B8);
}

uint64_t sub_1DB3B66F8()
{
  return sub_1DB3B2514(&qword_1F02DEC58, (uint64_t)qword_1F02DC2B8);
}

uint64_t sub_1DB3B6714@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC58, (uint64_t)qword_1F02DC2B8, a1);
}

uint64_t sub_1DB3B6730(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC2D0);
}

uint64_t sub_1DB3B6758()
{
  return sub_1DB3B2514(&qword_1F02DEC60, (uint64_t)qword_1F02DC2D0);
}

uint64_t sub_1DB3B6774@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC60, (uint64_t)qword_1F02DC2D0, a1);
}

uint64_t sub_1DB3B6790(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC2E8);
}

uint64_t sub_1DB3B67B8()
{
  return sub_1DB3B2514(&qword_1F02DEC68, (uint64_t)qword_1F02DC2E8);
}

uint64_t sub_1DB3B67D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC68, (uint64_t)qword_1F02DC2E8, a1);
}

uint64_t sub_1DB3B67F0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC300);
}

uint64_t sub_1DB3B6818()
{
  return sub_1DB3B2514(&qword_1F02DEC70, (uint64_t)qword_1F02DC300);
}

uint64_t sub_1DB3B6834@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC70, (uint64_t)qword_1F02DC300, a1);
}

uint64_t sub_1DB3B6850(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC318);
}

uint64_t sub_1DB3B6878()
{
  return sub_1DB3B2514(&qword_1F02DEC78, (uint64_t)qword_1F02DC318);
}

uint64_t sub_1DB3B6894@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC78, (uint64_t)qword_1F02DC318, a1);
}

uint64_t sub_1DB3B68B0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC330);
}

uint64_t sub_1DB3B68D4()
{
  return sub_1DB3B2514(&qword_1F02DEC80, (uint64_t)qword_1F02DC330);
}

uint64_t sub_1DB3B68F0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC80, (uint64_t)qword_1F02DC330, a1);
}

uint64_t sub_1DB3B690C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC348);
}

uint64_t sub_1DB3B6930()
{
  return sub_1DB3B2514(&qword_1F02DEC88, (uint64_t)qword_1F02DC348);
}

uint64_t sub_1DB3B694C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC88, (uint64_t)qword_1F02DC348, a1);
}

uint64_t sub_1DB3B6968(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC360);
}

uint64_t sub_1DB3B698C()
{
  return sub_1DB3B2514(&qword_1F02DEC90, (uint64_t)qword_1F02DC360);
}

uint64_t sub_1DB3B69A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC90, (uint64_t)qword_1F02DC360, a1);
}

uint64_t sub_1DB3B69C4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC378);
}

uint64_t sub_1DB3B69E8()
{
  return sub_1DB3B2514(&qword_1F02DEC98, (uint64_t)qword_1F02DC378);
}

uint64_t sub_1DB3B6A04@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEC98, (uint64_t)qword_1F02DC378, a1);
}

uint64_t sub_1DB3B6A20(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC390);
}

uint64_t sub_1DB3B6A44()
{
  return sub_1DB3B2514(&qword_1F02DECA0, (uint64_t)qword_1F02DC390);
}

uint64_t sub_1DB3B6A60@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DECA0, (uint64_t)qword_1F02DC390, a1);
}

uint64_t sub_1DB3B6A7C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC3A8);
}

uint64_t sub_1DB3B6AA4()
{
  return sub_1DB3B2514(&qword_1F02DECA8, (uint64_t)qword_1F02DC3A8);
}

uint64_t sub_1DB3B6AC0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DECA8, (uint64_t)qword_1F02DC3A8, a1);
}

uint64_t sub_1DB3B6ADC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC3C0);
}

uint64_t sub_1DB3B6B04()
{
  return sub_1DB3B2514(&qword_1F02DECB0, (uint64_t)qword_1F02DC3C0);
}

uint64_t sub_1DB3B6B20@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DECB0, (uint64_t)qword_1F02DC3C0, a1);
}

uint64_t sub_1DB3B6B3C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC3D8);
}

uint64_t sub_1DB3B6B64()
{
  return sub_1DB3B2514(&qword_1F02DECB8, (uint64_t)qword_1F02DC3D8);
}

uint64_t sub_1DB3B6B80@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DECB8, (uint64_t)qword_1F02DC3D8, a1);
}

uint64_t sub_1DB3B6B9C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC3F0);
}

uint64_t sub_1DB3B6BC4()
{
  return sub_1DB3B2514(&qword_1F02DECC0, (uint64_t)qword_1F02DC3F0);
}

uint64_t sub_1DB3B6BE0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DECC0, (uint64_t)qword_1F02DC3F0, a1);
}

uint64_t sub_1DB3B6BFC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC408);
}

uint64_t sub_1DB3B6C20()
{
  return sub_1DB3B2514(&qword_1F02DECC8, (uint64_t)qword_1F02DC408);
}

uint64_t sub_1DB3B6C3C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DECC8, (uint64_t)qword_1F02DC408, a1);
}

uint64_t sub_1DB3B6C58(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC420);
}

uint64_t sub_1DB3B6C80()
{
  return sub_1DB3B2514(&qword_1F02DECD0, (uint64_t)qword_1F02DC420);
}

uint64_t sub_1DB3B6C9C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DECD0, (uint64_t)qword_1F02DC420, a1);
}

uint64_t sub_1DB3B6CB8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC438);
}

uint64_t sub_1DB3B6CE0()
{
  return sub_1DB3B2514(&qword_1F02DECD8, (uint64_t)qword_1F02DC438);
}

uint64_t sub_1DB3B6CFC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DECD8, (uint64_t)qword_1F02DC438, a1);
}

uint64_t sub_1DB3B6D18(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC450);
}

uint64_t sub_1DB3B6D40()
{
  return sub_1DB3B2514(&qword_1F02DECE0, (uint64_t)qword_1F02DC450);
}

uint64_t sub_1DB3B6D5C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DECE0, (uint64_t)qword_1F02DC450, a1);
}

uint64_t sub_1DB3B6D78(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC468);
}

uint64_t sub_1DB3B6DA0()
{
  return sub_1DB3B2514(&qword_1F02DECE8, (uint64_t)qword_1F02DC468);
}

uint64_t sub_1DB3B6DBC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DECE8, (uint64_t)qword_1F02DC468, a1);
}

uint64_t sub_1DB3B6DD8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC480);
}

uint64_t sub_1DB3B6E00()
{
  return sub_1DB3B2514(&qword_1F02DECF0, (uint64_t)qword_1F02DC480);
}

uint64_t sub_1DB3B6E1C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DECF0, (uint64_t)qword_1F02DC480, a1);
}

uint64_t sub_1DB3B6E38(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC498);
}

uint64_t sub_1DB3B6E60()
{
  return sub_1DB3B2514(&qword_1F02DECF8, (uint64_t)qword_1F02DC498);
}

uint64_t sub_1DB3B6E7C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DECF8, (uint64_t)qword_1F02DC498, a1);
}

uint64_t sub_1DB3B6E98(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC4B0);
}

uint64_t sub_1DB3B6EBC()
{
  return sub_1DB3B2514(&qword_1F02DED00, (uint64_t)qword_1F02DC4B0);
}

uint64_t sub_1DB3B6ED8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED00, (uint64_t)qword_1F02DC4B0, a1);
}

uint64_t sub_1DB3B6EF4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC4C8);
}

uint64_t sub_1DB3B6F1C()
{
  return sub_1DB3B2514(&qword_1F02DED08, (uint64_t)qword_1F02DC4C8);
}

uint64_t sub_1DB3B6F38@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED08, (uint64_t)qword_1F02DC4C8, a1);
}

uint64_t sub_1DB3B6F54(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC4E0);
}

uint64_t sub_1DB3B6F7C()
{
  return sub_1DB3B2514(&qword_1F02DED10, (uint64_t)qword_1F02DC4E0);
}

uint64_t sub_1DB3B6F98@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED10, (uint64_t)qword_1F02DC4E0, a1);
}

uint64_t sub_1DB3B6FB4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC4F8);
}

uint64_t sub_1DB3B6FDC()
{
  return sub_1DB3B2514(&qword_1F02DED18, (uint64_t)qword_1F02DC4F8);
}

uint64_t sub_1DB3B6FF8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED18, (uint64_t)qword_1F02DC4F8, a1);
}

uint64_t sub_1DB3B7014(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC510);
}

uint64_t sub_1DB3B703C()
{
  return sub_1DB3B2514(&qword_1F02DED20, (uint64_t)qword_1F02DC510);
}

uint64_t sub_1DB3B7058@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED20, (uint64_t)qword_1F02DC510, a1);
}

uint64_t sub_1DB3B7074(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC528);
}

uint64_t sub_1DB3B709C()
{
  return sub_1DB3B2514(&qword_1F02DED28, (uint64_t)qword_1F02DC528);
}

uint64_t sub_1DB3B70B8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED28, (uint64_t)qword_1F02DC528, a1);
}

uint64_t sub_1DB3B70D4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC540);
}

uint64_t sub_1DB3B70FC()
{
  return sub_1DB3B2514(&qword_1F02DED30, (uint64_t)qword_1F02DC540);
}

uint64_t sub_1DB3B7118@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED30, (uint64_t)qword_1F02DC540, a1);
}

uint64_t sub_1DB3B7134(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC558);
}

uint64_t sub_1DB3B7158()
{
  return sub_1DB3B2514(&qword_1F02DED38, (uint64_t)qword_1F02DC558);
}

uint64_t sub_1DB3B7174@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED38, (uint64_t)qword_1F02DC558, a1);
}

uint64_t sub_1DB3B7190(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC570);
}

uint64_t sub_1DB3B71B8()
{
  return sub_1DB3B2514(&qword_1F02DED40, (uint64_t)qword_1F02DC570);
}

uint64_t sub_1DB3B71D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED40, (uint64_t)qword_1F02DC570, a1);
}

uint64_t sub_1DB3B71F0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC588);
}

uint64_t sub_1DB3B7218()
{
  return sub_1DB3B2514(&qword_1F02DED48, (uint64_t)qword_1F02DC588);
}

uint64_t sub_1DB3B7234@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED48, (uint64_t)qword_1F02DC588, a1);
}

uint64_t sub_1DB3B7250(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC5A0);
}

uint64_t sub_1DB3B7278()
{
  return sub_1DB3B2514(&qword_1F02DED50, (uint64_t)qword_1F02DC5A0);
}

uint64_t sub_1DB3B7294@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED50, (uint64_t)qword_1F02DC5A0, a1);
}

uint64_t sub_1DB3B72B0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC5B8);
}

uint64_t sub_1DB3B72D8()
{
  return sub_1DB3B2514(&qword_1F02DED58, (uint64_t)qword_1F02DC5B8);
}

uint64_t sub_1DB3B72F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED58, (uint64_t)qword_1F02DC5B8, a1);
}

uint64_t sub_1DB3B7310(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC5D0);
}

uint64_t sub_1DB3B7338()
{
  return sub_1DB3B2514(&qword_1F02DED60, (uint64_t)qword_1F02DC5D0);
}

uint64_t sub_1DB3B7354@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED60, (uint64_t)qword_1F02DC5D0, a1);
}

uint64_t sub_1DB3B7370(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC5E8);
}

uint64_t sub_1DB3B7398()
{
  return sub_1DB3B2514(&qword_1F02DED68, (uint64_t)qword_1F02DC5E8);
}

uint64_t sub_1DB3B73B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED68, (uint64_t)qword_1F02DC5E8, a1);
}

uint64_t sub_1DB3B73D0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC600);
}

uint64_t sub_1DB3B73F4()
{
  return sub_1DB3B2514(&qword_1F02DED70, (uint64_t)qword_1F02DC600);
}

uint64_t sub_1DB3B7410@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED70, (uint64_t)qword_1F02DC600, a1);
}

uint64_t sub_1DB3B742C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC618);
}

uint64_t sub_1DB3B7448()
{
  return sub_1DB3B2514(&qword_1F02DED78, (uint64_t)qword_1F02DC618);
}

uint64_t sub_1DB3B7464@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED78, (uint64_t)qword_1F02DC618, a1);
}

uint64_t sub_1DB3B7480(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC630);
}

uint64_t sub_1DB3B74A0()
{
  return sub_1DB3B2514(&qword_1F02DED80, (uint64_t)qword_1F02DC630);
}

uint64_t sub_1DB3B74BC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED80, (uint64_t)qword_1F02DC630, a1);
}

uint64_t sub_1DB3B74D8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC648);
}

uint64_t sub_1DB3B74F8()
{
  return sub_1DB3B2514(&qword_1F02DED88, (uint64_t)qword_1F02DC648);
}

uint64_t sub_1DB3B7514@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED88, (uint64_t)qword_1F02DC648, a1);
}

uint64_t sub_1DB3B7530(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC660);
}

uint64_t sub_1DB3B7550()
{
  return sub_1DB3B2514(&qword_1F02DED90, (uint64_t)qword_1F02DC660);
}

uint64_t sub_1DB3B756C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED90, (uint64_t)qword_1F02DC660, a1);
}

uint64_t sub_1DB3B7588(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC678);
}

uint64_t sub_1DB3B75A4()
{
  return sub_1DB3B2514(&qword_1F02DED98, (uint64_t)qword_1F02DC678);
}

uint64_t sub_1DB3B75C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DED98, (uint64_t)qword_1F02DC678, a1);
}

uint64_t sub_1DB3B75DC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC690);
}

uint64_t sub_1DB3B75F8()
{
  return sub_1DB3B2514(&qword_1F02DEDA0, (uint64_t)qword_1F02DC690);
}

uint64_t sub_1DB3B7614@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEDA0, (uint64_t)qword_1F02DC690, a1);
}

uint64_t sub_1DB3B7630(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC6A8);
}

uint64_t sub_1DB3B7658()
{
  return sub_1DB3B2514(&qword_1F02DEDA8, (uint64_t)qword_1F02DC6A8);
}

uint64_t sub_1DB3B7674@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEDA8, (uint64_t)qword_1F02DC6A8, a1);
}

uint64_t sub_1DB3B7690(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC6C0);
}

uint64_t sub_1DB3B76B0()
{
  return sub_1DB3B2514(&qword_1F02DEDB0, (uint64_t)qword_1F02DC6C0);
}

uint64_t sub_1DB3B76CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEDB0, (uint64_t)qword_1F02DC6C0, a1);
}

uint64_t sub_1DB3B76E8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC6D8);
}

uint64_t sub_1DB3B7708()
{
  return sub_1DB3B2514(&qword_1F02DEDB8, (uint64_t)qword_1F02DC6D8);
}

uint64_t sub_1DB3B7724@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEDB8, (uint64_t)qword_1F02DC6D8, a1);
}

uint64_t sub_1DB3B7740(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC6F0);
}

uint64_t sub_1DB3B7760()
{
  return sub_1DB3B2514(&qword_1F02DEDC0, (uint64_t)qword_1F02DC6F0);
}

uint64_t sub_1DB3B777C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEDC0, (uint64_t)qword_1F02DC6F0, a1);
}

uint64_t sub_1DB3B7798(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC708);
}

uint64_t sub_1DB3B77B8()
{
  return sub_1DB3B2514(&qword_1F02DEDC8, (uint64_t)qword_1F02DC708);
}

uint64_t sub_1DB3B77D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEDC8, (uint64_t)qword_1F02DC708, a1);
}

uint64_t sub_1DB3B77F0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC720);
}

uint64_t sub_1DB3B7810()
{
  return sub_1DB3B2514(&qword_1F02DEDD0, (uint64_t)qword_1F02DC720);
}

uint64_t sub_1DB3B782C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEDD0, (uint64_t)qword_1F02DC720, a1);
}

uint64_t sub_1DB3B7848(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC738);
}

uint64_t sub_1DB3B7874()
{
  return sub_1DB3B2514(&qword_1F02DEDD8, (uint64_t)qword_1F02DC738);
}

uint64_t sub_1DB3B7890@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEDD8, (uint64_t)qword_1F02DC738, a1);
}

uint64_t sub_1DB3B78AC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC750);
}

uint64_t sub_1DB3B78D4()
{
  return sub_1DB3B2514(&qword_1F02DEDE0, (uint64_t)qword_1F02DC750);
}

uint64_t sub_1DB3B78F0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEDE0, (uint64_t)qword_1F02DC750, a1);
}

uint64_t sub_1DB3B790C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC768);
}

uint64_t sub_1DB3B7934()
{
  return sub_1DB3B2514(&qword_1F02DEDE8, (uint64_t)qword_1F02DC768);
}

uint64_t sub_1DB3B7950@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEDE8, (uint64_t)qword_1F02DC768, a1);
}

uint64_t sub_1DB3B796C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC780);
}

uint64_t sub_1DB3B7994()
{
  return sub_1DB3B2514(&qword_1F02DEDF0, (uint64_t)qword_1F02DC780);
}

uint64_t sub_1DB3B79B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEDF0, (uint64_t)qword_1F02DC780, a1);
}

uint64_t sub_1DB3B79CC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC798);
}

uint64_t sub_1DB3B79F4()
{
  return sub_1DB3B2514(&qword_1F02DEDF8, (uint64_t)qword_1F02DC798);
}

uint64_t sub_1DB3B7A10@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEDF8, (uint64_t)qword_1F02DC798, a1);
}

uint64_t sub_1DB3B7A2C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC7B0);
}

uint64_t sub_1DB3B7A54()
{
  return sub_1DB3B2514(&qword_1F02DEE00, (uint64_t)qword_1F02DC7B0);
}

uint64_t sub_1DB3B7A70@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE00, (uint64_t)qword_1F02DC7B0, a1);
}

uint64_t sub_1DB3B7A8C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC7C8);
}

uint64_t sub_1DB3B7AB0()
{
  return sub_1DB3B2514(&qword_1F02DEE08, (uint64_t)qword_1F02DC7C8);
}

uint64_t sub_1DB3B7ACC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE08, (uint64_t)qword_1F02DC7C8, a1);
}

uint64_t sub_1DB3B7AE8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC7E0);
}

uint64_t sub_1DB3B7B10()
{
  return sub_1DB3B2514(&qword_1F02DEE10, (uint64_t)qword_1F02DC7E0);
}

uint64_t sub_1DB3B7B2C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE10, (uint64_t)qword_1F02DC7E0, a1);
}

uint64_t sub_1DB3B7B48(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC7F8);
}

uint64_t sub_1DB3B7B70()
{
  return sub_1DB3B2514(&qword_1F02DEE18, (uint64_t)qword_1F02DC7F8);
}

uint64_t sub_1DB3B7B8C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE18, (uint64_t)qword_1F02DC7F8, a1);
}

uint64_t sub_1DB3B7BA8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC810);
}

uint64_t sub_1DB3B7BD0()
{
  return sub_1DB3B2514(&qword_1F02DEE20, (uint64_t)qword_1F02DC810);
}

uint64_t sub_1DB3B7BEC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE20, (uint64_t)qword_1F02DC810, a1);
}

uint64_t sub_1DB3B7C08(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC828);
}

uint64_t sub_1DB3B7C30()
{
  return sub_1DB3B2514(&qword_1F02DEE28, (uint64_t)qword_1F02DC828);
}

uint64_t sub_1DB3B7C4C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE28, (uint64_t)qword_1F02DC828, a1);
}

uint64_t sub_1DB3B7C68(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC840);
}

uint64_t sub_1DB3B7C90()
{
  return sub_1DB3B2514(&qword_1F02DEE30, (uint64_t)qword_1F02DC840);
}

uint64_t sub_1DB3B7CAC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE30, (uint64_t)qword_1F02DC840, a1);
}

uint64_t sub_1DB3B7CC8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC858);
}

uint64_t sub_1DB3B7CEC()
{
  return sub_1DB3B2514(&qword_1F02DEE38, (uint64_t)qword_1F02DC858);
}

uint64_t sub_1DB3B7D08@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE38, (uint64_t)qword_1F02DC858, a1);
}

uint64_t sub_1DB3B7D24(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC870);
}

uint64_t sub_1DB3B7D4C()
{
  return sub_1DB3B2514(&qword_1F02DEE40, (uint64_t)qword_1F02DC870);
}

uint64_t sub_1DB3B7D68@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE40, (uint64_t)qword_1F02DC870, a1);
}

uint64_t sub_1DB3B7D84(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC888);
}

uint64_t sub_1DB3B7DAC()
{
  return sub_1DB3B2514(&qword_1F02DEE48, (uint64_t)qword_1F02DC888);
}

uint64_t sub_1DB3B7DC8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE48, (uint64_t)qword_1F02DC888, a1);
}

uint64_t sub_1DB3B7DE4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC8A0);
}

uint64_t sub_1DB3B7E0C()
{
  return sub_1DB3B2514(&qword_1F02DEE50, (uint64_t)qword_1F02DC8A0);
}

uint64_t sub_1DB3B7E28@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE50, (uint64_t)qword_1F02DC8A0, a1);
}

uint64_t sub_1DB3B7E44(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC8B8);
}

uint64_t sub_1DB3B7E6C()
{
  return sub_1DB3B2514(&qword_1F02DEE58, (uint64_t)qword_1F02DC8B8);
}

uint64_t sub_1DB3B7E88@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE58, (uint64_t)qword_1F02DC8B8, a1);
}

uint64_t sub_1DB3B7EA4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC8D0);
}

uint64_t sub_1DB3B7ECC()
{
  return sub_1DB3B2514(&qword_1F02DEE60, (uint64_t)qword_1F02DC8D0);
}

uint64_t sub_1DB3B7EE8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE60, (uint64_t)qword_1F02DC8D0, a1);
}

uint64_t sub_1DB3B7F04(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC8E8);
}

uint64_t sub_1DB3B7F28()
{
  return sub_1DB3B2514(&qword_1F02DEE68, (uint64_t)qword_1F02DC8E8);
}

uint64_t sub_1DB3B7F44@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE68, (uint64_t)qword_1F02DC8E8, a1);
}

uint64_t sub_1DB3B7F60(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC900);
}

uint64_t sub_1DB3B7F84()
{
  return sub_1DB3B2514(&qword_1F02DEE70, (uint64_t)qword_1F02DC900);
}

uint64_t sub_1DB3B7FA0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE70, (uint64_t)qword_1F02DC900, a1);
}

uint64_t sub_1DB3B7FBC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC918);
}

uint64_t sub_1DB3B7FE0()
{
  return sub_1DB3B2514(&qword_1F02DEE78, (uint64_t)qword_1F02DC918);
}

uint64_t sub_1DB3B7FFC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE78, (uint64_t)qword_1F02DC918, a1);
}

uint64_t sub_1DB3B8018(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC930);
}

uint64_t sub_1DB3B803C()
{
  return sub_1DB3B2514(&qword_1F02DEE80, (uint64_t)qword_1F02DC930);
}

uint64_t sub_1DB3B8058@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE80, (uint64_t)qword_1F02DC930, a1);
}

uint64_t sub_1DB3B8074(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC948);
}

uint64_t sub_1DB3B8098()
{
  return sub_1DB3B2514(&qword_1F02DEE88, (uint64_t)qword_1F02DC948);
}

uint64_t sub_1DB3B80B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE88, (uint64_t)qword_1F02DC948, a1);
}

uint64_t sub_1DB3B80D0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC960);
}

uint64_t sub_1DB3B80F4()
{
  return sub_1DB3B2514(&qword_1F02DEE90, (uint64_t)qword_1F02DC960);
}

uint64_t sub_1DB3B8110@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE90, (uint64_t)qword_1F02DC960, a1);
}

uint64_t sub_1DB3B812C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC978);
}

uint64_t sub_1DB3B8150()
{
  return sub_1DB3B2514(&qword_1F02DEE98, (uint64_t)qword_1F02DC978);
}

uint64_t sub_1DB3B816C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEE98, (uint64_t)qword_1F02DC978, a1);
}

uint64_t sub_1DB3B8188(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC990);
}

uint64_t sub_1DB3B81AC()
{
  return sub_1DB3B2514(&qword_1F02DEEA0, (uint64_t)qword_1F02DC990);
}

uint64_t sub_1DB3B81C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEEA0, (uint64_t)qword_1F02DC990, a1);
}

uint64_t sub_1DB3B81E4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC9A8);
}

uint64_t sub_1DB3B8208()
{
  return sub_1DB3B2514(&qword_1F02DEEA8, (uint64_t)qword_1F02DC9A8);
}

uint64_t sub_1DB3B8224@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEEA8, (uint64_t)qword_1F02DC9A8, a1);
}

uint64_t sub_1DB3B8240(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC9C0);
}

uint64_t sub_1DB3B8264()
{
  return sub_1DB3B2514(&qword_1F02DEEB0, (uint64_t)qword_1F02DC9C0);
}

uint64_t sub_1DB3B8280@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEEB0, (uint64_t)qword_1F02DC9C0, a1);
}

uint64_t sub_1DB3B829C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC9D8);
}

uint64_t sub_1DB3B82C0()
{
  return sub_1DB3B2514(&qword_1F02DEEB8, (uint64_t)qword_1F02DC9D8);
}

uint64_t sub_1DB3B82DC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEEB8, (uint64_t)qword_1F02DC9D8, a1);
}

uint64_t sub_1DB3B82F8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DC9F0);
}

uint64_t sub_1DB3B8320()
{
  return sub_1DB3B2514(&qword_1F02DEEC0, (uint64_t)qword_1F02DC9F0);
}

uint64_t sub_1DB3B833C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEEC0, (uint64_t)qword_1F02DC9F0, a1);
}

uint64_t sub_1DB3B8358(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCA08);
}

uint64_t sub_1DB3B8378()
{
  return sub_1DB3B2514(&qword_1F02DEEC8, (uint64_t)qword_1F02DCA08);
}

uint64_t sub_1DB3B8394@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEEC8, (uint64_t)qword_1F02DCA08, a1);
}

uint64_t sub_1DB3B83B0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCA20);
}

uint64_t sub_1DB3B83D4()
{
  return sub_1DB3B2514(&qword_1F02DEED0, (uint64_t)qword_1F02DCA20);
}

uint64_t sub_1DB3B83F0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEED0, (uint64_t)qword_1F02DCA20, a1);
}

uint64_t sub_1DB3B840C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCA38);
}

uint64_t sub_1DB3B8438()
{
  return sub_1DB3B2514(&qword_1F02DEED8, (uint64_t)qword_1F02DCA38);
}

uint64_t sub_1DB3B8454@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEED8, (uint64_t)qword_1F02DCA38, a1);
}

uint64_t sub_1DB3B8470(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCA50);
}

uint64_t sub_1DB3B8494()
{
  return sub_1DB3B2514(&qword_1F02DEEE0, (uint64_t)qword_1F02DCA50);
}

uint64_t sub_1DB3B84B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEEE0, (uint64_t)qword_1F02DCA50, a1);
}

uint64_t sub_1DB3B84CC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCA68);
}

uint64_t sub_1DB3B84F0()
{
  return sub_1DB3B2514(&qword_1F02DEEE8, (uint64_t)qword_1F02DCA68);
}

uint64_t sub_1DB3B850C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEEE8, (uint64_t)qword_1F02DCA68, a1);
}

uint64_t sub_1DB3B8528(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCA80);
}

uint64_t sub_1DB3B854C()
{
  return sub_1DB3B2514(&qword_1F02DEEF0, (uint64_t)qword_1F02DCA80);
}

uint64_t sub_1DB3B8568@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEEF0, (uint64_t)qword_1F02DCA80, a1);
}

uint64_t sub_1DB3B8584(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCA98);
}

uint64_t sub_1DB3B85AC()
{
  return sub_1DB3B2514(&qword_1F02DEEF8, (uint64_t)qword_1F02DCA98);
}

uint64_t sub_1DB3B85C8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEEF8, (uint64_t)qword_1F02DCA98, a1);
}

uint64_t sub_1DB3B85E4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCAB0);
}

uint64_t sub_1DB3B8610()
{
  return sub_1DB3B2514(&qword_1F02DEF00, (uint64_t)qword_1F02DCAB0);
}

uint64_t sub_1DB3B862C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF00, (uint64_t)qword_1F02DCAB0, a1);
}

uint64_t sub_1DB3B8648(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCAC8);
}

uint64_t sub_1DB3B866C()
{
  return sub_1DB3B2514(&qword_1F02DEF08, (uint64_t)qword_1F02DCAC8);
}

uint64_t sub_1DB3B8688@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF08, (uint64_t)qword_1F02DCAC8, a1);
}

uint64_t sub_1DB3B86A4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCAE0);
}

uint64_t sub_1DB3B86CC()
{
  return sub_1DB3B2514(&qword_1F02DEF10, (uint64_t)qword_1F02DCAE0);
}

uint64_t sub_1DB3B86E8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF10, (uint64_t)qword_1F02DCAE0, a1);
}

uint64_t sub_1DB3B8704(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCAF8);
}

uint64_t sub_1DB3B8728()
{
  return sub_1DB3B2514(&qword_1F02DEF18, (uint64_t)qword_1F02DCAF8);
}

uint64_t sub_1DB3B8744@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF18, (uint64_t)qword_1F02DCAF8, a1);
}

uint64_t sub_1DB3B8760(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCB10);
}

uint64_t sub_1DB3B878C()
{
  return sub_1DB3B2514(&qword_1F02DEF20, (uint64_t)qword_1F02DCB10);
}

uint64_t sub_1DB3B87A8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF20, (uint64_t)qword_1F02DCB10, a1);
}

uint64_t sub_1DB3B87C4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCB28);
}

uint64_t sub_1DB3B87F0()
{
  return sub_1DB3B2514(&qword_1F02DEF28, (uint64_t)qword_1F02DCB28);
}

uint64_t sub_1DB3B880C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF28, (uint64_t)qword_1F02DCB28, a1);
}

uint64_t sub_1DB3B8828(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCB40);
}

uint64_t sub_1DB3B884C()
{
  return sub_1DB3B2514(&qword_1F02DEF30, (uint64_t)qword_1F02DCB40);
}

uint64_t sub_1DB3B8868@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF30, (uint64_t)qword_1F02DCB40, a1);
}

uint64_t sub_1DB3B8884(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCB58);
}

uint64_t sub_1DB3B88A8()
{
  return sub_1DB3B2514(&qword_1F02DEF38, (uint64_t)qword_1F02DCB58);
}

uint64_t sub_1DB3B88C4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF38, (uint64_t)qword_1F02DCB58, a1);
}

uint64_t sub_1DB3B88E0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCB70);
}

uint64_t sub_1DB3B8904()
{
  return sub_1DB3B2514(&qword_1F02DEF40, (uint64_t)qword_1F02DCB70);
}

uint64_t sub_1DB3B8920@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF40, (uint64_t)qword_1F02DCB70, a1);
}

uint64_t sub_1DB3B893C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCB88);
}

uint64_t sub_1DB3B8960()
{
  return sub_1DB3B2514(&qword_1F02DEF48, (uint64_t)qword_1F02DCB88);
}

uint64_t sub_1DB3B897C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF48, (uint64_t)qword_1F02DCB88, a1);
}

uint64_t sub_1DB3B8998(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCBA0);
}

uint64_t sub_1DB3B89BC()
{
  return sub_1DB3B2514(&qword_1F02DEF50, (uint64_t)qword_1F02DCBA0);
}

uint64_t sub_1DB3B89D8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF50, (uint64_t)qword_1F02DCBA0, a1);
}

uint64_t sub_1DB3B89F4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCBB8);
}

uint64_t sub_1DB3B8A1C()
{
  return sub_1DB3B2514(&qword_1F02DEF58, (uint64_t)qword_1F02DCBB8);
}

uint64_t sub_1DB3B8A38@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF58, (uint64_t)qword_1F02DCBB8, a1);
}

uint64_t sub_1DB3B8A54(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCBD0);
}

uint64_t sub_1DB3B8A78()
{
  return sub_1DB3B2514(&qword_1F02DEF60, (uint64_t)qword_1F02DCBD0);
}

uint64_t sub_1DB3B8A94@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF60, (uint64_t)qword_1F02DCBD0, a1);
}

uint64_t sub_1DB3B8AB0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCBE8);
}

uint64_t sub_1DB3B8AD4()
{
  return sub_1DB3B2514(&qword_1F02DEF68, (uint64_t)qword_1F02DCBE8);
}

uint64_t sub_1DB3B8AF0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF68, (uint64_t)qword_1F02DCBE8, a1);
}

uint64_t sub_1DB3B8B0C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCC00);
}

uint64_t sub_1DB3B8B30()
{
  return sub_1DB3B2514(&qword_1F02DEF70, (uint64_t)qword_1F02DCC00);
}

uint64_t sub_1DB3B8B4C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF70, (uint64_t)qword_1F02DCC00, a1);
}

uint64_t sub_1DB3B8B68(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCC18);
}

uint64_t sub_1DB3B8B8C()
{
  return sub_1DB3B2514(&qword_1F02DEF78, (uint64_t)qword_1F02DCC18);
}

uint64_t sub_1DB3B8BA8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF78, (uint64_t)qword_1F02DCC18, a1);
}

uint64_t sub_1DB3B8BC4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCC30);
}

uint64_t sub_1DB3B8BE8()
{
  return sub_1DB3B2514(&qword_1F02DEF80, (uint64_t)qword_1F02DCC30);
}

uint64_t sub_1DB3B8C04@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF80, (uint64_t)qword_1F02DCC30, a1);
}

uint64_t sub_1DB3B8C20(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCC48);
}

uint64_t sub_1DB3B8C44()
{
  return sub_1DB3B2514(&qword_1F02DEF88, (uint64_t)qword_1F02DCC48);
}

uint64_t sub_1DB3B8C60@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF88, (uint64_t)qword_1F02DCC48, a1);
}

uint64_t sub_1DB3B8C7C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCC60);
}

uint64_t sub_1DB3B8CA0()
{
  return sub_1DB3B2514(&qword_1F02DEF90, (uint64_t)qword_1F02DCC60);
}

uint64_t sub_1DB3B8CBC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF90, (uint64_t)qword_1F02DCC60, a1);
}

uint64_t sub_1DB3B8CD8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCC78);
}

uint64_t sub_1DB3B8CFC()
{
  return sub_1DB3B2514(&qword_1F02DEF98, (uint64_t)qword_1F02DCC78);
}

uint64_t sub_1DB3B8D18@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEF98, (uint64_t)qword_1F02DCC78, a1);
}

uint64_t sub_1DB3B8D34(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCC90);
}

uint64_t sub_1DB3B8D58()
{
  return sub_1DB3B2514(&qword_1F02DEFA0, (uint64_t)qword_1F02DCC90);
}

uint64_t sub_1DB3B8D74@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEFA0, (uint64_t)qword_1F02DCC90, a1);
}

uint64_t sub_1DB3B8D90(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCCA8);
}

uint64_t sub_1DB3B8DB4()
{
  return sub_1DB3B2514(&qword_1F02DEFA8, (uint64_t)qword_1F02DCCA8);
}

uint64_t sub_1DB3B8DD0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEFA8, (uint64_t)qword_1F02DCCA8, a1);
}

uint64_t sub_1DB3B8DEC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCCC0);
}

uint64_t sub_1DB3B8E10()
{
  return sub_1DB3B2514(&qword_1F02DEFB0, (uint64_t)qword_1F02DCCC0);
}

uint64_t sub_1DB3B8E2C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEFB0, (uint64_t)qword_1F02DCCC0, a1);
}

uint64_t sub_1DB3B8E48(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCCD8);
}

uint64_t sub_1DB3B8E6C()
{
  return sub_1DB3B2514(&qword_1F02DEFB8, (uint64_t)qword_1F02DCCD8);
}

uint64_t sub_1DB3B8E88@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEFB8, (uint64_t)qword_1F02DCCD8, a1);
}

uint64_t sub_1DB3B8EA4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCCF0);
}

uint64_t sub_1DB3B8EC8()
{
  return sub_1DB3B2514(&qword_1F02DEFC0, (uint64_t)qword_1F02DCCF0);
}

uint64_t sub_1DB3B8EE4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEFC0, (uint64_t)qword_1F02DCCF0, a1);
}

uint64_t sub_1DB3B8F00(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCD08);
}

uint64_t sub_1DB3B8F24()
{
  return sub_1DB3B2514(&qword_1F02DEFC8, (uint64_t)qword_1F02DCD08);
}

uint64_t sub_1DB3B8F40@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEFC8, (uint64_t)qword_1F02DCD08, a1);
}

uint64_t sub_1DB3B8F5C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCD20);
}

uint64_t sub_1DB3B8F80()
{
  return sub_1DB3B2514(&qword_1F02DEFD0, (uint64_t)qword_1F02DCD20);
}

uint64_t sub_1DB3B8F9C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEFD0, (uint64_t)qword_1F02DCD20, a1);
}

uint64_t sub_1DB3B8FB8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCD38);
}

uint64_t sub_1DB3B8FDC()
{
  return sub_1DB3B2514(&qword_1F02DEFD8, (uint64_t)qword_1F02DCD38);
}

uint64_t sub_1DB3B8FF8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEFD8, (uint64_t)qword_1F02DCD38, a1);
}

uint64_t sub_1DB3B9014(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCD50);
}

uint64_t sub_1DB3B9038()
{
  return sub_1DB3B2514(&qword_1F02DEFE0, (uint64_t)qword_1F02DCD50);
}

uint64_t sub_1DB3B9054@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEFE0, (uint64_t)qword_1F02DCD50, a1);
}

uint64_t sub_1DB3B9070(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCD68);
}

uint64_t sub_1DB3B9094()
{
  return sub_1DB3B2514(&qword_1F02DEFE8, (uint64_t)qword_1F02DCD68);
}

uint64_t sub_1DB3B90B0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEFE8, (uint64_t)qword_1F02DCD68, a1);
}

uint64_t sub_1DB3B90CC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCD80);
}

uint64_t sub_1DB3B90F0()
{
  return sub_1DB3B2514(&qword_1F02DEFF0, (uint64_t)qword_1F02DCD80);
}

uint64_t sub_1DB3B910C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEFF0, (uint64_t)qword_1F02DCD80, a1);
}

uint64_t sub_1DB3B9128(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCD98);
}

uint64_t sub_1DB3B914C()
{
  return sub_1DB3B2514(&qword_1F02DEFF8, (uint64_t)qword_1F02DCD98);
}

uint64_t sub_1DB3B9168@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DEFF8, (uint64_t)qword_1F02DCD98, a1);
}

uint64_t sub_1DB3B9184(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCDB0);
}

uint64_t sub_1DB3B91A8()
{
  return sub_1DB3B2514(&qword_1F02DF000, (uint64_t)qword_1F02DCDB0);
}

uint64_t sub_1DB3B91C4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF000, (uint64_t)qword_1F02DCDB0, a1);
}

uint64_t sub_1DB3B91E0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCDC8);
}

uint64_t sub_1DB3B9204()
{
  return sub_1DB3B2514(&qword_1F02DF008, (uint64_t)qword_1F02DCDC8);
}

uint64_t sub_1DB3B9220@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF008, (uint64_t)qword_1F02DCDC8, a1);
}

uint64_t sub_1DB3B923C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCDE0);
}

uint64_t sub_1DB3B9254()
{
  return sub_1DB3B2514(&qword_1F02DF010, (uint64_t)qword_1F02DCDE0);
}

uint64_t sub_1DB3B9270@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF010, (uint64_t)qword_1F02DCDE0, a1);
}

uint64_t sub_1DB3B928C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCDF8);
}

uint64_t sub_1DB3B92B0()
{
  return sub_1DB3B2514(&qword_1F02DF018, (uint64_t)qword_1F02DCDF8);
}

uint64_t sub_1DB3B92CC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF018, (uint64_t)qword_1F02DCDF8, a1);
}

uint64_t sub_1DB3B92E8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCE10);
}

uint64_t sub_1DB3B930C()
{
  return sub_1DB3B2514(&qword_1F02DF020, (uint64_t)qword_1F02DCE10);
}

uint64_t sub_1DB3B9328@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF020, (uint64_t)qword_1F02DCE10, a1);
}

uint64_t sub_1DB3B9344(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCE28);
}

uint64_t sub_1DB3B9368()
{
  return sub_1DB3B2514(&qword_1F02DF028, (uint64_t)qword_1F02DCE28);
}

uint64_t sub_1DB3B9384@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF028, (uint64_t)qword_1F02DCE28, a1);
}

uint64_t sub_1DB3B93A0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCE40);
}

uint64_t sub_1DB3B93C4()
{
  return sub_1DB3B2514(&qword_1F02DF030, (uint64_t)qword_1F02DCE40);
}

uint64_t sub_1DB3B93E0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF030, (uint64_t)qword_1F02DCE40, a1);
}

uint64_t sub_1DB3B93FC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCE58);
}

uint64_t sub_1DB3B9420()
{
  return sub_1DB3B2514(&qword_1F02DF038, (uint64_t)qword_1F02DCE58);
}

uint64_t sub_1DB3B943C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF038, (uint64_t)qword_1F02DCE58, a1);
}

uint64_t sub_1DB3B9458(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCE70);
}

uint64_t sub_1DB3B947C()
{
  return sub_1DB3B2514(&qword_1F02DF040, (uint64_t)qword_1F02DCE70);
}

uint64_t sub_1DB3B9498@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF040, (uint64_t)qword_1F02DCE70, a1);
}

uint64_t sub_1DB3B94B4(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCE88);
}

uint64_t sub_1DB3B94D8()
{
  return sub_1DB3B2514(&qword_1F02DF048, (uint64_t)qword_1F02DCE88);
}

uint64_t sub_1DB3B94F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF048, (uint64_t)qword_1F02DCE88, a1);
}

uint64_t sub_1DB3B9510(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCEA0);
}

uint64_t sub_1DB3B9534()
{
  return sub_1DB3B2514(&qword_1F02DF050, (uint64_t)qword_1F02DCEA0);
}

uint64_t sub_1DB3B9550@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF050, (uint64_t)qword_1F02DCEA0, a1);
}

uint64_t sub_1DB3B956C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCEB8);
}

uint64_t sub_1DB3B9590()
{
  return sub_1DB3B2514(&qword_1F02DF058, (uint64_t)qword_1F02DCEB8);
}

uint64_t sub_1DB3B95AC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF058, (uint64_t)qword_1F02DCEB8, a1);
}

uint64_t sub_1DB3B95C8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCED0);
}

uint64_t sub_1DB3B95EC()
{
  return sub_1DB3B2514(&qword_1F02DF060, (uint64_t)qword_1F02DCED0);
}

uint64_t sub_1DB3B9608@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF060, (uint64_t)qword_1F02DCED0, a1);
}

uint64_t sub_1DB3B9624(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCEE8);
}

uint64_t sub_1DB3B9648()
{
  return sub_1DB3B2514(&qword_1F02DF068, (uint64_t)qword_1F02DCEE8);
}

uint64_t sub_1DB3B9664@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF068, (uint64_t)qword_1F02DCEE8, a1);
}

uint64_t sub_1DB3B9680(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCF00);
}

uint64_t sub_1DB3B96A4()
{
  return sub_1DB3B2514(&qword_1F02DF070, (uint64_t)qword_1F02DCF00);
}

uint64_t sub_1DB3B96C0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF070, (uint64_t)qword_1F02DCF00, a1);
}

uint64_t sub_1DB3B96DC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCF18);
}

uint64_t sub_1DB3B9700()
{
  return sub_1DB3B2514(&qword_1F02DF078, (uint64_t)qword_1F02DCF18);
}

uint64_t sub_1DB3B971C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF078, (uint64_t)qword_1F02DCF18, a1);
}

uint64_t sub_1DB3B9738(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCF30);
}

uint64_t sub_1DB3B975C()
{
  return sub_1DB3B2514(&qword_1F02DF080, (uint64_t)qword_1F02DCF30);
}

uint64_t sub_1DB3B9778@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF080, (uint64_t)qword_1F02DCF30, a1);
}

uint64_t sub_1DB3B9794(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCF48);
}

uint64_t sub_1DB3B97B8()
{
  return sub_1DB3B2514(&qword_1F02DF088, (uint64_t)qword_1F02DCF48);
}

uint64_t sub_1DB3B97D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF088, (uint64_t)qword_1F02DCF48, a1);
}

uint64_t sub_1DB3B97F0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCF60);
}

uint64_t sub_1DB3B9814()
{
  return sub_1DB3B2514(&qword_1F02DF090, (uint64_t)qword_1F02DCF60);
}

uint64_t sub_1DB3B9830@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF090, (uint64_t)qword_1F02DCF60, a1);
}

uint64_t sub_1DB3B984C(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCF78);
}

uint64_t sub_1DB3B9870()
{
  return sub_1DB3B2514(&qword_1F02DF098, (uint64_t)qword_1F02DCF78);
}

uint64_t sub_1DB3B988C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF098, (uint64_t)qword_1F02DCF78, a1);
}

uint64_t sub_1DB3B98A8(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCF90);
}

uint64_t sub_1DB3B98CC()
{
  return sub_1DB3B2514(&qword_1F02DF0A0, (uint64_t)qword_1F02DCF90);
}

uint64_t sub_1DB3B98E8@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF0A0, (uint64_t)qword_1F02DCF90, a1);
}

uint64_t sub_1DB3B9904(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCFA8);
}

uint64_t sub_1DB3B9928()
{
  return sub_1DB3B2514(&qword_1F02DF0A8, (uint64_t)qword_1F02DCFA8);
}

uint64_t sub_1DB3B9944@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF0A8, (uint64_t)qword_1F02DCFA8, a1);
}

uint64_t sub_1DB3B9960(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCFC0);
}

uint64_t sub_1DB3B9984()
{
  return sub_1DB3B2514(&qword_1F02DF0B0, (uint64_t)qword_1F02DCFC0);
}

uint64_t sub_1DB3B99A0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF0B0, (uint64_t)qword_1F02DCFC0, a1);
}

uint64_t sub_1DB3B99BC(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DCFD8);
}

uint64_t sub_1DB3B99E0()
{
  return sub_1DB3B2514(&qword_1F02DF0B8, (uint64_t)qword_1F02DCFD8);
}

uint64_t sub_1DB3B99FC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF0B8, (uint64_t)qword_1F02DCFD8, a1);
}

uint64_t sub_1DB3B9A18(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, (uint64_t *)&unk_1F02DCFF0);
}

uint64_t sub_1DB3B9A3C()
{
  return sub_1DB3B2514(&qword_1F02DF0C0, (uint64_t)&unk_1F02DCFF0);
}

uint64_t sub_1DB3B9A58@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF0C0, (uint64_t)&unk_1F02DCFF0, a1);
}

uint64_t sub_1DB3B9A74(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DD008);
}

uint64_t sub_1DB3B9A98()
{
  return sub_1DB3B2514(&qword_1F02DF0C8, (uint64_t)qword_1F02DD008);
}

uint64_t sub_1DB3B9AB4@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF0C8, (uint64_t)qword_1F02DD008, a1);
}

uint64_t sub_1DB3B9AD0(uint64_t a1)
{
  return sub_1DB3B9AF8(a1, qword_1F02DD020);
}

uint64_t sub_1DB3B9AF8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  id v4;

  v3 = sub_1DB3BC088();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_1F02DE680 != -1)
    swift_once();
  v4 = (id)qword_1F02DE688;
  return sub_1DB3BC07C();
}

uint64_t sub_1DB3B9B90()
{
  return sub_1DB3B2514(&qword_1F02DF0D0, (uint64_t)qword_1F02DD020);
}

uint64_t sub_1DB3B9BAC@<X0>(uint64_t a1@<X8>)
{
  return sub_1DB3B2570(&qword_1F02DF0D0, (uint64_t)qword_1F02DD020, a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_1DB3BBC8C()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1DB3BBC98()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1DB3BBCA4()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1DB3BBCB0()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1DB3BBCBC()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1DB3BBCC8()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1DB3BBCD4()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1DB3BBCE0()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1DB3BBCEC()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1DB3BBCF8()
{
  return MEMORY[0x1E0CB0BD8]();
}

uint64_t sub_1DB3BBD04()
{
  return MEMORY[0x1E0CB0D68]();
}

uint64_t sub_1DB3BBD10()
{
  return MEMORY[0x1E0CB0D98]();
}

uint64_t sub_1DB3BBD1C()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1DB3BBD28()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1DB3BBD34()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_1DB3BBD40()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1DB3BBD4C()
{
  return MEMORY[0x1E0DC1A20]();
}

uint64_t sub_1DB3BBD58()
{
  return MEMORY[0x1E0DC1A30]();
}

uint64_t sub_1DB3BBD64()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1DB3BBD70()
{
  return MEMORY[0x1E0D817C0]();
}

uint64_t sub_1DB3BBD7C()
{
  return MEMORY[0x1E0D817D0]();
}

uint64_t sub_1DB3BBD88()
{
  return MEMORY[0x1E0D817D8]();
}

uint64_t sub_1DB3BBD94()
{
  return MEMORY[0x1E0D817E0]();
}

uint64_t sub_1DB3BBDA0()
{
  return MEMORY[0x1E0D817E8]();
}

uint64_t sub_1DB3BBDAC()
{
  return MEMORY[0x1E0D817F8]();
}

uint64_t sub_1DB3BBDB8()
{
  return MEMORY[0x1E0D81800]();
}

uint64_t sub_1DB3BBDC4()
{
  return MEMORY[0x1E0D81808]();
}

uint64_t sub_1DB3BBDD0()
{
  return MEMORY[0x1E0D81818]();
}

uint64_t sub_1DB3BBDDC()
{
  return MEMORY[0x1E0D81820]();
}

uint64_t sub_1DB3BBDE8()
{
  return MEMORY[0x1E0D81828]();
}

uint64_t sub_1DB3BBDF4()
{
  return MEMORY[0x1E0D81830]();
}

uint64_t sub_1DB3BBE00()
{
  return MEMORY[0x1E0D81838]();
}

uint64_t sub_1DB3BBE0C()
{
  return MEMORY[0x1E0D81848]();
}

uint64_t sub_1DB3BBE18()
{
  return MEMORY[0x1E0D28808]();
}

uint64_t sub_1DB3BBE24()
{
  return MEMORY[0x1E0D28820]();
}

uint64_t sub_1DB3BBE30()
{
  return MEMORY[0x1E0D28828]();
}

uint64_t sub_1DB3BBE3C()
{
  return MEMORY[0x1E0D28830]();
}

uint64_t sub_1DB3BBE48()
{
  return MEMORY[0x1E0D28838]();
}

uint64_t sub_1DB3BBE54()
{
  return MEMORY[0x1E0D28840]();
}

uint64_t sub_1DB3BBE60()
{
  return MEMORY[0x1E0D28848]();
}

uint64_t sub_1DB3BBE6C()
{
  return MEMORY[0x1E0D28850]();
}

uint64_t sub_1DB3BBE78()
{
  return MEMORY[0x1E0D28858]();
}

uint64_t sub_1DB3BBE84()
{
  return MEMORY[0x1E0D28860]();
}

uint64_t sub_1DB3BBE90()
{
  return MEMORY[0x1E0D28868]();
}

uint64_t sub_1DB3BBE9C()
{
  return MEMORY[0x1E0D28870]();
}

uint64_t sub_1DB3BBEA8()
{
  return MEMORY[0x1E0D28878]();
}

uint64_t sub_1DB3BBEB4()
{
  return MEMORY[0x1E0D28880]();
}

uint64_t sub_1DB3BBEC0()
{
  return MEMORY[0x1E0D28888]();
}

uint64_t sub_1DB3BBECC()
{
  return MEMORY[0x1E0D28890]();
}

uint64_t sub_1DB3BBED8()
{
  return MEMORY[0x1E0D28898]();
}

uint64_t sub_1DB3BBEE4()
{
  return MEMORY[0x1E0D288A0]();
}

uint64_t sub_1DB3BBEF0()
{
  return MEMORY[0x1E0D288A8]();
}

uint64_t sub_1DB3BBEFC()
{
  return MEMORY[0x1E0D288B0]();
}

uint64_t sub_1DB3BBF08()
{
  return MEMORY[0x1E0D288B8]();
}

uint64_t sub_1DB3BBF14()
{
  return MEMORY[0x1E0D288C0]();
}

uint64_t sub_1DB3BBF20()
{
  return MEMORY[0x1E0D288C8]();
}

uint64_t sub_1DB3BBF2C()
{
  return MEMORY[0x1E0D288D0]();
}

uint64_t sub_1DB3BBF38()
{
  return MEMORY[0x1E0D288D8]();
}

uint64_t sub_1DB3BBF44()
{
  return MEMORY[0x1E0D288E0]();
}

uint64_t sub_1DB3BBF50()
{
  return MEMORY[0x1E0D288E8]();
}

uint64_t sub_1DB3BBF5C()
{
  return MEMORY[0x1E0D288F0]();
}

uint64_t sub_1DB3BBF68()
{
  return MEMORY[0x1E0D288F8]();
}

uint64_t sub_1DB3BBF74()
{
  return MEMORY[0x1E0D28908]();
}

uint64_t sub_1DB3BBF80()
{
  return MEMORY[0x1E0D28910]();
}

uint64_t sub_1DB3BBF8C()
{
  return MEMORY[0x1E0D28918]();
}

uint64_t sub_1DB3BBF98()
{
  return MEMORY[0x1E0D28920]();
}

uint64_t sub_1DB3BBFA4()
{
  return MEMORY[0x1E0D28928]();
}

uint64_t sub_1DB3BBFB0()
{
  return MEMORY[0x1E0D28930]();
}

uint64_t sub_1DB3BBFBC()
{
  return MEMORY[0x1E0D28938]();
}

uint64_t sub_1DB3BBFC8()
{
  return MEMORY[0x1E0D28940]();
}

uint64_t sub_1DB3BBFD4()
{
  return MEMORY[0x1E0D28948]();
}

uint64_t sub_1DB3BBFE0()
{
  return MEMORY[0x1E0D28950]();
}

uint64_t sub_1DB3BBFEC()
{
  return MEMORY[0x1E0D28958]();
}

uint64_t sub_1DB3BBFF8()
{
  return MEMORY[0x1E0D28960]();
}

uint64_t sub_1DB3BC004()
{
  return MEMORY[0x1E0D28968]();
}

uint64_t sub_1DB3BC010()
{
  return MEMORY[0x1E0D28970]();
}

uint64_t sub_1DB3BC01C()
{
  return MEMORY[0x1E0D28978]();
}

uint64_t sub_1DB3BC028()
{
  return MEMORY[0x1E0D28980]();
}

uint64_t sub_1DB3BC034()
{
  return MEMORY[0x1E0D28988]();
}

uint64_t sub_1DB3BC040()
{
  return MEMORY[0x1E0D28990]();
}

uint64_t sub_1DB3BC04C()
{
  return MEMORY[0x1E0D28998]();
}

uint64_t sub_1DB3BC058()
{
  return MEMORY[0x1E0D289A8]();
}

uint64_t sub_1DB3BC064()
{
  return MEMORY[0x1E0D289B0]();
}

uint64_t sub_1DB3BC070()
{
  return MEMORY[0x1E0D289C0]();
}

uint64_t sub_1DB3BC07C()
{
  return MEMORY[0x1E0CA9B98]();
}

uint64_t sub_1DB3BC088()
{
  return MEMORY[0x1E0CA9BA8]();
}

uint64_t sub_1DB3BC094()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1DB3BC0A0()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1DB3BC0AC()
{
  return MEMORY[0x1E0D289D0]();
}

uint64_t sub_1DB3BC0B8()
{
  return MEMORY[0x1E0D289D8]();
}

uint64_t sub_1DB3BC0C4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1DB3BC0D0()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1DB3BC0DC()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1DB3BC0E8()
{
  return MEMORY[0x1E0DC2168]();
}

uint64_t sub_1DB3BC0F4()
{
  return MEMORY[0x1E0DC2190]();
}

uint64_t sub_1DB3BC100()
{
  return MEMORY[0x1E0DC21B0]();
}

uint64_t sub_1DB3BC10C()
{
  return MEMORY[0x1E0DC2210]();
}

uint64_t sub_1DB3BC118()
{
  return MEMORY[0x1E0DC2218]();
}

uint64_t sub_1DB3BC124()
{
  return MEMORY[0x1E0DC2220]();
}

uint64_t sub_1DB3BC130()
{
  return MEMORY[0x1E0DC2238]();
}

uint64_t sub_1DB3BC13C()
{
  return MEMORY[0x1E0DC2250]();
}

uint64_t sub_1DB3BC148()
{
  return MEMORY[0x1E0DC2258]();
}

uint64_t sub_1DB3BC154()
{
  return MEMORY[0x1E0DC22E0]();
}

uint64_t sub_1DB3BC160()
{
  return MEMORY[0x1E0DC2308]();
}

uint64_t sub_1DB3BC16C()
{
  return MEMORY[0x1E0DC2360]();
}

uint64_t sub_1DB3BC178()
{
  return MEMORY[0x1E0DC23A0]();
}

uint64_t sub_1DB3BC184()
{
  return MEMORY[0x1E0DC29B8]();
}

uint64_t sub_1DB3BC190()
{
  return MEMORY[0x1E0C956B0]();
}

uint64_t sub_1DB3BC19C()
{
  return MEMORY[0x1E0C95CA8]();
}

uint64_t sub_1DB3BC1A8()
{
  return MEMORY[0x1E0C95DD8]();
}

uint64_t sub_1DB3BC1B4()
{
  return MEMORY[0x1E0C95E00]();
}

uint64_t sub_1DB3BC1C0()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1DB3BC1CC()
{
  return MEMORY[0x1E0C96018]();
}

uint64_t sub_1DB3BC1D8()
{
  return MEMORY[0x1E0C96030]();
}

uint64_t sub_1DB3BC1E4()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1DB3BC1F0()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1DB3BC1FC()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1DB3BC208()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_1DB3BC214()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1DB3BC220()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1DB3BC22C()
{
  return MEMORY[0x1E0C961D0]();
}

uint64_t sub_1DB3BC238()
{
  return MEMORY[0x1E0C96248]();
}

uint64_t sub_1DB3BC244()
{
  return MEMORY[0x1E0C962A8]();
}

uint64_t sub_1DB3BC250()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t sub_1DB3BC25C()
{
  return MEMORY[0x1E0C96388]();
}

uint64_t sub_1DB3BC268()
{
  return MEMORY[0x1E0C963B0]();
}

uint64_t sub_1DB3BC274()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1DB3BC280()
{
  return MEMORY[0x1E0C96418]();
}

uint64_t sub_1DB3BC28C()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1DB3BC298()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1DB3BC2A4()
{
  return MEMORY[0x1E0D20F98]();
}

uint64_t sub_1DB3BC2B0()
{
  return MEMORY[0x1E0D20FA8]();
}

uint64_t sub_1DB3BC2BC()
{
  return MEMORY[0x1E0D20FB0]();
}

uint64_t sub_1DB3BC2C8()
{
  return MEMORY[0x1E0D20FB8]();
}

uint64_t sub_1DB3BC2D4()
{
  return MEMORY[0x1E0D21000]();
}

uint64_t sub_1DB3BC2E0()
{
  return MEMORY[0x1E0D21008]();
}

uint64_t sub_1DB3BC2EC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1DB3BC2F8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1DB3BC304()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1DB3BC310()
{
  return MEMORY[0x1E0DE9F58]();
}

uint64_t sub_1DB3BC31C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DB3BC328()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1DB3BC334()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1DB3BC340()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DB3BC34C()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1DB3BC358()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1DB3BC364()
{
  return MEMORY[0x1E0DEA628]();
}

uint64_t sub_1DB3BC370()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1DB3BC37C()
{
  return MEMORY[0x1E0DEA7C8]();
}

uint64_t sub_1DB3BC388()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DB3BC394()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1DB3BC3A0()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1DB3BC3AC()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1DB3BC3B8()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1DB3BC3C4()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1DB3BC3D0()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1DB3BC3DC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1DB3BC3E8()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1DB3BC3F4()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1DB3BC400()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1DB3BC40C()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_1DB3BC418()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1DB3BC424()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1DB3BC430()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1DB3BC43C()
{
  return MEMORY[0x1E0CB1B88]();
}

uint64_t sub_1DB3BC448()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1DB3BC454()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1DB3BC460()
{
  return MEMORY[0x1E0DF1FE8]();
}

uint64_t sub_1DB3BC46C()
{
  return MEMORY[0x1E0CB1CD0]();
}

uint64_t sub_1DB3BC478()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1DB3BC484()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1DB3BC490()
{
  return MEMORY[0x1E0DC2B20]();
}

uint64_t sub_1DB3BC49C()
{
  return MEMORY[0x1E0DC2BF8]();
}

uint64_t sub_1DB3BC4A8()
{
  return MEMORY[0x1E0DEF868]();
}

uint64_t sub_1DB3BC4B4()
{
  return MEMORY[0x1E0DEF880]();
}

uint64_t sub_1DB3BC4C0()
{
  return MEMORY[0x1E0DEF8A0]();
}

uint64_t sub_1DB3BC4CC()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1DB3BC4D8()
{
  return MEMORY[0x1E0CB1F30]();
}

uint64_t sub_1DB3BC4E4()
{
  return MEMORY[0x1E0CB1F50]();
}

uint64_t sub_1DB3BC4F0()
{
  return MEMORY[0x1E0DEF328]();
}

uint64_t sub_1DB3BC4FC()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1DB3BC508()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1DB3BC514()
{
  return MEMORY[0x1E0DC2FF8]();
}

uint64_t sub_1DB3BC520()
{
  return MEMORY[0x1E0CB2190]();
}

uint64_t sub_1DB3BC52C()
{
  return MEMORY[0x1E0CB22E8]();
}

uint64_t sub_1DB3BC538()
{
  return MEMORY[0x1E0CB2308]();
}

uint64_t sub_1DB3BC544()
{
  return MEMORY[0x1E0CB2328]();
}

uint64_t sub_1DB3BC550()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1DB3BC55C()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1DB3BC568()
{
  return MEMORY[0x1E0DEB930]();
}

uint64_t sub_1DB3BC574()
{
  return MEMORY[0x1E0DEB938]();
}

uint64_t sub_1DB3BC580()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1DB3BC58C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1DB3BC598()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1DB3BC5A4()
{
  return MEMORY[0x1E0CB2540]();
}

uint64_t sub_1DB3BC5B0()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1DB3BC5BC()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1DB3BC5C8()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1DB3BC5D4()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1DB3BC5E0()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1DB3BC5EC()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1DB3BC5F8()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1DB3BC604()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1DB3BC610()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1DB3BC61C()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1DB3BC628()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1DB3BC634()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1DB3BC640()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1DB3BC64C()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1DB3BC658()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1DB3BC664()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1DB3BC670()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1DB3BC67C()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1DB3BC688()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1DB3BC694()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1DB3BC6A0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1DB3BC6AC()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1DB3BC6B8()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1DB3BC6C4()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1DB3BC6D0()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DB3BC6DC()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1DB3BC6E8()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1DB3BC6F4()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1DB3BC700()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_1DB3BC70C()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DB3BC718()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1DB3BC724()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
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

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x1E0D1AA60]();
}

uint64_t CFPrefs_SetValue()
{
  return MEMORY[0x1E0D1AA98]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
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

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
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

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x1E0CB3128](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PSBlankIconImage()
{
  return MEMORY[0x1E0D80718]();
}

uint64_t PreferencesTableViewFooterColor()
{
  return MEMORY[0x1E0D809A8]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x1E0D809B0]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0DC4548]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
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

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x1E0DEEB78]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

