void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_0_4(_QWORD *a1, uint64_t *a2)
{
  return sub_219F8DC88(a1, a2);
}

void sub_219F73E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAKAppleIDAuthenticationInAppContextClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!AuthKitUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24DC273B0;
    v5 = 0;
    AuthKitUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AuthKitUILibraryCore_frameworkLibrary)
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AKAppleIDAuthenticationInAppContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_2();
  getAKAppleIDAuthenticationInAppContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id OUTLINED_FUNCTION_4(id a1)
{
  return a1;
}

void _annotateDrawInRectWithContextAndInput(uint64_t a1, CGContext *CurrentContext, void *a3, double a4, double a5, CGFloat a6, CGFloat a7)
{
  id v11;
  void *v12;
  CGSize v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  const char *v23;
  id v24;
  CGSize v25;

  v11 = a3;
  if (v11)
  {
    v24 = v11;
    if (_annotateDrawInRectWithContextAndInput_onceToken != -1)
    {
      dispatch_once(&_annotateDrawInRectWithContextAndInput_onceToken, &__block_literal_global_207);
      v11 = v24;
    }
    objc_getAssociatedObject(v11, CFSTR("GK_IMAGE_URL_ANNOTATION_KEY"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if (!CurrentContext)
        CurrentContext = UIGraphicsGetCurrentContext();
      v25.width = a6;
      v25.height = a7;
      v13 = CGContextConvertSizeToDeviceSpace(CurrentContext, v25);
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = v24;
      objc_msgSend(v15, "size");
      v17 = v16;
      objc_msgSend(v15, "size");
      v19 = v18;

      objc_msgSend(v12, "absoluteString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Server Image Usage: %s rect.size=%g x %g image.size=%g x %g %@\n"), a1, *(_QWORD *)&v13.width, *(_QWORD *)&v13.height, v17, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_retainAutorelease(v21);
      v23 = (const char *)objc_msgSend(v22, "UTF8String");
      fputs(v23, (FILE *)_annotateDrawInRectWithContextAndInput_output);
      fflush((FILE *)_annotateDrawInRectWithContextAndInput_output);

    }
    v11 = v24;
  }

}

void sub_219F79040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void ___annotateDrawInRectWithContextAndInput_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/Logs"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v0, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v7);
  v4 = v7;
  if (v4)
  {
    NSLog(CFSTR("Failed to create logs folder: %@"), v4);
    exit(1);
  }
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("GKImageAnnotation.log"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("GKImageAnnotation log path=%@"), v5);
  v6 = objc_retainAutorelease(v5);
  _annotateDrawInRectWithContextAndInput_output = (uint64_t)fopen((const char *)objc_msgSend(v6, "UTF8String"), "w+");

}

void sub_219F7D320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v21);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219F7DA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_219F7EC78(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void GKRectsCenterYInRect(uint64_t a1, double **a2, double a3, double a4, double a5, double a6, double a7)
{
  double **v7;
  uint64_t v8;
  uint64_t v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 >= 1)
  {
    v7 = a2;
    v8 = a1;
    v10 = 0;
    v11 = 0.0;
    do
    {
      v12 = -0.0;
      if (v10)
        v12 = a7;
      v11 = v11 + v12 + a2[v10++][3];
    }
    while (a1 != v10);
    v13 = (a6 - v11) * 0.5;
    v14 = a4 + floorf(v13);
    do
    {
      v15 = *v7++;
      v15[1] = v14;
      v16 = *v15;
      v17 = *((_QWORD *)v15 + 2);
      v18 = *((_QWORD *)v15 + 3);
      v14 = CGRectGetMaxY(*(CGRect *)(&v14 - 1)) + a7;
      --v8;
    }
    while (v8);
  }
}

void GKRectsCenterXInRect(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  uint64_t v10;
  double v11;
  uint64_t v12;
  float v13;
  double MaxY;
  CGFloat *v15;
  double v16;
  CGRect v17;

  if (a1 >= 1)
  {
    v10 = 0;
    v11 = a7;
    do
      v11 = v11 + *(double *)(*(_QWORD *)(a2 + 8 * v10++) + 16);
    while (a1 != v10);
    v12 = 0;
    v13 = (a5 - v11) * 0.5;
    MaxY = a3 + floorf(v13);
    do
    {
      v15 = *(CGFloat **)(a2 + 8 * v12);
      v16 = -0.0;
      if (v12)
        v16 = a7;
      v17.origin.x = MaxY + v16;
      *v15 = v17.origin.x;
      v17.origin.y = v15[1];
      v17.size.width = v15[2];
      v17.size.height = v15[3];
      MaxY = CGRectGetMaxY(v17);
      ++v12;
    }
    while (a1 != v12);
  }
}

double GKRectEnforceMinimumHeight(uint64_t a1, uint64_t a2, double a3)
{
  double v3;
  double result;
  double v5;

  v3 = *(double *)(a1 + 24);
  result = a3 - v3;
  if (result > 0.0)
  {
    *(double *)(a1 + 24) = v3 + result;
    v5 = *(double *)(a2 + 24);
    if (v5 > result)
    {
      result = v5 - result;
      *(double *)(a2 + 24) = result;
    }
  }
  return result;
}

CGFloat GKRectDivideYIntoThreeConsumingMiddle(double *a1, double *a2, double *a3, CGFloat a4, double a5, CGFloat a6, double a7, double a8, double a9, double a10)
{
  CGFloat v19;
  CGFloat v21;
  CGFloat result;
  CGRect v23;

  v19 = a7 - (a8 + a9 + a10 * 2.0);
  v21 = CGRectGetMaxY(*(CGRect *)&a4) + a10;
  v23.origin.x = a4;
  v23.origin.y = v21;
  v23.size.width = a6;
  v23.size.height = v19;
  result = CGRectGetMaxY(v23) + a10;
  *a1 = a4;
  a1[1] = a5;
  a1[2] = a6;
  a1[3] = a8;
  *a2 = a4;
  a2[1] = v21;
  a2[2] = a6;
  a2[3] = v19;
  *a3 = a4;
  a3[1] = result;
  a3[2] = a6;
  a3[3] = a9;
  return result;
}

void sub_219F7F754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  void *v0;

  return objc_msgSend(v0, "length");
}

uint64_t GKIsXRUIIdiom()
{
  return 0;
}

uint64_t GKIsXRUIIdiomShouldUsePadUI()
{
  return 0;
}

uint64_t GKIsXRUIIdiomShouldUsePhoneUI()
{
  return 0;
}

uint64_t GKHostUsesXRUIIdiom()
{
  return 0;
}

uint64_t GKIsAvatarEditingSupported()
{
  if (GKIsAvatarEditingSupported_onceToken != -1)
    dispatch_once(&GKIsAvatarEditingSupported_onceToken, &__block_literal_global_7);
  return GKIsAvatarEditingSupported_sIsSupported;
}

uint64_t GKCurrentMedusaMode()
{
  void *v0;
  int v1;
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "userInterfaceIdiom") != 1)
    goto LABEL_5;
  v1 = *MEMORY[0x24BE3A2C0];

  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;

    objc_msgSend((id)*MEMORY[0x24BDF74F8], "windows");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v0 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v0, "bounds");
    v8 = v7 / v5;
    if (v7 / v5 != 0.0)
    {
      if (v8 >= 0.4)
      {
        if (v8 >= 0.6)
        {
          if (v8 >= 0.9)
            v2 = 3;
          else
            v2 = 2;
        }
        else
        {
          v2 = 1;
        }
      }
      else
      {
        v2 = 0;
      }
      goto LABEL_6;
    }
LABEL_5:
    v2 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

    return v2;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

BOOL GKShouldLayoutRTL()
{
  return objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection") == 1;
}

void sub_219F80DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 160), 8);
  _Block_object_dispose((const void *)(v33 - 128), 8);
  _Unwind_Resume(a1);
}

double GKRoundToScreenScale(double a1)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  return round(v4 * a1) / v4;
}

void sub_219F87740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_8(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t sub_219F8D2D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _BYTE v16[16];

  sub_219F9C050();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v0 = sub_219F9BFD8();
  v1 = *(_QWORD *)(v0 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = &v16[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_219F9C0B0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = sub_219F9BFE4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v16[-v9];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v0, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v1 + 16))(v3, v11, v0);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(v8, v10, v4);
  v12 = sub_219F9C0D4();
  v14 = v13;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v10, v4);
  qword_2550BC208 = v12;
  unk_2550BC210 = v14;
  return result;
}

uint64_t static GCUILocalizedStrings.ACHIEVEMENT_PENDING_APPROVAL.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC200, &qword_2550BC208);
}

void static GCUILocalizedStrings.ACHIEVEMENT_RARITY_PERCENT(_:)()
{
  uint64_t v0;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_13();
  v14 = v2;
  v15 = v3;
  v16 = v4;
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_52();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_40();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_32();
  sub_219F9C080();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_29();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_24((uint64_t)v8, v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16));
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_20();
  v14 = "Copy for global player UI when Achievement rarity percent is 0% or more than 10%.";
  v15 = 81;
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_37();
  sub_219F99F50();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_4_2();
}

void static GCUILocalizedStrings.ACHIEVEMENT_RARITY_PERCENT_LESS_THAN_FRACTION(_:)()
{
  uint64_t v0;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_13();
  v14 = v2;
  v15 = v3;
  v16 = v4;
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_52();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_40();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_32();
  sub_219F9C080();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_29();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_24((uint64_t)v8, v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16));
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_20();
  v14 = "Copy for global player UI when Achievement rarity percent is less than 0.1%.";
  v15 = 76;
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_37();
  sub_219F99F50();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_4_2();
}

void static GCUILocalizedStrings.ACHIEVEMENT_RARITY_PERCENT_ONLY(_:)()
{
  uint64_t v0;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_13();
  v14 = v2;
  v15 = v3;
  v16 = v4;
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_52();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_40();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_32();
  sub_219F9C080();
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_29();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_24((uint64_t)v8, v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16));
  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_20();
  v14 = "Copy for global player UI when Achievement rarity percent is less than 1 or 10%.";
  v15 = 80;
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_37();
  sub_219F99F50();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_219F8DA38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC220 = v14;
  *(_QWORD *)algn_2550BC228 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.DEVELOPER.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC218, &qword_2550BC220);
}

uint64_t sub_219F8DC88(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_219F8DCE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC238 = v14;
  unk_2550BC240 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_INVITE_CODE_FETCH_IN_PROGRESS_ERROR.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC230, &qword_2550BC238);
}

uint64_t sub_219F8DF40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC250 = v14;
  *(_QWORD *)algn_2550BC258 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_REQUEST_MODULE_SENDER_SUBTITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC248, &qword_2550BC250);
}

uint64_t sub_219F8E19C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC268 = v14;
  unk_2550BC270 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_REQUEST_MODULE_SUBTITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC260, &qword_2550BC268);
}

void static GCUILocalizedStrings.FRIEND_REQUEST_MODULE_UPSELL(playerName:)()
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

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v4);
  v5 = OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_62();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_53();
  sub_219F9C074();
  sub_219F9C080();
  OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v5, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_21(v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16));
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_24(v2, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_30(v3, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_219F8E590()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC280 = v14;
  *(_QWORD *)algn_2550BC288 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_REQUEST_CELL_FROM_CONTACTS_LABEL.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC278, &qword_2550BC280);
}

uint64_t sub_219F8E7F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC298 = v14;
  unk_2550BC2A0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.GAME_CENTER.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC290, &qword_2550BC298);
}

uint64_t sub_219F8EA54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC2B0 = v14;
  *(_QWORD *)algn_2550BC2B8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.GAME_CENTER_FRIEND_REQUEST_ACCEPTED.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC2A8, &qword_2550BC2B0);
}

uint64_t sub_219F8ECB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC2C8 = v14;
  unk_2550BC2D0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.LEADERBOARD_PENDING_APPROVAL.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC2C0, &qword_2550BC2C8);
}

uint64_t sub_219F8EF0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v15[0] = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_219F9BFE4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v15 - v10;
  v12 = sub_219F9BFA8();
  __swift_allocate_value_buffer(v12, qword_2550BC2E0);
  __swift_project_value_buffer(v12, (uint64_t)qword_2550BC2E0);
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(char *, uint64_t, uint64_t))(v15[0] + 16))(v3, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  sub_219F99F50();
  sub_219F9BF9C();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

uint64_t static GCUILocalizedStrings.NO_ACHIEVEMENT_RARITY.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2550BC2D8 != -1)
    swift_once();
  v2 = sub_219F9BFA8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2550BC2E0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_219F8F1E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC300 = v14;
  *(_QWORD *)algn_2550BC308 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.NO_FRIENDS_EMPTY_STATE_DESCRIPTION.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC2F8, &qword_2550BC300);
}

uint64_t sub_219F8F444()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC318 = v14;
  unk_2550BC320 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.PLAYER_CARD_BUTTON_INVITE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC310, &qword_2550BC318);
}

uint64_t sub_219F8F698()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC330 = v14;
  *(_QWORD *)algn_2550BC338 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.PLAYER_PICKER_NEARBY_OR_BOOP_INSTRUCTIONAL_MESSAGE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC328, &qword_2550BC330);
}

uint64_t sub_219F8F8F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC348 = v14;
  unk_2550BC350 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.PLAYER_PICKER_NEARBY_OR_BOOP_INSTRUCTIONAL_MESSAGE_WLAN.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC340, &qword_2550BC348);
}

uint64_t sub_219F8FB50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC360 = v14;
  *(_QWORD *)algn_2550BC368 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.PRERELEASE_ITEM.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC358, &qword_2550BC360);
}

uint64_t sub_219F8FDAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC378 = v14;
  unk_2550BC380 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.READY_FOR_REVIEW.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC370, &qword_2550BC378);
}

uint64_t sub_219F90008()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC390 = v14;
  *(_QWORD *)algn_2550BC398 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.RETRY.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC388, &qword_2550BC390);
}

uint64_t sub_219F90264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC3A8 = v14;
  unk_2550BC3B0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_BANNER_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC3A0, &qword_2550BC3A8);
}

uint64_t sub_219F904C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC3C0 = v14;
  *(_QWORD *)algn_2550BC3C8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_BANNER_SUBTITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC3B8, &qword_2550BC3C0);
}

uint64_t sub_219F9071C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC3D8 = v14;
  unk_2550BC3E0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_TITLE_MESSAGE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC3D0, &qword_2550BC3D8);
}

uint64_t sub_219F90978()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC3F0 = v14;
  *(_QWORD *)algn_2550BC3F8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_WITH_APPLEID_BUTTON_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC3E8, &qword_2550BC3F0);
}

uint64_t sub_219F90BD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC408 = v14;
  unk_2550BC410 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_BUTTON_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC400, &qword_2550BC408);
}

uint64_t sub_219F90E2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC420 = v14;
  *(_QWORD *)algn_2550BC428 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_PROMPT_MESSAGE_TEXT.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC418, &qword_2550BC420);
}

uint64_t sub_219F91088()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC438 = v14;
  unk_2550BC440 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SIGN_IN_PROMPT_MESSAGE_TEXT_WITH_APPLEID.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC430, &qword_2550BC438);
}

uint64_t sub_219F912E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC450 = v14;
  *(_QWORD *)algn_2550BC458 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIENDS_WHO_HAVE_THIS.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC448, &qword_2550BC450);
}

void static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_SEC_AGO(sec:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_23(v0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_16();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_33();
  v7 = OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    v7 = swift_once();
  OUTLINED_FUNCTION_9(v7, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

void static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_MIN_AGO(min:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_23(v0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_16();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_33();
  v7 = OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    v7 = swift_once();
  OUTLINED_FUNCTION_9(v7, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

id sub_219F917B0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  void *v4;

  a4(a3);
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_54();
  return OUTLINED_FUNCTION_44(v4);
}

void static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_HOUR_AGO(hr:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_23(v0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_16();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_33();
  v7 = OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    v7 = swift_once();
  OUTLINED_FUNCTION_9(v7, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

void static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_DAY_AGO(day:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_23(v0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_16();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_33();
  v7 = OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    v7 = swift_once();
  OUTLINED_FUNCTION_9(v7, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

void static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_WEEK_AGO(week:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_23(v0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_16();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_33();
  v7 = OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    v7 = swift_once();
  OUTLINED_FUNCTION_9(v7, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

void static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_AVATAR_COUNT(COUNT:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_23(v0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_16();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_32();
  sub_219F9C080();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_22();
  v7 = OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    v7 = swift_once();
  OUTLINED_FUNCTION_9(v7, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_219F91CD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC468 = v14;
  unk_2550BC470 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_SECTION_SHOW_MORE_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC460, &qword_2550BC468);
}

uint64_t sub_219F91F30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC480 = v14;
  *(_QWORD *)algn_2550BC488 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_WHO_EARNED_THIS_SECTION_SHOW_LESS_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC478, &qword_2550BC480);
}

void static GCUILocalizedStrings.LEADERBOARD_LIST_ITEM_SUBTITLE_FRIENDS_PLAYING(COUNT:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_23(v0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_16();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_12();
  sub_219F9C080();
  v7 = OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    v7 = swift_once();
  OUTLINED_FUNCTION_9(v7, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_219F922E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC498 = v14;
  unk_2550BC4A0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.PROFILE_CREATION_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC490, &qword_2550BC498);
}

uint64_t sub_219F9253C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC4B0 = v14;
  *(_QWORD *)algn_2550BC4B8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.CHOOSE_NICKNAME_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC4A8, &qword_2550BC4B0);
}

uint64_t sub_219F92798()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC4C8 = v14;
  unk_2550BC4D0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ACTIVITY_SHARING_HEADER.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC4C0, &qword_2550BC4C8);
}

uint64_t sub_219F929F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC4E0 = v14;
  *(_QWORD *)algn_2550BC4E8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ACTIVITY_SHARING_DESCRIPTION.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC4D8, &qword_2550BC4E0);
}

uint64_t sub_219F92C50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC4F8 = v14;
  unk_2550BC500 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ACTIVITY_SHARING_DESCRIPTION_TVOS.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC4F0, &qword_2550BC4F8);
}

uint64_t sub_219F92EAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC510 = v14;
  *(_QWORD *)algn_2550BC518 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.AVATAR_DESCRIPTION_TVOS.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC508, &qword_2550BC510);
}

uint64_t sub_219F93108()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC528 = v14;
  unk_2550BC530 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_CUSTOMIZE_PROFILE_BUTTON_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC520, &qword_2550BC528);
}

uint64_t sub_219F93364()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC540 = v14;
  *(_QWORD *)algn_2550BC548 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_MAC_CUSTOMIZE_PROFILE_BUTTON_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC538, &qword_2550BC540);
}

uint64_t sub_219F935C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC558 = v14;
  unk_2550BC560 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_CUSTOMIZE_PROFILE_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC550, &qword_2550BC558);
}

uint64_t sub_219F9381C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC570 = v14;
  *(_QWORD *)algn_2550BC578 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_ONBOARDING_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC568, &qword_2550BC570);
}

uint64_t sub_219F93A80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC588 = v14;
  unk_2550BC590 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_ONBOARDING_SUBTITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC580, &qword_2550BC588);
}

uint64_t sub_219F93CDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC5A0 = v14;
  *(_QWORD *)algn_2550BC5A8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SHEET_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC598, &qword_2550BC5A0);
}

uint64_t sub_219F93F40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC5B8 = v14;
  unk_2550BC5C0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SHEET_HEADER.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC5B0, &qword_2550BC5B8);
}

uint64_t sub_219F941A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC5D0 = v14;
  *(_QWORD *)algn_2550BC5D8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SEARCH_SHEET_HEADER.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC5C8, &qword_2550BC5D0);
}

uint64_t sub_219F943F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC5E8 = v14;
  unk_2550BC5F0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SHEET_SEARCH_PLACEHOLDER.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC5E0, &qword_2550BC5E8);
}

uint64_t sub_219F9465C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC600 = v14;
  *(_QWORD *)algn_2550BC608 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.INVITE_FRIENDS_SHEET_DONE_BUTTON_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC5F8, &qword_2550BC600);
}

uint64_t sub_219F948AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC618 = v14;
  unk_2550BC620 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_SUGGESTION_FROM_CONTACTS_SUBTITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC610, &qword_2550BC618);
}

uint64_t sub_219F94B10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC630 = v14;
  *(_QWORD *)algn_2550BC638 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_SUGGESTION_INVITE_BUTTON_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC628, &qword_2550BC630);
}

uint64_t sub_219F94D64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC648 = v14;
  unk_2550BC650 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_SUGGESTION_HIDE_BUTTON_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC640, &qword_2550BC648);
}

uint64_t sub_219F94FB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC660 = v14;
  *(_QWORD *)algn_2550BC668 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.FRIEND_SUGGESTION_SENT_BUTTON_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC658, &qword_2550BC660);
}

uint64_t sub_219F95204()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC678 = v14;
  unk_2550BC680 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_REQUESTS_SECTION_FOOTER.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC670, &qword_2550BC678);
}

uint64_t sub_219F95460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC690 = v14;
  *(_QWORD *)algn_2550BC698 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_REQUESTS_INVITE_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC688, &qword_2550BC690);
}

uint64_t sub_219F956BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC6A8 = v14;
  unk_2550BC6B0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_REQUESTS_INVITE_SUBTITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC6A0, &qword_2550BC6A8);
}

uint64_t sub_219F95918()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC6C0 = v14;
  *(_QWORD *)algn_2550BC6C8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_REQUESTS_EMPTY_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC6B8, &qword_2550BC6C0);
}

uint64_t sub_219F95B74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC6D8 = v14;
  unk_2550BC6E0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_REQUESTS_EMPTY_SUBTITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC6D0, &qword_2550BC6D8);
}

uint64_t sub_219F95DD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC6F0 = v14;
  *(_QWORD *)algn_2550BC6F8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_SUGGESTIONS_SECTION_HEADER.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC6E8, &qword_2550BC6F0);
}

void static GCUILocalizedStrings.SETTINGS_ALL_FRIENDS_SECTION_HEADER(count:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_23(v0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_16();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_55();
  v7 = OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    v7 = swift_once();
  OUTLINED_FUNCTION_9(v7, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_219F96170()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC708 = v14;
  unk_2550BC710 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_ALL_FRIENDS_EMPTY_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC700, &qword_2550BC708);
}

uint64_t sub_219F963D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC720 = v14;
  *(_QWORD *)algn_2550BC728 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_ALL_FRIENDS_EMPTY_SUBTITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC718, &qword_2550BC720);
}

uint64_t sub_219F96630()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC738 = v14;
  unk_2550BC740 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_NICKNAME_MESSAGE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC730, &qword_2550BC738);
}

uint64_t sub_219F9688C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC750 = v14;
  *(_QWORD *)algn_2550BC758 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_FRIEND_SUGGESTIONS_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC748, &qword_2550BC750);
}

uint64_t sub_219F96AEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC768 = v14;
  unk_2550BC770 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_VIEW_PROFILE_BUTTON_TEXT.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC760, &qword_2550BC768);
}

uint64_t sub_219F96D3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC780 = v14;
  *(_QWORD *)algn_2550BC788 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.CONTACTS_INTEGRATION_ONBOARDING_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC778, &qword_2550BC780);
}

uint64_t sub_219F96F98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC798 = v14;
  unk_2550BC7A0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.CONTACTS_INTEGRATION_ONBOARDING_SUBTITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC790, &qword_2550BC798);
}

uint64_t sub_219F971F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC7B0 = v14;
  *(_QWORD *)algn_2550BC7B8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ACTIVITY_SHARING_REPROMPT_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC7A8, &qword_2550BC7B0);
}

void static GCUILocalizedStrings.ACTIVITY_SHARING_REPROMPT_SUBTITLE(recipientName:)()
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
  uint64_t v12;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_65();
  v4 = OUTLINED_FUNCTION_26();
  v12 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_65();
  v11 = v5;
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_53();
  sub_219F9C074();
  OUTLINED_FUNCTION_67();
  sub_219F9C074();
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v4, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_31(v11, v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16));
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20();
  sub_219F9BFF0();
  OUTLINED_FUNCTION_24(v1, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16));
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_30(v2, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

id sub_219F97654(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;
  void *v6;

  v5 = sub_219F9C0C8();
  a4(v5);
  swift_bridgeObjectRelease();
  v6 = (void *)sub_219F9C0BC();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_219F976B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC7C8 = v14;
  unk_2550BC7D0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ACTIVITY_SHARING_REPROMPT_SHARE_BUTTON_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC7C0, &qword_2550BC7C8);
}

uint64_t sub_219F97910()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC7E0 = v14;
  *(_QWORD *)algn_2550BC7E8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ACTIVITY_SHARING_REPROMPT_NOT_NOW_BUTTON_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC7D8, &qword_2550BC7E0);
}

uint64_t sub_219F97B68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC7F8 = v14;
  unk_2550BC800 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_WELCOME_BANNER_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC7F0, &qword_2550BC7F8);
}

uint64_t sub_219F97DC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC810 = v14;
  *(_QWORD *)algn_2550BC818 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_WELCOME_BANNER_TITLE_SHORT.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC808, &qword_2550BC810);
}

uint64_t sub_219F98024()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC828 = v14;
  unk_2550BC830 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_ACCESS_POINT_GAMES_FOR_YOU.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC820, &qword_2550BC828);
}

uint64_t sub_219F9827C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC840 = v14;
  *(_QWORD *)algn_2550BC848 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_ACHIEVEMENT_HIGHLIGHT_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC838, &qword_2550BC840);
}

void static GCUILocalizedStrings.OVERLAY_ACHIEVEMENT_HIGHLIGHT_SUBTITLE_INPROGRESS(completed:total:)()
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;

  OUTLINED_FUNCTION_13();
  v19 = v4;
  v6 = v5;
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v7);
  v21 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OUTLINED_FUNCTION_26();
  v10 = OUTLINED_FUNCTION_58(v9);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_63();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_22();
  v22 = v6;
  OUTLINED_FUNCTION_49();
  sub_219F9C080();
  v22 = v19;
  OUTLINED_FUNCTION_49();
  sub_219F9C080();
  OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_31((uint64_t)v12, v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 16));
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_20();
  v18 = "Access Point achievements highlight subtitle (e.g. 15 / 49)";
  v19 = 59;
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_24(v2, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16));
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_30(v3, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

void static GCUILocalizedStrings.OVERLAY_ACHIEVEMENT_HIGHLIGHT_SUBTITLE(total:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_23(v0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_16();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_12();
  sub_219F9C080();
  v7 = OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    v7 = swift_once();
  OUTLINED_FUNCTION_9(v7, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_219F98814()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC858 = v14;
  unk_2550BC860 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_LEADERBOARD_HIGHLIGHT_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC850, &qword_2550BC858);
}

void static GCUILocalizedStrings.OVERLAY_LEADERBOARD_HIGHLIGHT_SUBTITLE_FRIEND_RANK(rank:total:)()
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;

  OUTLINED_FUNCTION_13();
  v19 = v4;
  v6 = v5;
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v7);
  v21 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OUTLINED_FUNCTION_26();
  v10 = OUTLINED_FUNCTION_58(v9);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_63();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_61();
  sub_219F9C080();
  v22 = v6;
  OUTLINED_FUNCTION_48();
  sub_219F9C080();
  v22 = v19;
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_31((uint64_t)v12, v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 16));
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_20();
  v18 = "Access Point leaderboards highlight subtitle showing player's position among friends";
  v19 = 84;
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_24(v2, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16));
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_30(v3, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

id sub_219F98C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  void *v5;

  a5(a3, a4);
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_54();
  return OUTLINED_FUNCTION_44(v5);
}

void static GCUILocalizedStrings.OVERLAY_LEADERBOARD_HIGHLIGHT_SUBTITLE_GET_STARTED(leaderboardName:)()
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

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v4);
  v5 = OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_57();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_62();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_39();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_51();
  OUTLINED_FUNCTION_32();
  sub_219F9C080();
  sub_219F9C074();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v5, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_21(v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16));
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_24(v2, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_30(v3, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

void static GCUILocalizedStrings.OVERLAY_FRIEND_REQUESTS_HIGHLIGHT_TITLE(count:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_23(v0);
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_16();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_17();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_32();
  sub_219F9C080();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_53();
  v7 = OUTLINED_FUNCTION_14();
  if (qword_2550BC8F8 != -1)
    v7 = swift_once();
  OUTLINED_FUNCTION_9(v7, (uint64_t)qword_2550BC900);
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_2();
}

uint64_t sub_219F98F70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC870 = v14;
  *(_QWORD *)algn_2550BC878 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_GAME_MODE_TITLE.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC868, &qword_2550BC870);
}

uint64_t sub_219F991CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC888 = v14;
  unk_2550BC890 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_GAME_MODE_ON.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC880, &qword_2550BC888);
}

uint64_t sub_219F99418()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC8A0 = v14;
  *(_QWORD *)algn_2550BC8A8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_GAME_MODE_OFF.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC898, &qword_2550BC8A0);
}

uint64_t sub_219F99668()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC8B8 = v14;
  unk_2550BC8C0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.OVERLAY_GAME_MODE_TOGGLE_AX_HINT.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC8B0, &qword_2550BC8B8);
}

uint64_t sub_219F998C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC8D0 = v14;
  *(_QWORD *)algn_2550BC8D8 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.ONBOARDING_WELCOME_SUBTITLE_CRYSTAL.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC8C8, &qword_2550BC8D0);
}

uint64_t sub_219F99B20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[16];

  v0 = sub_219F9C050();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_219F9BFD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v18[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_219F9C0B0();
  MEMORY[0x24BDAC7A8](v5);
  v6 = sub_219F9BFE4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v18[-v11];
  sub_219F9C05C();
  if (qword_2550BC8F8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v1, (uint64_t)qword_2550BC900);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
  sub_219F9C044();
  sub_219F9BFF0();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v10, v12, v6);
  v14 = sub_219F9C0D4();
  v16 = v15;
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v12, v6);
  qword_2550BC8E8 = v14;
  unk_2550BC8F0 = v16;
  return result;
}

uint64_t static GCUILocalizedStrings.SETTINGS_SHARE_FRIENDS_LIST_SHOW_APPS.getter()
{
  return OUTLINED_FUNCTION_0_4(&qword_2550BC8E0, &qword_2550BC8E8);
}

id sub_219F99D80(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  void *v3;

  a3();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_54();
  return OUTLINED_FUNCTION_44(v3);
}

id sub_219F99DA4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GCUILocalizedStrings.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_219F99E30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v0 = sub_219F9C038();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_219F9BFD8();
  __swift_allocate_value_buffer(v4, qword_2550BC900);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_2550BC900);
  v6 = (id)GKGameCenterUIFrameworkBundle();
  v7 = objc_msgSend(v6, sel_bundleURL);

  sub_219F9C02C();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v3, v0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(v5, *MEMORY[0x24BDCD330], v4);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_219F99F50()
{
  unint64_t result;

  result = qword_2550BC918;
  if (!qword_2550BC918)
  {
    result = MEMORY[0x220737878](&protocol conformance descriptor for AttributeScopes.ExtendedMarkdownAttributes, &type metadata for AttributeScopes.ExtendedMarkdownAttributes);
    atomic_store(result, (unint64_t *)&qword_2550BC918);
  }
  return result;
}

uint64_t type metadata accessor for GCUILocalizedStrings()
{
  return objc_opt_self();
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

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_219F9BFE4();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_219F9C098();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_219F9BFF0();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return sub_219F9C0B0();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_219F9BFD8();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = __swift_project_value_buffer(v3, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
}

uint64_t OUTLINED_FUNCTION_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_219F9C068();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_219F9C0A4();
}

uint64_t OUTLINED_FUNCTION_15()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return sub_219F9C08C();
}

uint64_t OUTLINED_FUNCTION_21@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v2, a1, v3);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return sub_219F9C080();
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return sub_219F9C050();
}

uint64_t OUTLINED_FUNCTION_24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_25()
{
  return sub_219F9C098();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_219F9BFD8();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return sub_219F9C050();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_219F9C0B0();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_219F9C0A4();
}

uint64_t OUTLINED_FUNCTION_30@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_31@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_32()
{
  return sub_219F9C08C();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return sub_219F9C080();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_219F9BFF0();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_219F9C044();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return sub_219F9C0D4();
}

uint64_t OUTLINED_FUNCTION_37()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v0);
}

void OUTLINED_FUNCTION_43()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 88) = *(_QWORD *)(v0 - 104);
}

id OUTLINED_FUNCTION_44(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_219F9C080();
}

uint64_t OUTLINED_FUNCTION_46()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_47()
{
  return sub_219F9BF9C();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return sub_219F9C068();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return sub_219F9C068();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_219F9BFF0();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return sub_219F9C080();
}

uint64_t OUTLINED_FUNCTION_54()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_55()
{
  return sub_219F9C080();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return 13;
}

uint64_t OUTLINED_FUNCTION_58(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = *(_QWORD *)(result - 8);
  return result;
}

uint64_t OUTLINED_FUNCTION_60()
{
  return sub_219F9C0D4();
}

uint64_t OUTLINED_FUNCTION_61()
{
  return sub_219F9C08C();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_219F9C044();
}

uint64_t OUTLINED_FUNCTION_66()
{
  return sub_219F9C044();
}

uint64_t OUTLINED_FUNCTION_67()
{
  return sub_219F9C080();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return sub_219F9C074();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return sub_219F9C0BC();
}

uint64_t AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_219F9C104();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value.rawValue.getter()
{
  return 0x7A69736168706D65;
}

uint64_t sub_219F9A50C()
{
  return 1;
}

uint64_t sub_219F9A518()
{
  sub_219F9C110();
  sub_219F9C0E0();
  return sub_219F9C11C();
}

uint64_t sub_219F9A570()
{
  return sub_219F9C0E0();
}

uint64_t sub_219F9A590()
{
  sub_219F9C110();
  sub_219F9C0E0();
  return sub_219F9C11C();
}

uint64_t sub_219F9A5E0@<X0>(BOOL *a1@<X8>)
{
  return AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value.init(rawValue:)(a1);
}

void sub_219F9A5EC(_QWORD *a1@<X8>)
{
  *a1 = 0x7A69736168706D65;
  a1[1] = 0xEA00000000006465;
}

uint64_t sub_219F9A60C()
{
  sub_219F9AC4C();
  return sub_219F9C0F8();
}

uint64_t sub_219F9A668()
{
  sub_219F9AC4C();
  return sub_219F9C0EC();
}

uint64_t static AttributeScopes.ExtendedMarkdownStyleAttributes.Color.name.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_3();
  v0 = *(_QWORD *)aEmdColor;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static AttributeScopes.ExtendedMarkdownStyleAttributes.Color.name.setter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_3();
  *(_QWORD *)aEmdColor = a1;
  *(_QWORD *)&aEmdColor[8] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static AttributeScopes.ExtendedMarkdownStyleAttributes.Color.name.modify())()
{
  OUTLINED_FUNCTION_1_3();
  return j__swift_endAccess;
}

uint64_t sub_219F9A794()
{
  sub_219F9AC10();
  return sub_219F9BFFC();
}

uint64_t sub_219F9A7F0()
{
  sub_219F9ABD4();
  return sub_219F9C008();
}

uint64_t sub_219F9A84C()
{
  sub_219F9AB98();
  return sub_219F9C014();
}

unint64_t sub_219F9A8C4()
{
  unint64_t result;

  result = qword_2550BC958;
  if (!qword_2550BC958)
  {
    result = MEMORY[0x220737878](&protocol conformance descriptor for AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value, &type metadata for AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value);
    atomic_store(result, (unint64_t *)&qword_2550BC958);
  }
  return result;
}

unint64_t sub_219F9A904()
{
  unint64_t result;

  result = qword_2550BC960;
  if (!qword_2550BC960)
  {
    result = MEMORY[0x220737878](&protocol conformance descriptor for AttributeScopes.ExtendedMarkdownStyleAttributes.Color, &type metadata for AttributeScopes.ExtendedMarkdownStyleAttributes.Color);
    atomic_store(result, (unint64_t *)&qword_2550BC960);
  }
  return result;
}

unint64_t sub_219F9A944()
{
  unint64_t result;

  result = qword_2550BC968;
  if (!qword_2550BC968)
  {
    result = MEMORY[0x220737878](&protocol conformance descriptor for AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value, &type metadata for AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value);
    atomic_store(result, (unint64_t *)&qword_2550BC968);
  }
  return result;
}

unint64_t sub_219F9A984()
{
  unint64_t result;

  result = qword_2550BC970;
  if (!qword_2550BC970)
  {
    result = MEMORY[0x220737878](&protocol conformance descriptor for AttributeScopes.ExtendedMarkdownAttributes, &type metadata for AttributeScopes.ExtendedMarkdownAttributes);
    atomic_store(result, (unint64_t *)&qword_2550BC970);
  }
  return result;
}

unint64_t sub_219F9A9C4()
{
  unint64_t result;

  result = qword_2550BC978;
  if (!qword_2550BC978)
  {
    result = MEMORY[0x220737878](&protocol conformance descriptor for AttributeScopes.ExtendedMarkdownAttributes, &type metadata for AttributeScopes.ExtendedMarkdownAttributes);
    atomic_store(result, (unint64_t *)&qword_2550BC978);
  }
  return result;
}

void sub_219F9AA08()
{
  sub_219F99F50();
  JUMPOUT(0x220736F30);
}

void sub_219F9AA40()
{
  sub_219F99F50();
  JUMPOUT(0x220736F3CLL);
}

void type metadata accessor for AttributeScopes.ExtendedMarkdownStyleAttributes()
{
  OUTLINED_FUNCTION_0_5();
}

void type metadata accessor for AttributeScopes.ExtendedMarkdownStyleAttributes.Color()
{
  OUTLINED_FUNCTION_0_5();
}

uint64_t _s31ExtendedMarkdownStyleAttributesV5ColorO5ValueOwet(unsigned int *a1, int a2)
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

uint64_t _s31ExtendedMarkdownStyleAttributesV5ColorO5ValueOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_219F9AB28 + 4 * byte_219F9F040[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_219F9AB48 + 4 * byte_219F9F045[v4]))();
}

_BYTE *sub_219F9AB28(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_219F9AB48(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_219F9AB50(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_219F9AB58(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_219F9AB60(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_219F9AB68(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_219F9AB74()
{
  return 0;
}

void type metadata accessor for AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value()
{
  OUTLINED_FUNCTION_0_5();
}

void type metadata accessor for AttributeScopes.ExtendedMarkdownAttributes()
{
  OUTLINED_FUNCTION_0_5();
}

unint64_t sub_219F9AB98()
{
  unint64_t result;

  result = qword_2550BC980;
  if (!qword_2550BC980)
  {
    result = MEMORY[0x220737878](&protocol conformance descriptor for AttributeScopes.ExtendedMarkdownStyleAttributes.Color, &type metadata for AttributeScopes.ExtendedMarkdownStyleAttributes.Color);
    atomic_store(result, (unint64_t *)&qword_2550BC980);
  }
  return result;
}

unint64_t sub_219F9ABD4()
{
  unint64_t result;

  result = qword_2550BC988;
  if (!qword_2550BC988)
  {
    result = MEMORY[0x220737878](&protocol conformance descriptor for AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value, &type metadata for AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value);
    atomic_store(result, (unint64_t *)&qword_2550BC988);
  }
  return result;
}

unint64_t sub_219F9AC10()
{
  unint64_t result;

  result = qword_2550BC990;
  if (!qword_2550BC990)
  {
    result = MEMORY[0x220737878](&protocol conformance descriptor for AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value, &type metadata for AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value);
    atomic_store(result, (unint64_t *)&qword_2550BC990);
  }
  return result;
}

unint64_t sub_219F9AC4C()
{
  unint64_t result;

  result = qword_2550BC998;
  if (!qword_2550BC998)
  {
    result = MEMORY[0x220737878](&protocol conformance descriptor for AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value, &type metadata for AttributeScopes.ExtendedMarkdownStyleAttributes.Color.Value);
    atomic_store(result, (unint64_t *)&qword_2550BC998);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_beginAccess();
}

uint64_t sub_219F9AC90()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AuthKitUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("GKSoftLinkedClassesUI.h"), 25, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAKAppleIDAuthenticationInAppContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("GKSoftLinkedClassesUI.h"), 27, CFSTR("Unable to find class %s"), "AKAppleIDAuthenticationInAppContext");

  __break(1u);
}

uint64_t sub_219F9BF84()
{
  return MEMORY[0x24BDCBC18]();
}

uint64_t sub_219F9BF90()
{
  return MEMORY[0x24BDCBC20]();
}

uint64_t sub_219F9BF9C()
{
  return MEMORY[0x24BDCC578]();
}

uint64_t sub_219F9BFA8()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_219F9BFB4()
{
  return MEMORY[0x24BDCC948]();
}

uint64_t sub_219F9BFC0()
{
  return MEMORY[0x24BDCC950]();
}

uint64_t sub_219F9BFCC()
{
  return MEMORY[0x24BDCC958]();
}

uint64_t sub_219F9BFD8()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_219F9BFE4()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_219F9BFF0()
{
  return MEMORY[0x24BDCD3A8]();
}

uint64_t sub_219F9BFFC()
{
  return MEMORY[0x24BDCD5B0]();
}

uint64_t sub_219F9C008()
{
  return MEMORY[0x24BDCD5B8]();
}

uint64_t sub_219F9C014()
{
  return MEMORY[0x24BDCD710]();
}

uint64_t sub_219F9C020()
{
  return MEMORY[0x24BDCD718]();
}

uint64_t sub_219F9C02C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_219F9C038()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_219F9C044()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_219F9C050()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_219F9C05C()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_219F9C068()
{
  return MEMORY[0x24BDCF908]();
}

uint64_t sub_219F9C074()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_219F9C080()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_219F9C08C()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_219F9C098()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_219F9C0A4()
{
  return MEMORY[0x24BDCF968]();
}

uint64_t sub_219F9C0B0()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_219F9C0BC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_219F9C0C8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_219F9C0D4()
{
  return MEMORY[0x24BDCFB28]();
}

uint64_t sub_219F9C0E0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_219F9C0EC()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_219F9C0F8()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_219F9C104()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_219F9C110()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_219F9C11C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AVTUIAreAvatarsSupported()
{
  return MEMORY[0x24BE0B478]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x24BDBC628](theString);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x24BDBD940](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x24BDBD958](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB80]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC10](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x24BDBDD00](c);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x24BDBDD30](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGSize CGContextConvertSizeToDeviceSpace(CGContextRef c, CGSize size)
{
  double v2;
  double v3;
  CGSize result;

  MEMORY[0x24BDBDD78](c, (__n128)size, *(__n128 *)&size.height);
  result.height = v3;
  result.width = v2;
  return result;
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE60](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
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

uint64_t CGContextSetBaseCTM()
{
  return MEMORY[0x24BDBDFA8]();
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

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE108](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE120](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE190](info, data, size, releaseData);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
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

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t GKGameCenterUIFrameworkBundle()
{
  return MEMORY[0x24BE3A0B8]();
}

uint64_t GKGetLocalizedStringFromTableInBundle()
{
  return MEMORY[0x24BE3A0C0]();
}

uint64_t GKImageCacheRoot()
{
  return MEMORY[0x24BE3A0D0]();
}

uint64_t GKOSLoggers()
{
  return MEMORY[0x24BE3A0D8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
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

void UIGraphicsPopContext(void)
{
  MEMORY[0x24BDF78E8]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x24BDF78F0](context);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _gkMarkFileAsPurgeable()
{
  return MEMORY[0x24BE3A2C8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x24BDADDA0]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t gk_dispatch_as_group()
{
  return MEMORY[0x24BE3A2D0]();
}

uint64_t gk_dispatch_group_do()
{
  return MEMORY[0x24BE3A2D8]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

