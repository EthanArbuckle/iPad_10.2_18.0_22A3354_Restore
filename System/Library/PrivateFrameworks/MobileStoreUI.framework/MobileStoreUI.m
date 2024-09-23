void __storeShouldReverseLayoutDirection_block_invoke()
{
  id v0;

  +[SUUIClientContext defaultContext](SUUIClientContext, "defaultContext");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _SUUISetShouldReverseLayoutDirectionWithContext(v0);

}

void sub_241C23A8C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

double SUUICompactThreshold()
{
  if (SUUICompactThreshold_onceToken != -1)
    dispatch_once(&SUUICompactThreshold_onceToken, &__block_literal_global_452);
  return *(double *)&SUUICompactThreshold_threshold;
}

uint64_t storeSemanticContentAttribute()
{
  if (didSetAtLeastOnce != -1)
    dispatch_once(&didSetAtLeastOnce, &__block_literal_global_49);
  if (shouldFlipForRTL)
    return 4;
  else
    return 3;
}

id SUUITabBarControllerGetMoreNavigationController(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "moreNavigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t SUUIUserInterfaceIdiom(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (!v1 || (v3 = objc_msgSend(v1, "userInterfaceIdiomOverride"), v3 == 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "userInterfaceIdiom");

  }
  return v3;
}

BOOL SUUIAllowsLandscapePhone()
{
  int v0;
  void *v1;
  double v2;

  v0 = SUUIAllowsLandscapePhone_sValue;
  if (SUUIAllowsLandscapePhone_sValue == 255)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_referenceBounds");
    SUUIAllowsLandscapePhone_sValue = v2 == 736.0;

    v0 = SUUIAllowsLandscapePhone_sValue;
  }
  return v0 != 0;
}

void _SUUISetShouldReverseLayoutDirectionWithContext(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a1;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("SKForceRightToLeftWritingDirection"));

  if (v2)
  {
    shouldFlipForRTL = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SKRespectClientUserInterfaceLayoutDirection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "keyWindow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "semanticContentAttribute");

      shouldFlipForRTL = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", v9) == 1;
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDBCEA0];
      objc_msgSend(v16, "valueForConfigurationKey:", CFSTR("locale"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localeWithLocaleIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x24BEBB498];
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDBCB20]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "defaultWritingDirectionForLanguage:", v14);

      if (v15 == 1)
        shouldFlipForRTL = 1;

    }
  }

}

void SUUISetShouldReverseLayoutDirectionWithContext(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;

  v1 = didSetAtLeastOnce;
  v2 = a1;
  v3 = v2;
  if (v1 != -1)
  {
    dispatch_once(&didSetAtLeastOnce, &__block_literal_global_1_0);
    v2 = v3;
  }
  _SUUISetShouldReverseLayoutDirectionWithContext(v2);

}

uint64_t SUUIBundle()
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MobileStoreUI"));
}

void SUUINavigationControllerWillShowViewController(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a1;
  v3 = a2;
  v4 = objc_msgSend(v12, "lastOperation");
  if (v4 == 2)
  {
    objc_msgSend(v12, "disappearingViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v3;
  }
  else
  {
    if (v4 != 1)
    {
      v5 = v3;
      v7 = 0;
      goto LABEL_7;
    }
    v5 = v3;
    objc_msgSend(v12, "disappearingViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
LABEL_7:
  objc_msgSend(v12, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_backdropViewLayerGroupName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "SUUIPinnedHeaderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setGroupName:", v9);

  objc_msgSend(v7, "SUUIPinnedHeaderView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setGroupName:", 0);

}

void SUUINavigationControllerDidShowViewController(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(a1, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_backdropViewLayerGroupName");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "SUUIPinnedHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setGroupName:", v6);
}

void SUUIScrollViewSetPinnedHeaderContentInsets(void *a1, double a2, double a3, double a4, double a5)
{
  __SUUIScrollViewSetKeyedContentInsets(a1, "com.apple.iTunesStoreUI.pinnedHeaderInset", 0, a2, a3, a4, a5);
}

void __SUUIScrollViewSetKeyedContentInsets(void *a1, const void *a2, int a3, double a4, double a5, double a6, double a7)
{
  void *v11;
  void *v12;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id object;

  object = a1;
  objc_getAssociatedObject(object, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "UIEdgeInsetsValue");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
  }
  else
  {
    v14 = *MEMORY[0x24BEBE158];
    v16 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v18 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v20 = *(double *)(MEMORY[0x24BEBE158] + 24);
  }
  objc_msgSend(object, "contentInset");
  if (v16 != a5 || v14 != a4 || v20 != a7 || v18 != a6)
  {
    v39 = v23;
    v40 = v24;
    v37 = v18;
    v38 = v22;
    v28 = v16;
    v29 = v21;
    objc_msgSend(object, "contentOffset");
    v35 = v31;
    v36 = v30;
    v41 = a4;
    v42 = a5;
    v32 = a4 - v14;
    v33 = a5 - v28 + v38;
    objc_msgSend(object, "setContentInset:", v32 + v29, v33, a6 - v37 + v39, a7 - v20 + v40);
    objc_msgSend(object, "setScrollIndicatorInsets:", v32 + v29, v33, a6 - v37 + v39, a7 - v20 + v40);
    if (a3)
      objc_msgSend(object, "setContentOffset:", v36, v35 - v32);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithUIEdgeInsets:", v41, v42, a6, a7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(object, a2, v34, (void *)1);

  }
}

void SUUIScrollViewSetDefaultContentInsets(void *a1, double a2, double a3, double a4, double a5)
{
  __SUUIScrollViewSetKeyedContentInsets(a1, "com.apple.iTunesStoreUI.defaultHeaderInset", 1, a2, a3, a4, a5);
}

double SUUILayoutGuideInsets(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v1 = a1;
  objc_msgSend(v1, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v1;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      v4 = v2;

      objc_msgSend(v4, "parentViewController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v4;
      if (!v2)
        goto LABEL_9;
    }
    v4 = v3;
  }
  else
  {
    v4 = v1;
  }
LABEL_9:
  objc_msgSend(v4, "topLayoutGuide");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "length");
  v7 = v6;
  objc_msgSend(v4, "bottomLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "length");

  return v7;
}

void sub_241C2E3F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C2E524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_241C2E6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C319BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_241C31D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C3309C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C35CF0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241C368B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C36C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C36E50(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_241C37B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Unwind_Resume(a1);
}

void sub_241C38E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
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

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void *__Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

{

}

void sub_241C39B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_241C3B580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

{

}

void sub_241C3B708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C3BEEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  id *v13;
  uint64_t v14;

  objc_destroyWeak(v13);
  objc_destroyWeak((id *)(v14 - 96));
  _Unwind_Resume(a1);
}

void sub_241C3C650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C3CDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C3E120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C3E780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  id *v40;
  uint64_t v41;

  objc_destroyWeak(v40);
  objc_destroyWeak((id *)(v41 - 248));
  _Unwind_Resume(a1);
}

void sub_241C41354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
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

void sub_241C415D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C477C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C47A8C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241C49480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

{

}

void sub_241C4B4AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C4EA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C4FCBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

uint64_t SUUICardElementTypeForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("activity")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("billboard")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("editorial")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("programmed")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_241C50EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

{

}

BOOL SUUINearMeIsEnabledForAuthorizationStatus(int a1)
{
  return (a1 - 3) < 2;
}

BOOL SUUILocationIsAccurate(void *a1)
{
  id v1;
  double v2;
  double v3;
  void *v4;
  _BOOL8 v5;
  double v6;

  v1 = a1;
  objc_msgSend(v1, "horizontalAccuracy");
  v3 = v2;
  objc_msgSend(v1, "timestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (v3 > 0.00000011920929 && v3 <= 5000.0)
  {
    if (v4)
    {
      objc_msgSend(v4, "timeIntervalSinceNow");
      v5 = v6 >= -30.0;
    }
    else
    {
      v5 = 1;
    }
  }

  return v5;
}

void sub_241C51B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C5653C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
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

void SUUIStoreAssetResourceLoaderConfigureWithDelegate(void *a1, void *a2)
{
  id v3;
  id object;

  v3 = a2;
  object = a1;
  objc_msgSend(object, "setDelegate:queue:", v3, MEMORY[0x24BDAC9B8]);
  objc_setAssociatedObject(object, (const void *)_SUUIStoreAssetResourceLoaderDelegateAssociatedObjectKeyStrongDelegate, v3, (void *)1);

}

void sub_241C56AF0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241C5759C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_241C57934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C57D90(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void SUUIGetImagesFromView(void *a1, _QWORD *a2, _QWORD *a3, double a4)
{
  id v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  CGImage *v15;
  double v16;
  CGImage *v17;
  void *v18;
  CGImage *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGImage *v23;
  void *v24;
  id v25;
  CGSize v26;
  CGRect v27;
  CGRect v28;

  v7 = a1;
  objc_msgSend(v7, "bounds");
  v26.width = v8;
  v26.height = v9;
  UIGraphicsBeginImageContextWithOptions(v26, 1, 0.0);
  objc_msgSend(v7, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v11, "scale");
  v13 = v12;
  v14 = objc_retainAutorelease(v11);
  v15 = (CGImage *)objc_msgSend(v14, "CGImage");
  objc_msgSend(v14, "size");
  v27.size.width = v13 * v16;
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.height = v13 * a4;
  v17 = CGImageCreateWithImageInRect(v15, v27);
  objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v17, objc_msgSend(v14, "imageOrientation"), v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v17);
  if (a2)
    *a2 = objc_retainAutorelease(v18);
  v25 = objc_retainAutorelease(v14);
  v19 = (CGImage *)objc_msgSend(v25, "CGImage");
  objc_msgSend(v25, "size");
  v21 = v13 * v20;
  objc_msgSend(v25, "size");
  v28.size.height = v13 * (v22 - a4);
  v28.origin.x = 0.0;
  v28.origin.y = v13 * a4;
  v28.size.width = v21;
  v23 = CGImageCreateWithImageInRect(v19, v28);
  objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v23, objc_msgSend(v25, "imageOrientation"), v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v23);
  if (a3)
    *a3 = objc_retainAutorelease(v24);

}

id SUUINavigationItemsShallowCopy(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(v1, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc_init(MEMORY[0x24BEBD7A8]);
      objc_msgSend(v4, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitle:", v6);

      objc_msgSend(v5, "setHidesBackButton:", objc_msgSend(v4, "hidesBackButton"));
      objc_msgSend(v4, "prompt");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPrompt:", v7);

      objc_msgSend(v5, "setLeftItemsSupplementBackButton:", objc_msgSend(v4, "leftItemsSupplementBackButton"));
      objc_msgSend(v2, "addObject:", v5);

      ++v3;
    }
    while (v3 < objc_msgSend(v1, "count"));
  }

  return v2;
}

id SUUIStackedBarSpringAnimationForExpandCollapse(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a1;
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "position");
  v8 = v7;
  v10 = v9;

  objc_msgSend(v5, "frame");
  v12 = v8 + a2 - v11;
  objc_msgSend(v5, "frame");
  v14 = v10 + a3 - v13;
  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", CFSTR("position"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDamping:", 26.0);
  objc_msgSend(v15, "setDuration:", 1.0);
  objc_msgSend(v15, "setFillMode:", *MEMORY[0x24BDE5968]);
  objc_msgSend(v15, "setMass:", 1.0);
  objc_msgSend(v15, "setStiffness:", 250.0);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v16);

  objc_msgSend(v15, "setVelocity:", 0.0);
  v17 = (void *)MEMORY[0x24BDD1968];
  objc_msgSend(v5, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "position");
  objc_msgSend(v17, "valueWithCGPoint:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", v19);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v12, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToValue:", v20);

  objc_msgSend(v5, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAnimation:forKey:", v15, CFSTR("ExpandCollapse"));

  objc_msgSend(v5, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setPosition:", v12, v14);
  return v15;
}

BOOL SUUIEditorialLayoutOrientationForInterfaceOrientation(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

BOOL SUUIEditorialLayoutOrientationForView(void *a1)
{
  double v1;
  double v2;

  objc_msgSend(a1, "bounds");
  return v1 > v2;
}

void sub_241C5FA24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C618EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C63050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C632C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SUUIPopoverBackdropViewForView(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    v3 = 0;
    do
    {
      v4 = v2;

      objc_msgSend(v4, "superview");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v4;
    }
    while (v2);
  }
  else
  {
    v4 = 0;
  }
  objc_opt_class();
  __ChildViewWithClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __ChildViewWithClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __ChildViewWithClass(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "subviews");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = objc_msgSend(v2, "count");
  if (v3 < 1)
  {
LABEL_7:
    v6 = 0;
  }
  else
  {
    v4 = v3;
    v5 = 0;
    while (1)
    {
      objc_msgSend(v2, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v6, "subviews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(v2, "addObjectsFromArray:", v7);
        v4 = objc_msgSend(v2, "count");
      }

      if (++v5 >= v4)
        goto LABEL_7;
    }
  }

  return v6;
}

uint64_t CGColorSpaceGetSRGB()
{
  if (CGColorSpaceGetSRGB::sOnceToken != -1)
    dispatch_once(&CGColorSpaceGetSRGB::sOnceToken, &__block_literal_global_4);
  return CGColorSpaceGetSRGB::sSpace;
}

void sub_241C658B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t ColorSyncLibrary(void)
{
  unsigned __int8 v0;
  uint64_t v1;
  void *v3;

  {
    ColorSyncLibraryCore(char **)::frameworkLibrary = 0;
  }
  if (!ColorSyncLibraryCore(char **)::frameworkLibrary)
    ColorSyncLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v1 = ColorSyncLibraryCore(char **)::frameworkLibrary;
  if (!ColorSyncLibraryCore(char **)::frameworkLibrary)
  {
    v3 = (void *)abort_report_np();
    free(v3);
  }
  return v1;
}

void sub_241C68590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
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

double *__SK_RGBtoHSV(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6;
  float v7;
  double v8;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;

  if (a4 >= a5)
    v6 = a4;
  else
    v6 = a5;
  if (v6 < a6)
    v6 = a6;
  v7 = v6;
  v8 = v7;
  *a3 = v7;
  if (v7 == 0.0)
  {
    *result = NAN;
    *a2 = 0.0;
    *a3 = 0.0;
  }
  else
  {
    if (a4 <= a5)
      v9 = a4;
    else
      v9 = a5;
    if (v9 > a6)
      v9 = a6;
    v10 = v9;
    v11 = v7 - v10;
    *a2 = (float)(v11 / v7);
    v12 = v11;
    if (v8 == a4)
    {
      v13 = (a5 - a6) / v12;
    }
    else
    {
      v14 = v8 == a5;
      v15 = (a4 - a5) / v12 + 4.0;
      v13 = (a6 - a4) / v12 + 2.0;
      if (!v14)
        v13 = v15;
    }
    v16 = v13 * 60.0;
    if (v16 < 0.0)
      v16 = v16 + 360.0;
    *result = v16;
  }
  return result;
}

void sub_241C6B274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C6BE4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_241C6E4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C6E958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_241C6F5D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C6FEA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C70B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C71850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void sub_241C72E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIPageComponentClassForComponentType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x1A)
    return 0;
  else
    return (id)objc_opt_class();
}

uint64_t SUUIPageComponentTypeForBlockType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("accountButtons")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("counter")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("divider")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("editorial")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("expand")) & 1) != 0)
  {
    v2 = 19;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("flowcase")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("gallery")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("grid")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("lockup")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("media")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("popup")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("quicklinks")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("row")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("showcase")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("spacer")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("swoosh")) & 1) != 0)
  {
    v2 = 15;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("tabs")))
  {
    v2 = 11;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t SUUIPageComponentTypeForFeaturedContentKind(uint64_t a1)
{
  uint64_t result;

  result = 15;
  switch(a1)
  {
    case 257:
      result = 10;
      break;
    case 258:
      result = 18;
      break;
    case 259:
    case 262:
    case 263:
    case 264:
    case 265:
    case 267:
      goto LABEL_4;
    case 260:
    case 261:
    case 268:
      return result;
    case 266:
      result = 12;
      break;
    default:
      if ((unint64_t)(a1 - 304) >= 2)
LABEL_4:
        result = 0;
      break;
  }
  return result;
}

uint64_t SUUIPageComponentFontWeightForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("light")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("medium")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_241C7610C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

{

}

void sub_241C76418(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_241C78584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C7880C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C795E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C7CA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C7D824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_241C8177C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void sub_241C82134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t (*SUUIMetricsLaunchApplicationWithIdentifier(uint64_t a1, uint64_t a2))(uint64_t, uint64_t)
{
  void *v4;
  uint64_t (*result)(uint64_t, uint64_t);

  v4 = (void *)SUUISpringBoardServicesFramework();
  result = (uint64_t (*)(uint64_t, uint64_t))SUUIWeakLinkedSymbolForString("SBSLaunchApplicationWithIdentifier", v4);
  if (result)
    return (uint64_t (*)(uint64_t, uint64_t))result(a1, a2);
  return result;
}

uint64_t (*SUUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)
{
  void *v10;
  uint64_t (*result)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v10 = (void *)SUUISpringBoardServicesFramework();
  result = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))SUUIWeakLinkedSymbolForString("SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions", v10);
  if (result)
    return (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))result(a1, a2, a3, a4, a5);
  return result;
}

id SUUIMetricsNavigationTypeFromNavigationControllerOperation(uint64_t a1)
{
  id *v1;

  if (a1 == 1)
  {
    v1 = (id *)MEMORY[0x24BEB2958];
  }
  else
  {
    if (a1 != 2)
      return 0;
    v1 = (id *)MEMORY[0x24BEB2950];
  }
  return *v1;
}

void SUUIMetricsOpenSensitiveURL(void *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a1;
  v3 = (void *)MEMORY[0x24BEBD3C8];
  v4 = a2;
  objc_msgSend(v3, "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "application:recordExitMetricsEventWithURL:", v5, v9);
  v7 = SUUIMobileCoreServicesFramework();
  objc_msgSend(SUUIWeakLinkedClassForString(CFSTR("LSApplicationWorkspace"), v7), "defaultWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openSensitiveURL:withOptions:", v9, v4);

}

void SUUIMetricsOpenURL(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  v3 = a1;
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "application:recordExitMetricsEventWithURL:", v1, v3);
  objc_msgSend(v1, "openURL:options:completionHandler:", v3, MEMORY[0x24BDBD1B8], 0);

}

void SUUIMetricsSetClickEventPositionWithPoint(void *a1, double a2, double a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x24BEBD8F8];
  v6 = a1;
  objc_msgSend(v5, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (uint64_t)(a2 * v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPositionX:", v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (uint64_t)(a3 * v9));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPositionY:", v11);

}

void SUUIMetricsSetClickEventPositionWithView(void *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  if (a2)
  {
    v3 = a2;
    v8 = a1;
    objc_msgSend(v3, "bounds");
    objc_msgSend(v3, "convertRect:toView:", 0);
    v5 = v4;
    v7 = v6;

    SUUIMetricsSetClickEventPositionWithPoint(v8, v5, v7);
  }
}

__CFString *SUUIMetricsWindowOrientationForInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return off_2511F6018[a1 - 1];
}

id SUUIColorWithHTMLCode(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  if (v2 == 8 || v2 == 6)
  {
    v4 = v2;
    objc_msgSend(v1, "substringWithRange:", 0, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = SUUIHexValueWithString(v5);

    objc_msgSend(v1, "substringWithRange:", 2, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = SUUIHexValueWithString(v7);

    objc_msgSend(v1, "substringWithRange:", 4, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = SUUIHexValueWithString(v9);

    if (v4 == 8)
    {
      objc_msgSend(v1, "substringWithRange:", 6, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = SUUIHexValueWithString(v11);

    }
    else
    {
      v12 = 255;
    }
    v13 = 0;
    if ((unint64_t)v6 <= 0xFF
      && (unint64_t)v10 <= 0xFF
      && (unint64_t)v8 <= 0xFF
      && (unint64_t)v12 <= 0xFF)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", (double)v6 / 255.0, (double)v8 / 255.0, (double)v10 / 255.0, (double)v12 / 255.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

BOOL SUUIColorSchemeStyleForColor(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;
  int v4;
  uint64_t v5;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v9 = 0;
    v10 = 0.0;
    v8 = 0;
    if (objc_msgSend(v1, "getHue:saturation:brightness:alpha:", &v9, &v8, &v10, 0))
    {
      v3 = v10 < 0.5;
    }
    else
    {
      v7 = 0.0;
      v4 = objc_msgSend(v2, "getWhite:alpha:", &v7, 0);
      v5 = 2;
      if (v7 < 0.5)
        v5 = 3;
      if (v4)
        v3 = v5;
      else
        v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id SUUIBorderColorWithBackgroundColor(void *a1)
{
  id v1;
  char *v2;
  void *v3;

  v1 = a1;
  if (v1)
  {
    v2 = (char *)&loc_241C84C98 + 4 * byte_241EFBBE8[SUUIColorSchemeStyleForColor(v1)];
    __asm { BR              X9 }
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SUUIColorForStyleWithBrightness(void *a1, uint64_t a2, float a3, float a4, float a5, float a6)
{
  switch(a2)
  {
    case 0:
      a6 = a3;
      break;
    case 1:
      a6 = a4;
      break;
    case 2:
      a6 = a5;
      break;
    case 3:
      return SUUIColorByAdjustingBrightness(a1, a6);
    default:
      a6 = 0.0;
      break;
  }
  return SUUIColorByAdjustingBrightness(a1, a6);
}

id SUUIColorByAdjustingBrightness(void *a1, float a2)
{
  id v3;
  id v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = a1;
  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  if (!objc_msgSend(v3, "getHue:saturation:brightness:alpha:", &v11, &v10, &v9, &v8)
    || (objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithHue:saturation:brightness:alpha:", v11, v10, v9 + a2, v8),
        (v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = 0.0;
    v7 = 0.0;
    if ((objc_msgSend(v3, "getWhite:alpha:", &v7, &v6) & 1) == 0
      || (objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", v7 + a2, v6),
          (v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v4 = v3;
    }
  }

  return v4;
}

id SUUIColorForStyleWithAlpha(void *a1, uint64_t a2, float a3, float a4, float a5, float a6)
{
  switch(a2)
  {
    case 0:
      a6 = a3;
      break;
    case 1:
      a6 = a4;
      break;
    case 2:
      a6 = a5;
      break;
    case 3:
      return SUUIColorWithAlpha(a1, a6);
    default:
      a6 = 0.0;
      break;
  }
  return SUUIColorWithAlpha(a1, a6);
}

id SUUIColorWithAlpha(void *a1, float a2)
{
  id v3;
  id v4;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = a1;
  v8 = 0.0;
  v9 = 0.0;
  v7 = 0.0;
  if (!objc_msgSend(v3, "getHue:saturation:brightness:alpha:", &v9, &v8, &v7, 0)
    || (objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithHue:saturation:brightness:alpha:", v9, v8, v7, a2),
        (v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = 0.0;
    if ((objc_msgSend(v3, "getWhite:alpha:", &v6, 0) & 1) == 0
      || (objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", v6, a2),
          (v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v4 = v3;
    }
  }

  return v4;
}

uint64_t SUUIHexValueWithString(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  unsigned int v5;

  v5 = 0;
  v1 = (objc_class *)MEMORY[0x24BDD17A8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithString:", v2);

  LODWORD(v2) = objc_msgSend(v3, "scanHexInt:", &v5);
  if ((_DWORD)v2)
    return v5;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t SUUITableViewGroupedBackgroundColor()
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
}

void sub_241C850B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C852A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C85F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C86194(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241C86324(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241C865BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C8A0C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

uint64_t SUUIImageTreatmentForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("app")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("artist-circle")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("brick")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("evergreen")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("left-to-right-linear-gradient")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("parallax")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("product")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("radio")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("radial-gradient")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("tint")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("uber")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("uber-banner")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("watch-app")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("watch-product")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("voyager-app")) & 1) != 0)
  {
    v2 = 15;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("tv-app")))
  {
    v2 = 16;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void SUUIViewSetBottomBorderColor(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v11 = a1;
  v3 = a2;
  objc_msgSend(v11, "viewWithTag:", 1397441090);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scale");
      v8 = 1.0 / v7;

      objc_msgSend(v11, "bounds");
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, v9 - v8, v10, v8);
      objc_msgSend(v5, "setAutoresizingMask:", 10);
      objc_msgSend(v5, "setTag:", 1397441090);
      objc_msgSend(v11, "addSubview:", v5);
    }
    objc_msgSend(v5, "setBackgroundColor:", v3);
  }
  else
  {
    objc_msgSend(v4, "removeFromSuperview");
  }

}

void SUUIViewSetTopBorderColor(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a1;
  v3 = a2;
  objc_msgSend(v10, "viewWithTag:", 1397445698);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "scale");
      v8 = 1.0 / v7;

      objc_msgSend(v10, "bounds");
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, v9, v8);
      objc_msgSend(v5, "setAutoresizingMask:", 2);
      objc_msgSend(v5, "setTag:", 1397445698);
      objc_msgSend(v10, "addSubview:", v5);
    }
    objc_msgSend(v5, "setBackgroundColor:", v3);
  }
  else
  {
    objc_msgSend(v4, "removeFromSuperview");
  }

}

void sub_241C8F028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_241C8FCF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SUUIViewElementDateWithString(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v1 = a1;
  if (!SUUIViewElementDateWithString_sInputFormatter1)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v3 = (void *)SUUIViewElementDateWithString_sInputFormatter1;
    SUUIViewElementDateWithString_sInputFormatter1 = (uint64_t)v2;

    objc_msgSend((id)SUUIViewElementDateWithString_sInputFormatter1, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    objc_msgSend((id)SUUIViewElementDateWithString_sInputFormatter1, "setLenient:", 1);
    v4 = (void *)SUUIViewElementDateWithString_sInputFormatter1;
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocale:", v5);

  }
  if (!SUUIViewElementDateWithString_sInputFormatter2)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v7 = (void *)SUUIViewElementDateWithString_sInputFormatter2;
    SUUIViewElementDateWithString_sInputFormatter2 = (uint64_t)v6;

    objc_msgSend((id)SUUIViewElementDateWithString_sInputFormatter2, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
    objc_msgSend((id)SUUIViewElementDateWithString_sInputFormatter2, "setLenient:", 1);
    v8 = (void *)SUUIViewElementDateWithString_sInputFormatter2;
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocale:", v9);

  }
  if (!SUUIViewElementDateWithString_sInputFormatter3)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v11 = (void *)SUUIViewElementDateWithString_sInputFormatter3;
    SUUIViewElementDateWithString_sInputFormatter3 = (uint64_t)v10;

    objc_msgSend((id)SUUIViewElementDateWithString_sInputFormatter3, "setDateFormat:", CFSTR("yyyy-MM-dd'T'hh:mm:ss'Z'"));
    objc_msgSend((id)SUUIViewElementDateWithString_sInputFormatter3, "setLenient:", 1);
    v12 = (void *)SUUIViewElementDateWithString_sInputFormatter3;
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLocale:", v13);

  }
  objc_msgSend((id)SUUIViewElementDateWithString_sInputFormatter1, "dateFromString:", v1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend((id)SUUIViewElementDateWithString_sInputFormatter2, "dateFromString:", v1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend((id)SUUIViewElementDateWithString_sInputFormatter3, "dateFromString:", v1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v14;
}

void SUUIViewElementTextDeadlockFix(void *a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a1;
  objc_msgSend(a2, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __SUUIViewElementTextDeadlockFix_block_invoke;
    v11[3] = &unk_2511F61F8;
    v5 = &v12;
    v12 = v3;
    v6 = v3;
    objc_msgSend(v4, "evaluate:completionBlock:", v11, 0);
  }
  else
  {
    dispatch_get_global_queue(-32768, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __SUUIViewElementTextDeadlockFix_block_invoke_2;
    v9[3] = &unk_2511F47C0;
    v5 = &v10;
    v10 = v3;
    v8 = v3;
    dispatch_async(v7, v9);

  }
}

void sub_241C91C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C93268(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_241C94524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_241C94A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_241C94D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_241C95B44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void sub_241C96AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C9799C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C987C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C98900(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241C994B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C99780(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__17(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void sub_241C9A8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__2_0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3_0(uint64_t a1)
{

}

id SUUIResourceLoaderGetNameForObject(void *a1)
{
  void *v1;
  id v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = a1;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@:%p"), v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_241C9B480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241C9B59C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241C9F2E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241C9F828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CA0C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CA7234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CA73F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CA78F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 232), 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_241CA7FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

uint64_t SUUIGetLayoutProperties(uint64_t result, uint64_t a2, _QWORD *a3, double *a4)
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (a2 < 1)
  {
    v6 = 0.0;
  }
  else
  {
    v4 = 0;
    v5 = result + 24;
    v6 = 0.0;
    v7 = 0.0;
    do
    {
      if ((*(_BYTE *)(v5 + 16) & 1) != 0)
      {
        v8 = v7 + v6;
        v9 = *(double *)v5;
        v7 = *(double *)(v5 + 8);
        v11 = *(double *)(v5 - 16);
        v10 = *(double *)(v5 - 8);
        *(double *)(*a3 + 8 * v4) = v8 - v10;
        v6 = v8 + v11 - v9 - v10;
      }
      v5 += 48;
      ++v4;
    }
    while (a2 != v4);
  }
  *a4 = v6;
  return result;
}

double SUUIScaleSizeToFit(double a1, double a2, double a3, double a4)
{
  double v4;
  double v5;

  v4 = a1 / a3;
  v5 = a2 / a4;
  if (v4 < v5)
    v5 = v4;
  return ceil(a3 * v5);
}

void sub_241CAC964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241CAF004(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241CAFC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241CAFF78(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241CB0220(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241CB0934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

void sub_241CB7244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Block_object_dispose((const void *)(v37 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_241CB9B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

void sub_241CB9EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CBA4A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CBA75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id SUUIStringFromProductLockupLayoutSizing(CGSize *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromCGSize(a1[3]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(a1[2]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(*a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(a1[1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("{ Top-Left: %@, Top-Right: %@, Middle-Left: %@, Bottom-Left: %@, Bottom-Right: %@ }"), v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_241CBAF40(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241CBB1A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241CC019C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void sub_241CC145C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_241CC15E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CC2190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241CC3398(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_241CC4548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241CC534C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241CC5834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CC59F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_241CC600C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_241CC6D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

void sub_241CC854C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CC919C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__22(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__22(uint64_t a1)
{

}

void sub_241CC95F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_241CC9FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_241CCD824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CCDF9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CCE34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CCEF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void sub_241CCFF70(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{

}

void sub_241CD07EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CD0A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241CD19D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25(uint64_t a1)
{

}

void sub_241CDA2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_241CDA790(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241CDAE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241CDB4B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241CDB588(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241CDBE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26(uint64_t a1)
{

}

void sub_241CDD7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27(uint64_t a1)
{

}

uint64_t SUUITrackListColumnIdentifierForViewElement(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "elementType");
  v3 = 2;
  if (v2 > 79)
  {
    if (v2 > 137)
    {
      if (v2 != 138)
      {
        if (v2 != 141)
          goto LABEL_22;
        goto LABEL_17;
      }
      if ((objc_msgSend(v1, "labelViewStyle") & 0xFFFFFFFFFFFFFFFELL) == 4)
        v3 = 4;
      else
        v3 = 2;
    }
    else if (v2 == 80)
    {
      v3 = 5;
    }
    else if (v2 == 90)
    {
      objc_msgSend(v1, "flattenedChildren");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = SUUITrackListColumnIdentifierForViewElement();

    }
  }
  else
  {
    if (v2 > 11)
    {
      if ((unint64_t)(v2 - 12) >= 2 && v2 != 50)
        goto LABEL_22;
LABEL_17:
      v3 = 1;
      goto LABEL_22;
    }
    v6 = 3;
    if (v2 != 9)
      v6 = 2;
    if (v2 == 8)
      v3 = 0;
    else
      v3 = v6;
  }
LABEL_22:

  return v3;
}

void sub_241CDE03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CDE280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SUUIZoomingShelfMenuBarGetValidationInfoForViewElement(void *a1@<X0>, uint64_t a2@<X8>)
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  id v15;

  v15 = a1;
  *(_OWORD *)a2 = xmmword_241EFBED0;
  *(_QWORD *)(a2 + 16) = 0x7FFFFFFFFFFFFFFFLL;
  v3 = objc_msgSend(v15, "elementType") == 72;
  v4 = v15;
  if (v3)
  {
    objc_msgSend(v15, "children");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") != 2)
    {
LABEL_11:

      v4 = v15;
      goto LABEL_12;
    }
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("product"));

    objc_msgSend(v5, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("product"));

    if (!v9 || v13)
    {
      if (((v9 | v13 ^ 1) & 1) != 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      v14 = xmmword_241EFBEF0;
    }
    else
    {
      v14 = xmmword_241EFBEE0;
    }
    *(_BYTE *)a2 = 1;
    *(_OWORD *)(a2 + 8) = v14;
    goto LABEL_10;
  }
LABEL_12:

}

void sub_241CE2D98(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241CE2F78(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241CE382C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28(uint64_t a1)
{

}

void sub_241CE402C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SUUIBadgeImageFromText(void *a1, void *a2, char a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a1;
  v6 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__29;
  v19 = __Block_byref_object_dispose__29;
  v20 = 0;
  if (SUUIBadgeImageFromText_sOnce != -1)
    dispatch_once(&SUUIBadgeImageFromText_sOnce, &__block_literal_global_16);
  if (objc_msgSend(v5, "length"))
  {
    v7 = SUUIBadgeImageFromText_sBadgeImageQueue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __SUUIBadgeImageFromText_block_invoke_2;
    v10[3] = &unk_2511F7728;
    v11 = v5;
    v12 = v6;
    v13 = &v15;
    v14 = a3;
    dispatch_sync(v7, v10);

  }
  v8 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v8;
}

void sub_241CE5788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29(uint64_t a1)
{

}

void sub_241CE8C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIChartGetTitle(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a1;
  v6 = a2;
  v7 = (void *)SUUIChartGetTitle_sChartIndexFormatter;
  if (!SUUIChartGetTitle_sChartIndexFormatter)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    v9 = (void *)SUUIChartGetTitle_sChartIndexFormatter;
    SUUIChartGetTitle_sChartIndexFormatter = (uint64_t)v8;

    objc_msgSend((id)SUUIChartGetTitle_sChartIndexFormatter, "setNumberStyle:", 1);
    objc_msgSend((id)SUUIChartGetTitle_sChartIndexFormatter, "setUsesGroupingSeparator:", 0);
    v7 = (void *)SUUIChartGetTitle_sChartIndexFormatter;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", a3);
  objc_msgSend(v7, "stringFromNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "localizedStringForKey:", CFSTR("CHART_ITEM_TITLE_FORMAT"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("CHART_ITEM_TITLE_FORMAT"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@%@"), 0, v11, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void sub_241CEF1BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30(uint64_t a1)
{

}

void sub_241CF0344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241CF3374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31(uint64_t a1)
{

}

void sub_241CF372C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32(uint64_t a1)
{

}

void sub_241CF4D98(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241CF5004(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_241CF582C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241CF5D08(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_241CF8320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241CF9CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241CFD3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{

}

void sub_241CFF8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34(uint64_t a1)
{

}

void sub_241D008D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D00C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D01404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D01A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D063C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D06610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D069EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_241D08600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D0889C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241D08A2C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241D08CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D098FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D09DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SUUIStorePageItemsWithStorePlatformDictionary(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v5 = a1;
  v6 = a2;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v6 || (objc_msgSend(v5, "objectForKey:", v6), (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("lockup"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v5, "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count") == 1)
      {
        objc_msgSend(v9, "objectAtIndex:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BEB2850]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __SUUIStorePageItemsWithStorePlatformDictionary_block_invoke;
      v13[3] = &unk_2511F7D10;
      v15 = a3;
      v14 = v7;
      objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v13);

    }
  }

  return v7;
}

uint64_t SUUIStorePageTypeIsProductPage(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("software")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("mobileSoftwareBundle"));

  return v2;
}

void sub_241D0DA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D0DD2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_241D0E438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_241D1266C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_241D14150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D145B4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241D14750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__35(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__35(uint64_t a1)
{

}

void sub_241D1499C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D174EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__36(uint64_t a1)
{

}

void sub_241D17B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D17E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D17FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SUUIViewElementAccumulatePersonalizationLibraryItemsForChildren(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "personalizationLibraryItems");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "unionSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

void sub_241D188A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void SUUIViewElementAccumulatePersonalizationLibraryItemsForChild(void *a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a1;
  objc_msgSend(a2, "personalizationLibraryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "unionSet:", v3);

}

uint64_t SUUIViewElementAlignmentForStyle(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "textAlignment");
  if (!v2)
  {
    v2 = objc_msgSend(v1, "elementAlignment");
    if (!v2)
    {
      v3 = objc_msgSend(v1, "elementPosition");
      if ((unint64_t)(v3 - 1) > 8)
        v2 = 0;
      else
        v2 = qword_241EFC078[v3 - 1];
    }
  }

  return v2;
}

id SUUIViewElementFontWithStyle(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t *v27;
  uint64_t *v28;
  int v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *value;
  _QWORD v41[2];
  _QWORD v42[2];
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[2];
  _QWORD v53[4];

  v53[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "textStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (SUUIViewElementFontWithStyle_sOnce != -1)
      dispatch_once(&SUUIViewElementFontWithStyle_sOnce, &__block_literal_global_20);
    value = 0;
    if (NSMapMember((NSMapTable *)SUUIViewElementFontWithStyle_sTextStyleMap, v2, 0, &value))
    {
      objc_msgSend(v1, "textScale");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
      {
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("none")))
        {
          SUUIFontForTextStyle((uint64_t)value);
          v5 = objc_claimAutoreleasedReturnValue();
LABEL_12:
          v8 = (void *)v5;
          objc_msgSend(v1, "fontWeight");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (!v8 || !v9)
            goto LABEL_24;
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("medium")))
          {
            v52[0] = *MEMORY[0x24BEBB540];
            objc_msgSend(v8, "familyName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v52[1] = *MEMORY[0x24BEBB550];
            v53[0] = v11;
            v53[1] = CFSTR("Medium");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
            objc_msgSend(v8, "fontDescriptor");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "fontDescriptorByAddingAttributes:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_22;
          }
          if (objc_msgSend(v10, "isEqualToString:", CFSTR("bold")))
          {
            objc_msgSend(v8, "fontDescriptor");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v15;
            v16 = 2;
          }
          else
          {
            if (!objc_msgSend(v10, "isEqualToString:", CFSTR("condensed-bold")))
            {
              if (objc_msgSend(v10, "isEqualToString:", CFSTR("light")))
              {
                v50 = *MEMORY[0x24BEBB588];
                v51 = *MEMORY[0x24BDC4CC0];
                v26 = (void *)MEMORY[0x24BDBCE70];
                v27 = &v51;
                v28 = &v50;
              }
              else if (objc_msgSend(v10, "isEqualToString:", CFSTR("ultra-light")))
              {
                v48 = *MEMORY[0x24BEBB588];
                v49 = *MEMORY[0x24BDC4CE8];
                v26 = (void *)MEMORY[0x24BDBCE70];
                v27 = &v49;
                v28 = &v48;
              }
              else
              {
                if (!objc_msgSend(v10, "isEqualToString:", CFSTR("thin")))
                  goto LABEL_24;
                v46 = *MEMORY[0x24BEBB588];
                v47 = *MEMORY[0x24BDC4CD8];
                v26 = (void *)MEMORY[0x24BDBCE70];
                v27 = &v47;
                v28 = &v46;
              }
              objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_16;
            }
            objc_msgSend(v8, "fontDescriptor");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v15;
            v16 = 66;
          }
          objc_msgSend(v15, "fontDescriptorWithSymbolicTraits:", v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

          if (v14)
          {
            objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v14, 0.0);
            v17 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v17;
          }
LABEL_24:

          if (v8)
            goto LABEL_44;
          goto LABEL_25;
        }
        v39 = 0;
        v7 = NSMapMember((NSMapTable *)SUUIViewElementFontWithStyle_sTextScaleMap, v4, 0, &v39);
        v6 = value;
        if (v7)
        {
          SUUIFontLimitedPreferredFontForTextStyle((uint64_t)value, (uint64_t)v39);
          v5 = objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
      }
      else
      {
        v6 = value;
      }
      SUUIFontPreferredFontForTextStyle((uint64_t)v6);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
LABEL_25:
  objc_msgSend(v1, "fontSize");
  v19 = v18;
  if (v18 > 0.00000011920929)
  {
    objc_msgSend(v1, "fontWeight");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("medium")))
    {
      v21 = (void *)MEMORY[0x24BEBB520];
      v22 = (double *)MEMORY[0x24BEBB600];
    }
    else if (objc_msgSend(v20, "isEqualToString:", CFSTR("bold")))
    {
      v21 = (void *)MEMORY[0x24BEBB520];
      v22 = (double *)MEMORY[0x24BEBB5E8];
    }
    else
    {
      if (objc_msgSend(v20, "isEqualToString:", CFSTR("condensed-bold")))
      {
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", v19, *MEMORY[0x24BEBB5E8]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "fontDescriptor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "fontDescriptorWithSymbolicTraits:", 66);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v25, 0.0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_43:
        goto LABEL_44;
      }
      if (objc_msgSend(v20, "isEqualToString:", CFSTR("light")))
      {
        v21 = (void *)MEMORY[0x24BEBB520];
        v22 = (double *)MEMORY[0x24BEBB5F8];
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("ultra-light")))
      {
        v21 = (void *)MEMORY[0x24BEBB520];
        v22 = (double *)MEMORY[0x24BEBB628];
      }
      else
      {
        v29 = objc_msgSend(v20, "isEqualToString:", CFSTR("thin"));
        v21 = (void *)MEMORY[0x24BEBB520];
        if (!v29)
        {
          objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", v19);
          v30 = objc_claimAutoreleasedReturnValue();
          goto LABEL_42;
        }
        v22 = (double *)MEMORY[0x24BEBB618];
      }
    }
    objc_msgSend(v21, "systemFontOfSize:weight:", v19, *v22);
    v30 = objc_claimAutoreleasedReturnValue();
LABEL_42:
    v8 = (void *)v30;
    goto LABEL_43;
  }
  v8 = 0;
LABEL_44:
  objc_msgSend(v8, "fontDescriptor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *MEMORY[0x24BEBB548];
  v32 = *MEMORY[0x24BEBB598];
  v41[0] = *MEMORY[0x24BEBB5A0];
  v41[1] = v32;
  v42[0] = &unk_2512EEB38;
  v42[1] = &unk_2512EEB50;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v33;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v34;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "fontDescriptorByAddingAttributes:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v36, 0.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

id SUUIViewElementPlainColorWithIKColor(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "colorType") == 1)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(v3, "color");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

id SUUIViewElementPlainColorWithStyle(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(a1, "ikColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithIKColor(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t SUUIViewElementNSTextAlignmentForIKElementAlignment(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) >= 4)
    return 0;
  else
    return a1 - 1;
}

double SUUIViewElementMarginForStyle(void *a1, char *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  char v7;

  v3 = a1;
  objc_msgSend(v3, "valueForStyle:", *MEMORY[0x24BE518E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "valueForStyle:", CFSTR("itml-margin"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v7 = 0;
      v6 = *MEMORY[0x24BEBE158];
      if (!a2)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  objc_msgSend(v4, "UIEdgeInsetsValue");
  v6 = v5;

  v7 = 1;
  if (a2)
LABEL_4:
    *a2 = v7;
LABEL_5:

  return v6;
}

double SUUIViewElementPaddingForStyle(void *a1, char *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  char v7;

  v3 = a1;
  objc_msgSend(v3, "valueForStyle:", *MEMORY[0x24BE518F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "valueForStyle:", CFSTR("itml-padding"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v7 = 0;
      v6 = *MEMORY[0x24BEBE158];
      if (!a2)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  objc_msgSend(v4, "UIEdgeInsetsValue");
  v6 = v5;

  v7 = 1;
  if (a2)
LABEL_4:
    *a2 = v7;
LABEL_5:

  return v6;
}

void sub_241D1AE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D1B764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D1E2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D1E99C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__37(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__37(uint64_t a1)
{

}

void SUUILockupStyleForDictionary(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  *(_OWORD *)a3 = xmmword_241EFC0F0;
  *(_QWORD *)(a3 + 16) = 2142;
  objc_msgSend(v5, "objectForKey:", CFSTR("orientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = SUUILockupLayoutStyleForString(v7);
    *(_QWORD *)(a3 + 8) = v8;
    v9 = v8 & 2;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("artworkSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = SUUILockupSizeForString(v10);
    *(_QWORD *)a3 = v11;
  }
  else
  {
    v11 = 2;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("fields"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v11;
    v21 = v10;
    v22 = v9;
    v23 = v6;
    *(_QWORD *)(a3 + 16) = 0;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v25;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v18);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 |= SUUILockupFieldForString(v19);
            *(_QWORD *)(a3 + 16) = v16;
          }
          ++v18;
        }
        while (v15 != v18);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v15);
    }

    v9 = v22;
    v6 = v23;
    v11 = v20;
    v10 = v21;
  }
  if (!objc_msgSend(v6, "layoutStyle", v20, v21, v22, v23, (_QWORD)v24))
  {
    if (v11 != 4)
    {
      if (v11 != 5)
        goto LABEL_19;
      *(_QWORD *)a3 = 4;
    }
    if (v9)
      *(_QWORD *)(a3 + 8) = 0;
  }
LABEL_19:

}

uint64_t SUUILockupFieldForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("artistName")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("artwork")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("buyButton")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("genreName")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("itemCount")) & 1) != 0)
  {
    v2 = 128;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("name")) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("releaseDate")) & 1) != 0)
  {
    v2 = 32;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("userRating")))
  {
    v2 = 64;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id SUUILockupItemCountString(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "itemKind") == 17)
  {
    if (SUUILockupItemCountString_sFormatter)
    {
      if (v4)
      {
LABEL_4:
        objc_msgSend(v4, "localizedStringForKey:", CFSTR("APP_BUNDLE_LOCKUP_APP_COUNT"));
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v9 = (void *)v5;
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", objc_msgSend(v3, "numberOfChildItems"));
        v11 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend((id)SUUILockupItemCountString_sFormatter, "stringFromNumber:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v12);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x24BDD16F0]);
      v8 = (void *)SUUILockupItemCountString_sFormatter;
      SUUILockupItemCountString_sFormatter = (uint64_t)v7;

      objc_msgSend((id)SUUILockupItemCountString_sFormatter, "setNumberStyle:", 1);
      if (v4)
        goto LABEL_4;
    }
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("APP_BUNDLE_LOCKUP_APP_COUNT"), 0);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

uint64_t SUUILockupLayoutStyleForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("V")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("V2")) & 1) != 0)
  {
    v2 = 3;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("H2"));
  }

  return v2;
}

uint64_t SUUILockupSizeForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("S")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("L")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XL")) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("XXL")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

double SUUILockupStyleDefault@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 2;
  *(_OWORD *)a1 = xmmword_241EFC0F0;
  *(_QWORD *)(a1 + 16) = 2142;
  return result;
}

BOOL SUUILockupStyleEqualToLockupStyle(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

BOOL SUUILockupLayoutStyleIsHorizontal(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) != 2;
}

void sub_241D214C0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_241D21D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__38(uint64_t a1)
{

}

void SUUIScrollViewLayoutTopBackgroundColor(void *a1)
{
  void *v1;
  id v2;

  v2 = a1;
  objc_msgSend(v2, "viewWithTag:", 1095975495);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    __LayoutTopBackgroundColor(v2, v1);

}

void __LayoutTopBackgroundColor(void *a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v10 = a2;
  objc_msgSend(a1, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  objc_msgSend(v10, "setFrame:", v4, -v9, v6, v9);
}

void SUUIScrollViewLayoutTopBackgroundColorForProductPage(void *a1, double a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v11 = a1;
  objc_msgSend(v11, "viewWithTag:", 1095975495);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v11, "bounds");
    v5 = v4;
    v7 = v6;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9 + v9;

    objc_msgSend(v3, "setFrame:", v5, a2 - v10, v7, v10);
  }

}

void SUUIScrollViewSetTopBackgroundColor(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v6 = a1;
  v3 = a2;
  objc_msgSend(v6, "viewWithTag:", 1095975495);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x24BEBDB00]);
      objc_msgSend(v5, "setAutoresizingMask:", 2);
      objc_msgSend(v5, "setTag:", 1095975495);
      objc_msgSend(v6, "_addContentSubview:atBack:", v5, 1);
    }
    objc_msgSend(v5, "setBackgroundColor:", v3);
    __LayoutTopBackgroundColor(v6, v5);
  }
  else
  {
    objc_msgSend(v4, "removeFromSuperview");
  }

}

void *__Block_byref_object_copy__39(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__39(uint64_t a1)
{

}

void sub_241D2CEB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_241D2D0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id SUUITintedImage(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  void *v14;
  CGSize v16;
  CGRect v17;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "scale");
  v13 = v12;
  v16.width = v9;
  v16.height = v11;
  UIGraphicsBeginImageContextWithOptions(v16, 0, v13);
  objc_msgSend(v5, "set");

  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = v9;
  v17.size.height = v11;
  UIRectFill(v17);
  objc_msgSend(v7, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v9, v11, 1.0);

  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v9, v11);
  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v14;
}

BOOL SUUIImageExistsWithResourceName(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  unint64_t v4;
  void **v5;
  void *v6;
  char v7;
  unint64_t v8;
  void **v9;
  void *v10;
  int v11;
  void *v12;
  _BOOL8 v13;
  void *v15;

  v1 = a1;
  if (!SUUIImageExistsWithResourceName_sBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MobileStoreUI"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)SUUIImageExistsWithResourceName_sBundle;
    SUUIImageExistsWithResourceName_sBundle = v2;

  }
  v4 = 0;
  v5 = (void **)__iTunesStoreUIResources;
  do
  {
    v6 = *v5;
    v5 += 3;
    v7 = objc_msgSend(v6, "isEqualToString:", v1);
    if (v4 > 0x94)
      break;
    ++v4;
  }
  while ((v7 & 1) == 0);
  if ((v7 & 1) != 0)
    goto LABEL_12;
  v8 = 0;
  v9 = (void **)__UIKitResources;
  do
  {
    v10 = *v9;
    v9 += 3;
    v11 = objc_msgSend(v10, "isEqualToString:", v1);
    if (v8 > 2)
      break;
    ++v8;
  }
  while (!v11);
  if ((v11 & 1) != 0
    || (objc_msgSend((id)__ExternalResources, "objectForKey:", v1),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
LABEL_12:
    v13 = 1;
  }
  else
  {
    objc_msgSend((id)__ExternalResourceManager, "imageForResourceName:", v1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15 != 0;

  }
  return v13;
}

id SUUIImageWithResourceName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t i;
  int v6;
  int v7;
  id v8;
  __CFString **v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(0, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      if (!SUUIImageWithResourceName_sBundle)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MobileStoreUI"));
        v3 = objc_claimAutoreleasedReturnValue();
        v4 = (void *)SUUIImageWithResourceName_sBundle;
        SUUIImageWithResourceName_sBundle = v3;

      }
      for (i = 0; i != 450; i += 3)
      {
        if ((-[__CFString isEqualToString:](__iTunesStoreUIResources[i], "isEqualToString:", v1) & 1) != 0)
        {
          v9 = &__iTunesStoreUIResources[i];
          v10 = LOBYTE(__iTunesStoreUIResources[i + 2]) == 0;
          v7 = LOBYTE(__iTunesStoreUIResources[i + 2]) != 0;
          v6 = v10;
          objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", v9[1], SUUIImageWithResourceName_sBundle);
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v2)
            goto LABEL_14;
          goto LABEL_22;
        }
      }
      v6 = 0;
      v7 = 1;
LABEL_14:
      v11 = 0;
      while ((-[__CFString isEqualToString:](__UIKitResources[v11], "isEqualToString:", v1) & 1) == 0)
      {
        v11 += 3;
        if (v11 == 12)
          goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", __UIKitResources[v11 + 1]);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (v2)
        goto LABEL_23;
      v6 = 0;
      v7 = 1;
LABEL_20:
      objc_msgSend((id)__ExternalResources, "objectForKey:", v1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v12;
        v7 = objc_msgSend(v12, "alwaysTemplate");
        v6 = v7 ^ 1;
        v14 = (void *)MEMORY[0x24BEBD640];
        objc_msgSend(v13, "imageName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bundle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "imageNamed:inBundle:", v15, v16);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        if (v2)
        {
LABEL_22:
          if ((v7 & 1) != 0)
          {
LABEL_23:
            v17 = v2;
            v18 = 2;
LABEL_29:
            objc_msgSend(v17, "imageWithRenderingMode:", v18);
            v20 = objc_claimAutoreleasedReturnValue();

            v2 = (void *)v20;
            goto LABEL_30;
          }
LABEL_27:
          if (!v6)
            goto LABEL_30;
          v17 = v2;
          v18 = 1;
          goto LABEL_29;
        }
      }
      objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", v1, SUUIImageWithResourceName_sBundle);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19
        || (objc_msgSend((id)__ExternalResourceManager, "imageForResourceName:", v1),
            (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v2 = (void *)v19;
        if (v7)
          goto LABEL_23;
        goto LABEL_27;
      }
LABEL_30:
      v21 = 0;
      while (!-[__CFString isEqualToString:](__SKImagesThatFlip[v21], "isEqualToString:", v1))
      {
        if (++v21 == 3)
          goto LABEL_35;
      }
      objc_msgSend(v2, "imageFlippedForRightToLeftLayoutDirection");
      v22 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v22;
    }
LABEL_35:
    v8 = v2;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void SUUIResourceImageSetRegisterWithBundle(void *a1, void *a2)
{
  SUUIResourceImageSetRegisterWithBundleAlwaysTemplate(a1, a2, 0);
}

void SUUIResourceImageSetRegisterWithBundleAlwaysTemplate(void *a1, void *a2, char a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  char v15;

  v12 = a1;
  v5 = a2;
  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void SUUIResourceImageSetRegisterWithBundleAlwaysTemplate(NSDictionary *__strong, NSBundle *__strong, BOOL)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("StoreUIAppearance.m"), 425, CFSTR("Registering a new resource image set with iTunesStoreUI is only supported on the main thread."));

  }
  v7 = objc_msgSend(v12, "count");
  if (v5 && v7)
  {
    if (!__ExternalResources)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v9 = (void *)__ExternalResources;
      __ExternalResources = (uint64_t)v8;

    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __SUUIResourceImageSetRegisterWithBundleAlwaysTemplate_block_invoke;
    v13[3] = &unk_2511F9520;
    v14 = v5;
    v15 = a3;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v13);

  }
}

void SUUISetExternalResourceManager(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD17F0], "mainThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void SUUISetExternalResourceManager(__strong id<SUUIExternalResourceManager>)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("StoreUIAppearance.m"), 441, CFSTR("Registering a new resource image set with iTunesStoreUI is only supported on the main thread."));

  }
  v3 = (void *)__ExternalResourceManager;
  __ExternalResourceManager = (uint64_t)v1;

}

id SUUILinkArrowImage(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BEBD640];
  v4 = a2;
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("ChevronSeeAll"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SUUITintedImage(v5, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id SUUILinkArrowButton(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v9 = (void *)MEMORY[0x24BEBD640];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("ChevronSeeAll"), a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:forState:", v13, 0);

  objc_msgSend(v15, "titleLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v10);

  objc_msgSend(v15, "setTitleColor:forState:", v12, 0);
  objc_msgSend(v15, "setTitleColor:forState:", v11, 1);
  objc_msgSend(v14, "_flatImageWithColor:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setImage:forState:", v17, 0);
  objc_msgSend(v14, "_flatImageWithColor:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setImage:forState:", v18, 1);
  objc_msgSend(v14, "size");
  objc_msgSend(v15, "setTitleEdgeInsets:", 0.0, -(v19 + 5.0), 0.0, 0.0);
  objc_msgSend(v15, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v21 = v20;
  v23 = v22;
  objc_msgSend(v15, "titleRectForContentRect:", 0.0, 0.0, v20, v22);
  objc_msgSend(v15, "setImageEdgeInsets:", 1.0, v24 + 5.0, 0.0, 0.0);
  objc_msgSend(v15, "setFrame:", 0.0, 0.0, v21 + 5.0, v23);

  return v15;
}

id SUUIMoreDisclosureImage(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BEBD640];
  v4 = a2;
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("MoreDisclosureTriangleMask"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SUUITintedImage(v5, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t SUUISearchNoResultsImage(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:", CFSTR("ProxyGraphicSearch"), a1);
}

void SUUIRangesForFormatString(void *a1, void *a2, void *a3, unint64_t *a4, unint64_t *a5)
{
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;

  v9 = a2;
  v10 = a3;
  v11 = a1;
  v12 = objc_msgSend(v11, "rangeOfString:", CFSTR("%1$@"));
  v14 = v13;
  v15 = objc_msgSend(v11, "rangeOfString:", CFSTR("%2$@"));
  v17 = v16;

  v29 = v9;
  v18 = v10;
  if (v12 <= v15)
  {
    v19 = v15;
  }
  else
  {
    v14 = v17;
    v19 = v12;
  }
  if (v12 > v15)
    v20 = v18;
  else
    v20 = v29;
  if (v12 > v15)
    v21 = v29;
  else
    v21 = v18;
  if (v12 <= v15)
    v15 = v12;
  v22 = objc_msgSend(v20, "length");
  v23 = v19 - v14 + v22;
  v24 = objc_msgSend(v21, "length");
  if (v20 == v29)
    v25 = v15;
  else
    v25 = v23;
  if (v20 == v29)
    v26 = v22;
  else
    v26 = v24;
  if (v20 == v29)
    v27 = v23;
  else
    v27 = v15;
  *a4 = v25;
  a4[1] = v26;
  if (v20 == v29)
    v28 = v24;
  else
    v28 = v22;
  *a5 = v27;
  a5[1] = v28;

}

void sub_241D32F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D3317C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241D335E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D36F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__40(uint64_t a1)
{

}

void sub_241D371A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_241D376B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D3B2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D3B8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__41(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__41(uint64_t a1)
{

}

void sub_241D3C674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D3C9A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D40D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_241D413B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_241D41F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D422F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__42(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__42(uint64_t a1)
{

}

void sub_241D42EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ToggleImageColorUtilitiesTempFileCommand()
{
  sUseImageColorUtilitiesTempFile ^= 1u;
  return 1;
}

uint64_t GetToggleImageColorUtilitiesTempFileState()
{
  return sUseImageColorUtilitiesTempFile;
}

void ImageAnalyzer::ImageAnalyzer(ImageAnalyzer *this)
{
  ITColor::ITColor((ITColor *)this + 1);
  ITColor::ITColor((ITColor *)this + 2);
  ITColor::ITColor((ITColor *)this + 3);
  ITColor::ITColor((ITColor *)this + 4);
  ITColor::ITColor((ITColor *)this + 5);
  ITColor::ITColor((ITColor *)this + 6);
  ITColor::ITColor((ITColor *)this + 7);
  ITColor::ITColor((ITColor *)this + 8);
  ITColor::ITColor((ITColor *)this + 9);
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 23) = 0u;
}

void ImageAnalyzer::~ImageAnalyzer(ImageAnalyzer *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)this;
  if (v2)
  {
    free(v2);
    *(_QWORD *)this = 0;
  }
  v3 = (void *)*((_QWORD *)this + 1);
  if (v3)
  {
    free(v3);
    *((_QWORD *)this + 1) = 0;
  }
  v4 = (void *)*((_QWORD *)this + 43);
  if (v4)
  {
    *((_QWORD *)this + 44) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 40);
  if (v5)
  {
    *((_QWORD *)this + 41) = v5;
    operator delete(v5);
  }
}

uint64_t ImageAnalyzer::AnalyzeImage(ImageAnalyzer *this, CGContext *a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  result = ImageAnalyzer::GenerateColorMaps(this, a2);
  if ((_DWORD)result)
  {
    result = ImageAnalyzer::QuantizeColorMaps(this);
    if ((_DWORD)result)
    {
      ImageAnalyzer::PickBackgroundColor((ITColor *)this);
      ImageAnalyzer::PickTextColors((ITColor *)this);
      ImageAnalyzer::DoPostImageAnalysis((ITColor *)this);
      return 1;
    }
  }
  return result;
}

uint64_t ImageAnalyzer::GenerateColorMaps(ImageAnalyzer *this, CGContextRef context)
{
  int Width;
  int Height;
  uint64_t result;
  __int16 BitmapInfo;
  double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double HSVColor;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  size_t BytesPerRow;
  uint64_t v31;
  ITColor v32;
  ITColor v33;

  if (!context)
    return 0;
  BytesPerRow = CGBitmapContextGetBytesPerRow(context);
  Width = CGBitmapContextGetWidth(context);
  Height = CGBitmapContextGetHeight(context);
  result = 0;
  if (Height == 22 && Width == 22)
  {
    ITColor::ITColor(&v32);
    BitmapInfo = CGBitmapContextGetBitmapInfo(context);
    result = (uint64_t)CGBitmapContextGetData(context);
    v29 = result;
    if (result)
    {
      result = (uint64_t)malloc_type_calloc((22 * Width), 0x20uLL, 0x1000040E0EAB150uLL);
      *(_QWORD *)this = result;
      if (result)
      {
        v11 = 0;
        v12 = BitmapInfo & 0x3000;
        v13 = 1;
        v14 = 24;
        do
        {
          v15 = 0;
          v31 = v14;
          do
          {
            v16 = v29 + BytesPerRow * v13 + v15;
            if (v12)
              v17 = 6;
            else
              v17 = 5;
            if (v12)
              v18 = 5;
            else
              v18 = 6;
            if (v12)
              v19 = 4;
            else
              v19 = 7;
            LOBYTE(v8) = *(_BYTE *)(v16 + v17);
            LOBYTE(v9) = *(_BYTE *)(v16 + v18);
            LOBYTE(v10) = *(_BYTE *)(v16 + v19);
            ITColor::ITColor(&v33, (double)*(unint64_t *)&v8 / 255.0, (double)*(unint64_t *)&v9 / 255.0, (double)v10 / 255.0, 1.0);
            v32 = v33;
            HSVColor = ITColor::GetHSVColor(&v33);
            v22 = v21;
            v24 = v23;
            ITColor::GetLuminance(&v33);
            v25 = *(_QWORD *)this;
            v26 = (double *)(*(_QWORD *)this + v14);
            *(v26 - 3) = HSVColor;
            v27 = v25 + v11 + 8 * v15;
            *(_QWORD *)(v27 + 8) = v22;
            *(_QWORD *)(v27 + 16) = v24;
            *v26 = v28;
            v9 = *((double *)this + 47);
            v8 = v28 + v9;
            *((double *)this + 47) = v8;
            v15 += 4;
            v14 += 32;
          }
          while ((_DWORD)v15 != 80);
          ++v13;
          v14 = v31 + 640;
          v11 += 640;
        }
        while (v13 != 21);
        *((double *)this + 47) = v8 / 400.0;
        return 1;
      }
    }
  }
  return result;
}

uint64_t ImageAnalyzer::QuantizeColorMaps(ImageAnalyzer *this)
{
  uint64_t result;
  _BYTE *v3;
  uint64_t v4;
  double *v5;
  unint64_t v6;
  uint64_t v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  double *v17;
  uint64_t v18;
  double *v19;
  char *v20;
  double *v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  unsigned int (*v27)(_QWORD, _QWORD);
  unsigned int (*v28)(_QWORD, _QWORD);
  unsigned int (*v29)(_QWORD, _QWORD);
  unsigned int (*v30)(_QWORD, _QWORD);
  _BOOL8 v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  unint64_t v36;
  double *v37;
  unint64_t v38;
  uint64_t v39;
  double v40;
  _OWORD *v41;
  __int128 v42;
  _OWORD *v43;
  unsigned int (*v44[4])(_QWORD, _QWORD);
  int v45;
  double v46;
  void *__p;
  double *v48;
  double *v49;

  result = (uint64_t)malloc_type_calloc(0x190uLL, 8uLL, 0x100004000313F17uLL);
  *((_QWORD *)this + 1) = result;
  if (result)
  {
    result = (uint64_t)malloc_type_calloc(0x190uLL, 1uLL, 0x100004077774924uLL);
    if (result)
    {
      v3 = (_BYTE *)result;
      v4 = 0;
      v5 = 0;
      v6 = 0;
      __p = 0;
      v48 = 0;
      v49 = 0;
      v7 = 1;
      do
      {
        if (!v3[v6])
        {
          v8 = (double *)(*(_QWORD *)this + 32 * v6);
          v9 = *v8;
          v10 = v8[1];
          v11 = v8[2];
          v12 = v8[3];
          v13 = ImageAnalyzer::WeightForPointOnEdge((ImageAnalyzer *)result, v6 - 20 * ((unsigned __int16)v6 / 0x14u), (unsigned __int16)v6 / 0x14u);
          v14 = v13;
          v48 = v5;
          if (v5 >= v49)
          {
            v15 = 0x5555555555555556 * (((char *)v49 - (char *)v5) >> 4);
            if (v15 <= 1)
              v15 = 1;
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v49 - (char *)v5) >> 4) >= 0x2AAAAAAAAAAAAAALL)
              v16 = 0x555555555555555;
            else
              v16 = v15;
            v17 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>((uint64_t)&v49, v16);
            *v17 = v9;
            v17[1] = v10;
            v17[2] = v11;
            v17[3] = v12;
            *((_DWORD *)v17 + 8) = v6;
            v17[5] = v14;
            v20 = (char *)__p;
            v19 = v48;
            v21 = v17;
            if (v48 != __p)
            {
              do
              {
                v22 = *((_OWORD *)v19 - 3);
                v23 = *((_OWORD *)v19 - 1);
                *((_OWORD *)v21 - 2) = *((_OWORD *)v19 - 2);
                *((_OWORD *)v21 - 1) = v23;
                *((_OWORD *)v21 - 3) = v22;
                v21 -= 6;
                v19 -= 6;
              }
              while (v19 != (double *)v20);
              v19 = (double *)v20;
            }
            v5 = v17 + 6;
            __p = v21;
            v48 = v17 + 6;
            v49 = &v17[6 * v18];
            if (v19)
              operator delete(v19);
          }
          else
          {
            *v5 = v9;
            v5[1] = v10;
            v5[2] = v11;
            v5[3] = v12;
            *((_DWORD *)v5 + 8) = v6;
            v5[5] = v13;
            v5 += 6;
          }
          v48 = v5;
          *(double *)(*((_QWORD *)this + 1) + 8 * v6) = v14;
          v3[v6] = 1;
          if (v6 <= 0x18E)
          {
            v24 = v4;
            v25 = v7;
            do
            {
              if (!v3[v25])
              {
                v26 = (_QWORD *)(*(_QWORD *)this + v24);
                v27 = (unsigned int (*)(_QWORD, _QWORD))v26[4];
                v28 = (unsigned int (*)(_QWORD, _QWORD))v26[5];
                v29 = (unsigned int (*)(_QWORD, _QWORD))v26[6];
                v30 = (unsigned int (*)(_QWORD, _QWORD))v26[7];
                v31 = isCloseToColor(0, v9, v10, v11, v12, *(double *)&v27, *(double *)&v28, *(double *)&v29, *(double *)&v30, 0.0799999982);
                if (v31)
                {
                  v32 = ImageAnalyzer::WeightForPointOnEdge((ImageAnalyzer *)v31, v25 - 20 * ((unsigned __int16)v25 / 0x14u), (unsigned __int16)v25 / 0x14u);
                  v44[0] = v27;
                  v44[1] = v28;
                  v44[2] = v29;
                  v44[3] = v30;
                  v45 = v25;
                  v46 = v32;
                  ImageAnalyzer::AddQuantizeColorEntryToSet(v33, (double *)v44, &__p);
                  v3[v25] = 1;
                }
              }
              ++v25;
              v24 += 32;
            }
            while (v25 != 400);
            v5 = v48;
          }
          result = (uint64_t)__p;
          if (v5 != __p)
          {
            v44[0] = (unsigned int (*)(_QWORD, _QWORD))CompareQuantizeSortcolor;
            std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>((__int128 *)__p, (__int128 *)v5, v44, 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (_BYTE *)__p) >> 4)), 1);
            v5 = (double *)__p;
            v34 = *((unsigned int *)__p + 8);
            v35 = *((double *)__p + 5);
            v36 = 0xAAAAAAAAAAAAAAABLL * (((char *)v48 - (_BYTE *)__p) >> 4);
            if (v36 >= 2)
            {
              v37 = (double *)((char *)__p + 88);
              v38 = v36 - 1;
              do
              {
                v39 = *((unsigned int *)v37 - 2);
                v40 = *v37;
                if (!v3[v39])
                  v3[v39] = 1;
                v35 = v35 + v40;
                v37 += 6;
                v41 = (_OWORD *)(*(_QWORD *)this + 32 * v34);
                v42 = v41[1];
                v43 = (_OWORD *)(*(_QWORD *)this + 32 * v39);
                *v43 = *v41;
                v43[1] = v42;
                --v38;
              }
              while (v38);
            }
            *(double *)(*((_QWORD *)this + 1) + 8 * v34) = v35;
          }
        }
        ++v6;
        ++v7;
        v4 += 32;
      }
      while (v6 != 400);
      free(v3);
      if (__p)
      {
        v48 = (double *)__p;
        operator delete(__p);
      }
      return 1;
    }
  }
  return result;
}

void sub_241D43C7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ImageAnalyzer::PickBackgroundColor(ITColor *this)
{
  double var3;
  void **v3;
  __int128 v4;
  __int128 v5;
  double ContrastWithLuminance;
  unint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t i;
  double *v11;
  double v12;
  double v13;
  double v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  double HSVColor;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  ITColor v31;

  var3 = this[11].var3;
  v3 = ImageAnalyzer::DominantColors((ImageAnalyzer *)this);
  v4 = *((_OWORD *)*v3 + 1);
  *(_OWORD *)&this[1].var0 = *(_OWORD *)*v3;
  *(_OWORD *)&this[1].var2 = v4;
  v5 = *(_OWORD *)&this[1].var2;
  *(_OWORD *)&v31.var0 = *(_OWORD *)&this[1].var0;
  *(_OWORD *)&v31.var2 = v5;
  if (ITColor::GetContrastWithLuminance(&v31, 0.180000007) < 1.29999995)
  {
    ContrastWithLuminance = ITColor::GetContrastWithLuminance(this + 1, 0.180000007);
    v7 = (unint64_t)((_BYTE *)v3[1] - (_BYTE *)*v3) >> 5;
    if ((int)v7 >= 2)
    {
      v8 = ContrastWithLuminance;
      if ((_DWORD)v7 == 2)
        v9 = 2;
      else
        v9 = 3;
      for (i = 1; i != v9; ++i)
      {
        v11 = *(double **)&this[10].var3;
        v12 = v11[i];
        if (v12 <= 0.0)
          break;
        v13 = *v11 / v12;
        if (v13 <= 0.9 || v13 >= 1.112)
          break;
        v14 = ITColor::GetContrastWithLuminance((ITColor *)*v3 + i, 0.180000007);
        if (v14 > v8)
        {
          v15 = (char *)*v3 + 32 * i;
          v16 = v15[1];
          *(_OWORD *)&this[1].var0 = *v15;
          *(_OWORD *)&this[1].var2 = v16;
          v8 = v14;
        }
      }
    }
  }
  v17 = *(_OWORD *)&this[1].var2;
  *(_OWORD *)&v31.var0 = *(_OWORD *)&this[1].var0;
  *(_OWORD *)&v31.var2 = v17;
  if (ITColor::GetContrastWithLuminance(&v31, 0.180000007) < 1.29999995)
  {
    HSVColor = ITColor::GetHSVColor(this + 1);
    v20 = v19;
    v22 = v21;
    v28 = HSVColor;
    v29 = v19;
    v30 = v21;
    if (var3 < 0.180000007
      || (v23 = *(_OWORD *)&this[1].var2,
          *(_OWORD *)&v31.var0 = *(_OWORD *)&this[1].var0,
          *(_OWORD *)&v31.var2 = v23,
          ITColor::GetLuminance(&v31),
          v24 < 0.180000007))
    {
      v29 = v20 * 1.10000002;
      v30 = v22 * 0.800000012;
    }
    this[1].var0 = ITColor::CreateFromHSVColor(&v28);
    this[1].var1 = v25;
    this[1].var2 = v26;
    this[1].var3 = v27;
  }
}

void ImageAnalyzer::PickTextColors(ITColor *this)
{
  void **v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t *v5;
  void **v6;
  double ContrastWithColor;
  uint64_t v8;
  int v9;
  unint64_t v10;
  int v11;
  unsigned int v12;
  double v13;
  _OWORD *v14;
  __int128 v15;
  double var0;
  double var1;
  double var2;
  double var3;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  double *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  char v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  __int128 v51;
  __int128 *v52;
  double v53;
  double v54;
  double v55;
  __int128 *v56;
  double v57;
  double v58;
  double v59;
  __int128 v60;
  double v61;
  double v62;
  __int128 v63;
  double v64;
  __int128 v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  __int128 *v71;
  double BlendedColorWithFraction;
  double v73;
  double v74;
  double v75;
  __int128 *v76;
  __int128 v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  __int128 *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  __int128 *v88;
  double v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  ITColor v96;
  ITColor v97;
  ITColor v98;
  ITColor v99;
  ITColor v100;
  ITColor v101;
  ITColor v102;
  ITColor v103;

  v2 = ImageAnalyzer::DominantColors((ImageAnalyzer *)this);
  v3 = (_BYTE *)v2[1] - (_BYTE *)*v2;
  v4 = v3 >> 5;
  v5 = &qword_241EFC000;
  if ((v3 >> 5) < 2)
  {
    v41 = 0;
    v42 = 0;
    goto LABEL_29;
  }
  v6 = v2;
  ContrastWithColor = ITColor::GetContrastWithColor((ITColor *)*v2 + 1, this + 1);
  v8 = 0;
  v9 = 0;
  v10 = (v3 >> 5);
  v11 = 1;
  v93 = v4;
  v94 = v4;
  v12 = 1;
  v95 = 1;
  v13 = ContrastWithColor;
  do
  {
    v14 = (char *)*v6 + v8;
    v15 = v14[1];
    *(_OWORD *)&v96.var0 = *v14;
    *(_OWORD *)&v96.var2 = v15;
    if ((v9 & 1) == 0)
    {
      var0 = this[1].var0;
      var1 = this[1].var1;
      var2 = this[1].var2;
      var3 = this[1].var3;
      v98 = v96;
      v97.var0 = var0;
      v97.var1 = var1;
      v97.var2 = var2;
      v97.var3 = var3;
      v99 = v96;
      ITColor::GetLuminance(&v99);
      v21 = v20 >= 0.180000007;
      v99.var0 = var0;
      v99.var1 = var1;
      v99.var2 = var2;
      v99.var3 = var3;
      ITColor::GetLuminance(&v99);
      if (((v21 ^ (v22 >= 0.180000007)) & 1) != 0 && ITColor::GetContrastWithColor(&v98, &v97) >= 4.5999999)
      {
        ImageAnalyzer::EnhanceContrastWithColor(v96, this[1], 0.449999988);
        this[2].var0 = v23;
        this[2].var1 = v24;
        this[2].var2 = v25;
        this[2].var3 = v26;
        v9 = 1;
        v94 = v11;
      }
    }
    v27 = ITColor::GetContrastWithColor(&v96, this + 1);
    if (v27 > v13)
    {
      if (v27 <= ContrastWithColor)
      {
        v13 = v27;
        v95 = v11 - 1;
      }
      else
      {
        v13 = ContrastWithColor;
        ContrastWithColor = v27;
        v95 = v12;
        v12 = v11 - 1;
      }
    }
    ++v11;
    v8 += 32;
  }
  while (32 * v10 != v8);
  if (v94 >= v93)
  {
LABEL_16:
    ITColor::ITColor(&v99);
    v36 = 0;
    if ((v9 & 1) != 0)
    {
      LODWORD(v4) = v93;
      v5 = &qword_241EFC000;
      goto LABEL_25;
    }
    LOBYTE(v28) = 1;
    goto LABEL_18;
  }
  v28 = 0;
  v29 = 32 * v94;
  v30 = v94;
  while (1)
  {
    v31 = (double *)((char *)*v6 + v29);
    v32 = *v31;
    v33 = v31[1];
    v34 = v31[2];
    v35 = v31[3];
    v100.var0 = *v31;
    v100.var1 = v33;
    v100.var2 = v34;
    v100.var3 = v35;
    if (contrastsEnoughWithColor(v100, this[1]))
      break;
    v28 = ++v30 >= v10;
    v29 += 32;
    if (v10 == v30)
      goto LABEL_16;
  }
  v102.var0 = v32;
  v102.var1 = v33;
  v102.var2 = v34;
  v102.var3 = v35;
  ImageAnalyzer::EnhanceContrastWithColor(v102, this[1], 0.449999988);
  this[3].var0 = v43;
  this[3].var1 = v44;
  this[3].var2 = v45;
  this[3].var3 = v46;
  if ((v9 & ~v28 & 1) != 0)
  {
    v42 = 1;
    v36 = 1;
    LODWORD(v4) = v93;
    v5 = &qword_241EFC000;
    goto LABEL_28;
  }
  ITColor::ITColor(&v99);
  v36 = 1;
  if ((v9 & 1) == 0)
  {
LABEL_18:
    ImageAnalyzer::EnhanceContrastWithColor(*((ITColor *)*v6 + v12), this[1], 0.200000003);
    v99 = v101;
    if (contrastsEnoughWithColor(v101, this[1]))
    {
      ImageAnalyzer::EnhanceContrastWithColor(v99, this[1], 0.449999988);
      this[2].var0 = v37;
      this[2].var1 = v38;
      this[2].var2 = v39;
      this[2].var3 = v40;
      LOBYTE(v9) = 1;
    }
  }
  LODWORD(v4) = v93;
  v5 = &qword_241EFC000;
  if ((v28 & 1) != 0)
  {
LABEL_25:
    ImageAnalyzer::EnhanceContrastWithColor(*((ITColor *)*v6 + v95), this[1], 0.200000003);
    v99 = v103;
    if (contrastsEnoughWithColor(v103, this[1]))
    {
      ImageAnalyzer::EnhanceContrastWithColor(v99, this[1], 0.449999988);
      this[3].var0 = v47;
      this[3].var1 = v48;
      this[3].var2 = v49;
      this[3].var3 = v50;
      v36 = 1;
    }
  }
  v42 = v9;
LABEL_28:
  v41 = v36 != 0;
LABEL_29:
  v51 = *(_OWORD *)&this[1].var2;
  *(_OWORD *)&v99.var0 = *(_OWORD *)&this[1].var0;
  *(_OWORD *)&v99.var2 = v51;
  ITColor::GetLuminance(&v99);
  v52 = (__int128 *)&this[2];
  v54 = this[2].var1;
  v53 = this[2].var2;
  v55 = this[2].var3;
  v56 = (__int128 *)&this[3];
  v57 = *((double *)v5 + 50);
  if (v58 >= v57)
  {
    v99.var0 = this[2].var0;
    v99.var1 = v54;
    v99.var2 = v53;
    v99.var3 = v55;
    ITColor::GetLuminance(&v99);
    if (v59 >= v57)
      v42 = 0;
    v60 = *(_OWORD *)&this[3].var2;
    *(_OWORD *)&v99.var0 = *(_OWORD *)&this[3].var0;
    *(_OWORD *)&v99.var2 = v60;
    ITColor::GetLuminance(&v99);
    if (v61 >= v57)
      v41 = 0;
    if ((v42 & 1) != 0)
      goto LABEL_51;
LABEL_41:
    v65 = *(_OWORD *)&this[1].var2;
    *(_OWORD *)&v99.var0 = *(_OWORD *)&this[1].var0;
    *(_OWORD *)&v99.var2 = v65;
    ITColor::GetLuminance(&v99);
    if (v66 < v57)
    {
      if ((_DWORD)v4)
      {
        v67 = this[1].var0;
        v68 = this[1].var1;
        v69 = this[1].var2;
        v70 = this[1].var3;
        v71 = &ITColor::kWhite;
        goto LABEL_46;
      }
      v76 = &ITColor::kWhite;
    }
    else
    {
      if ((_DWORD)v4)
      {
        v67 = this[1].var0;
        v68 = this[1].var1;
        v69 = this[1].var2;
        v70 = this[1].var3;
        v71 = &ITColor::kBlack;
LABEL_46:
        BlendedColorWithFraction = ITColor::CreateBlendedColorWithFraction((ITColor *)v71, 0.0500000007, *(ITColor *)&v67);
LABEL_50:
        this[2].var0 = BlendedColorWithFraction;
        this[2].var1 = v73;
        this[2].var2 = v74;
        this[2].var3 = v75;
        goto LABEL_51;
      }
      v76 = &ITColor::kBlack;
    }
    BlendedColorWithFraction = *(double *)v76;
    v73 = *((double *)v76 + 1);
    v74 = *((double *)v76 + 2);
    v75 = *((double *)v76 + 3);
    goto LABEL_50;
  }
  v99.var0 = this[2].var0;
  v99.var1 = v54;
  v99.var2 = v53;
  v99.var3 = v55;
  ITColor::GetLuminance(&v99);
  if (v62 < v57)
    v42 = 0;
  v63 = *(_OWORD *)&this[3].var2;
  *(_OWORD *)&v99.var0 = *(_OWORD *)&this[3].var0;
  *(_OWORD *)&v99.var2 = v63;
  ITColor::GetLuminance(&v99);
  if (v64 < v57)
    v41 = 0;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_51:
  if (v41)
    goto LABEL_62;
  v77 = *(_OWORD *)&this[1].var2;
  *(_OWORD *)&v99.var0 = *(_OWORD *)&this[1].var0;
  *(_OWORD *)&v99.var2 = v77;
  ITColor::GetLuminance(&v99);
  if (v78 < v57)
  {
    if ((_DWORD)v4)
    {
      v79 = this[1].var0;
      v80 = this[1].var1;
      v81 = this[1].var2;
      v82 = this[1].var3;
      v83 = &ITColor::kWhite;
      goto LABEL_57;
    }
    v88 = &ITColor::kWhite;
LABEL_60:
    v84 = *(double *)v88;
    v85 = *((double *)v88 + 1);
    v86 = *((double *)v88 + 2);
    v87 = *((double *)v88 + 3);
    goto LABEL_61;
  }
  if (!(_DWORD)v4)
  {
    v88 = &ITColor::kBlack;
    goto LABEL_60;
  }
  v79 = this[1].var0;
  v80 = this[1].var1;
  v81 = this[1].var2;
  v82 = this[1].var3;
  v83 = &ITColor::kBlack;
LABEL_57:
  v84 = ITColor::CreateBlendedColorWithFraction((ITColor *)v83, 0.100000001, *(ITColor *)&v79);
LABEL_61:
  this[3].var0 = v84;
  this[3].var1 = v85;
  this[3].var2 = v86;
  this[3].var3 = v87;
LABEL_62:
  v89 = ITColor::GetContrastWithColor(this + 2, this + 1);
  if (ITColor::GetContrastWithColor(this + 3, this + 1) > v89)
  {
    v91 = *v52;
    v90 = *(_OWORD *)&this[2].var2;
    v92 = *(_OWORD *)&this[3].var2;
    *v52 = *v56;
    *(_OWORD *)&this[2].var2 = v92;
    *v56 = v91;
    *(_OWORD *)&this[3].var2 = v90;
  }
}

void ImageAnalyzer::DoPostImageAnalysis(ITColor *this)
{
  ITColor *v1;
  ITColor *v2;
  ITColor *v3;
  ITColor *v4;
  double v5;
  double v6;
  double v7;
  ITColor *v8;
  double v9;
  double v10;
  double v11;
  ImageAnalyzer *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  ImageAnalyzer *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  ImageAnalyzer *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  ImageAnalyzer *v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v1 = this;
  v2 = this + 2;
  v3 = this + 1;
  this[4].var0 = ITColor::CreateBlendedColorWithFraction(this + 2, 0.200000003, this[1]);
  v4 = v1 + 4;
  v1[4].var1 = v5;
  v1[4].var2 = v6;
  v1[4].var3 = v7;
  v8 = v1 + 3;
  v1[5].var0 = ITColor::CreateBlendedColorWithFraction(v1 + 3, 0.200000003, *v3);
  v1[5].var1 = v9;
  v1 += 5;
  v1->var2 = v10;
  v1->var3 = v11;
  ImageAnalyzer::CalculateOneShadowColor(v12, v2, v3);
  v1[1].var0 = v13;
  v1[1].var1 = v14;
  v1[1].var2 = v15;
  v1[1].var3 = v16;
  ImageAnalyzer::CalculateOneShadowColor(v17, v8, v3);
  v1[3].var0 = v18;
  v1[3].var1 = v19;
  v1[3].var2 = v20;
  v1[3].var3 = v21;
  ImageAnalyzer::CalculateOneShadowColor(v22, v4, v3);
  v1[2].var0 = v23;
  v1[2].var1 = v24;
  v1[2].var2 = v25;
  v1[2].var3 = v26;
  ImageAnalyzer::CalculateOneShadowColor(v27, v1, v3);
  v1[4].var0 = v28;
  v1[4].var1 = v29;
  v1[4].var2 = v30;
  v1[4].var3 = v31;
}

void ImageAnalyzer::AddQuantizeColorEntryToSet(uint64_t a1, double *a2, void **a3)
{
  _BYTE *v5;
  uint64_t v6;
  unint64_t v7;
  _OWORD *v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  _OWORD *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  char *v22;
  char *v23;
  __int128 v24;
  __int128 v25;

  v5 = a3[1];
  if (v5 == *a3)
  {
    v8 = a3[1];
LABEL_7:
    v9 = (unint64_t)a3[2];
    if ((unint64_t)v8 >= v9)
    {
      v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - v5) >> 4);
      v14 = v13 + 1;
      if (v13 + 1 > 0x555555555555555)
        std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
      v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - (_QWORD)v5) >> 4);
      if (2 * v15 > v14)
        v14 = 2 * v15;
      if (v15 >= 0x2AAAAAAAAAAAAAALL)
        v16 = 0x555555555555555;
      else
        v16 = v14;
      if (v16)
        v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>((uint64_t)(a3 + 2), v16);
      else
        v17 = 0;
      v18 = &v17[48 * v13];
      v19 = &v17[48 * v16];
      v20 = *(_OWORD *)a2;
      v21 = *((_OWORD *)a2 + 2);
      *((_OWORD *)v18 + 1) = *((_OWORD *)a2 + 1);
      *((_OWORD *)v18 + 2) = v21;
      *(_OWORD *)v18 = v20;
      v12 = v18 + 48;
      v23 = (char *)*a3;
      v22 = (char *)a3[1];
      if (v22 != *a3)
      {
        do
        {
          v24 = *((_OWORD *)v22 - 3);
          v25 = *((_OWORD *)v22 - 1);
          *((_OWORD *)v18 - 2) = *((_OWORD *)v22 - 2);
          *((_OWORD *)v18 - 1) = v25;
          *((_OWORD *)v18 - 3) = v24;
          v18 -= 48;
          v22 -= 48;
        }
        while (v22 != v23);
        v22 = (char *)*a3;
      }
      *a3 = v18;
      a3[1] = v12;
      a3[2] = v19;
      if (v22)
        operator delete(v22);
    }
    else
    {
      v10 = *(_OWORD *)a2;
      v11 = *((_OWORD *)a2 + 2);
      v8[1] = *((_OWORD *)a2 + 1);
      v8[2] = v11;
      *v8 = v10;
      v12 = v8 + 3;
    }
    a3[1] = v12;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v5 = *a3;
    while (!isCloseToColor(0, *a2, a2[1], a2[2], a2[3], *(double *)&v5[v6], *(double *)&v5[v6 + 8], *(double *)&v5[v6 + 16], *(double *)&v5[v6 + 24], 0.0799999982))
    {
      ++v7;
      v5 = *a3;
      v8 = a3[1];
      v6 += 48;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (_BYTE *)*a3) >> 4) <= v7)
        goto LABEL_7;
    }
    *(double *)((char *)*a3 + v6 + 40) = a2[5] + *(double *)((char *)*a3 + v6 + 40);
  }
}

BOOL isCloseToColor(ITColor *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  double v23;
  double v24;
  double v25;
  ITColor *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  ITColor v33;
  ITColor v34;

  if ((_DWORD)a1 && (a3 < 0.0500000007 && a7 < 0.0500000007 || a5 < 0.0149999997 && a9 < 0.0149999997))
  {
    v34.var0 = ITColor::CreateFromHSVDoubles(a1, a2, a3, a4);
    v34.var1 = v23;
    v34.var2 = v24;
    v34.var3 = v25;
    v33.var0 = ITColor::CreateFromHSVDoubles(v26, a6, a7, a8);
    v33.var1 = v27;
    v33.var2 = v28;
    v33.var3 = v29;
    if (ITColor::GetContrastWithColor(&v34, &v33) <= 1.65999997)
      return 1;
  }
  if (vabdd_f64(a3, a7) > a10 || vabdd_f64(a4, a8) > a10)
    return 0;
  if (vabdd_f64(a2, a6) <= a10)
    return 1;
  v30 = a2 + 1.0;
  if (a2 >= a10)
    v30 = a2;
  v31 = a6 + 1.0;
  if (a6 >= a10)
    v31 = a6;
  return vabdd_f64(v30, v31) <= a10;
}

double ImageAnalyzer::WeightForPointOnEdge(ImageAnalyzer *this, unsigned int a2, unsigned int a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  v3 = (double)a2;
  if (a2 <= 4 && a3 <= 4)
  {
    v4 = (double)a3;
    v5 = 4.00000006 - v3;
    goto LABEL_4;
  }
  if (a2 > 4)
  {
    if (a2 >= 0x10 && a3 <= 4)
    {
      v4 = (double)a3;
      v5 = 15.9999999 - v3;
LABEL_4:
      v6 = 4.00000006 - v4;
      if (v5 >= 1.0)
        v7 = v5 * 0.75;
      else
        v7 = 0.75;
      if (v6 >= 1.0)
        v8 = v6 * 0.75;
      else
        v8 = 0.75;
      if (v8 <= v7)
        v8 = v7;
      goto LABEL_22;
    }
    v8 = 1.0;
    if (a2 < 0x10)
      goto LABEL_22;
    v9 = 15.9999999;
  }
  else
  {
    v9 = 4.00000006;
  }
  v10 = v9 - v3;
  v8 = 0.75;
  if (v10 >= 1.0)
    v8 = v10 * 0.75;
LABEL_22:
  result = 1.0;
  if (v8 >= 1.0)
    return v8;
  return result;
}

BOOL CompareQuantizeSortcolor(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 40) > *(double *)(a2 + 40);
}

void **ImageAnalyzer::DominantColors(ImageAnalyzer *this)
{
  void **v1;
  ITColor *v3;
  uint64_t v4;
  uint64_t i;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  __int128 *v10;
  void **v11;
  unint64_t v12;
  __int128 *v13;
  char *v14;
  unint64_t v15;
  __int128 v16;
  _OWORD *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  __int128 *v23;
  __int128 v24;
  char *v25;
  char *v26;
  __int128 *v27;
  __int128 v28;
  __int128 *v29;
  unint64_t v30;
  char *v31;
  _QWORD *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  double v42[2];
  ITColor v43;
  uint64_t v44;
  __int128 *v45;
  __int128 *v46;
  uint64_t v47;
  BOOL (*v48)(double *, double *);

  v1 = (void **)((char *)this + 320);
  if (*((_QWORD *)this + 41) == *((_QWORD *)this + 40))
  {
    v45 = 0;
    v46 = 0;
    v47 = 0;
    ITColor::ITColor(&v43);
    v4 = 0;
    for (i = 0; i != 3200; i += 8)
    {
      if (*(double *)(*((_QWORD *)this + 1) + i) >= 1.0)
      {
        v42[0] = *(double *)(*((_QWORD *)this + 1) + i);
        v43.var0 = ITColor::CreateFromHSVDoubles(v3, *(double *)(*(_QWORD *)this + v4), *(double *)(*(_QWORD *)this + v4 + 8), *(double *)(*(_QWORD *)this + v4 + 16));
        v43.var1 = v6;
        v43.var2 = v7;
        v43.var3 = v8;
        v44 = *(_QWORD *)(*(_QWORD *)this + v4 + 24);
        ImageAnalyzer::AddDominantColorEntryToSet(v9, v42, (void **)&v45);
      }
      v4 += 32;
    }
    v10 = v46;
    if (v46 != v45)
    {
      v48 = CompareSortColor;
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>(v45, v46, (unsigned int (**)(_QWORD, _QWORD))&v48, 126 - 2 * __clz(((char *)v46 - (char *)v45) >> 6), 1);
      std::vector<ITColor>::reserve(v1, ((char *)v46 - (char *)v45) >> 6);
      v11 = (void **)((char *)this + 344);
      std::vector<double>::reserve((void **)this + 43, ((char *)v46 - (char *)v45) >> 6);
      v10 = v46;
      if (v46 != v45)
      {
        v12 = 0;
        v10 = v45;
        do
        {
          v13 = &v10[4 * v12 + 1];
          v14 = (char *)*((_QWORD *)this + 41);
          v15 = *((_QWORD *)this + 42);
          if ((unint64_t)v14 >= v15)
          {
            v18 = (v14 - (_BYTE *)*v1) >> 5;
            v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 59)
              std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
            v20 = v15 - (_QWORD)*v1;
            if (v20 >> 4 > v19)
              v19 = v20 >> 4;
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFE0)
              v21 = 0x7FFFFFFFFFFFFFFLL;
            else
              v21 = v19;
            if (v21)
              v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>((uint64_t)this + 336, v21);
            else
              v22 = 0;
            v23 = (__int128 *)&v22[32 * v18];
            v24 = v13[1];
            *v23 = *v13;
            v23[1] = v24;
            v26 = (char *)*((_QWORD *)this + 40);
            v25 = (char *)*((_QWORD *)this + 41);
            v27 = v23;
            if (v25 != v26)
            {
              do
              {
                v28 = *((_OWORD *)v25 - 1);
                *(v27 - 2) = *((_OWORD *)v25 - 2);
                *(v27 - 1) = v28;
                v27 -= 2;
                v25 -= 32;
              }
              while (v25 != v26);
              v25 = (char *)*v1;
            }
            v17 = v23 + 2;
            *((_QWORD *)this + 40) = v27;
            *((_QWORD *)this + 41) = v23 + 2;
            *((_QWORD *)this + 42) = &v22[32 * v21];
            if (v25)
              operator delete(v25);
          }
          else
          {
            v16 = v10[4 * v12 + 2];
            *(_OWORD *)v14 = *v13;
            *((_OWORD *)v14 + 1) = v16;
            v17 = v14 + 32;
          }
          *((_QWORD *)this + 41) = v17;
          v29 = &v45[4 * v12];
          v31 = (char *)*((_QWORD *)this + 44);
          v30 = *((_QWORD *)this + 45);
          if ((unint64_t)v31 >= v30)
          {
            v33 = (char *)*v11;
            v34 = (v31 - (_BYTE *)*v11) >> 3;
            v35 = v34 + 1;
            if ((unint64_t)(v34 + 1) >> 61)
              std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
            v36 = v30 - (_QWORD)v33;
            if (v36 >> 2 > v35)
              v35 = v36 >> 2;
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8)
              v37 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v37 = v35;
            if (v37)
            {
              v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)this + 360, v37);
              v33 = (char *)*((_QWORD *)this + 43);
              v31 = (char *)*((_QWORD *)this + 44);
            }
            else
            {
              v38 = 0;
            }
            v39 = &v38[8 * v34];
            *(_QWORD *)v39 = *(_QWORD *)v29;
            v32 = v39 + 8;
            while (v31 != v33)
            {
              v40 = *((_QWORD *)v31 - 1);
              v31 -= 8;
              *((_QWORD *)v39 - 1) = v40;
              v39 -= 8;
            }
            *((_QWORD *)this + 43) = v39;
            *((_QWORD *)this + 44) = v32;
            *((_QWORD *)this + 45) = &v38[8 * v37];
            if (v33)
              operator delete(v33);
          }
          else
          {
            *(_QWORD *)v31 = *(_QWORD *)v29;
            v32 = v31 + 8;
          }
          *((_QWORD *)this + 44) = v32;
          ++v12;
          v10 = v45;
        }
        while (v12 < ((char *)v46 - (char *)v45) >> 6);
      }
    }
    if (v10)
    {
      v46 = v10;
      operator delete(v10);
    }
  }
  return v1;
}

void sub_241D44BAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL IsLightColor(_OWORD *a1)
{
  __int128 v1;
  double v2;
  ITColor v4;

  v1 = a1[1];
  *(_OWORD *)&v4.var0 = *a1;
  *(_OWORD *)&v4.var2 = v1;
  ITColor::GetLuminance(&v4);
  return v2 >= 0.180000007;
}

void ImageAnalyzer::EnhanceContrastWithColor(ITColor a1, ITColor a2, double a3)
{
  double var2;
  double var1;
  double var0;
  double HSVColor;
  double v8;
  double v9;
  double v10;
  double v11;
  ITColor *v12;
  double v13;
  double v14;
  double var3;
  ITColor v16;

  var3 = a2.var3;
  var2 = a2.var2;
  var1 = a2.var1;
  var0 = a2.var0;
  v16 = a1;
  HSVColor = ITColor::GetHSVColor(&v16);
  v9 = v8;
  v11 = v10;
  ITColor::GetLuminance(&v16);
  v16.var0 = var0;
  v16.var1 = var1;
  v16.var2 = var2;
  v16.var3 = var3;
  ITColor::GetLuminance(&v16);
  v13 = 1.0 - (1.0 - v11) * a3;
  if (v14 >= 0.180000007)
    v13 = v11 * a3;
  ITColor::CreateFromHSVDoubles(v12, HSVColor, v9, v13);
}

BOOL contrastsEnoughWithColor(ITColor a1, ITColor a2)
{
  double var3;
  double var2;
  double var1;
  double var0;
  double v6;
  _BOOL4 v7;
  double v8;
  ITColor v10;
  ITColor v11;
  ITColor v12;

  var3 = a2.var3;
  var2 = a2.var2;
  var1 = a2.var1;
  var0 = a2.var0;
  v11 = a1;
  v10 = a2;
  v12 = a1;
  ITColor::GetLuminance(&v12);
  v7 = v6 >= 0.180000007;
  v12.var0 = var0;
  v12.var1 = var1;
  v12.var2 = var2;
  v12.var3 = var3;
  ITColor::GetLuminance(&v12);
  return v7 != v8 >= 0.180000007 && ITColor::GetContrastWithColor(&v11, &v10) >= 3.0999999;
}

BOOL ImageAnalyzer::GetColorLuminanceTypeOfColor(ImageAnalyzer *this, ITColor a2)
{
  double v2;
  ITColor v4;

  v4 = a2;
  ITColor::GetLuminance(&v4);
  return v2 < 0.180000007;
}

double ImageAnalyzer::CalculateAlternateTextColorForColor(ITColor *this, ITColor *a2)
{
  return ITColor::CreateBlendedColorWithFraction(a2, 0.200000003, this[1]);
}

void ImageAnalyzer::CalculateOneShadowColor(ImageAnalyzer *this, ITColor *a2, ITColor *a3)
{
  double v5;
  double v6;
  double v7;
  __int128 *v8;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  ITColor v14;

  ITColor::ITColor(&v14);
  ITColor::GetLuminance(a2);
  v6 = v5;
  ITColor::GetLuminance(a3);
  if (v6 >= v7)
    v8 = &ITColor::kBlack;
  else
    v8 = &ITColor::kWhite;
  v9 = v8[1];
  *(_OWORD *)&v14.var0 = *v8;
  *(_OWORD *)&v14.var2 = v9;
  ITColor::GetLuminance(&v14);
  v11 = v10;
  ITColor::GetLuminance(a3);
  v13 = vabdd_f64(v11, v12);
  ITColor::CreateBlendedColorWithFraction(&v14, 1.0 - ((v13 + v13) * -0.599999994 + 1.0), *a3);
}

double ImageAnalyzer::GetBorderMarginInPercentage(ImageAnalyzer *this)
{
  return *((double *)this + 46);
}

double ImageAnalyzer::GetBorderMarginInPixels(ImageAnalyzer *this)
{
  double v1;

  v1 = *((double *)this + 3);
  if (v1 <= *((double *)this + 2))
    v1 = *((double *)this + 2);
  return ceil(v1 * *((double *)this + 46));
}

double ImageAnalyzer::MakeDesaturatedTextColorFor(ImageAnalyzer *this, ITColor a2)
{
  double HSVColor;
  double v3;
  double v4;
  double v6[3];
  ITColor v7;

  v7 = a2;
  HSVColor = ITColor::GetHSVColor(&v7);
  v6[2] = v3;
  v6[0] = HSVColor;
  v6[1] = v4 * 0.800000012;
  return ITColor::CreateFromHSVColor(v6);
}

void ImageAnalyzer::AddDominantColorEntryToSet(uint64_t a1, double *a2, void **a3)
{
  _BYTE *v5;
  uint64_t v6;
  unint64_t v7;
  double *v8;
  double v9;
  double v10;
  __int128 v11;
  double HSVColor;
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
  _OWORD *v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char *v41;
  char *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  ITColor v47;

  v5 = a3[1];
  if (v5 == *a3)
  {
    v25 = a3[1];
LABEL_7:
    v26 = (unint64_t)a3[2];
    if ((unint64_t)v25 >= v26)
    {
      v31 = ((char *)v25 - v5) >> 6;
      v32 = v31 + 1;
      if ((unint64_t)(v31 + 1) >> 58)
        std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
      v33 = v26 - (_QWORD)v5;
      if (v33 >> 5 > v32)
        v32 = v33 >> 5;
      if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFC0)
        v34 = 0x3FFFFFFFFFFFFFFLL;
      else
        v34 = v32;
      if (v34)
        v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<sortColorEntry>>((uint64_t)(a3 + 2), v34);
      else
        v35 = 0;
      v36 = &v35[64 * v31];
      v37 = &v35[64 * v34];
      v38 = *(_OWORD *)a2;
      v39 = *((_OWORD *)a2 + 1);
      v40 = *((_OWORD *)a2 + 3);
      *((_OWORD *)v36 + 2) = *((_OWORD *)a2 + 2);
      *((_OWORD *)v36 + 3) = v40;
      *(_OWORD *)v36 = v38;
      *((_OWORD *)v36 + 1) = v39;
      v30 = v36 + 64;
      v42 = (char *)*a3;
      v41 = (char *)a3[1];
      if (v41 != *a3)
      {
        do
        {
          v43 = *((_OWORD *)v41 - 4);
          v44 = *((_OWORD *)v41 - 3);
          v45 = *((_OWORD *)v41 - 1);
          *((_OWORD *)v36 - 2) = *((_OWORD *)v41 - 2);
          *((_OWORD *)v36 - 1) = v45;
          *((_OWORD *)v36 - 4) = v43;
          *((_OWORD *)v36 - 3) = v44;
          v36 -= 64;
          v41 -= 64;
        }
        while (v41 != v42);
        v41 = (char *)*a3;
      }
      *a3 = v36;
      a3[1] = v30;
      a3[2] = v37;
      if (v41)
        operator delete(v41);
    }
    else
    {
      v27 = *(_OWORD *)a2;
      v28 = *((_OWORD *)a2 + 1);
      v29 = *((_OWORD *)a2 + 3);
      v25[2] = *((_OWORD *)a2 + 2);
      v25[3] = v29;
      *v25 = v27;
      v25[1] = v28;
      v30 = v25 + 4;
    }
    a3[1] = v30;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v5 = *a3;
    while (1)
    {
      v8 = (double *)&v5[v6];
      v9 = v8[4];
      v10 = v8[5];
      v11 = *((_OWORD *)a2 + 2);
      v46 = *((_OWORD *)v8 + 1);
      *(_OWORD *)&v47.var0 = *((_OWORD *)a2 + 1);
      *(_OWORD *)&v47.var2 = v11;
      HSVColor = ITColor::GetHSVColor(&v47);
      v14 = v13;
      v16 = v15;
      ITColor::GetLuminance(&v47);
      v18 = v17;
      *(_OWORD *)&v47.var0 = v46;
      v47.var2 = v9;
      v47.var3 = v10;
      v19 = ITColor::GetHSVColor(&v47);
      v21 = v20;
      v23 = v22;
      ITColor::GetLuminance(&v47);
      if (isCloseToColor((ITColor *)1, HSVColor, v14, v16, v18, v19, v21, v23, v24, 0.0700000003))
        break;
      ++v7;
      v5 = *a3;
      v25 = a3[1];
      v6 += 64;
      if (v7 >= ((char *)v25 - (_BYTE *)*a3) >> 6)
        goto LABEL_7;
    }
    *(double *)((char *)*a3 + v6) = *a2 + *(double *)((char *)*a3 + v6);
  }
}

BOOL CompareSortColor(double *a1, double *a2)
{
  return *a1 > *a2;
}

void std::vector<ITColor>::reserve(void **a1, unint64_t a2)
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
  __int128 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 5)
  {
    if (a2 >> 59)
      std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFE0];
    v9 = &v6[32 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 32;
        v10 -= 32;
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

void std::vector<double>::reserve(void **a1, unint64_t a2)
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
      std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_QWORD *)v11 - 1);
        v11 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

BOOL AnalyzeImagePlease(_BOOL8 result, uint64_t a2)
{
  CGContext *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  double v12;
  __int128 v13;
  double v14;
  __int128 v15;
  double v16;
  double v17;
  _BYTE v18[32];
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  double v39;
  ITColor v40;

  if (result)
  {
    v3 = (CGContext *)result;
    ImageAnalyzer::ImageAnalyzer((ImageAnalyzer *)v18);
    if (ImageAnalyzer::AnalyzeImage((ImageAnalyzer *)v18, v3))
    {
      v4 = v19;
      v5 = v20;
      v6 = v21;
      *(double *)a2 = v19;
      *(double *)(a2 + 8) = v5;
      *(double *)(a2 + 16) = v6;
      v7 = *(double *)&v22;
      *(_OWORD *)(a2 + 24) = v22;
      *(_OWORD *)(a2 + 40) = v23;
      *(_OWORD *)(a2 + 56) = v24;
      *(_OWORD *)(a2 + 72) = v25;
      *(_OWORD *)(a2 + 88) = v26;
      *(_OWORD *)(a2 + 104) = v27;
      *(_OWORD *)(a2 + 120) = v28;
      *(_OWORD *)(a2 + 136) = v29;
      v8 = v32;
      *(_OWORD *)(a2 + 152) = v30;
      *(_OWORD *)(a2 + 168) = v31;
      *(_QWORD *)(a2 + 184) = v8;
      v9 = v34;
      *(_OWORD *)(a2 + 224) = v33;
      *(_OWORD *)(a2 + 240) = v9;
      v10 = v36;
      *(_OWORD *)(a2 + 192) = v35;
      *(_OWORD *)(a2 + 208) = v10;
      v11 = v38;
      *(_OWORD *)(a2 + 256) = v37;
      *(_OWORD *)(a2 + 272) = v11;
      *(_BYTE *)(a2 + 296) = 1;
      v40.var0 = v4;
      v40.var1 = v5;
      v40.var2 = v6;
      v40.var3 = v7;
      ITColor::GetLuminance(&v40);
      *(_BYTE *)(a2 + 297) = v12 >= 0.180000007;
      v13 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)&v40.var0 = *(_OWORD *)(a2 + 32);
      *(_OWORD *)&v40.var2 = v13;
      ITColor::GetLuminance(&v40);
      *(_BYTE *)(a2 + 298) = v14 >= 0.180000007;
      v15 = *(_OWORD *)(a2 + 80);
      *(_OWORD *)&v40.var0 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)&v40.var2 = v15;
      ITColor::GetLuminance(&v40);
      *(_BYTE *)(a2 + 299) = v16 >= 0.180000007;
      v17 = v39;
      *(_BYTE *)(a2 + 300) = v39 > 0.0;
      *(double *)(a2 + 288) = v17;
      ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)v18);
      return *(_BYTE *)(a2 + 296) != 0;
    }
    else
    {
      ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)v18);
      return 0;
    }
  }
  return result;
}

void sub_241D453C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)&a9);
  _Unwind_Resume(a1);
}

double AnalyzedImageColors::GetSelectionColorForState(AnalyzedImageColors *this, int a2, int a3)
{
  __int128 *v4;
  double v5;

  if (!*((_BYTE *)this + 296))
    return 0.333;
  if (a2 && a3)
    return *((double *)this + 8);
  if ((a2 & 1) != 0)
  {
    if (*((_BYTE *)this + 297))
      v4 = &ITColor::kBlack;
    else
      v4 = &ITColor::kWhite;
    v5 = 0.25;
  }
  else
  {
    if (*((_BYTE *)this + 297))
      v4 = &ITColor::kBlack;
    else
      v4 = &ITColor::kWhite;
    v5 = 0.150000006;
  }
  return ITColor::ColorWithAlphaComponent((ITColor *)v4, v5);
}

double ITColor::ColorWithAlphaComponent(ITColor *this, double a2)
{
  ITColor v3;

  ITColor::ITColor(&v3, this->var0, this->var1, this->var2, a2);
  return v3.var0;
}

double AnalyzedImageColors::GetSelectedRowTextColorForState(AnalyzedImageColors *this, int a2, int a3)
{
  __int128 v3;
  double v4;
  __int128 *v5;
  ITColor v7;

  if (*((_BYTE *)this + 296))
  {
    if (a2 && a3)
    {
      v3 = *((_OWORD *)this + 5);
      *(_OWORD *)&v7.var0 = *((_OWORD *)this + 4);
      *(_OWORD *)&v7.var2 = v3;
      ITColor::GetLuminance(&v7);
      if (v4 < 0.180000007)
        v5 = &ITColor::kWhite;
      else
        v5 = &ITColor::kBlack;
    }
    else if (*((_BYTE *)this + 297))
    {
      v5 = &ITColor::kBlack;
    }
    else
    {
      v5 = &ITColor::kWhite;
    }
  }
  else
  {
    v5 = &ITColor::kWhite;
  }
  return *(double *)v5;
}

BOOL IsLightLuminance(double a1)
{
  return a1 >= 0.180000007;
}

void std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2511F3E28, MEMORY[0x24BEDAAF0]);
}

void sub_241D455E8(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

_OWORD *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,sortQuantizeColorEntry*>(uint64_t a1, _OWORD *a2, _OWORD *a3, unsigned int (**a4)(_QWORD, _QWORD))
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __n128 *v12;
  _OWORD *v13;
  _OWORD *v14;
  unsigned int (*v15)(_OWORD *, _OWORD *);
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int64_t v23;
  __n128 *v24;
  __n128 v25;
  __n128 *v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  _OWORD v33[3];
  _OWORD v34[6];
  __n128 v35;
  __n128 v36;
  __n128 v37;

  if ((_OWORD *)a1 != a2)
  {
    v8 = (uint64_t)a2 - a1;
    v9 = ((uint64_t)a2 - a1) / 48;
    if ((uint64_t)a2 - a1 >= 49)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (__n128 *)(a1 + 48 * v10);
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a4, v9, v12);
        v12 -= 3;
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = (unsigned int (*)(_OWORD *, _OWORD *))*a4;
        v16 = v14[1];
        v34[0] = *v14;
        v34[1] = v16;
        v34[2] = v14[2];
        v17 = *(_OWORD *)(a1 + 16);
        v33[0] = *(_OWORD *)a1;
        v33[1] = v17;
        v33[2] = *(_OWORD *)(a1 + 32);
        if (v15(v34, v33))
        {
          v18 = *v14;
          v19 = v14[1];
          v20 = v14[2];
          v22 = *(_OWORD *)(a1 + 16);
          v21 = *(_OWORD *)(a1 + 32);
          *v14 = *(_OWORD *)a1;
          v14[1] = v22;
          v14[2] = v21;
          *(_OWORD *)(a1 + 16) = v19;
          *(_OWORD *)(a1 + 32) = v20;
          *(_OWORD *)a1 = v18;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a4, v9, (__n128 *)a1);
        }
        v14 += 3;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 49)
    {
      v23 = v8 / 0x30uLL;
      v24 = (__n128 *)(a2 - 3);
      do
      {
        v25 = *(__n128 *)(a1 + 16);
        v35 = *(__n128 *)a1;
        v36 = v25;
        v37 = *(__n128 *)(a1 + 32);
        v26 = (__n128 *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((_OWORD *)a1, (unsigned int (**)(_OWORD *, _OWORD *))a4, v23);
        if (v24 == v26)
        {
          v30 = v36;
          *v26 = v35;
          v26[1] = v30;
          v26[2] = v37;
        }
        else
        {
          v27 = *v24;
          v28 = v24[2];
          v26[1] = v24[1];
          v26[2] = v28;
          *v26 = v27;
          v29 = v36;
          *v24 = v35;
          v24[1] = v29;
          v24[2] = v37;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, (uint64_t)&v26[3], a4, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)&v26[3] - a1) >> 4));
        }
        v24 -= 3;
      }
      while (v23-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t a1, unsigned int (**a2)(_QWORD, _QWORD), uint64_t a3, __n128 *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __n128 *v7;
  uint64_t v9;
  uint64_t v12;
  __n128 *v13;
  uint64_t v14;
  unsigned int (*v15)(_QWORD, _QWORD);
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  unsigned int (*v20)(_QWORD, _QWORD);
  __n128 v21;
  __n128 v22;
  __n128 result;
  __n128 v24;
  __n128 *v25;
  __n128 v26;
  __n128 v27;
  uint64_t v28;
  unsigned int (*v29)(_QWORD, _QWORD);
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  unsigned int (*v34)(_QWORD, _QWORD);
  __n128 v35;
  __n128 v36;
  _OWORD v37[3];
  _OWORD v38[3];
  _OWORD v39[3];
  _OWORD v40[3];
  __n128 v41;
  __n128 v42;
  __n128 v43;
  _OWORD v44[3];
  _OWORD v45[3];
  _OWORD v46[3];
  _OWORD v47[4];
  uint64_t v48;
  uint64_t v49;

  v6 = a3 - 2;
  if (a3 >= 2)
  {
    v48 = v4;
    v49 = v5;
    v7 = a4;
    v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 4)))
    {
      v12 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 4)) | 1;
      v13 = (__n128 *)(a1 + 48 * v12);
      v14 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 4) + 2;
      if (v14 < a3)
      {
        v15 = *a2;
        v16 = v13[1];
        v47[0] = *v13;
        v47[1] = v16;
        v17 = v13[3];
        v47[2] = v13[2];
        v18 = v13[4];
        v19 = v13[5];
        v46[0] = v17;
        v46[1] = v18;
        v46[2] = v19;
        if (v15(v47, v46))
        {
          v13 += 3;
          v12 = v14;
        }
      }
      v20 = *a2;
      v21 = v13[1];
      v45[0] = *v13;
      v45[1] = v21;
      v45[2] = v13[2];
      v22 = v7[1];
      v44[0] = *v7;
      v44[1] = v22;
      v44[2] = v7[2];
      if ((((uint64_t (*)(_OWORD *, _OWORD *))v20)(v45, v44) & 1) == 0)
      {
        v24 = v7[1];
        v41 = *v7;
        v42 = v24;
        v43 = v7[2];
        do
        {
          v25 = v13;
          v26 = *v13;
          v27 = v13[2];
          v7[1] = v13[1];
          v7[2] = v27;
          *v7 = v26;
          if (v9 < v12)
            break;
          v28 = (2 * v12) | 1;
          v13 = (__n128 *)(a1 + 48 * v28);
          if (2 * v12 + 2 < a3)
          {
            v29 = *a2;
            v30 = v13[1];
            v40[0] = *v13;
            v40[1] = v30;
            v31 = v13[3];
            v40[2] = v13[2];
            v32 = v13[4];
            v33 = v13[5];
            v39[0] = v31;
            v39[1] = v32;
            v39[2] = v33;
            if (v29(v40, v39))
            {
              v13 += 3;
              v28 = 2 * v12 + 2;
            }
          }
          v34 = *a2;
          v35 = v13[1];
          v38[0] = *v13;
          v38[1] = v35;
          v38[2] = v13[2];
          v37[0] = v41;
          v37[1] = v42;
          v37[2] = v43;
          v7 = v25;
          v12 = v28;
        }
        while (!v34(v38, v37));
        result = v41;
        v36 = v43;
        v25[1] = v42;
        v25[2] = v36;
        *v25 = result;
      }
    }
  }
  return result;
}

_OWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(_OWORD *a1, unsigned int (**a2)(_OWORD *, _OWORD *), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(_OWORD *, _OWORD *);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v20[3];
  _OWORD v21[3];

  v6 = 0;
  v7 = a3 - 2;
  if (a3 < 2)
    v7 = a3 - 1;
  v8 = v7 >> 1;
  do
  {
    v9 = &a1[3 * v6 + 3];
    v10 = (2 * v6) | 1;
    v11 = 2 * v6 + 2;
    if (v11 < a3)
    {
      v12 = *a2;
      v14 = v9[1];
      v13 = v9[2];
      v21[0] = *v9;
      v21[1] = v14;
      v21[2] = v13;
      v15 = v9[3];
      v16 = v9[5];
      v20[1] = v9[4];
      v20[2] = v16;
      v20[0] = v15;
      if (v12(v21, v20))
      {
        v9 += 3;
        v10 = v11;
      }
    }
    v17 = *v9;
    v18 = v9[2];
    a1[1] = v9[1];
    a1[2] = v18;
    *a1 = v17;
    a1 = v9;
    v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t a1, uint64_t a2, unsigned int (**a3)(_QWORD, _QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v9;
  unsigned int (*v10)(_QWORD, _QWORD);
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  double result;
  _OWORD *v15;
  __int128 v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  unsigned int (*v20)(_QWORD, _QWORD);
  __int128 v21;
  char v22;
  __int128 v23;
  _OWORD v24[3];
  _OWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[3];
  _OWORD v30[3];
  uint64_t v31;
  uint64_t v32;

  if (a4 >= 2)
  {
    v31 = v4;
    v32 = v5;
    v9 = (unint64_t)(a4 - 2) >> 1;
    v10 = *a3;
    v11 = (_OWORD *)(a1 + 48 * v9);
    v12 = v11[1];
    v30[0] = *v11;
    v30[1] = v12;
    v30[2] = v11[2];
    v13 = *(_OWORD *)(a2 - 32);
    v29[0] = *(_OWORD *)(a2 - 48);
    v29[1] = v13;
    v29[2] = *(_OWORD *)(a2 - 16);
    if (v10(v30, v29))
    {
      v15 = (_OWORD *)(a2 - 48);
      v16 = *(_OWORD *)(a2 - 32);
      v26 = *(_OWORD *)(a2 - 48);
      v27 = v16;
      v28 = *(_OWORD *)(a2 - 16);
      do
      {
        v17 = v11;
        v18 = *v11;
        v19 = v11[2];
        v15[1] = v11[1];
        v15[2] = v19;
        *v15 = v18;
        if (!v9)
          break;
        v9 = (v9 - 1) >> 1;
        v20 = *a3;
        v11 = (_OWORD *)(a1 + 48 * v9);
        v21 = v11[1];
        v25[0] = *v11;
        v25[1] = v21;
        v25[2] = v11[2];
        v24[0] = v26;
        v24[1] = v27;
        v24[2] = v28;
        v22 = v20(v25, v24);
        v15 = v17;
      }
      while ((v22 & 1) != 0);
      v23 = v27;
      *v17 = v26;
      v17[1] = v23;
      result = *(double *)&v28;
      v17[2] = v28;
    }
  }
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>(__int128 *a1, __int128 *a2, unsigned int (**a3)(_QWORD, _QWORD), uint64_t a4, char a5)
{
  __int128 *v9;
  __int128 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 *v16;
  uint64_t v17;
  __int128 *v18;
  _OWORD *v19;
  __int128 *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  unsigned int (*v27)(_QWORD, _QWORD);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __n128 *v32;
  char v33;
  BOOL v34;
  unsigned int (*v35)(_QWORD, _QWORD);
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[3];
  _OWORD v46[3];
  _OWORD v47[3];
  _OWORD v48[3];
  __int128 v49;
  __int128 v50;
  __int128 v51;

LABEL_1:
  v9 = a2 - 3;
  v10 = a1;
LABEL_2:
  v11 = 1 - a4;
  while (2)
  {
    a1 = v10;
    v12 = v11;
    v13 = (char *)a2 - (char *)v10;
    v14 = 0xAAAAAAAAAAAAAAABLL * (a2 - v10);
    switch(v14)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v35 = *a3;
        v37 = *(a2 - 2);
        v36 = *(a2 - 1);
        v48[0] = *(a2 - 3);
        v48[1] = v37;
        v48[2] = v36;
        v38 = *v10;
        v39 = v10[2];
        v47[1] = v10[1];
        v47[2] = v39;
        v47[0] = v38;
        if (v35(v48, v47))
        {
          v40 = *v10;
          v41 = v10[2];
          v50 = v10[1];
          v51 = v41;
          v49 = v40;
          v42 = *v9;
          v43 = *(a2 - 1);
          v10[1] = *(a2 - 2);
          v10[2] = v43;
          *v10 = v42;
          v44 = v50;
          *v9 = v49;
          *(a2 - 2) = v44;
          *(a2 - 1) = v51;
        }
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v10, v10 + 3, a2 - 3, a3);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__n128 *)v10, (__n128 *)v10 + 3, (__n128 *)v10 + 6, (__n128 *)a2 - 3, a3);
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__n128 *)v10, (__n128 *)v10 + 3, (__n128 *)v10 + 6, (__n128 *)v10 + 9, (__n128 *)a2 - 3, a3);
        return;
      default:
        if (v13 <= 1151)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((uint64_t)v10, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((uint64_t)v10, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
          return;
        }
        if (v12 != 1)
        {
          v15 = v14 >> 1;
          v16 = &v10[3 * (v14 >> 1)];
          if ((unint64_t)v13 < 0x1801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v16, v10, a2 - 3, a3);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v10, v16, a2 - 3, a3);
            v17 = 3 * v15;
            v18 = &v10[3 * v15 - 3];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v10 + 3, v18, a2 - 6, a3);
            v19 = v10 + 6;
            v20 = &v10[v17 + 3];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v19, v20, a2 - 9, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v18, v16, v20, a3);
            v21 = *a1;
            v22 = a1[2];
            v50 = a1[1];
            v51 = v22;
            v49 = v21;
            v23 = *v16;
            v24 = v16[2];
            a1[1] = v16[1];
            a1[2] = v24;
            *a1 = v23;
            v25 = v49;
            v26 = v51;
            v16[1] = v50;
            v16[2] = v26;
            *v16 = v25;
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          v27 = *a3;
          v29 = *(a1 - 2);
          v28 = *(a1 - 1);
          v46[0] = *(a1 - 3);
          v46[1] = v29;
          v46[2] = v28;
          v30 = *a1;
          v31 = a1[2];
          v45[1] = a1[1];
          v45[2] = v31;
          v45[0] = v30;
          if ((((uint64_t (*)(_OWORD *, _OWORD *))v27)(v46, v45) & 1) == 0)
          {
            v10 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,sortQuantizeColorEntry *,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry)>(a1, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
            goto LABEL_16;
          }
LABEL_11:
          v32 = (__n128 *)std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,sortQuantizeColorEntry *,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry)>(a1, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
          if ((v33 & 1) == 0)
            goto LABEL_14;
          v34 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__n128 *)a1, v32, a3);
          v10 = (__int128 *)&v32[3];
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v32 + 3, (__n128 *)a2, a3))
          {
            v11 = v12 + 1;
            if (v34)
              continue;
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>(a1, v32, a3, -v12, a5 & 1);
            v10 = (__int128 *)&v32[3];
LABEL_16:
            a5 = 0;
            a4 = -v12;
            goto LABEL_2;
          }
          a4 = -v12;
          a2 = (__int128 *)v32;
          if (v34)
            return;
          goto LABEL_1;
        }
        if (v10 != a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,sortQuantizeColorEntry*>((uint64_t)v10, a2, a2, a3);
        return;
    }
  }
}

  v9 = a2 - 4;
  v10 = a1;
LABEL_2:
  v11 = 1 - a4;
  while (2)
  {
    a1 = v10;
    v12 = v11;
    v13 = (char *)a2 - (char *)v10;
    v14 = ((char *)a2 - (char *)v10) >> 6;
    switch(v14)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v36 = *a3;
        v37 = *(a2 - 1);
        v39 = *(a2 - 4);
        v38 = *(a2 - 3);
        v54[2] = *(a2 - 2);
        v54[3] = v37;
        v54[0] = v39;
        v54[1] = v38;
        v40 = v10[3];
        v42 = *v10;
        v41 = v10[1];
        v53[2] = v10[2];
        v53[3] = v40;
        v53[0] = v42;
        v53[1] = v41;
        if (v36(v54, v53))
        {
          v43 = *v10;
          v44 = v10[1];
          v45 = v10[3];
          v57 = v10[2];
          v58 = v45;
          v55 = v43;
          v56 = v44;
          v46 = *v9;
          v47 = *(a2 - 3);
          v48 = *(a2 - 1);
          v10[2] = *(a2 - 2);
          v10[3] = v48;
          *v10 = v46;
          v10[1] = v47;
          v49 = v56;
          *v9 = v55;
          *(a2 - 3) = v49;
          v50 = v58;
          *(a2 - 2) = v57;
          *(a2 - 1) = v50;
        }
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v10, v10 + 4, a2 - 4, a3);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)v10, (__n128 *)v10 + 4, (__n128 *)v10 + 8, (__n128 *)a2 - 4, a3);
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)v10, (__n128 *)v10 + 4, (__n128 *)v10 + 8, (__n128 *)v10 + 12, (__n128 *)a2 - 4, a3);
        return;
      default:
        if (v13 <= 1535)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)v10, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)v10, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
          return;
        }
        if (v12 != 1)
        {
          v15 = v14 >> 1;
          v16 = &v10[4 * (v14 >> 1)];
          if ((unint64_t)v13 <= 0x2000)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(&v10[4 * (v14 >> 1)], v10, a2 - 4, a3);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v10, &v10[4 * (v14 >> 1)], a2 - 4, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v10 + 4, v16 - 4, a2 - 8, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v10 + 8, &v10[4 * v15 + 4], a2 - 12, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v16 - 4, v16, &v10[4 * v15 + 4], a3);
            v17 = *v10;
            v18 = v10[1];
            v19 = v10[3];
            v57 = v10[2];
            v58 = v19;
            v55 = v17;
            v56 = v18;
            v20 = *v16;
            v21 = v16[1];
            v22 = v16[3];
            v10[2] = v16[2];
            v10[3] = v22;
            *v10 = v20;
            v10[1] = v21;
            v23 = v55;
            v24 = v56;
            v25 = v58;
            v16[2] = v57;
            v16[3] = v25;
            *v16 = v23;
            v16[1] = v24;
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          v26 = *a3;
          v27 = *(v10 - 1);
          v29 = *(v10 - 4);
          v28 = *(v10 - 3);
          v52[2] = *(v10 - 2);
          v52[3] = v27;
          v52[0] = v29;
          v52[1] = v28;
          v30 = v10[3];
          v32 = *v10;
          v31 = v10[1];
          v51[2] = v10[2];
          v51[3] = v30;
          v51[0] = v32;
          v51[1] = v31;
          if ((((uint64_t (*)(_OWORD *, _OWORD *))v26)(v52, v51) & 1) == 0)
          {
            v10 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,sortColorEntry *,BOOL (*&)(sortColorEntry,sortColorEntry)>(v10, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
            goto LABEL_16;
          }
LABEL_11:
          v33 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,sortColorEntry *,BOOL (*&)(sortColorEntry,sortColorEntry)>(v10, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
          if ((v34 & 1) == 0)
            goto LABEL_14;
          v35 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)v10, (__n128 *)v33, a3);
          v10 = v33 + 4;
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)(v33 + 4), (__n128 *)a2, a3))
          {
            v11 = v12 + 1;
            if (v35)
              continue;
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>(a1, v33, a3, -v12, a5 & 1);
            v10 = v33 + 4;
LABEL_16:
            a5 = 0;
            a4 = -v12;
            goto LABEL_2;
          }
          a4 = -v12;
          a2 = v33;
          if (v35)
            return;
          goto LABEL_1;
        }
        if (v10 != a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,sortColorEntry*>((uint64_t)v10, a2, a2, a3);
        return;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t result, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v3;
  uint64_t v4;
  _OWORD *v6;
  __int128 *v7;
  uint64_t v9;
  __int128 *v10;
  __int128 *v11;
  uint64_t (*v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t (*v20)(_QWORD, _QWORD);
  __int128 v21;
  _OWORD *v22;
  __int128 v23;
  _OWORD v24[3];
  _OWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[3];
  _OWORD v30[3];
  uint64_t v31;
  uint64_t v32;

  if ((__int128 *)result != a2)
  {
    v31 = v3;
    v32 = v4;
    v6 = (_OWORD *)result;
    v7 = (__int128 *)(result + 48);
    if ((__int128 *)(result + 48) != a2)
    {
      v9 = 0;
      v10 = (__int128 *)result;
      do
      {
        v11 = v10;
        v10 = v7;
        v12 = *a3;
        v13 = v10[1];
        v30[0] = *v10;
        v30[1] = v13;
        v30[2] = v10[2];
        v14 = *v11;
        v15 = v11[2];
        v29[1] = v11[1];
        v29[2] = v15;
        v29[0] = v14;
        result = v12(v30, v29);
        if ((_DWORD)result)
        {
          v16 = v10[1];
          v26 = *v10;
          v27 = v16;
          v28 = v10[2];
          v17 = v9;
          while (1)
          {
            v18 = (_OWORD *)((char *)v6 + v17);
            v19 = *(_OWORD *)((char *)v6 + v17 + 16);
            v18[3] = *(_OWORD *)((char *)v6 + v17);
            v18[4] = v19;
            v18[5] = *(_OWORD *)((char *)v6 + v17 + 32);
            if (!v17)
              break;
            v20 = *a3;
            v25[0] = v26;
            v25[1] = v27;
            v25[2] = v28;
            v21 = *(v18 - 2);
            v24[0] = *(v18 - 3);
            v24[1] = v21;
            v24[2] = *(v18 - 1);
            result = v20(v25, v24);
            v17 -= 48;
            if ((result & 1) == 0)
            {
              v22 = (_OWORD *)((char *)v6 + v17 + 48);
              goto LABEL_10;
            }
          }
          v22 = v6;
LABEL_10:
          v23 = v27;
          *v22 = v26;
          v22[1] = v23;
          v22[2] = v28;
        }
        v7 = v10 + 3;
        v9 += 48;
      }
      while (v10 + 3 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t result, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v3;
  uint64_t v4;
  __int128 *v6;
  __int128 *i;
  __int128 *v9;
  uint64_t (*v10)(_QWORD, _QWORD);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 *v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t (*v20)(_QWORD, _QWORD);
  __int128 v21;
  __int128 v22;
  _OWORD v23[3];
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[3];
  _OWORD v29[3];
  uint64_t v30;
  uint64_t v31;

  if ((__int128 *)result != a2)
  {
    v30 = v3;
    v31 = v4;
    v6 = (__int128 *)result;
    for (i = (__int128 *)(result + 48); v6 + 3 != a2; i = v6 + 3)
    {
      v9 = v6;
      v6 = i;
      v10 = *a3;
      v11 = v6[1];
      v29[0] = *v6;
      v29[1] = v11;
      v29[2] = v6[2];
      v12 = *v9;
      v13 = v9[2];
      v28[1] = v9[1];
      v28[2] = v13;
      v28[0] = v12;
      result = v10(v29, v28);
      if ((_DWORD)result)
      {
        v14 = v6[1];
        v25 = *v6;
        v26 = v14;
        v27 = v6[2];
        v15 = v6;
        do
        {
          v16 = v15 - 3;
          v17 = *(v15 - 2);
          v18 = *(v15 - 1);
          v19 = *(v15 - 4);
          *v15 = *(v15 - 3);
          v15[1] = v17;
          v15[2] = v18;
          v20 = *a3;
          v24[0] = v25;
          v24[1] = v26;
          v24[2] = v27;
          v21 = *(v15 - 6);
          v23[1] = *(v15 - 5);
          v23[2] = v19;
          v23[0] = v21;
          result = v20(v24, v23);
          v15 = v16;
        }
        while ((result & 1) != 0);
        v22 = v26;
        *v16 = v25;
        v16[1] = v22;
        v16[2] = v27;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(_OWORD *a1, _OWORD *a2, _OWORD *a3, unsigned int (**a4)(_QWORD, _QWORD))
{
  unsigned int (*v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 v10;
  char v11;
  unsigned int (*v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t result;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  unsigned int (*v28)(_QWORD, _QWORD);
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  unsigned int (*v43)(_QWORD, _QWORD);
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[3];
  _OWORD v52[3];
  _OWORD v53[3];
  _OWORD v54[3];
  _OWORD v55[3];
  _OWORD v56[3];
  _OWORD v57[3];
  _OWORD v58[3];
  _OWORD v59[3];
  _OWORD v60[18];

  v8 = *a4;
  v9 = a2[1];
  v60[0] = *a2;
  v60[1] = v9;
  v60[2] = a2[2];
  v10 = a1[1];
  v59[0] = *a1;
  v59[1] = v10;
  v59[2] = a1[2];
  v11 = v8(v60, v59);
  v12 = *a4;
  if ((v11 & 1) != 0)
  {
    v13 = a3[1];
    v54[0] = *a3;
    v54[1] = v13;
    v54[2] = a3[2];
    v14 = a2[1];
    v53[0] = *a2;
    v53[1] = v14;
    v53[2] = a2[2];
    if (v12(v54, v53))
    {
      v15 = *a1;
      v16 = a1[1];
      v17 = a1[2];
      v19 = a3[1];
      v18 = a3[2];
      *a1 = *a3;
      a1[1] = v19;
      a1[2] = v18;
      a3[2] = v17;
      result = 1;
LABEL_9:
      *a3 = v15;
      a3[1] = v16;
      return result;
    }
    v38 = *a1;
    v39 = a1[1];
    v40 = a1[2];
    v42 = a2[1];
    v41 = a2[2];
    *a1 = *a2;
    a1[1] = v42;
    a1[2] = v41;
    a2[1] = v39;
    a2[2] = v40;
    *a2 = v38;
    v43 = *a4;
    v44 = *a3;
    v45 = a3[2];
    v52[1] = a3[1];
    v52[2] = v45;
    v46 = *a2;
    v47 = a2[1];
    v51[2] = a2[2];
    v52[0] = v44;
    v51[0] = v46;
    v51[1] = v47;
    if (v43(v52, v51))
    {
      v15 = *a2;
      v16 = a2[1];
      v48 = a2[2];
      v50 = a3[1];
      v49 = a3[2];
      *a2 = *a3;
      a2[1] = v50;
      a2[2] = v49;
      a3[2] = v48;
      result = 2;
      goto LABEL_9;
    }
  }
  else
  {
    v21 = a3[1];
    v58[0] = *a3;
    v58[1] = v21;
    v58[2] = a3[2];
    v22 = a2[1];
    v57[0] = *a2;
    v57[1] = v22;
    v57[2] = a2[2];
    result = ((uint64_t (*)(_OWORD *, _OWORD *))v12)(v58, v57);
    if (!(_DWORD)result)
      return result;
    v23 = *a2;
    v24 = a2[1];
    v25 = a2[2];
    v27 = a3[1];
    v26 = a3[2];
    *a2 = *a3;
    a2[1] = v27;
    a2[2] = v26;
    a3[1] = v24;
    a3[2] = v25;
    *a3 = v23;
    v28 = *a4;
    v29 = *a2;
    v30 = a2[2];
    v56[1] = a2[1];
    v56[2] = v30;
    v31 = *a1;
    v32 = a1[1];
    v55[2] = a1[2];
    v56[0] = v29;
    v55[0] = v31;
    v55[1] = v32;
    if (v28(v56, v55))
    {
      v33 = *a1;
      v34 = a1[1];
      v35 = a1[2];
      v37 = a2[1];
      v36 = a2[2];
      *a1 = *a2;
      a1[1] = v37;
      a1[2] = v36;
      a2[1] = v34;
      a2[2] = v35;
      result = 2;
      *a2 = v33;
      return result;
    }
  }
  return 1;
}

__int128 *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,sortQuantizeColorEntry *,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry)>(__int128 *a1, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  __int128 *v4;
  __int128 v6;
  uint64_t (*v7)(_QWORD, _QWORD);
  __int128 v8;
  __int128 *v9;
  __int128 *v10;
  uint64_t (*v11)(_QWORD, _QWORD);
  __int128 v12;
  char v13;
  __int128 *v14;
  uint64_t (*v15)(_QWORD, _QWORD);
  __int128 v16;
  int v17;
  __int128 *v18;
  uint64_t (*v19)(_QWORD, _QWORD);
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unsigned int (*v30)(_QWORD, _QWORD);
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t (*v34)(_QWORD, _QWORD);
  __int128 *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v41[3];
  _OWORD v42[3];
  _OWORD v43[3];
  _OWORD v44[3];
  _OWORD v45[3];
  _OWORD v46[3];
  _OWORD v47[3];
  _OWORD v48[3];
  _OWORD v49[3];
  _OWORD v50[3];
  _OWORD v51[3];
  _OWORD v52[3];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;

  v4 = a2;
  v6 = a1[1];
  v53 = *a1;
  v54 = v6;
  v55 = a1[2];
  v7 = *a3;
  v52[0] = v53;
  v52[1] = v6;
  v52[2] = v55;
  v8 = *(a2 - 2);
  v51[0] = *(a2 - 3);
  v51[1] = v8;
  v51[2] = *(a2 - 1);
  if ((v7(v52, v51) & 1) != 0)
  {
    v9 = a1;
    do
    {
      v10 = v9 + 3;
      v11 = *a3;
      v50[0] = v53;
      v50[1] = v54;
      v50[2] = v55;
      v12 = v9[4];
      v49[0] = v9[3];
      v49[1] = v12;
      v49[2] = v9[5];
      v13 = v11(v50, v49);
      v9 = v10;
    }
    while ((v13 & 1) == 0);
  }
  else
  {
    v14 = a1 + 3;
    do
    {
      v10 = v14;
      if (v14 >= v4)
        break;
      v15 = *a3;
      v48[0] = v53;
      v48[1] = v54;
      v48[2] = v55;
      v16 = v10[1];
      v47[0] = *v10;
      v47[1] = v16;
      v47[2] = v10[2];
      v17 = v15(v48, v47);
      v14 = v10 + 3;
    }
    while (!v17);
  }
  if (v10 >= v4)
  {
    v18 = v4;
  }
  else
  {
    do
    {
      v18 = v4 - 3;
      v19 = *a3;
      v46[0] = v53;
      v46[1] = v54;
      v46[2] = v55;
      v20 = *(v4 - 2);
      v45[0] = *(v4 - 3);
      v45[1] = v20;
      v45[2] = *(v4 - 1);
      v4 -= 3;
    }
    while ((v19(v46, v45) & 1) != 0);
  }
  while (v10 < v18)
  {
    v21 = *v10;
    v22 = v10[2];
    v57 = v10[1];
    v58 = v22;
    v56 = v21;
    v23 = *v18;
    v24 = v18[2];
    v10[1] = v18[1];
    v10[2] = v24;
    *v10 = v23;
    v25 = v56;
    v26 = v58;
    v18[1] = v57;
    v18[2] = v26;
    *v18 = v25;
    do
    {
      v44[0] = v53;
      v44[1] = v54;
      v44[2] = v55;
      v28 = v10[3];
      v27 = v10[4];
      v29 = v10[5];
      v10 += 3;
      v30 = (unsigned int (*)(_QWORD, _QWORD))*a3;
      v43[1] = v27;
      v43[2] = v29;
      v43[0] = v28;
    }
    while (!v30(v44, v43));
    do
    {
      v42[0] = v53;
      v42[1] = v54;
      v42[2] = v55;
      v32 = *(v18 - 3);
      v31 = *(v18 - 2);
      v33 = *(v18 - 1);
      v18 -= 3;
      v34 = *a3;
      v41[1] = v31;
      v41[2] = v33;
      v41[0] = v32;
    }
    while ((v34(v42, v41) & 1) != 0);
  }
  v35 = v10 - 3;
  if (v10 - 3 != a1)
  {
    v36 = *v35;
    v37 = *(v10 - 1);
    a1[1] = *(v10 - 2);
    a1[2] = v37;
    *a1 = v36;
  }
  v38 = v53;
  v39 = v55;
  *(v10 - 2) = v54;
  *(v10 - 1) = v39;
  *v35 = v38;
  return v10;
}

__int128 *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,sortQuantizeColorEntry *,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry)>(__int128 *a1, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  __int128 v7;
  uint64_t (*v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 *v10;
  __int128 *v11;
  __int128 *v12;
  unsigned int (*v13)(_QWORD, _QWORD);
  __int128 v14;
  uint64_t (*v15)(_QWORD, _QWORD);
  __int128 v16;
  __int128 *v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t (*v27)(_QWORD, _QWORD);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unsigned int (*v31)(_QWORD, _QWORD);
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v37[3];
  _OWORD v38[3];
  _OWORD v39[3];
  _OWORD v40[3];
  _OWORD v41[3];
  _OWORD v42[3];
  _OWORD v43[3];
  _OWORD v44[3];
  _OWORD v45[3];
  _OWORD v46[3];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;

  v6 = 0;
  v7 = a1[1];
  v47 = *a1;
  v48 = v7;
  v49 = a1[2];
  do
  {
    v8 = *a3;
    v9 = a1[v6 + 4];
    v46[0] = a1[v6 + 3];
    v46[1] = v9;
    v46[2] = a1[v6 + 5];
    v45[0] = v47;
    v45[1] = v48;
    v45[2] = v49;
    v6 += 3;
  }
  while ((v8(v46, v45) & 1) != 0);
  v10 = &a1[v6];
  v11 = &a1[v6 - 3];
  if (v6 == 3)
  {
    while (v10 < a2)
    {
      v15 = *a3;
      v12 = a2 - 3;
      v16 = *(a2 - 2);
      v44[0] = *(a2 - 3);
      v44[1] = v16;
      v44[2] = *(a2 - 1);
      v43[0] = v47;
      v43[1] = v48;
      v43[2] = v49;
      a2 -= 3;
      if ((v15(v44, v43) & 1) != 0)
        goto LABEL_9;
    }
    v12 = a2;
  }
  else
  {
    do
    {
      v12 = a2 - 3;
      v13 = (unsigned int (*)(_QWORD, _QWORD))*a3;
      v14 = *(a2 - 2);
      v42[0] = *(a2 - 3);
      v42[1] = v14;
      v42[2] = *(a2 - 1);
      v41[0] = v47;
      v41[1] = v48;
      v41[2] = v49;
      a2 -= 3;
    }
    while (!v13(v42, v41));
  }
LABEL_9:
  if (v10 < v12)
  {
    v17 = v10;
    v18 = v12;
    do
    {
      v20 = v17[1];
      v50 = *v17;
      v19 = v50;
      v51 = v20;
      v52 = v17[2];
      v21 = v52;
      v22 = *v18;
      v23 = v18[2];
      v17[1] = v18[1];
      v17[2] = v23;
      *v17 = v22;
      v18[1] = v20;
      v18[2] = v21;
      *v18 = v19;
      do
      {
        v25 = v17[4];
        v24 = v17[5];
        v26 = v17[3];
        v17 += 3;
        v27 = *a3;
        v40[0] = v26;
        v40[1] = v25;
        v40[2] = v24;
        v39[1] = v48;
        v39[2] = v49;
        v39[0] = v47;
      }
      while ((v27(v40, v39) & 1) != 0);
      do
      {
        v29 = *(v18 - 2);
        v28 = *(v18 - 1);
        v30 = *(v18 - 3);
        v18 -= 3;
        v31 = (unsigned int (*)(_QWORD, _QWORD))*a3;
        v38[0] = v30;
        v38[1] = v29;
        v38[2] = v28;
        v37[1] = v48;
        v37[2] = v49;
        v37[0] = v47;
      }
      while (!v31(v38, v37));
    }
    while (v17 < v18);
    v11 = v17 - 3;
  }
  if (v11 != a1)
  {
    v32 = *v11;
    v33 = v11[2];
    a1[1] = v11[1];
    a1[2] = v33;
    *a1 = v32;
  }
  v34 = v47;
  v35 = v49;
  v11[1] = v48;
  v11[2] = v35;
  *v11 = v34;
  return v11;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(__n128 *a1, __n128 *a2, unsigned int (**a3)(_QWORD, _QWORD))
{
  unint64_t v6;
  _BOOL8 result;
  unsigned int (*v8)(_QWORD, _QWORD);
  __n128 v9;
  __n128 v10;
  __n128 *v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 *v17;
  __n128 *v18;
  uint64_t v19;
  int v20;
  unsigned int (*v21)(_QWORD, _QWORD);
  __n128 v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  uint64_t v26;
  _OWORD *v27;
  __int128 v28;
  unsigned int (*v29)(_QWORD, _QWORD);
  __int128 v30;
  __n128 *v31;
  __n128 v32;
  _OWORD v33[3];
  _OWORD v34[3];
  __n128 v35;
  __n128 v36;
  __n128 v37;
  _OWORD v38[3];
  _OWORD v39[3];
  _OWORD v40[3];
  _OWORD v41[6];

  v6 = 0xAAAAAAAAAAAAAAABLL * (a2 - a1);
  result = 1;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v8 = *a3;
      v9 = a2[-2];
      v41[0] = a2[-3];
      v41[1] = v9;
      v41[2] = a2[-1];
      v10 = a1[1];
      v40[0] = *a1;
      v40[1] = v10;
      v40[2] = a1[2];
      if (v8(v41, v40))
      {
        v11 = a2 - 3;
        v12 = *a1;
        v13 = a1[1];
        v14 = a1[2];
        v16 = a2[-2];
        v15 = a2[-1];
        *a1 = a2[-3];
        a1[1] = v16;
        a1[2] = v15;
        v11[1] = v13;
        v11[2] = v14;
        *v11 = v12;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, (__n128 *)a1[3].n128_u64, (__n128 *)a2[-3].n128_u64, a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 3, a1 + 6, a2 - 3, a3);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 3, a1 + 6, a1 + 9, a2 - 3, a3);
      return 1;
    default:
      v17 = a1 + 6;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, (__n128 *)a1[3].n128_u64, (__n128 *)a1[6].n128_u64, a3);
      v18 = a1 + 9;
      if (&a1[9] == a2)
        return 1;
      v19 = 0;
      v20 = 0;
      break;
  }
  while (1)
  {
    v21 = *a3;
    v22 = v18[1];
    v39[0] = *v18;
    v39[1] = v22;
    v39[2] = v18[2];
    v23 = *v17;
    v24 = v17[2];
    v38[1] = v17[1];
    v38[2] = v24;
    v38[0] = v23;
    if (v21(v39, v38))
    {
      v25 = v18[1];
      v35 = *v18;
      v36 = v25;
      v37 = v18[2];
      v26 = v19;
      while (1)
      {
        v27 = (_OWORD *)((char *)a1->n128_u64 + v26);
        v28 = *(__int128 *)((char *)&a1[7] + v26);
        v27[9] = *(__n128 *)((char *)&a1[6] + v26);
        v27[10] = v28;
        v27[11] = *(__n128 *)((char *)&a1[8] + v26);
        if (v26 == -96)
          break;
        v29 = *a3;
        v34[0] = v35;
        v34[1] = v36;
        v34[2] = v37;
        v30 = v27[4];
        v33[0] = v27[3];
        v33[1] = v30;
        v33[2] = v27[5];
        v26 -= 48;
        if ((((uint64_t (*)(_OWORD *, _OWORD *))v29)(v34, v33) & 1) == 0)
        {
          v31 = (__n128 *)((char *)a1 + v26 + 144);
          goto LABEL_12;
        }
      }
      v31 = a1;
LABEL_12:
      v32 = v36;
      *v31 = v35;
      v31[1] = v32;
      v31[2] = v37;
      if (++v20 == 8)
        return &v18[3] == a2;
    }
    v17 = v18;
    v19 += 48;
    v18 += 3;
    if (v18 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, unsigned int (**a5)(_QWORD, _QWORD))
{
  unsigned int (*v10)(_QWORD, _QWORD);
  __n128 v11;
  __n128 v12;
  __n128 result;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  unsigned int (*v19)(_QWORD, _QWORD);
  __n128 v20;
  __n128 v21;
  __n128 v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  __n128 v28;
  unsigned int (*v29)(_QWORD, _QWORD);
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;
  _OWORD v38[3];
  _OWORD v39[3];
  _OWORD v40[3];
  _OWORD v41[3];
  _OWORD v42[3];
  _OWORD v43[12];

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a2, a3, a5);
  v10 = *a5;
  v11 = a4[1];
  v43[0] = *a4;
  v43[1] = v11;
  v43[2] = a4[2];
  v12 = a3[1];
  v42[0] = *a3;
  v42[1] = v12;
  v42[2] = a3[2];
  if (v10(v43, v42))
  {
    v14 = *a3;
    v15 = a3[1];
    v16 = a3[2];
    v18 = a4[1];
    v17 = a4[2];
    *a3 = *a4;
    a3[1] = v18;
    a3[2] = v17;
    a4[1] = v15;
    a4[2] = v16;
    *a4 = v14;
    v19 = *a5;
    v20 = *a3;
    v21 = a3[2];
    v41[1] = a3[1];
    v41[2] = v21;
    v22 = *a2;
    v23 = a2[1];
    v40[2] = a2[2];
    v41[0] = v20;
    v40[0] = v22;
    v40[1] = v23;
    if (v19(v41, v40))
    {
      v24 = *a2;
      v25 = a2[1];
      v26 = a2[2];
      v28 = a3[1];
      v27 = a3[2];
      *a2 = *a3;
      a2[1] = v28;
      a2[2] = v27;
      a3[1] = v25;
      a3[2] = v26;
      *a3 = v24;
      v29 = *a5;
      v30 = *a2;
      v31 = a2[2];
      v39[1] = a2[1];
      v39[2] = v31;
      v32 = *a1;
      v33 = a1[1];
      v38[2] = a1[2];
      v39[0] = v30;
      v38[0] = v32;
      v38[1] = v33;
      if (v29(v39, v38))
      {
        result = *a1;
        v34 = a1[1];
        v35 = a1[2];
        v37 = a2[1];
        v36 = a2[2];
        *a1 = *a2;
        a1[1] = v37;
        a1[2] = v36;
        a2[1] = v34;
        a2[2] = v35;
        *a2 = result;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5, unsigned int (**a6)(_QWORD, _QWORD))
{
  unsigned int (*v12)(_QWORD, _QWORD);
  __n128 v13;
  __n128 v14;
  __n128 result;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  unsigned int (*v21)(_QWORD, _QWORD);
  __n128 v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  unsigned int (*v31)(_QWORD, _QWORD);
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  __n128 v39;
  __n128 v40;
  unsigned int (*v41)(_QWORD, _QWORD);
  __n128 v42;
  __n128 v43;
  __n128 v44;
  __int128 v45;
  __n128 v46;
  __n128 v47;
  __n128 v48;
  __n128 v49;
  _OWORD v50[3];
  _OWORD v51[3];
  _OWORD v52[3];
  _OWORD v53[3];
  _OWORD v54[3];
  _OWORD v55[3];
  _OWORD v56[3];
  _OWORD v57[15];

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__n128 *)a1, a2, a3, a4, a6);
  v12 = *a6;
  v13 = a5[1];
  v57[0] = *a5;
  v57[1] = v13;
  v57[2] = a5[2];
  v14 = a4[1];
  v56[0] = *a4;
  v56[1] = v14;
  v56[2] = a4[2];
  if (v12(v57, v56))
  {
    v16 = *a4;
    v17 = a4[1];
    v18 = a4[2];
    v20 = a5[1];
    v19 = a5[2];
    *a4 = *a5;
    a4[1] = v20;
    a4[2] = v19;
    a5[1] = v17;
    a5[2] = v18;
    *a5 = v16;
    v21 = *a6;
    v22 = *a4;
    v23 = a4[2];
    v55[1] = a4[1];
    v55[2] = v23;
    v24 = *a3;
    v25 = a3[1];
    v54[2] = a3[2];
    v55[0] = v22;
    v54[0] = v24;
    v54[1] = v25;
    if (v21(v55, v54))
    {
      v26 = *a3;
      v27 = a3[1];
      v28 = a3[2];
      v30 = a4[1];
      v29 = a4[2];
      *a3 = *a4;
      a3[1] = v30;
      a3[2] = v29;
      a4[1] = v27;
      a4[2] = v28;
      *a4 = v26;
      v31 = *a6;
      v32 = *a3;
      v33 = a3[2];
      v53[1] = a3[1];
      v53[2] = v33;
      v34 = *a2;
      v35 = a2[1];
      v52[2] = a2[2];
      v53[0] = v32;
      v52[0] = v34;
      v52[1] = v35;
      if (v31(v53, v52))
      {
        v36 = *a2;
        v37 = a2[1];
        v38 = a2[2];
        v40 = a3[1];
        v39 = a3[2];
        *a2 = *a3;
        a2[1] = v40;
        a2[2] = v39;
        a3[1] = v37;
        a3[2] = v38;
        *a3 = v36;
        v41 = *a6;
        v42 = *a2;
        v43 = a2[2];
        v51[1] = a2[1];
        v51[2] = v43;
        v44 = *(__n128 *)a1;
        v45 = *(_OWORD *)(a1 + 16);
        v50[2] = *(_OWORD *)(a1 + 32);
        v51[0] = v42;
        v50[0] = v44;
        v50[1] = v45;
        if (v41(v51, v50))
        {
          result = *(__n128 *)a1;
          v46 = *(__n128 *)(a1 + 16);
          v47 = *(__n128 *)(a1 + 32);
          v49 = a2[1];
          v48 = a2[2];
          *(__n128 *)a1 = *a2;
          *(__n128 *)(a1 + 16) = v49;
          *(__n128 *)(a1 + 32) = v48;
          a2[1] = v46;
          a2[2] = v47;
          *a2 = result;
        }
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<sortColorEntry>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(a2 << 6);
}

_OWORD *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,sortColorEntry*>(uint64_t a1, _OWORD *a2, _OWORD *a3, unsigned int (**a4)(_QWORD, _QWORD))
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __n128 *v12;
  _OWORD *v13;
  _OWORD *v14;
  unsigned int (*v15)(_OWORD *, _OWORD *);
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
  uint64_t v27;
  __n128 *v28;
  __n128 v29;
  __n128 v30;
  __n128 *v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  _OWORD v41[4];
  _OWORD v42[8];
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;

  if ((_OWORD *)a1 != a2)
  {
    v8 = (uint64_t)a2 - a1;
    v9 = ((uint64_t)a2 - a1) >> 6;
    if ((uint64_t)a2 - a1 >= 65)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (__n128 *)(a1 + (v10 << 6));
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, a4, v9, v12);
        v12 -= 4;
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = (unsigned int (*)(_OWORD *, _OWORD *))*a4;
        v16 = v14[1];
        v42[0] = *v14;
        v42[1] = v16;
        v17 = v14[3];
        v42[2] = v14[2];
        v42[3] = v17;
        v18 = *(_OWORD *)(a1 + 16);
        v41[0] = *(_OWORD *)a1;
        v41[1] = v18;
        v19 = *(_OWORD *)(a1 + 48);
        v41[2] = *(_OWORD *)(a1 + 32);
        v41[3] = v19;
        if (v15(v42, v41))
        {
          v21 = v14[2];
          v20 = v14[3];
          v23 = *v14;
          v22 = v14[1];
          v24 = *(_OWORD *)(a1 + 48);
          v26 = *(_OWORD *)a1;
          v25 = *(_OWORD *)(a1 + 16);
          v14[2] = *(_OWORD *)(a1 + 32);
          v14[3] = v24;
          *v14 = v26;
          v14[1] = v25;
          *(_OWORD *)a1 = v23;
          *(_OWORD *)(a1 + 16) = v22;
          *(_OWORD *)(a1 + 32) = v21;
          *(_OWORD *)(a1 + 48) = v20;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, a4, v9, (__n128 *)a1);
        }
        v14 += 4;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 65)
    {
      v27 = (unint64_t)v8 >> 6;
      v28 = (__n128 *)(a2 - 4);
      do
      {
        v29 = *(__n128 *)(a1 + 16);
        v43 = *(__n128 *)a1;
        v44 = v29;
        v30 = *(__n128 *)(a1 + 48);
        v45 = *(__n128 *)(a1 + 32);
        v46 = v30;
        v31 = (__n128 *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (unsigned int (**)(_OWORD *, _OWORD *))a4, v27);
        if (v28 == v31)
        {
          v37 = v44;
          *v31 = v43;
          v31[1] = v37;
          v38 = v46;
          v31[2] = v45;
          v31[3] = v38;
        }
        else
        {
          v32 = *v28;
          v33 = v28[1];
          v34 = v28[3];
          v31[2] = v28[2];
          v31[3] = v34;
          *v31 = v32;
          v31[1] = v33;
          v35 = v44;
          *v28 = v43;
          v28[1] = v35;
          v36 = v46;
          v28[2] = v45;
          v28[3] = v36;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, (uint64_t)&v31[4], a4, ((uint64_t)&v31[4] - a1) >> 6);
        }
        v28 -= 4;
      }
      while (v27-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, unsigned int (**a2)(_QWORD, _QWORD), uint64_t a3, __n128 *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __n128 *v7;
  int64_t v9;
  uint64_t v12;
  uint64_t v13;
  __n128 *v14;
  uint64_t v15;
  unsigned int (*v16)(_QWORD, _QWORD);
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  unsigned int (*v21)(_QWORD, _QWORD);
  __n128 v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  __n128 result;
  __n128 v27;
  __n128 v28;
  __n128 *v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  uint64_t v33;
  unsigned int (*v34)(_QWORD, _QWORD);
  __n128 v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  unsigned int (*v39)(_QWORD, _QWORD);
  __n128 v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  _OWORD v44[4];
  _OWORD v45[4];
  _OWORD v46[4];
  _OWORD v47[4];
  __n128 v48;
  __n128 v49;
  __n128 v50;
  __n128 v51;
  _OWORD v52[4];
  _OWORD v53[4];
  _OWORD v54[4];
  _OWORD v55[4];
  uint64_t v56;
  uint64_t v57;

  v6 = a3 - 2;
  if (a3 >= 2)
  {
    v56 = v4;
    v57 = v5;
    v7 = a4;
    v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= ((uint64_t)a4 - a1) >> 6)
    {
      v12 = ((uint64_t)a4 - a1) >> 5;
      v13 = v12 + 1;
      v14 = (__n128 *)(a1 + ((v12 + 1) << 6));
      v15 = v12 + 2;
      if (v12 + 2 < a3)
      {
        v16 = *a2;
        v17 = v14[1];
        v55[0] = *v14;
        v55[1] = v17;
        v18 = v14[3];
        v55[2] = v14[2];
        v55[3] = v18;
        v19 = v14[5];
        v54[0] = v14[4];
        v54[1] = v19;
        v20 = v14[7];
        v54[2] = v14[6];
        v54[3] = v20;
        if (v16(v55, v54))
        {
          v14 += 4;
          v13 = v15;
        }
      }
      v21 = *a2;
      v22 = v14[1];
      v53[0] = *v14;
      v53[1] = v22;
      v23 = v14[3];
      v53[2] = v14[2];
      v53[3] = v23;
      v24 = v7[1];
      v52[0] = *v7;
      v52[1] = v24;
      v25 = v7[3];
      v52[2] = v7[2];
      v52[3] = v25;
      if ((((uint64_t (*)(_OWORD *, _OWORD *))v21)(v53, v52) & 1) == 0)
      {
        v27 = v7[1];
        v48 = *v7;
        v49 = v27;
        v28 = v7[3];
        v50 = v7[2];
        v51 = v28;
        do
        {
          v29 = v14;
          v30 = *v14;
          v31 = v14[1];
          v32 = v14[3];
          v7[2] = v14[2];
          v7[3] = v32;
          *v7 = v30;
          v7[1] = v31;
          if (v9 < v13)
            break;
          v33 = (2 * v13) | 1;
          v14 = (__n128 *)(a1 + (v33 << 6));
          if (2 * v13 + 2 < a3)
          {
            v34 = *a2;
            v35 = v14[1];
            v47[0] = *v14;
            v47[1] = v35;
            v36 = v14[3];
            v47[2] = v14[2];
            v47[3] = v36;
            v37 = v14[5];
            v46[0] = v14[4];
            v46[1] = v37;
            v38 = v14[7];
            v46[2] = v14[6];
            v46[3] = v38;
            if (v34(v47, v46))
            {
              v14 += 4;
              v33 = 2 * v13 + 2;
            }
          }
          v39 = *a2;
          v40 = v14[1];
          v45[0] = *v14;
          v45[1] = v40;
          v41 = v14[3];
          v45[2] = v14[2];
          v45[3] = v41;
          v44[0] = v48;
          v44[1] = v49;
          v44[2] = v50;
          v44[3] = v51;
          v7 = v29;
          v13 = v33;
        }
        while (!v39(v45, v44));
        result = v48;
        v42 = v49;
        v43 = v51;
        v29[2] = v50;
        v29[3] = v43;
        *v29 = result;
        v29[1] = v42;
      }
    }
  }
  return result;
}

_OWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(_OWORD *a1, unsigned int (**a2)(_OWORD *, _OWORD *), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(_OWORD *, _OWORD *);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v23[4];
  _OWORD v24[4];

  v6 = 0;
  v7 = a3 - 2;
  if (a3 < 2)
    v7 = a3 - 1;
  v8 = v7 >> 1;
  do
  {
    v9 = &a1[4 * v6 + 4];
    v10 = (2 * v6) | 1;
    v11 = 2 * v6 + 2;
    if (v11 < a3)
    {
      v12 = *a2;
      v13 = v9[3];
      v15 = *v9;
      v14 = v9[1];
      v24[2] = v9[2];
      v24[3] = v13;
      v24[0] = v15;
      v24[1] = v14;
      v16 = v9[7];
      v18 = v9[4];
      v17 = v9[5];
      v23[2] = v9[6];
      v23[3] = v16;
      v23[0] = v18;
      v23[1] = v17;
      if (v12(v24, v23))
      {
        v9 += 4;
        v10 = v11;
      }
    }
    v19 = *v9;
    v20 = v9[1];
    v21 = v9[3];
    a1[2] = v9[2];
    a1[3] = v21;
    *a1 = v19;
    a1[1] = v20;
    a1 = v9;
    v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, uint64_t a2, unsigned int (**a3)(_QWORD, _QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int (*v10)(_QWORD, _QWORD);
  unint64_t v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double result;
  _OWORD *v18;
  __int128 v19;
  __int128 v20;
  _OWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  unsigned int (*v25)(_QWORD, _QWORD);
  __int128 v26;
  __int128 v27;
  char v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[4];
  _OWORD v32[4];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[4];
  _OWORD v38[4];
  uint64_t v39;
  uint64_t v40;

  v6 = a4 - 2;
  if (a4 >= 2)
  {
    v39 = v4;
    v40 = v5;
    v10 = *a3;
    v11 = v6 >> 1;
    v12 = (_OWORD *)(a1 + (v6 >> 1 << 6));
    v13 = v12[1];
    v38[0] = *v12;
    v38[1] = v13;
    v14 = v12[3];
    v38[2] = v12[2];
    v38[3] = v14;
    v15 = *(_OWORD *)(a2 - 48);
    v37[0] = *(_OWORD *)(a2 - 64);
    v37[1] = v15;
    v16 = *(_OWORD *)(a2 - 16);
    v37[2] = *(_OWORD *)(a2 - 32);
    v37[3] = v16;
    if (v10(v38, v37))
    {
      v18 = (_OWORD *)(a2 - 64);
      v19 = *(_OWORD *)(a2 - 48);
      v33 = *(_OWORD *)(a2 - 64);
      v34 = v19;
      v20 = *(_OWORD *)(a2 - 16);
      v35 = *(_OWORD *)(a2 - 32);
      v36 = v20;
      do
      {
        v21 = v12;
        v22 = *v12;
        v23 = v12[1];
        v24 = v12[3];
        v18[2] = v12[2];
        v18[3] = v24;
        *v18 = v22;
        v18[1] = v23;
        if (!v11)
          break;
        v25 = *a3;
        v11 = (v11 - 1) >> 1;
        v12 = (_OWORD *)(a1 + (v11 << 6));
        v26 = v12[1];
        v32[0] = *v12;
        v32[1] = v26;
        v27 = v12[3];
        v32[2] = v12[2];
        v32[3] = v27;
        v31[0] = v33;
        v31[1] = v34;
        v31[2] = v35;
        v31[3] = v36;
        v28 = v25(v32, v31);
        v18 = v21;
      }
      while ((v28 & 1) != 0);
      v29 = v34;
      *v21 = v33;
      v21[1] = v29;
      result = *(double *)&v35;
      v30 = v36;
      v21[2] = v35;
      v21[3] = v30;
    }
  }
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>(__int128 *a1, __int128 *a2, unsigned int (**a3)(_QWORD, _QWORD), uint64_t a4, char a5)
{
  __int128 *v9;
  __int128 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unsigned int (*v26)(_QWORD, _QWORD);
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 *v33;
  char v34;
  BOOL v35;
  unsigned int (*v36)(_QWORD, _QWORD);
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[4];
  _OWORD v52[4];
  _OWORD v53[4];
  _OWORD v54[4];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t result, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v3;
  uint64_t v4;
  _OWORD *v6;
  __int128 *v7;
  uint64_t v9;
  __int128 *v10;
  __int128 *v11;
  uint64_t (*v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _OWORD *v21;
  __int128 v22;
  __int128 v23;
  uint64_t (*v24)(_QWORD, _QWORD);
  __int128 v25;
  __int128 v26;
  _OWORD *v27;
  __int128 v28;
  __int128 v29;
  _OWORD v30[4];
  _OWORD v31[4];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[4];
  _OWORD v37[4];
  uint64_t v38;
  uint64_t v39;

  if ((__int128 *)result != a2)
  {
    v38 = v3;
    v39 = v4;
    v6 = (_OWORD *)result;
    v7 = (__int128 *)(result + 64);
    if ((__int128 *)(result + 64) != a2)
    {
      v9 = 0;
      v10 = (__int128 *)result;
      do
      {
        v11 = v10;
        v10 = v7;
        v12 = *a3;
        v13 = v10[1];
        v37[0] = *v10;
        v37[1] = v13;
        v14 = v10[3];
        v37[2] = v10[2];
        v37[3] = v14;
        v15 = v11[3];
        v17 = *v11;
        v16 = v11[1];
        v36[2] = v11[2];
        v36[3] = v15;
        v36[0] = v17;
        v36[1] = v16;
        result = v12(v37, v36);
        if ((_DWORD)result)
        {
          v18 = v10[1];
          v32 = *v10;
          v33 = v18;
          v19 = v10[3];
          v34 = v10[2];
          v35 = v19;
          v20 = v9;
          while (1)
          {
            v21 = (_OWORD *)((char *)v6 + v20);
            v22 = *(_OWORD *)((char *)v6 + v20 + 16);
            v21[4] = *(_OWORD *)((char *)v6 + v20);
            v21[5] = v22;
            v23 = *(_OWORD *)((char *)v6 + v20 + 48);
            v21[6] = *(_OWORD *)((char *)v6 + v20 + 32);
            v21[7] = v23;
            if (!v20)
              break;
            v24 = *a3;
            v31[0] = v32;
            v31[1] = v33;
            v31[2] = v34;
            v31[3] = v35;
            v25 = *(v21 - 3);
            v30[0] = *(v21 - 4);
            v30[1] = v25;
            v26 = *(v21 - 1);
            v30[2] = *(v21 - 2);
            v30[3] = v26;
            result = v24(v31, v30);
            v20 -= 64;
            if ((result & 1) == 0)
            {
              v27 = (_OWORD *)((char *)v6 + v20 + 64);
              goto LABEL_10;
            }
          }
          v27 = v6;
LABEL_10:
          v28 = v33;
          *v27 = v32;
          v27[1] = v28;
          v29 = v35;
          v27[2] = v34;
          v27[3] = v29;
        }
        v7 = v10 + 4;
        v9 += 64;
      }
      while (v10 + 4 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t result, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v3;
  uint64_t v4;
  __int128 *v6;
  __int128 *i;
  __int128 *v9;
  uint64_t (*v10)(_QWORD, _QWORD);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 *v18;
  __int128 *v19;
  __int128 v20;
  __int128 v21;
  uint64_t (*v22)(_QWORD, _QWORD);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[4];
  _OWORD v29[4];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[4];
  _OWORD v35[4];
  uint64_t v36;
  uint64_t v37;

  if ((__int128 *)result != a2)
  {
    v36 = v3;
    v37 = v4;
    v6 = (__int128 *)result;
    for (i = (__int128 *)(result + 64); v6 + 4 != a2; i = v6 + 4)
    {
      v9 = v6;
      v6 = i;
      v10 = *a3;
      v11 = v6[1];
      v35[0] = *v6;
      v35[1] = v11;
      v12 = v6[3];
      v35[2] = v6[2];
      v35[3] = v12;
      v13 = v9[3];
      v15 = *v9;
      v14 = v9[1];
      v34[2] = v9[2];
      v34[3] = v13;
      v34[0] = v15;
      v34[1] = v14;
      result = v10(v35, v34);
      if ((_DWORD)result)
      {
        v16 = v6[1];
        v30 = *v6;
        v31 = v16;
        v17 = v6[3];
        v32 = v6[2];
        v33 = v17;
        v18 = v6;
        do
        {
          v19 = v18 - 4;
          v20 = *(v18 - 3);
          *v18 = *(v18 - 4);
          v18[1] = v20;
          v21 = *(v18 - 1);
          v18[2] = *(v18 - 2);
          v18[3] = v21;
          v22 = *a3;
          v29[0] = v30;
          v29[1] = v31;
          v29[2] = v32;
          v29[3] = v33;
          v23 = *(v18 - 8);
          v24 = *(v18 - 7);
          v25 = *(v18 - 5);
          v28[2] = *(v18 - 6);
          v28[3] = v25;
          v28[0] = v23;
          v28[1] = v24;
          result = v22(v29, v28);
          v18 = v19;
        }
        while ((result & 1) != 0);
        v26 = v31;
        *v19 = v30;
        v19[1] = v26;
        v27 = v33;
        v19[2] = v32;
        v19[3] = v27;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(_OWORD *a1, _OWORD *a2, _OWORD *a3, unsigned int (**a4)(_QWORD, _QWORD))
{
  unsigned int (*v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char v13;
  unsigned int (*v14)(_QWORD, _QWORD);
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
  uint64_t result;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  unsigned int (*v38)(_QWORD, _QWORD);
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  unsigned int (*v59)(_QWORD, _QWORD);
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _OWORD v71[4];
  _OWORD v72[4];
  _OWORD v73[4];
  _OWORD v74[4];
  _OWORD v75[4];
  _OWORD v76[4];
  _OWORD v77[4];
  _OWORD v78[4];
  _OWORD v79[4];
  _OWORD v80[24];

  v8 = *a4;
  v9 = a2[1];
  v80[0] = *a2;
  v80[1] = v9;
  v10 = a2[3];
  v80[2] = a2[2];
  v80[3] = v10;
  v11 = a1[1];
  v79[0] = *a1;
  v79[1] = v11;
  v12 = a1[3];
  v79[2] = a1[2];
  v79[3] = v12;
  v13 = v8(v80, v79);
  v14 = *a4;
  if ((v13 & 1) != 0)
  {
    v15 = a3[1];
    v74[0] = *a3;
    v74[1] = v15;
    v16 = a3[3];
    v74[2] = a3[2];
    v74[3] = v16;
    v17 = a2[1];
    v73[0] = *a2;
    v73[1] = v17;
    v18 = a2[3];
    v73[2] = a2[2];
    v73[3] = v18;
    if (v14(v74, v73))
    {
      v20 = a1[2];
      v19 = a1[3];
      v22 = *a1;
      v21 = a1[1];
      v23 = a3[3];
      v25 = *a3;
      v24 = a3[1];
      a1[2] = a3[2];
      a1[3] = v23;
      *a1 = v25;
      a1[1] = v24;
      *a3 = v22;
      a3[1] = v21;
      result = 1;
LABEL_9:
      a3[2] = v20;
      a3[3] = v19;
      return result;
    }
    v53 = a1[2];
    v52 = a1[3];
    v55 = *a1;
    v54 = a1[1];
    v56 = a2[3];
    v58 = *a2;
    v57 = a2[1];
    a1[2] = a2[2];
    a1[3] = v56;
    *a1 = v58;
    a1[1] = v57;
    *a2 = v55;
    a2[1] = v54;
    a2[2] = v53;
    a2[3] = v52;
    v59 = *a4;
    v60 = *a3;
    v61 = a3[1];
    v62 = a3[3];
    v72[2] = a3[2];
    v72[3] = v62;
    v72[0] = v60;
    v72[1] = v61;
    v63 = *a2;
    v64 = a2[1];
    v65 = a2[3];
    v71[2] = a2[2];
    v71[3] = v65;
    v71[0] = v63;
    v71[1] = v64;
    if (v59(v72, v71))
    {
      v20 = a2[2];
      v19 = a2[3];
      v67 = *a2;
      v66 = a2[1];
      v68 = a3[3];
      v70 = *a3;
      v69 = a3[1];
      a2[2] = a3[2];
      a2[3] = v68;
      *a2 = v70;
      a2[1] = v69;
      *a3 = v67;
      a3[1] = v66;
      result = 2;
      goto LABEL_9;
    }
  }
  else
  {
    v27 = a3[1];
    v78[0] = *a3;
    v78[1] = v27;
    v28 = a3[3];
    v78[2] = a3[2];
    v78[3] = v28;
    v29 = a2[1];
    v77[0] = *a2;
    v77[1] = v29;
    v30 = a2[3];
    v77[2] = a2[2];
    v77[3] = v30;
    result = ((uint64_t (*)(_OWORD *, _OWORD *))v14)(v78, v77);
    if (!(_DWORD)result)
      return result;
    v32 = a2[2];
    v31 = a2[3];
    v34 = *a2;
    v33 = a2[1];
    v35 = a3[3];
    v37 = *a3;
    v36 = a3[1];
    a2[2] = a3[2];
    a2[3] = v35;
    *a2 = v37;
    a2[1] = v36;
    *a3 = v34;
    a3[1] = v33;
    a3[2] = v32;
    a3[3] = v31;
    v38 = *a4;
    v39 = *a2;
    v40 = a2[1];
    v41 = a2[3];
    v76[2] = a2[2];
    v76[3] = v41;
    v76[0] = v39;
    v76[1] = v40;
    v42 = *a1;
    v43 = a1[1];
    v44 = a1[3];
    v75[2] = a1[2];
    v75[3] = v44;
    v75[0] = v42;
    v75[1] = v43;
    if (v38(v76, v75))
    {
      v46 = a1[2];
      v45 = a1[3];
      v48 = *a1;
      v47 = a1[1];
      v49 = a2[3];
      v51 = *a2;
      v50 = a2[1];
      a1[2] = a2[2];
      a1[3] = v49;
      *a1 = v51;
      a1[1] = v50;
      *a2 = v48;
      a2[1] = v47;
      result = 2;
      a2[2] = v46;
      a2[3] = v45;
      return result;
    }
  }
  return 1;
}

__int128 *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,sortColorEntry *,BOOL (*&)(sortColorEntry,sortColorEntry)>(__int128 *a1, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  __int128 *v4;
  __int128 v6;
  __int128 v7;
  uint64_t (*v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 *v12;
  __int128 *v13;
  uint64_t (*v14)(_QWORD, _QWORD);
  __int128 v15;
  __int128 v16;
  char v17;
  __int128 *v18;
  uint64_t (*v19)(_QWORD, _QWORD);
  __int128 v20;
  __int128 v21;
  int v22;
  __int128 *v23;
  uint64_t (*v24)(_QWORD, _QWORD);
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  unsigned int (*v40)(_QWORD, _QWORD);
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t (*v45)(_QWORD, _QWORD);
  __int128 *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _OWORD v54[4];
  _OWORD v55[4];
  _OWORD v56[4];
  _OWORD v57[4];
  _OWORD v58[4];
  _OWORD v59[4];
  _OWORD v60[4];
  _OWORD v61[4];
  _OWORD v62[4];
  _OWORD v63[4];
  _OWORD v64[4];
  _OWORD v65[4];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;

  v4 = a2;
  v6 = a1[1];
  v66 = *a1;
  v67 = v6;
  v7 = a1[3];
  v68 = a1[2];
  v69 = v7;
  v8 = *a3;
  v65[0] = v66;
  v65[1] = v6;
  v65[2] = v68;
  v65[3] = v7;
  v9 = *(a2 - 4);
  v10 = *(a2 - 3);
  v11 = *(a2 - 1);
  v64[2] = *(a2 - 2);
  v64[3] = v11;
  v64[0] = v9;
  v64[1] = v10;
  if ((v8(v65, v64) & 1) != 0)
  {
    v12 = a1;
    do
    {
      v13 = v12 + 4;
      v14 = *a3;
      v63[0] = v66;
      v63[1] = v67;
      v63[2] = v68;
      v63[3] = v69;
      v15 = v12[5];
      v62[0] = v12[4];
      v62[1] = v15;
      v16 = v12[7];
      v62[2] = v12[6];
      v62[3] = v16;
      v17 = v14(v63, v62);
      v12 = v13;
    }
    while ((v17 & 1) == 0);
  }
  else
  {
    v18 = a1 + 4;
    do
    {
      v13 = v18;
      if (v18 >= v4)
        break;
      v19 = *a3;
      v61[0] = v66;
      v61[1] = v67;
      v61[2] = v68;
      v61[3] = v69;
      v20 = v13[1];
      v60[0] = *v13;
      v60[1] = v20;
      v21 = v13[3];
      v60[2] = v13[2];
      v60[3] = v21;
      v22 = v19(v61, v60);
      v18 = v13 + 4;
    }
    while (!v22);
  }
  if (v13 >= v4)
  {
    v23 = v4;
  }
  else
  {
    do
    {
      v23 = v4 - 4;
      v24 = *a3;
      v59[0] = v66;
      v59[1] = v67;
      v59[2] = v68;
      v59[3] = v69;
      v25 = *(v4 - 3);
      v58[0] = *(v4 - 4);
      v58[1] = v25;
      v26 = *(v4 - 1);
      v58[2] = *(v4 - 2);
      v58[3] = v26;
      v4 -= 4;
    }
    while ((v24(v59, v58) & 1) != 0);
  }
  while (v13 < v23)
  {
    v27 = *v13;
    v28 = v13[1];
    v29 = v13[3];
    v72 = v13[2];
    v73 = v29;
    v70 = v27;
    v71 = v28;
    v30 = *v23;
    v31 = v23[1];
    v32 = v23[3];
    v13[2] = v23[2];
    v13[3] = v32;
    *v13 = v30;
    v13[1] = v31;
    v33 = v70;
    v34 = v71;
    v35 = v73;
    v23[2] = v72;
    v23[3] = v35;
    *v23 = v33;
    v23[1] = v34;
    do
    {
      v57[0] = v66;
      v57[1] = v67;
      v57[2] = v68;
      v57[3] = v69;
      v36 = v13[6];
      v37 = v13[7];
      v39 = v13[4];
      v38 = v13[5];
      v13 += 4;
      v40 = (unsigned int (*)(_QWORD, _QWORD))*a3;
      v56[2] = v36;
      v56[3] = v37;
      v56[0] = v39;
      v56[1] = v38;
    }
    while (!v40(v57, v56));
    do
    {
      v55[0] = v66;
      v55[1] = v67;
      v55[2] = v68;
      v55[3] = v69;
      v41 = *(v23 - 2);
      v42 = *(v23 - 1);
      v44 = *(v23 - 4);
      v43 = *(v23 - 3);
      v23 -= 4;
      v45 = *a3;
      v54[2] = v41;
      v54[3] = v42;
      v54[0] = v44;
      v54[1] = v43;
    }
    while ((v45(v55, v54) & 1) != 0);
  }
  v46 = v13 - 4;
  if (v13 - 4 != a1)
  {
    v47 = *v46;
    v48 = *(v13 - 3);
    v49 = *(v13 - 1);
    a1[2] = *(v13 - 2);
    a1[3] = v49;
    *a1 = v47;
    a1[1] = v48;
  }
  v50 = v66;
  v51 = v67;
  v52 = v69;
  *(v13 - 2) = v68;
  *(v13 - 1) = v52;
  *v46 = v50;
  *(v13 - 3) = v51;
  return v13;
}

__int128 *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,sortColorEntry *,BOOL (*&)(sortColorEntry,sortColorEntry)>(__int128 *a1, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t (*v9)(_QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 *v12;
  __int128 *v13;
  __int128 *v14;
  unsigned int (*v15)(_QWORD, _QWORD);
  __int128 v16;
  __int128 v17;
  uint64_t (*v18)(_QWORD, _QWORD);
  __int128 v19;
  __int128 v20;
  __int128 *v21;
  __int128 *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t (*v34)(_QWORD, _QWORD);
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unsigned int (*v39)(_QWORD, _QWORD);
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD v47[4];
  _OWORD v48[4];
  _OWORD v49[4];
  _OWORD v50[4];
  _OWORD v51[4];
  _OWORD v52[4];
  _OWORD v53[4];
  _OWORD v54[4];
  _OWORD v55[4];
  _OWORD v56[4];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;

  v6 = 0;
  v7 = a1[1];
  v57 = *a1;
  v58 = v7;
  v8 = a1[3];
  v59 = a1[2];
  v60 = v8;
  do
  {
    v9 = *a3;
    v10 = a1[v6 + 5];
    v56[0] = a1[v6 + 4];
    v56[1] = v10;
    v11 = a1[v6 + 7];
    v56[2] = a1[v6 + 6];
    v56[3] = v11;
    v55[0] = v57;
    v55[1] = v58;
    v55[2] = v59;
    v55[3] = v60;
    v6 += 4;
  }
  while ((v9(v56, v55) & 1) != 0);
  v12 = &a1[v6];
  v13 = &a1[v6 - 4];
  if (v6 == 4)
  {
    while (v12 < a2)
    {
      v18 = *a3;
      v14 = a2 - 4;
      v19 = *(a2 - 3);
      v54[0] = *(a2 - 4);
      v54[1] = v19;
      v20 = *(a2 - 1);
      v54[2] = *(a2 - 2);
      v54[3] = v20;
      v53[0] = v57;
      v53[1] = v58;
      v53[2] = v59;
      v53[3] = v60;
      a2 -= 4;
      if ((v18(v54, v53) & 1) != 0)
        goto LABEL_9;
    }
    v14 = a2;
  }
  else
  {
    do
    {
      v14 = a2 - 4;
      v15 = (unsigned int (*)(_QWORD, _QWORD))*a3;
      v16 = *(a2 - 3);
      v52[0] = *(a2 - 4);
      v52[1] = v16;
      v17 = *(a2 - 1);
      v52[2] = *(a2 - 2);
      v52[3] = v17;
      v51[0] = v57;
      v51[1] = v58;
      v51[2] = v59;
      v51[3] = v60;
      a2 -= 4;
    }
    while (!v15(v52, v51));
  }
LABEL_9:
  if (v12 < v14)
  {
    v21 = v12;
    v22 = v14;
    do
    {
      v24 = v21[1];
      v61 = *v21;
      v23 = v61;
      v62 = v24;
      v26 = v21[3];
      v63 = v21[2];
      v25 = v63;
      v64 = v26;
      v28 = v22[2];
      v27 = v22[3];
      v29 = v22[1];
      *v21 = *v22;
      v21[1] = v29;
      v21[2] = v28;
      v21[3] = v27;
      v22[2] = v25;
      v22[3] = v26;
      *v22 = v23;
      v22[1] = v24;
      do
      {
        v30 = v21[6];
        v31 = v21[7];
        v33 = v21[4];
        v32 = v21[5];
        v21 += 4;
        v34 = *a3;
        v50[2] = v30;
        v50[3] = v31;
        v50[0] = v33;
        v50[1] = v32;
        v49[0] = v57;
        v49[1] = v58;
        v49[2] = v59;
        v49[3] = v60;
      }
      while ((v34(v50, v49) & 1) != 0);
      do
      {
        v35 = *(v22 - 2);
        v36 = *(v22 - 1);
        v38 = *(v22 - 4);
        v37 = *(v22 - 3);
        v22 -= 4;
        v39 = (unsigned int (*)(_QWORD, _QWORD))*a3;
        v48[2] = v35;
        v48[3] = v36;
        v48[0] = v38;
        v48[1] = v37;
        v47[0] = v57;
        v47[1] = v58;
        v47[2] = v59;
        v47[3] = v60;
      }
      while (!v39(v48, v47));
    }
    while (v21 < v22);
    v13 = v21 - 4;
  }
  if (v13 != a1)
  {
    v40 = *v13;
    v41 = v13[1];
    v42 = v13[3];
    a1[2] = v13[2];
    a1[3] = v42;
    *a1 = v40;
    a1[1] = v41;
  }
  v43 = v57;
  v44 = v58;
  v45 = v60;
  v13[2] = v59;
  v13[3] = v45;
  *v13 = v43;
  v13[1] = v44;
  return v13;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, __n128 *a2, unsigned int (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  _BOOL8 result;
  unsigned int (*v8)(_QWORD, _QWORD);
  __n128 v9;
  __n128 v10;
  __int128 v11;
  __int128 v12;
  __n128 *v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 *v21;
  __n128 *v22;
  uint64_t v23;
  int v24;
  unsigned int (*v25)(_QWORD, _QWORD);
  __n128 v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  uint64_t v33;
  _OWORD *v34;
  __int128 v35;
  __int128 v36;
  unsigned int (*v37)(_QWORD, _QWORD);
  __int128 v38;
  __int128 v39;
  _OWORD *v40;
  __n128 v41;
  __n128 v42;
  _OWORD v43[4];
  _OWORD v44[4];
  __n128 v45;
  __n128 v46;
  __n128 v47;
  __n128 v48;
  _OWORD v49[4];
  _OWORD v50[4];
  _OWORD v51[4];
  _OWORD v52[8];

  v6 = ((uint64_t)a2 - a1) >> 6;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = *a3;
      v9 = a2[-3];
      v52[0] = a2[-4];
      v52[1] = v9;
      v10 = a2[-1];
      v52[2] = a2[-2];
      v52[3] = v10;
      v11 = *(_OWORD *)(a1 + 16);
      v51[0] = *(_OWORD *)a1;
      v51[1] = v11;
      v12 = *(_OWORD *)(a1 + 48);
      v51[2] = *(_OWORD *)(a1 + 32);
      v51[3] = v12;
      if (!v8(v52, v51))
        return 1;
      v13 = a2 - 4;
      v15 = *(__n128 *)(a1 + 32);
      v14 = *(__n128 *)(a1 + 48);
      v17 = *(__n128 *)a1;
      v16 = *(__n128 *)(a1 + 16);
      v18 = a2[-1];
      v20 = a2[-4];
      v19 = a2[-3];
      *(__n128 *)(a1 + 32) = a2[-2];
      *(__n128 *)(a1 + 48) = v18;
      *(__n128 *)a1 = v20;
      *(__n128 *)(a1 + 16) = v19;
      *v13 = v17;
      v13[1] = v16;
      result = 1;
      v13[2] = v15;
      v13[3] = v14;
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (_OWORD *)(a1 + 64), (__n128 *)a2[-4].n128_u64, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), a2 - 4, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), (__n128 *)(a1 + 192), a2 - 4, a3);
      return 1;
    default:
      v21 = (__n128 *)(a1 + 128);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (_OWORD *)(a1 + 64), (_OWORD *)(a1 + 128), a3);
      v22 = (__n128 *)(a1 + 192);
      if ((__n128 *)(a1 + 192) == a2)
        return 1;
      v23 = 0;
      v24 = 0;
      break;
  }
  while (1)
  {
    v25 = *a3;
    v26 = v22[1];
    v50[0] = *v22;
    v50[1] = v26;
    v27 = v22[3];
    v50[2] = v22[2];
    v50[3] = v27;
    v28 = v21[3];
    v30 = *v21;
    v29 = v21[1];
    v49[2] = v21[2];
    v49[3] = v28;
    v49[0] = v30;
    v49[1] = v29;
    if (v25(v50, v49))
    {
      v31 = v22[1];
      v45 = *v22;
      v46 = v31;
      v32 = v22[3];
      v47 = v22[2];
      v48 = v32;
      v33 = v23;
      while (1)
      {
        v34 = (_OWORD *)(a1 + v33);
        v35 = *(_OWORD *)(a1 + v33 + 144);
        v34[12] = *(_OWORD *)(a1 + v33 + 128);
        v34[13] = v35;
        v36 = *(_OWORD *)(a1 + v33 + 176);
        v34[14] = *(_OWORD *)(a1 + v33 + 160);
        v34[15] = v36;
        if (v33 == -128)
          break;
        v37 = *a3;
        v44[0] = v45;
        v44[1] = v46;
        v44[2] = v47;
        v44[3] = v48;
        v38 = v34[5];
        v43[0] = v34[4];
        v43[1] = v38;
        v39 = v34[7];
        v43[2] = v34[6];
        v43[3] = v39;
        v33 -= 64;
        if ((((uint64_t (*)(_OWORD *, _OWORD *))v37)(v44, v43) & 1) == 0)
        {
          v40 = (_OWORD *)(a1 + v33 + 192);
          goto LABEL_12;
        }
      }
      v40 = (_OWORD *)a1;
LABEL_12:
      v41 = v46;
      *v40 = v45;
      v40[1] = v41;
      v42 = v48;
      v40[2] = v47;
      v40[3] = v42;
      if (++v24 == 8)
        return &v22[4] == a2;
    }
    v21 = v22;
    v23 += 64;
    v22 += 4;
    if (v22 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, unsigned int (**a5)(_QWORD, _QWORD))
{
  unsigned int (*v10)(_QWORD, _QWORD);
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 result;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  unsigned int (*v23)(_QWORD, _QWORD);
  __n128 v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  unsigned int (*v37)(_QWORD, _QWORD);
  __n128 v38;
  __n128 v39;
  __n128 v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  __n128 v47;
  __n128 v48;
  __n128 v49;
  _OWORD v50[4];
  _OWORD v51[4];
  _OWORD v52[4];
  _OWORD v53[4];
  _OWORD v54[4];
  _OWORD v55[16];

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, a2, a3, a5);
  v10 = *a5;
  v11 = a4[1];
  v55[0] = *a4;
  v55[1] = v11;
  v12 = a4[3];
  v55[2] = a4[2];
  v55[3] = v12;
  v13 = a3[1];
  v54[0] = *a3;
  v54[1] = v13;
  v14 = a3[3];
  v54[2] = a3[2];
  v54[3] = v14;
  if (v10(v55, v54))
  {
    v17 = a3[2];
    v16 = a3[3];
    v19 = *a3;
    v18 = a3[1];
    v20 = a4[3];
    v22 = *a4;
    v21 = a4[1];
    a3[2] = a4[2];
    a3[3] = v20;
    *a3 = v22;
    a3[1] = v21;
    *a4 = v19;
    a4[1] = v18;
    a4[2] = v17;
    a4[3] = v16;
    v23 = *a5;
    v24 = *a3;
    v25 = a3[1];
    v26 = a3[3];
    v53[2] = a3[2];
    v53[3] = v26;
    v53[0] = v24;
    v53[1] = v25;
    v27 = *a2;
    v28 = a2[1];
    v29 = a2[3];
    v52[2] = a2[2];
    v52[3] = v29;
    v52[0] = v27;
    v52[1] = v28;
    if (v23(v53, v52))
    {
      v31 = a2[2];
      v30 = a2[3];
      v33 = *a2;
      v32 = a2[1];
      v34 = a3[3];
      v36 = *a3;
      v35 = a3[1];
      a2[2] = a3[2];
      a2[3] = v34;
      *a2 = v36;
      a2[1] = v35;
      *a3 = v33;
      a3[1] = v32;
      a3[2] = v31;
      a3[3] = v30;
      v37 = *a5;
      v38 = *a2;
      v39 = a2[1];
      v40 = a2[3];
      v51[2] = a2[2];
      v51[3] = v40;
      v51[0] = v38;
      v51[1] = v39;
      v41 = *a1;
      v42 = a1[1];
      v43 = a1[3];
      v50[2] = a1[2];
      v50[3] = v43;
      v50[0] = v41;
      v50[1] = v42;
      if (v37(v51, v50))
      {
        v44 = a1[2];
        result = a1[3];
        v46 = *a1;
        v45 = a1[1];
        v47 = a2[3];
        v49 = *a2;
        v48 = a2[1];
        a1[2] = a2[2];
        a1[3] = v47;
        *a1 = v49;
        a1[1] = v48;
        *a2 = v46;
        a2[1] = v45;
        a2[2] = v44;
        a2[3] = result;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5, unsigned int (**a6)(_QWORD, _QWORD))
{
  unsigned int (*v12)(_QWORD, _QWORD);
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 result;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  __n128 v23;
  __n128 v24;
  unsigned int (*v25)(_QWORD, _QWORD);
  __n128 v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  unsigned int (*v39)(_QWORD, _QWORD);
  __n128 v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  __n128 v47;
  __n128 v48;
  __n128 v49;
  __n128 v50;
  __n128 v51;
  __n128 v52;
  unsigned int (*v53)(_QWORD, _QWORD);
  __n128 v54;
  __n128 v55;
  __n128 v56;
  __n128 v57;
  __int128 v58;
  __int128 v59;
  __n128 v60;
  __n128 v61;
  __n128 v62;
  __n128 v63;
  __n128 v64;
  __n128 v65;
  _OWORD v66[4];
  _OWORD v67[4];
  _OWORD v68[4];
  _OWORD v69[4];
  _OWORD v70[4];
  _OWORD v71[4];
  _OWORD v72[4];
  _OWORD v73[20];

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)a1, a2, a3, a4, a6);
  v12 = *a6;
  v13 = a5[1];
  v73[0] = *a5;
  v73[1] = v13;
  v14 = a5[3];
  v73[2] = a5[2];
  v73[3] = v14;
  v15 = a4[1];
  v72[0] = *a4;
  v72[1] = v15;
  v16 = a4[3];
  v72[2] = a4[2];
  v72[3] = v16;
  if (v12(v73, v72))
  {
    v19 = a4[2];
    v18 = a4[3];
    v21 = *a4;
    v20 = a4[1];
    v22 = a5[3];
    v24 = *a5;
    v23 = a5[1];
    a4[2] = a5[2];
    a4[3] = v22;
    *a4 = v24;
    a4[1] = v23;
    *a5 = v21;
    a5[1] = v20;
    a5[2] = v19;
    a5[3] = v18;
    v25 = *a6;
    v26 = *a4;
    v27 = a4[1];
    v28 = a4[3];
    v71[2] = a4[2];
    v71[3] = v28;
    v71[0] = v26;
    v71[1] = v27;
    v29 = *a3;
    v30 = a3[1];
    v31 = a3[3];
    v70[2] = a3[2];
    v70[3] = v31;
    v70[0] = v29;
    v70[1] = v30;
    if (v25(v71, v70))
    {
      v33 = a3[2];
      v32 = a3[3];
      v35 = *a3;
      v34 = a3[1];
      v36 = a4[3];
      v38 = *a4;
      v37 = a4[1];
      a3[2] = a4[2];
      a3[3] = v36;
      *a3 = v38;
      a3[1] = v37;
      *a4 = v35;
      a4[1] = v34;
      a4[2] = v33;
      a4[3] = v32;
      v39 = *a6;
      v40 = *a3;
      v41 = a3[1];
      v42 = a3[3];
      v69[2] = a3[2];
      v69[3] = v42;
      v69[0] = v40;
      v69[1] = v41;
      v43 = *a2;
      v44 = a2[1];
      v45 = a2[3];
      v68[2] = a2[2];
      v68[3] = v45;
      v68[0] = v43;
      v68[1] = v44;
      if (v39(v69, v68))
      {
        v47 = a2[2];
        v46 = a2[3];
        v49 = *a2;
        v48 = a2[1];
        v50 = a3[3];
        v52 = *a3;
        v51 = a3[1];
        a2[2] = a3[2];
        a2[3] = v50;
        *a2 = v52;
        a2[1] = v51;
        *a3 = v49;
        a3[1] = v48;
        a3[2] = v47;
        a3[3] = v46;
        v53 = *a6;
        v54 = *a2;
        v55 = a2[1];
        v56 = a2[3];
        v67[2] = a2[2];
        v67[3] = v56;
        v67[0] = v54;
        v67[1] = v55;
        v57 = *(__n128 *)a1;
        v58 = *(_OWORD *)(a1 + 16);
        v59 = *(_OWORD *)(a1 + 48);
        v66[2] = *(_OWORD *)(a1 + 32);
        v66[3] = v59;
        v66[0] = v57;
        v66[1] = v58;
        if (v53(v67, v66))
        {
          v60 = *(__n128 *)(a1 + 32);
          result = *(__n128 *)(a1 + 48);
          v62 = *(__n128 *)a1;
          v61 = *(__n128 *)(a1 + 16);
          v63 = a2[3];
          v65 = *a2;
          v64 = a2[1];
          *(__n128 *)(a1 + 32) = a2[2];
          *(__n128 *)(a1 + 48) = v63;
          *(__n128 *)a1 = v65;
          *(__n128 *)(a1 + 16) = v64;
          *a2 = v62;
          a2[1] = v61;
          a2[2] = v60;
          a2[3] = result;
        }
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

uint64_t SUUIAccountsFramework()
{
  if (SUUIAccountsFramework_sOnce != -1)
    dispatch_once(&SUUIAccountsFramework_sOnce, &__block_literal_global_25);
  return SUUIAccountsFramework_sHandle;
}

uint64_t SUUIAccountsUIFramework()
{
  if (SUUIAccountsUIFramework_sOnce != -1)
    dispatch_once(&SUUIAccountsUIFramework_sOnce, &__block_literal_global_2);
  return SUUIAccountsUIFramework_sHandle;
}

uint64_t SUUIAppleAccountFramework()
{
  if (SUUIAppleAccountFramework_sOnce != -1)
    dispatch_once(&SUUIAppleAccountFramework_sOnce, &__block_literal_global_4);
  return SUUIAppleAccountFramework_sHandle;
}

uint64_t SUUIAppleAccountUIFramework()
{
  if (SUUIAppleAccountUIFramework_sOnce != -1)
    dispatch_once(&SUUIAppleAccountUIFramework_sOnce, &__block_literal_global_6_0);
  return SUUIAppleAccountUIFramework_sHandle;
}

uint64_t SUUIAskPermissionFramework()
{
  if (SUUIAskPermissionFramework_sOnce != -1)
    dispatch_once(&SUUIAskPermissionFramework_sOnce, &__block_literal_global_8_1);
  return SUUIAskPermissionFramework_sHandle;
}

uint64_t SUUIAudioToolboxFramework()
{
  if (SUUIAudioToolboxFramework_sOnce != -1)
    dispatch_once(&SUUIAudioToolboxFramework_sOnce, &__block_literal_global_10_0);
  return SUUIAudioToolboxFramework_sHandle;
}

uint64_t SUUIAVFoundationFramework()
{
  if (SUUIAVFoundationFramework_sOnce != -1)
    dispatch_once(&SUUIAVFoundationFramework_sOnce, &__block_literal_global_12);
  return SUUIAVFoundationFramework_sHandle;
}

uint64_t SUUIContactsAutocompleteUIFramework()
{
  if (SUUIContactsAutocompleteUIFramework_sOnce != -1)
    dispatch_once(&SUUIContactsAutocompleteUIFramework_sOnce, &__block_literal_global_14);
  return SUUIContactsAutocompleteUIFramework_sHandle;
}

uint64_t SUUIContactsFramework()
{
  if (SUUIContactsFramework_sOnce != -1)
    dispatch_once(&SUUIContactsFramework_sOnce, &__block_literal_global_16);
  return SUUIContactsFramework_sHandle;
}

uint64_t SUUIContactsUIFramework()
{
  if (SUUIContactsUIFramework_sOnce != -1)
    dispatch_once(&SUUIContactsUIFramework_sOnce, &__block_literal_global_18);
  return SUUIContactsUIFramework_sHandle;
}

uint64_t SUUICoreImageFramework()
{
  if (SUUICoreImageFramework_sOnce != -1)
    dispatch_once(&SUUICoreImageFramework_sOnce, &__block_literal_global_20);
  return SUUICoreImageFramework_sHandle;
}

uint64_t SUUICoreTelephonyFramework()
{
  if (SUUICoreTelephonyFramework_sOnce != -1)
    dispatch_once(&SUUICoreTelephonyFramework_sOnce, &__block_literal_global_22);
  return SUUICoreTelephonyFramework_sHandle;
}

uint64_t SUUIFamilyCircleFramework()
{
  if (SUUIFamilyCircleFramework_sOnce != -1)
    dispatch_once(&SUUIFamilyCircleFramework_sOnce, &__block_literal_global_24);
  return SUUIFamilyCircleFramework_sHandle;
}

uint64_t SUUIIAdFramework()
{
  if (SUUIIAdFramework_sOnce != -1)
    dispatch_once(&SUUIIAdFramework_sOnce, &__block_literal_global_26);
  return SUUIIAdFramework_sHandle;
}

uint64_t SUUIMediaPlayerFramework()
{
  if (SUUIMediaPlayerFramework_sOnce != -1)
    dispatch_once(&SUUIMediaPlayerFramework_sOnce, &__block_literal_global_28);
  return SUUIMediaPlayerFramework_sHandle;
}

uint64_t SUUIMediaPlayerUIFramework()
{
  if (SUUIMediaPlayerUIFramework_sOnce != -1)
    dispatch_once(&SUUIMediaPlayerUIFramework_sOnce, &__block_literal_global_30);
  return SUUIMediaPlayerUIFramework_sHandle;
}

uint64_t SUUIMobileCoreServicesFramework()
{
  if (SUUIMobileCoreServicesFramework_sOnce != -1)
    dispatch_once(&SUUIMobileCoreServicesFramework_sOnce, &__block_literal_global_32);
  return SUUIMobileCoreServicesFramework_sHandle;
}

uint64_t SUUIMPUFoundationFramework()
{
  if (SUUIMPUFoundationFramework_sOnce != -1)
    dispatch_once(&SUUIMPUFoundationFramework_sOnce, &__block_literal_global_34);
  return SUUIMPUFoundationFramework_sHandle;
}

uint64_t SUUIPassKitCoreFramework()
{
  if (SUUIPassKitCoreFramework_sOnce != -1)
    dispatch_once(&SUUIPassKitCoreFramework_sOnce, &__block_literal_global_36);
  return SUUIPassKitCoreFramework_sHandle;
}

uint64_t SUUIPassKitUIFramework()
{
  if (SUUIPassKitUIFramework_sOnce != -1)
    dispatch_once(&SUUIPassKitUIFramework_sOnce, &__block_literal_global_38);
  return SUUIPassKitUIFramework_sHandle;
}

uint64_t SUUIPhysicsKitFramework()
{
  if (SUUIPhysicsKitFramework_sOnce != -1)
    dispatch_once(&SUUIPhysicsKitFramework_sOnce, &__block_literal_global_40_0);
  return SUUIPhysicsKitFramework_sHandle;
}

uint64_t SUUISocialFramework()
{
  if (SUUISocialFramework_sOnce != -1)
    dispatch_once(&SUUISocialFramework_sOnce, &__block_literal_global_42);
  return SUUISocialFramework_sHandle;
}

uint64_t SUUISpringBoardServicesFramework()
{
  if (SUUISpringBoardServicesFramework_sOnce != -1)
    dispatch_once(&SUUISpringBoardServicesFramework_sOnce, &__block_literal_global_44);
  return SUUISpringBoardServicesFramework_sHandle;
}

uint64_t SUUIWebCoreFramework()
{
  if (SUUIWebCoreFramework_sOnce != -1)
    dispatch_once(&SUUIWebCoreFramework_sOnce, &__block_literal_global_46);
  return SUUIWebCoreFramework_sHandle;
}

uint64_t SUUIImageIOFramework()
{
  if (SUUIImageIOFramework_sOnce != -1)
    dispatch_once(&SUUIImageIOFramework_sOnce, &__block_literal_global_48);
  return SUUIImageIOFramework_sHandle;
}

uint64_t SUUICoreLocationFramework()
{
  if (SUUICoreLocationFramework_sOnce != -1)
    dispatch_once(&SUUICoreLocationFramework_sOnce, &__block_literal_global_50);
  return SUUICoreLocationFramework_sHandle;
}

uint64_t SUUICoreMediaFramework()
{
  if (SUUICoreMediaFramework_sOnce != -1)
    dispatch_once(&SUUICoreMediaFramework_sOnce, &__block_literal_global_52);
  return SUUICoreMediaFramework_sHandle;
}

uint64_t SUUICelestialFramework()
{
  if (SUUICelestialFramework_sOnce != -1)
    dispatch_once(&SUUICelestialFramework_sOnce, &__block_literal_global_54);
  return SUUICelestialFramework_sHandle;
}

uint64_t SUUIVideoSubscriberAccountFramework()
{
  if (SUUIVideoSubscriberAccountFramework_sOnce != -1)
    dispatch_once(&SUUIVideoSubscriberAccountFramework_sOnce, &__block_literal_global_56);
  return SUUIVideoSubscriberAccountFramework_sHandle;
}

void *SUUIWeakLinkedSymbolForString(char *__symbol, void *__handle)
{
  if (__handle)
    return dlsym(__handle, __symbol);
  else
    return 0;
}

id SUUIWeakLinkedClassForString(NSString *a1, uint64_t a2)
{
  if (!a2)
    return 0;
  NSClassFromString(a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_241D4B060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__43(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__43(uint64_t a1)
{

}

void sub_241D4C2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D5588C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_241D5601C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D56630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D56A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __RequestImage(void *a1, void *a2)
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "resourceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(v4, "requestIdentifierForViewElement:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v4, "resourceLoader");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cachedResourceForRequestIdentifier:", objc_msgSend(v9, "unsignedIntegerValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v12 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      objc_msgSend(v4, "transientRequestIdentifierForViewElement:", v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v4, "resourceLoader");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cachedResourceForRequestIdentifier:", objc_msgSend(v14, "unsignedIntegerValue"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }
      objc_msgSend(v4, "dataConsumerForImageElement:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "loadImageForImageElement:reason:dataConsumer:", v3, 1, v12);

      if (v7)
        goto LABEL_20;
      if (v12)
        goto LABEL_16;
    }
    objc_msgSend(v4, "dataConsumerForImageElement:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    objc_msgSend(v4, "loadImageForImageElement:reason:dataConsumer:", v3, 1, v12);
    objc_msgSend(v3, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageTreatment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = SUUIImageTreatmentForString(v17);

    if (v18 == 7 || !objc_msgSend(v12, "isImagePlaceholderAvailable"))
    {
      objc_msgSend(v4, "placeholderImageForImageElement:dataConsumer:", v3, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "style");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imagePlaceholderBackgroundColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "color");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "imagePlaceholderForColor:", v21);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_20;
  }
  SUUIImageWithResourceName(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageMaskColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v9, "color");
    else
      objc_msgSend(v4, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_flatImageWithColor:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
    goto LABEL_20;
  }
LABEL_21:

  return v7;
}

id SUUIVideoPreviewPlayPlayableVideoWithAsset(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  Float64 v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v37;
  id v38;
  const __CFString *v39;
  CMTime v40;
  CMTime v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v5;
  objc_msgSend(v6, "contentURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v19 = 0;
    goto LABEL_14;
  }
  v10 = (void *)SUUIAVFoundationFramework();
  v11 = *(id *)SUUIWeakLinkedSymbolForString("AVURLAssetInheritURIQueryComponentFromReferencingURIKey", v10);
  v40.value = (CMTimeValue)v11;
  v41.value = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v8, "kind"))
  {
    v13 = (void *)SUUIAVFoundationFramework();
    v14 = *(id *)SUUIWeakLinkedSymbolForString("AVURLAssetAlternativeConfigurationOptionsKey", v13);
    v15 = (void *)SUUIAVFoundationFramework();
    v16 = *(id *)SUUIWeakLinkedSymbolForString("AVURLAssetAlternativeConfigurationServiceIdentifierKey", v15);
    v17 = objc_msgSend(v8, "kind");
    if (v17 == 1)
    {
      v37 = v7;
      v18 = CFSTR("com.apple.itunesstore.movies.preview.cloud");
    }
    else
    {
      if (v17 != 2)
      {
LABEL_10:

        goto LABEL_11;
      }
      v37 = v7;
      v18 = CFSTR("com.apple.itunesstore.tvshows.preview.cloud");
    }
    v20 = (void *)objc_msgSend(v12, "mutableCopy");
    v38 = v16;
    v39 = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v21, v14);
    v22 = objc_msgSend(v20, "copy");

    v12 = (void *)v22;
    v7 = v37;
    goto LABEL_10;
  }
LABEL_11:
  v23 = SUUIAVFoundationFramework();
  v19 = (void *)objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(CFSTR("AVURLAsset"), v23)), "initWithURL:options:", v9, v12);
  +[SUUIStoreAssetResourceLoaderDelegate storeAssetResourceLoaderDelegateForPlayableAsset:clientContext:](SUUIStoreAssetResourceLoaderDelegate, "storeAssetResourceLoaderDelegateForPlayableAsset:clientContext:", v6, v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v19, "resourceLoader");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIStoreAssetResourceLoaderConfigureWithDelegate(v25, v24);

  }
LABEL_14:

  if (v19)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2618]), "initWithAsset:", v19);
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2610]), "initWithPlayerItem:", v26);
    v28 = objc_alloc_init(MEMORY[0x24BDB27C0]);
    objc_msgSend(v28, "setPlayer:", v27);
    objc_msgSend(v28, "setExitsFullScreenWhenPlaybackEnds:", 1);
    v29 = v6;
    v30 = v27;
    objc_msgSend(v29, "initialPlaybackTime");
    memset(&v41, 0, sizeof(v41));
    CMTimeMakeWithSeconds(&v41, v31, 1000000);
    v40 = v41;
    objc_msgSend(v30, "seekToTime:", &v40);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "postNotificationName:object:", CFSTR("SUUIVideoPreviewDidStartNotification"), 0);

    v33 = objc_msgSend(v29, "storeItemIdentifier");
    SUUIVideoPreviewObservePlayer(v30, v33);
    objc_msgSend(MEMORY[0x24BEC8CD8], "sessionManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (id)objc_msgSend(v34, "stopAllAudioPlayerSessions");

    objc_msgSend(v30, "play");
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

id SUUIVideoPreviewPlayPlayableAsset(void *a1, void *a2)
{
  return SUUIVideoPreviewPlayPlayableVideoWithAsset(0, a1, a2);
}

void SUUIVideoPreviewDismissOnEnterBackground(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _SUUIVideoPreviewNotificationObserver *v10;
  void *v11;
  _SUUIVideoPreviewNotificationObserver *v12;
  _QWORD aBlock[4];
  id v14;
  id location;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_getAssociatedObject(v1, "com.apple.iTunesStoreUI.MoviePlayer.BackgroundObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v1);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __SUUIVideoPreviewDismissOnEnterBackground_block_invoke;
    aBlock[3] = &unk_2511F9E88;
    objc_copyWeak(&v14, &location);
    v4 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x24BEBDF98], v5, v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("SUUIVideoPreviewDismissNotification"), 0, v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [_SUUIVideoPreviewNotificationObserver alloc];
    v16[0] = v7;
    v16[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_SUUIVideoPreviewNotificationObserver initWithObservers:](v10, "initWithObservers:", v11);

    objc_setAssociatedObject(v1, "com.apple.iTunesStoreUI.MoviePlayer.BackgroundObserver", v12, (void *)1);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
}

void sub_241D5FEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SUUIVideoPreviewObservePlayer(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t block;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;

  v3 = a1;
  v10 = 3221225472;
  v11 = __SUUIVideoPreviewObservePlayer_block_invoke_3;
  v12 = &unk_2511F7A18;
  v13 = &__block_literal_global_28;
  v7 = v3;
  block = MEMORY[0x24BDAC760];
  if (SUUIVideoPreviewObservePlayer_sOnce != -1)
  {
    dispatch_once(&SUUIVideoPreviewObservePlayer_sOnce, &block);
    v3 = v7;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a2)
  {
LABEL_3:
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", a2);
    objc_msgSend(v7, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v5, "com.apple.iTunesStoreUI.MoviePlayerItemID", v4, (void *)1);

    v3 = v7;
  }
LABEL_4:
  objc_msgSend(v3, "currentItem", v7, block, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v6, "com.apple.iTunesStoreUI.MoviePlayerTrackingKey", MEMORY[0x24BDBD1C8], (void *)1);

}

void sub_241D601C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D62290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

uint64_t __Block_byref_object_copy__44(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__44(uint64_t a1)
{

}

void sub_241D64874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__45(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__45(uint64_t a1)
{

}

void sub_241D649C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D67808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__46(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__46(uint64_t a1)
{

}

void sub_241D68A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D68D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SUUIViewControllerIsVisible(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (objc_msgSend(v1, "isViewLoaded"))
  {
    objc_msgSend(v1, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(v2, "isHidden") ^ 1;
  else
    v4 = 0;

  return v4;
}

id SUUIViewControllerGetAncestorTabBarController(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_257209220))
  {
    v3 = v2;
  }
  else
  {
    v3 = v1;
    do
    {
      v4 = v3;
      objc_msgSend(v3, "parentViewController");
      v3 = (id)objc_claimAutoreleasedReturnValue();

    }
    while (v3 && !objc_msgSend(v3, "conformsToProtocol:", &unk_257209220));
  }

  return v3;
}

id SUUIViewControllerGetTopMostViewController(void *a1)
{
  id i;
  uint64_t v2;

  for (i = a1; ; i = (id)v2)
  {
    objc_msgSend(i, "presentedViewController");
    v2 = objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(i, "topViewController"), (v2 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          break;
        objc_msgSend(i, "focusedViewController");
        v2 = objc_claimAutoreleasedReturnValue();
        if (!v2)
          break;
      }
    }

  }
  return i;
}

BOOL SUUIViewControllerIsDescendent(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = v5;
  v7 = v5;
  if (v5)
  {
    v7 = v5;
    if (v5 != v4)
    {
      v7 = v5;
      do
      {
        v8 = v7;
        objc_msgSend(v7, "parentViewController");
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
      while (v7 && v7 != v4);
    }
  }

  return v7 == v4;
}

void sub_241D6E1A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_241D6E300(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void AnalyzedImageColors::AnalyzedImageColors(AnalyzedImageColors *this)
{
  ITColor *v2;

  ITColor::ITColor((ITColor *)this);
  ITColor::ITColor(v2 + 1);
  ITColor::ITColor((ITColor *)this + 2);
  ITColor::ITColor((ITColor *)this + 3);
  ITColor::ITColor((ITColor *)this + 4);
  ITColor::ITColor((ITColor *)this + 5);
  ITColor::ITColor((ITColor *)this + 6);
  ITColor::ITColor((ITColor *)this + 7);
  ITColor::ITColor((ITColor *)this + 8);
  *(_QWORD *)((char *)this + 293) = 0;
  *((_QWORD *)this + 36) = 0;
}

void sub_241D6F9DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_241D70654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__47(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__47(uint64_t a1)
{

}

void sub_241D70E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D710AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D71170(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241D713E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D714C8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241D71750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D71988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__48(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__48(uint64_t a1)
{

}

void sub_241D71BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_241D722B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D738F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  uint64_t v58;

  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose((const void *)(v58 - 232), 8);
  _Block_object_dispose((const void *)(v58 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_241D73D94(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_241D7489C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D74EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D75408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D75778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D76360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D765DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D771B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D79E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void _SUUIOffscreenRenderOperationPopRenderingContext(_QWORD *a1, _QWORD *a2)
{
  NSObject *v4;
  id *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD block[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__12;
  v35 = __Block_byref_object_dispose__13;
  v36 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__12;
  v29 = __Block_byref_object_dispose__13;
  v30 = 0;
  _SUUIOffscreenRenderOperationGetRendererStackAccessQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___SUUIOffscreenRenderOperationPopRenderingContext_block_invoke;
  block[3] = &unk_2511FA560;
  block[4] = &v31;
  block[5] = &v25;
  dispatch_barrier_sync(v4, block);
  if (v32[5] && v26[5])
    goto LABEL_12;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v5 = (id *)getkEAGLContextPropertyAcceleratedSymbolLoc_ptr;
  v40 = getkEAGLContextPropertyAcceleratedSymbolLoc_ptr;
  if (!getkEAGLContextPropertyAcceleratedSymbolLoc_ptr)
  {
    v6 = (void *)OpenGLESLibrary();
    v5 = (id *)dlsym(v6, "kEAGLContextPropertyAccelerated");
    v38[3] = (uint64_t)v5;
    getkEAGLContextPropertyAcceleratedSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v37, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getkEAGLContextPropertyAccelerated(void)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("SUUIOffscreenRenderOperation.m"), 46, CFSTR("%s"), dlerror());

    goto LABEL_19;
  }
  v7 = *v5;
  v41[0] = v7;
  v8 = MEMORY[0x24BDBD1C8];
  v42[0] = MEMORY[0x24BDBD1C8];
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v9 = (id *)getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr;
  v40 = getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr;
  if (!getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr)
  {
    v10 = (void *)OpenGLESLibrary();
    v9 = (id *)dlsym(v10, "kEAGLContextPropertyClientRetainRelease");
    v38[3] = (uint64_t)v9;
    getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v37, 8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getkEAGLContextPropertyClientRetainRelease(void)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("SUUIOffscreenRenderOperation.m"), 47, CFSTR("%s"), dlerror());

LABEL_19:
    __break(1u);
  }
  v11 = *v9;
  v41[1] = v11;
  v42[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(objc_alloc((Class)getEAGLContextClass()), "initWithAPI:properties:", 3, v12);
  v14 = (void *)v26[5];
  v26[5] = v13;

  v15 = v26[5];
  if (!v15)
  {
    v16 = objc_msgSend(objc_alloc((Class)getEAGLContextClass()), "initWithAPI:properties:", 2, v12);
    v17 = (void *)v26[5];
    v26[5] = v16;

    v15 = v26[5];
  }
  objc_msgSend(MEMORY[0x24BDE5740], "rendererWithEAGLContext:options:", v15, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v32[5];
  v32[5] = v18;

LABEL_12:
  if (a2)
    *a2 = objc_retainAutorelease((id)v26[5]);
  if (a1)
    *a1 = objc_retainAutorelease((id)v32[5]);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

}

void sub_241D7A258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

id getEAGLContextClass()
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
  v0 = (void *)getEAGLContextClass_softClass;
  v7 = getEAGLContextClass_softClass;
  if (!getEAGLContextClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getEAGLContextClass_block_invoke;
    v3[3] = &unk_2511FA508;
    v3[4] = &v4;
    __getEAGLContextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_241D7A33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _SUUIglGetError()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getglGetErrorSymbolLoc_ptr;
  v7 = getglGetErrorSymbolLoc_ptr;
  if (!getglGetErrorSymbolLoc_ptr)
  {
    v1 = (void *)OpenGLESLibrary();
    v0 = dlsym(v1, "glGetError");
    v5[3] = (uint64_t)v0;
    getglGetErrorSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    _SUUIglGetError_cold_1();
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void sub_241D7A3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _SUUIglBindFramebuffer(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = getglBindFramebufferSymbolLoc_ptr;
  v8 = getglBindFramebufferSymbolLoc_ptr;
  if (!getglBindFramebufferSymbolLoc_ptr)
  {
    v3 = (void *)OpenGLESLibrary();
    v2 = dlsym(v3, "glBindFramebuffer");
    v6[3] = (uint64_t)v2;
    getglBindFramebufferSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    _SUUIglBindFramebuffer_cold_1();
  return ((uint64_t (*)(uint64_t, uint64_t))v2)(36160, a1);
}

void sub_241D7A480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void _SUUIOffscreenRenderOperationPushRenderingContext(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    _SUUIOffscreenRenderOperationGetRendererStackAccessQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___SUUIOffscreenRenderOperationPushRenderingContext_block_invoke;
    v7[3] = &unk_2511F46D0;
    v8 = v3;
    v9 = v5;
    dispatch_barrier_async(v6, v7);

  }
}

void *__Block_byref_object_copy__49(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__49(uint64_t a1)
{

}

uint64_t IOSurfaceLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!IOSurfaceLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_2511FA528;
    v3 = 0;
    IOSurfaceLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IOSurfaceLibraryCore_frameworkLibrary)
    IOSurfaceLibrary_cold_1(&v1);
  return IOSurfaceLibraryCore_frameworkLibrary;
}

uint64_t OpenGLESLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!OpenGLESLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_2511FA540;
    v3 = 0;
    OpenGLESLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!OpenGLESLibraryCore_frameworkLibrary)
    OpenGLESLibrary_cold_1(&v1);
  return OpenGLESLibraryCore_frameworkLibrary;
}

Class __getEAGLContextClass_block_invoke(uint64_t a1)
{
  Class result;

  OpenGLESLibrary();
  result = objc_getClass("EAGLContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getEAGLContextClass_block_invoke_cold_1();
  getEAGLContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _SUUIglBindTexture(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = getglBindTextureSymbolLoc_ptr;
  v8 = getglBindTextureSymbolLoc_ptr;
  if (!getglBindTextureSymbolLoc_ptr)
  {
    v3 = (void *)OpenGLESLibrary();
    v2 = dlsym(v3, "glBindTexture");
    v6[3] = (uint64_t)v2;
    getglBindTextureSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    _SUUIglBindTexture_cold_1();
  return ((uint64_t (*)(uint64_t, uint64_t))v2)(3553, a1);
}

void sub_241D7ACC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _SUUIglTexParameteri(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v4 = getglTexParameteriSymbolLoc_ptr;
  v10 = getglTexParameteriSymbolLoc_ptr;
  if (!getglTexParameteriSymbolLoc_ptr)
  {
    v5 = (void *)OpenGLESLibrary();
    v4 = dlsym(v5, "glTexParameteri");
    v8[3] = (uint64_t)v4;
    getglTexParameteriSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
    _SUUIglTexParameteri_cold_1();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v4)(3553, a1, a2);
}

void sub_241D7AD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id _SUUIOffscreenRenderOperationGetRendererStackAccessQueue()
{
  if (_SUUIOffscreenRenderOperationGetRendererStackAccessQueue_sOnceToken != -1)
    dispatch_once(&_SUUIOffscreenRenderOperationGetRendererStackAccessQueue_sOnceToken, &__block_literal_global_81);
  return (id)_SUUIOffscreenRenderOperationGetRendererStackAccessQueue_sRendererStacAccessQueue;
}

char *OUTLINED_FUNCTION_0()
{
  return dlerror();
}

void sub_241D7B37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double SUUIAttributedStringGetLineHeight(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  _QWORD v6[5];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  v2 = objc_msgSend(v1, "length");
  v3 = *MEMORY[0x24BEBB360];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __SUUIAttributedStringGetLineHeight_block_invoke;
  v6[3] = &unk_2511FA5D0;
  v6[4] = &v7;
  objc_msgSend(v1, "enumerateAttribute:inRange:options:usingBlock:", v3, 0, v2, 0, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_241D7B6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D7BF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_241D7D480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__50(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__50(uint64_t a1)
{

}

void sub_241D7E050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D7E4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D7E724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D7EAC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__51(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__51(uint64_t a1)
{

}

void sub_241D7F29C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D82200(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__52(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__52(uint64_t a1)
{

}

void sub_241D85C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D86190(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__53(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__53(uint64_t a1)
{

}

void sub_241D8810C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D88F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D899FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D89DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D8A08C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241D8A750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIXEventSearchDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", CFSTR("search"), CFSTR("type"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "setObject:forKey:", v3, CFSTR("term"));
  if (v4)
    objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("url"));

  return v6;
}

uint64_t SUUIXEventSidepackDictionary(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", CFSTR("sidePack"), CFSTR("type"), a1, CFSTR("sidePackData"), 0);
}

void sub_241D8BBAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D8EB48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__54(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__54(uint64_t a1)
{

}

void sub_241D8F654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__55(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__55(uint64_t a1)
{

}

void sub_241D8F740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D8F858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIFontForTextStyle(uint64_t a1)
{
  return _SUUIFontDescriptorGetFontForTextStyle(a1, (void *)*MEMORY[0x24BEBE0B8]);
}

id _SUUIFontDescriptorGetFontForTextStyle(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  _SUUIFontDescriptorCacheKey *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[2];
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = a1 - 1;
  v5 = 0;
  v6 = 1.0;
  v7 = 1;
  v8 = (uint64_t *)MEMORY[0x24BDC4F60];
  switch(v4)
  {
    case 0:
      goto LABEL_34;
    case 1:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4FA0];
      goto LABEL_34;
    case 2:
      v5 = 0;
      goto LABEL_7;
    case 3:
      v7 = 0;
      v5 = 0x8000;
LABEL_7:
      v8 = (uint64_t *)MEMORY[0x24BDC4F68];
      goto LABEL_34;
    case 4:
      v5 = 0;
      goto LABEL_10;
    case 5:
      v7 = 0;
      v5 = 0x8000;
LABEL_10:
      v8 = (uint64_t *)MEMORY[0x24BDC4F70];
      goto LABEL_34;
    case 6:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4FA8];
      goto LABEL_34;
    case 7:
      v5 = 0;
      goto LABEL_14;
    case 8:
      v7 = 0;
      v5 = 0x8000;
LABEL_14:
      v8 = (uint64_t *)MEMORY[0x24BDC4F78];
      goto LABEL_34;
    case 9:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4F78];
      v6 = 0.909090909;
      goto LABEL_34;
    case 10:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4F80];
      goto LABEL_34;
    case 11:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4FB0];
      goto LABEL_34;
    case 12:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4F90];
      goto LABEL_34;
    case 13:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4FB8];
      goto LABEL_34;
    case 14:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4FD0];
      goto LABEL_34;
    case 15:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4FC8];
      goto LABEL_34;
    case 16:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4FC0];
      goto LABEL_34;
    case 17:
      v5 = 0;
      goto LABEL_25;
    case 18:
    case 19:
      v7 = 0;
      v5 = 0x8000;
      goto LABEL_25;
    case 20:
      v7 = 0;
      v5 = 0x10000;
LABEL_25:
      v8 = (uint64_t *)MEMORY[0x24BDC4FC8];
      v6 = 0.933333333;
      goto LABEL_34;
    case 21:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4F90];
      v6 = 2.05882353;
      goto LABEL_34;
    case 22:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4F90];
      v6 = 1.35294118;
      goto LABEL_34;
    case 23:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4F90];
      v6 = 1.29411765;
      goto LABEL_34;
    case 24:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4F90];
      v6 = 1.17647059;
      goto LABEL_34;
    case 25:
      v5 = 0;
      goto LABEL_31;
    case 26:
    case 27:
      v7 = 0;
      v5 = 0x8000;
LABEL_31:
      v8 = (uint64_t *)MEMORY[0x24BDC4F90];
      v6 = 1.05882353;
      goto LABEL_34;
    case 28:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4FE0];
      goto LABEL_34;
    case 29:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x24BDC4FE8];
LABEL_34:
      v9 = *v8;
      if (!*v8)
        goto LABEL_44;
      if (_SUUIFontDescriptorGetCache_onceToken != -1)
        dispatch_once(&_SUUIFontDescriptorGetCache_onceToken, &__block_literal_global_37);
      v10 = (id)_SUUIFontDescriptorGetCache_fontDescriptorCache;
      v11 = -[_SUUIFontDescriptorCacheKey initWithTextStyle:sizeCategory:]([_SUUIFontDescriptorCacheKey alloc], "initWithTextStyle:sizeCategory:", v9, v3);
      objc_msgSend(v10, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v13 = (void *)CTFontDescriptorCreateWithTextStyle();
        v14 = v13;
        if ((v7 & 1) == 0)
        {
          objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", v5);
          v15 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v15;
        }
        v29 = *MEMORY[0x24BEBB548];
        v16 = *MEMORY[0x24BEBB598];
        v26[0] = *MEMORY[0x24BEBB5A0];
        v26[1] = v16;
        v27[0] = &unk_2512EEBF8;
        v27[1] = &unk_2512EEC10;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v17;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v28, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "fontDescriptorByAddingAttributes:", v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setObject:forKey:", v12, v11);
      }
      v20 = 0.0;
      if (fabs(v6) >= 2.22044605e-16)
      {
        objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BEBB560]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "floatValue");
        v23 = v6 * v22;
        v20 = ceilf(v23);

      }
      objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v12, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
LABEL_44:
      v24 = 0;
      break;
  }

  return v24;
}

id SUUIFontLimitedPreferredFontForTextStyle(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  id *v9;
  uint64_t v10;
  id v11;
  uint64_t i;
  void *v13;
  _QWORD v15[14];

  v15[13] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  v7 = (void *)*MEMORY[0x24BEBE0B8];
  v8 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE0B8]);
  v9 = (id *)MEMORY[0x24BEBE0C0];
  if ((v8 & 1) != 0)
  {
    v10 = 4;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE0C0]) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE0A0]) & 1) != 0)
  {
    v10 = 5;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE0D0]) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE098]) & 1) != 0)
  {
    v10 = 6;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE090]) & 1) != 0)
  {
    v10 = 7;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE0A8]) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE078]) & 1) != 0)
  {
    v10 = 8;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE070]) & 1) != 0)
  {
    v10 = 9;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE068]) & 1) != 0)
  {
    v10 = 10;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE060]) & 1) != 0)
  {
    v10 = 11;
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEBE058]))
  {
    v10 = 12;
  }
  else
  {
    v10 = 4;
  }

  if (v10 <= a2)
  {
    v11 = v6;
  }
  else
  {
    v15[0] = 0;
    v15[1] = (id)*MEMORY[0x24BEBE0A8];
    v15[2] = (id)*MEMORY[0x24BEBE0D0];
    v15[3] = *v9;
    v15[4] = v7;
    v15[5] = (id)*MEMORY[0x24BEBE0A0];
    v15[6] = (id)*MEMORY[0x24BEBE098];
    v15[7] = (id)*MEMORY[0x24BEBE090];
    v15[8] = (id)*MEMORY[0x24BEBE078];
    v15[9] = (id)*MEMORY[0x24BEBE070];
    v15[10] = (id)*MEMORY[0x24BEBE068];
    v15[11] = (id)*MEMORY[0x24BEBE060];
    v15[12] = (id)*MEMORY[0x24BEBE058];
    v11 = (id)v15[a2];
    for (i = 12; i != -1; --i)

  }
  _SUUIFontDescriptorGetFontForTextStyle(a1, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id SUUIFontPreferredFontForTextStyle(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  _SUUIFontDescriptorGetFontForTextStyle(a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_241D90A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__56(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__56(uint64_t a1)
{

}

id SUUIErrorDocumentTitle(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.AppStore")) & 1) != 0)
  {
    v4 = CFSTR("CANNOT_CONNECT_TO_APP_STORE");
    if (!v1)
      goto LABEL_11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.iBooks")) & 1) != 0)
  {
    v4 = CFSTR("CANNOT_CONNECT_TO_IBOOKS_STORE");
    if (!v1)
    {
LABEL_11:
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", v4, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
      v4 = CFSTR("CANNOT_CONNECT_TO_IMESSAGE_STORE");
    else
      v4 = CFSTR("CANNOT_CONNECT_TO_ITUNES_STORE");
    if (!v1)
      goto LABEL_11;
  }
  objc_msgSend(v1, "localizedStringForKey:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v6 = (void *)v5;

  return v6;
}

void sub_241D92838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__57(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__57(uint64_t a1)
{

}

void sub_241D931A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D93304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__58(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__58(uint64_t a1)
{

}

void sub_241D944A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D94A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241D94E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__59(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__59(uint64_t a1)
{

}

void *__Block_byref_object_copy__60(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__60(uint64_t a1)
{

}

void sub_241D95774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void SUUIInitializeViewElementFactory()
{
  if (SUUIInitializeViewElementFactory_sOnce != -1)
    dispatch_once(&SUUIInitializeViewElementFactory_sOnce, &__block_literal_global_38);
}

void sub_241D99C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__61(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__61(uint64_t a1)
{

}

void _telephonyNotification(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __CFString *v17;

  v6 = (void *)SUUICoreTelephonyFramework();
  v7 = *(const void **)SUUIWeakLinkedSymbolForString("kCTRegistrationOperatorNameChangedNotification", v6);
  v8 = *(const void **)SUUIWeakLinkedSymbolForString("kCTRegistrationDisplayStatusChangedNotification", v6);
  v9 = *(const void **)SUUIWeakLinkedSymbolForString("kCTRegistrationStatusChangedNotification", v6);
  v10 = *(const void **)SUUIWeakLinkedSymbolForString("kCTSettingPhoneNumberChangedNotification", v6);
  if (CFEqual(a2, v7))
  {
    v11 = CFSTR("onOperatorChange");
LABEL_6:
    v12 = a4;
    objc_msgSend(v12, "appContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = ___telephonyNotification_block_invoke;
    v15[3] = &unk_2511FA190;
    v16 = v12;
    v17 = (__CFString *)v11;
    v14 = v12;
    objc_msgSend(v13, "evaluate:completionBlock:", v15, 0);

    return;
  }
  if (CFEqual(a2, v9) || CFEqual(a2, v8))
  {
    v11 = CFSTR("onRegistrationChange");
    goto LABEL_6;
  }
  if (CFEqual(a2, v10))
  {
    v11 = CFSTR("onPhoneNumberChange");
    goto LABEL_6;
  }
}

id ___telephonyNotification_block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "invokeMethod:withArguments:", *(_QWORD *)(a1 + 40), 0);
}

void sub_241D9C728(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 120), 8);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_241D9C894(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241D9CF94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241D9D178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DA01B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
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

void sub_241DA03A8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241DA05F8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_241DA0834(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id SUUIMessageBannerAttributedString(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x24BEBB490]);
  objc_msgSend(v5, "setAlignment:", 1);
  objc_msgSend(v5, "setLineBreakMode:", 4);
  v23[0] = *MEMORY[0x24BEBB360];
  v6 = v23[0];
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BEBB368];
  v24[0] = v7;
  v24[1] = v4;
  v9 = *MEMORY[0x24BEBB3A8];
  v23[1] = v8;
  v23[2] = v9;
  v24[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v6;
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v21[1] = v8;
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v9;
  v22[1] = v12;
  v22[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("ASK_PERMISSION_MESSAGE"), CFSTR("ProductPage"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ASK_PERMISSION_MESSAGE"), 0, CFSTR("ProductPage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("ASK_PERMISSION_MESSAGE_HIGHLIGHT"), CFSTR("ProductPage"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ASK_PERMISSION_MESSAGE_HIGHLIGHT"), 0, CFSTR("ProductPage"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v14, CFSTR("%@"), 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v16, v13);
  v18 = objc_msgSend(v16, "rangeOfString:", v15);
  objc_msgSend(v17, "setAttributes:range:", v10, v18, v19);

  return v17;
}

void sub_241DA487C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DA594C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DA6644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DA77F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_241DA7E00(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

id SUUIReuseIdentifierForView(void *a1)
{
  return objc_getAssociatedObject(a1, "com.apple.iTunesStoreUI.viewReuse.ID");
}

void sub_241DA8448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _SUUIErrorFromError(void *a1)
{
  id v1;
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SUUIMacErrorDomain"));

  if (v3)
  {
    v4 = objc_msgSend(v1, "code");
    if (v4 == 2)
      v5 = 7;
    else
      v5 = 4 * (v4 == 1);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v1, *MEMORY[0x24BDD1398]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SUUIErrorDomain"), v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v1;
  }

  return v7;
}

uint64_t SUUILabelViewStyleForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("title")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("subtitle")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("notice")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("description")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("navigationTitle")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_241DAA444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__62(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__62(uint64_t a1)
{

}

id SUUILabelStringAttributesWithSpanElement(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "style");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  SUUIViewElementFontWithStyle(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v2, "setObject:forKey:", v3, *MEMORY[0x24BEBB360]);
  objc_msgSend(v1, "ikColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v2, "setObject:forKey:", v5, *MEMORY[0x24BEBB368]);
  if (!objc_msgSend(v2, "count"))
  {

    v2 = 0;
  }

  return v2;
}

void sub_241DAF218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__63(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__63(uint64_t a1)
{

}

void sub_241DAFE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DB0554(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

double SUUILockupImageSizeForLockupSize(unint64_t a1, uint64_t a2)
{
  double *v2;

  if (a2 == 2 || a2 == 6)
  {
    if (a1 < 6)
    {
      v2 = (double *)&unk_241EFC650;
      return v2[a1];
    }
    return 120.0;
  }
  else if (a2 == 8)
  {
    if (a1 < 6)
    {
      v2 = (double *)&unk_241EFC5F0;
      return v2[a1];
    }
    return 175.0;
  }
  else
  {
    if (a1 <= 5)
    {
      v2 = (double *)&unk_241EFC680;
      return v2[a1];
    }
    return 125.0;
  }
}

uint64_t SUUILockupImageStyleForItemKind(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 6)
    return 0;
  else
    return qword_241EFC6B0[a1 - 2];
}

void sub_241DB4038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DB5770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DB5B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIGiftAmountButtonsWithAmounts(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SUUIGiftAmountButton *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = objc_alloc_init(SUUIGiftAmountButton);
        objc_msgSend(v8, "displayLabel", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIGiftAmountButton setTitle:forState:](v9, "setTitle:forState:", v10, 0);

        -[SUUIGiftAmountButton sizeToFit](v9, "sizeToFit");
        objc_msgSend(v2, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

void sub_241DB6868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DB8E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__64(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__64(uint64_t a1)
{

}

void sub_241DB901C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_241DB9D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DBA9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DBB7B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__65(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__65(uint64_t a1)
{

}

CGFloat CGRectWithFlippedOriginRelativeToBoundingRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v14;
  CGRect v16;
  CGRect v17;

  v16.origin.x = a5;
  v16.origin.y = a6;
  v16.size.width = a7;
  v16.size.height = a8;
  v14 = a1 - CGRectGetMinX(v16);
  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.width = a7;
  v17.size.height = a8;
  return CGRectGetMaxX(v17) - v14 - a3;
}

uint64_t SUUIItemCollectionItemPageRangeForCollectionView(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a1;
  objc_msgSend(v5, "indexPathForItemAtPoint:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "collectionViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v7, "itemSize");
    objc_msgSend(v5, "bounds");
    objc_msgSend(v7, "itemSize");
    v8 = objc_msgSend(v6, "item");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t SUUIItemCollectionItemPageRangeForTableView(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;

  v5 = a1;
  objc_msgSend(v5, "indexPathForRowAtPoint:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "item");
    v9 = v8 & ~(v8 >> 63);
    objc_msgSend(v5, "rowHeight");
    if (v10 > 0.0)
    {
      objc_msgSend(v5, "bounds");
      objc_msgSend(v5, "rowHeight");
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t SUUIItemCollectionVisibleItemRangeForCollectionView(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "indexPathsForVisibleItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      v6 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "item", (_QWORD)v10);
          if (v6 >= v8)
            v6 = v8;
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }
    else
    {
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    }

    objc_msgSend(v2, "count");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t SUUIItemCollectionVisibleItemRangeForTableView(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "indexPathsForVisibleRows");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      v6 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "row", (_QWORD)v10);
          if (v6 >= v8)
            v6 = v8;
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }
    else
    {
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    }

    objc_msgSend(v2, "count");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_241DBEF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DBF4B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__66(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__66(uint64_t a1)
{

}

void SUUIConfigureDownloadsCellView(void *a1, void *a2, void *a3, unsigned int a4, void *a5)
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  _QWORD v36[2];
  _QWORD v37[2];
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v38 = *MEMORY[0x24BEBB360];
  v9 = v38;
  v10 = (void *)MEMORY[0x24BEBB520];
  v33 = a5;
  v34 = a3;
  v11 = a1;
  objc_msgSend(v10, "systemFontOfSize:", 14.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v12;
  v39 = *MEMORY[0x24BEBB368];
  v13 = v39;
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v38, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v36[0] = v9;
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v13;
  v37[0] = v16;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc_init(MEMORY[0x24BDD1688]);
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BEB2470]);
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v20, v15);
    objc_msgSend(v19, "appendAttributedString:", v21);

  }
  v32 = (void *)v20;
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BEB2328]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = objc_alloc(MEMORY[0x24BDD1458]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" – %@"), v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithString:attributes:", v24, v18);
    objc_msgSend(v19, "appendAttributedString:", v25);

  }
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BEB2360]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BEB2348]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "BOOLValue"))
    v28 = objc_msgSend(v26, "isEqual:", *MEMORY[0x24BEB22F8]);
  else
    v28 = 0;

  if ((objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BEB2300]) & 1) != 0)
  {
    v29 = 2;
  }
  else if (objc_msgSend(v26, "isEqualToString:", *MEMORY[0x24BEB2318]))
  {
    v29 = 2;
  }
  else
  {
    v29 = v28;
  }
  objc_msgSend(v11, "setAttributedTitle:", v19);
  SUUIDownloadsStatusString(v8, v33);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setSubtitle:", v30);
  objc_msgSend(v8, "valueForExternalProperty:", *MEMORY[0x24BEB2270]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "doubleValue");
  objc_msgSend(v11, "setProgress:");

  objc_msgSend(v11, "setImage:", v34);
  objc_msgSend(v11, "setButtonType:", v29);
  objc_msgSend(v11, "setIsPad:", a4);

}

id SUUIDownloadsStatusString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  BOOL v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BEB2360]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB2300]))
  {
    objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BEB2370]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
    {
      if (v4)
      {
        v6 = CFSTR("RESTRICTED");
        goto LABEL_14;
      }
      v9 = CFSTR("RESTRICTED");
LABEL_20:
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v9, 0, CFSTR("Download"));
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB2318]))
    {
      if (v4)
      {
        v6 = CFSTR("TAP_TO_RESUME");
        goto LABEL_14;
      }
      v9 = CFSTR("TAP_TO_RESUME");
      goto LABEL_20;
    }
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB2320]))
    {
      if (v4)
      {
        v6 = CFSTR("WAITING");
        goto LABEL_14;
      }
      v9 = CFSTR("WAITING");
      goto LABEL_20;
    }
    objc_msgSend(v3, "valueForExternalProperty:", *MEMORY[0x24BEB2278]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      v12 = v11;
LABEL_43:
      v13 = v12;
LABEL_44:

      goto LABEL_22;
    }
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEB22F8]) & 1) == 0)
      goto LABEL_34;
    objc_msgSend(v3, "valueForExternalProperty:", *MEMORY[0x24BEB2258]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "longLongValue");

    objc_msgSend(v3, "valueForExternalProperty:", *MEMORY[0x24BEB2260]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "longLongValue");

    objc_msgSend(v3, "valueForExternalProperty:", *MEMORY[0x24BEB2270]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

    v22 = v16 < 1 || v18 < 1;
    if (v22 && v21 < 0.01)
    {
      if (v4)
      {
        v23 = CFSTR("UNKNOWN_PROGRESS");
LABEL_36:
        objc_msgSend(v4, "localizedStringForKey:inTable:", v23, CFSTR("Download"));
        v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      v24 = CFSTR("UNKNOWN_PROGRESS");
      goto LABEL_42;
    }
    if (v16 >= v18 && v21 >= 1.0)
    {
LABEL_34:
      if (v4)
      {
        v23 = CFSTR("PROCESSING_DOWNLOAD");
        goto LABEL_36;
      }
      v24 = CFSTR("PROCESSING_DOWNLOAD");
LABEL_42:
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v24, 0, CFSTR("Download"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    objc_msgSend(v3, "valueForExternalProperty:", *MEMORY[0x24BEB2268]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doubleValue");
    v27 = v26;

    if (v27 < 0.0)
    {
      if (v4)
        objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("DATA_PROGRESS"), CFSTR("Download"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("DATA_PROGRESS"), 0, CFSTR("Download"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x24BDD17C8];
      CPFSSizeStrings();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      CPFSSizeStrings();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithValidatedFormat:validFormatSpecifiers:error:", v28, CFSTR("%@%@"), 0, v30, v31);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_44;
    }
    if ((v16 & ~(v16 >> 63)) > v18)
      v18 = v16 & ~(v16 >> 63);
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("TIME_FORMAT"), CFSTR("Download"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("TIME_FORMAT"), 0, CFSTR("Download"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v32, CFSTR("%d%d"), 0, v27 / 0x3CuLL, v27 % 0x3C);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 < 1 || !v18)
    {
      if (v4)
        objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("PERCENTAGE_PROGRESS"), CFSTR("Download"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PERCENTAGE_PROGRESS"), 0, CFSTR("Download"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v38, CFSTR("%ld%@"), 0, (uint64_t)(v21 * 100.0), v33);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_68;
    }
    v43 = v32;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "userInterfaceIdiom");

    if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if (v4)
      {
        v36 = CFSTR("TIME_PROGRESS_LONG");
LABEL_61:
        objc_msgSend(v4, "localizedStringForKey:inTable:", v36, CFSTR("Download"));
        v37 = objc_claimAutoreleasedReturnValue();
LABEL_67:
        v38 = (void *)v37;
        v40 = (void *)MEMORY[0x24BDD17C8];
        CPFSSizeStrings();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        CPFSSizeStrings();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithValidatedFormat:validFormatSpecifiers:error:", v38, CFSTR("%@%@%@"), 0, v41, v42, v33);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = v43;
LABEL_68:

        goto LABEL_44;
      }
      v39 = CFSTR("TIME_PROGRESS_LONG");
    }
    else
    {
      if (v4)
      {
        v36 = CFSTR("TIME_PROGRESS");
        goto LABEL_61;
      }
      v39 = CFSTR("TIME_PROGRESS");
    }
    +[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", v39, 0, CFSTR("Download"));
    v37 = objc_claimAutoreleasedReturnValue();
    goto LABEL_67;
  }
  if (!v4)
  {
    v9 = CFSTR("DOWNLOAD_ERROR");
    goto LABEL_20;
  }
  v6 = CFSTR("DOWNLOAD_ERROR");
LABEL_14:
  objc_msgSend(v4, "localizedStringForKey:inTable:", v6, CFSTR("Download"));
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_21:
  v13 = (void *)v10;
LABEL_22:

  return v13;
}

void sub_241DC3588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__67(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__67(uint64_t a1)
{

}

void sub_241DC4D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIGetFamilyMemberImage(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  int v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v7)
    v12 = v8 == 0;
  else
    v12 = 1;
  v13 = !v12;
  if (v12 && !v9 && !v10)
    goto LABEL_13;
  v14 = SUUIAppleAccountUIFramework();
  v15 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("AAUIProfilePictureStore"), v14));
  objc_msgSend(v15, "setPictureStyle:", 0);
  objc_msgSend(v15, "setPictureDiameter:", 60.0);
  if (!v15)
    goto LABEL_13;
  v16 = SUUIAppleAccountFramework();
  v17 = objc_alloc_init((Class)SUUIWeakLinkedClassForString(CFSTR("AAFamilyMember"), v16));
  objc_msgSend(v17, "setFirstName:", v7);
  objc_msgSend(v17, "setLastName:", v8);
  objc_msgSend(v17, "setPersonID:", v11);
  objc_msgSend(v17, "setAppleID:", v9);
  objc_msgSend(v15, "profilePictureForFamilyMember:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_13:
    v19 = SUUIContactsUIFramework();
    v20 = (void *)objc_msgSend(objc_alloc((Class)SUUIWeakLinkedClassForString(CFSTR("CNMonogrammer"), v19)), "initWithStyle:diameter:", 0, 60.0);
    v21 = v20;
    if (v13)
      objc_msgSend(v20, "monogramForPersonWithFirstName:lastName:", v7, v8);
    else
      objc_msgSend(v20, "silhouetteMonogram");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

void sub_241DC7DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUICacheCodingDecodeArray(void *a1, objc_class *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [a2 alloc];
        v12 = (void *)objc_msgSend(v11, "initWithCacheRepresentation:", v10, (_QWORD)v14);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

id SUUICacheCodingEncodeArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "cacheRepresentation", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

void SUUICollectionViewUpdatePerspectiveCells(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[6];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v3, "indexPathsForVisibleItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v4, "containsIndex:", objc_msgSend(v11, "section")))
          {
            objc_msgSend(v3, "cellForItemAtIndexPath:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v5, "addObject:", v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_msgSend(v3, "visibleCells");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "bounds");
  x = v39.origin.x;
  y = v39.origin.y;
  width = v39.size.width;
  height = v39.size.height;
  MidX = CGRectGetMidX(v39);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  MidY = CGRectGetMidY(v40);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __SUUICollectionViewUpdatePerspectiveCells_block_invoke;
  v31[3] = &__block_descriptor_48_e55_q24__0__UICollectionViewCell_8__UICollectionViewCell_16l;
  *(CGFloat *)&v31[4] = MidX;
  *(CGFloat *)&v31[5] = MidY;
  objc_msgSend(v5, "sortedArrayWithOptions:usingComparator:", 0, v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        if (objc_msgSend(v25, "conformsToProtocol:", &unk_2571FE3F0, (_QWORD)v27))
        {
          objc_msgSend(v25, "updateForChangedDistanceFromVanishingPoint");
          objc_msgSend(v25, "superview");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "sendSubviewToBack:", v25);

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v22);
  }

}

void sub_241DCB62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__68(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__68(uint64_t a1)
{

}

void sub_241DCE56C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DCF4E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double SUUITextLayoutSizeForCTFrame(const __CTFrame *a1, CFIndex a2)
{
  const CGPath *Path;
  double width;
  const __CFArray *Lines;
  CFIndex Count;
  CFIndex v8;
  const __CTLine *ValueAtIndex;
  float v10;
  CGPoint v12;
  CGPoint origins;
  CFRange v14;
  CFRange v15;
  CGRect BoundingBox;

  Path = CTFrameGetPath(a1);
  BoundingBox = CGPathGetBoundingBox(Path);
  width = BoundingBox.size.width;
  Lines = CTFrameGetLines(a1);
  Count = CFArrayGetCount(Lines);
  if (a2 && Count > a2)
  {
    origins.x = 0.0;
    origins.y = 0.0;
    v12.x = 0.0;
    v12.y = 0.0;
    v14.location = 0;
    v14.length = 1;
    CTFrameGetLineOrigins(a1, v14, &v12);
    v8 = a2 - 1;
    v15.location = v8;
    v15.length = 1;
    CTFrameGetLineOrigins(a1, v15, &origins);
    ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v8);
    CTLineGetBoundsWithOptions(ValueAtIndex, 0x14uLL);
  }
  v10 = width;
  return ceilf(v10);
}

uint64_t SUUIStatusBarAlertStyleFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("information")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("success")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("failure")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("other")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id SUUIStatusBarAlertStyleGetColor(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  switch((unint64_t)a1)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor", v1, v2);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemGreenColor", v1, v2);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor", v1, v2);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemPurpleColor", v1, v2);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

void sub_241DD37D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__69(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__69(uint64_t a1)
{

}

void sub_241DD3928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SUUIShareSheetActivityTypeForUIActivityType(void *a1)
{
  id v1;
  __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7470]) & 1) != 0)
  {
    v2 = CFSTR("airdrop");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF74A8]) & 1) != 0)
  {
    v2 = CFSTR("facebook");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7488]) & 1) != 0)
  {
    v2 = CFSTR("mail");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7498]) & 1) != 0)
  {
    v2 = CFSTR("message");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF7480]) & 1) != 0)
  {
    v2 = CFSTR("pasteboard");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF74D0]) & 1) != 0)
  {
    v2 = CFSTR("sina-weibo");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDF74B8]) & 1) != 0)
  {
    v2 = CFSTR("tencent-weibo");
  }
  else
  {
    v2 = (__CFString *)v1;
  }

  return v2;
}

void sub_241DD4704(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_241DD4BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_241DD5AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DD9480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DD982C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Block_object_dispose((const void *)(v39 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__70(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__70(uint64_t a1)
{

}

SUUIMessageBanner *SUUIFamilyAlertMessageBanner(void *a1, void *a2, uint64_t *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  SUUIMessageBanner *v57;
  void *v58;
  void *v59;
  uint64_t v61;
  void *v62;
  unsigned int v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v70;
  id v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  int v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v71 = a2;
  +[SUUIFamilyCircleController sharedController](SUUIFamilyCircleController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iCloudFamily");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v5;
  objc_msgSend(v5, "familyCircle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeAccount");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  objc_msgSend(v6, "members");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v97, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v74 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        if (objc_msgSend(v15, "isMe"))
        {
          v16 = v15;

          v12 = v16;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v97, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  *a3 = 0;
  v67 = v4;
  if (!v7)
  {
    objc_msgSend(v6, "members");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (!v22)
      goto LABEL_21;
    objc_msgSend(v12, "iTunesAccountDSID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "uniqueIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if ((v25 & 1) == 0)
    {
      *a3 = 1;
LABEL_36:
      if (v4)
        objc_msgSend(v4, "localizedStringForKey:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH"), 0);
      v29 = objc_claimAutoreleasedReturnValue();
      if (v4)
        objc_msgSend(v4, "localizedStringForKey:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH_HIGHLIGHT"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH_HIGHLIGHT"), 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%@"), 0, v68);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      goto LABEL_48;
    }
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLForKey:", CFSTR("SUUIUserDefaultsKeyHideFamilyBanner"));

    if ((v27 & 1) != 0)
      goto LABEL_21;
    goto LABEL_27;
  }
  if (!v6 || !v12)
    goto LABEL_21;
  objc_msgSend(v12, "iTunesAccountDSID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_27:
    *a3 = 3;
    goto LABEL_28;
  }
  objc_msgSend(v12, "iTunesAccountDSID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19);

  if ((v20 & 1) == 0)
  {
    *a3 = 2;
LABEL_25:
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH_2"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH_2"), 0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH_2_HIGHLIGHT"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH_2_HIGHLIGHT"), 0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "appleID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)v30;
    objc_msgSend(v31, "stringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%@%@"), 0, v32, v30);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = 0;
    *a3 = 2;
    goto LABEL_48;
  }
LABEL_21:
  v28 = *a3;
  if (*a3 != 3)
  {
    if (v28 == 2)
      goto LABEL_25;
    if (v28 != 1)
    {
      v63 = 0;
      v64 = 0;
      v68 = 0;
      v29 = 0;
      goto LABEL_48;
    }
    goto LABEL_36;
  }
LABEL_28:
  if (v4)
    objc_msgSend(v4, "localizedStringForKey:", CFSTR("PURCHASED_FAMILY_SETUP_INCOMPLETE"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("PURCHASED_FAMILY_SETUP_INCOMPLETE"), 0);
  v29 = objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v4, "localizedStringForKey:", CFSTR("PURCHASED_FAMILY_SETUP_INCOMPLETE_HIGHLIGHT"));
  else
    +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("PURCHASED_FAMILY_SETUP_INCOMPLETE_HIGHLIGHT"), 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%@"), 0, v68);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = 3;
  v63 = 1;
LABEL_48:
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "shouldLog");
  if (objc_msgSend(v33, "shouldLogToDisk"))
    v34 |= 2u;
  objc_msgSend(v33, "OSLogObject");
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    v36 = v34;
  else
    v36 = v34 & 2;
  v65 = v6;
  if (v36)
  {
    objc_msgSend(v6, "members");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v29;
    v38 = objc_msgSend(v62, "count");
    objc_msgSend(v12, "iTunesAccountDSID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "uniqueIdentifier");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = *a3;
    v81 = 138414082;
    v82 = v7;
    v83 = 2112;
    v84 = v6;
    v85 = 2048;
    v86 = v38;
    v29 = v37;
    v87 = 2112;
    v88 = v12;
    v89 = 2112;
    v90 = v39;
    v91 = 2112;
    v92 = v72;
    v93 = 2112;
    v94 = v40;
    v42 = (void *)v40;
    v95 = 2048;
    v96 = v41;
    LODWORD(v61) = 82;
    v43 = (void *)_os_log_send_and_compose_impl();

    if (!v43)
      goto LABEL_57;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v43, 4, &v81, v61);
    v35 = objc_claimAutoreleasedReturnValue();
    free(v43);
    SSFileLog();
  }

LABEL_57:
  v70 = (void *)v29;
  if (v29)
  {
    v44 = objc_alloc_init(MEMORY[0x24BEBB490]);
    objc_msgSend(v44, "setAlignment:", 1);
    objc_msgSend(v44, "setLineBreakMode:", 4);
    v79[0] = *MEMORY[0x24BEBB360];
    v45 = v79[0];
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *MEMORY[0x24BEBB368];
    v80[0] = v46;
    v80[1] = v71;
    v48 = *MEMORY[0x24BEBB3A8];
    v79[1] = v47;
    v79[2] = v48;
    v80[2] = v44;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v77[0] = v45;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v50;
    v77[1] = v47;
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v48;
    v78[1] = v51;
    v78[2] = v44;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v64;
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v64, v52);
    v55 = objc_msgSend(v64, "rangeOfString:", v68);
    objc_msgSend(v54, "setAttributes:range:", v49, v55, v56);

    if (v54)
    {
      v57 = objc_alloc_init(SUUIMessageBanner);
      -[SUUIMessageBanner setAttributedMessage:](v57, "setAttributedMessage:", v54);
      -[SUUIMessageBanner setShowsClearButton:](v57, "setShowsClearButton:", v63);
    }
    else
    {
      v57 = 0;
    }
    v58 = v67;
    v59 = v65;
  }
  else
  {
    v54 = 0;
    v57 = 0;
    v58 = v67;
    v53 = v64;
    v59 = v65;
  }

  return v57;
}

unint64_t SUUIPageForCollectionView(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;

  v1 = a1;
  objc_msgSend(v1, "contentOffset");
  v3 = v2;
  objc_msgSend(v1, "frame");
  v5 = v4;

  return llround(v3 / v5);
}

void sub_241DDB2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DDB8B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__71(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__71(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__3_0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4_0(uint64_t a1)
{

}

void sub_241DDCCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_241DDD290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__72(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__72(uint64_t a1)
{

}

void SUUIConsoleLogFormat(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;

  v17 = &a9;
  v10 = (objc_class *)MEMORY[0x24BDD17C8];
  v11 = a2;
  v12 = a1;
  v13 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __SUUIConsoleLogFormat_block_invoke;
  v15[3] = &unk_2511F61F8;
  v16 = v13;
  v14 = v13;
  objc_msgSend(v12, "evaluate:completionBlock:", v15, 0);

}

void SUUIConsoleLogObjects(void *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __SUUIConsoleLogObjects_block_invoke;
  v5[3] = &unk_2511F61F8;
  v6 = v3;
  v4 = v3;
  objc_msgSend(a1, "evaluate:completionBlock:", v5, 0);

}

void sub_241DDF400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

uint64_t SUUIProductPageFragmentWithURL(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "fragment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("reviews")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("related")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_241DE3584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DE3C44(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241DE46E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__73(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__73(uint64_t a1)
{

}

void SUUINavigationBarController_SetTitleView(void *a1, void *a2)
{
  id v3;
  objc_class *v4;
  objc_method *InstanceMethod;
  IMP Implementation;
  id v7;

  v3 = a2;
  v7 = a1;
  v4 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v4, sel_setTitleView_);
  Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(id, char *, id))Implementation)(v7, sel_setTitleView_, v3);

}

uint64_t storeShouldReverseLayoutDirection()
{
  if (didSetAtLeastOnce != -1)
    dispatch_once(&didSetAtLeastOnce, &__block_literal_global_49);
  return shouldFlipForRTL;
}

CGFloat SUUIRectByApplyingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  return _SUUIRectByApplyingUserInterfaceLayoutDirectionDependentOnStore(0, a1, a2, a3, a4, a5, a6, a7, a8);
}

CGFloat _SUUIRectByApplyingUserInterfaceLayoutDirectionDependentOnStore(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double MaxX;
  double v18;
  double v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  if (a1)
  {
    if (didSetAtLeastOnce != -1)
      dispatch_once(&didSetAtLeastOnce, &__block_literal_global_49);
    if (shouldFlipForRTL)
    {
LABEL_5:
      v21.origin.x = a6;
      v21.origin.y = a7;
      v21.size.width = a8;
      v21.size.height = a9;
      MaxX = CGRectGetMaxX(v21);
      v22.origin.x = a2;
      v22.origin.y = a3;
      v22.size.width = a4;
      v22.size.height = a5;
      v18 = MaxX - CGRectGetMinX(v22);
      v23.origin.x = a2;
      v23.origin.y = a3;
      v23.size.width = a4;
      v23.size.height = a5;
      v19 = v18 - CGRectGetWidth(v23);
      v24.origin.x = a2;
      v24.origin.y = a3;
      v24.size.width = a4;
      v24.size.height = a5;
      CGRectGetMinY(v24);
      v25.origin.x = a2;
      v25.origin.y = a3;
      v25.size.width = a4;
      v25.size.height = a5;
      CGRectGetWidth(v25);
      v26.origin.x = a2;
      v26.origin.y = a3;
      v26.size.width = a4;
      v26.size.height = a5;
      CGRectGetHeight(v26);
      return v19;
    }
  }
  else
  {
    if (shouldReverseLayoutDirection_onceToken != -1)
      dispatch_once(&shouldReverseLayoutDirection_onceToken, &__block_literal_global_11_0);
    if (shouldReverseLayoutDirection_shouldFlipForRTL == 1)
      goto LABEL_5;
  }
  return a2;
}

CGFloat SUUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  return _SUUIRectByApplyingUserInterfaceLayoutDirectionDependentOnStore(1, a1, a2, a3, a4, a5, a6, a7, a8);
}

CGFloat SUUIRectByRemovingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  return _SUUIRectByRemovingUserInterfaceLayoutDirectionInRectDependendOnStore(0, a1, a2, a3, a4, a5, a6, a7, a8);
}

CGFloat _SUUIRectByRemovingUserInterfaceLayoutDirectionInRectDependendOnStore(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double MaxX;
  double v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  if (a1)
  {
    if (didSetAtLeastOnce != -1)
      dispatch_once(&didSetAtLeastOnce, &__block_literal_global_49);
    if (shouldFlipForRTL)
    {
LABEL_5:
      v20.origin.x = a6;
      v20.origin.y = a7;
      v20.size.width = a8;
      v20.size.height = a9;
      MaxX = CGRectGetMaxX(v20);
      v21.origin.x = a2;
      v21.origin.y = a3;
      v21.size.width = a4;
      v21.size.height = a5;
      v18 = MaxX - CGRectGetMaxX(v21);
      v22.origin.x = a2;
      v22.origin.y = a3;
      v22.size.width = a4;
      v22.size.height = a5;
      CGRectGetMinY(v22);
      v23.origin.x = a2;
      v23.origin.y = a3;
      v23.size.width = a4;
      v23.size.height = a5;
      CGRectGetWidth(v23);
      v24.origin.x = a2;
      v24.origin.y = a3;
      v24.size.width = a4;
      v24.size.height = a5;
      CGRectGetHeight(v24);
      return v18;
    }
  }
  else
  {
    if (shouldReverseLayoutDirection_onceToken != -1)
      dispatch_once(&shouldReverseLayoutDirection_onceToken, &__block_literal_global_11_0);
    if (shouldReverseLayoutDirection_shouldFlipForRTL == 1)
      goto LABEL_5;
  }
  return a2;
}

CGFloat SUUIRectByRemovingStoreUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  return _SUUIRectByRemovingUserInterfaceLayoutDirectionInRectDependendOnStore(1, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t __shouldReverseLayoutDirection_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t result;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "keyWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "semanticContentAttribute");

  result = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", v2);
  if (result == 1)
    shouldReverseLayoutDirection_shouldFlipForRTL = 1;
  return result;
}

void sub_241DE7DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__74(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__74(uint64_t a1)
{

}

void sub_241DE87E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DEA018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DEA3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DEBBB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  char a66;

  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Unwind_Resume(a1);
}

void sub_241DED58C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _Unwind_Resume(exception_object);
}

void sub_241DED940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DEDAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DEDC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DEDF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_241DEE440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__75(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__75(uint64_t a1)
{

}

void sub_241DEF308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DEFB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DF0E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__76(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__76(uint64_t a1)
{

}

void sub_241DF20B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DF27FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DF2C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DF2CC8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241DF2FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DF30B8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241DF3334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUITracklistAttributedStringForButton(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "buttonTitleStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v4, "style");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  SUUIViewElementFontWithStyle(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithName:size:", CFSTR("HelveticaNeue-Medium"), 9.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementPlainColorWithStyle(v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "buttonText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v10, v12, 1, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id SUUITracklistAttributedStringForLabel(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  SUUIViewElementPlainColorWithStyle(v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !v11)
  {
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = objc_msgSend(v6, "labelViewStyle");
  if (v12 > 5)
    goto LABEL_22;
  if (((1 << v12) & 0xB) != 0)
  {
    if (!v9)
    {
      SUUIFontPreferredFontForTextStyle(5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_14;
      goto LABEL_22;
    }
  }
  else
  {
    if (((1 << v12) & 0x24) == 0)
    {
      if (v9)
      {
        if (v11)
          goto LABEL_22;
      }
      else
      {
        SUUIFontPreferredFontForTextStyle(5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.8);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (!v9)
    {
      SUUIFontForTextStyle(21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BEBB520];
      objc_msgSend(v14, "pointSize");
      objc_msgSend(v15, "fontWithName:size:", CFSTR("HelveticaNeue-Medium"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_22;
      goto LABEL_14;
    }
  }
  if (!v11)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v11 = (void *)v13;
  }
LABEL_22:
  objc_msgSend(v6, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "attributedStringWithDefaultFont:foregroundColor:style:", v9, v11, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void sub_241DF3B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DF492C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__77(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__77(uint64_t a1)
{

}

void sub_241DF4B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DF4E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_241DF527C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DF5E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241DF7684(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241DF7AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241DFBAFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241DFC100(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_241DFC64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SUUITabBarControllerGetActiveNavigationController(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v24;

  v1 = a1;
  objc_msgSend(v1, "selectedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "transientViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!v2)
    {
      v9 = 0;
      goto LABEL_22;
    }
    SUUITabBarControllerGetMoreNavigationController(v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "allViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5
      && (v8 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v2), v8 >= objc_msgSend(v7, "indexOfObjectIdenticalTo:", v5)))
    {
      v21 = v5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v2;
        objc_msgSend(v9, "visibleViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v9, "visibleViewController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "childViewController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v14 = objc_opt_isKindOfClass();

          if ((v14 & 1) != 0)
          {
            objc_msgSend(v12, "childViewController");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "leftNavigationDocumentController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "navigationController");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "rightNavigationDocumentController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "navigationController");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = v18;
            if (v18 || (v19 = v24) != 0)
            {
              v20 = v19;

              v9 = v20;
            }

          }
        }
        goto LABEL_21;
      }
      objc_msgSend(v2, "navigationController");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v21;
LABEL_21:

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v4;
LABEL_22:
  v22 = v9;

  return v22;
}

id SUUITabBarControllerGetFloatingOverlayViewController(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "floatingOverlayViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void SUUITabBarControllerSetFloatingOverlayViewControllerAnimated(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v6 = a1;
  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "setFloatingOverlayViewController:animated:", v5, a3);
  }
  else if (v6 && v5)
  {
    NSLog(CFSTR("Error: trying to set a floating overlay view controller on a type of tab bar controller that doesn't support it: %@"), v6);
  }

}

void sub_241DFD8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SUUIIndexBarEntryDescriptorForIndexBarEntryViewElement(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SUUIArtwork *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  SUUIArtwork *v15;
  void *v16;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "elementType");
  if (v6 == 49)
  {
    objc_msgSend(v4, "resourceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (v13)
    {
      SUUIImageWithResourceName(v13);
      v9 = (SUUIArtwork *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v12 = 0;
        goto LABEL_11;
      }
      +[SUUIIndexBarEntryDescriptor entryDescriptorWithImage:](SUUIIndexBarEntryDescriptor, "entryDescriptorWithImage:", v9);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = [SUUIArtwork alloc];
      objc_msgSend(v4, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "size");
      v9 = -[SUUIArtwork initWithURL:size:](v15, "initWithURL:size:", v16);

      +[SUUIIndexBarEntryDescriptor entryDescriptorWithArtwork:](SUUIIndexBarEntryDescriptor, "entryDescriptorWithArtwork:", v9);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v14;
LABEL_11:

    goto LABEL_12;
  }
  if (v6 == 138)
  {
    objc_msgSend(v4, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementPlainColorWithStyle(v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "text");
    v9 = (SUUIArtwork *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementFontWithStyle(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIArtwork attributedStringWithDefaultFont:foregroundColor:](v9, "attributedStringWithDefaultFont:foregroundColor:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUIIndexBarEntryDescriptor entryDescriptorWithAttributedString:](SUUIIndexBarEntryDescriptor, "entryDescriptorWithAttributedString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:
  objc_msgSend(v12, "setVisibilityPriority:", objc_msgSend(v3, "visibilityPriority"));

  return v12;
}

void sub_241DFFE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E001F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E00D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_241E01154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id SUUIRequiredVisibilitySetForLocalizedIndexedCollation()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD738], "currentCollation");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sectionIndexTitles");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 3);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v10 = objc_msgSend(&unk_2512EEA48, "containsObject:", v9);
        if ((v10 & 1) != 0 || ((v6 ^ 1) & 1) != 0)
        {
          v6 |= v10 ^ 1;
          objc_msgSend(v2, "addObject:", v9);
        }
        else
        {
          v6 = 1;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v5);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "reverseObjectEnumerator", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
        v18 = objc_msgSend(&unk_2512EEA48, "containsObject:", v17);
        if ((v18 & 1) != 0 || ((v14 ^ 1) & 1) != 0)
        {
          v14 |= v18 ^ 1;
          objc_msgSend(v2, "addObject:", v17);
        }
        else
        {
          v14 = 1;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v13);
  }

  return v2;
}

uint64_t SUUIIndexBarIDForLocaleStandardIndexBarEntrySectionTitle(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("systemBucketID-%@"), a1);
}

void sub_241E05CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E05DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__78(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__78(uint64_t a1)
{

}

void sub_241E05FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E06FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__79(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__79(uint64_t a1)
{

}

void sub_241E07290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SUUIInitializeDOMFeatureFactory()
{
  if (SUUIInitializeDOMFeatureFactory_sOnce != -1)
    dispatch_once(&SUUIInitializeDOMFeatureFactory_sOnce, &__block_literal_global_51);
}

void SUUIRegisterDOMFeatureFactory(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "possibleFeatureNames");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(MEMORY[0x24BE51988], "registerClass:forFeatureName:", a1, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6++));
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }

  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x24BE51988];
    objc_msgSend(a1, "featureName");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerClass:forFeatureName:", a1);

  }
}

void sub_241E0C588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__80(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__80(uint64_t a1)
{

}

uint64_t SUUIArtworkSizeDeltaIsBetter(uint64_t a1, uint64_t a2)
{
  _BOOL4 v3;
  int v4;
  unsigned int v5;

  v3 = a1 > 0 && a1 < a2;
  if (a2 < 0)
    v3 = a1 > a2;
  if (a1)
    v4 = v3;
  else
    v4 = 1;
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 1;
  else
    v5 = v4;
  if (a2)
    return v5;
  else
    return 0;
}

id getCNComposeRecipientViewDidChangeNotification()
{
  id *v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr;
  v6 = getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr;
  if (!getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x24BDAC760];
    v2[1] = 3221225472;
    v2[2] = __getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke;
    v2[3] = &unk_2511FA508;
    v2[4] = &v3;
    __getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke((uint64_t)v2);
    v0 = (id *)v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getCNComposeRecipientViewDidChangeNotification_cold_1();
  return *v0;
}

void sub_241E0DDE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E0E41C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241E10468(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_2511FC3B0;
    v5 = 0;
    ContactsAutocompleteUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ContactsAutocompleteUILibraryCore_frameworkLibrary)
    __getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)ContactsAutocompleteUILibraryCore_frameworkLibrary, "CNComposeRecipientViewDidChangeNotification");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void sub_241E12F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__81(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__81(uint64_t a1)
{

}

void sub_241E130EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E133FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E1361C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_241E14E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__82(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__82(uint64_t a1)
{

}

void sub_241E15904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_241E15F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E16FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E1B154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E1B514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E1B718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__83(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__83(uint64_t a1)
{

}

void sub_241E1CD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__84(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__84(uint64_t a1)
{

}

void sub_241E1EF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__85(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__85(uint64_t a1)
{

}

void sub_241E1F5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E21010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E27678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E27EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SUUIItemKindForString(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  while (!objc_msgSend((id)qword_2511FC8A0[v2 + 1], "isEqualToString:", a1))
  {
    v2 += 2;
    if (v2 == 50)
      return 0;
  }
  return qword_2511FC8A0[v2];
}

BOOL SUUIItemKindIsSoftwareKind(uint64_t a1)
{
  return a1 == 12 || a1 == 17;
}

uint64_t SUUIItemDeviceFamilyIsUniversal(unsigned __int8 a1)
{
  return a1 & ((a1 & 6) != 0);
}

BOOL SUUIItemDeviceFamilyIsTVOnly(char a1)
{
  return (a1 & 0xF) == 8;
}

BOOL SUUIItemKindIsToneKind(uint64_t a1)
{
  return a1 == 11 || a1 == 16;
}

id SUUIItemScreenshotsForDictionary(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  SUUIScreenshot *v23;
  SUUIArtwork *v24;
  SUUIScreenshot *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  SUUIArtwork *v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BEB2870]);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v40 = (void *)v3;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_48;
  v39 = v1;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = (uint64_t)v5;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
  {
    objc_msgSend(v40, "objectForKey:", *MEMORY[0x24BEB2858]);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v40, "objectForKey:", *MEMORY[0x24BEB2868]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -320 * v6;
      v47 = -196 * v6;
      v1 = v39;
      if (v10)
      {
        v48 = -568 * v6;
        v15 = -348;
      }
      else
      {
        objc_msgSend(v40, "objectForKey:", *MEMORY[0x24BEB2860]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = -480 * v6;
        v15 = -294;
      }
      v46 = v6 * v15;
      goto LABEL_14;
    }
    v10 = (void *)v9;
    v46 = -300 * v6;
    v47 = -225 * v6;
    v48 = -1024 * v6;
    v49 = -768 * v6;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;

  if (v13 <= 480.0
    || (objc_msgSend(v40, "objectForKey:", *MEMORY[0x24BEB2868]), (v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v40, "objectForKey:", *MEMORY[0x24BEB2860]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -480 * v6;
    v49 = -320 * v6;
    v46 = -294 * v6;
    v47 = -196 * v6;
LABEL_9:
    v1 = v39;
    goto LABEL_14;
  }
  v48 = -568 * v6;
  v49 = -320 * v6;
  v46 = -348 * v6;
  v47 = -196 * v6;
  v1 = v39;
  v10 = (void *)v14;
LABEL_14:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_47;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v38 = v10;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (!v17)
    goto LABEL_46;
  v18 = v17;
  v19 = *(_QWORD *)v55;
  v42 = v16;
  v43 = v2;
  v41 = *(_QWORD *)v55;
  do
  {
    v20 = 0;
    v44 = v18;
    do
    {
      if (*(_QWORD *)v55 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v20);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = v20;
        v22 = v21;
        v23 = objc_alloc_init(SUUIScreenshot);
        v24 = -[SUUIArtwork initWithArtworkDictionary:]([SUUIArtwork alloc], "initWithArtworkDictionary:", v22);

        -[SUUIScreenshot setArtwork:forVariant:](v23, "setArtwork:forVariant:", v24, CFSTR("high-dpi"));
        -[SUUIScreenshot setArtwork:forVariant:](v23, "setArtwork:forVariant:", v24, CFSTR("low-dpi"));
        v25 = v23;
        goto LABEL_42;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = v20;
        v26 = v21;
        v23 = objc_alloc_init(SUUIScreenshot);
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v25 = (SUUIScreenshot *)v26;
        v27 = -[SUUIScreenshot countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (!v27)
          goto LABEL_41;
        v28 = v27;
        v29 = *(_QWORD *)v51;
        v30 = 0x7FFFFFFFFFFFFFFFLL;
        v31 = 0x7FFFFFFFFFFFFFFFLL;
        while (1)
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v51 != v29)
              objc_enumerationMutation(v25);
            v33 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = -[SUUIArtwork initWithArtworkDictionary:]([SUUIArtwork alloc], "initWithArtworkDictionary:", v33);
              v35 = -[SUUIArtwork width](v34, "width");
              if (v35 >= -[SUUIArtwork height](v34, "height"))
              {
                if (SUUIArtworkSizeDeltaIsBetter(v35 + v48, v30))
                {
                  -[SUUIScreenshot setArtwork:forVariant:](v23, "setArtwork:forVariant:", v34, CFSTR("high-dpi"));
                  v30 = v35 + v48;
                }
                v36 = v35 + v46;
                if (!SUUIArtworkSizeDeltaIsBetter(v36, v31))
                  goto LABEL_38;
              }
              else
              {
                if (SUUIArtworkSizeDeltaIsBetter(v35 + v49, v30))
                {
                  -[SUUIScreenshot setArtwork:forVariant:](v23, "setArtwork:forVariant:", v34, CFSTR("high-dpi"));
                  v30 = v35 + v49;
                }
                v36 = v35 + v47;
                if ((SUUIArtworkSizeDeltaIsBetter(v36, v31) & 1) == 0)
                  goto LABEL_38;
              }
              -[SUUIScreenshot setArtwork:forVariant:](v23, "setArtwork:forVariant:", v34, CFSTR("low-dpi"), v38);
              v31 = v36;
LABEL_38:

              continue;
            }
          }
          v28 = -[SUUIScreenshot countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          if (!v28)
          {
LABEL_41:

            v24 = (SUUIArtwork *)v23;
            v16 = v42;
            v2 = v43;
            v19 = v41;
            v18 = v44;
            if (-[SUUIScreenshot numberOfVariants](v23, "numberOfVariants") >= 1)
            {
LABEL_42:
              objc_msgSend(v2, "addObject:", v23, v38);
              v23 = (SUUIScreenshot *)v24;
            }

            v20 = v45;
            break;
          }
        }
      }
      ++v20;
    }
    while (v20 != v18);
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  }
  while (v18);
LABEL_46:

  v10 = v38;
  v1 = v39;
LABEL_47:

LABEL_48:
  return v2;
}

uint64_t __Block_byref_object_copy__86(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__86(uint64_t a1)
{

}

void SUUIInitializeViewElementStyleFactory()
{
  if (SUUIInitializeViewElementStyleFactory___onceToken != -1)
    dispatch_once(&SUUIInitializeViewElementStyleFactory___onceToken, &__block_literal_global_55);
}

void sub_241E32620(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241E32EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__87(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__87(uint64_t a1)
{

}

void sub_241E37C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E388B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__88(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__88(uint64_t a1)
{

}

uint64_t SUUIGraphicsDeviceHasASTCSupport()
{
  if (SUUIGraphicsDeviceHasASTCSupport_onceToken != -1)
    dispatch_once(&SUUIGraphicsDeviceHasASTCSupport_onceToken, &__block_literal_global_56);
  return SUUIGraphicsDeviceHasASTCSupport_supportsASTC;
}

double SUUIGraphicsMatchViewBorderToStroke(void *a1, double a2)
{
  double v2;
  double v3;

  v2 = a2 * 0.5;
  objc_msgSend(a1, "contentScaleFactor");
  return round(v2 * v3) / v3;
}

CFMutableDataRef SUUIGraphicsCreateASTCDataFromImage(uint64_t a1)
{
  CFMutableDataRef Mutable;
  uint64_t v3;
  const void *v4;
  void *v5;
  char v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  if (SoftLinkImageIO_onceToken != -1)
    dispatch_once(&SoftLinkImageIO_onceToken, &__block_literal_global_50_0);
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v3 = weak_CGImageDestinationCreateWithData(Mutable, CFSTR("org.khronos.ktx"), 1, 0);
  if (v3)
  {
    v4 = (const void *)v3;
    v8[0] = weak_kCGImagePropertyEncoder;
    v8[1] = weak_kCGImagePropertyASTCBlockSize;
    v9[0] = weak_kCGImagePropertyASTCEncoder;
    v9[1] = &unk_2512EEDF0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    weak_CGImageDestinationAddImage(v4, a1, v5);
    v6 = weak_CGImageDestinationFinalize(v4);
    CFRelease(v4);
    if ((v6 & 1) == 0)
    {
      NSLog(CFSTR("%s could not convert to ASTC"), "CFDataRef  _Nullable SUUIGraphicsCreateASTCDataFromImage(CGImageRef _Nonnull)");
      CFRelease(Mutable);
      Mutable = 0;
    }

  }
  else
  {
    NSLog(CFSTR("%s could not create CGImageDestination, bailing out"), "CFDataRef  _Nullable SUUIGraphicsCreateASTCDataFromImage(CGImageRef _Nonnull)");
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

CFMutableDataRef SUUIGraphicsCreateASTCDataFromBitmapContext(CGContext *a1)
{
  CGImageRef Image;
  CGImage *v2;
  CFMutableDataRef ASTCDataFromImage;

  Image = CGBitmapContextCreateImage(a1);
  if (Image)
  {
    v2 = Image;
    ASTCDataFromImage = SUUIGraphicsCreateASTCDataFromImage((uint64_t)Image);
    CGImageRelease(v2);
    return ASTCDataFromImage;
  }
  else
  {
    NSLog(CFSTR("%s could not create bitmap context image, bailing out"), "CFDataRef  _Nullable SUUIGraphicsCreateASTCDataFromBitmapContext(CGContextRef _Nonnull)");
    return 0;
  }
}

SUUICompressedImage *SUUIGraphicsGetASTCImageFromCurrentImageContext(double a1)
{
  CGContext *CurrentContext;
  CFMutableDataRef ASTCDataFromBitmapContext;
  CFMutableDataRef v4;
  void *v5;
  double v6;
  SUUICompressedImage *v7;

  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext
    && (ASTCDataFromBitmapContext = SUUIGraphicsCreateASTCDataFromBitmapContext(CurrentContext)) != 0)
  {
    v4 = ASTCDataFromBitmapContext;
    if (fabs(a1) < 2.22044605e-16)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "scale");
      a1 = v6;

    }
    v7 = -[SUUICompressedImage initWithData:scale:]([SUUICompressedImage alloc], "initWithData:scale:", v4, a1);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void sub_241E3BD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t __Block_byref_object_copy__89(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__89(uint64_t a1)
{

}

void SUUIIconColorsForColorScheme(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a1;
  objc_msgSend(v12, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    SUUIColorForStyleWithBrightness(v7, objc_msgSend(v12, "schemeStyle"), -0.05, 0.25, -0.05, 0.25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIColorForStyleWithBrightness(v7, objc_msgSend(v12, "schemeStyle"), -0.2, 0.0, -0.2, 0.05);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIColorForStyleWithBrightness(v7, objc_msgSend(v12, "schemeStyle"), -0.7, -0.2, -0.7, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIColorForStyleWithAlpha(v10, objc_msgSend(v12, "schemeStyle"), 0.3, 1.0, 0.3, 0.3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.95, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.8, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.3, 0.3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
LABEL_3:
    *a2 = objc_retainAutorelease(v8);
LABEL_4:
  if (a3)
    *a3 = objc_retainAutorelease(v9);
  if (a4)
    *a4 = objc_retainAutorelease(v11);

}

double *SUUIIconFrameForIconSize(double *result, double *a2, double a3, double a4, double a5, double a6, double a7)
{
  double v8;
  double v9;
  double v10;

  if (a5 != *MEMORY[0x24BDBF148] || a6 != *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    v8 = a5 / a3;
    v9 = a6 / a4;
    if (v8 >= v9)
      v8 = v9;
    a3 = ceil(a3 * v8);
    a4 = ceil(a4 * v8);
  }
  v10 = 0.0;
  if (a7 > 0.0)
    v10 = 1.0;
  if (result)
  {
    *result = a3 + a7 * 2.0;
    result[1] = a4 + a7 * 2.0;
  }
  if (a2)
  {
    *a2 = a7;
    a2[1] = v10;
    a2[2] = a3;
    a2[3] = a4;
  }
  return result;
}

void sub_241E41330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E41C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SUUILockupViewTypeForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("grid")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("list")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("shelf")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("product")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("brick")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("editorial")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("caption")) & 1) != 0)
  {
    v2 = 7;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("tabular")))
  {
    v2 = 8;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_241E45BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

void sub_241E46198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;
  uint64_t v10;

  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

double SUUISpacePageComponentHeightForString(void *a1)
{
  id v1;
  double v2;
  float v3;

  v1 = a1;
  v2 = 1.0;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) == 0)
  {
    v2 = 5.0;
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("S")) & 1) == 0)
    {
      v2 = 7.0;
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("M")) & 1) == 0)
      {
        v2 = 10.0;
        if ((objc_msgSend(v1, "isEqualToString:", CFSTR("L")) & 1) == 0)
        {
          v2 = 25.0;
          if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XL")) & 1) == 0)
          {
            if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XXL")) & 1) != 0)
            {
              v2 = 100.0;
            }
            else
            {
              objc_msgSend(v1, "floatValue");
              v2 = v3;
            }
          }
        }
      }
    }
  }

  return v2;
}

void sub_241E47AF4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241E47BD4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241E47D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__90(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__90(uint64_t a1)
{

}

void sub_241E47EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E4E224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E4E2FC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241E4EAD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__91(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__91(uint64_t a1)
{

}

void sub_241E4EE6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E4F0C0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241E50044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_241E51160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E51478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E53D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E547B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E554E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

id getAMSURLParserClass()
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
  v0 = (void *)getAMSURLParserClass_softClass;
  v7 = getAMSURLParserClass_softClass;
  if (!getAMSURLParserClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAMSURLParserClass_block_invoke;
    v3[3] = &unk_2511FA508;
    v3[4] = &v4;
    __getAMSURLParserClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_241E555B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAMSURLParserClass_block_invoke(uint64_t a1)
{
  Class result;

  AppleMediaServicesLibrary();
  result = objc_getClass("AMSURLParser");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMSURLParserClass_block_invoke_cold_1();
  getAMSURLParserClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void AppleMediaServicesLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_2511FD208;
    v2 = 0;
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
    AppleMediaServicesLibrary_cold_1(&v0);
}

Class __getAMSBagClass_block_invoke(uint64_t a1)
{
  Class result;

  AppleMediaServicesLibrary();
  result = objc_getClass("AMSBag");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMSBagClass_block_invoke_cold_1();
  getAMSBagClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_241E571C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E59964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E59B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E5B5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  uint64_t v62;

  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&STACK[0x348], 8);
  _Block_object_dispose((const void *)(v62 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_241E5C708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E5CA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E5CE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__92(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__92(uint64_t a1)
{

}

void sub_241E5D0A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_241E5D3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_241E5D8E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SUUIFacebookViewElementTypeForString(void *a1)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("large"));
}

void sub_241E5E4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E5E8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E5EB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E5F1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__93(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__93(uint64_t a1)
{

}

void sub_241E5F7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E60224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E603F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E60EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  uint64_t v44;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 248), 8);
  _Block_object_dispose((const void *)(v44 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_241E616C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL _SUUIScrollViewIsCompetingWithScrollView(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  int CanScrollVertically;
  _BOOL8 v12;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_SUUIScrollViewCanScrollHorizontally(v3))
    v6 = objc_msgSend(v5, "_canPanHorizontally");
  else
    v6 = 0;
  if (_SUUIScrollViewCanScrollVertically(v3))
    v7 = objc_msgSend(v5, "_canPanVertically");
  else
    v7 = 0;
  objc_msgSend(v4, "panGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_SUUIScrollViewCanScrollHorizontally(v4))
    v9 = objc_msgSend(v8, "_canPanHorizontally");
  else
    v9 = 0;
  CanScrollVertically = _SUUIScrollViewCanScrollVertically(v4);
  if (CanScrollVertically)
    CanScrollVertically = objc_msgSend(v8, "_canPanVertically");
  v12 = v6 != v9 && v7 != CanScrollVertically;

  return v12;
}

uint64_t _SUUIScrollViewWantsToBeginTrackingImmediately(void *a1)
{
  id v1;
  id v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  uint64_t v38;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;

  v1 = a1;
  if ((objc_msgSend(v1, "isDecelerating") & 1) == 0)
  {
    v2 = v1;
    if ((objc_msgSend(v2, "isDecelerating") & 1) == 0
      && (objc_msgSend(v2, "isDragging") & 1) == 0
      && (objc_msgSend(v2, "isTracking") & 1) == 0)
    {

LABEL_29:
      v38 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v2, "contentOffset");
    v43 = v4;
    v44 = v3;
    objc_msgSend(v2, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayScale");
    v7 = v6;

    if (v7 < 0.00000011920929)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scale");
      v7 = v9;

    }
    objc_msgSend(v2, "contentInset");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v2, "contentSize");
    v20 = -v13;
    if (v7 == 1.0 || v7 == 0.0)
    {
      v22 = round(v20);
      v24 = round(-v11);
      v26 = round(v17 + v18);
      v42 = round(v15 + v19);
      v30 = round(v17 + v13 + v18);
      v33 = round(v15 + v11 + v19);
    }
    else
    {
      v21 = floor(v20);
      v22 = v21 + round(v7 * (v20 - v21)) / v7;
      v23 = floor(-v11);
      v24 = v23 + round(v7 * (-v11 - v23)) / v7;
      v25 = floor(v17 + v18);
      v26 = v25 + round(v7 * (v17 + v18 - v25)) / v7;
      v27 = floor(v15 + v19);
      v42 = v27 + round(v7 * (v15 + v19 - v27)) / v7;
      v28 = v17 + v13 + v18;
      v29 = floor(v28);
      v30 = v29 + round(v7 * (v28 - v29)) / v7;
      v31 = v15 + v11 + v19;
      v32 = floor(v31);
      v33 = v32 + round(v7 * (v31 - v32)) / v7;
    }
    objc_msgSend(v2, "bounds");
    if (v44 < v22 || (v34 >= v30 ? (v36 = v30) : (v36 = v34), v44 <= v26 - v36 ? (v37 = v43 < v24) : (v37 = 1), v37))
    {

    }
    else
    {
      if (v35 >= v33)
        v40 = v33;
      else
        v40 = v35;
      v41 = v42 - v40;

      if (v43 <= v41)
        goto LABEL_29;
    }
  }
  v38 = objc_msgSend(v1, "tracksImmediatelyWhileDecelerating");
LABEL_22:

  return v38;
}

void sub_241E62C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _SUUIScrollViewCanScrollHorizontally(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v1 = a1;
  objc_msgSend(v1, "contentInset");
  v3 = v2;
  v5 = v4;
  objc_msgSend(v1, "contentSize");
  v7 = v6;
  objc_msgSend(v1, "bounds");
  if (v5 + v3 + v7 <= v8)
  {
    if (objc_msgSend(v1, "alwaysBounceHorizontal"))
      v9 = objc_msgSend(v1, "bouncesHorizontally");
    else
      v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t _SUUIScrollViewCanScrollVertically(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v1 = a1;
  objc_msgSend(v1, "contentInset");
  v3 = v2;
  v5 = v4;
  objc_msgSend(v1, "contentSize");
  v7 = v6;
  objc_msgSend(v1, "bounds");
  if (v5 + v3 + v7 <= v8)
  {
    if (objc_msgSend(v1, "alwaysBounceVertical"))
      v9 = objc_msgSend(v1, "bouncesVertically");
    else
      v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

void sub_241E64344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E64744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E654E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_241E659F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void ITColor::ITColor(ITColor *this)
{
  this->var0 = 0.0;
  this->var1 = 0.0;
  this->var2 = 0.0;
  this->var3 = 1.0;
}

void ITColor::ITColor(ITColor *this, double a2, double a3, double a4)
{
  this->var0 = a2;
  this->var1 = a3;
  this->var2 = a4;
  this->var3 = 1.0;
}

void ITColor::ITColor(ITColor *this, double a2, double a3, double a4, double a5)
{
  this->var0 = a2;
  this->var1 = a3;
  this->var2 = a4;
  this->var3 = a5;
}

void ITColor::ITColor(ITColor *this, CGColorRef color)
{
  const CGFloat *Components;
  double v5;
  CGColorSpace *ColorSpace;
  CGColorSpace *SRGB;
  double v8;
  double v9;
  double v10;

  this->var0 = 0.0;
  this->var1 = 0.0;
  this->var2 = 0.0;
  this->var3 = 1.0;
  Components = CGColorGetComponents(color);
  switch(CGColorGetNumberOfComponents(color))
  {
    case 1uLL:
      goto LABEL_3;
    case 2uLL:
      this->var3 = Components[1];
LABEL_3:
      v5 = *Components;
      this->var1 = *Components;
      this->var2 = v5;
      this->var0 = v5;
      break;
    case 3uLL:
      goto LABEL_5;
    case 4uLL:
      this->var3 = Components[3];
LABEL_5:
      this->var0 = *Components;
      this->var1 = Components[1];
      this->var2 = Components[2];
      break;
    default:
      break;
  }
  ColorSpace = CGColorGetColorSpace(color);
  SRGB = (CGColorSpace *)CGColorSpaceGetSRGB();
  this->var0 = ITColor::ConvertColorSpace(this, ColorSpace, SRGB);
  this->var1 = v8;
  this->var2 = v9;
  this->var3 = v10;
}

double ITColor::ConvertColorSpace(ITColor *this, CGColorSpaceRef space, CGColorSpace *cf2)
{
  double v6;
  __int128 v7;
  CGColor *v8;
  CGContext *v9;
  CGContext *v10;
  unint64_t v11;
  int data;
  CGFloat components[2];
  __int128 v15;
  uint64_t v16;
  CGRect v17;

  v16 = *MEMORY[0x24BDAC8D0];
  data = 0;
  if (!space || !cf2 || !CFEqual(space, cf2))
  {
    v7 = *(_OWORD *)&this->var2;
    *(_OWORD *)components = *(_OWORD *)&this->var0;
    v15 = v7;
    v8 = CGColorCreate(space, components);
    if (v8)
    {
      v9 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, cf2, 0x4002u);
      v10 = v9;
      if (v9)
      {
        CGContextSetFillColorWithColor(v9, v8);
        v17.origin.x = 0.0;
        v17.origin.y = 0.0;
        v17.size.width = 1.0;
        v17.size.height = 1.0;
        CGContextFillRect(v10, v17);
        LOBYTE(v11) = BYTE1(data);
        v6 = (double)v11 / 255.0;
LABEL_10:
        CGColorRelease(v8);
        CGContextRelease(v10);
        return v6;
      }
    }
    else
    {
      v10 = 0;
    }
    v6 = 0.0;
    goto LABEL_10;
  }
  return this->var0;
}

void ITColor::ITColor(ITColor *this, const RGBColor *a2, double a3, double a4, double a5)
{
  double v5;

  LOWORD(a3) = a2->red;
  v5 = (double)*(unint64_t *)&a3 / 65535.0;
  LOWORD(a5) = a2->green;
  this->var0 = v5;
  this->var1 = (double)*(unint64_t *)&a5 / 65535.0;
  LOWORD(v5) = a2->blue;
  this->var2 = (double)*(unint64_t *)&v5 / 65535.0;
  this->var3 = 1.0;
}

void ITColor::ITColor(ITColor *this, double a2, double a3)
{
  this->var0 = a2;
  this->var1 = a2;
  this->var2 = a2;
  this->var3 = a3;
}

uint64_t ITColor::GetARGBBits(ITColor *this)
{
  uint32x2_t v1;

  v1 = vshl_u32((uint32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(*(float64x2_t *)&this->var0, (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL)))), (uint32x2_t)0x800000010);
  return v1.i32[0] | (this->var2 * 255.0) | v1.i32[1] | ((this->var3 * 255.0) << 24);
}

unint64_t ITColor::operator RGBColor(uint64_t a1)
{
  int32x2_t v1;
  uint64x2_t v2;
  int64x2_t v3;

  v1 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(*(float64x2_t *)(a1 + 8), (float64x2_t)vdupq_n_s64(0x40EFFFE000000000uLL))));
  v2.i64[0] = v1.u32[0];
  v2.i64[1] = v1.u32[1];
  v3 = (int64x2_t)vshlq_u64(v2, (uint64x2_t)xmmword_241EFCEF0);
  return vorrq_s8((int8x16_t)vdupq_laneq_s64(v3, 1), (int8x16_t)v3).u64[0] | (int)(*(double *)a1 * 65535.0);
}

BOOL ITColor::operator==(double *a1, double *a2)
{
  return *a2 == *a1 && a2[1] == a1[1] && a2[2] == a1[2] && a2[3] == a1[3];
}

BOOL ITColor::operator!=(double *a1, double *a2)
{
  return *a2 != *a1 || a2[1] != a1[1] || a2[2] != a1[2] || a2[3] != a1[3];
}

CGColorRef ITColor::CreateCGColor(ITColor *this)
{
  __int128 v1;
  CGColorSpace *SRGB;
  _OWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *(_OWORD *)&this->var2;
  v4[0] = *(_OWORD *)&this->var0;
  v4[1] = v1;
  SRGB = (CGColorSpace *)CGColorSpaceGetSRGB();
  return CGColorCreate(SRGB, (const CGFloat *)v4);
}

double ITColor::CreateFromHSVColor(double *a1)
{
  double v2;
  double v3;
  double v4;

  v4 = 0.0;
  v2 = 0.0;
  v3 = 0.0;
  HSV2RGB(*a1, a1[1], a1[2], &v4, &v3, &v2);
  return v4;
}

double *HSV2RGB(double a1, double a2, double a3, double *result, double *a5, double *a6)
{
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  BOOL v20;

  if (a2 > 1.0)
    a2 = 1.0;
  if (a2 >= 0.0)
    v6 = a2;
  else
    v6 = 0.0;
  if (a3 <= 1.0)
    v7 = a3;
  else
    v7 = 1.0;
  if (v7 < 0.0)
    v7 = 0.0;
  if (v6 == 0.0)
  {
    *result = v7;
    *a5 = v7;
  }
  else
  {
    if (a1 > 1.0)
      a1 = 1.0;
    if (a1 >= 0.0)
      v8 = a1 * 6.0;
    else
      v8 = 0.0;
    v9 = (int)v8;
    v10 = v6 * v7 * (v8 - (double)(int)v8);
    v11 = v7 - v6 * v7;
    v12 = v11 + v10;
    if (v11 + v10 > 1.0)
      v12 = 1.0;
    v13 = v7 - v10;
    if (v13 > 1.0)
      v13 = 1.0;
    v14 = v11;
    if ((v9 & 1) != 0)
      v15 = v13;
    else
      v15 = v12;
    if (v14 <= 1.0)
      v16 = v14;
    else
      v16 = 1.0;
    v17 = v7;
    switch(v9)
    {
      case 0:
      case 5:
        break;
      case 1:
      case 4:
        v17 = v15;
        break;
      default:
        v17 = v16;
        break;
    }
    *result = v17;
    v18 = v7;
    if ((v9 - 1) >= 2)
    {
      v19 = v9 == 3 || v9 == 0;
      v18 = v15;
      if (!v19)
        v18 = v16;
    }
    *a5 = v18;
    if ((v9 - 3) >= 2)
    {
      v20 = v9 == 5 || v9 == 2;
      v7 = v15;
      if (!v20)
        v7 = v16;
    }
  }
  *a6 = v7;
  return result;
}

double ITColor::CreateFromHSVDoubles(ITColor *this, double a2, double a3, double a4)
{
  double v5;
  double v6;
  double v7;

  v7 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  HSV2RGB(a2, a3, a4, &v7, &v6, &v5);
  return v7;
}

double ITColor::GetHSVColor(ITColor *this)
{
  double v2;
  uint64_t v3;
  uint64_t v4;

  RGB2HSV(this->var0, this->var1, this->var2, &v2, (double *)&v3, (double *)&v4);
  return v2;
}

double *RGB2HSV(double a1, double a2, double a3, double *result, double *a5, double *a6)
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

  if (a1 >= 1.0)
    a1 = 1.0;
  v6 = 0.0;
  if (a1 < 0.0)
    a1 = 0.0;
  if (a2 >= 1.0)
    a2 = 1.0;
  if (a2 < 0.0)
    a2 = 0.0;
  if (a3 >= 1.0)
    a3 = 1.0;
  if (a3 >= 0.0)
    v7 = a3;
  else
    v7 = 0.0;
  if (a2 <= a1)
    v8 = a1;
  else
    v8 = a2;
  if (a2 >= a1)
    v9 = a1;
  else
    v9 = a2;
  if (v7 <= a1)
    v10 = a1;
  else
    v10 = v7;
  if (v7 >= a1)
    v11 = a1;
  else
    v11 = v7;
  if (a2 <= v7)
    v8 = v10;
  if (a2 >= v7)
    v9 = v11;
  if (v8 <= 1.0)
    v12 = v8;
  else
    v12 = 1.0;
  *a6 = v12;
  if (v8 == 0.0)
  {
    *a5 = 0.0;
  }
  else
  {
    v13 = v8 - v9;
    v14 = v13 / v8;
    if (v13 / v8 <= 1.0)
    {
      *a5 = v14;
      if (v14 == 0.0)
        goto LABEL_51;
    }
    else
    {
      *a5 = 1.0;
    }
    if (v13 == 0.0)
    {
      v15 = 0.0;
      v16 = 0.0;
    }
    else
    {
      v6 = (v8 - a1) / v13;
      v15 = (v8 - a2) / v13;
      v16 = (v8 - v7) / v13;
    }
    if (a1 == v8)
    {
      v17 = v16 - v15;
    }
    else if (a2 == v8)
    {
      v17 = v6 + 2.0 - v16;
    }
    else
    {
      v17 = v15 + 4.0 - v6;
    }
    v18 = v17 / 6.0;
    if (v18 < 0.0)
      v18 = v18 + 1.0;
    if (v18 <= 1.0)
      v6 = v18;
    else
      v6 = 1.0;
  }
LABEL_51:
  *result = v6;
  return result;
}

double ITColor::GetHSVColorForRGBValues(ITColor *this, double a2, double a3, double a4)
{
  double v5;
  uint64_t v6;
  uint64_t v7;

  RGB2HSV(a2, a3, a4, &v5, (double *)&v6, (double *)&v7);
  return v5;
}

double ITColor::GetHSVColorForRGBValues(ITColor *this, unsigned int a2, unsigned int a3)
{
  double v4;
  uint64_t v5;
  uint64_t v6;

  RGB2HSV((double)this / 255.0, (double)a2 / 255.0, (double)a3 / 255.0, &v4, (double *)&v5, (double *)&v6);
  return v4;
}

void ITColor::GetLuminance(ITColor *this)
{
  uint64_t v1;
  double v2;
  double v3;
  __int128 v4;
  double var2;
  uint64_t v6;

  v1 = 0;
  v6 = *MEMORY[0x24BDAC8D0];
  v4 = *(_OWORD *)&this->var0;
  var2 = this->var2;
  do
  {
    v2 = *(double *)((char *)&v4 + v1);
    if (v2 <= 0.0392800011)
      v3 = v2 / 12.9200001;
    else
      v3 = pow((v2 + 0.0549999997) / 1.05499995, 2.4);
    *(double *)((char *)&v4 + v1) = v3;
    v1 += 8;
  }
  while (v1 != 24);
}

double ITColor::GetContrastWithColor(ITColor *this, ITColor *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;

  ITColor::GetLuminance(a2);
  v4 = v3;
  ITColor::GetLuminance(this);
  if (v5 <= v4)
    v6 = v4;
  else
    v6 = v5;
  if (v5 > v4)
    v5 = v4;
  return (v6 + 0.0500000007) / (v5 + 0.0500000007);
}

double ITColor::GetContrastWithLuminance(ITColor *this, double a2)
{
  double v3;
  double v4;

  ITColor::GetLuminance(this);
  if (v3 <= a2)
    v4 = a2;
  else
    v4 = v3;
  if (v3 > a2)
    v3 = a2;
  return (v4 + 0.0500000007) / (v3 + 0.0500000007);
}

double ITColor::GetHueDistanceFromColor(double *a1, double *a2)
{
  double v2;
  double v3;
  double result;

  v2 = *a1;
  v3 = *a2;
  result = vabdd_f64(*a1, *a2);
  if (result > 0.5)
  {
    result = v3 + 1.0 - v2;
    if (v2 <= v3)
      return v2 + 1.0 - v3;
  }
  return result;
}

BOOL ITColor::IsCloseToColor(ITColor *this, ITColor *a2, double a3)
{
  double HSVColor;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (a3 <= 0.0 || a3 >= 1.0)
    return 0;
  HSVColor = ITColor::GetHSVColor(this);
  v8 = v7;
  v10 = v9;
  v11 = ITColor::GetHSVColor(a2);
  if (vabdd_f64(v8, v13) > a3 || vabdd_f64(v10, v12) > a3)
    return 0;
  if (vabdd_f64(HSVColor, v11) <= a3)
    return 1;
  v14 = HSVColor + 1.0;
  if (HSVColor >= a3)
    v14 = HSVColor;
  if (v11 < a3)
    v11 = v11 + 1.0;
  return vabdd_f64(v14, v11) <= a3;
}

double ITColor::CreateBlendedColorWithFraction(ITColor *this, double a2, ITColor a3)
{
  if (a2 < 1.0)
  {
    if (a2 <= 0.0)
      a3.var0 = this->var0;
    else
      a3.var0 = (1.0 - a2) * this->var0 + a3.var0 * a2;
  }
  return a3.var0;
}

const __CFString *SUUIMediaQueryNetworkTypeString(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;

  v1 = CFSTR("none");
  v2 = CFSTR("wifi");
  if (a1 != 1000)
    v2 = 0;
  if (a1)
    v1 = v2;
  if ((unint64_t)(a1 - 1) >= 8)
    return v1;
  else
    return CFSTR("cellular");
}

void sub_241E68FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E69BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E6A028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E6A59C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_241E6A9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getAMSURLParserClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!AppleMediaServicesLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_2511FD648;
    v5 = 0;
    AppleMediaServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!AppleMediaServicesLibraryCore_frameworkLibrary_0)
    __getAMSURLParserClass_block_invoke_cold_1_0(&v3);
  result = objc_getClass("AMSURLParser");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMSURLParserClass_block_invoke_cold_2();
  getAMSURLParserClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAMSUIDynamicViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  AppleMediaServicesUILibrary();
  result = objc_getClass("AMSUIDynamicViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMSUIDynamicViewControllerClass_block_invoke_cold_1();
  getAMSUIDynamicViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void AppleMediaServicesUILibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!AppleMediaServicesUILibraryCore_frameworkLibrary)
  {
    v1 = xmmword_2511FD660;
    v2 = 0;
    AppleMediaServicesUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleMediaServicesUILibraryCore_frameworkLibrary)
    AppleMediaServicesUILibrary_cold_1(&v0);
}

Class __getAMSUIWebViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  AppleMediaServicesUILibrary();
  result = objc_getClass("AMSUIWebViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAMSUIWebViewControllerClass_block_invoke_cold_1();
  getAMSUIWebViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_241E71400(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_241E71FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E72354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

id SUUIStackedBarNavAnimationController(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  double v26;
  double v27;
  void *v28;
  __objc2_class **v29;
  void *v30;

  v7 = a1;
  v8 = a3;
  v9 = a4;
  v10 = (id)objc_msgSend(v8, "view");
  v11 = (id)objc_msgSend(v9, "view");
  objc_msgSend(v9, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutSubviews");

  objc_msgSend(v8, "SUUIStackedBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "SUUIStackedBar");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = 0;
  if (v13 && v14)
  {
    objc_msgSend(v13, "_resetNewOffset");
    objc_msgSend(v15, "_resetNewOffset");
    SUUINavigationControllerGetItemsForViewController(v7, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItems:", v17);

    objc_msgSend(v13, "sizeToFit");
    objc_msgSend(v8, "contentScrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = objc_msgSend(v13, "splitViewStyle");
      objc_msgSend(v13, "frame");
      if (v19)
        v21 = v20;
      else
        v21 = v20 + -20.0;
      objc_msgSend(v8, "contentScrollView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIScrollViewSetContentInsets(v22, "com.apple.iTunesStoreUI.stackedBarInset", v21, 0.0, 0.0, 0.0);

    }
    SUUINavigationControllerGetItemsForViewController(v7, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setItems:", v23);

    objc_msgSend(v15, "sizeToFit");
    objc_msgSend(v9, "contentScrollView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = objc_msgSend(v15, "splitViewStyle");
      objc_msgSend(v15, "frame");
      if (v25)
        v27 = v26;
      else
        v27 = v26 + -20.0;
      objc_msgSend(v9, "contentScrollView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIScrollViewSetContentInsets(v28, "com.apple.iTunesStoreUI.stackedBarInset", v27, 0.0, 0.0, 0.0);

    }
    if (a2 == 1)
    {
      v29 = off_2511F30D0;
      v30 = v8;
    }
    else
    {
      if (a2 != 2)
      {
        v16 = 0;
        goto LABEL_19;
      }
      v29 = off_2511F30C8;
      v30 = v9;
    }
    v16 = objc_alloc_init(*v29);
    objc_msgSend(v16, "setFromBar:", v13);
    objc_msgSend(v16, "setToBar:", v15);
    objc_msgSend(v30, "SUUIStackedBarSplit");
    objc_msgSend(v16, "setSplit:");
  }
LABEL_19:

  return v16;
}

id SUUINavigationControllerGetItemsForViewController(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "viewControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v6);
      v11 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v10);
      objc_msgSend(v11, "navigationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

      if (v11 == v4)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(v3, "viewControllers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v4);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v4, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

  }
  return v5;
}

void SUUIStackedBarNavDidShow(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  CGRect v13;

  v12 = a1;
  v3 = a2;
  objc_msgSend(v3, "SUUIStackedBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    SUUINavigationControllerGetItemsForViewController(v12, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setItems:", v5);

    objc_msgSend(v4, "frame");
    if (CGRectGetHeight(v13) == 0.0)
      objc_msgSend(v4, "sizeToFit");
    objc_msgSend(v3, "contentScrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
      v8 = v7;
      if (objc_msgSend(v4, "splitViewStyle"))
      {
        objc_msgSend(v4, "frame");
        v10 = v9;
      }
      else
      {
        v10 = v8 + -20.0;
      }
      objc_msgSend(v3, "contentScrollView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SUUIScrollViewSetContentInsets(v11, "com.apple.iTunesStoreUI.stackedBarInset", v10, 0.0, 0.0, 0.0);

    }
  }

}

void SUUIScrollViewSetContentInsets(void *a1, const void *a2, double a3, double a4, double a5, double a6)
{
  void *v7;
  void *v8;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  id object;

  object = a1;
  objc_getAssociatedObject(object, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "UIEdgeInsetsValue");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v10 = *MEMORY[0x24BEBE158];
    v12 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v14 = *(double *)(MEMORY[0x24BEBE158] + 16);
    v16 = *(double *)(MEMORY[0x24BEBE158] + 24);
  }
  objc_msgSend(object, "contentInset");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(object, "scrollIndicatorInsets");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  if (v12 != a4 || v10 != a3 || v16 != a6 || v14 != a5)
  {
    v36 = a3 - v10;
    v37 = v36 + v18;
    v38 = a4 - v12;
    v39 = a4 - v12 + v20;
    v40 = a5 - v14;
    v41 = a5 - v14 + v22;
    v42 = a6 - v16;
    v43 = a6 - v16 + v24;
    v44 = v26;
    v45 = v28;
    v46 = v30;
    v47 = v32;
    objc_msgSend(object, "setContentInset:", v37, v39, v41, v43);
    objc_msgSend(object, "setScrollIndicatorInsets:", v36 + v44, v38 + v45, v40 + v46, v42 + v47);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithUIEdgeInsets:", a3, a4, a5, a6);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(object, a2, v48, (void *)1);

  }
}

void sub_241E755AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__94(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__94(uint64_t a1)
{

}

void *__Block_byref_object_copy__95(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__95(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__2_1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3_1(uint64_t a1)
{

}

void sub_241E77460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E78FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E7A904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_241E7CF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__96(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__96(uint64_t a1)
{

}

void sub_241E7D280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E7F0AC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241E7F6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E80098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SUUIButtonViewTypeForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("buy")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("download")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("link")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("image")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("imagetext")) & 1) != 0)
  {
    v2 = 6;
  }
  else
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("textonly")) & 1) != 0)
      goto LABEL_12;
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("done")) & 1) != 0)
    {
      v2 = 8;
      goto LABEL_29;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("sample")) & 1) != 0)
    {
      v2 = 4;
      goto LABEL_29;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("back")) & 1) != 0)
    {
      v2 = 1;
      goto LABEL_29;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("cancel")) & 1) != 0)
    {
      v2 = 10;
      goto LABEL_29;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("destructive")) & 1) != 0)
    {
      v2 = 11;
      goto LABEL_29;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("disabled")) & 1) != 0)
    {
LABEL_12:
      v2 = 9;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("play")) & 1) != 0)
    {
      v2 = 12;
    }
    else if (objc_msgSend(v1, "isEqualToString:", CFSTR("thin")))
    {
      v2 = 13;
    }
    else
    {
      v2 = 0;
    }
  }
LABEL_29:

  return v2;
}

void sub_241E80470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__97(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__97(uint64_t a1)
{

}

BOOL SUUIIKViewElementTypeIsButton(unint64_t a1)
{
  _BOOL8 result;

  result = 1;
  if (a1 > 0x32 || ((1 << a1) & 0x4000000003000) == 0)
    return a1 == 141;
  return result;
}

void sub_241E82830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__98(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__98(uint64_t a1)
{

}

void sub_241E82984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E84294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__99(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__99(uint64_t a1)
{

}

void sub_241E8477C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_241E85058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__100(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__100(uint64_t a1)
{

}

void sub_241E85460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E85774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t SUUIPhysicalCircleConstantsWithTraitCollection@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  double v4;

  *(_OWORD *)a2 = xmmword_241EFD0C0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = xmmword_241EFD0D0;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_QWORD *)(a2 + 48) = 0x4000000000000000;
  result = objc_msgSend(a1, "horizontalSizeClass");
  v4 = 10.0;
  if (result == 2)
    v4 = 12.0;
  *(double *)(a2 + 56) = v4;
  return result;
}

void sub_241E88C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E88E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E89080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E89810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__101(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__101(uint64_t a1)
{

}

void sub_241E8CDC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E8D22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E8D48C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241E8D594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__102(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__102(uint64_t a1)
{

}

void sub_241E8D858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241E8DB20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_241E8EBB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_241E958BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __SoftwareLibraryChangeNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_reloadSoftwareLibrary");
}

void sub_241E965C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

SUUILibraryItem *SUUILibraryItemForStoreIdentifier(void *a1)
{
  id v1;
  SUUILibraryItem *v2;

  v1 = a1;
  v2 = objc_alloc_init(SUUILibraryItem);
  -[SUUILibraryItem setStoreIdentifier:](v2, "setStoreIdentifier:", v1);

  return v2;
}

BOOL SUUIItemStateCenterUseAppstoredPurchases(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (SUUIItemStateCenterUseAppstorePurchasesSwitchEnabled())
    v2 = objc_msgSend(v1, "itemKind") == 12 || objc_msgSend(v1, "itemKind") == 17;
  else
    v2 = 0;

  return v2;
}

void sub_241E98498(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__103(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__103(uint64_t a1)
{

}

void sub_241E9FE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_241EA031C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __PurchaseHistoryChangeNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_reloadPurchaseHistory");
}

void sub_241EA0640(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241EA076C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241EA08B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241EA10E8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_241EA1408(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241EA1798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SUUIItemStateCenterUseAppstorePurchasesSwitchEnabled()
{
  void *v0;
  void *v1;
  int AppBooleanValue;
  BOOL v3;
  uint64_t v4;
  Boolean keyExistsAndHasValidFormat;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.AppStore")) & 1) != 0
    || objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.ios.StoreKitUIService")))
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("UseAppstoredPurchases"), CFSTR("com.apple.AppStore"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v3 = AppBooleanValue == 0;
    else
      v3 = 0;
    v4 = !v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_241EA72DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241EA8150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  id *v23;
  uint64_t v24;

  objc_destroyWeak(v23);
  objc_destroyWeak(location);
  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v24 - 160));
  _Unwind_Resume(a1);
}

void sub_241EA8334(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241EA8F14(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_241EA9FB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_241EACEF4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_241EAD154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241EAD3C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241EADA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241EADC24(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_241EADDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241EADF50(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __AccountsChanged(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ____AccountsChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void sub_241EAF018(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241EAF45C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241EB0244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_241EB0934(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_241EB0B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double SUUIImageRectForBounds(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return SUUIImageRectForBoundsAndPadding(a1, a2, a3, a4, a5, a6, a7, *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
}

double SUUIImageRectForBoundsAndPadding(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  _BOOL4 v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v18 = a11 == *(double *)(MEMORY[0x24BEBE158] + 8);
  if (a10 != *MEMORY[0x24BEBE158])
    v18 = 0;
  if (a13 != *(double *)(MEMORY[0x24BEBE158] + 24))
    v18 = 0;
  v19 = a12 == *(double *)(MEMORY[0x24BEBE158] + 16);
  v20 = a11 + a13;
  v21 = a10 + a12;
  if (v18 && v19)
    v20 = 0.0;
  v22 = a6 - v20;
  if (v18 && v19)
    v21 = 0.0;
  v23 = a7 - v21;
  if (a1 == 1)
  {
    v25 = v22 / a2;
    if (v22 / a2 < v23 / a3)
      v25 = v23 / a3;
    v24 = ceil(a2 * v25);
    return floor((v22 - v24) * 0.5);
  }
  if (!a1)
  {
    v24 = floor(a2 * (v23 / a3));
    if (a2 <= 0.0)
      v24 = v22;
    if (a3 < a2)
      v24 = v22;
    return floor((v22 - v24) * 0.5);
  }
  return *MEMORY[0x24BDBF090];
}

void sub_241EB3690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241EB39F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241EB5938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIWishlistItemPropertiesWithItem(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v1 = a1;
  objc_msgSend(v1, "cacheRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v3, *MEMORY[0x24BEB2BD0]);
    v5 = objc_msgSend(v1, "itemIdentifier");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, *MEMORY[0x24BEB2BD8]);

    objc_msgSend(v1, "itemKindString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v4, "setObject:forKey:", v7, *MEMORY[0x24BEB2BE0]);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id SUUIWishlistOperationQueue()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)SUUIWishlistOperationQueue_sQueue;
  if (!SUUIWishlistOperationQueue_sQueue)
  {
    v1 = objc_alloc_init(MEMORY[0x24BDD1710]);
    v2 = (void *)SUUIWishlistOperationQueue_sQueue;
    SUUIWishlistOperationQueue_sQueue = (uint64_t)v1;

    objc_msgSend((id)SUUIWishlistOperationQueue_sQueue, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend((id)SUUIWishlistOperationQueue_sQueue, "setName:", CFSTR("com.apple.iTunesStoreUI.SSWishlist"));
    v0 = (void *)SUUIWishlistOperationQueue_sQueue;
  }
  return v0;
}

void sub_241EB5D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 _SUUIIndexBarControlInitialization(void *a1)
{
  void *v1;
  void *v2;
  __n128 result;
  id v9;

  v1 = (void *)MEMORY[0x24BEBD4B8];
  v9 = a1;
  objc_msgSend(v1, "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v2);

  objc_msgSend(v9, "setContentMode:", 3);
  objc_msgSend(v9, "setDeliversTouchesForGesturesToSuperview:", 0);
  objc_msgSend(v9, "setExclusiveTouch:", 1);
  *((_OWORD *)v9 + 37) = xmmword_241EFD1C0;
  *((_OWORD *)v9 + 38) = xmmword_241EFD1C0;
  *((_BYTE *)v9 + 489) = 1;
  *((_BYTE *)v9 + 490) = 1;
  *((_BYTE *)v9 + 491) = 1;
  *((_BYTE *)v9 + 492) = 1;
  __asm { FMOV            V0.2D, #-3.0 }
  *((_OWORD *)v9 + 39) = _Q0;
  *((_OWORD *)v9 + 40) = _Q0;

  return result;
}

void sub_241EB7768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241EB7A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__104(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__104(uint64_t a1)
{

}

void sub_241EB7BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241EB8464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_241EB8D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_241EB8EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241EB9038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241EB91D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_241EB9420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_241EBB7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__105(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__105(uint64_t a1)
{

}

void sub_241EBB8E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SUUIMetricsMediaEventTypeForPlaybackState(id a1)
{
  if ((unint64_t)a1 <= 2)
    a1 = **((id **)&unk_2511FE340 + (_QWORD)a1);
  return a1;
}

id SUUICollectionViewCellForView(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "superview");
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)v1;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v3 = v2;
      else
        v3 = 0;
      objc_msgSend(v2, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
        break;
      v2 = v4;
    }
    while (v4);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }

  return v3;
}

id SUUICollectionViewForView(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "superview");
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)v1;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v3 = v2;
      else
        v3 = 0;
      objc_msgSend(v2, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
        break;
      v2 = v4;
    }
    while (v4);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }

  return v3;
}

void SUUIEditorialStyleForDictionary(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v3 = a1;
  *(_OWORD *)a2 = xmmword_241EFBEE0;
  *(_QWORD *)(a2 + 16) = 0x4120000041600000;
  *(_QWORD *)(a2 + 24) = 2;
  *(_QWORD *)(a2 + 32) = 0x40A0000041880000;
  v13 = v3;
  objc_msgSend(v3, "objectForKey:", CFSTR("align"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(_QWORD *)a2 = SUUIPageComponentAlignmentForString(v4);
  objc_msgSend(v13, "objectForKey:", CFSTR("bodySize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(float *)(a2 + 16) = SUUIEditorialBodySizeForString(v5);
    *(_QWORD *)(a2 + 8) = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "floatValue");
    *(_DWORD *)(a2 + 16) = v6;
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("bodyWeight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(_QWORD *)(a2 + 8) = SUUIPageComponentFontWeightForString(v7);
  objc_msgSend(v13, "objectForKey:", CFSTR("titleSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(float *)(a2 + 20) = SUUIEditorialLinkSpacingForString(v8);
    *(float *)(a2 + 32) = SUUIEditorialTitleSizeForString(v8);
    *(_QWORD *)(a2 + 24) = SUUIEditorialTitleWeightForString(v8);
    *(float *)(a2 + 36) = SUUIEditorialTitleSpacingForString(v8);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "floatValue");
    *(_DWORD *)(a2 + 32) = v9;
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("titleSpacing"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "floatValue");
    *(_DWORD *)(a2 + 36) = v11;
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("titleWeight"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(_QWORD *)(a2 + 24) = SUUIPageComponentFontWeightForString(v12);

}

uint64_t SUUICTTextAlignmentForPageComponentAlignment(unint64_t a1)
{
  unsigned int v1;

  v1 = 0x1020000u >> (8 * a1);
  if (a1 >= 4)
    LOBYTE(v1) = 2;
  return v1 & 3;
}

float SUUIEditorialBodySizeForString(void *a1)
{
  id v1;
  float v2;
  float v3;

  v1 = a1;
  v2 = 11.0;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) == 0)
  {
    v2 = 12.0;
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("S")) & 1) == 0)
    {
      v2 = 17.0;
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("M")) & 1) == 0)
      {
        v2 = 24.0;
        if ((objc_msgSend(v1, "isEqualToString:", CFSTR("L")) & 1) == 0)
        {
          objc_msgSend(v1, "floatValue");
          v2 = v3;
        }
      }
    }
  }

  return v2;
}

uint64_t SUUIEditorialBodyWeightForString()
{
  return 1;
}

double SUUIEditorialStyleDefault@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_OWORD *)a1 = xmmword_241EFBEE0;
  *(_QWORD *)(a1 + 16) = 0x4120000041600000;
  *(_QWORD *)(a1 + 24) = 2;
  result = 2048.0005;
  *(_QWORD *)(a1 + 32) = 0x40A0000041880000;
  return result;
}

uint64_t SUUIPageComponentAlignmentForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("left")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("right")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("center")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

float SUUIEditorialLinkSpacingForString(void *a1)
{
  id v1;
  float v2;
  float v3;

  v1 = a1;
  v2 = 10.0;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) == 0)
  {
    v2 = 9.0;
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("S")) & 1) == 0)
    {
      v2 = 12.0;
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("M")) & 1) == 0)
      {
        v2 = 14.0;
        if ((objc_msgSend(v1, "isEqualToString:", CFSTR("L")) & 1) == 0)
        {
          objc_msgSend(v1, "floatValue");
          v2 = v3;
        }
      }
    }
  }

  return v2;
}

float SUUIEditorialTitleSizeForString(void *a1)
{
  id v1;
  float v2;
  float v3;

  v1 = a1;
  v2 = 14.0;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) == 0)
  {
    v2 = 17.0;
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("S")) & 1) == 0)
    {
      v2 = 25.0;
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("M")) & 1) == 0)
      {
        if ((objc_msgSend(v1, "isEqualToString:", CFSTR("L")) & 1) != 0)
        {
          v2 = 42.0;
        }
        else
        {
          objc_msgSend(v1, "floatValue");
          v2 = v3;
        }
      }
    }
  }

  return v2;
}

uint64_t SUUIEditorialTitleWeightForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("S")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("M")))
  {
    v2 = 1;
  }
  else
  {
    v2 = 2;
  }

  return v2;
}

float SUUIEditorialTitleSpacingForString(void *a1)
{
  id v1;
  float v2;

  v1 = a1;
  v2 = 2.0;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) == 0)
  {
    v2 = 13.0;
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("M")) & 1) == 0)
    {
      if (objc_msgSend(v1, "isEqualToString:", CFSTR("L")))
        v2 = 18.0;
      else
        v2 = 5.0;
    }
  }

  return v2;
}

double SUUIBrickItemSize()
{
  void *v0;
  uint64_t v1;
  double v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 1)
  {
    v2 = 210.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;

    if (v5 <= 375.0)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v8 = v7;

      v2 = dbl_241EFC2D0[v8 > 320.0];
    }
    else
    {
      v2 = 175.0;
    }
  }
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;

  return v2 * v11;
}

void SUUIDecodeRestorableStateWithCoder(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a2;
  v6 = a1;
  objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v7, 0);
    objc_msgSend(v9, "decodeRestorableStateWithCoder:", v8);
    objc_msgSend(v8, "finishDecoding");

  }
}

void SUUIEncodeRestorableStateWithCoder(void *a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  if (a3)
  {
    v5 = (objc_class *)MEMORY[0x24BDD1618];
    v6 = a3;
    v7 = a2;
    v8 = a1;
    v10 = (id)objc_msgSend([v5 alloc], "initRequiringSecureCoding:", 1);
    objc_msgSend(v6, "encodeRestorableStateWithCoder:", v10);

    objc_msgSend(v10, "encodedData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v9, v7);

  }
}

void sub_241EC2A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__106(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__106(uint64_t a1)
{

}

const char *sub_241EC2D7C()
{
  return "MobileStore";
}

uint64_t sub_241EC2D90(unsigned __int8 a1)
{
  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_241EC2DBC + 4 * byte_241EFD230[a1]))("tv_stop_pages", 13);
}

const char *sub_241EC2DBC()
{
  return "stop_page_respected_onboarding";
}

const char *sub_241EC2DD0()
{
  return "always_show_tv_stop_pages";
}

const char *sub_241EC2DE4()
{
  return "alternate_stop_page_design";
}

uint64_t sub_241EC2DFC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_241EC2E3C + 4 * byte_241EFD234[a1]))(0x5F706F74735F7674, 0xED00007365676170);
}

unint64_t sub_241EC2E3C()
{
  return 0xD00000000000001ELL;
}

void sub_241EC2E90(char *a1)
{
  sub_241EC2E9C(*a1);
}

void sub_241EC2E9C(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_241EC2F10@<X0>(unsigned __int8 a1@<W1>, uint64_t a2@<X8>)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_241EC2F6C + 4 * byte_241EFD23C[a1]))(a2 + 5);
}

uint64_t sub_241EC2F6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v3;

  if (a1 == a2 + 5 && v2 == 0x8000000241F0EC80)
    v3 = 1;
  else
    v3 = sub_241ECBA08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_241EC3000()
{
  char *v0;

  sub_241EC3008(*v0);
}

void sub_241EC3008(char a1)
{
  sub_241ECBA20();
  __asm { BR              X10 }
}

uint64_t sub_241EC3064()
{
  sub_241ECB900();
  swift_bridgeObjectRelease();
  return sub_241ECBA38();
}

void sub_241EC30E0(uint64_t a1)
{
  char *v1;

  sub_241EC30E8(a1, *v1);
}

void sub_241EC30E8(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_241EC3134()
{
  sub_241ECB900();
  return swift_bridgeObjectRelease();
}

void sub_241EC319C(uint64_t a1)
{
  char *v1;

  sub_241EC31A4(a1, *v1);
}

void sub_241EC31A4(uint64_t a1, char a2)
{
  sub_241ECBA20();
  __asm { BR              X10 }
}

uint64_t sub_241EC31FC()
{
  sub_241ECB900();
  swift_bridgeObjectRelease();
  return sub_241ECBA38();
}

uint64_t sub_241EC3278@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_241EC7D34();
  *a1 = result;
  return result;
}

uint64_t sub_241EC32A4@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_241EC2DFC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_241EC32CC()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_241EC32F4 + 4 * byte_241EFD24C[*v0]))("tv_stop_pages", 13);
}

const char *sub_241EC32F4()
{
  return "stop_page_respected_onboarding";
}

const char *sub_241EC3308()
{
  return "always_show_tv_stop_pages";
}

const char *sub_241EC331C()
{
  return "alternate_stop_page_design";
}

uint64_t sub_241EC3330@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  unint64_t v15;
  char v16;
  uint64_t v17;
  void (*v19)(char *, char *, uint64_t);
  unint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25718C830);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_241ECB7E0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for SUUIStopPageViewController.PageArtwork(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    if (*(_QWORD *)(a1 + 16)
      && (v15 = sub_241EC78FC(7107189, 0xE300000000000000), (v16 & 1) != 0)
      && (sub_241EC7DD0(*(_QWORD *)(a1 + 56) + 32 * v15, (uint64_t)&v28), (swift_dynamicCast() & 1) != 0))
    {
      sub_241ECB7D4();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
      {
        swift_bridgeObjectRelease();
        sub_241EC8A40((uint64_t)v6, &qword_25718C830);
      }
      else
      {
        v19 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
        v19(v10, v6, v7);
        if (*(_QWORD *)(a1 + 16)
          && (v20 = sub_241EC78FC(0x6874646977, 0xE500000000000000), (v21 & 1) != 0)
          && (sub_241EC7DD0(*(_QWORD *)(a1 + 56) + 32 * v20, (uint64_t)&v28), (swift_dynamicCast() & 1) != 0))
        {
          v22 = v27;
          if (*(_QWORD *)(a1 + 16) && (v23 = sub_241EC78FC(0x746867696568, 0xE600000000000000), (v24 & 1) != 0))
          {
            sub_241EC7DD0(*(_QWORD *)(a1 + 56) + 32 * v23, (uint64_t)&v28);
          }
          else
          {
            v28 = 0u;
            v29 = 0u;
          }
          swift_bridgeObjectRelease();
          if (*((_QWORD *)&v29 + 1))
          {
            if ((swift_dynamicCast() & 1) != 0)
            {
              v25 = v27;
              v19(v14, v10, v7);
              v26 = &v14[*(int *)(v11 + 20)];
              *(_QWORD *)v26 = v22;
              *((_QWORD *)v26 + 1) = v25;
              sub_241EC7E0C((uint64_t)v14, a2);
              v17 = 0;
              return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(a2, v17, 1, v11);
            }
          }
          else
          {
            sub_241EC8A40((uint64_t)&v28, &qword_25718C838);
          }
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  v17 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(a2, v17, 1, v11);
}

uint64_t sub_241EC3638@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_241ECB7E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

double sub_241EC3670()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for SUUIStopPageViewController.PageArtwork(0) + 20));
}

uint64_t sub_241EC36B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v5;

  v5 = sub_241ECB8DC();
  LOBYTE(a4) = a4(v5);
  swift_bridgeObjectRelease();
  return a4 & 1;
}

id SUUIStopPageViewController.__allocating_init(tabIdentifier:replacementAppAdamId:title:subtitle:artworkDictionar:deeplinkUrl:purchasesUrl:wishlistButtonTitle:showWishlistButton:clientContext:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, uint64_t a11, char a12, void *a13)
{
  objc_class *v13;
  id v20;
  id v21;

  v20 = objc_allocWithZone(v13);
  v21 = sub_241EC8278(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10, *((uint64_t *)&a10 + 1), a11, a12, a13);

  return v21;
}

id SUUIStopPageViewController.init(tabIdentifier:replacementAppAdamId:title:subtitle:artworkDictionar:deeplinkUrl:purchasesUrl:wishlistButtonTitle:showWishlistButton:clientContext:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, void *a15)
{
  id v15;

  v15 = sub_241EC8278(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);

  return v15;
}

uint64_t variable initialization expression of SUUIStopPageViewController.lockupView()
{
  return 0;
}

id sub_241EC3A94(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

void sub_241EC3AD4()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView] = 0;

  sub_241ECB9D8();
  __break(1u);
}

Swift::Void __swiftcall SUUIStopPageViewController.viewDidLoad()()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  void *v22;
  id v23;
  char *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  objc_super v37;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25718C830);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v31 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25718C840);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (objc_class *)type metadata accessor for SUUIStopPageViewController(0);
  v37.receiver = v1;
  v37.super_class = v11;
  objc_msgSendSuper2(&v37, sel_viewDidLoad);
  v12 = objc_msgSend(v1, sel_view);
  if (!v12)
  {
    __break(1u);
    goto LABEL_8;
  }
  v13 = v12;
  v14 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
  objc_msgSend(v13, sel_setBackgroundColor_, v14);

  v15 = *(_QWORD *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_replacementAppAdamId];
  v16 = *(_QWORD *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_replacementAppAdamId + 8];
  v17 = *(_QWORD *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageTitle + 8];
  v35 = *(_QWORD *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageTitle];
  v36 = v15;
  v18 = *(_QWORD *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageSubtitle + 8];
  v34 = *(_QWORD *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageSubtitle];
  sub_241ECA0FC((uint64_t)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageArtwork], (uint64_t)v10, &qword_25718C840);
  sub_241ECA0FC((uint64_t)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_deeplinkUrl], (uint64_t)v7, &qword_25718C830);
  sub_241ECA0FC((uint64_t)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_purchasesUrl], (uint64_t)v5, &qword_25718C830);
  v19 = *(_QWORD *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_wishlistButtonTitle];
  v20 = *(_QWORD *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_wishlistButtonTitle + 8];
  v32 = v5;
  v33 = v19;
  v21 = v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_showWishlistButton];
  v22 = *(void **)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_clientContext];
  objc_allocWithZone((Class)type metadata accessor for SUUIStopPageViewController.StopPageLockup());
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v23 = v22;
  v24 = sub_241EC45E8(v36, v16, v35, v17, v34, v18, (uint64_t)v10, (uint64_t)v7, (uint64_t)v32, v33, v20, v21, v23);
  v25 = OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView;
  v26 = *(void **)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView];
  *(_QWORD *)&v1[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView] = v24;

  v27 = objc_msgSend(v1, sel_view);
  if (!v27)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (!*(_QWORD *)&v1[v25])
  {
LABEL_9:
    __break(1u);
    return;
  }
  v28 = v27;
  objc_msgSend(v27, sel_addSubview_);

  v29 = objc_msgSend(v1, sel_navigationController);
  if (v29)
  {
    v30 = v29;
    objc_msgSend(v29, sel_setNavigationBarHidden_animated_, 1, 0);

  }
}

uint64_t SUUIStopPageViewController.supportedInterfaceOrientations.getter()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  if (v1)
    return 30;
  else
    return 2;
}

Swift::Void __swiftcall SUUIStopPageViewController.viewDidLayoutSubviews()()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double MidX;
  id v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  objc_super v37;
  CGRect v38;
  CGRect v39;

  v37.receiver = v0;
  v37.super_class = (Class)type metadata accessor for SUUIStopPageViewController(0);
  objc_msgSendSuper2(&v37, sel_viewDidLayoutSubviews);
  v1 = OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView;
  v2 = *(void **)&v0[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView];
  if (!v2)
  {
    __break(1u);
    goto LABEL_8;
  }
  v3 = v2;
  v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v5 = v4;
  objc_msgSend(v4, sel_bounds);
  v7 = v6;
  v9 = v8;

  objc_msgSend(v3, sel_sizeThatFits_, v7, v9);
  v11 = v10;
  v13 = v12;

  v14 = *(void **)&v0[v1];
  if (!v14)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v15 = v14;
  v16 = objc_msgSend(v0, sel_view);
  if (!v16)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v17 = v16;
  objc_msgSend(v16, sel_bounds);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v38.origin.x = v19;
  v38.origin.y = v21;
  v38.size.width = v23;
  v38.size.height = v25;
  MidX = CGRectGetMidX(v38);
  v27 = objc_msgSend(v0, sel_view);
  if (v27)
  {
    v28 = v27;
    objc_msgSend(v27, sel_bounds);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;

    v39.origin.x = v30;
    v39.origin.y = v32;
    v39.size.width = v34;
    v39.size.height = v36;
    objc_msgSend(v15, sel_setFrame_, MidX - v11 * 0.5, CGRectGetMidY(v39) - v13 * 0.5, v11, v13);

    return;
  }
LABEL_11:
  __break(1u);
}

Swift::Void __swiftcall SUUIStopPageViewController.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  void *v1;
  Class isa;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  id v11;
  void *v12;
  objc_super v13;

  isa = a1.value.super.isa;
  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for SUUIStopPageViewController(0);
  objc_msgSendSuper2(&v13, sel_traitCollectionDidChange_, isa);
  if (isa)
    isa = (Class)-[objc_class preferredContentSizeCategory](isa, sel_preferredContentSizeCategory);
  v3 = objc_msgSend(v1, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  if (isa)
  {
    v5 = sub_241ECB8DC();
    v7 = v6;
    if (v5 == sub_241ECB8DC() && v7 == v8)
    {

      swift_bridgeObjectRelease_n();
      return;
    }
    v10 = sub_241ECBA08();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      return;
  }
  else
  {

  }
  v11 = objc_msgSend(v1, sel_view);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, sel_setNeedsLayout);

  }
  else
  {
    __break(1u);
  }
}

id SUUIStopPageViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_241ECB8B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void SUUIStopPageViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SUUIStopPageViewController.__deallocating_deinit()
{
  return sub_241EC7110(0, (uint64_t (*)(void))type metadata accessor for SUUIStopPageViewController);
}

void sub_241EC4540()
{
  qword_25718D508 = 0x406C400000000000;
  qword_25718D510 = 0x405F000000000000;
}

void sub_241EC4560()
{
  qword_25718D520 = 0x4046000000000000;
  qword_25718D528 = 0x4046000000000000;
}

void sub_241EC4578()
{
  qword_25718D538 = 0x403E000000000000;
}

void sub_241EC4588()
{
  qword_25718D548 = 0x402E000000000000;
}

void sub_241EC4598()
{
  qword_25718D558 = 0x403E000000000000;
}

void sub_241EC45A8()
{
  qword_25718D568 = 0x402E000000000000;
}

void sub_241EC45B8()
{
  qword_25718D578 = 0x4014000000000000;
}

void sub_241EC45C8()
{
  qword_25718D588 = 0x4032000000000000;
}

void sub_241EC45D8()
{
  qword_25718D598 = 0x404C000000000000;
}

char *sub_241EC45E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned __int8 a12, void *a13)
{
  char *v13;
  char *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  char *v34;
  objc_class *v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  void *v69;
  id v70;
  CGFloat width;
  CGFloat height;
  uint64_t v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  CGSize v82;
  CGFloat *v83;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  objc_super v98;

  v14 = v13;
  v97 = a8;
  v89 = a5;
  v90 = a6;
  v87 = a3;
  v88 = a4;
  LODWORD(v92) = a12;
  v94 = a9;
  v95 = a7;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25718C840);
  MEMORY[0x24BDAC7A8](v16);
  v93 = (uint64_t)&v85 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v96 = type metadata accessor for SUUIStopPageViewController.PageArtwork(0);
  v91 = *(_QWORD *)(v96 - 8);
  MEMORY[0x24BDAC7A8](v96);
  v86 = (uint64_t)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageView;
  v20 = objc_allocWithZone(MEMORY[0x24BEBD668]);
  v21 = v13;
  *(_QWORD *)&v14[v19] = objc_msgSend(v20, sel_init);
  v22 = &v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageSize];
  *(_QWORD *)v22 = 0;
  *((_QWORD *)v22 + 1) = 0;
  v23 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_titleLabel;
  *(_QWORD *)&v21[v23] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  v24 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_subtitleLabel;
  *(_QWORD *)&v21[v24] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  v25 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton;
  *(_QWORD *)&v21[v25] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE04480]), sel_init);
  v26 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton;
  *(_QWORD *)&v21[v26] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD430]), sel_init);
  *(_QWORD *)&v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton] = 0;
  *(_QWORD *)&v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton] = 0;
  v27 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_resourceLoaderOperationQueue;
  *(_QWORD *)&v21[v27] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1710]), sel_init);
  v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible] = 0;
  v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable] = 2;
  if (a2)
  {
    v28 = objc_allocWithZone(MEMORY[0x24BE04450]);
    v29 = (void *)sub_241ECB8B8();
    swift_bridgeObjectRelease();
    v30 = objc_msgSend(v28, sel_initWithStringValue_, v29);

    v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE04478]), sel_initWithID_kind_context_, v30, *MEMORY[0x24BE04430], *MEMORY[0x24BE04408]);
  }
  else
  {
    v31 = 0;
  }
  *(_QWORD *)&v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_lockupRequest] = v31;
  v32 = *(void **)&v21[v27];
  objc_msgSend(v32, sel_setMaxConcurrentOperationCount_, 1);
  v33 = objc_msgSend(objc_allocWithZone((Class)SUUIResourceLoader), sel_initWithOperationQueue_, v32);
  *(_QWORD *)&v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_resourceLoader] = v33;
  v34 = &v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_wishlistButtonTitle];
  *(_QWORD *)v34 = a10;
  *((_QWORD *)v34 + 1) = a11;
  v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_showWishlistButton] = v92 & 1;
  *(_QWORD *)&v21[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_clientContext] = a13;
  v92 = a13;

  v35 = (objc_class *)type metadata accessor for SUUIStopPageViewController.StopPageLockup();
  v98.receiver = v21;
  v98.super_class = v35;
  v36 = objc_msgSendSuper2(&v98, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v37 = *MEMORY[0x24BEBE158];
  v38 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v39 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v40 = *(double *)(MEMORY[0x24BEBE158] + 24);
  v41 = (char *)v36;
  objc_msgSend(v41, sel_setLayoutMargins_, v37, v38, v39, v40);
  v42 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_titleLabel;
  v43 = *(void **)&v41[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_titleLabel];
  v44 = (void *)objc_opt_self();
  v45 = *MEMORY[0x24BEBE240];
  v46 = v43;
  v47 = objc_msgSend(v44, sel_preferredFontForTextStyle_, v45);
  v48 = sub_241EC4F68(*MEMORY[0x24BEBB5E8]);

  objc_msgSend(v46, sel_setFont_, v48);
  v49 = *(void **)&v41[v42];
  objc_msgSend(v49, sel_setTextAlignment_, 1);
  objc_msgSend(v49, sel_setNumberOfLines_, 3);
  v50 = v49;
  v51 = (void *)sub_241ECB8B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v50, sel_setText_, v51);

  v52 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_subtitleLabel;
  v53 = *MEMORY[0x24BEBE1D0];
  v54 = *(id *)&v41[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_subtitleLabel];
  v55 = objc_msgSend(v44, sel_preferredFontForTextStyle_, v53);
  objc_msgSend(v54, sel_setFont_, v55);

  v56 = *(void **)&v41[v52];
  objc_msgSend(v56, sel_setTextAlignment_, 1);
  objc_msgSend(v56, sel_setNumberOfLines_, 4);
  v57 = (void *)objc_opt_self();
  v58 = v56;
  v59 = objc_msgSend(v57, sel_secondaryLabelColor);
  objc_msgSend(v58, sel_setTextColor_, v59);

  v60 = *(id *)&v41[v52];
  v61 = (void *)sub_241ECB8B8();
  swift_bridgeObjectRelease();
  objc_msgSend(v60, sel_setText_, v61);

  v62 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageView;
  objc_msgSend(v41, sel_addSubview_, *(_QWORD *)&v41[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageView]);
  objc_msgSend(v41, sel_addSubview_, *(_QWORD *)&v41[v42]);
  objc_msgSend(v41, sel_addSubview_, *(_QWORD *)&v41[v52]);
  v63 = *(void **)&v41[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton];
  objc_msgSend(v41, sel_addSubview_, v63);
  v64 = v97;
  v65 = v94;
  sub_241EC5D60(v97, v94);
  objc_msgSend(v63, sel_setLockupSize_, *MEMORY[0x24BE04448]);
  objc_msgSend(v63, sel_setAlpha_, 0.0);
  objc_msgSend(v63, sel_setShowsPlaceholderContent_, 0);
  objc_msgSend(v63, sel_setDelegate_, v41);
  objc_msgSend(v63, sel_setRequest_, *(_QWORD *)&v41[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_lockupRequest]);
  v66 = v95;
  v67 = v93;
  sub_241ECA0FC(v95, v93, &qword_25718C840);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v91 + 48))(v67, 1, v96) == 1)
  {
    sub_241EC8A40(v67, &qword_25718C840);
    v68 = *(id *)&v41[v62];
    v69 = (void *)sub_241ECB8B8();
    v70 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_, v69);

    objc_msgSend(v68, sel_setImage_, v70);
    if (qword_25718D500 != -1)
      swift_once();
    width = *(double *)&qword_25718D508;
    height = *(double *)&qword_25718D510;

    sub_241EC8A40(v65, &qword_25718C830);
    sub_241EC8A40(v64, &qword_25718C830);
    sub_241EC8A40(v66, &qword_25718C840);
  }
  else
  {
    v73 = v86;
    sub_241EC7E0C(v67, v86);
    v74 = objc_msgSend(objc_allocWithZone((Class)SUUIArtworkRequest), sel_init);
    v75 = (void *)sub_241ECB7BC();
    objc_msgSend(v74, sel_setCacheKey_, v75);

    v76 = objc_msgSend(objc_allocWithZone((Class)SUUIImageDataConsumer), sel_init);
    objc_msgSend(v74, sel_setDataConsumer_, v76);
    v77 = (void *)sub_241ECB7BC();
    objc_msgSend(v74, sel_setURL_, v77);

    objc_msgSend(v74, sel_setDelegate_, v41);
    objc_msgSend(*(id *)&v41[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_resourceLoader], sel_loadResourceWithRequest_reason_, v74, 1);
    v78 = *(id *)&v41[v62];
    v79 = objc_msgSend(v57, sel_secondarySystemBackgroundColor);
    objc_msgSend(v78, sel_setBackgroundColor_, v79);

    if (qword_25718D500 != -1)
      swift_once();
    v80 = qword_25718D508;
    v81 = qword_25718D510;

    sub_241EC8A40(v65, &qword_25718C830);
    sub_241EC8A40(v97, &qword_25718C830);
    sub_241EC8A40(v66, &qword_25718C840);
    sub_241ECA140(v73);
    v82 = CGSize.maxSize(fitting:)((CGSize)__PAIR128__(v81, v80));
    width = v82.width;
    height = v82.height;
  }
  v83 = (CGFloat *)&v41[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageSize];
  *v83 = width;
  v83[1] = height;
  return v41;
}

id sub_241EC4F68(double a1)
{
  void *v1;
  id v3;
  uint64_t inited;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  id v12;
  double v13;
  id v14;

  v3 = objc_msgSend(v1, sel_fontDescriptor);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25718C860);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_241EFDAB0;
  v5 = (void *)*MEMORY[0x24BEBB590];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBB590];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25718C868);
  v6 = swift_initStackObject();
  *(_OWORD *)(v6 + 16) = xmmword_241EFDAB0;
  v7 = (void *)*MEMORY[0x24BEBB620];
  *(_QWORD *)(v6 + 32) = *MEMORY[0x24BEBB620];
  *(double *)(v6 + 40) = a1;
  v8 = v5;
  v9 = v7;
  v10 = sub_241EC6BA8(v6);
  *(_QWORD *)(inited + 64) = __swift_instantiateConcreteTypeFromMangledName(&qword_25718C870);
  *(_QWORD *)(inited + 40) = v10;
  sub_241EC6CB0(inited);
  type metadata accessor for AttributeName(0);
  sub_241EC9188(&qword_25718C878, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_241EFD870);
  v11 = (void *)sub_241ECB870();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v3, sel_fontDescriptorByAddingAttributes_, v11);

  objc_msgSend(v1, sel_pointSize);
  v14 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v12, v13);

  return v14;
}

CGSize __swiftcall CGSize.maxSize(fitting:)(CGSize fitting)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  if (fitting.height == 0.0)
  {
    if (v2 == 0.0 || (v3 = v1 / v2, v1 / v2 >= 0.0))
    {
LABEL_12:
      v6 = v2 / v1;
      if (v1 == 0.0)
        v6 = 0.0;
      fitting.height = v6 * fitting.width;
      return fitting;
    }
  }
  else
  {
    v4 = fitting.width / fitting.height;
    if (v2 == 0.0)
    {
      if (v4 <= 0.0)
        goto LABEL_12;
      v3 = v1 / v2;
    }
    else
    {
      v3 = v1 / v2;
      if (v1 / v2 >= v4)
        goto LABEL_12;
    }
  }
  v5 = 0.0;
  if (v2 != 0.0)
    v5 = v3;
  fitting.width = v5 * fitting.height;
  return fitting;
}

double sub_241EC51AC()
{
  void *v0;
  double v1;
  double v2;
  CGRect v4;
  CGRect v5;

  objc_msgSend(v0, sel_layoutMargins);
  v2 = v1;
  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_bounds);
  CGRectGetWidth(v4);
  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_bounds);
  CGRectGetWidth(v5);
  objc_msgSend(v0, sel_layoutMargins);
  objc_msgSend(v0, sel_layoutMargins);
  return v2;
}

id sub_241EC5288(_BYTE *a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;

  v2 = *(void **)&a1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton];
  v3 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible;
  if (a1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible])
    v4 = 1.0;
  else
    v4 = 0.0;
  objc_msgSend(v2, sel_setAlpha_, v4);
  if (a1[v3])
    v5 = 1.0;
  else
    v5 = 0.0;
  objc_msgSend(*(id *)&a1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton], sel_setAlpha_, v5);
  v6 = *(void **)&a1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton];
  if (v6)
  {
    if (a1[v3])
      v7 = 1.0;
    else
      v7 = 0.0;
    objc_msgSend(v6, sel_setAlpha_, v7);
  }
  v8 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton;
  v9 = *(void **)&a1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton];
  if (v9)
  {
    objc_msgSend(v9, sel_setUserInteractionEnabled_, 1);
    v10 = *(void **)&a1[v8];
    if (v10)
    {
      v11 = 0.0;
      if (a1[v3])
        v11 = 1.0;
      objc_msgSend(v10, sel_setAlpha_, v11);
    }
  }
  return objc_msgSend(a1, sel_setNeedsLayout);
}

uint64_t sub_241EC537C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_241EC53A8(id result)
{
  _BYTE *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;

  v2 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable;
  v3 = v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable];
  if (v3 == 2)
  {
    if (result == 2)
      return result;
    v4 = 0;
  }
  else
  {
    if (result != 2 && ((((result & 1) == 0) ^ v3) & 1) != 0)
      return result;
    v4 = v3 & 1;
  }
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton], sel_setHidden_, v4);
  objc_msgSend(*(id *)&v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton], sel_setHidden_, (v1[v2] & 1) == 0);
  v5 = *(void **)&v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton];
  if (v5)
    objc_msgSend(v5, sel_setHidden_, (v1[v2] & 1) == 0);
  return objc_msgSend(v1, sel_setNeedsLayout);
}

double sub_241EC5484(double a1, double a2)
{
  char *v2;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;

  v5 = *(double *)&v2[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageSize];
  if (qword_25718D518 != -1)
    swift_once();
  v6 = v5 + *(double *)&qword_25718D520 + *(double *)&qword_25718D528;
  if (qword_25718D530 != -1)
    swift_once();
  v7 = v6 + *(double *)&qword_25718D538;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_titleLabel], sel_sizeThatFits_, v7, 1.79769313e308);
  if (qword_25718D540 != -1)
    swift_once();
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_subtitleLabel], sel_sizeThatFits_, v7, 1.79769313e308);
  if (qword_25718D550 != -1)
    swift_once();
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton], sel_sizeThatFits_, a1, a2);
  if (qword_25718D560 != -1)
    swift_once();
  v8 = *(void **)&v2[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton];
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v2, sel_bounds);
    objc_msgSend(v9, sel_sizeThatFits_, v10, v11);
    if (qword_25718D570 != -1)
      swift_once();

  }
  v12 = *(void **)&v2[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton];
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v2, sel_bounds);
    objc_msgSend(v13, sel_sizeThatFits_, v14, v15);

  }
  return v7;
}

void sub_241EC577C()
{
  char *v0;
  void *v1;
  CGFloat MidX;
  double *v3;
  CGFloat v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double MaxY;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double MidY;
  double v41;
  uint64_t v42;
  void *v43;
  id v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  id v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  double v58;
  double v59;
  double v60;
  double v61;
  id v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  id v70;
  objc_super v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v71.receiver = v0;
  v71.super_class = (Class)type metadata accessor for SUUIStopPageViewController.StopPageLockup();
  objc_msgSendSuper2(&v71, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageView];
  v72.origin.x = sub_241EC51AC();
  MidX = CGRectGetMidX(v72);
  v3 = (double *)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageSize];
  v4 = MidX
     - *(double *)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageSize]
     * 0.5;
  v73.origin.x = sub_241EC51AC();
  objc_msgSend(v1, sel_setFrame_, v4, CGRectGetMinY(v73), *v3, v3[1]);
  v5 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_titleLabel];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v5, sel_sizeThatFits_, v6, v7);
  v9 = v8;
  v11 = v10;
  objc_msgSend(v0, sel_bounds);
  v12 = CGRectGetMidX(v74) - v9 * 0.5;
  objc_msgSend(v1, sel_frame);
  MaxY = CGRectGetMaxY(v75);
  if (qword_25718D530 != -1)
    swift_once();
  objc_msgSend(v5, sel_setFrame_, v12, MaxY + *(double *)&qword_25718D538, v9, v11);
  v14 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_subtitleLabel];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v14, sel_sizeThatFits_, v15, v16);
  v18 = v17;
  v20 = v19;
  objc_msgSend(v0, sel_bounds);
  v21 = CGRectGetMidX(v76) + v18 * -0.5;
  objc_msgSend(v5, sel_frame);
  v22 = CGRectGetMaxY(v77);
  if (qword_25718D540 != -1)
    swift_once();
  objc_msgSend(v14, sel_setFrame_, v21, v22 + *(double *)&qword_25718D548, v18, v20);
  v23 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v23, sel_sizeThatFits_, v24, v25);
  v27 = v26;
  v29 = v28;
  objc_msgSend(v0, sel_bounds);
  v30 = CGRectGetMidX(v78) + v27 * -0.5;
  objc_msgSend(v14, sel_frame);
  v31 = CGRectGetMaxY(v79);
  if (qword_25718D550 != -1)
    swift_once();
  objc_msgSend(v23, sel_setFrame_, v30, v31 + *(double *)&qword_25718D558, v27, v29);
  v32 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton];
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v32, sel_sizeThatFits_, v33, v34);
  v36 = v35;
  v38 = v37;
  objc_msgSend(v0, sel_bounds);
  v39 = CGRectGetMidX(v80);
  objc_msgSend(v23, sel_frame);
  MidY = CGRectGetMidY(v81);
  if (qword_25718D590 != -1)
    swift_once();
  if (*(double *)&qword_25718D598 > v36)
    v41 = *(double *)&qword_25718D598;
  else
    v41 = v36;
  objc_msgSend(v32, sel_setFrame_, v39 - v36 * 0.5, MidY - v38 * 0.5, v41, v38);
  v42 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton;
  v43 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton];
  if (v43)
  {
    v44 = v43;
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v44, sel_sizeThatFits_, v45, v46);
    v48 = v47;
    v50 = v49;
    v51 = v44;
    objc_msgSend(v0, sel_bounds);
    v52 = CGRectGetMidX(v82) + v48 * -0.5;
    objc_msgSend(v32, sel_frame);
    v53 = CGRectGetMaxY(v83);
    if (qword_25718D560 != -1)
      swift_once();
    objc_msgSend(v51, sel_setFrame_, v52, v53 + *(double *)&qword_25718D568, v48, v50);

  }
  v54 = *(void **)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton];
  if (v54)
  {
    v55 = *(void **)&v0[v42];
    if (v55)
    {
      v56 = v54;
      v57 = v55;
      if ((objc_msgSend(v57, sel_isHidden) & 1) == 0)
      {
        objc_msgSend(v57, sel_alpha);
        if (v58 > 0.0)
        {
          objc_msgSend(v57, sel_frame);
          v59 = CGRectGetMaxY(v84);
          if (qword_25718D570 != -1)
            swift_once();
          v60 = *(double *)&qword_25718D578;

          v61 = v59 + v60;
LABEL_28:
          objc_msgSend(v0, sel_bounds);
          objc_msgSend(v54, sel_sizeThatFits_, v64, v65);
          v67 = v66;
          v69 = v68;
          v70 = v54;
          objc_msgSend(v0, sel_bounds);
          objc_msgSend(v70, sel_setFrame_, CGRectGetMidX(v86) + v67 * -0.5, v61, v67, v69);

          return;
        }
      }

    }
    else
    {
      v62 = v54;
    }
    objc_msgSend(v32, sel_frame);
    v63 = CGRectGetMaxY(v85);
    if (qword_25718D560 != -1)
      swift_once();
    v61 = v63 + *(double *)&qword_25718D568;
    goto LABEL_28;
  }
}

uint64_t sub_241EC5D60(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void *v26;
  uint64_t v27;
  void (*v28)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t ObjCClassFromMetadata;
  void *v30;
  id v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  char *v39;
  id v40;
  char *v41;
  id v42;
  char *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void (*v55)(char *, uint64_t);
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  void (*v70)(char *, _QWORD, uint64_t, uint64_t);
  char *v71;
  void (*v72)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v73;
  char *v74;
  uint64_t v75;
  char v76[24];
  ValueMetadata *v77;
  unint64_t v78;

  v3 = v2;
  v68 = a2;
  v64 = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25718C830);
  v63 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v65 = v5;
  v67 = (uint64_t)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25718CAE0);
  MEMORY[0x24BDAC7A8](v6);
  v71 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_241ECB7F8();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_241ECB8AC();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25718CAE8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_241ECB93C();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_241ECB990();
  v75 = *(_QWORD *)(v19 - 8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v58 = (char *)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v74 = (char *)&v57 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v57 - v24;
  v26 = *(void **)&v3[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton];
  objc_msgSend(v26, sel_setAlpha_, 0.0);
  objc_msgSend(v26, sel_setHidden_, 1);
  sub_241ECB984();
  (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, *MEMORY[0x24BEBD070], v15);
  sub_241ECB948();
  swift_allocObject();
  v66 = v3;
  swift_unknownObjectWeakInit();
  sub_241ECB864();
  v27 = sub_241ECB858();
  v28 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56);
  v28(v14, 0, 1, v27);
  sub_241ECB960();
  if (qword_25718D580 != -1)
    swift_once();
  v72 = v28;
  v73 = v27;
  sub_241ECB954();
  v77 = &type metadata for MobileStore;
  v78 = sub_241EC9398();
  v76[0] = 3;
  sub_241ECB834();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v76);
  v61 = v11;
  sub_241ECB8A0();
  type metadata accessor for SUUIStopPageViewController(0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v30 = (void *)objc_opt_self();
  v62 = ObjCClassFromMetadata;
  v31 = objc_msgSend(v30, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_241ECB7EC();
  sub_241ECB8E8();
  v32 = v75;
  v33 = v71;
  sub_241ECB978();
  v71 = *(char **)(v32 + 16);
  v69 = v25;
  ((void (*)(char *, char *, uint64_t))v71)(v33, v25, v19);
  v70 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56);
  v70(v33, 0, 1, v19);
  sub_241ECB99C();
  v59 = sub_241EC9E7C(0, &qword_25718CAF8);
  v34 = v67;
  sub_241ECA0FC(v64, v67, &qword_25718C830);
  v35 = *(unsigned __int8 *)(v63 + 80);
  v63 = ((v35 + 16) & ~v35) + v65;
  v64 = (v35 + 16) & ~v35;
  v36 = v64;
  v60 = v35 | 7;
  v37 = swift_allocObject();
  sub_241ECA17C(v34, v37 + v36, &qword_25718C830);
  v38 = (void *)sub_241ECB930();
  objc_msgSend(v26, sel_addAction_forControlEvents_, v38, 64);

  v39 = v66;
  objc_msgSend(v66, sel_addSubview_, v26);
  v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD430]), sel_init);
  objc_msgSend(v40, sel_setHidden_, 1);
  objc_msgSend(v40, sel_setAlpha_, 0.0);
  v41 = v74;
  sub_241ECB96C();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_241ECB864();
  v72(v14, 0, 1, v73);
  sub_241ECB960();
  sub_241ECB8A0();
  type metadata accessor for SUUIStopPageViewController(0);
  v42 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v62);
  sub_241ECB7EC();
  sub_241ECB8E8();
  sub_241ECB978();
  ((void (*)(char *, char *, uint64_t))v71)(v33, v41, v19);
  v65 = v19;
  v70(v33, 0, 1, v19);
  v43 = v33;
  sub_241ECB99C();
  sub_241ECA0FC(v68, v34, &qword_25718C830);
  v44 = swift_allocObject();
  sub_241ECA17C(v34, v44 + v64, &qword_25718C830);
  v45 = (void *)sub_241ECB930();
  objc_msgSend(v40, sel_addAction_forControlEvents_, v45, 64);

  objc_msgSend(v39, sel_addSubview_, v40);
  v46 = *(void **)&v39[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton];
  *(_QWORD *)&v39[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton] = v40;
  v47 = v40;

  if (v39[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_showWishlistButton] == 1)
  {
    v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD430]), sel_init);
    objc_msgSend(v48, sel_setUserInteractionEnabled_, 0);
    objc_msgSend(v48, sel_setAlpha_, 0.0);
    v49 = v58;
    sub_241ECB96C();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_241ECB864();
    v72(v14, 0, 1, v73);
    sub_241ECB960();
    swift_bridgeObjectRetain();
    sub_241ECB978();
    v50 = v43;
    v51 = v43;
    v52 = v65;
    ((void (*)(char *, char *, uint64_t))v71)(v51, v49, v65);
    v70(v50, 0, 1, v52);
    sub_241ECB99C();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    v53 = (void *)sub_241ECB930();
    objc_msgSend(v48, sel_addAction_forControlEvents_, v53, 64);

    objc_msgSend(v39, sel_addSubview_, v48);
    v54 = *(void **)&v39[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton];
    *(_QWORD *)&v39[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton] = v48;

    v55 = *(void (**)(char *, uint64_t))(v75 + 8);
    v55(v49, v52);
  }
  else
  {

    v55 = *(void (**)(char *, uint64_t))(v75 + 8);
    v52 = v65;
  }
  v55(v74, v52);
  return ((uint64_t (*)(char *, uint64_t))v55)(v69, v52);
}

void sub_241EC6758(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t KeyPath;
  id v9;
  id v10;
  double v11;

  v5 = a2 + 16;
  swift_beginAccess();
  v6 = (void *)MEMORY[0x2426A2CF8](v5);
  v7 = sub_241ECB7A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a3, a1, v7);
  if (v6)
  {
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    swift_getKeyPath();
    v9 = objc_msgSend(v6, sel_traitCollection);
    v10 = objc_msgSend(v9, sel_preferredContentSizeCategory);
    v11 = 13.0;
    if ((sub_241ECB924() & 1) == 0)
    {
      v11 = 15.0;
      if ((sub_241ECB924() & 1) == 0)
      {
        sub_241ECB924();
        v11 = 18.0;
      }
    }
    objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, v11, *MEMORY[0x24BEBB5E8]);

    sub_241EC96A8();
    sub_241ECB798();

  }
}

uint64_t sub_241EC68FC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25718CB20);
  return sub_241ECB894() & 1;
}

uint64_t sub_241EC6954()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25718CB20);
  return sub_241ECB888();
}

void sub_241EC6998()
{
  sub_241EC96A8();
  sub_241ECB7B0();
  __break(1u);
}

void sub_241EC69BC()
{
  sub_241ECB78C();
  __break(1u);
}

void sub_241EC69D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25718C830);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_241ECA0FC(a1, (uint64_t)v4, &qword_25718C830);
  v5 = sub_241ECB7E0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
  {
    v7 = (void *)sub_241ECB7BC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  SUUIMetricsOpenSensitiveURL(v7, 0);

}

void sub_241EC6AA0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t KeyPath;
  id v9;

  v5 = a2 + 16;
  swift_beginAccess();
  v6 = (void *)MEMORY[0x2426A2CF8](v5);
  v7 = sub_241ECB7A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a3, a1, v7);
  if (v6)
  {
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    swift_getKeyPath();
    v9 = objc_msgSend(v6, sel_traitCollection);
    sub_241EC9880(v9);

    sub_241EC96A8();
    sub_241ECB798();

  }
}

unint64_t sub_241EC6BA8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25718CB40);
  v2 = (_QWORD *)sub_241ECB9E4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = (id)*(v4 - 1);
    result = sub_241EC7960((uint64_t)v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v2[6] + v9) = v6;
    *(_QWORD *)(v2[7] + v9) = v5;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
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

unint64_t sub_241EC6CB0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25718CB30);
  v2 = sub_241ECB9E4();
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
    sub_241ECA0FC(v6, (uint64_t)&v13, &qword_25718CB38);
    v7 = v13;
    result = sub_241EC7960(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_241EC9624(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_241EC6DDC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25718CB08);
  v2 = sub_241ECB9E4();
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
    sub_241ECA0FC(v6, (uint64_t)v15, &qword_25718CB10);
    result = sub_241EC79EC((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_241EC9624(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

uint64_t sub_241EC6F40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

id sub_241EC6FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  void *v9;

  v3 = sub_241ECB8DC();
  v5 = v4;
  if (v3 == sub_241ECB8DC() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  v8 = sub_241ECBA08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
LABEL_8:
    v9 = (void *)*(unsigned __int8 *)(a2
                                    + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable);
    *(_BYTE *)(a2
             + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable) = 1;
    return sub_241EC53A8(v9);
  }
  v9 = (void *)*(unsigned __int8 *)(a2
                                  + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable);
  *(_BYTE *)(a2
           + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable) = 0;
  return sub_241EC53A8(v9);
}

id sub_241EC7104(uint64_t a1)
{
  return sub_241EC7110(a1, type metadata accessor for SUUIStopPageViewController.StopPageLockup);
}

id sub_241EC7110(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

double CGSize.horizontalFraction.getter(double a1, double a2)
{
  double result;

  result = a1 / a2;
  if (a2 == 0.0)
    return 0.0;
  return result;
}

double CGSize.verticalFraction.getter(double a1, double a2)
{
  double v2;
  BOOL v3;
  double result;

  v2 = a2 / a1;
  v3 = a1 == 0.0;
  result = 0.0;
  if (!v3)
    return v2;
  return result;
}

uint64_t sub_241EC7244()
{
  return sub_241ECB804();
}

uint64_t sub_241EC724C(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = MEMORY[0x2426A1954](a1, &v6);
  v4 = v7;
  v5 = v6;
  if (v7)
    v5 = 0;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4;
  return result;
}

uint64_t sub_241EC729C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v7;
  char v8;

  v7 = 0;
  v8 = 1;
  v3 = MEMORY[0x2426A1960](a1, &v7);
  v4 = v8;
  v5 = v7;
  if (v8)
    v5 = 0;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v4;
  return v3 & 1;
}

void sub_241EC72F0(double *a1@<X8>)
{
  *a1 = MEMORY[0x2426A196C]();
}

uint64_t sub_241EC7314(uint64_t a1, uint64_t a2)
{
  return sub_241EC77FC(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_241EC7330(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_241ECB8C4();
  *a2 = 0;
  return result;
}

uint64_t sub_241EC73A4(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_241ECB8D0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_241EC7420@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_241ECB8DC();
  v2 = sub_241ECB8B8();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_241EC746C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_241ECB8DC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_241EC7494()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_241ECB8DC();
  v2 = v1;
  if (v0 == sub_241ECB8DC() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_241ECBA08();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_QWORD *sub_241EC751C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

double sub_241EC752C@<D0>(_QWORD *a1@<X8>)
{
  double *v1;
  double result;

  result = *v1;
  *a1 = *(_QWORD *)v1;
  return result;
}

uint64_t sub_241EC7538()
{
  sub_241EC9188(&qword_25718CAB0, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_241EFD7E0);
  sub_241EC9188(&qword_25718CAB8, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_241EFD780);
  sub_241EC9328();
  return sub_241ECB9F0();
}

uint64_t sub_241EC75D8()
{
  sub_241EC9188(&qword_25718CB68, (uint64_t (*)(uint64_t))type metadata accessor for ASCAppState, (uint64_t)&unk_241EFDA1C);
  sub_241EC9188((unint64_t *)&unk_25718CB70, (uint64_t (*)(uint64_t))type metadata accessor for ASCAppState, (uint64_t)&unk_241EFD9BC);
  return sub_241ECB9F0();
}

uint64_t sub_241EC765C()
{
  sub_241EC9188(&qword_25718C878, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_241EFD870);
  sub_241EC9188(&qword_25718CAD8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_241EFD514);
  return sub_241ECB9F0();
}

uint64_t sub_241EC76E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_241ECB8B8();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_241EC7724()
{
  sub_241EC9188(&qword_25718CAC8, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_241EFD688);
  sub_241EC9188(&qword_25718CAD0, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_241EFD628);
  return sub_241ECB9F0();
}

uint64_t sub_241EC77A8()
{
  return sub_241ECB90C();
}

uint64_t sub_241EC77B0()
{
  return sub_241ECBA2C();
}

uint64_t sub_241EC77E0()
{
  return sub_241ECBA14();
}

uint64_t sub_241EC77F0(uint64_t a1, uint64_t a2)
{
  return sub_241EC77FC(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_241EC77FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_241ECB8DC();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_241EC7838()
{
  sub_241ECB8DC();
  sub_241ECB900();
  return swift_bridgeObjectRelease();
}

uint64_t sub_241EC7878()
{
  uint64_t v0;

  sub_241ECB8DC();
  sub_241ECBA20();
  sub_241ECB900();
  v0 = sub_241ECBA38();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_241EC78E8(double *a1, double *a2)
{
  return *a1 == *a2;
}

unint64_t sub_241EC78FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_241ECBA20();
  sub_241ECB900();
  v4 = sub_241ECBA38();
  return sub_241EC7A1C(a1, a2, v4);
}

unint64_t sub_241EC7960(uint64_t a1)
{
  uint64_t v2;

  sub_241ECB8DC();
  sub_241ECBA20();
  sub_241ECB900();
  v2 = sub_241ECBA38();
  swift_bridgeObjectRelease();
  return sub_241EC7AFC(a1, v2);
}

unint64_t sub_241EC79EC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_241ECB9B4();
  return sub_241EC7C70(a1, v2);
}

unint64_t sub_241EC7A1C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_241ECBA08() & 1) == 0)
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
      while (!v14 && (sub_241ECBA08() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_241EC7AFC(uint64_t a1, uint64_t a2)
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
    v6 = sub_241ECB8DC();
    v8 = v7;
    if (v6 == sub_241ECB8DC() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_241ECBA08();
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
          v13 = sub_241ECB8DC();
          v15 = v14;
          if (v13 == sub_241ECB8DC() && v15 == v16)
            break;
          v18 = sub_241ECBA08();
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

unint64_t sub_241EC7C70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_241EC9634(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2426A1B04](v9, a1);
      sub_241EC9670((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_241EC7D34()
{
  unint64_t v0;

  v0 = sub_241ECB9FC();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426A2C68]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for SUUIStopPageViewController.PageArtwork(uint64_t a1)
{
  return sub_241EC89EC(a1, qword_25718D7F0);
}

uint64_t sub_241EC7DD0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_241EC7E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SUUIStopPageViewController.PageArtwork(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t _s13MobileStoreUI26SUUIStopPageViewControllerC06isStopE7Enabled3forSbSS_tFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  _BYTE v6[24];
  ValueMetadata *v7;
  unint64_t v8;

  v1 = sub_241ECB8F4();
  v2 = v0;
  if (v1 == 30324 && v0 == 0xE200000000000000
    || (sub_241ECBA08() & 1) != 0
    || v1 == 0x736569766F6DLL && v2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    v7 = &type metadata for MobileStore;
    v8 = sub_241EC9398();
    v6[0] = 0;
    v4 = sub_241ECB834();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    return v4 & 1;
  }
  v3 = sub_241ECBA08();
  swift_bridgeObjectRelease();
  v4 = 0;
  if ((v3 & 1) != 0)
    goto LABEL_9;
  return v4 & 1;
}

uint64_t _s13MobileStoreUI26SUUIStopPageViewControllerC06isStopE23BagValueOverrideEnabled3forSbSS_tFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  char v6[24];
  ValueMetadata *v7;
  unint64_t v8;

  v1 = sub_241ECB8F4();
  v2 = v0;
  if (v1 == 30324 && v0 == 0xE200000000000000
    || (sub_241ECBA08() & 1) != 0
    || v1 == 0x736569766F6DLL && v2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = sub_241ECBA08();
    swift_bridgeObjectRelease();
    v4 = 0;
    if ((v3 & 1) == 0)
      return v4 & 1;
  }
  if (os_variant_has_internal_content())
  {
    v7 = &type metadata for MobileStore;
    v8 = sub_241EC9398();
    v6[0] = 2;
    v4 = sub_241ECB834();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

uint64_t sub_241EC807C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  id v7;

  v4 = sub_241ECB7F8();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_241ECB8AC();
  MEMORY[0x24BDAC7A8](v5);
  if ((a1 != 0x736569766F6DLL || a2 != 0xE600000000000000)
    && (sub_241ECBA08() & 1) == 0
    && (a1 != 30324 || a2 != 0xE200000000000000)
    && (sub_241ECBA08() & 1) == 0)
  {
    return 0;
  }
  sub_241ECB8A0();
  type metadata accessor for SUUIStopPageViewController(0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_241ECB7EC();
  return sub_241ECB8E8();
}

id sub_241EC8278(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, void *a15)
{
  char *v15;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t ObjCClassFromMetadata;
  id v60;
  uint64_t v61;
  uint64_t *v62;
  id v63;
  objc_class *v64;
  id v65;
  _QWORD v67[2];
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  objc_super v75;

  v73 = a8;
  v74 = a2;
  v68 = a5;
  v69 = a7;
  v72 = a1;
  v19 = sub_241ECB7F8();
  MEMORY[0x24BDAC7A8](v19);
  v67[1] = (char *)v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_241ECB8AC();
  MEMORY[0x24BDAC7A8](v21);
  v67[0] = (char *)v67 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25718C830);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v71 = (uint64_t)v67 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)v67 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v31 = (char *)v67 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)v67 - v32;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25718C840);
  MEMORY[0x24BDAC7A8](v34);
  v36 = (char *)v67 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_lockupView] = 0;
  if (!a4)
  {
    v37 = v72;
    if (v72 == 0x736569766F6DLL && v74 == 0xE600000000000000
      || (sub_241ECBA08() & 1) != 0
      || v37 == 30324 && v74 == 0xE200000000000000
      || (sub_241ECBA08() & 1) != 0)
    {
      a4 = 0xEA00000000003934;
      a3 = 0x3538373034373131;
    }
    else
    {
      a3 = 0;
      a4 = 0;
    }
  }
  v70 = v28;
  v38 = (uint64_t *)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_replacementAppAdamId];
  *v38 = a3;
  v38[1] = a4;
  if (a6)
  {
    v39 = v15;
    v41 = v72;
    v40 = v73;
    v42 = (uint64_t)v33;
    v43 = v68;
  }
  else
  {
    v44 = v15;
    v41 = v72;
    v43 = sub_241EC807C(v72, v74);
    a6 = v45;
    v42 = (uint64_t)v33;
    v40 = v73;
  }
  v73 = a11;
  v46 = (uint64_t *)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageTitle];
  *v46 = v43;
  v46[1] = a6;
  if (v40)
  {
    v47 = a10;
    v48 = v69;
  }
  else
  {
    v48 = sub_241EC807C(v41, v74);
    v47 = a10;
  }
  v49 = (uint64_t *)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageSubtitle];
  *v49 = v48;
  v49[1] = v40;
  sub_241EC3330(a9, (uint64_t)v36);
  sub_241ECA17C((uint64_t)v36, (uint64_t)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_pageArtwork], &qword_25718C840);
  sub_241ECA0FC(v47, (uint64_t)v31, &qword_25718C830);
  v50 = sub_241ECB7E0();
  v51 = *(_QWORD *)(v50 - 8);
  v52 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48);
  if (v52(v31, 1, v50) == 1)
  {
    v53 = v74;
    if (v41 == 0x736569766F6DLL && v74 == 0xE600000000000000
      || (sub_241ECBA08() & 1) != 0
      || v41 == 30324 && v53 == 0xE200000000000000
      || (sub_241ECBA08() & 1) != 0)
    {
      sub_241ECB7D4();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 56))(v42, 1, 1, v50);
    }
    sub_241EC8A40((uint64_t)v31, &qword_25718C830);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v51 + 32))(v42, v31, v50);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v51 + 56))(v42, 0, 1, v50);
    v53 = v74;
  }
  v55 = a13;
  sub_241ECA17C(v42, (uint64_t)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_deeplinkUrl], &qword_25718C830);
  v56 = v71;
  sub_241ECA0FC(v73, v71, &qword_25718C830);
  if (v52((char *)v56, 1, v50) == 1)
  {
    v57 = v72;
    if (v72 == 0x736569766F6DLL && v53 == 0xE600000000000000
      || (sub_241ECBA08() & 1) != 0
      || v57 == 30324 && v53 == 0xE200000000000000
      || (sub_241ECBA08() & 1) != 0)
    {
      v58 = (uint64_t)v70;
      sub_241ECB7D4();
    }
    else
    {
      v58 = (uint64_t)v70;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v51 + 56))(v70, 1, 1, v50);
    }
    swift_bridgeObjectRelease();
    sub_241EC8A40(v56, &qword_25718C830);
  }
  else
  {
    swift_bridgeObjectRelease();
    v58 = (uint64_t)v70;
    (*(void (**)(char *, uint64_t, uint64_t))(v51 + 32))(v70, v56, v50);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v51 + 56))(v58, 0, 1, v50);
  }
  sub_241ECA17C(v58, (uint64_t)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_purchasesUrl], &qword_25718C830);
  if (!a13)
  {
    sub_241ECB8A0();
    type metadata accessor for SUUIStopPageViewController(0);
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v60 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    sub_241ECB7EC();
    a12 = sub_241ECB8E8();
    v55 = v61;
  }
  v62 = (uint64_t *)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_wishlistButtonTitle];
  *v62 = a12;
  v62[1] = v55;
  v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_showWishlistButton] = a14 & 1;
  *(_QWORD *)&v15[OBJC_IVAR____TtC13MobileStoreUI26SUUIStopPageViewController_clientContext] = a15;
  v63 = a15;

  v64 = (objc_class *)type metadata accessor for SUUIStopPageViewController(0);
  v75.receiver = v15;
  v75.super_class = v64;
  v65 = objc_msgSendSuper2(&v75, sel_initWithNibName_bundle_, 0, 0);
  sub_241EC8A40(v73, &qword_25718C830);
  sub_241EC8A40(v47, &qword_25718C830);
  return v65;
}

uint64_t type metadata accessor for SUUIStopPageViewController(uint64_t a1)
{
  return sub_241EC89EC(a1, (uint64_t *)&unk_25718D7E0);
}

uint64_t sub_241EC89EC(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t type metadata accessor for SUUIStopPageViewController.StopPageLockup()
{
  return objc_opt_self();
}

uint64_t sub_241EC8A40(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for AttributeName(uint64_t a1)
{
  sub_241ECA1D4(a1, &qword_25718CA60);
}

unint64_t sub_241EC8A94()
{
  unint64_t result;

  result = qword_25718C880;
  if (!qword_25718C880)
  {
    result = MEMORY[0x2426A2C74](&unk_241EFD268, &type metadata for MobileStore);
    atomic_store(result, (unint64_t *)&qword_25718C880);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MobileStore(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MobileStore(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_241EC8BC4 + 4 * byte_241EFD255[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_241EC8BF8 + 4 * byte_241EFD250[v4]))();
}

uint64_t sub_241EC8BF8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_241EC8C00(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x241EC8C08);
  return result;
}

uint64_t sub_241EC8C14(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x241EC8C1CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_241EC8C20(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_241EC8C28(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_241EC8C34(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_241EC8C40(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MobileStore()
{
  return &type metadata for MobileStore;
}

uint64_t sub_241EC8C58()
{
  return type metadata accessor for SUUIStopPageViewController(0);
}

void sub_241EC8C60()
{
  unint64_t v0;
  unint64_t v1;

  sub_241EC8D40(319, &qword_25718C8B0, (void (*)(uint64_t))type metadata accessor for SUUIStopPageViewController.PageArtwork);
  if (v0 <= 0x3F)
  {
    sub_241EC8D40(319, qword_25718C8B8, (void (*)(uint64_t))MEMORY[0x24BDCDAC0]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_241EC8D40(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_241ECB9A8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t *sub_241EC8D8C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_241ECB7E0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_241EC8E14(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_241ECB7E0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_241EC8E48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_241ECB7E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_241EC8EA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_241ECB7E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  return a1;
}

uint64_t sub_241EC8F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_241ECB7E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_241EC8F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_241ECB7E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_241EC8FC8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_241EC8FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_241ECB7E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_241EC9010()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_241EC901C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_241ECB7E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_241EC905C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_241ECB7E0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_241EC90D8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_241EC90F8(uint64_t result, int a2, int a3)
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
  sub_241ECA1D4(a1, &qword_25718CA48);
}

void type metadata accessor for Weight(uint64_t a1)
{
  sub_241ECA1D4(a1, &qword_25718CA50);
}

void type metadata accessor for TraitKey(uint64_t a1)
{
  sub_241ECA1D4(a1, &qword_25718CA58);
}

uint64_t sub_241EC915C()
{
  return sub_241EC9188(&qword_25718CA68, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_241EFD4D8);
}

uint64_t sub_241EC9188(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2426A2C74](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_241EC91C8()
{
  return sub_241EC9188(&qword_25718CA70, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_241EFD4AC);
}

uint64_t sub_241EC91F4()
{
  return sub_241EC9188(&qword_25718CA78, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_241EFD5EC);
}

uint64_t sub_241EC9220()
{
  return sub_241EC9188(&qword_25718CA80, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_241EFD5C0);
}

uint64_t sub_241EC924C()
{
  return sub_241EC9188(&qword_25718CA88, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey, (uint64_t)&unk_241EFD65C);
}

uint64_t sub_241EC9278()
{
  return sub_241EC9188(&qword_25718CA90, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_241EFD744);
}

uint64_t sub_241EC92A4()
{
  return sub_241EC9188(&qword_25718CA98, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_241EFD718);
}

uint64_t sub_241EC92D0()
{
  return sub_241EC9188(&qword_25718CAA0, (uint64_t (*)(uint64_t))type metadata accessor for Weight, (uint64_t)&unk_241EFD7B4);
}

uint64_t sub_241EC92FC()
{
  return sub_241EC9188(&qword_25718CAA8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName, (uint64_t)&unk_241EFD548);
}

unint64_t sub_241EC9328()
{
  unint64_t result;

  result = qword_25718CAC0;
  if (!qword_25718CAC0)
  {
    result = MEMORY[0x2426A2C74](MEMORY[0x24BEE50D0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_25718CAC0);
  }
  return result;
}

uint64_t sub_241EC936C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_241EC9390(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_241EC6758(a1, v2, a2);
}

unint64_t sub_241EC9398()
{
  unint64_t result;

  result = qword_25718CAF0;
  if (!qword_25718CAF0)
  {
    result = MEMORY[0x2426A2C74](&unk_241EFD308, &type metadata for MobileStore);
    atomic_store(result, (unint64_t *)&qword_25718CAF0);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_241EC9404(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_241EC6AA0(a1, v2, a2);
}

uint64_t objectdestroy_3Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25718C830) - 8) + 80);
  v2 = (v1 + 16) & ~v1;
  v3 = sub_241ECB7E0();
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v0 + v2, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0 + v2, v3);
  return swift_deallocObject();
}

void sub_241EC94B8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25718C830) - 8) + 80);
  sub_241EC69D4(v0 + ((v1 + 16) & ~v1));
}

void sub_241EC94EC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t inited;
  uint64_t v5;
  void *v6;

  swift_beginAccess();
  v1 = MEMORY[0x2426A2CF8](v0 + 16);
  if (v1)
  {
    v2 = (void *)v1;
    v3 = objc_retain(*(id *)(v1
                           + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_clientContext));

    __swift_instantiateConcreteTypeFromMangledName(&qword_25718CB00);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_241EFDAB0;
    v5 = MEMORY[0x24BEE0D00];
    sub_241ECB9CC();
    *(_QWORD *)(inited + 96) = v5;
    strcpy((char *)(inited + 72), "goToWishlist");
    *(_BYTE *)(inited + 85) = 0;
    *(_WORD *)(inited + 86) = -5120;
    sub_241EC6DDC(inited);
    v6 = (void *)sub_241ECB870();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_sendOnXEventWithDictionary_completionBlock_, v6, 0, 1701869940, 0xE400000000000000);

  }
}

_OWORD *sub_241EC9624(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_241EC9634(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_241EC9670(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

unint64_t sub_241EC96A8()
{
  unint64_t result;

  result = qword_25718CB18;
  if (!qword_25718CB18)
  {
    result = MEMORY[0x2426A2C74](MEMORY[0x24BEBBE20], MEMORY[0x24BEBBE30]);
    atomic_store(result, (unint64_t *)&qword_25718CB18);
  }
  return result;
}

uint64_t sub_241EC96EC()
{
  return 8;
}

uint64_t sub_241EC96F8()
{
  return swift_release();
}

uint64_t sub_241EC9700(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_241EC970C(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

void sub_241EC9718()
{
  _BYTE *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageView;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_init);
  v2 = &v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_imageSize];
  *v2 = 0;
  v2[1] = 0;
  v3 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_titleLabel;
  *(_QWORD *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  v4 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_subtitleLabel;
  *(_QWORD *)&v0[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  v5 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton;
  *(_QWORD *)&v0[v5] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE04480]), sel_init);
  v6 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton;
  *(_QWORD *)&v0[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD430]), sel_init);
  *(_QWORD *)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewPurchasesButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_viewWishlistButton] = 0;
  v7 = OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_resourceLoaderOperationQueue;
  *(_QWORD *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1710]), sel_init);
  v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible] = 0;
  v0[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isOpenable] = 2;

  sub_241ECB9D8();
  __break(1u);
}

id sub_241EC9880(void *a1)
{
  id v1;
  double v2;
  id v3;

  v1 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  v2 = 13.0;
  if ((sub_241ECB924() & 1) == 0)
  {
    v2 = 15.0;
    if ((sub_241ECB924() & 1) == 0)
    {
      sub_241ECB924();
      v2 = 18.0;
    }
  }
  v3 = objc_msgSend((id)objc_opt_self(), sel_systemFontOfSize_weight_, v2, *MEMORY[0x24BEBB608]);

  return v3;
}

uint64_t sub_241EC9940()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD *v3;
  int v4;
  uint64_t result;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  char isEscapingClosureAtFileLocation;
  uint64_t v10;
  void *v11;
  _BYTE *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t (*v22)();
  _QWORD *v23;

  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = v0;
  v2 = (void *)objc_opt_self();
  v3 = v0;
  if (objc_msgSend(v2, sel_isMainThread))
  {
    v4 = *((unsigned __int8 *)v3
         + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible);
    *((_BYTE *)v3
    + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible) = 1;
    if (v4 == 1)
      return swift_release();
  }
  else
  {
    sub_241EC9E7C(0, &qword_25718CB28);
    v6 = sub_241ECB918();
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = sub_241EC9F44;
    *(_QWORD *)(v7 + 24) = v1;
    v3 = (_QWORD *)swift_allocObject();
    v3[2] = sub_241ECA2AC;
    v3[3] = v7;
    v22 = sub_241ECA2AC;
    v23 = v3;
    v18 = MEMORY[0x24BDAC760];
    v19 = 1107296256;
    v20 = sub_241EC6F40;
    v21 = &block_descriptor_34;
    v8 = _Block_copy(&v18);
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v6, v8);

    swift_release();
    _Block_release(v8);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      return result;
    __break(1u);
  }
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v3;
  v11 = *(void **)((char *)v3
                 + OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton);
  v12 = v3;
  v13 = objc_msgSend(v11, sel_superview);

  if (!v13)
  {
    v14 = objc_msgSend(*(id *)&v12[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton], sel_superview);

    if (!v14)
    {
      sub_241EC5288(v12);
      swift_release();
      return swift_release();
    }
  }
  v15 = (void *)objc_opt_self();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_241ECA0F4;
  *(_QWORD *)(v16 + 24) = v10;
  v22 = sub_241ECA2AC;
  v23 = (_QWORD *)v16;
  v18 = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_241EC537C;
  v21 = &block_descriptor_43;
  v17 = _Block_copy(&v18);
  swift_retain();
  swift_release();
  objc_msgSend(v15, sel_animateWithDuration_delay_options_animations_completion_, 4, v17, 0, 0.2, 0.0);
  swift_release();
  _Block_release(v17);
  return swift_release();
}

uint64_t sub_241EC9C74(void *a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t result;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char isEscapingClosureAtFileLocation;
  _QWORD v13[6];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (void *)objc_opt_self();
  v5 = v1;
  v6 = a1;
  if (objc_msgSend(v4, sel_isMainThread))
  {
    sub_241EC6FAC((uint64_t)v6, (uint64_t)v5);
    return swift_release();
  }
  else
  {
    sub_241EC9E7C(0, &qword_25718CB28);
    v8 = sub_241ECB918();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = sub_241EC9E74;
    *(_QWORD *)(v9 + 24) = v3;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = sub_241EC9ED8;
    *(_QWORD *)(v10 + 24) = v9;
    v13[4] = sub_241EC9ED8;
    v13[5] = v10;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 1107296256;
    v13[2] = sub_241EC6F40;
    v13[3] = &block_descriptor;
    v11 = _Block_copy(v13);
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v8, v11);

    swift_release();
    _Block_release(v11);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_241EC9E48()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_241EC9E74()
{
  uint64_t v0;

  return sub_241EC6FAC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_241EC9E7C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_241EC9EB4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_241EC9ED8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_241EC9EF8()
{
  return swift_deallocObject();
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

uint64_t sub_241EC9F20()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_241EC9F44()
{
  uint64_t v0;
  _BYTE *v1;
  char v2;
  uint64_t v3;
  void *v4;
  _BYTE *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  v1 = *(_BYTE **)(v0 + 16);
  v2 = v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible];
  v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_isButtonVisible] = 1;
  if ((v2 & 1) == 0)
  {
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v1;
    v4 = *(void **)&v1[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_offerButton];
    v5 = v1;
    v6 = objc_msgSend(v4, sel_superview);

    if (v6
      || (v7 = objc_msgSend(*(id *)&v5[OBJC_IVAR____TtCC13MobileStoreUI26SUUIStopPageViewControllerP33_F4F1B3F6B9CD510E9925332AAFD97B7914StopPageLockup_openButton], sel_superview), v7, v7))
    {
      v8 = (void *)objc_opt_self();
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = sub_241ECA2DC;
      *(_QWORD *)(v9 + 24) = v3;
      v11[4] = sub_241ECA2AC;
      v11[5] = v9;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 1107296256;
      v11[2] = sub_241EC537C;
      v11[3] = &block_descriptor_54;
      v10 = _Block_copy(v11);
      swift_retain();
      swift_release();
      objc_msgSend(v8, sel_animateWithDuration_delay_options_animations_completion_, 4, v10, 0, 0.2, 0.0);
      swift_release();
      _Block_release(v10);
    }
    else
    {
      sub_241EC5288(v5);
      swift_release();
    }
  }
}

uint64_t sub_241ECA0E4()
{
  return swift_deallocObject();
}

id sub_241ECA0F4()
{
  uint64_t v0;

  return sub_241EC5288(*(_BYTE **)(v0 + 16));
}

uint64_t sub_241ECA0FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_241ECA140(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SUUIStopPageViewController.PageArtwork(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_241ECA17C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void type metadata accessor for ASCAppState(uint64_t a1)
{
  sub_241ECA1D4(a1, &qword_25718CB48);
}

void sub_241ECA1D4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_241ECA218()
{
  return sub_241EC9188(&qword_25718CB50, (uint64_t (*)(uint64_t))type metadata accessor for ASCAppState, (uint64_t)&unk_241EFD980);
}

uint64_t sub_241ECA244()
{
  return sub_241EC9188(&qword_25718CB58, (uint64_t (*)(uint64_t))type metadata accessor for ASCAppState, (uint64_t)&unk_241EFD954);
}

uint64_t sub_241ECA270()
{
  return sub_241EC9188(&qword_25718CB60, (uint64_t (*)(uint64_t))type metadata accessor for ASCAppState, (uint64_t)&unk_241EFD9F0);
}

void sub_241ECA29C()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_241ECA2E8()
{
  return swift_deallocClassInstance();
}

id sub_241ECA2F8()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_25718E418 = (uint64_t)result;
  return result;
}

uint64_t sub_241ECA348(uint64_t a1)
{
  return sub_241ECA548(a1, qword_25718E440);
}

uint64_t sub_241ECA374()
{
  return sub_241ECA404(&qword_25718E420, (uint64_t)qword_25718E440);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_241ECA3A8@<X0>(uint64_t a1@<X8>)
{
  return sub_241ECA460(&qword_25718E420, (uint64_t)qword_25718E440, a1);
}

uint64_t sub_241ECA3C4(uint64_t a1)
{
  return sub_241ECA548(a1, qword_25718E458);
}

uint64_t sub_241ECA3E8()
{
  return sub_241ECA404(&qword_25718E428, (uint64_t)qword_25718E458);
}

uint64_t sub_241ECA404(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_241ECB84C();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t sub_241ECA444@<X0>(uint64_t a1@<X8>)
{
  return sub_241ECA460(&qword_25718E428, (uint64_t)qword_25718E458, a1);
}

uint64_t sub_241ECA460@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_241ECB84C();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_241ECA4C8(uint64_t a1)
{
  return sub_241ECA548(a1, qword_25718E470);
}

uint64_t sub_241ECA4EC()
{
  return sub_241ECA404(&qword_25718E430, (uint64_t)qword_25718E470);
}

uint64_t sub_241ECA508@<X0>(uint64_t a1@<X8>)
{
  return sub_241ECA460(&qword_25718E430, (uint64_t)qword_25718E470, a1);
}

uint64_t sub_241ECA524(uint64_t a1)
{
  return sub_241ECA548(a1, qword_25718E488);
}

uint64_t sub_241ECA548(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  id v4;

  v3 = sub_241ECB84C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_25718E410 != -1)
    swift_once();
  v4 = (id)qword_25718E418;
  return sub_241ECB840();
}

uint64_t sub_241ECA5E0()
{
  return sub_241ECA404(&qword_25718E438, (uint64_t)qword_25718E488);
}

uint64_t sub_241ECA5FC@<X0>(uint64_t a1@<X8>)
{
  return sub_241ECA460(&qword_25718E438, (uint64_t)qword_25718E488, a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
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

void _SUUIglGetError_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "GLenum _SUUIglGetError(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SUUIOffscreenRenderOperation.m"), 43, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _SUUIglBindFramebuffer_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _SUUIglBindFramebuffer(GLenum, GLuint)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SUUIOffscreenRenderOperation.m"), 34, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void IOSurfaceLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *IOSurfaceLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SUUIOffscreenRenderOperation.m"), 23, CFSTR("%s"), *a1);

  __break(1u);
}

void OpenGLESLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *OpenGLESLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SUUIOffscreenRenderOperation.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getEAGLContextClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getEAGLContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SUUIOffscreenRenderOperation.m"), 20, CFSTR("Unable to find class %s"), "EAGLContext");

  __break(1u);
}

void _SUUIglBindTexture_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _SUUIglBindTexture(GLenum, GLuint)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SUUIOffscreenRenderOperation.m"), 35, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void _SUUIglTexParameteri_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _SUUIglTexParameteri(GLenum, GLenum, GLint)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SUUIOffscreenRenderOperation.m"), 44, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void getCNComposeRecipientViewDidChangeNotification_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCNComposeRecipientViewDidChangeNotification(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SUUIGiftComposeViewController.m"), 43, CFSTR("%s"), dlerror());

  __break(1u);
}

void __getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ContactsAutocompleteUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SUUIGiftComposeViewController.m"), 42, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAMSURLParserClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAMSURLParserClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SUUIApplicationController.m"), 86, CFSTR("Unable to find class %s"), "AMSURLParser");

  __break(1u);
}

void AppleMediaServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AppleMediaServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SUUIApplicationController.m"), 85, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAMSBagClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAMSBagClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SUUIApplicationController.m"), 87, CFSTR("Unable to find class %s"), "AMSBag");

  __break(1u);
}

void __getAMSURLParserClass_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AppleMediaServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SUUIURLResolver.m"), 31, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAMSURLParserClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAMSURLParserClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SUUIURLResolver.m"), 32, CFSTR("Unable to find class %s"), "AMSURLParser");

  __break(1u);
}

void __getAMSUIDynamicViewControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAMSUIDynamicViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SUUIURLResolver.m"), 37, CFSTR("Unable to find class %s"), "AMSUIDynamicViewController");

  __break(1u);
}

void AppleMediaServicesUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AppleMediaServicesUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SUUIURLResolver.m"), 36, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAMSUIWebViewControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAMSUIWebViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SUUIURLResolver.m"), 38, CFSTR("Unable to find class %s"), "AMSUIWebViewController");

  __break(1u);
  sub_241ECB78C();
}

uint64_t sub_241ECB78C()
{
  return MEMORY[0x24BEBBE48]();
}

uint64_t sub_241ECB798()
{
  return MEMORY[0x24BDCC848]();
}

uint64_t sub_241ECB7A4()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_241ECB7B0()
{
  return MEMORY[0x24BEBBE70]();
}

uint64_t sub_241ECB7BC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_241ECB7C8()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_241ECB7D4()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_241ECB7E0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_241ECB7EC()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_241ECB7F8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_241ECB804()
{
  return MEMORY[0x24BDCF760]();
}

uint64_t sub_241ECB810()
{
  return MEMORY[0x24BDCF770]();
}

uint64_t sub_241ECB81C()
{
  return MEMORY[0x24BDCF788]();
}

uint64_t sub_241ECB828()
{
  return MEMORY[0x24BDCF798]();
}

uint64_t sub_241ECB834()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_241ECB840()
{
  return MEMORY[0x24BDC6D30]();
}

uint64_t sub_241ECB84C()
{
  return MEMORY[0x24BDC6D48]();
}

uint64_t sub_241ECB858()
{
  return MEMORY[0x24BEBCB48]();
}

uint64_t sub_241ECB864()
{
  return MEMORY[0x24BEBCB58]();
}

uint64_t sub_241ECB870()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_241ECB87C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_241ECB888()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_241ECB894()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_241ECB8A0()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_241ECB8AC()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_241ECB8B8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_241ECB8C4()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_241ECB8D0()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_241ECB8DC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_241ECB8E8()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_241ECB8F4()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_241ECB900()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_241ECB90C()
{
  return MEMORY[0x24BEE13B8]();
}

uint64_t sub_241ECB918()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_241ECB924()
{
  return MEMORY[0x24BEBCD68]();
}

uint64_t sub_241ECB930()
{
  return MEMORY[0x24BEBD030]();
}

uint64_t sub_241ECB93C()
{
  return MEMORY[0x24BEBD080]();
}

uint64_t sub_241ECB948()
{
  return MEMORY[0x24BEBD088]();
}

uint64_t sub_241ECB954()
{
  return MEMORY[0x24BEBD0A0]();
}

uint64_t sub_241ECB960()
{
  return MEMORY[0x24BEBD168]();
}

uint64_t sub_241ECB96C()
{
  return MEMORY[0x24BEBD1B0]();
}

uint64_t sub_241ECB978()
{
  return MEMORY[0x24BEBD1C0]();
}

uint64_t sub_241ECB984()
{
  return MEMORY[0x24BEBD1C8]();
}

uint64_t sub_241ECB990()
{
  return MEMORY[0x24BEBD1F8]();
}

uint64_t sub_241ECB99C()
{
  return MEMORY[0x24BEBD218]();
}

uint64_t sub_241ECB9A8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_241ECB9B4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_241ECB9C0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_241ECB9CC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_241ECB9D8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_241ECB9E4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_241ECB9F0()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_241ECB9FC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_241ECBA08()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_241ECBA14()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_241ECBA20()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_241ECBA2C()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_241ECBA38()
{
  return MEMORY[0x24BEE4328]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55C8](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x24BDE55E8](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55F8](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE5600](retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x24BDBB8B0](alloc, str, attributes);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x24BDBBF10](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC058]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C0](rl, observer, mode);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x24BDBC328](allocator, activities, repeats, order, block);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC340](rl, observer, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC380](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

uint64_t CFURLCacheRemoveAllCachedResponses()
{
  return MEMORY[0x24BDB7368]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x24BDBD8B0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
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

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
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

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x24BDBD970](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x24BDBD978](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
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

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x24BDBDB48](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreateWithICCProfile(CFDataRef data)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB0](data);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x24BDBDCB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCD0](c, x, y);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x24BDBDD00](c);
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
  MEMORY[0x24BDBDD08](c, auxiliaryInfo);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD38](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x24BDBDD48](c);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDE28](c, gradient, *(_QWORD *)&options, (__n128)startCenter, *(__n128 *)&startCenter.y, startRadius, (__n128)endCenter, *(__n128 *)&endCenter.y, endRadius);
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x24BDBDE58](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDF20](c, x, y);
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

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x24BDBE080](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x24BDBE0F0](c, t);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBE0F8](c, x, y);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x24BDBE528](space, components, locations, count);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x24BDBE550](gradient);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x24BDBE5F0](image, space);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDE8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEA0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEC0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
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

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
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

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
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

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

uint64_t CPFSSizeStrings()
{
  return MEMORY[0x24BE04680]();
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x24BE046F0]();
}

uint64_t CPPhoneNumberCopyFormattedStringForTextMessage()
{
  return MEMORY[0x24BE046F8]();
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x24BDC4750]();
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47C8](name, matrix, size);
}

uint64_t CTFontDescriptorCreateWithTextStyle()
{
  return MEMORY[0x24BDC4848]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x24BDC48F8]();
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
  MEMORY[0x24BDC49D0](frame, range.location, range.length, origins);
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x24BDC49D8](frame);
}

CGPathRef CTFrameGetPath(CTFrameRef frame)
{
  return (CGPathRef)MEMORY[0x24BDC49E0](frame);
}

CFRange CTFrameGetVisibleStringRange(CTFrameRef frame)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDC49F0](frame);
  result.length = v2;
  result.location = v1;
  return result;
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x24BDC49F8](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x24BDC4A00](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  double v5;
  double v6;
  CGSize result;

  MEMORY[0x24BDC4A08](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

CTLineRef CTLineCreateTruncatedLine(CTLineRef line, double width, CTLineTruncationType truncationType, CTLineRef truncationToken)
{
  return (CTLineRef)MEMORY[0x24BDC4A28](line, *(_QWORD *)&truncationType, truncationToken, width);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x24BDC4A30](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x24BDC4A68](line, context);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDC4A78](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFRange CTLineGetStringRange(CTLineRef line)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDC4AB8](line);
  result.length = v2;
  result.location = v1;
  return result;
}

double CTLineGetTrailingWhitespaceWidth(CTLineRef line)
{
  double result;

  MEMORY[0x24BDC4AC0](line);
  return result;
}

uint64_t ISDictionaryValueForCaseInsensitiveString()
{
  return MEMORY[0x24BEC8AC0]();
}

uint64_t ISErrorIsEqual()
{
  return MEMORY[0x24BEC8AE8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x24BED84C0]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x24BDD0B30](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x24BDD1018](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x24BDD1020](table, key, value);
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x24BDD1028](table, key, value);
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x24BDD1030](table, key, originalKey, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x24BDD1038](table, key);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BEBD2B8]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BEBD2C8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

NSTextAlignment NSTextAlignmentFromCTTextAlignment(CTTextAlignment ctTextAlignment)
{
  return MEMORY[0x24BEBB3F0](ctTextAlignment);
}

uint64_t SKGetRatingStarsImage()
{
  return MEMORY[0x24BDEA760]();
}

uint64_t SSDebugFileLevel()
{
  return MEMORY[0x24BEB2188]();
}

uint64_t SSDebugLevel()
{
  return MEMORY[0x24BEB2190]();
}

uint64_t SSDebugLog()
{
  return MEMORY[0x24BEB2198]();
}

uint64_t SSDebugShouldLogNetworkTimingMetrics()
{
  return MEMORY[0x24BEB21A8]();
}

uint64_t SSDialogGetDaemonDialogState()
{
  return MEMORY[0x24BEB2218]();
}

uint64_t SSDownloadKindIsEBookKind()
{
  return MEMORY[0x24BEB22A0]();
}

uint64_t SSDownloadKindIsSoftwareKind()
{
  return MEMORY[0x24BEB22A8]();
}

uint64_t SSError()
{
  return MEMORY[0x24BEB2480]();
}

uint64_t SSFileIsLocalWritable()
{
  return MEMORY[0x24BEB24D0]();
}

uint64_t SSFileLog()
{
  return MEMORY[0x24BEB24D8]();
}

uint64_t SSGetStringForNetworkType()
{
  return MEMORY[0x24BEB24F8]();
}

uint64_t SSVAddMediaSocialHeadersToURLRequest()
{
  return MEMORY[0x24BEB2AB0]();
}

uint64_t SSVAssetResourceLoadingRequestContainsSecureKeyDeliveryRequest()
{
  return MEMORY[0x24BEB2AF8]();
}

uint64_t SSVDefaultUserAgent()
{
  return MEMORY[0x24BEB2B00]();
}

uint64_t SSVGetMetricsPageDescriptionWithPlatformDictionary()
{
  return MEMORY[0x24BEB2B20]();
}

uint64_t SSVProtocolRedirectURLForResponse()
{
  return MEMORY[0x24BEB2B50]();
}

uint64_t SSVStoreFrontIdentifierForAccount()
{
  return MEMORY[0x24BEB2B68]();
}

uint64_t SUBarButtonItemApplyStyling()
{
  return MEMORY[0x24BEC8E50]();
}

uint64_t SUCreateHTMLForPlainText()
{
  return MEMORY[0x24BEC8E68]();
}

uint64_t SUCreatePreviewHistoryOperation()
{
  return MEMORY[0x24BEC8E70]();
}

uint64_t SUNavigationBarApplyStyling()
{
  return MEMORY[0x24BEC8E90]();
}

uint64_t SUWebScriptNameForSelector2()
{
  return MEMORY[0x24BEC8EF8]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x24BEBDE10]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BEBDE50]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x24BEBDF70]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x24BEBE040]();
}

uint64_t UIDistanceBetweenPointAndRect()
{
  return MEMORY[0x24BEBE118]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x24BEBE120]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x24BEBE168]();
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

uint64_t UIITunesStoreResolvedURLForHTTPURL()
{
  return MEMORY[0x24BEBE2C8]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BEBE2D8](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
}

uint64_t UIKeyboardOrderInAutomatic()
{
  return MEMORY[0x24BEBE528]();
}

uint64_t UIKeyboardOrderOutAutomatic()
{
  return MEMORY[0x24BEBE530]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x24BEBE650]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x24BEBE660]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x24BEBE678]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x24BEBE680]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x24BEBE688]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x24BEBE698]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x24BEBE6A0](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BEBE6A8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BEBE6E0]();
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

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
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

void operator delete(void *__p)
{
  off_2511F3E40(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_2511F3E48(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x24BEDCE60](cls, protocol);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
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

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
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

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x24BEDCF30](m);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

void srand48(uint64_t a1)
{
  MEMORY[0x24BDAFE88](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

