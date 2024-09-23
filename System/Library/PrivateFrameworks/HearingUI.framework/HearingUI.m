void sub_21A960E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A965994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A9661B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_21A9664E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21A9680C0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

id colorForThreshold(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0156862745, 0.870588235, 0.502222222, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 == 100 || a1 == 80)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.8, 0.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return v2;
}

void sub_21A96B98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return NSRequestConcreteImplementation();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return objc_opt_class();
}

void sub_21A96C224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A96CF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  id *v30;

  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A96D134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A96D220(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21A96E060(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 136));
  _Unwind_Resume(a1);
}

void sub_21A96E384(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21A96F408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A96F4BC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21A970038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A9708C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A970CF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t FrontBoardServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
    FrontBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = FrontBoardServicesLibraryCore_frameworkLibrary;
  if (!FrontBoardServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getLSApplicationWorkspaceClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!CoreServicesLibraryCore_frameworkLibrary)
  {
    CoreServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getLSApplicationWorkspaceClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("LSApplicationWorkspace");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getLSApplicationWorkspaceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21A972F74(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_21A973078(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21A973280(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

double AXHARoundToPixel(double a1)
{
  double v2;
  void *v3;
  uint64_t v4;

  v2 = *(double *)&AXHARoundToPixel_scale;
  if (*(double *)&AXHARoundToPixel_scale == -1.0)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen", *(double *)&AXHARoundToPixel_scale);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    AXHARoundToPixel_scale = v4;

    v2 = *(double *)&AXHARoundToPixel_scale;
  }
  return round(v2 * a1) / v2;
}

double HUICCFooterHeight(int a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  if (a1)
    v1 = 540.0;
  else
    v1 = 740.0;
  if (a1)
    v2 = 340.0;
  else
    v2 = 640.0;
  if (a1)
    v3 = 340.0;
  else
    v3 = 540.0;
  if (a1)
    v4 = 0.0;
  else
    v4 = 177.0;
  if (a1)
    v5 = 0.0;
  else
    v5 = 176.0;
  if (a1)
    v6 = 0.0;
  else
    v6 = 169.0;
  if (a1)
    v7 = 0.0;
  else
    v7 = 172.0;
  v9.origin.x = HUIReferenceScreenBounds();
  if (CGRectGetWidth(v9) >= 1024.0
    && objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPad")
    && (objc_msgSend(MEMORY[0x24BE4BD98], "deviceHasHomeButton") & 1) != 0)
  {
    return v2;
  }
  v10.origin.x = HUIReferenceScreenBounds();
  if (CGRectGetWidth(v10) >= 1024.0
    && objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPad")
    && !objc_msgSend(MEMORY[0x24BE4BD98], "deviceHasHomeButton"))
  {
    return v1;
  }
  v11.origin.x = HUIReferenceScreenBounds();
  if (CGRectGetWidth(v11) >= 834.0
    && objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPad")
    && !objc_msgSend(MEMORY[0x24BE4BD98], "deviceHasHomeButton"))
  {
    return v2;
  }
  v12.origin.x = HUIReferenceScreenBounds();
  if (CGRectGetWidth(v12) < 834.0
    || !objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPad")
    || (v1 = v2, (objc_msgSend(MEMORY[0x24BE4BD98], "deviceHasHomeButton") & 1) == 0))
  {
    v1 = v3;
    if ((objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPad") & 1) == 0)
    {
      v13.origin.x = HUIReferenceScreenBounds();
      v1 = v4;
      if (CGRectGetWidth(v13) < 428.0)
      {
        v14.origin.x = HUIReferenceScreenBounds();
        if (CGRectGetWidth(v14) < 414.0 || objc_msgSend(MEMORY[0x24BE4BD98], "deviceHasHomeButton"))
        {
          v15.origin.x = HUIReferenceScreenBounds();
          v1 = v5;
          if (CGRectGetWidth(v15) < 414.0)
          {
            v16.origin.x = HUIReferenceScreenBounds();
            if (CGRectGetWidth(v16) >= 390.0)
            {
              return v7;
            }
            else
            {
              v17.origin.x = HUIReferenceScreenBounds();
              if (CGRectGetWidth(v17) < 375.0 || objc_msgSend(MEMORY[0x24BE4BD98], "deviceHasHomeButton"))
              {
                v18.origin.x = HUIReferenceScreenBounds();
                if (CGRectGetWidth(v18) < 375.0)
                  return v7;
                else
                  return v6;
              }
              else
              {
                return v6;
              }
            }
          }
        }
        else
        {
          return v5;
        }
      }
    }
  }
  return v1;
}

double HUIReferenceScreenBounds()
{
  if (HUIReferenceScreenBounds_onceToken != -1)
    dispatch_once(&HUIReferenceScreenBounds_onceToken, &__block_literal_global_3);
  return *(double *)&HUIReferenceScreenBounds_ReferenceScreenBounds_0;
}

id accessibilityHearingUIBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)accessibilityHearingUIBundle_AXBundle;
  if (!accessibilityHearingUIBundle_AXBundle)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)accessibilityHearingUIBundle_AXBundle;
    accessibilityHearingUIBundle_AXBundle = v1;

    v0 = (void *)accessibilityHearingUIBundle_AXBundle;
  }
  return v0;
}

id AXHAHearingDevicesIconImage()
{
  return accessibilityHearingAidImageNamed(CFSTR("hearingDevicesIcon"));
}

id accessibilityHearingAidImageNamed(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = (void *)MEMORY[0x24BEBD640];
  accessibilityHearingUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", v1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id attributedStringWithFeatureSettings(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v9);
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v9);
  }
  else
  {
    objc_msgSend(v10, "fontDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x24BEBB548];
    v21[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fontDescriptorByAddingAttributes:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v16, "pointSize");
    objc_msgSend(v17, "fontWithDescriptor:size:", v16);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x24BEBB360], v18, a4, a5);
    v13 = v12;

    v10 = (id)v18;
  }

  return v13;
}

void sub_21A974800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A975294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
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

void sub_21A975930(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21A976A24(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21A976BC4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21A976E0C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21A97701C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21A97718C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21A9776D0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21A9793D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21A979684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_21A97BA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_21A97C2D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A97C824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A97D434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21A97D518(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21A97D810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HUICCViewTagForModule(uint64_t a1)
{
  return 2 * a1 + 95014;
}

id HUICCMenuTextLabel()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE220]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(MEMORY[0x24BEBD708]);
  v2 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v0, "pointSize");
  objc_msgSend(v2, "fontWithDescriptor:size:", v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFont:", v3);

  objc_msgSend(v1, "setLineBreakMode:", 4);
  objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v1, "setNumberOfLines:", 0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTextColor:", v4);

  objc_msgSend(v1, "setTextAlignment:", 1);
  return v1;
}

id HUICCImageViewWithImage(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = (objc_class *)MEMORY[0x24BEBD668];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(v3, "setContentMode:", 1);
  objc_msgSend(v3, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v5);

  objc_msgSend(v3, "setImage:", v2);
  objc_msgSend(v3, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", 35.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  objc_msgSend(v3, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToConstant:", 35.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  return v3;
}

id HUICCButtonVCWithSystemImageName(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v1 = (void *)MEMORY[0x24BEBD660];
  v2 = a1;
  objc_msgSend(v1, "configurationWithPointSize:weight:", 4, 23.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x24BE19B58]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithGlyphImage:highlightColor:useLightStyle:", v4, v6, 1);

  objc_msgSend(v7, "setLabelsVisible:", 0);
  objc_msgSend(v7, "setToggleStateOnTap:", 0);
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeToFit");

  objc_msgSend(v7, "button");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHighlighted:", 0);

  objc_msgSend(v7, "button");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "widthAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToConstant:", 54.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  objc_msgSend(v7, "button");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToConstant:", 54.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  return v7;
}

uint64_t HUICCBackgroundMaterialView()
{
  return objc_msgSend(MEMORY[0x24BE19B38], "_moduleBackgroundMaterialView");
}

id HUICCBackgroundVisualStylingProviderForCategory(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE19B38], "_moduleBackgroundMaterialView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualStylingProviderForCategory:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t HUICCLargeTextEnabled()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BEBE078]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BEBE070]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BEBE068]) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BEBE060]) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BEBE058]);
  }

  return v2;
}

void sub_21A9814EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id attributedStringWithImage(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;

  v9 = (objc_class *)MEMORY[0x24BDD1688];
  v10 = a4;
  v11 = a3;
  v12 = a2;
  v13 = a1;
  v14 = objc_alloc_init(v9);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v11);

  v16 = objc_alloc_init(MEMORY[0x24BEBB4B8]);
  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", v10, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", v13, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "imageWithTintColor:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "imageWithRenderingMode:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "_preferredFontForTextStyle:variant:", v10, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "capHeight");
  v23 = v22;
  objc_msgSend(v20, "size");
  v25 = v23 - v24;
  v26 = (float)(roundf(v25) * 0.5);
  objc_msgSend(v20, "size");
  v28 = v27;
  objc_msgSend(v20, "size");
  objc_msgSend(v16, "setBounds:", 0.0, v26, v28, v29);
  objc_msgSend(v16, "setImage:", v20);
  objc_msgSend(MEMORY[0x24BDD1458], "attributedStringWithAttachment:", v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendAttributedString:", v30);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", CFSTR(" "));
  objc_msgSend(v14, "appendAttributedString:", v31);

  objc_msgSend(v14, "appendAttributedString:", v15);
  return v14;
}

uint64_t sub_21A982154()
{
  uint64_t v0;
  uint64_t result;

  sub_21A98B41C();
  sub_21A98B404();
  sub_21A98B428();
  swift_release();
  v0 = sub_21A98B3F8();
  result = swift_release();
  qword_255106290 = v0;
  return result;
}

uint64_t sub_21A9821A8()
{
  uint64_t v0;
  uint64_t result;

  sub_21A98B434();
  sub_21A98B410();
  v0 = sub_21A98B428();
  result = swift_release();
  qword_255106298 = v0;
  return result;
}

uint64_t sub_21A9821E8()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_21A98B374();
  __swift_allocate_value_buffer(v0, qword_2551062A0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_2551062A0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(v1, *MEMORY[0x24BDEEE30], v0);
}

void sub_21A982240(uint64_t a1)
{
  sub_21A9822B8(a1, 0xD000000000000010, 0x800000021A991240, &qword_2551062B8, &qword_2551062C0);
}

void sub_21A982268(uint64_t a1)
{
  sub_21A9822B8(a1, 0xD000000000000015, 0x800000021A991260, &qword_2551062C8, &qword_2551062D0);
}

void sub_21A982290(uint64_t a1)
{
  sub_21A9822B8(a1, 0x62614C6C6576654CLL, 0xEA00000000006C65, &qword_2551062D8, &qword_2551062E0);
}

void sub_21A9822B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, _QWORD *a5)
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = (void *)sub_21A98B524();
  v8 = (id)hearingLocString();

  v9 = sub_21A98B53C();
  v11 = v10;

  *a4 = v9;
  *a5 = v11;
}

uint64_t sub_21A982328(uint64_t a1)
{
  return sub_21A98236C(0.0156862745, 0.870588235, 0.502222222, a1, &qword_2551062E8);
}

uint64_t sub_21A982350(uint64_t a1)
{
  return sub_21A98236C(1.0, 0.8, 0.0, a1, &qword_2551062F0);
}

uint64_t sub_21A98236C(double a1, double a2, double a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  sub_21A98B4A0();
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD))(v11 + 104))(v10, *MEMORY[0x24BDF3C28]);
  result = MEMORY[0x22074C8F4](v10, a1, a2, a3, 1.0);
  *a5 = result;
  return result;
}

uint64_t sub_21A982414()
{
  id v0;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_darkGrayColor);
  result = MEMORY[0x22074C900](v0);
  qword_2551062F8 = result;
  return result;
}

uint64_t sub_21A982450@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  int *v4;
  uint64_t *v5;
  char *v6;
  __int128 v7;
  double v8;
  double *v9;
  uint64_t *v10;
  uint64_t result;
  uint64_t v12;
  _OWORD v13[2];
  uint64_t v14;

  *a2 = 0;
  v4 = (int *)type metadata accessor for SoundMeterView(0);
  sub_21A98B1D0();
  v5 = (_QWORD *)((char *)a2 + v4[7]);
  *v5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105998);
  swift_storeEnumTagMultiPayload();
  sub_21A9880F4(a1, v13);
  v6 = (char *)a2 + v4[8];
  v7 = v13[1];
  *(_OWORD *)v6 = v13[0];
  *((_OWORD *)v6 + 1) = v7;
  *((_QWORD *)v6 + 4) = v14;
  v8 = 5.0;
  if (!a1)
    goto LABEL_4;
  if (a1 == 1)
  {
    v8 = 2.5;
LABEL_4:
    v9 = (double *)((char *)a2 + v4[6]);
    *v9 = 0.5;
    v9[1] = v8;
    v9[2] = 2.5;
    v10 = (_QWORD *)((char *)a2 + v4[9]);
    type metadata accessor for SoundMeterData(0);
    sub_21A98928C(&qword_255105C68, type metadata accessor for SoundMeterData, (uint64_t)&protocol conformance descriptor for SoundMeterData);
    result = sub_21A98B260();
    *v10 = result;
    v10[1] = v12;
    return result;
  }
  result = sub_21A98B5D8();
  __break(1u);
  return result;
}

uint64_t sub_21A9825D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  char *v35;
  unint64_t v36;
  uint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;

  v2 = v1;
  v70 = a1;
  v3 = sub_21A98B368();
  v68 = *(_QWORD *)(v3 - 8);
  v69 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v67 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21A98B3C8();
  v59 = *(_QWORD *)(v5 - 8);
  v60 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v58 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105A58);
  MEMORY[0x24BDAC7A8](v56);
  v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105A60);
  MEMORY[0x24BDAC7A8](v57);
  v53 = (uint64_t)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21A98B374();
  v54 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for SoundMeterView(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105A68);
  MEMORY[0x24BDAC7A8](v55);
  v17 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105A70);
  v18 = MEMORY[0x24BDAC7A8](v72);
  v20 = (char *)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v52 - v21;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105A78);
  v64 = *(_QWORD *)(v23 - 8);
  v65 = v23;
  MEMORY[0x24BDAC7A8](v23);
  v71 = (char *)&v52 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105A80);
  v25 = MEMORY[0x24BDAC7A8](v61);
  v63 = (char *)&v52 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v62 = (char *)&v52 - v27;
  v28 = sub_21A98B38C();
  v29 = *(_QWORD *)(v1 + *(int *)(v13 + 24));
  *(_QWORD *)v17 = v28;
  *((_QWORD *)v17 + 1) = v29;
  v17[16] = 0;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105A88);
  sub_21A982E4C(v1, (uint64_t)&v17[*(int *)(v30 + 44)]);
  v31 = *(unsigned __int8 *)(v1 + *(int *)(v13 + 32) + 26);
  v66 = v2;
  sub_21A9891C0(v2, (uint64_t)v15, type metadata accessor for SoundMeterView);
  if (v31 == 1)
  {
    sub_21A987284((uint64_t)v12);
    if (qword_2551057B0 != -1)
      swift_once();
    v32 = __swift_project_value_buffer(v10, (uint64_t)qword_2551062A0);
    v33 = sub_21A988354((uint64_t)v12, v32);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v12, v10);
    sub_21A987060((uint64_t)v15);
    if (v33)
    {
      sub_21A98B4F4();
      v34 = v53;
      sub_21A984840(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v53, 0.0, 1, INFINITY, 0);
      sub_21A989138(v34, (uint64_t)v8, &qword_255105A60);
      swift_storeEnumTagMultiPayload();
      sub_21A98709C();
      sub_21A9890F8(&qword_255105A98, &qword_255105A68, MEMORY[0x24BDF4700]);
      sub_21A98B398();
      sub_21A98917C(v34, &qword_255105A60);
      goto LABEL_8;
    }
  }
  else
  {
    sub_21A987060((uint64_t)v15);
  }
  sub_21A989138((uint64_t)v17, (uint64_t)v8, &qword_255105A68);
  swift_storeEnumTagMultiPayload();
  sub_21A98709C();
  sub_21A9890F8(&qword_255105A98, &qword_255105A68, MEMORY[0x24BDF4700]);
  sub_21A98B398();
LABEL_8:
  sub_21A989248((uint64_t)v20, (uint64_t)v22, &qword_255105A70);
  sub_21A98917C((uint64_t)v17, &qword_255105A68);
  v35 = v58;
  sub_21A98B3BC();
  v36 = sub_21A987164();
  sub_21A98B494();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v35, v60);
  sub_21A98917C((uint64_t)v22, &qword_255105A70);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_21A98B224();
  swift_release();
  swift_release();
  swift_release();
  if (v75 == 80)
  {
    if (qword_2551057C0 != -1)
      swift_once();
    v37 = &qword_2551062C8;
    goto LABEL_16;
  }
  if (!v75)
  {
    if (qword_2551057B8 != -1)
      swift_once();
    v37 = &qword_2551062B8;
LABEL_16:
    v39 = *v37;
    v38 = v37[1];
    swift_bridgeObjectRetain();
    goto LABEL_18;
  }
  v39 = 0;
  v38 = 0xE000000000000000;
LABEL_18:
  v75 = v39;
  v76 = v38;
  swift_bridgeObjectRetain();
  sub_21A98B548();
  swift_bridgeObjectRelease();
  v41 = v75;
  v40 = v76;
  if (qword_2551057C8 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105AA8);
  v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_21A98E710;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_21A98B224();
  swift_release();
  swift_release();
  swift_release();
  v43 = sub_21A98502C();
  v45 = v44;
  *(_QWORD *)(v42 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v42 + 64) = sub_21A9874A4();
  *(_QWORD *)(v42 + 32) = v43;
  *(_QWORD *)(v42 + 40) = v45;
  sub_21A98B530();
  swift_bridgeObjectRelease();
  v75 = v41;
  v76 = v40;
  swift_bridgeObjectRetain();
  sub_21A98B548();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v73 = v72;
  v74 = v36;
  swift_getOpaqueTypeConformance2();
  sub_21A9874E8();
  v46 = (uint64_t)v63;
  v47 = v65;
  v48 = v71;
  sub_21A98B488();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v48, v47);
  v49 = v67;
  sub_21A98B35C();
  v50 = (uint64_t)v62;
  sub_21A98B26C();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v49, v69);
  sub_21A98917C(v46, &qword_255105A80);
  return sub_21A989248(v50, v70, &qword_255105A80);
}

uint64_t sub_21A982E4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int8 v50;
  uint64_t v51;
  unsigned __int8 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned __int8 v56;
  uint64_t v57;
  unsigned __int8 v58;
  uint64_t v59;
  uint64_t v60;
  _OWORD v61[8];
  _OWORD v62[2];
  _BYTE v63[162];
  char v64;
  char v65;
  __int128 v66;
  _OWORD v67[11];
  __int128 v68;
  __int128 v69;
  char v70;
  _QWORD v71[2];
  char v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int16 v83;
  char v84;
  __int128 v85;
  __int128 v86;
  char v87;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105AD0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105AD8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v48 = (uint64_t)&v32 - v11;
  v12 = (uint64_t *)(a1 + *(int *)(type metadata accessor for SoundMeterView(0) + 24));
  sub_21A98B4F4();
  sub_21A98B248();
  v47 = v49;
  v46 = v50;
  v45 = v51;
  v44 = v52;
  v42 = v54;
  v43 = v53;
  v41 = sub_21A98B320();
  sub_21A9832D0(a1, (uint64_t)v61);
  *(_OWORD *)&v63[103] = v61[6];
  *(_OWORD *)&v63[119] = v61[7];
  *(_OWORD *)&v63[135] = v62[0];
  *(_OWORD *)&v63[146] = *(_OWORD *)((char *)v62 + 11);
  *(_OWORD *)&v63[39] = v61[2];
  *(_OWORD *)&v63[55] = v61[3];
  *(_OWORD *)&v63[71] = v61[4];
  *(_OWORD *)&v63[87] = v61[5];
  *(_OWORD *)&v63[7] = v61[0];
  v64 = 1;
  *(_OWORD *)&v63[23] = v61[1];
  v40 = 1;
  v39 = sub_21A98B3E0();
  v65 = 1;
  v13 = *v12;
  *(_QWORD *)v6 = sub_21A98B380();
  *((_QWORD *)v6 + 1) = v13;
  v6[16] = 0;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105AE0);
  sub_21A9844F8(a1, (uint64_t)&v6[*(int *)(v14 + 44)]);
  LOBYTE(a1) = sub_21A98B3E0();
  sub_21A989138((uint64_t)v6, (uint64_t)v10, &qword_255105AD0);
  v15 = &v10[*(int *)(v7 + 36)];
  *v15 = a1;
  *(_OWORD *)(v15 + 8) = 0u;
  *(_OWORD *)(v15 + 24) = 0u;
  v15[40] = 1;
  sub_21A98917C((uint64_t)v6, &qword_255105AD0);
  v16 = v48;
  sub_21A989248((uint64_t)v10, v48, &qword_255105AD8);
  sub_21A98B4F4();
  sub_21A98B248();
  v38 = v55;
  v37 = v56;
  v36 = v57;
  v35 = v58;
  v33 = v60;
  v34 = v59;
  LOBYTE(v6) = v65;
  sub_21A989138(v16, (uint64_t)v10, &qword_255105AD8);
  *(_OWORD *)((char *)&v67[7] + 1) = *(_OWORD *)&v63[112];
  *(_OWORD *)((char *)&v67[8] + 1) = *(_OWORD *)&v63[128];
  *(_OWORD *)((char *)&v67[9] + 1) = *(_OWORD *)&v63[144];
  v17 = *(_OWORD *)&v63[32];
  *(_OWORD *)((char *)&v67[3] + 1) = *(_OWORD *)&v63[48];
  *(_OWORD *)((char *)&v67[4] + 1) = *(_OWORD *)&v63[64];
  *(_OWORD *)((char *)&v67[5] + 1) = *(_OWORD *)&v63[80];
  *(_OWORD *)((char *)&v67[6] + 1) = *(_OWORD *)&v63[96];
  v18 = *(_OWORD *)&v63[16];
  *(_OWORD *)((char *)v67 + 1) = *(_OWORD *)v63;
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  *(_QWORD *)(a2 + 16) = v47;
  *(_BYTE *)(a2 + 24) = v46;
  *(_QWORD *)(a2 + 32) = v45;
  *(_BYTE *)(a2 + 40) = v44;
  v20 = v41;
  v19 = v42;
  *(_QWORD *)(a2 + 48) = v43;
  *(_QWORD *)(a2 + 56) = v19;
  v66 = (unint64_t)v20;
  LOBYTE(v12) = v39;
  LOBYTE(v16) = v40;
  LOBYTE(v67[0]) = v40;
  *(_WORD *)((char *)&v67[10] + 1) = *(_WORD *)&v63[160];
  *(_OWORD *)((char *)&v67[1] + 1) = v18;
  *(_OWORD *)((char *)&v67[2] + 1) = v17;
  BYTE8(v67[10]) = v39;
  v68 = 0u;
  v69 = 0u;
  v70 = (char)v6;
  *(_BYTE *)(a2 + 288) = (_BYTE)v6;
  v21 = v67[8];
  *(_OWORD *)(a2 + 192) = v67[7];
  *(_OWORD *)(a2 + 208) = v21;
  v22 = v67[4];
  *(_OWORD *)(a2 + 128) = v67[3];
  *(_OWORD *)(a2 + 144) = v22;
  v23 = v67[6];
  *(_OWORD *)(a2 + 160) = v67[5];
  *(_OWORD *)(a2 + 176) = v23;
  v24 = v67[0];
  *(_OWORD *)(a2 + 64) = v66;
  *(_OWORD *)(a2 + 80) = v24;
  v25 = v67[2];
  *(_OWORD *)(a2 + 96) = v67[1];
  *(_OWORD *)(a2 + 112) = v25;
  v26 = v67[10];
  *(_OWORD *)(a2 + 224) = v67[9];
  *(_OWORD *)(a2 + 240) = v26;
  v27 = v69;
  *(_OWORD *)(a2 + 256) = v68;
  *(_OWORD *)(a2 + 272) = v27;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105AE8);
  sub_21A989138((uint64_t)v10, a2 + *(int *)(v28 + 64), &qword_255105AD8);
  v29 = a2 + *(int *)(v28 + 80);
  *(_QWORD *)v29 = 0;
  *(_BYTE *)(v29 + 8) = 1;
  *(_QWORD *)(v29 + 16) = v38;
  *(_BYTE *)(v29 + 24) = v37;
  *(_QWORD *)(v29 + 32) = v36;
  *(_BYTE *)(v29 + 40) = v35;
  v30 = v33;
  *(_QWORD *)(v29 + 48) = v34;
  *(_QWORD *)(v29 + 56) = v30;
  sub_21A9887B8((uint64_t)&v66);
  sub_21A98917C(v48, &qword_255105AD8);
  sub_21A98917C((uint64_t)v10, &qword_255105AD8);
  v80 = *(_OWORD *)&v63[112];
  v81 = *(_OWORD *)&v63[128];
  v82 = *(_OWORD *)&v63[144];
  v76 = *(_OWORD *)&v63[48];
  v77 = *(_OWORD *)&v63[64];
  v78 = *(_OWORD *)&v63[80];
  v79 = *(_OWORD *)&v63[96];
  v73 = *(_OWORD *)v63;
  v74 = *(_OWORD *)&v63[16];
  v71[0] = v20;
  v71[1] = 0;
  v72 = v16;
  v83 = *(_WORD *)&v63[160];
  v75 = *(_OWORD *)&v63[32];
  v84 = (char)v12;
  v85 = 0u;
  v86 = 0u;
  v87 = (char)v6;
  return sub_21A9888F8((uint64_t)v71);
}

uint64_t sub_21A9832D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t v16;
  uint64_t v17;
  char v18;
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
  unsigned __int8 v36;

  sub_21A98357C(&v30);
  v23 = v32;
  v24 = v31;
  v28 = v30;
  v29 = v33;
  v25 = v34;
  if (*(_BYTE *)(a1 + *(int *)(type metadata accessor for SoundMeterView(0) + 32) + 25) == 1)
  {
    sub_21A983834((uint64_t)&v30);
    v4 = v30;
    v5 = v31;
    v6 = v32;
    v7 = v33;
    v8 = v34;
    v27 = v35;
    v21 = v36;
    sub_21A9888E8(v30, v31, v32);
    swift_bridgeObjectRetain();
    swift_retain();
    v9 = v4;
    v19 = v6;
    v20 = v5;
    sub_21A988A28(v4, v5, v6);
    v22 = v8;
    swift_release();
    v26 = v7;
    swift_bridgeObjectRelease();
    v18 = 1;
  }
  else
  {
    v9 = 0;
    v19 = 0;
    v20 = 0;
    v26 = 0;
    v27 = 0;
    v21 = 0;
    v22 = 0;
    v18 = 0;
  }
  sub_21A983A84(&v30);
  v10 = v30;
  v11 = v31;
  v16 = v30;
  v17 = v31;
  v12 = v32;
  v13 = v33;
  KeyPath = swift_getKeyPath();
  LOBYTE(v30) = v12;
  *(_QWORD *)a2 = v28;
  *(_QWORD *)(a2 + 8) = v24;
  *(_QWORD *)(a2 + 16) = v23;
  *(_QWORD *)(a2 + 24) = v29;
  *(_QWORD *)(a2 + 32) = v25;
  *(_QWORD *)(a2 + 40) = v9;
  *(_QWORD *)(a2 + 48) = v20;
  *(_QWORD *)(a2 + 56) = v19;
  *(_QWORD *)(a2 + 64) = v26;
  *(_QWORD *)(a2 + 72) = v22;
  *(_QWORD *)(a2 + 80) = v27;
  *(_QWORD *)(a2 + 88) = v21;
  *(_QWORD *)(a2 + 96) = 0;
  *(_BYTE *)(a2 + 104) = v18;
  *(_QWORD *)(a2 + 112) = v10;
  *(_QWORD *)(a2 + 120) = v11;
  *(_BYTE *)(a2 + 128) = v12;
  *(_QWORD *)(a2 + 136) = v13;
  *(_QWORD *)(a2 + 144) = KeyPath;
  *(_WORD *)(a2 + 152) = 258;
  *(_BYTE *)(a2 + 154) = 1;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_21A9888AC(v9, v20, v19, v26);
  sub_21A9888E8(v16, v17, v12);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21A988A28(v16, v17, v12);
  swift_release();
  swift_bridgeObjectRelease();
  sub_21A9889EC(v9, v20, v19, v26);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_21A98357C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  double v9;

  type metadata accessor for SoundMeterView(0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_21A98B224();
  swift_release();
  swift_release();
  swift_release();
  if (v9 >= 0.0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_21A98B224();
    swift_release();
    swift_release();
    swift_release();
  }
  v2 = sub_21A98B4C4();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_21A98B224();
  swift_release();
  swift_release();
  swift_release();
  if (*(_QWORD *)&v9 == 80)
  {
    if (qword_2551057D8 != -1)
      swift_once();
    v3 = &qword_2551062F0;
  }
  else if (v9 == 0.0)
  {
    if (qword_2551057D0 != -1)
      swift_once();
    v3 = &qword_2551062E8;
  }
  else
  {
    if (qword_2551057E0 != -1)
      swift_once();
    v3 = &qword_2551062F8;
  }
  v4 = *v3;
  swift_retain();
  KeyPath = swift_getKeyPath();
  if (qword_2551057A0 != -1)
    swift_once();
  v6 = qword_255106290;
  v7 = swift_getKeyPath();
  *a1 = v2;
  a1[1] = KeyPath;
  a1[2] = v4;
  a1[3] = v7;
  a1[4] = v6;
  return swift_retain();
}

uint64_t sub_21A983834@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  double v15;

  type metadata accessor for SoundMeterView(0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_21A98B224();
  swift_release();
  swift_release();
  swift_release();
  if (v15 >= 0.0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_21A98B224();
    swift_release();
    swift_release();
    swift_release();
    if (*(_QWORD *)&v15 == 80)
    {
      if (qword_2551057C0 == -1)
      {
LABEL_8:
        swift_bridgeObjectRetain();
        goto LABEL_9;
      }
LABEL_12:
      swift_once();
      goto LABEL_8;
    }
    if (v15 == 0.0)
    {
      if (qword_2551057B8 == -1)
        goto LABEL_8;
      goto LABEL_12;
    }
  }
LABEL_9:
  sub_21A9874E8();
  v2 = sub_21A98B458();
  v4 = v3;
  v6 = v5;
  if (qword_2551057A0 != -1)
    swift_once();
  v7 = sub_21A98B44C();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  sub_21A988A28(v2, v4, v6 & 1);
  swift_bridgeObjectRelease();
  result = swift_getKeyPath();
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 8) = v9;
  *(_BYTE *)(a1 + 16) = v11 & 1;
  *(_QWORD *)(a1 + 24) = v13;
  *(_QWORD *)(a1 + 32) = result;
  *(_QWORD *)(a1 + 40) = 1;
  *(_BYTE *)(a1 + 48) = 0;
  return result;
}

uint64_t sub_21A983A84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t KeyPath;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  char v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  char v47;
  void (*v48)(uint64_t, uint64_t);
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  double v61;
  unint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  char v78;
  unint64_t v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  double v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char v97;
  char v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  NSObject *v108;
  os_log_type_t v109;
  uint8_t *v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  unint64_t v125;
  double v126;
  unint64_t v127;

  v2 = v1;
  v123 = a1;
  v3 = sub_21A98B1DC();
  v121 = *(_QWORD *)(v3 - 8);
  v122 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v111 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v113 = (char *)&v111 - v7;
  v120 = sub_21A98B194();
  v117 = *(_QWORD *)(v120 - 8);
  MEMORY[0x24BDAC7A8](v120);
  v119 = (char *)&v111 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21A98B374();
  v115 = *(_QWORD *)(v9 - 8);
  v116 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v114 = (uint64_t)&v111 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for SoundMeterView(0);
  MEMORY[0x24BDAC7A8](v11);
  v118 = (uint64_t)&v111 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2551057C8 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105AA8);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_21A98E710;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_21A98B224();
  swift_release();
  swift_release();
  swift_release();
  v14 = sub_21A98502C();
  v16 = v15;
  *(_QWORD *)(v13 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v13 + 64) = sub_21A9874A4();
  *(_QWORD *)(v13 + 32) = v14;
  *(_QWORD *)(v13 + 40) = v16;
  *(double *)&v17 = COERCE_DOUBLE(sub_21A98B530());
  v19 = v18;
  swift_bridgeObjectRelease();
  v126 = *(double *)&v17;
  v127 = v19;
  v124 = 32;
  v125 = 0xE100000000000000;
  sub_21A9874E8();
  v20 = sub_21A98B590();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v20 + 16) != 2)
  {
    swift_bridgeObjectRelease();
    v23 = v121;
    v22 = v122;
    (*(void (**)(char *, uint64_t, uint64_t))(v121 + 16))(v6, v2 + *(int *)(v11 + 20), v122);
    v24 = sub_21A98B1C4();
    v25 = sub_21A98B560();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_21A95E000, v24, v25, "Invalid string split.", v26, 2u);
      MEMORY[0x22074D194](v26, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v22);
    goto LABEL_9;
  }
  v112 = v11;
  swift_getKeyPath();
  KeyPath = swift_getKeyPath();
  swift_retain();
  sub_21A98B224();
  swift_release();
  swift_release();
  swift_release();
  if (v126 < 0.0)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    v126 = 0.0;
    v127 = 0xE000000000000000;
    result = sub_21A98B458();
    v28 = result;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    goto LABEL_10;
  }
  v36 = v2;
  v37 = *(unsigned __int8 *)(v2 + *(int *)(v112 + 32) + 26);
  v38 = v118;
  sub_21A9891C0(v2, v118, type metadata accessor for SoundMeterView);
  if (v37 != 1)
  {
    sub_21A987060(v38);
    v39 = (uint64_t)v119;
    goto LABEL_16;
  }
  KeyPath = v114;
  sub_21A987284(v114);
  v39 = (uint64_t)v119;
  if (qword_2551057B0 != -1)
    goto LABEL_34;
  while (1)
  {
    v40 = v116;
    v41 = __swift_project_value_buffer(v116, (uint64_t)qword_2551062A0);
    v42 = sub_21A988354(KeyPath, v41);
    (*(void (**)(uint64_t, uint64_t))(v115 + 8))(KeyPath, v40);
    sub_21A987060(v38);
    if (v42)
      v43 = 10;
    else
LABEL_16:
      v43 = 32;
    v44 = v120;
    if (*(_QWORD *)(v20 + 16))
      break;
    __break(1u);
LABEL_34:
    swift_once();
  }
  v45 = *(_QWORD *)(v20 + 40);
  v126 = *(double *)(v20 + 32);
  v127 = v45;
  swift_bridgeObjectRetain();
  sub_21A98B188();
  sub_21A98B59C();
  v47 = v46;
  v48 = *(void (**)(uint64_t, uint64_t))(v117 + 8);
  v48(v39, v44);
  swift_bridgeObjectRelease();
  if ((v47 & 1) == 0)
  {
    v49 = *(_QWORD *)(v20 + 40);
    v126 = *(double *)(v20 + 32);
    v127 = v49;
    swift_bridgeObjectRetain_n();
    sub_21A98B548();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50 = sub_21A98B458();
    v52 = v51;
    v54 = v53;
    v56 = v55;
    if (qword_2551057A0 != -1)
      swift_once();
    v57 = sub_21A98B44C();
    v121 = v58;
    v122 = v57;
    v60 = v59;
    sub_21A988A28(v50, v52, v54 & 1);
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v20 + 16) < 2uLL)
    {
      __break(1u);
    }
    else
    {
      v61 = *(double *)(v20 + 48);
      v62 = *(_QWORD *)(v20 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v126 = v61;
      v127 = v62;
      v56 = sub_21A98B458();
      v20 = v63;
      LOBYTE(v50) = v64;
      if (qword_2551057A8 == -1)
      {
LABEL_23:
        v65 = sub_21A98B44C();
        v67 = v66;
        v120 = v68;
        LODWORD(v119) = v69 & 1;
        sub_21A988A28(v56, v20, v50 & 1);
        swift_bridgeObjectRelease();
        v70 = v60 & 1;
        v71 = v121;
        v72 = v122;
        v28 = sub_21A98B440();
        v30 = v73;
        v32 = v74;
        v34 = v75;
        sub_21A988A28(v65, v67, (char)v119);
        swift_bridgeObjectRelease();
        sub_21A988A28(v72, v71, v70);
        result = swift_bridgeObjectRelease();
        goto LABEL_10;
      }
    }
    swift_once();
    goto LABEL_23;
  }
  if (*(_QWORD *)(v20 + 16) < 2uLL)
  {
    __break(1u);
LABEL_38:
    swift_once();
    goto LABEL_27;
  }
  v76 = *(_QWORD *)(v20 + 56);
  v126 = *(double *)(v20 + 48);
  v127 = v76;
  swift_bridgeObjectRetain();
  sub_21A98B188();
  sub_21A98B59C();
  v78 = v77;
  v48(v39, v44);
  swift_bridgeObjectRelease();
  if ((v78 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v104 = v36 + *(int *)(v112 + 20);
    v106 = v121;
    v105 = v122;
    v107 = v113;
    (*(void (**)(char *, uint64_t, uint64_t))(v121 + 16))(v113, v104, v122);
    v108 = sub_21A98B1C4();
    v109 = sub_21A98B560();
    if (os_log_type_enabled(v108, v109))
    {
      v110 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v110 = 0;
      _os_log_impl(&dword_21A95E000, v108, v109, "Invalid string split -- no decimal value found.", v110, 2u);
      MEMORY[0x22074D194](v110, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v106 + 8))(v107, v105);
    goto LABEL_9;
  }
  v79 = *(_QWORD *)(v20 + 40);
  v126 = *(double *)(v20 + 32);
  v127 = v79;
  swift_bridgeObjectRetain_n();
  sub_21A98B548();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v44 = sub_21A98B458();
  v39 = v80;
  v43 = v81;
  if (qword_2551057A8 != -1)
    goto LABEL_38;
LABEL_27:
  v82 = sub_21A98B44C();
  v121 = v83;
  v122 = v84;
  LODWORD(v120) = v85;
  sub_21A988A28(v44, v39, v43 & 1);
  swift_bridgeObjectRelease();
  v86 = *(double *)(v20 + 48);
  v87 = *(_QWORD *)(v20 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v126 = v86;
  v127 = v87;
  v88 = sub_21A98B458();
  v90 = v89;
  v92 = v91;
  if (qword_2551057A0 != -1)
    swift_once();
  v93 = sub_21A98B44C();
  v95 = v94;
  v119 = v96;
  v98 = v97 & 1;
  sub_21A988A28(v88, v90, v92 & 1);
  swift_bridgeObjectRelease();
  v99 = v120 & 1;
  v100 = v121;
  v120 = v82;
  v28 = sub_21A98B440();
  v30 = v101;
  v32 = v102;
  v34 = v103;
  sub_21A988A28(v93, v95, v98);
  swift_bridgeObjectRelease();
  sub_21A988A28(v120, v100, v99);
  result = swift_bridgeObjectRelease();
LABEL_10:
  v35 = v123;
  *v123 = v28;
  v35[1] = v30;
  *((_BYTE *)v35 + 16) = v32 & 1;
  v35[3] = v34;
  return result;
}

uint64_t sub_21A9844F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int8 v40;
  uint64_t v41;
  unsigned __int8 v42;
  uint64_t v43;
  uint64_t v44;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105AF0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105AF8);
  v37 = *(_QWORD *)(v7 - 8);
  v38 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v32 = (uint64_t)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105B00);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v32 - v13;
  v15 = type metadata accessor for SoundMeterView(0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21A9891C0(a1, (uint64_t)v18, type metadata accessor for SoundMeterView);
  v19 = (*(unsigned __int8 *)(v16 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v20 = swift_allocObject();
  sub_21A989204((uint64_t)v18, v20 + v19, type metadata accessor for SoundMeterView);
  v21 = *(int *)(v15 + 32);
  v33 = a1;
  v22 = a1 + v21;
  v23 = *(unsigned __int8 *)(v22 + 24);
  if (*(_QWORD *)(*(_QWORD *)(v22 + 32) + 16))
    type metadata accessor for Pill();
  sub_21A98B4F4();
  v24 = 1;
  sub_21A98B248();
  v25 = v39;
  v26 = v41;
  v35 = v42;
  v36 = v40;
  v27 = v44;
  v34 = v43;
  if (v23)
  {
    *(_QWORD *)v6 = sub_21A98B32C();
    *((_QWORD *)v6 + 1) = 0;
    v6[16] = 1;
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105B10);
    sub_21A98589C(v33, (uint64_t)&v6[*(int *)(v28 + 44)]);
    v29 = v32;
    sub_21A989138((uint64_t)v6, v32, &qword_255105AF0);
    *(_QWORD *)(v29 + *(int *)(v38 + 36)) = 0x3FE0000000000000;
    sub_21A98917C((uint64_t)v6, &qword_255105AF0);
    sub_21A989248(v29, (uint64_t)v14, &qword_255105AF8);
    v24 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56))(v14, v24, 1, v38);
  sub_21A989138((uint64_t)v14, (uint64_t)v12, &qword_255105B00);
  *(_QWORD *)a2 = sub_21A988A3C;
  *(_QWORD *)(a2 + 8) = v20;
  *(_QWORD *)(a2 + 16) = v25;
  *(_BYTE *)(a2 + 24) = v36;
  *(_QWORD *)(a2 + 32) = v26;
  *(_BYTE *)(a2 + 40) = v35;
  *(_QWORD *)(a2 + 48) = v34;
  *(_QWORD *)(a2 + 56) = v27;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105B08);
  sub_21A989138((uint64_t)v12, a2 + *(int *)(v30 + 48), &qword_255105B00);
  swift_retain();
  sub_21A98917C((uint64_t)v14, &qword_255105B00);
  sub_21A98917C((uint64_t)v12, &qword_255105B00);
  return swift_release();
}

__n128 sub_21A984840@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    sub_21A98B56C();
    v23 = (void *)sub_21A98B3D4();
    sub_21A98B1B8();

  }
  sub_21A98B284();
  sub_21A989138(v13, a9, &qword_255105A68);
  v24 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255105A60) + 36));
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

uint64_t sub_21A9849FC@<X0>(char a1@<W0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t *v17;
  _QWORD v19[2];

  v4 = v3;
  v19[1] = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105BE0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105BF8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105BD0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    a2(v4);
    sub_21A989138((uint64_t)v15, (uint64_t)v12, &qword_255105BD0);
    swift_storeEnumTagMultiPayload();
    sub_21A988EE0();
    sub_21A9890F8(&qword_255105BD8, &qword_255105BE0, MEMORY[0x24BDF4750]);
    sub_21A98B398();
    v16 = (uint64_t)v15;
    v17 = &qword_255105BD0;
  }
  else
  {
    sub_21A989138(v4, (uint64_t)v9, &qword_255105BE0);
    sub_21A989138((uint64_t)v9, (uint64_t)v12, &qword_255105BE0);
    swift_storeEnumTagMultiPayload();
    sub_21A988EE0();
    sub_21A9890F8(&qword_255105BD8, &qword_255105BE0, MEMORY[0x24BDF4750]);
    sub_21A98B398();
    v16 = (uint64_t)v9;
    v17 = &qword_255105BE0;
  }
  return sub_21A98917C(v16, v17);
}

uint64_t sub_21A984C0C@<X0>(char a1@<W0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t *v17;
  _QWORD v19[2];

  v4 = v3;
  v19[1] = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105C40);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105C58);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105C30);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    a2(v4);
    sub_21A989138((uint64_t)v15, (uint64_t)v12, &qword_255105C30);
    swift_storeEnumTagMultiPayload();
    sub_21A988F84(&qword_255105C28, &qword_255105C30, (uint64_t (*)(void))sub_21A989074);
    sub_21A989074();
    sub_21A98B398();
    v16 = (uint64_t)v15;
    v17 = &qword_255105C30;
  }
  else
  {
    sub_21A989138(v4, (uint64_t)v9, &qword_255105C40);
    sub_21A989138((uint64_t)v9, (uint64_t)v12, &qword_255105C40);
    swift_storeEnumTagMultiPayload();
    sub_21A988F84(&qword_255105C28, &qword_255105C30, (uint64_t (*)(void))sub_21A989074);
    sub_21A989074();
    sub_21A98B398();
    v16 = (uint64_t)v9;
    v17 = &qword_255105C40;
  }
  return sub_21A98917C(v16, v17);
}

uint64_t sub_21A984E1C@<X0>(char a1@<W0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t *v17;
  _QWORD v19[2];

  v4 = v3;
  v19[1] = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105C00);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105C08);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105C10);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    a2(v4);
    sub_21A989138((uint64_t)v15, (uint64_t)v12, &qword_255105C10);
    swift_storeEnumTagMultiPayload();
    sub_21A988F84(&qword_255105C18, &qword_255105C10, (uint64_t (*)(void))sub_21A988FF0);
    sub_21A988FF0();
    sub_21A98B398();
    v16 = (uint64_t)v15;
    v17 = &qword_255105C10;
  }
  else
  {
    sub_21A989138(v4, (uint64_t)v9, &qword_255105C00);
    sub_21A989138((uint64_t)v9, (uint64_t)v12, &qword_255105C00);
    swift_storeEnumTagMultiPayload();
    sub_21A988F84(&qword_255105C18, &qword_255105C10, (uint64_t (*)(void))sub_21A988FF0);
    sub_21A988FF0();
    sub_21A98B398();
    v16 = (uint64_t)v9;
    v17 = &qword_255105C00;
  }
  return sub_21A98917C(v16, v17);
}

uint64_t sub_21A98502C()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;

  sub_21A98877C();
  v0 = (void *)sub_21A98B578();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16F0]), sel_init);
  objc_msgSend(v1, sel_setNumberStyle_, 1);
  objc_msgSend(v1, sel_setMaximumFractionDigits_, 0);
  v2 = (void *)sub_21A98B584();
  v3 = objc_msgSend(v1, sel_stringFromNumber_, v2);

  objc_msgSend(v1, sel_setNotANumberSymbol_, v3);
  v4 = objc_msgSend(v1, sel_stringFromNumber_, v0);

  if (v4)
  {
    v5 = sub_21A98B53C();

  }
  else
  {

    return 0;
  }
  return v5;
}

uint64_t sub_21A985154@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  size_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[2];

  v4 = type metadata accessor for SoundMeterView(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = sub_21A98B338();
  v8 = (uint64_t *)(a1 + *(int *)(v4 + 32));
  v9 = *v8;
  v10 = v8[4];
  sub_21A98B254();
  if (*(_QWORD *)(v10 + 16))
  {
    v12 = v11;
    v13 = type metadata accessor for Pill();
    v14 = *(unsigned __int8 *)(*(_QWORD *)(v13 - 8) + 80);
    v15 = (v12 - *(double *)(v10 + ((v14 + 32) & ~v14) + *(int *)(v13 + 36)) * (double)v9) / (double)v9;
  }
  else
  {
    v15 = 0.0;
  }
  *(_QWORD *)a2 = v7;
  *(double *)(a2 + 8) = v15;
  *(_BYTE *)(a2 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105BA0);
  v16 = swift_bridgeObjectRetain();
  v17 = sub_21A987CD8(v16);
  swift_bridgeObjectRelease();
  v22[1] = v17;
  swift_getKeyPath();
  sub_21A9891C0(a1, (uint64_t)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SoundMeterView);
  v18 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v19 = swift_allocObject();
  sub_21A989204((uint64_t)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v19 + v18, type metadata accessor for SoundMeterView);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = sub_21A988D8C;
  *(_QWORD *)(v20 + 24) = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105BA8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105BB0);
  sub_21A9890F8(&qword_255105BB8, &qword_255105BA8, MEMORY[0x24BEE12D8]);
  sub_21A988E5C();
  return sub_21A98B4DC();
}

uint64_t sub_21A98537C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  _BYTE v18[16];
  uint64_t v19;
  uint64_t v20;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105BE0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)&v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_21A985490(a1);
  v12 = v11;
  v13 = sub_21A985490(a1);
  swift_release();
  *v10 = sub_21A98B4F4();
  v10[1] = v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105BF0);
  sub_21A98A24C(a2, v12, (uint64_t)v10 + *(int *)(v15 + 44), v13);
  swift_release();
  v16 = *(_BYTE *)(a2 + *(int *)(type metadata accessor for Pill() + 20));
  v19 = a2;
  v20 = a3;
  sub_21A9849FC(v16, (void (*)(uint64_t))sub_21A988F7C, a4);
  return sub_21A98917C((uint64_t)v10, &qword_255105BE0);
}

double sub_21A985490(uint64_t a1)
{
  uint64_t v1;
  double v2;
  double v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v13;

  v5 = type metadata accessor for SoundMeterView(0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_21A98B224();
  swift_release();
  swift_release();
  swift_release();
  v6 = (_QWORD *)(v1 + *(int *)(v5 + 32));
  v7 = v6[2];
  v8 = *(_QWORD *)(v7 + 16);
  if (!v8)
  {
    __break(1u);
LABEL_27:
    swift_once();
    goto LABEL_25;
  }
  v9 = *(double *)(v7 + 32);
  if (v13 > v9)
  {
    if (v8 < 3)
    {
      __break(1u);
    }
    else
    {
      v3 = *(double *)(v7 + 48);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_21A98B224();
      swift_release();
      swift_release();
      swift_release();
      if (*(_QWORD *)(v7 + 16))
      {
        if (!__OFSUB__(*v6, 1))
        {
          v10 = (v13 - *(double *)(v7 + 32)) / (v3 - v9) * (double)(*v6 - 1) + 1.0;
          goto LABEL_9;
        }
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
    }
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_21A98B224();
  swift_release();
  swift_release();
  swift_release();
  if (!*(_QWORD *)(v7 + 16))
    goto LABEL_30;
  v10 = v13 / *(double *)(v7 + 32);
LABEL_9:
  v11 = v10 - (double)a1;
  if (v11 <= 0.0)
    v11 = 0.0;
  v2 = 1.0;
  if (v11 <= 1.0)
    v3 = v11;
  else
    v3 = 1.0;
  if (v3 == 0.0)
  {
    if (qword_2551057E0 == -1)
      goto LABEL_25;
    goto LABEL_27;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_21A98B224();
  swift_release();
  swift_release();
  swift_release();
  if (*(_QWORD *)&v13 == 80)
  {
    if (qword_2551057D8 == -1)
      goto LABEL_24;
    goto LABEL_32;
  }
  if (v13 == 0.0)
  {
    if (qword_2551057D0 == -1)
      goto LABEL_24;
    goto LABEL_32;
  }
  if (qword_2551057E0 != -1)
LABEL_32:
    swift_once();
LABEL_24:
  v2 = v3;
LABEL_25:
  swift_retain();
  return v2;
}

uint64_t sub_21A9857CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_21A98B500();
  v7 = sub_21A98B3B0();
  sub_21A98B518();
  v9 = v8;
  v11 = v10;
  v12 = a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255105BD0) + 36);
  v13 = sub_21A98B1AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v12, a2, v13);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105B88);
  *(_QWORD *)(v12 + *(int *)(v14 + 36)) = v6;
  v15 = v12 + *(int *)(v14 + 40);
  *(_DWORD *)v15 = v7;
  *(_QWORD *)(v15 + 8) = v9;
  *(_QWORD *)(v15 + 16) = v11;
  *(_BYTE *)(v15 + 24) = 1;
  return sub_21A989138(a1, a3, &qword_255105BE0);
}

uint64_t sub_21A98589C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t result;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  char v41;
  uint64_t v42;
  void (*v43)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  int *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(_BYTE *, uint64_t);
  _BYTE v55[12];
  int v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  _BYTE *v66;
  uint64_t v67;
  uint64_t v68;

  v6 = type metadata accessor for SoundMeterView(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105B18);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = &v55[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = MEMORY[0x24BDAC7A8](v10);
  v16 = a1 + *(int *)(v6 + 32);
  if (*(_QWORD *)(*(_QWORD *)(v16 + 16) + 16))
  {
    v65 = v15;
    v66 = &v55[-v14];
    v63 = (_QWORD *)a2;
    v64 = v13;
    v59 = v12;
    v67 = sub_21A98502C();
    v68 = v17;
    sub_21A9874E8();
    a2 = sub_21A98B458();
    v2 = v18;
    v3 = v19;
    if (qword_2551057A8 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v20 = sub_21A98B44C();
  v60 = v21;
  v61 = v20;
  LODWORD(v58) = v22;
  v62 = v23;
  sub_21A988A28(a2, v2, v3 & 1);
  swift_bridgeObjectRelease();
  v67 = *(_QWORD *)(v16 + 32);
  sub_21A9891C0(a1, (uint64_t)&v55[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], type metadata accessor for SoundMeterView);
  v24 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v25 = swift_allocObject();
  sub_21A989204((uint64_t)&v55[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], v25 + v24, type metadata accessor for SoundMeterView);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105B20);
  sub_21A98B1AC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105B28);
  sub_21A9890F8(&qword_255105B30, &qword_255105B20, MEMORY[0x24BEE12D8]);
  sub_21A988BB8();
  sub_21A98928C(&qword_255105B90, (uint64_t (*)(uint64_t))type metadata accessor for Pill, (uint64_t)&unk_21A98ECD8);
  v26 = v66;
  result = sub_21A98B4E8();
  if (*(_QWORD *)(*(_QWORD *)(v16 + 16) + 16) < 3uLL)
  {
    __break(1u);
  }
  else
  {
    v28 = v58 & 1;
    v67 = sub_21A98502C();
    v68 = v29;
    v30 = sub_21A98B458();
    v32 = v31;
    v33 = v26;
    v35 = v34 & 1;
    v57 = sub_21A98B44C();
    v58 = v36;
    v38 = v37;
    v40 = v39 & 1;
    sub_21A988A28(v30, v32, v35);
    swift_bridgeObjectRelease();
    v41 = v28;
    v56 = v28;
    LOBYTE(v67) = v28;
    v42 = v64;
    v43 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v65 + 16);
    v44 = v59;
    v43(v59, v33, v64);
    v45 = v62;
    v46 = v63;
    v48 = v60;
    v47 = v61;
    *v63 = v61;
    v46[1] = v48;
    *((_BYTE *)v46 + 16) = v41;
    v46[3] = v45;
    v46[4] = 0;
    *((_BYTE *)v46 + 40) = 1;
    v49 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_255105B98);
    v43((_BYTE *)v46 + v49[16], v44, v42);
    v50 = (char *)v46 + v49[20];
    *(_QWORD *)v50 = 0;
    v50[8] = 1;
    v51 = (char *)v46 + v49[24];
    v53 = v57;
    v52 = v58;
    *(_QWORD *)v51 = v57;
    *((_QWORD *)v51 + 1) = v38;
    v51[16] = v40;
    *((_QWORD *)v51 + 3) = v52;
    sub_21A9888E8(v47, v48, v56);
    swift_bridgeObjectRetain();
    sub_21A9888E8(v53, v38, v40);
    v54 = *(void (**)(_BYTE *, uint64_t))(v65 + 8);
    swift_bridgeObjectRetain();
    v54(v66, v42);
    sub_21A988A28(v53, v38, v40);
    swift_bridgeObjectRelease();
    v54(v44, v42);
    sub_21A988A28(v47, v48, v67);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21A985CE0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t KeyPath;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105B88);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105B48);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(a1 + *(int *)(type metadata accessor for Pill() + 20)) == 1)
  {
    if (*(_QWORD *)(*(_QWORD *)(a2 + *(int *)(type metadata accessor for SoundMeterView(0) + 32) + 16) + 16) < 2uLL)
    {
      __break(1u);
    }
    else
    {
      v45 = a3;
      v46 = sub_21A98502C();
      v47 = v17;
      sub_21A9874E8();
      v18 = sub_21A98B458();
      v42 = v19;
      v43 = v18;
      v41 = v20;
      v44 = v21;
      v40 = sub_21A98B3EC();
      sub_21A98B23C();
      v3 = v22;
      v4 = v23;
      v5 = v24;
      v6 = v25;
      if (qword_2551057A8 == -1)
      {
LABEL_4:
        v26 = qword_255106298;
        KeyPath = swift_getKeyPath();
        swift_retain();
        v28 = sub_21A98B500();
        v29 = sub_21A98B3B0();
        sub_21A98B50C();
        v31 = v30;
        v33 = v32;
        v34 = sub_21A98B1AC();
        (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v12, a1, v34);
        *(_QWORD *)&v12[*(int *)(v10 + 36)] = v28;
        v35 = &v12[*(int *)(v10 + 40)];
        *(_DWORD *)v35 = v29;
        *((_QWORD *)v35 + 1) = v31;
        *((_QWORD *)v35 + 2) = v33;
        v35[24] = 0;
        sub_21A989138((uint64_t)v12, (uint64_t)&v16[*(int *)(v13 + 36)], &qword_255105B88);
        v36 = v42;
        *(_QWORD *)v16 = v43;
        *((_QWORD *)v16 + 1) = v36;
        v16[16] = v41 & 1;
        *((_QWORD *)v16 + 3) = v44;
        v16[32] = v40;
        *((_QWORD *)v16 + 5) = v3;
        *((_QWORD *)v16 + 6) = v4;
        *((_QWORD *)v16 + 7) = v5;
        *((_QWORD *)v16 + 8) = v6;
        v16[72] = 0;
        *((_QWORD *)v16 + 10) = KeyPath;
        *((_QWORD *)v16 + 11) = v26;
        sub_21A98917C((uint64_t)v12, &qword_255105B88);
        v37 = v45;
        sub_21A989248((uint64_t)v16, v45, &qword_255105B48);
        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(v37, 0, 1, v13);
      }
    }
    swift_once();
    goto LABEL_4;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(a3, 1, 1, v13);
}

uint64_t sub_21A985FD4()
{
  return sub_21A98B47C();
}

double sub_21A985FF0()
{
  return sub_21A986018();
}

double sub_21A986004()
{
  return sub_21A986018();
}

double sub_21A986018()
{
  double v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_21A98B224();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_21A986080()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_21A98B224();
  swift_release();
  swift_release();
  return v1;
}

uint64_t SoundMeterData.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;

  v1 = v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__slowLeq;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551057F0);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__fastLeq, v2);
  v4 = v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__thresholdLevel;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105808);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  return v0;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22074D110]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t SoundMeterData.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;

  v1 = v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__slowLeq;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551057F0);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__fastLeq, v2);
  v4 = v0 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__thresholdLevel;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105808);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_21A986284()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_21A986290()
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
  void (*v11)(uint64_t, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105808);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2551057F0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v1 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__slowLeq;
  v17 = 0xBFF0000000000000;
  sub_21A98B218();
  v11 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v11(v10, v9, v6);
  v12 = v1 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__fastLeq;
  v17 = 0xBFF0000000000000;
  sub_21A98B218();
  v11(v12, v9, v6);
  v13 = v1 + OBJC_IVAR____TtC9HearingUI14SoundMeterData__thresholdLevel;
  v17 = 0;
  type metadata accessor for HCEDThresholdLevel(0);
  sub_21A98B218();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v13, v5, v2);
  v14 = OBJC_IVAR____TtC9HearingUI14SoundMeterData_didChange;
  sub_21A98B20C();
  swift_allocObject();
  *(_QWORD *)(v1 + v14) = sub_21A98B200();
  return v1;
}

uint64_t sub_21A986424@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for SoundMeterData(0);
  result = sub_21A98B1E8();
  *a1 = result;
  return result;
}

uint64_t sub_21A986460()
{
  return type metadata accessor for SoundMeterData(0);
}

uint64_t type metadata accessor for SoundMeterData(uint64_t a1)
{
  return sub_21A986EFC(a1, (uint64_t *)&unk_255105838);
}

void sub_21A98647C()
{
  unint64_t v0;
  unint64_t v1;

  sub_21A986564(319, &qword_255105848, MEMORY[0x24BEE50B0], MEMORY[0x24BDB9EF0]);
  if (v0 <= 0x3F)
  {
    sub_21A986FF8(319, qword_255105850, (uint64_t (*)(uint64_t))type metadata accessor for HCEDThresholdLevel, MEMORY[0x24BDB9EF0]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SoundMeterData()
{
  return swift_lookUpClassMethod();
}

void type metadata accessor for HCEDThresholdLevel(uint64_t a1)
{
  sub_21A986564(a1, &qword_255105A50, (uint64_t)&unk_24DD61D28, MEMORY[0x24BEE4D40]);
}

void sub_21A986564(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
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

uint64_t *sub_21A9865A8(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    *a1 = *a2;
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_21A98B1DC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[6];
    v12 = a3[7];
    v13 = (char *)v4 + v11;
    v14 = (char *)a2 + v11;
    *(_OWORD *)v13 = *(_OWORD *)v14;
    *((_QWORD *)v13 + 2) = *((_QWORD *)v14 + 2);
    v15 = (uint64_t *)((char *)v4 + v12);
    v16 = (uint64_t *)((char *)a2 + v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255105998);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = sub_21A98B374();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
    }
    else
    {
      *v15 = *v16;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v19 = a3[8];
    v20 = a3[9];
    v21 = (char *)v4 + v19;
    v22 = (char *)a2 + v19;
    *(_OWORD *)v21 = *(_OWORD *)v22;
    *((_QWORD *)v21 + 2) = *((_QWORD *)v22 + 2);
    v21[24] = v22[24];
    *(_WORD *)(v21 + 25) = *(_WORD *)(v22 + 25);
    *((_QWORD *)v21 + 4) = *((_QWORD *)v22 + 4);
    v23 = (uint64_t *)((char *)v4 + v20);
    v24 = (uint64_t *)((char *)a2 + v20);
    v25 = v24[1];
    *v23 = *v24;
    v23[1] = v25;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_21A986720(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_21A98B1DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105998);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_21A98B374();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *sub_21A9867E0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A98B1DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = (char *)a1 + v10;
  v13 = (char *)a2 + v10;
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *((_QWORD *)v12 + 2) = *((_QWORD *)v13 + 2);
  v14 = (_QWORD *)((char *)a1 + v11);
  v15 = (_QWORD *)((char *)a2 + v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105998);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16 = sub_21A98B374();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  }
  else
  {
    *v14 = *v15;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v17 = a3[8];
  v18 = a3[9];
  v19 = (char *)a1 + v17;
  v20 = (char *)a2 + v17;
  *(_OWORD *)v19 = *(_OWORD *)v20;
  *((_QWORD *)v19 + 2) = *((_QWORD *)v20 + 2);
  v19[24] = v20[24];
  *(_WORD *)(v19 + 25) = *(_WORD *)(v20 + 25);
  *((_QWORD *)v19 + 4) = *((_QWORD *)v20 + 4);
  v21 = (_QWORD *)((char *)a1 + v18);
  v22 = (_QWORD *)((char *)a2 + v18);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *sub_21A986930(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A98B1DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  v11[2] = v12[2];
  if (a1 != a2)
  {
    v13 = a3[7];
    v14 = (_QWORD *)((char *)a1 + v13);
    v15 = (_QWORD *)((char *)a2 + v13);
    sub_21A98917C((uint64_t)a1 + v13, &qword_255105998);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255105998);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = sub_21A98B374();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    }
    else
    {
      *v14 = *v15;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v17 = a3[8];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  *(_QWORD *)v18 = *(_QWORD *)((char *)a2 + v17);
  *((_QWORD *)v18 + 1) = *(_QWORD *)((char *)a2 + v17 + 8);
  *((_QWORD *)v18 + 2) = *(_QWORD *)((char *)a2 + v17 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18[24] = v19[24];
  v18[25] = v19[25];
  v18[26] = v19[26];
  *((_QWORD *)v18 + 4) = *((_QWORD *)v19 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = a3[9];
  v21 = (_QWORD *)((char *)a1 + v20);
  v22 = (_QWORD *)((char *)a2 + v20);
  *v21 = *v22;
  v21[1] = v22[1];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *sub_21A986ADC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  __int128 v22;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A98B1DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = (char *)a1 + v10;
  v13 = (char *)a2 + v10;
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *((_QWORD *)v12 + 2) = *((_QWORD *)v13 + 2);
  v14 = (char *)a1 + v11;
  v15 = (char *)a2 + v11;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105998);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v17 = sub_21A98B374();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  v18 = a3[8];
  v19 = a3[9];
  v20 = (char *)a1 + v18;
  v21 = (char *)a2 + v18;
  v22 = *((_OWORD *)v21 + 1);
  *(_OWORD *)v20 = *(_OWORD *)v21;
  *((_OWORD *)v20 + 1) = v22;
  *((_QWORD *)v20 + 4) = *((_QWORD *)v21 + 4);
  *(_OWORD *)((char *)a1 + v19) = *(_OWORD *)((char *)a2 + v19);
  return a1;
}

_QWORD *sub_21A986BFC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21A98B1DC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[6];
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  *(_OWORD *)v11 = *(_OWORD *)v12;
  *((_QWORD *)v11 + 2) = *((_QWORD *)v12 + 2);
  if (a1 != a2)
  {
    v13 = a3[7];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    sub_21A98917C((uint64_t)a1 + v13, &qword_255105998);
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105998);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = sub_21A98B374();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v14, v15, v17);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
  }
  v18 = a3[8];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  *(_OWORD *)v19 = *(_OWORD *)((char *)a2 + v18);
  *((_QWORD *)v19 + 2) = *(_QWORD *)((char *)a2 + v18 + 16);
  swift_bridgeObjectRelease();
  v19[24] = v20[24];
  v19[25] = v20[25];
  v19[26] = v20[26];
  *((_QWORD *)v19 + 4) = *((_QWORD *)v20 + 4);
  swift_bridgeObjectRelease();
  v21 = a3[9];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_release();
  return a1;
}

uint64_t sub_21A986D7C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A986D88(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;

  v6 = sub_21A98B1DC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = a3[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2551059A0);
  v7 = *(_QWORD *)(v10 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v10;
    v9 = a3[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + v9, a2, v8);
  }
  v12 = *(_QWORD *)(a1 + a3[8] + 16);
  if (v12 >= 0xFFFFFFFF)
    LODWORD(v12) = -1;
  return (v12 + 1);
}

uint64_t sub_21A986E34()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A986E40(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v8 = sub_21A98B1DC();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = a4[5];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(qword_2551059A0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = a4[7];
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + v11, a2, a2, v10);
  }
  *(_QWORD *)(a1 + a4[8] + 16) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for SoundMeterView(uint64_t a1)
{
  return sub_21A986EFC(a1, (uint64_t *)&unk_255105A00);
}

uint64_t sub_21A986EFC(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21A986F30()
{
  unint64_t v0;
  unint64_t v1;

  sub_21A98B1DC();
  if (v0 <= 0x3F)
  {
    sub_21A986FF8(319, qword_255105A10, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEEA0], MEMORY[0x24BDEB560]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_21A986FF8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_21A987050()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21A987060(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SoundMeterView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21A98709C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255105A90;
  if (!qword_255105A90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255105A60);
    v2[0] = sub_21A9890F8(&qword_255105A98, &qword_255105A68, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x22074D128](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255105A90);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22074D11C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_21A987164()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255105AA0;
  if (!qword_255105AA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255105A70);
    v2[0] = sub_21A98709C();
    v2[1] = sub_21A9890F8(&qword_255105A98, &qword_255105A68, MEMORY[0x24BDF4700]);
    result = MEMORY[0x22074D128](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255105AA0);
  }
  return result;
}

uint64_t sub_21A9871E8()
{
  return sub_21A98B290();
}

uint64_t sub_21A987208(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_21A98B374();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_21A98B29C();
}

uint64_t sub_21A987284@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  os_log_type_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = v1;
  v4 = sub_21A98B314();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105998);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21A989138(v2, (uint64_t)v9, &qword_255105998);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_21A98B374();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(a1, v9, v10);
  }
  else
  {
    v12 = sub_21A98B56C();
    v13 = sub_21A98B3D4();
    if (os_log_type_enabled(v13, v12))
    {
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v17 = v15;
      *(_DWORD *)v14 = 136315138;
      *(_QWORD *)(v14 + 4) = sub_21A98774C(0xD000000000000013, 0x800000021A9911F0, &v17);
      _os_log_impl(&dword_21A95E000, v13, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22074D194](v15, -1, -1);
      MEMORY[0x22074D194](v14, -1, -1);
    }

    sub_21A98B308();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

unint64_t sub_21A9874A4()
{
  unint64_t result;

  result = qword_255105AB0;
  if (!qword_255105AB0)
  {
    result = MEMORY[0x22074D128](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255105AB0);
  }
  return result;
}

unint64_t sub_21A9874E8()
{
  unint64_t result;

  result = qword_255105AB8;
  if (!qword_255105AB8)
  {
    result = MEMORY[0x22074D128](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255105AB8);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_21A987544(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105C78);
  v10 = *(_QWORD *)(type metadata accessor for Pill() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_21A98B5C0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for Pill() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21A987FDC(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_21A98774C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21A98781C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21A98873C((uint64_t)v12, *a3);
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
      sub_21A98873C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_21A98781C(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_21A987918(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_21A98B5B4();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_21A987918(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21A9879AC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_21A987AA8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_21A987AA8((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21A9879AC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_21A987A44(v2, 0);
      result = sub_21A98B5A8();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_21A98B554();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21A987A44(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105AC0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_21A987AA8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255105AC0);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_21A987B90@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21A98B2C0();
  *a1 = result;
  return result;
}

uint64_t sub_21A987BB8()
{
  return sub_21A98B2CC();
}

uint64_t sub_21A987BDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21A98B2A8();
  *a1 = result;
  return result;
}

uint64_t sub_21A987C04()
{
  swift_retain();
  return sub_21A98B2B4();
}

uint64_t sub_21A987C2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21A98B2D8();
  *a1 = result;
  return result;
}

uint64_t sub_21A987C54()
{
  swift_retain();
  return sub_21A98B2E4();
}

uint64_t sub_21A987C7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_21A98B2F0();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_21A987CAC()
{
  return sub_21A98B2FC();
}

size_t sub_21A987CD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  size_t result;
  unint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  BOOL v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _QWORD v42[3];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;

  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105BE8);
  v2 = *(_QWORD *)(v49 - 8);
  v3 = MEMORY[0x24BDAC7A8](v49);
  v47 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v46 = (_QWORD *)((char *)v42 - v6);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v42 - v7;
  v9 = *(unsigned __int8 *)(v2 + 80);
  v10 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v45 = v10;
  v42[1] = a1;
  if (v10)
  {
    v43 = (v9 + 32) & ~v9;
    v12 = MEMORY[0x24BEE4AF8] + v43;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)(type metadata accessor for Pill() - 8);
    v16 = a1 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
    v44 = *(_QWORD *)(v15 + 72);
    v42[2] = v9 | 7;
    v17 = v11;
    v48 = v2;
    while (1)
    {
      v18 = v49;
      v19 = (uint64_t)&v47[*(int *)(v49 + 48)];
      sub_21A9891C0(v16, v19, (uint64_t (*)(_QWORD))type metadata accessor for Pill);
      v20 = *(int *)(v18 + 48);
      v21 = (uint64_t)v46;
      v22 = (uint64_t)v46 + v20;
      *v46 = v13;
      sub_21A989204(v19, v22, (uint64_t (*)(_QWORD))type metadata accessor for Pill);
      result = sub_21A989248(v21, (uint64_t)v8, &qword_255105BE8);
      if (v14)
      {
        v11 = v17;
      }
      else
      {
        v24 = v17[3];
        v25 = v48;
        if ((uint64_t)((v24 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_34;
        v26 = v24 & 0xFFFFFFFFFFFFFFFELL;
        if (v26 <= 1)
          v27 = 1;
        else
          v27 = v26;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255105C60);
        v28 = *(_QWORD *)(v25 + 72);
        v29 = v43;
        v11 = (_QWORD *)swift_allocObject();
        result = _swift_stdlib_malloc_size(v11);
        if (!v28)
          goto LABEL_35;
        v30 = result - v29;
        if (result - v29 == 0x8000000000000000 && v28 == -1)
          goto LABEL_36;
        v32 = v30 / v28;
        v11[2] = v27;
        v11[3] = 2 * (v30 / v28);
        v33 = (char *)v11 + v29;
        v34 = v17[3] >> 1;
        v35 = v34 * v28;
        if (v17[2])
        {
          if (v11 < v17 || v33 >= (char *)v17 + v43 + v35)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v11 != v17)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v17[2] = 0;
        }
        v12 = (uint64_t)&v33[v35];
        v14 = (v32 & 0x7FFFFFFFFFFFFFFFLL) - v34;
        result = swift_release();
      }
      v37 = v48;
      v38 = __OFSUB__(v14--, 1);
      if (v38)
        break;
      ++v13;
      sub_21A989248((uint64_t)v8, v12, &qword_255105BE8);
      v12 += *(_QWORD *)(v37 + 72);
      v16 += v44;
      v17 = v11;
      if (v45 == v13)
        goto LABEL_29;
    }
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v14 = 0;
LABEL_29:
  result = swift_bridgeObjectRelease();
  v39 = v11[3];
  if (v39 < 2)
    return (size_t)v11;
  v40 = v39 >> 1;
  v38 = __OFSUB__(v40, v14);
  v41 = v40 - v14;
  if (!v38)
  {
    v11[2] = v41;
    return (size_t)v11;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_21A987FDC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(type metadata accessor for Pill() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_21A98B5CC();
  __break(1u);
  return result;
}

uint64_t sub_21A9880F4@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  __int128 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  _OWORD *v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v4 = (int *)type metadata accessor for Pill();
  v5 = *((_QWORD *)v4 - 1);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105C70);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_21A98E720;
  *(_OWORD *)(v8 + 32) = xmmword_21A98E730;
  *(_QWORD *)(v8 + 48) = 0x405B800000000000;
  v21 = v8;
  v22 = a2;
  if (a1)
  {
    if (a1 != 1)
    {
      v25 = a1;
      result = sub_21A98B5D8();
      __break(1u);
      return result;
    }
    v20 = 0;
  }
  else
  {
    v20 = 1;
  }
  v9 = MEMORY[0x24BEE4AF8];
  v10 = 18;
  v24 = xmmword_21A98E740;
  v23 = xmmword_21A98E750;
  do
  {
    sub_21A98B1A0();
    if (qword_2551057E0 != -1)
      swift_once();
    v11 = qword_2551062F8;
    v7[v4[5]] = v10 == 6;
    *(_QWORD *)&v7[v4[6]] = v11;
    *(_QWORD *)&v7[v4[7]] = 0x3FD3333333333333;
    *(_QWORD *)&v7[v4[8]] = a1;
    v12 = (__int128 *)&v7[v4[9]];
    v13 = v23;
    *v12 = v24;
    v12[1] = v13;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v9 = sub_21A987544(0, *(_QWORD *)(v9 + 16) + 1, 1, v9);
    v15 = *(_QWORD *)(v9 + 16);
    v14 = *(_QWORD *)(v9 + 24);
    if (v15 >= v14 >> 1)
      v9 = sub_21A987544(v14 > 1, v15 + 1, 1, v9);
    *(_QWORD *)(v9 + 16) = v15 + 1;
    result = sub_21A989204((uint64_t)v7, v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v15, (uint64_t (*)(_QWORD))type metadata accessor for Pill);
    --v10;
  }
  while (v10);
  v18 = v21;
  v17 = v22;
  *v22 = xmmword_21A98E760;
  *((_QWORD *)v17 + 2) = v18;
  LOBYTE(v18) = v20;
  *((_BYTE *)v17 + 24) = v20;
  *((_BYTE *)v17 + 25) = v18;
  *((_BYTE *)v17 + 26) = v18;
  *((_QWORD *)v17 + 4) = v9;
  return result;
}

BOOL sub_21A988354(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t (*v12)(char *, uint64_t);
  int v13;
  unint64_t v14;
  int v15;
  _DWORD *v16;
  int v17;
  unint64_t v18;
  uint64_t v20;

  v4 = sub_21A98B374();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - v9;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)&v20 - v9, a1, v4);
  v12 = *(uint64_t (**)(char *, uint64_t))(v5 + 88);
  v13 = v12(v10, v4);
  v14 = 0;
  v15 = *MEMORY[0x24BDEEE58];
  v16 = (_DWORD *)MEMORY[0x24BDEEE90];
  if (v13 != *MEMORY[0x24BDEEE58])
  {
    if (v13 == *MEMORY[0x24BDEEE90])
    {
      v14 = 1;
      goto LABEL_24;
    }
    if (v13 == *MEMORY[0x24BDEEE98])
    {
      v14 = 2;
      goto LABEL_24;
    }
    if (v13 == *MEMORY[0x24BDEEE88])
      goto LABEL_7;
    if (v13 == *MEMORY[0x24BDEEE50])
    {
      v14 = 4;
    }
    else if (v13 == *MEMORY[0x24BDEEE60])
    {
      v14 = 5;
    }
    else if (v13 == *MEMORY[0x24BDEEE30])
    {
      v14 = 6;
    }
    else if (v13 == *MEMORY[0x24BDEEE70])
    {
      v14 = 7;
    }
    else if (v13 == *MEMORY[0x24BDEEE68])
    {
      v14 = 8;
    }
    else if (v13 == *MEMORY[0x24BDEEE78])
    {
      v14 = 9;
    }
    else if (v13 == *MEMORY[0x24BDEEE40])
    {
      v14 = 10;
    }
    else
    {
      if (v13 != *MEMORY[0x24BDEEE48])
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_7:
        v14 = 3;
        goto LABEL_24;
      }
      v14 = 11;
    }
  }
LABEL_24:
  v11(v8, a2, v4);
  v17 = v12(v8, v4);
  if (v17 == v15)
  {
    v18 = 0;
  }
  else if (v17 == *v16)
  {
    v18 = 1;
  }
  else if (v17 == *MEMORY[0x24BDEEE98])
  {
    v18 = 2;
  }
  else
  {
    if (v17 != *MEMORY[0x24BDEEE88])
    {
      if (v17 == *MEMORY[0x24BDEEE50])
      {
        v18 = 4;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE60])
      {
        v18 = 5;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE30])
      {
        v18 = 6;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE70])
      {
        v18 = 7;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE68])
      {
        v18 = 8;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE78])
      {
        v18 = 9;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE40])
      {
        v18 = 10;
        return v14 >= v18;
      }
      if (v17 == *MEMORY[0x24BDEEE48])
      {
        v18 = 11;
        return v14 >= v18;
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    v18 = 3;
  }
  return v14 >= v18;
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21A98873C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21A98877C()
{
  unint64_t result;

  result = qword_255105AC8;
  if (!qword_255105AC8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255105AC8);
  }
  return result;
}

uint64_t sub_21A9887B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 144);
  v9 = *(_QWORD *)(a1 + 136);
  v7 = *(_BYTE *)(a1 + 152);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_21A9888AC(v6, v2, v3, v4);
  sub_21A9888E8(v9, v8, v7);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_21A9888AC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_21A9888E8(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_21A9888E8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_21A9888F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 80);
  v4 = *(_QWORD *)(a1 + 88);
  v6 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 144);
  v9 = *(_QWORD *)(a1 + 136);
  v7 = *(_BYTE *)(a1 + 152);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_21A9889EC(v6, v2, v3, v4);
  sub_21A988A28(v9, v8, v7);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21A9889EC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_21A988A28(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21A988A28(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_21A988A3C(uint64_t a1)
{
  return sub_21A988B5C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_21A985154);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for SoundMeterView(0);
  v2 = v0
     + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80));
  v3 = v2 + *(int *)(v1 + 20);
  v4 = sub_21A98B1DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v2 + *(int *)(v1 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255105998);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_21A98B374();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A988B50(uint64_t a1)
{
  return sub_21A988B5C(a1, (uint64_t (*)(uint64_t, uint64_t))sub_21A985CE0);
}

uint64_t sub_21A988B5C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SoundMeterView(0) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

unint64_t sub_21A988BB8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_255105B38;
  if (!qword_255105B38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255105B28);
    v2 = sub_21A988C1C();
    result = MEMORY[0x22074D128](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255105B38);
  }
  return result;
}

unint64_t sub_21A988C1C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255105B40;
  if (!qword_255105B40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255105B48);
    v2[0] = sub_21A988CA0();
    v2[1] = sub_21A9890F8(&qword_255105B80, &qword_255105B88, MEMORY[0x24BDEFFA0]);
    result = MEMORY[0x22074D128](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255105B40);
  }
  return result;
}

unint64_t sub_21A988CA0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255105B50;
  if (!qword_255105B50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255105B58);
    v2[0] = sub_21A988D24();
    v2[1] = sub_21A9890F8(&qword_255105B70, &qword_255105B78, MEMORY[0x24BDF1028]);
    result = MEMORY[0x22074D128](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255105B50);
  }
  return result;
}

unint64_t sub_21A988D24()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255105B60;
  if (!qword_255105B60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255105B68);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x22074D128](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255105B60);
  }
  return result;
}

uint64_t sub_21A988D8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SoundMeterView(0) - 8) + 80);
  return sub_21A98537C(a1, a2, v3 + ((v7 + 16) & ~v7), a3);
}

uint64_t sub_21A988DE0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21A988E04(char *a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, char *);
  uint64_t v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 16);
  v4 = *(_QWORD *)a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105BE8);
  return v3(v4, &a1[*(int *)(v5 + 48)]);
}

unint64_t sub_21A988E5C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255105BC0;
  if (!qword_255105BC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255105BB0);
    v2[0] = sub_21A988EE0();
    v2[1] = sub_21A9890F8(&qword_255105BD8, &qword_255105BE0, MEMORY[0x24BDF4750]);
    result = MEMORY[0x22074D128](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255105BC0);
  }
  return result;
}

unint64_t sub_21A988EE0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255105BC8;
  if (!qword_255105BC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255105BD0);
    v2[0] = sub_21A9890F8(&qword_255105BD8, &qword_255105BE0, MEMORY[0x24BDF4750]);
    v2[1] = sub_21A9890F8(&qword_255105B80, &qword_255105B88, MEMORY[0x24BDEFFA0]);
    result = MEMORY[0x22074D128](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255105BC8);
  }
  return result;
}

uint64_t sub_21A988F7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_21A9857CC(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_21A988F84(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x22074D128](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21A988FF0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255105C20;
  if (!qword_255105C20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255105C00);
    v2[0] = sub_21A988F84(&qword_255105C28, &qword_255105C30, (uint64_t (*)(void))sub_21A989074);
    v2[1] = sub_21A989074();
    result = MEMORY[0x22074D128](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255105C20);
  }
  return result;
}

unint64_t sub_21A989074()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255105C38;
  if (!qword_255105C38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255105C40);
    v2[0] = sub_21A9890F8(&qword_255105C48, &qword_255105C50, MEMORY[0x24BDEB358]);
    v2[1] = MEMORY[0x24BDECC38];
    result = MEMORY[0x22074D128](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255105C38);
  }
  return result;
}

uint64_t sub_21A9890F8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22074D128](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21A989138(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21A98917C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21A9891C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21A989204(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21A989248(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21A98928C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22074D128](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for PillMetrics(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SoundMeterConfiguration()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SoundMeterConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_WORD *)(a1 + 25) = *(_WORD *)(a2 + 25);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SoundMeterConfiguration(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_BYTE *)(a1 + 26) = *(_BYTE *)(a2 + 26);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for SoundMeterConfiguration(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  *(_BYTE *)(a1 + 26) = *(_BYTE *)(a2 + 26);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SoundMeterConfiguration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SoundMeterConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SoundMeterConfiguration()
{
  return &type metadata for SoundMeterConfiguration;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SoundMeterMetrics(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SoundMeterMetrics(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SoundMeterMetrics()
{
  return &type metadata for SoundMeterMetrics;
}

unint64_t sub_21A98958C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_255105C80;
  if (!qword_255105C80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255105A80);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255105A70);
    v2[3] = sub_21A987164();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_21A98928C(&qword_255105C88, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x22074D128](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255105C80);
  }
  return result;
}

id HUISoundMeterViewInterface.__allocating_init(configurationType:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return HUISoundMeterViewInterface.init(configurationType:)(a1);
}

id HUISoundMeterViewInterface.init(configurationType:)(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id result;
  void *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  objc_class *v18;
  objc_super v19;

  v3 = type metadata accessor for SoundMeterView(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (id *)((char *)&v19.receiver - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = v1;
  sub_21A98B1D0();
  type metadata accessor for SoundMeterData(0);
  swift_allocObject();
  *(_QWORD *)&v6[OBJC_IVAR___HUISoundMeterViewInterfaceInternal_data] = sub_21A986290();
  swift_retain();
  sub_21A982450(a1, v5);
  v7 = (uint64_t)&v6[OBJC_IVAR___HUISoundMeterViewInterfaceInternal_soundMeterView];
  sub_21A989920((uint64_t)v5, (uint64_t)&v6[OBJC_IVAR___HUISoundMeterViewInterfaceInternal_soundMeterView]);
  sub_21A989964(v7, (uint64_t)v5);
  sub_21A9899A8();
  sub_21A98B4D0();
  v8 = (void *)sub_21A98B3A4();
  swift_release();
  swift_getObjectType();
  v9 = v8;
  sub_21A98B350();
  objc_opt_self();
  v10 = (void *)swift_dynamicCastObjCClass();
  if (!v10)
  {

    v15 = sub_21A98B1C4();
    v16 = sub_21A98B56C();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_21A95E000, v15, v16, "Unable to cast SDK-provided hosting controller to UIViewController", v17, 2u);
      MEMORY[0x22074D194](v17, -1, -1);
    }

    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB08]), sel_init);
    goto LABEL_7;
  }
  v11 = v10;
  result = objc_msgSend(v10, sel_view);
  if (result)
  {
    v13 = result;
    v14 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v13, sel_setBackgroundColor_, v14);

LABEL_7:
    *(_QWORD *)&v6[OBJC_IVAR___HUISoundMeterViewInterfaceInternal_viewController] = v11;

    v18 = (objc_class *)type metadata accessor for HUISoundMeterViewInterface();
    v19.receiver = v6;
    v19.super_class = v18;
    return objc_msgSendSuper2(&v19, sel_init);
  }
  __break(1u);
  return result;
}

uint64_t sub_21A989920(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SoundMeterView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A989964(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SoundMeterView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_21A9899A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255105C98;
  if (!qword_255105C98)
  {
    v1 = type metadata accessor for SoundMeterView(255);
    result = MEMORY[0x22074D128](&unk_21A98E854, v1);
    atomic_store(result, (unint64_t *)&qword_255105C98);
  }
  return result;
}

uint64_t type metadata accessor for HUISoundMeterViewInterface()
{
  uint64_t result;

  result = qword_255105CD8;
  if (!qword_255105CD8)
    return swift_getSingletonMetadata();
  return result;
}

id sub_21A989A50()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___HUISoundMeterViewInterfaceInternal_viewController);
}

uint64_t sub_21A989A70()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain_n();
  sub_21A98B230();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_21A98B230();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_21A98B230();
  swift_retain();
  sub_21A98B1F4();
  swift_release();
  return swift_release();
}

id HUISoundMeterViewInterface.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void HUISoundMeterViewInterface.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HUISoundMeterViewInterface.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HUISoundMeterViewInterface();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL SoundMeterConfigurationType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_21A989D40(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21A989D54()
{
  sub_21A98B5E4();
  sub_21A98B5F0();
  return sub_21A98B5FC();
}

uint64_t sub_21A989D98()
{
  return sub_21A98B5F0();
}

uint64_t sub_21A989DC0()
{
  sub_21A98B5E4();
  sub_21A98B5F0();
  return sub_21A98B5FC();
}

_QWORD *sub_21A989E00@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

void sub_21A989E30(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

double sub_21A989E3C@<D0>(double *a1@<X8>)
{
  return sub_21A989EC0(a1);
}

double sub_21A989E50@<D0>(double *a1@<X8>)
{
  return sub_21A989EC0(a1);
}

uint64_t sub_21A989E74()
{
  return sub_21A989F70();
}

uint64_t sub_21A989E88()
{
  return sub_21A989F70();
}

double sub_21A989EAC@<D0>(double *a1@<X8>)
{
  return sub_21A989EC0(a1);
}

double sub_21A989EC0@<D0>(double *a1@<X8>)
{
  double result;
  double v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_21A98B224();
  swift_release();
  swift_release();
  result = v3;
  *a1 = v3;
  return result;
}

double sub_21A989F38@<D0>(double *a1@<X8>)
{
  return sub_21A989EC0(a1);
}

uint64_t sub_21A989F5C()
{
  return sub_21A989F70();
}

uint64_t sub_21A989F70()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_21A98B230();
}

uint64_t sub_21A989FE4()
{
  return sub_21A989F70();
}

uint64_t sub_21A98A008@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_21A98B224();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_21A98A088()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_21A98B230();
}

unint64_t sub_21A98A100()
{
  unint64_t result;

  result = qword_255105CA8;
  if (!qword_255105CA8)
  {
    result = MEMORY[0x22074D128](&protocol conformance descriptor for SoundMeterConfigurationType, &type metadata for SoundMeterConfigurationType);
    atomic_store(result, (unint64_t *)&qword_255105CA8);
  }
  return result;
}

uint64_t sub_21A98A144()
{
  return type metadata accessor for HUISoundMeterViewInterface();
}

uint64_t sub_21A98A14C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for SoundMeterView(319);
  if (v1 <= 0x3F)
  {
    result = sub_21A98B1DC();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for HUISoundMeterViewInterface()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HUISoundMeterViewInterface.__allocating_init(configurationType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of HUISoundMeterViewInterface.soundMeterViewController()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of HUISoundMeterViewInterface.updateViewsWith(slowLeq:fastLeq:thresholdLevel:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

ValueMetadata *type metadata accessor for SoundMeterConfigurationType()
{
  return &type metadata for SoundMeterConfigurationType;
}

uint64_t sub_21A98A24C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, _QWORD, uint64_t);
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 *v35;
  char v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  void (*v50)(char *, _QWORD, uint64_t);
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v56 = a2;
  v59 = a3;
  v6 = sub_21A98B278();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v49 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105C50);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105C40);
  MEMORY[0x24BDAC7A8](v60);
  v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105C00);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105CE8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v58 = (uint64_t)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v57 = (uint64_t)&v49 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v49 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v55 = (uint64_t)&v49 - v25;
  v26 = type metadata accessor for Pill();
  v27 = a1;
  v53 = a1 + *(int *)(v26 + 36);
  v54 = v6;
  v28 = *(_QWORD *)(v53 + 24);
  v29 = &v8[*(int *)(v6 + 20)];
  v30 = *MEMORY[0x24BDEEB68];
  v31 = sub_21A98B344();
  v32 = *(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v31 - 8) + 104);
  v52 = v30;
  v50 = v32;
  v51 = v31;
  ((void (*)(char *, uint64_t))v32)(v29, v30);
  *(_QWORD *)v8 = v28;
  *((_QWORD *)v8 + 1) = v28;
  if (qword_2551057E0 != -1)
    swift_once();
  v33 = qword_2551062F8;
  sub_21A98A7E8((uint64_t)v8, (uint64_t)v11);
  *(_QWORD *)&v11[*(int *)(v9 + 52)] = v33;
  *(_WORD *)&v11[*(int *)(v9 + 56)] = 256;
  swift_retain();
  sub_21A98A82C((uint64_t)v8);
  sub_21A989138((uint64_t)v11, (uint64_t)v13, &qword_255105C50);
  *(_QWORD *)&v13[*(int *)(v60 + 36)] = 0x3FF0000000000000;
  sub_21A98917C((uint64_t)v11, &qword_255105C50);
  v34 = v9;
  v35 = (unsigned __int8 *)(v27 + *(int *)(v26 + 20));
  v36 = MEMORY[0x24BDAC7A8](*v35);
  *(&v49 - 2) = v27;
  sub_21A984C0C(v36, (void (*)(uint64_t))sub_21A98B024, (uint64_t)v16);
  v37 = sub_21A98917C((uint64_t)v13, &qword_255105C40);
  MEMORY[0x24BDAC7A8](v37);
  *(&v49 - 2) = v27;
  sub_21A984E1C((v38 & 1) == 0, (void (*)(uint64_t))sub_21A98A868, (uint64_t)v24);
  sub_21A98917C((uint64_t)v16, &qword_255105C00);
  v39 = v55;
  sub_21A98A880((uint64_t)v24, v55);
  v40 = *(_QWORD *)(v53 + 24);
  v50(&v8[*(int *)(v54 + 20)], v52, v51);
  *(_QWORD *)v8 = v40;
  *((_QWORD *)v8 + 1) = v40;
  sub_21A98A7E8((uint64_t)v8, (uint64_t)v11);
  *(_QWORD *)&v11[*(int *)(v34 + 52)] = v56;
  *(_WORD *)&v11[*(int *)(v34 + 56)] = 256;
  swift_retain();
  sub_21A98A82C((uint64_t)v8);
  sub_21A989138((uint64_t)v11, (uint64_t)v13, &qword_255105C50);
  *(double *)&v13[*(int *)(v60 + 36)] = a4;
  sub_21A98917C((uint64_t)v11, &qword_255105C50);
  v41 = MEMORY[0x24BDAC7A8](*v35);
  *(&v49 - 2) = v27;
  sub_21A984C0C(v41, (void (*)(uint64_t))sub_21A98A970, (uint64_t)v16);
  v42 = sub_21A98917C((uint64_t)v13, &qword_255105C40);
  MEMORY[0x24BDAC7A8](v42);
  *(&v49 - 2) = v27;
  v44 = v57;
  sub_21A984E1C((v43 & 1) == 0, (void (*)(uint64_t))sub_21A98B028, v57);
  sub_21A98917C((uint64_t)v16, &qword_255105C00);
  sub_21A98A880(v44, (uint64_t)v24);
  sub_21A989138(v39, v44, &qword_255105CE8);
  v45 = v58;
  sub_21A989138((uint64_t)v24, v58, &qword_255105CE8);
  v46 = v59;
  sub_21A989138(v44, v59, &qword_255105CE8);
  v47 = __swift_instantiateConcreteTypeFromMangledName(qword_255105CF0);
  sub_21A989138(v45, v46 + *(int *)(v47 + 48), &qword_255105CE8);
  sub_21A98917C((uint64_t)v24, &qword_255105CE8);
  sub_21A98917C(v39, &qword_255105CE8);
  sub_21A98917C(v45, &qword_255105CE8);
  return sub_21A98917C(v44, &qword_255105CE8);
}

uint64_t type metadata accessor for Pill()
{
  uint64_t result;

  result = qword_255105D50;
  if (!qword_255105D50)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21A98A7E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21A98B278();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21A98A82C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21A98B278();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_21A98A868@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21A98A988(a1, a2);
}

uint64_t sub_21A98A880(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255105CE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_21A98A8C8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _OWORD *v4;
  double result;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  type metadata accessor for Pill();
  sub_21A98B4F4();
  sub_21A98B248();
  sub_21A989138(a1, a2, &qword_255105C40);
  v4 = (_OWORD *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255105C30) + 36));
  *v4 = v6;
  v4[1] = v7;
  result = *(double *)&v8;
  v4[2] = v8;
  return result;
}

double sub_21A98A970@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_21A98A8C8(a1, a2);
}

double sub_21A98A988@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _OWORD *v4;
  double result;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  type metadata accessor for Pill();
  sub_21A98B4F4();
  sub_21A98B248();
  sub_21A989138(a1, a2, &qword_255105C00);
  v4 = (_OWORD *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255105C10) + 36));
  *v4 = v6;
  v4[1] = v7;
  result = *(double *)&v8;
  v4[2] = v8;
  return result;
}

_QWORD *sub_21A98AA2C(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  __int128 v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_21A98B1AC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    *(_QWORD *)((char *)a1 + v8) = *(_QWORD *)((char *)a2 + v8);
    v9 = a3[8];
    *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
    *(_QWORD *)((char *)a1 + v9) = *(_QWORD *)((char *)a2 + v9);
    v10 = a3[9];
    v11 = (_OWORD *)((char *)a1 + v10);
    v12 = (_OWORD *)((char *)a2 + v10);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
  }
  swift_retain();
  return a1;
}

uint64_t sub_21A98AAE4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21A98B1AC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_release();
}

uint64_t sub_21A98AB28(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;

  v6 = sub_21A98B1AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[9];
  v10 = (_OWORD *)(a1 + v9);
  v11 = (_OWORD *)(a2 + v9);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  swift_retain();
  return a1;
}

uint64_t sub_21A98ABB8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_21A98B1AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  v7 = a3[9];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  return a1;
}

uint64_t sub_21A98AC74(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;

  v6 = sub_21A98B1AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[9];
  v10 = (_OWORD *)(a1 + v9);
  v11 = (_OWORD *)(a2 + v9);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  return a1;
}

uint64_t sub_21A98AD00(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;

  v6 = sub_21A98B1AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  swift_release();
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[9];
  v10 = (_OWORD *)(a1 + v9);
  v11 = (_OWORD *)(a2 + v9);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  return a1;
}

uint64_t sub_21A98AD94()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A98ADA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_21A98B1AC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_21A98AE1C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21A98AE28(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_21A98B1AC();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_21A98AEA0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21A98B1AC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_21A98AF3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255105D98;
  if (!qword_255105D98)
  {
    v1 = sub_21A98B1AC();
    result = MEMORY[0x22074D128](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_255105D98);
  }
  return result;
}

uint64_t sub_21A98AF84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_21A98B1AC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
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

uint64_t getEnumTagSinglePayload for PillMetrics(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PillMetrics(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PillMetrics()
{
  return &type metadata for PillMetrics;
}

uint64_t sub_21A98B02C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void __getLSApplicationWorkspaceClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_21A98B188();
}

uint64_t sub_21A98B188()
{
  return MEMORY[0x24BDCB648]();
}

uint64_t sub_21A98B194()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_21A98B1A0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_21A98B1AC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21A98B1B8()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_21A98B1C4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21A98B1D0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21A98B1DC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21A98B1E8()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_21A98B1F4()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_21A98B200()
{
  return MEMORY[0x24BDB9D78]();
}

uint64_t sub_21A98B20C()
{
  return MEMORY[0x24BDB9D80]();
}

uint64_t sub_21A98B218()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_21A98B224()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_21A98B230()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_21A98B23C()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_21A98B248()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_21A98B254()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_21A98B260()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_21A98B26C()
{
  return MEMORY[0x24BDED248]();
}

uint64_t sub_21A98B278()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_21A98B284()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_21A98B290()
{
  return MEMORY[0x24BDEDF90]();
}

uint64_t sub_21A98B29C()
{
  return MEMORY[0x24BDEDF98]();
}

uint64_t sub_21A98B2A8()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_21A98B2B4()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_21A98B2C0()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_21A98B2CC()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_21A98B2D8()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_21A98B2E4()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_21A98B2F0()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_21A98B2FC()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_21A98B308()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_21A98B314()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_21A98B320()
{
  return MEMORY[0x24BDEE6F8]();
}

uint64_t sub_21A98B32C()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_21A98B338()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_21A98B344()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_21A98B350()
{
  return MEMORY[0x24BDEECD8]();
}

uint64_t sub_21A98B35C()
{
  return MEMORY[0x24BDEED20]();
}

uint64_t sub_21A98B368()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_21A98B374()
{
  return MEMORY[0x24BDEEEA0]();
}

uint64_t sub_21A98B380()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_21A98B38C()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_21A98B398()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_21A98B3A4()
{
  return MEMORY[0x24BDF0738]();
}

uint64_t sub_21A98B3B0()
{
  return MEMORY[0x24BDF0860]();
}

uint64_t sub_21A98B3BC()
{
  return MEMORY[0x24BDF09F8]();
}

uint64_t sub_21A98B3C8()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_21A98B3D4()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_21A98B3E0()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_21A98B3EC()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_21A98B3F8()
{
  return MEMORY[0x24BDF15A0]();
}

uint64_t sub_21A98B404()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_21A98B410()
{
  return MEMORY[0x24BDF16E8]();
}

uint64_t sub_21A98B41C()
{
  return MEMORY[0x24BDF1790]();
}

uint64_t sub_21A98B428()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_21A98B434()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_21A98B440()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_21A98B44C()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_21A98B458()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_21A98B464()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_21A98B470()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_21A98B47C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_21A98B488()
{
  return MEMORY[0x24BDF2B70]();
}

uint64_t sub_21A98B494()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_21A98B4A0()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_21A98B4AC()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_21A98B4B8()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_21A98B4C4()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_21A98B4D0()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_21A98B4DC()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_21A98B4E8()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_21A98B4F4()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_21A98B500()
{
  return MEMORY[0x24BDF5258]();
}

uint64_t sub_21A98B50C()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_21A98B518()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_21A98B524()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21A98B530()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_21A98B53C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21A98B548()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21A98B554()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21A98B560()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21A98B56C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_21A98B578()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_21A98B584()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_21A98B590()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_21A98B59C()
{
  return MEMORY[0x24BDD0518]();
}

uint64_t sub_21A98B5A8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21A98B5B4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21A98B5C0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21A98B5CC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21A98B5D8()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_21A98B5E4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21A98B5F0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21A98B5FC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AXLogAggregate()
{
  return MEMORY[0x24BDFE0A8]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BDFE0F0]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x24BDFE248]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BDFE260]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t CCUIItemEdgeSize()
{
  return MEMORY[0x24BE19A80]();
}

uint64_t CCUILayoutGutter()
{
  return MEMORY[0x24BE19A88]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t HAInitializeLogging()
{
  return MEMORY[0x24BE4BD80]();
}

uint64_t HCLogSoundMeter()
{
  return MEMORY[0x24BE4BD88]();
}

uint64_t HardwareAddressToCString()
{
  return MEMORY[0x24BE29598]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

uint64_t PAInitializeLogging()
{
  return MEMORY[0x24BE4BDB0]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BEBDE80]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BEBDE98](*(_QWORD *)&notification, argument);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x24BDFEDA0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint64_t compoundAttributeByAddingAttribute()
{
  return MEMORY[0x24BE4BE90]();
}

uint64_t compoundAttributeByRemovingAttribute()
{
  return MEMORY[0x24BE4BE98]();
}

uint64_t compoundAttributeContainsAttribute()
{
  return MEMORY[0x24BE4BEA0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t hearingAidReceivingAudio()
{
  return MEMORY[0x24BE4BEA8]();
}

uint64_t hearingAidStreamAvailableAsync()
{
  return MEMORY[0x24BE4BEB0]();
}

uint64_t hearingEarFromInputOption()
{
  return MEMORY[0x24BE4BEC8]();
}

uint64_t hearingInputRouteStringForOption()
{
  return MEMORY[0x24BE4BED0]();
}

uint64_t hearingLocString()
{
  return MEMORY[0x24BE4BED8]();
}

uint64_t inputOptionFromHearingEar()
{
  return MEMORY[0x24BE4BEE0]();
}

uint64_t liveListenStreamSelectedAsync()
{
  return MEMORY[0x24BE4BEF0]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t paBluetoothDeviceSupportsSSL()
{
  return MEMORY[0x24BE71AA8]();
}

uint64_t paCurrentBluetoothDeviceSupportingTransparencyAccommodations()
{
  return MEMORY[0x24BE71AB0]();
}

uint64_t paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync()
{
  return MEMORY[0x24BE71AB8]();
}

uint64_t paCurrentRouteSupportsTransparencyAccommodations()
{
  return MEMORY[0x24BE71AC0]();
}

uint64_t paLocString()
{
  return MEMORY[0x24BE71AC8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

