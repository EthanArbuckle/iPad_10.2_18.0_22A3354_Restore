uint64_t ASCAXIdentifierWithSuffix(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AppStoreComponents.%@"), a1);
}

id ASCAXLabelForElements(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void (*v7)(id);
  void *v8;
  _Unwind_Exception *v10;
  _Unwind_Exception *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  v1 = a1;
  v2 = (void *)MEMORY[0x1E0CB3880];
  v3 = v1;
  objc_msgSend(v2, "predicateWithBlock:", &__block_literal_global);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v7 = (void (*)(id))getAXLabelForElementsSymbolLoc_ptr;
  v16 = getAXLabelForElementsSymbolLoc_ptr;
  if (!getAXLabelForElementsSymbolLoc_ptr)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __getAXLabelForElementsSymbolLoc_block_invoke;
    v12[3] = &unk_1E7560230;
    v12[4] = &v13;
    __getAXLabelForElementsSymbolLoc_block_invoke((uint64_t)v12);
    v7 = (void (*)(id))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v7)
  {
    ASCAXLabelForElements_cold_1();
    v11 = v10;
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v11);
  }
  v7(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id ASCAXFormatFloatWithPercentage(uint64_t a1, float a2)
{
  void (*v4)(uint64_t, float);
  _Unwind_Exception *v6;
  _Unwind_Exception *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = (void (*)(uint64_t, float))getAXFormatFloatWithPercentageSymbolLoc_ptr;
  v12 = getAXFormatFloatWithPercentageSymbolLoc_ptr;
  if (!getAXFormatFloatWithPercentageSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getAXFormatFloatWithPercentageSymbolLoc_block_invoke;
    v8[3] = &unk_1E7560230;
    v8[4] = &v9;
    __getAXFormatFloatWithPercentageSymbolLoc_block_invoke((uint64_t)v8);
    v4 = (void (*)(uint64_t, float))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
  {
    ASCAXLabelForElements_cold_1();
    v7 = v6;
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v7);
  }
  v4(a1, a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id ASCAXStarRatingStringForRating(float a1)
{
  void (*v2)(double);
  _Unwind_Exception *v4;
  _Unwind_Exception *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (void (*)(double))getUIAXStarRatingStringForRatingSymbolLoc_ptr;
  v10 = getUIAXStarRatingStringForRatingSymbolLoc_ptr;
  if (!getUIAXStarRatingStringForRatingSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getUIAXStarRatingStringForRatingSymbolLoc_block_invoke;
    v6[3] = &unk_1E7560230;
    v6[4] = &v7;
    __getUIAXStarRatingStringForRatingSymbolLoc_block_invoke((uint64_t)v6);
    v2 = (void (*)(double))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    ASCAXLabelForElements_cold_1();
    v5 = v4;
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  v2(a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void *__getAXLabelForElementsSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AXRuntimeLibraryCore_frameworkLibrary)
  {
    v2 = (void *)AXRuntimeLibraryCore_frameworkLibrary;
  }
  else
  {
    AXRuntimeLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)AXRuntimeLibraryCore_frameworkLibrary;
    if (!AXRuntimeLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AXLabelForElements");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAXLabelForElementsSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAXFormatFloatWithPercentageSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AXCoreUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)AXCoreUtilitiesLibraryCore_frameworkLibrary;
  }
  else
  {
    AXCoreUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)AXCoreUtilitiesLibraryCore_frameworkLibrary;
    if (!AXCoreUtilitiesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AXFormatFloatWithPercentage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAXFormatFloatWithPercentageSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getUIAXStarRatingStringForRatingSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (UIAccessibilityLibraryCore_frameworkLibrary)
  {
    v2 = (void *)UIAccessibilityLibraryCore_frameworkLibrary;
  }
  else
  {
    UIAccessibilityLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)UIAccessibilityLibraryCore_frameworkLibrary;
    if (!UIAccessibilityLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "UIAXStarRatingStringForRating");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getUIAXStarRatingStringForRatingSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BCB80A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1BCB89D9C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

double ASCArtworkCropScaleSizeToFit(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  double v10;
  double v11;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v9 = a1;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v10 = *MEMORY[0x1E0C9D820];
  v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if ((a2 != *MEMORY[0x1E0C9D820] || a3 != v11) && (a4 != v10 || a5 != v11))
  {
    v14 = -a4;
    if (a4 >= 0.0)
      v14 = a4;
    if (v14 == 0.0)
      v15 = 0.0;
    else
      v15 = a2 / a4;
    v16 = -a5;
    if (a5 >= 0.0)
      v16 = a5;
    if (v16 == 0.0)
      v17 = 0.0;
    else
      v17 = a3 / a5;
    if ((!objc_msgSend(v9, "isEqualToString:", CFSTR("cc")) || a2 != a3)
      && (objc_msgSend(v9, "isEqualToString:", CFSTR("sr")) & 1) == 0)
    {
      v18 = a4 * v17;
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("bb")))
      {
        if (v15 >= v17)
          a2 = v18;
      }
      else if (v15 < v17)
      {
        a2 = v18;
      }
    }
    v10 = floor(a2);
  }

  return v10;
}

uint64_t ASCArtworkFormatIsLayered(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("lcr"));

  return v2;
}

uint64_t ASCArtworkDecorationHasBorder(void *a1)
{
  id v1;
  int v2;

  v1 = a1;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("none"));

  return v2 ^ 1u;
}

void sub_1BCB97AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t ASCLockupContextIsAdGridContext(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("adGridWithPortraitScreenshots")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("adGridWithLandscapeScreenshots"));

  return v2;
}

uint64_t ASCLockupContextIsAdMaterialContext(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("adMaterialWithPortraitScreenshots")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("adMaterialWithLandscapeScreenshots"));

  return v2;
}

uint64_t ASCLockupContextIsAdMaterialWithLandscapeScreenshotsContext(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("adMaterialWithLandscapeScreenshots"));
}

uint64_t ASCLockupContextIsContingentPricingContext(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("contingentPricing"));
}

void sub_1BCBA0C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ASCLockupFeatureGetClasses()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v11 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  return (id)objc_msgSend(v15, "initWithObjects:", v14, v13, v12, v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
}

id ASCLockupFeaturesDecodeForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  ASCLockupFeatureGetClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1BCBA1BE4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BCBA1FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,id a35)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a35);
  _Unwind_Resume(a1);
}

void sub_1BCBA25C8(_Unwind_Exception *a1)
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

void sub_1BCBA271C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BCBA2B08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
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

void sub_1BCBA2C40(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BCBA3790(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1BCBA683C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCBA6BA0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1BCBA8D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

Class __getSKStoreProductViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  StoreKitLibrary();
  result = objc_getClass("SKStoreProductViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSKStoreProductViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSKStoreProductViewControllerClass_block_invoke_cold_1();
    return (Class)StoreKitLibrary();
  }
  return result;
}

uint64_t StoreKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (!StoreKitLibraryCore_frameworkLibrary)
    StoreKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = StoreKitLibraryCore_frameworkLibrary;
  if (!StoreKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc_ptr;
  v6 = getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc_ptr;
  if (!getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc_ptr)
  {
    v1 = (void *)StoreKitLibrary();
    v0 = dlsym(v1, "SKStoreProductParameterCustomProductPageIdentifier");
    v4[3] = (uint64_t)v0;
    getSKStoreProductParameterCustomProductPageIdentifierSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BCBA970C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1BCBAD548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCBADCC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCBAE718(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1BCBAECD0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

double ASCLockupViewSizeGetIconSize(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  double v5;

  v3 = a1;
  +[ASCEligibility assertCurrentProcessEligibility]();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mini")) & 1) != 0)
  {
    v4 = 0x4044000000000000;
LABEL_5:
    v5 = *(double *)&v4;
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("small")) & 1) != 0)
  {
LABEL_4:
    v4 = 0x404F000000000000;
    goto LABEL_5;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("medium")))
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("largeAppShowcase")) & 1) != 0)
    {
      v4 = 0x4056000000000000;
      goto LABEL_5;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("largeAppAd")) & 1) != 0)
    {
      v4 = 0x404E000000000000;
      goto LABEL_5;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("smallOfferButton")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mediumOfferButton")) & 1) == 0)
        ASCUnknownEnumCase(CFSTR("ASCLockupViewSize"), v3);
      v4 = 0x4049000000000000;
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (a2 == 2)
    v5 = 105.0;
  else
    v5 = 88.0;
LABEL_6:

  return v5;
}

uint64_t ASCLockupViewSizeIsMini(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("mini"));
}

uint64_t ASCLockupViewSizeIsSmall(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("small"));
}

uint64_t ASCLockupViewSizeIsMedium(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("medium"));
}

uint64_t ASCLockupViewSizeIsLargeAppShowcase(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("largeAppShowcase"));
}

uint64_t ASCLockupViewSizeIsLargeAppAd(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("largeAppAd"));
}

uint64_t ASCLockupViewSizeIsSmallOfferButton(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("smallOfferButton"));
}

uint64_t ASCLockupViewSizeIsMediumOfferButton(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("mediumOfferButton"));
}

double ASCLockupViewSizeGetLayoutEstimatedSize(void *a1, void *a2, double a3, double a4)
{
  id v7;
  id v8;
  double v9;
  double v10;

  v7 = a1;
  v8 = a2;
  +[ASCEligibility assertCurrentProcessEligibility]();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("mini")))
  {
    +[__ASCLayoutProxy miniLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:](__ASCLayoutProxy, "miniLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:", v8, a3, a4);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("small")))
  {
    +[__ASCLayoutProxy smallLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:](__ASCLayoutProxy, "smallLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:", v8, a3, a4);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("medium")))
  {
    +[__ASCLayoutProxy mediumLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:](__ASCLayoutProxy, "mediumLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:", v8, a3, a4);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("smallOfferButton")))
  {
    +[__ASCLayoutProxy smallOfferButtonLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:](__ASCLayoutProxy, "smallOfferButtonLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:", v8, a3, a4);
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("mediumOfferButton")))
    {
      v10 = *MEMORY[0x1E0C9D820];
      goto LABEL_12;
    }
    +[__ASCLayoutProxy mediumOfferButtonLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:](__ASCLayoutProxy, "mediumOfferButtonLockupEstimatedSizeFittingSize:compatibleWithTraitCollection:", v8, a3, a4);
  }
  v10 = v9;
LABEL_12:

  return v10;
}

double ASCLockupViewSizeGetEstimatedSize(void *a1, void *a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  id v15;
  id v16;

  v15 = a1;
  v16 = a2;
  +[ASCEligibility assertCurrentProcessEligibility]();
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("mini")) & 1) != 0
    || (objc_msgSend(v15, "isEqualToString:", CFSTR("small")) & 1) != 0
    || (objc_msgSend(v15, "isEqualToString:", CFSTR("medium")) & 1) != 0
    || (objc_msgSend(v15, "isEqualToString:", CFSTR("smallOfferButton")) & 1) != 0
    || objc_msgSend(v15, "isEqualToString:", CFSTR("mediumOfferButton")))
  {
    a3 = a6 + a8 + ASCLockupViewSizeGetLayoutEstimatedSize(v15, v16, a3 - a6 - a8, a4 - a5 - a7);
  }
  else
  {
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("largeAppShowcase")) & 1) == 0
      && !objc_msgSend(v15, "isEqualToString:", CFSTR("largeAppAd")))
    {
      ASCUnknownEnumCase(CFSTR("ASCLockupViewSize"), v15);
    }
    ASCLockupViewSizeGetIconSize(v15, objc_msgSend(v16, "horizontalSizeClass"));
  }

  return a3;
}

id ASCLockupViewSizeGetOfferButtonSize(void *a1)
{
  int v1;
  uint64_t *v2;

  v1 = objc_msgSend(a1, "isEqualToString:", CFSTR("mediumOfferButton"));
  v2 = &ASCOfferButtonSizeSmall;
  if (v1)
    v2 = &ASCOfferButtonSizeMedium;
  return (id)*v2;
}

uint64_t ASCLockupViewSizeOfferButtonSubtitlePosition(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("medium")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("mini"));
    v2 = 0;
  }

  return v2;
}

id ASCLockupViewSizeGetOfferTheme(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  +[ASCEligibility assertCurrentProcessEligibility]();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("mini")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("small")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("medium")) & 1) != 0
    || objc_msgSend(v1, "isEqualToString:", CFSTR("smallOfferButton")))
  {
    +[ASCOfferTheme grayTheme](ASCOfferTheme, "grayTheme");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("largeAppShowcase"))
         || objc_msgSend(v1, "isEqualToString:", CFSTR("largeAppAd")))
  {
    +[ASCOfferTheme blueTheme](ASCOfferTheme, "blueTheme");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", CFSTR("mediumOfferButton")))
      ASCUnknownEnumCase(CFSTR("ASCLockupViewSize"), v1);
    +[ASCOfferTheme essoTheme](ASCOfferTheme, "essoTheme");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)v2;

  return v3;
}

void sub_1BCBB12AC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1BCBB16B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1BCBB1B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCBB205C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ASCMetricsFieldsGetCodableClasses()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
}

id ASCMetricsFieldsDecodeForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  ASCMetricsFieldsGetCodableClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id ASCMetricsDataDecodeArrayForKey(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0C99E60];
  v4 = a2;
  v5 = a1;
  v6 = [v3 alloc];
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_1BCBB5EE4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1BCBB72DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BCBB73E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BCBB7BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCBB8E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCBB9028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCBB9D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id ASCOfferFlagsGetDescription(__int16 a1)
{
  id v2;
  void *v3;
  void *v4;

  +[ASCEligibility assertCurrentProcessEligibility]();
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("ASCOfferHasMessagesExtension"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("ASCOfferCreatesJobs"));
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v3, "addObject:", CFSTR("ASCOfferIsArcadeApp"));
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "addObject:", CFSTR("ASCOfferIsPreorder"));
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v3, "addObject:", CFSTR("ASCOfferIsDisabled"));
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v3, "addObject:", CFSTR("ASCOfferForceWatchInstall"));
  if ((a1 & 0x40) == 0)
  {
LABEL_8:
    if ((a1 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v3, "addObject:", CFSTR("ASCOfferIsDeletableSystemApp"));
  if ((a1 & 0x80) == 0)
  {
LABEL_9:
    if ((a1 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "addObject:", CFSTR("ASCOfferIsIOSAppOnMacOS"));
  if ((a1 & 0x100) == 0)
  {
LABEL_10:
    if ((a1 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "addObject:", CFSTR("ASCOfferIsFree"));
  if ((a1 & 0x200) == 0)
  {
LABEL_11:
    if ((a1 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "addObject:", CFSTR("ASCOfferIsDSIDLess"));
  if ((a1 & 0x400) == 0)
  {
LABEL_12:
    if ((a1 & 0x800) == 0)
      goto LABEL_13;
LABEL_27:
    objc_msgSend(v3, "addObject:", CFSTR("ASCOfferShouldInstallParentApp"));
    if ((a1 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_26:
  objc_msgSend(v3, "addObject:", CFSTR("ASCOfferIsContingentOffer"));
  if ((a1 & 0x800) != 0)
    goto LABEL_27;
LABEL_13:
  if ((a1 & 0x1000) != 0)
LABEL_14:
    objc_msgSend(v3, "addObject:", CFSTR("ASCOfferIsAppDistributionOffer"));
LABEL_15:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" | "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id ASCOfferTitlesDecodeForKey(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0C99E60];
  v4 = a2;
  v5 = a1;
  v6 = [v3 alloc];
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id ASCOfferGetCodableClasses()
{
  if (ASCOfferGetCodableClasses_onceToken != -1)
    dispatch_once(&ASCOfferGetCodableClasses_onceToken, &__block_literal_global_18);
  return (id)ASCOfferGetCodableClasses_classes;
}

id ASCOfferDecodeForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  ASCOfferGetCodableClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

CGPath *ASCPathCreateProgressRing(double a1, double a2, double a3, double a4, CGFloat a5, double a6, double a7)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  double v14;
  double v15;
  CGFloat v16;
  CGPath *Mutable;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v20 = CGRectInset(*(CGRect *)&a1, a5, a5);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MidY = CGRectGetMidY(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v14 = CGRectGetWidth(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v15 = CGRectGetHeight(v23);
  if (v14 < v15)
    v15 = v14;
  v16 = v15 * 0.5;
  Mutable = CGPathCreateMutable();
  CGPathAddRelativeArc(Mutable, 0, MidX, MidY, v16, a6 * 6.28318531 + -1.57079633, a7 * 6.28318531);
  return Mutable;
}

void sub_1BCBBEE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ASCOfferMetadataGetOfferTheme(void *a1)
{
  void *v1;

  if (objc_msgSend(a1, "isViewInAppStore"))
  {
    +[ASCOfferTheme viewInAppStoreTheme](ASCOfferTheme, "viewInAppStoreTheme");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

id ASCOfferMetadataAnimationForName(void *a1)
{
  id v1;
  void *v2;
  double v3;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("none")) & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", CFSTR("rotate")))
      ASCUnknownEnumCase(CFSTR("ASCOfferMetadataAnimationName"), v1);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFromValue:", &unk_1E757A6E8);
    objc_msgSend(v2, "setToValue:", &unk_1E757A6F8);
    objc_msgSend(v2, "setByValue:", &unk_1E757A708);
    objc_msgSend(v2, "setDuration:", 1.0);
    objc_msgSend(v2, "setRemovedOnCompletion:", 0);
    LODWORD(v3) = 2139095040;
    objc_msgSend(v2, "setRepeatCount:", v3);
  }

  return v2;
}

void sub_1BCBC27BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BCBC2ACC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1BCBC2C80(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BCBC53BC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1BCBC53DC(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1BCBC5384);
}

void sub_1BCBC5560(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1BCBC5750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
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

void sub_1BCBC58F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BCBC5A8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1BCBC5C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
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

void sub_1BCBC6894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_1_3@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2114;
  *(_QWORD *)(a2 + 14) = result;
  return result;
}

void sub_1BCBC79F0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

unint64_t ASCSignpostTagCreateForProcess(unint64_t a1, int a2)
{
  _QWORD block[5];

  if (!(a1 >> 47))
    return a2 | (a1 << 17);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __ASCSignpostTagCreateForProcess_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (ASCSignpostTagCreateForProcess_onceToken != -1)
    dispatch_once(&ASCSignpostTagCreateForProcess_onceToken, block);
  return a1 + a2;
}

unint64_t ASCSignpostTagCreate(unint64_t a1)
{
  pid_t v2;

  v2 = getpid();
  return ASCSignpostTagCreateForProcess(a1, v2);
}

unint64_t ASCSignpostTagUnique()
{
  unint64_t v0;
  pid_t v1;

  do
    v0 = __ldxr(&ASCSignpostTagUnique_nextValue);
  while (__stxr(v0 + 1, &ASCSignpostTagUnique_nextValue));
  v1 = getpid();
  return ASCSignpostTagCreateForProcess(v0, v1);
}

unint64_t ASCSignpostTagFromIDInProcess(void *a1, int a2)
{
  return ASCSignpostTagCreateForProcess(objc_msgSend(a1, "int64value"), a2);
}

unint64_t ASCSignpostTagFromID(void *a1)
{
  unint64_t v1;
  pid_t v2;

  v1 = objc_msgSend(a1, "int64value");
  v2 = getpid();
  return ASCSignpostTagCreateForProcess(v1, v2);
}

id ASCLockupDarkStyleSubtitleColor()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASCSemanticColor secondaryLabel]();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resolvedColorWithTraitCollection:", v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1BCBCC980(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1BCBCC9A0(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1BCBCC948);
}

void sub_1BCBCCE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1BCBCD104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BCBCD3F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void ASCUnknownEnumCase(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ does not have case with value %@"), v3, v4);
  v6 = objc_alloc(MEMORY[0x1E0C99DA0]);
  v9[0] = CFSTR("enumName");
  v9[1] = CFSTR("enumValue");
  v10[0] = v3;
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "initWithName:reason:userInfo:", CFSTR("ASCUnknownEnumCaseException"), v5, v7);

  objc_exception_throw(v8);
}

void sub_1BCBCE09C(void *a1)
{
  void *v1;

  objc_begin_catch(a1);
  objc_storeStrong((id *)&ASCURLLauncher_testingURLLauncher, v1);
  objc_exception_rethrow();
}

void sub_1BCBCE0B8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1BCBCE318(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1BCBD2758(void *a1)
{
  void *v1;

  objc_begin_catch(a1);
  objc_storeStrong((id *)&ASCWorkspace_testingWorkspace, v1);
  objc_exception_rethrow();
}

void sub_1BCBD2774(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id ASCAppOfferStateDelegateGetInterface()
{
  if (ASCAppOfferStateDelegateGetInterface_onceToken != -1)
    dispatch_once(&ASCAppOfferStateDelegateGetInterface_onceToken, &__block_literal_global_32);
  return (id)ASCAppOfferStateDelegateGetInterface_interface;
}

id ASCAppOfferStateServiceGetInterface()
{
  if (ASCAppOfferStateServiceGetInterface_onceToken != -1)
    dispatch_once(&ASCAppOfferStateServiceGetInterface_onceToken, &__block_literal_global_51);
  return (id)ASCAppOfferStateServiceGetInterface_interface;
}

id ASCURLLaunchServiceGetInterface()
{
  if (ASCURLLaunchServiceGetInterface_onceToken != -1)
    dispatch_once(&ASCURLLaunchServiceGetInterface_onceToken, &__block_literal_global_79);
  return (id)ASCURLLaunchServiceGetInterface_interface;
}

id ASCLockupFetcherServiceGetInterface()
{
  if (ASCLockupFetcherServiceGetInterface_onceToken != -1)
    dispatch_once(&ASCLockupFetcherServiceGetInterface_onceToken, &__block_literal_global_85);
  return (id)ASCLockupFetcherServiceGetInterface_interface;
}

id ASCMetricsServiceGetInterface()
{
  if (ASCMetricsServiceGetInterface_onceToken != -1)
    dispatch_once(&ASCMetricsServiceGetInterface_onceToken, &__block_literal_global_108);
  return (id)ASCMetricsServiceGetInterface_interface;
}

id ASCServiceBrokerGetInterface()
{
  if (ASCServiceBrokerGetInterface_onceToken != -1)
    dispatch_once(&ASCServiceBrokerGetInterface_onceToken, &__block_literal_global_126);
  return (id)ASCServiceBrokerGetInterface_interface;
}

__CFString *ASCStringFromNotifyStatus(uint64_t a1)
{
  int v2;
  __CFString *v3;

  v2 = a1;
  v3 = CFSTR("NOTIFY_STATUS_OK");
  switch(v2)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("NOTIFY_STATUS_INVALID_NAME");
      break;
    case 2:
      v3 = CFSTR("NOTIFY_STATUS_INVALID_TOKEN");
      break;
    case 3:
      v3 = CFSTR("NOTIFY_STATUS_INVALID_PORT");
      break;
    case 4:
      v3 = CFSTR("NOTIFY_STATUS_INVALID_FILE");
      break;
    case 5:
      v3 = CFSTR("NOTIFY_STATUS_INVALID_SIGNAL");
      break;
    case 6:
      v3 = CFSTR("NOTIFY_STATUS_INVALID_REQUEST");
      break;
    case 7:
      v3 = CFSTR("NOTIFY_STATUS_NOT_AUTHORIZED");
      break;
    case 8:
      v3 = CFSTR("NOTIFY_STATUS_OPT_DISABLE");
      break;
    case 9:
      v3 = CFSTR("NOTIFY_STATUS_SERVER_NOT_FOUND");
      break;
    case 10:
      v3 = CFSTR("NOTIFY_STATUS_NULL_INPUT");
      break;
    default:
      if ((_DWORD)a1 == 1000000)
        v3 = CFSTR("NOTIFY_STATUS_FAILED");
      else
        v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NOTIFY_STATUS_UNKNOWN (%u)"), a1);
      break;
  }
  return v3;
}

id ASCLockupImageStringForName(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  if (!v3)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  +[ASCImageRenderer bundleImageNamed:compatibleWithTraitCollection:](ASCImageRenderer, "bundleImageNamed:compatibleWithTraitCollection:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[ASCImageRenderer systemImageNamed:compatibleWithTraitCollection:](ASCImageRenderer, "systemImageNamed:compatibleWithTraitCollection:", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        ASCLockupImageStringForName_cold_1((uint64_t)v3);
      goto LABEL_7;
    }
  }
  objc_msgSend(MEMORY[0x1E0DC33D0], "textAttachmentWithImage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v7;
}

id ASCLocalizedFormatString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (void *)MEMORY[0x1E0C99DC8];
  v2 = a1;
  objc_msgSend(v1, "asc_storefrontLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "asc_frameworkBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__asc_localizedStringForKey:inTable:withLanguage:", v2, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id ASCLocalizedPlatformFormatString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DC8], "asc_storefrontLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "asc_frameworkBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "asc_localizedStringKeyPlatformSuffix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "__asc_localizedStringForKey:inTable:withLanguage:", v6, 0, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", v6) & 1) != 0)
  {
    objc_msgSend(v4, "__asc_localizedStringForKey:inTable:withLanguage:", v1, 0, v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v7;
  }
  v9 = v8;

  return v9;
}

uint64_t ASCLocalizedStringFromBundle(void *a1, const char *a2, uint64_t a3)
{
  return objc_msgSend(a1, "__asc_localizedStringForKey:inTable:withLanguage:", a2, 0, a3);
}

double ASCFontPointSizesResolve(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v15;
  double v16;
  double v17;
  double v18;

  v9 = a1;
  objc_msgSend(v9, "preferredContentSizeCategory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC4908]) & 1) == 0)
  {
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC4930]))
    {
      v11 = a3 * 0.333333333;
      v12 = 0.666666667;
LABEL_6:
      v13 = v11 + a2 * v12;
LABEL_7:
      a2 = round(v13);
      goto LABEL_8;
    }
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC4920]))
    {
      v11 = a3 * 0.666666667;
      v12 = 0.333333333;
      goto LABEL_6;
    }
    a2 = a3;
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC4918]) & 1) != 0)
      goto LABEL_8;
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC4900]))
    {
      v15 = a4 * 0.333333333;
      v16 = 0.666666667;
LABEL_14:
      v13 = v15 + a3 * v16;
      goto LABEL_7;
    }
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC48F8]))
    {
      v15 = a4 * 0.666666667;
      v16 = 0.333333333;
      goto LABEL_14;
    }
    a2 = a4;
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC48F0]) & 1) != 0)
      goto LABEL_8;
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC48D8]))
    {
      v17 = a5 * 0.2;
      v18 = 0.8;
LABEL_24:
      v13 = v17 + a4 * v18;
      goto LABEL_7;
    }
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC48D0]))
    {
      v17 = a5 * 0.4;
      v18 = 0.6;
      goto LABEL_24;
    }
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC48C8]))
    {
      v17 = a5 * 0.6;
      v18 = 0.4;
      goto LABEL_24;
    }
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC48C0]))
    {
      v17 = a5 * 0.8;
      v18 = 0.2;
      goto LABEL_24;
    }
    a2 = a5;
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC48B8]) & 1) == 0)
      ASCUnknownEnumCase(CFSTR("UIContentSizeCategory"), v10);
  }
LABEL_8:

  return a2;
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

double sub_1BCBD56D8(void *a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  char v11;
  char v12;
  double v13;
  double v14;
  _QWORD v17[144];
  _QWORD v18[5];

  v3 = v2;
  v6 = sub_1BCC00F54();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v17[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(a1, sel_traitCollection);
  v11 = sub_1BCC00E4C();

  sub_1BCBDB1C0(v3, (uint64_t)v17);
  if ((v11 & 1) != 0)
  {
    sub_1BCBDB1F4(v17);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v18, v18[3]);
    v12 = sub_1BCC006C0();
    sub_1BCBDB1F4(v17);
    if ((v12 & 1) != 0)
    {
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 632), *(_QWORD *)(v3 + 656));
      sub_1BCBE8C78();
      sub_1BCC007BC();
      v14 = v13;
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return (a2 - v14) * 0.5;
    }
  }
  return a2;
}

double sub_1BCBD5848(void *a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  double v10;
  id v11;
  char v12;
  id v13;
  char v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void (*v19)(char *, uint64_t);
  double v20;
  double v21;
  double v22;
  uint64_t v24;

  v3 = v2;
  v6 = sub_1BCC00F54();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BCBD56D8(a1, a2);
  v11 = objc_msgSend(a1, sel_traitCollection);
  v12 = sub_1BCC00E70();

  if ((v12 & 1) == 0)
  {
    v13 = objc_msgSend(a1, sel_traitCollection);
    v14 = sub_1BCC00E4C();

    if ((v14 & 1) != 0)
    {
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 712), *(_QWORD *)(v3 + 736));
      sub_1BCC00714();
      v16 = v10 - v15;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 40));
      sub_1BCBE8C78();
      sub_1BCC007BC();
      v18 = v17;
      v19 = *(void (**)(char *, uint64_t))(v7 + 8);
      v19(v9, v6);
      v20 = v16 - v18 - *(double *)(v3 + 456);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + 472), *(_QWORD *)(v3 + 496));
      sub_1BCBE8C78();
      sub_1BCC007BC();
      v22 = v21;
      v19(v9, v6);
      return v20 - v22;
    }
  }
  return v10;
}

double sub_1BCBD5A24(void *a1, double a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  double v10;
  id v11;
  char v12;
  void (*v13)(char *, uint64_t);
  id v14;
  uint64_t v16;

  v3 = v2;
  v6 = sub_1BCC00F54();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BCBD5848(a1, a2);
  v11 = objc_msgSend(a1, sel_traitCollection, sub_1BCBDB220(v2, a1, v10));
  v12 = sub_1BCC00E70();

  if ((v12 & 1) != 0)
  {
    __swift_project_boxed_opaque_existential_1(v3 + 2, v3[5]);
    sub_1BCBE8C78();
    sub_1BCC007BC();
    v13 = *(void (**)(char *, uint64_t))(v7 + 8);
    v13(v9, v6);
    __swift_project_boxed_opaque_existential_1(v3 + 52, v3[55]);
    sub_1BCBE8C78();
    sub_1BCC007BC();
    v13(v9, v6);
    __swift_project_boxed_opaque_existential_1(v3 + 59, v3[62]);
    sub_1BCBE8C78();
    sub_1BCC007BC();
    v13(v9, v6);
  }
  sub_1BCBD56D8(a1, a2);
  __swift_project_boxed_opaque_existential_1(v3 + 84, v3[87]);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  __swift_project_boxed_opaque_existential_1(v3 + 144, v3[147]);
  sub_1BCC00708();
  __swift_project_boxed_opaque_existential_1(v3 + 144, v3[147]);
  if ((sub_1BCC006C0() & 1) != 0)
  {
    v14 = objc_msgSend(a1, sel_traitCollection);
    sub_1BCC00E4C();

  }
  return a2;
}

_QWORD *sub_1BCBD5D48@<X0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, double a5@<D2>, CGFloat a6@<D3>)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  id v25;
  int v26;
  double v27;
  double v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  char *v34;
  double v35;
  double MinX;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  char v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  double MaxY;
  double v57;
  double v58;
  double v59;
  double Width;
  char *v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  _QWORD *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  CGFloat v76;
  CGFloat v77;
  double v78;
  _BYTE v79[40];
  _BYTE v80[40];
  _BYTE v81[40];
  _BYTE v82[40];
  _BYTE v83[40];
  _BYTE v84[40];
  _BYTE v85[40];
  _BYTE v86[40];
  _BYTE v87[40];
  _QWORD v88[89];
  _QWORD v89[135];
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v7 = v6;
  v73 = a2;
  v13 = sub_1BCC006B4();
  v71 = *(_QWORD *)(v13 - 8);
  v72 = v13;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1BCC00BDC();
  v64 = *(_QWORD *)(v16 - 8);
  v65 = v16;
  v17 = MEMORY[0x1E0C80A78](v16);
  *(_QWORD *)&v66 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v62 = (char *)&v62 - v19;
  v20 = sub_1BCC00BF4();
  v69 = *(_QWORD *)(v20 - 8);
  v70 = v20;
  MEMORY[0x1E0C80A78](v20);
  v68 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1BCC00F54();
  v74 = *(_QWORD *)(v22 - 8);
  v75 = v22;
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = objc_msgSend(a1, sel_traitCollection);
  v26 = sub_1BCC00E4C();

  v27 = sub_1BCBD56D8(a1, a5);
  __swift_project_boxed_opaque_existential_1(v7 + 144, v7[147]);
  v90.origin.x = a3;
  v90.origin.y = a4;
  v90.size.width = a5;
  v90.size.height = a6;
  CGRectGetHeight(v90);
  sub_1BCC00714();
  v78 = v28;
  v91.origin.x = a3;
  v91.origin.y = a4;
  v91.size.width = a5;
  v91.size.height = a6;
  CGRectGetHeight(v91);
  v76 = a5;
  v77 = a6;
  sub_1BCC00E94();
  v29 = v7[147];
  v67 = v7 + 144;
  __swift_project_boxed_opaque_existential_1(v7 + 144, v29);
  v30 = sub_1BCC006C0();
  v63 = v26;
  if ((v30 & 1) != 0 && (v26 & 1) != 0)
  {
    __swift_project_boxed_opaque_existential_1(v7 + 84, v7[87]);
    sub_1BCBE8C78();
    sub_1BCC007BC();
    (*(void (**)(char *, uint64_t))(v74 + 8))(v24, v75);
  }
  sub_1BCBDAE08((uint64_t)v7, (uint64_t)v88);
  sub_1BCBDAE7C((uint64_t)(v7 + 94), (uint64_t)v87, &qword_1ED1BC8B0);
  sub_1BCBDB05C((uint64_t)(v7 + 99), (uint64_t)v86);
  sub_1BCBDB05C((uint64_t)(v7 + 104), (uint64_t)v85);
  sub_1BCBDAE7C((uint64_t)(v7 + 109), (uint64_t)v84, &qword_1ED1BC8B0);
  sub_1BCBDAE7C((uint64_t)(v7 + 114), (uint64_t)v83, &qword_1ED1BC8B0);
  sub_1BCBDAE7C((uint64_t)(v7 + 124), (uint64_t)v82, &qword_1ED1BC8A8);
  sub_1BCBDAE7C((uint64_t)(v7 + 129), (uint64_t)v81, &qword_1ED1BC8B0);
  sub_1BCBDAE7C((uint64_t)(v7 + 134), (uint64_t)v80, &qword_1ED1BC8A8);
  sub_1BCBDAE7C((uint64_t)(v7 + 139), (uint64_t)v79, &qword_1ED1BC8A8);
  sub_1BCBD6450((uint64_t)v88, (uint64_t)v87, (uint64_t)v86, (uint64_t)v85, (uint64_t)v84, (uint64_t)v83, (uint64_t)v82, (uint64_t)v81, (uint64_t)v89, (uint64_t)v80, (uint64_t)v79);
  v88[3] = &type metadata for AdLockupLayout.AdLockupInnerContentLayout;
  v88[4] = sub_1BCBDAEC0();
  v88[0] = swift_allocObject();
  sub_1BCBDB028((uint64_t)v89, v88[0] + 16);
  sub_1BCBDB05C((uint64_t)(v7 + 89), (uint64_t)v87);
  sub_1BCBDB05C((uint64_t)(v7 + 2), (uint64_t)v86);
  sub_1BCBDB05C((uint64_t)(v7 + 119), (uint64_t)v85);
  sub_1BCBDB05C((uint64_t)(v7 + 59), (uint64_t)v84);
  v31 = *MEMORY[0x1E0D42118];
  v32 = v65;
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v64 + 104);
  v33(v62, v31, v65);
  v33(*(char **)&v66, v31, v32);
  v34 = v68;
  sub_1BCC00BE8();
  sub_1BCC00BD0();
  if ((v63 & 1) != 0)
  {
    sub_1BCC0069C();
    MinX = v35;
    sub_1BCC0069C();
    v38 = v37;
    sub_1BCC00678();
    v66 = a3;
    v40 = v38 + v39;
    __swift_project_boxed_opaque_existential_1(v7 + 84, v7[87]);
    sub_1BCBE8C78();
    sub_1BCC007BC();
    v42 = v41;
    (*(void (**)(char *, uint64_t))(v74 + 8))(v24, v75);
    v43 = v40 + v42;
    a3 = v66;
  }
  else
  {
    v44 = objc_msgSend(a1, sel_traitCollection);
    v45 = sub_1BCC00E64();

    if ((v45 & 1) != 0)
    {
      v92.origin.x = a3;
      v92.origin.y = a4;
      v92.size.width = v76;
      v92.size.height = v77;
      MinX = CGRectGetMinX(v92);
    }
    else
    {
      sub_1BCC0069C();
      v47 = v46;
      sub_1BCC00678();
      v49 = v47 + v48;
      __swift_project_boxed_opaque_existential_1(v7 + 79, v7[82]);
      sub_1BCBE8C78();
      sub_1BCC007BC();
      v51 = v50;
      (*(void (**)(char *, uint64_t))(v74 + 8))(v24, v75);
      MinX = v49 + v51;
    }
    sub_1BCC0069C();
    v53 = v52;
    sub_1BCC00678();
    v43 = floor(v53 + v54 * 0.5 - v78 * 0.5);
  }
  __swift_project_boxed_opaque_existential_1(v67, v7[147]);
  v55 = v78;
  sub_1BCC006E4();
  v93.origin.x = MinX;
  v93.origin.y = v43;
  v93.size.width = v27;
  v93.size.height = v55;
  MaxY = CGRectGetMaxY(v93);
  sub_1BCC0069C();
  v58 = v57;
  sub_1BCC00678();
  if (MaxY <= v58 + v59)
    MaxY = v58 + v59;
  v94.origin.x = a3;
  v94.origin.y = a4;
  v94.size.width = v76;
  v94.size.height = v77;
  Width = CGRectGetWidth(v94);
  MEMORY[0x1BCCFDA74](a3, a4, Width, MaxY, MaxY, 0.0);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v15, v72);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v34, v70);
  return sub_1BCBDB0A0(v89);
}

uint64_t sub_1BCBD6450@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v29;
  uint64_t v31;
  _QWORD v33[3];
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  *(_QWORD *)(a9 + 32) = 0;
  *(_OWORD *)a9 = 0u;
  *(_OWORD *)(a9 + 16) = 0u;
  v29 = a9 + 160;
  *(_OWORD *)(a9 + 136) = 0u;
  *(_OWORD *)(a9 + 152) = 0u;
  *(_OWORD *)(a9 + 168) = 0u;
  *(_OWORD *)(a9 + 184) = 0u;
  *(_OWORD *)(a9 + 216) = 0u;
  *(_OWORD *)(a9 + 232) = 0u;
  *(_OWORD *)(a9 + 248) = 0u;
  *(_OWORD *)(a9 + 120) = 0u;
  *(_OWORD *)(a9 + 264) = 0u;
  *(_OWORD *)(a9 + 280) = 0u;
  *(_OWORD *)(a9 + 296) = 0u;
  *(_OWORD *)(a9 + 312) = 0u;
  *(_OWORD *)(a9 + 328) = 0u;
  *(_OWORD *)(a9 + 344) = 0u;
  *(_OWORD *)(a9 + 200) = 0u;
  sub_1BCBDAE08(a1, a9 + 360);
  v31 = a2;
  v18 = a2;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a7;
  sub_1BCBDB0CC(v18, a9, &qword_1ED1BC8B0);
  sub_1BCBDB05C(v19, a9 + 40);
  sub_1BCBDB05C(v20, a9 + 80);
  sub_1BCBDB0CC(v21, a9 + 120, &qword_1ED1BC8B0);
  sub_1BCBDB0CC(v22, v29, &qword_1ED1BC8B0);
  sub_1BCBDB0CC(a7, a9 + 200, &qword_1ED1BC8A8);
  sub_1BCBDAE7C(a8, (uint64_t)v33, &qword_1ED1BC8B0);
  v24 = v34;
  if (v34)
  {
    v25 = v35;
    v26 = __swift_project_boxed_opaque_existential_1(v33, v34);
    *((_QWORD *)&v37 + 1) = v24;
    v38 = *(_QWORD *)(v25 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v36);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(boxed_opaque_existential_1, v26, v24);
    sub_1BCBDC2D4(a8, &qword_1ED1BC8B0);
    sub_1BCBDC2D4(v23, &qword_1ED1BC8A8);
    sub_1BCBDC2D4(v22, &qword_1ED1BC8B0);
    sub_1BCBDC2D4(v21, &qword_1ED1BC8B0);
    __swift_destroy_boxed_opaque_existential_1(v20);
    __swift_destroy_boxed_opaque_existential_1(v19);
    sub_1BCBDC2D4(v31, &qword_1ED1BC8B0);
    sub_1BCBDB110(a1);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  }
  else
  {
    sub_1BCBDC2D4(a8, &qword_1ED1BC8B0);
    sub_1BCBDC2D4(v23, &qword_1ED1BC8A8);
    sub_1BCBDC2D4(v22, &qword_1ED1BC8B0);
    sub_1BCBDC2D4(v21, &qword_1ED1BC8B0);
    __swift_destroy_boxed_opaque_existential_1(v20);
    __swift_destroy_boxed_opaque_existential_1(v19);
    sub_1BCBDC2D4(v31, &qword_1ED1BC8B0);
    sub_1BCBDB110(a1);
    sub_1BCBDC2D4((uint64_t)v33, &qword_1ED1BC8B0);
    v36 = 0u;
    v37 = 0u;
    v38 = 0;
  }
  sub_1BCBDB13C((uint64_t)&v36, a9 + 240);
  sub_1BCBDB13C(a10, a9 + 280);
  return sub_1BCBDB13C(a11, a9 + 320);
}

_QWORD *sub_1BCBD6700@<X0>(char *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, double a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v13;
  double v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  char *v27;
  id v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  void (*v33)(char *, _QWORD, uint64_t);
  char *v34;
  uint64_t v35;
  double v36;
  double v37;
  void (*v38)(char *, uint64_t);
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;
  char v54;
  double MaxX;
  CGFloat v56;
  CGFloat v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t *v66;
  ValueMetadata *v67;
  _QWORD *v68;
  unint64_t v69;
  _QWORD *v70;
  uint64_t *v71;
  ValueMetadata *v72;
  unint64_t v73;
  _QWORD *v74;
  uint64_t *v75;
  ValueMetadata *v76;
  unint64_t v77;
  _QWORD *v78;
  uint64_t *v79;
  _QWORD *result;
  uint64_t i;
  id v82;
  char v83;
  uint64_t v84;
  double MinX;
  double v89;
  id v90;
  char v91;
  CGFloat v92;
  CGFloat v93;
  double v94;
  CGFloat v95;
  double v96;
  CGFloat Width;
  double v98;
  double v99;
  CGFloat v100;
  double v101;
  double v102;
  CGFloat v103;
  CGFloat v104;
  CGFloat v105;
  id v106;
  double v107;
  double v108;
  double v109;
  double v110;
  id v111;
  CGFloat v112;
  CGFloat v113;
  CGFloat v114;
  CGFloat v115;
  double v116;
  double v117;
  double v118;
  void (*v119)(__int128 *, _QWORD);
  double *v120;
  double v121;
  double MaxY;
  double v123;
  double v124;
  double v125;
  double v126;
  CGFloat v127;
  _QWORD *v128;
  _QWORD *v129;
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
  char *v140;
  id v141;
  uint64_t v142;
  double v143;
  CGFloat v144;
  char *v145;
  CGFloat v146;
  CGFloat v147;
  _QWORD *v148;
  char *v149;
  _BYTE v150[40];
  _BYTE v151[40];
  _BYTE v152[40];
  _BYTE v153[40];
  _BYTE v154[40];
  _BYTE v155[40];
  _BYTE v156[40];
  _BYTE v157[40];
  __int128 v158;
  uint64_t v159;
  _QWORD v160[3];
  ValueMetadata *v161;
  unint64_t v162;
  _QWORD v163[45];
  uint64_t v164[90];
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;

  v7 = v6;
  v139 = a2;
  v13 = sub_1BCC00F54();
  v14 = *(double *)(v13 - 8);
  v142 = v13;
  v143 = v14;
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v127 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1BCC006B4();
  v137 = *(_QWORD *)(v17 - 8);
  v138 = v17;
  MEMORY[0x1E0C80A78](v17);
  v145 = (char *)&v127 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1BCC00C00();
  v140 = *(char **)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v149 = (char *)&v127 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)&v127 - v22;
  v24 = sub_1BCC00C24();
  v135 = *(_QWORD *)(v24 - 8);
  v136 = v24;
  *(_QWORD *)&v25 = MEMORY[0x1E0C80A78](v24).n128_u64[0];
  v27 = (char *)&v127 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = objc_msgSend(a1, sel_traitCollection, v25);
  v141 = objc_msgSend(v28, sel_horizontalSizeClass);

  sub_1BCBD56D8(a1, a5);
  v29 = sub_1BCBD5848(a1, a5);
  sub_1BCBDAE08(v7, (uint64_t)v160);
  sub_1BCBDAE7C(v7 + 752, (uint64_t)&v158, &qword_1ED1BC8B0);
  v128 = (_QWORD *)(v7 + 792);
  sub_1BCBDB05C(v7 + 792, (uint64_t)v157);
  v129 = (_QWORD *)(v7 + 832);
  sub_1BCBDB05C(v7 + 832, (uint64_t)v156);
  v130 = v7 + 872;
  sub_1BCBDAE7C(v7 + 872, (uint64_t)v155, &qword_1ED1BC8B0);
  v131 = v7 + 912;
  sub_1BCBDAE7C(v7 + 912, (uint64_t)v154, &qword_1ED1BC8B0);
  v133 = v7 + 992;
  sub_1BCBDAE7C(v7 + 992, (uint64_t)v153, &qword_1ED1BC8A8);
  v134 = v7 + 1032;
  sub_1BCBDAE7C(v7 + 1032, (uint64_t)v152, &qword_1ED1BC8B0);
  v132 = v7 + 1072;
  sub_1BCBDAE7C(v7 + 1072, (uint64_t)v151, &qword_1ED1BC8A8);
  sub_1BCBDAE7C(v7 + 1112, (uint64_t)v150, &qword_1ED1BC8A8);
  sub_1BCBD6450((uint64_t)v160, (uint64_t)&v158, (uint64_t)v157, (uint64_t)v156, (uint64_t)v155, (uint64_t)v154, (uint64_t)v153, (uint64_t)v152, (uint64_t)v163, (uint64_t)v151, (uint64_t)v150);
  sub_1BCBDB220(v164, a1, v29);
  if (v30 > *(double *)(v7 + 8))
    v31 = v30;
  else
    v31 = *(double *)(v7 + 8);
  v146 = a6;
  v147 = a3;
  v32 = a4;
  sub_1BCC00E94();
  v161 = &type metadata for AdLockupLayout.AdLockupInnerContentLayout;
  v162 = sub_1BCBDAEC0();
  v160[0] = swift_allocObject();
  sub_1BCBDB028((uint64_t)v163, v160[0] + 16);
  sub_1BCBDB05C(v7 + 712, (uint64_t)&v158);
  sub_1BCBDB05C(v7 + 16, (uint64_t)v157);
  v148 = (_QWORD *)(v7 + 952);
  sub_1BCBDB05C(v7 + 952, (uint64_t)v156);
  sub_1BCBDB05C(v7 + 472, (uint64_t)v155);
  v33 = (void (*)(char *, _QWORD, uint64_t))*((_QWORD *)v140 + 13);
  v33(v23, *MEMORY[0x1E0D42188], v19);
  v33(v149, *MEMORY[0x1E0D42198], v19);
  v34 = v145;
  sub_1BCC00C18();
  v140 = v27;
  sub_1BCC00C0C();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 + 632), *(_QWORD *)(v7 + 656));
  sub_1BCBE8C78();
  v149 = a1;
  v35 = v142;
  sub_1BCC007BC();
  v37 = v36;
  v38 = *(void (**)(char *, uint64_t))(*(_QWORD *)&v143 + 8);
  v38(v16, v35);
  v144 = a5;
  if (v141 == (id)1)
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 + 1152), *(_QWORD *)(v7 + 1176));
    sub_1BCC00714();
    v40 = v39;
    v42 = v41;
    sub_1BCC0069C();
    v44 = v43;
    sub_1BCC0069C();
    v46 = v45;
    sub_1BCC00678();
    v48 = v46 + v47;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 + 672), *(_QWORD *)(v7 + 696));
    sub_1BCBE8C78();
    sub_1BCC007BC();
    v50 = v49;
    v38(v16, v35);
    v51 = v48 + v50;
    v52 = v32;
  }
  else
  {
    v143 = v31;
    v53 = objc_msgSend(v149, sel_traitCollection);
    v54 = sub_1BCC00E64();

    MaxX = 0.0;
    v57 = v146;
    v56 = v147;
    if ((v54 & 1) != 0)
    {
      v165.origin.x = v147;
      v165.origin.y = a4;
      v165.size.width = a5;
      v165.size.height = v146;
      MaxX = CGRectGetMaxX(v165);
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D0E8);
    v58 = swift_allocObject();
    *(_OWORD *)(v58 + 16) = xmmword_1BCC091A0;
    v59 = *(_QWORD *)(v7 + 816);
    v60 = *(_QWORD *)(v7 + 824);
    v61 = __swift_project_boxed_opaque_existential_1(v128, v59);
    *(_QWORD *)(v58 + 56) = v59;
    *(_QWORD *)(v58 + 64) = *(_QWORD *)(v60 + 8);
    v142 = v58 + 32;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v58 + 32));
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v59 - 8) + 16))(boxed_opaque_existential_1, v61, v59);
    v63 = *(_QWORD *)(v7 + 856);
    v64 = *(_QWORD *)(v7 + 864);
    v65 = __swift_project_boxed_opaque_existential_1(v129, v63);
    *(_QWORD *)(v58 + 96) = v63;
    *(_QWORD *)(v58 + 104) = *(_QWORD *)(v64 + 8);
    v66 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v58 + 72));
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v63 - 8) + 16))(v66, v65, v63);
    sub_1BCBDAE7C(v130, (uint64_t)v160, &qword_1ED1BC8B0);
    v67 = v161;
    v68 = v148;
    if (v161)
    {
      v69 = v162;
      v70 = __swift_project_boxed_opaque_existential_1(v160, (uint64_t)v161);
      *(_QWORD *)(v58 + 136) = v67;
      *(_QWORD *)(v58 + 144) = *(_QWORD *)(v69 + 8);
      v71 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v58 + 112));
      (*((void (**)(uint64_t *, _QWORD *, ValueMetadata *))v67[-1].Description + 2))(v71, v70, v67);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v160);
    }
    else
    {
      sub_1BCBDC2D4((uint64_t)v160, &qword_1ED1BC8B0);
      *(_QWORD *)(v58 + 144) = 0;
      *(_OWORD *)(v58 + 112) = 0u;
      *(_OWORD *)(v58 + 128) = 0u;
    }
    sub_1BCBDAE7C(v131, (uint64_t)v160, &qword_1ED1BC8B0);
    v72 = v161;
    if (v161)
    {
      v73 = v162;
      v74 = __swift_project_boxed_opaque_existential_1(v160, (uint64_t)v161);
      *(_QWORD *)(v58 + 176) = v72;
      *(_QWORD *)(v58 + 184) = *(_QWORD *)(v73 + 8);
      v75 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v58 + 152));
      (*((void (**)(uint64_t *, _QWORD *, ValueMetadata *))v72[-1].Description + 2))(v75, v74, v72);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v160);
    }
    else
    {
      sub_1BCBDC2D4((uint64_t)v160, &qword_1ED1BC8B0);
      *(_QWORD *)(v58 + 184) = 0;
      *(_OWORD *)(v58 + 152) = 0u;
      *(_OWORD *)(v58 + 168) = 0u;
    }
    sub_1BCBDAE7C(v132, v58 + 192, &qword_1ED1BC8A8);
    sub_1BCBDAE7C(v133, v58 + 232, &qword_1ED1BC8A8);
    sub_1BCBDAE7C(v134, (uint64_t)v160, &qword_1ED1BC8B0);
    v76 = v161;
    if (v161)
    {
      v77 = v162;
      v78 = __swift_project_boxed_opaque_existential_1(v160, (uint64_t)v161);
      *(_QWORD *)(v58 + 296) = v76;
      *(_QWORD *)(v58 + 304) = *(_QWORD *)(v77 + 8);
      v79 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v58 + 272));
      (*((void (**)(uint64_t *, _QWORD *, ValueMetadata *))v76[-1].Description + 2))(v79, v78, v76);
      result = (_QWORD *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v160);
    }
    else
    {
      result = (_QWORD *)sub_1BCBDC2D4((uint64_t)v160, &qword_1ED1BC8B0);
      *(_QWORD *)(v58 + 304) = 0;
      *(_OWORD *)(v58 + 272) = 0u;
      *(_OWORD *)(v58 + 288) = 0u;
    }
    if (*(_QWORD *)(v58 + 16) < 7uLL)
    {
      __break(1u);
      return result;
    }
    for (i = 32; i != 312; i += 40)
    {
      sub_1BCBDAE7C(v58 + i, (uint64_t)&v158, &qword_1ED1BC8A8);
      if (v159)
      {
        sub_1BCBDB3C8(&v158, (uint64_t)v160);
        __swift_project_boxed_opaque_existential_1(v160, (uint64_t)v161);
        if ((sub_1BCC006C0() & 1) == 0
          || (__swift_project_boxed_opaque_existential_1(v160, (uint64_t)v161), (sub_1BCC006F0() & 1) != 0))
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v160);
        }
        else
        {
          v82 = objc_msgSend(v149, sel_traitCollection);
          v83 = sub_1BCC00E64();

          __swift_project_boxed_opaque_existential_1(v160, (uint64_t)v161);
          sub_1BCC006D8();
          if ((v83 & 1) != 0)
          {
            MinX = CGRectGetMinX(*(CGRect *)&v84);
            if (MinX < MaxX)
              MaxX = MinX;
          }
          else
          {
            v89 = CGRectGetMaxX(*(CGRect *)&v84);
            if (MaxX <= v89)
              MaxX = v89;
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v160);
          v68 = v148;
        }
      }
      else
      {
        sub_1BCBDC2D4((uint64_t)&v158, &qword_1ED1BC8A8);
      }
    }
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC8A8);
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v90 = objc_msgSend(v149, sel_traitCollection);
    v91 = sub_1BCC00E64();

    v127 = a4;
    v92 = v56;
    v93 = a4;
    v94 = a5;
    v95 = v57;
    if ((v91 & 1) != 0)
    {
      v96 = CGRectGetMinX(*(CGRect *)&v92);
      __swift_project_boxed_opaque_existential_1(v68, *(_QWORD *)(v7 + 976));
      sub_1BCC006D8();
      Width = CGRectGetWidth(v166);
      v98 = MaxX;
      MaxX = v96 + Width;
    }
    else
    {
      v99 = CGRectGetMaxX(*(CGRect *)&v92);
      __swift_project_boxed_opaque_existential_1(v68, *(_QWORD *)(v7 + 976));
      sub_1BCC006D8();
      v98 = v99 - CGRectGetWidth(v167);
    }
    v34 = v145;
    v100 = v37 + MaxX;
    v101 = v98 - v37;
    sub_1BCC0069C();
    v103 = v102;
    v104 = v101 - (v37 + MaxX);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 + 1152), *(_QWORD *)(v7 + 1176));
    v105 = v143;
    v106 = v149;
    sub_1BCC00714();
    v40 = v107;
    v42 = v108;
    v168.origin.x = v100;
    v168.origin.y = v103;
    v168.size.width = v101 - v100;
    v168.size.height = v105;
    v109 = CGRectGetMidX(v168) - v40 * 0.5;
    v169.origin.x = v100;
    v169.origin.y = v103;
    v169.size.width = v104;
    v169.size.height = v105;
    v110 = CGRectGetMidY(v169) - v42 * 0.5;
    sub_1BCBDB05C((uint64_t)v68, (uint64_t)v160);
    __swift_project_boxed_opaque_existential_1(v160, (uint64_t)v161);
    v111 = objc_msgSend(v106, sel_traitCollection);
    LOBYTE(v106) = sub_1BCC00E64();

    v113 = v146;
    v112 = v147;
    v114 = v127;
    v115 = v144;
    if ((v106 & 1) != 0)
    {
      v116 = CGRectGetMinX(*(CGRect *)&v112);
    }
    else
    {
      v117 = CGRectGetMaxX(*(CGRect *)&v112);
      __swift_project_boxed_opaque_existential_1(v68, *(_QWORD *)(v7 + 976));
      sub_1BCC006D8();
      v116 = v117 - v118;
    }
    v44 = floor(v109);
    v51 = floor(v110);
    v119 = (void (*)(__int128 *, _QWORD))sub_1BCC006CC();
    *v120 = v116;
    v119(&v158, 0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v160);
    v52 = v127;
  }
  v121 = v147;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 + 1152), *(_QWORD *)(v7 + 1176));
  sub_1BCC006E4();
  v170.origin.x = v44;
  v170.origin.y = v51;
  v170.size.width = v40;
  v170.size.height = v42;
  MaxY = CGRectGetMaxY(v170);
  sub_1BCC0069C();
  v124 = v123;
  sub_1BCC00678();
  if (MaxY <= v124 + v125)
    MaxY = v124 + v125;
  v171.origin.x = v121;
  v171.origin.y = v52;
  v171.size.width = v144;
  v171.size.height = v146;
  v126 = CGRectGetWidth(v171);
  MEMORY[0x1BCCFDA74](v121, v52, v126, MaxY, MaxY, 0.0);
  (*(void (**)(char *, uint64_t))(v137 + 8))(v34, v138);
  (*(void (**)(char *, uint64_t))(v135 + 8))(v140, v136);
  return sub_1BCBDB0A0(v163);
}

uint64_t sub_1BCBD737C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
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
  char *v16;
  char v17;
  int v18;
  char v19;
  int v20;
  uint64_t v21;
  char v22;
  char v23;
  char v24;
  char v25;
  id v26;
  id v27;
  id v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  unsigned int *v35;
  uint64_t *v36;
  unsigned int *v37;
  unsigned int *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t *boxed_opaque_existential_1;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t *v62;
  void (*v63)(char *, _QWORD, uint64_t);
  char *v64;
  unsigned int v65;
  uint64_t v66;
  void (*v67)(_QWORD);
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  void (*v81)(char *, uint64_t);
  size_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  void (*v87)(size_t, char *, uint64_t);
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t *v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  unint64_t v100;
  unint64_t v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  uint64_t *v106;
  uint64_t v107;
  void (*v108)(char *, uint64_t);
  char *v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t *v121;
  _QWORD v123[4];
  __int128 v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unsigned int v129;
  void (*v130)(char *, _QWORD, uint64_t);
  _QWORD *v131;
  uint64_t *v132;
  uint64_t v133;
  _QWORD *v134;
  char *v135;
  uint64_t v136;
  id v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  char *v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  void (*v147)(char *, uint64_t);
  void (*v148)(size_t, char *, uint64_t);
  int v149;
  _QWORD *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153[5];
  _QWORD v154[6];
  __int128 v155;
  __int128 v156;
  uint64_t v157;
  __int128 v158;
  uint64_t v159;
  uint64_t v160;
  _QWORD v161[3];
  uint64_t v162;
  uint64_t v163;
  _QWORD v164[3];
  uint64_t v165;
  uint64_t v166;
  _QWORD v167[3];
  uint64_t v168;
  uint64_t v169;
  _QWORD v170[3];
  uint64_t v171;
  _QWORD v172[124];
  _QWORD v173[3];
  uint64_t v174;
  uint64_t v175;
  _QWORD v176[3];
  uint64_t v177;

  v1 = (_QWORD *)v0;
  v137 = (id)((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v3 = v2;
  v146 = sub_1BCC00AB0();
  v140 = *(_QWORD *)(v146 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v144 = (char *)v123 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v143 = sub_1BCC00ABC();
  v139 = *(_QWORD *)(v143 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v142 = (char *)v123 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v151 = sub_1BCC00A68();
  v148 = *(void (**)(size_t, char *, uint64_t))(v151 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v141 = (char *)v123 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v145 = sub_1BCC00AE0();
  v7 = *(_QWORD *)(v145 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v10 = (char *)v123 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v8);
  v135 = (char *)v123 - v12;
  v13 = MEMORY[0x1E0C80A78](v11);
  v138 = (char *)v123 - v14;
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v123 - v15;
  sub_1BCBDAE7C(v0, (uint64_t)v176, &qword_1ED1BC8B0);
  if (!v177)
  {
    sub_1BCBDC2D4((uint64_t)v176, &qword_1ED1BC8B0);
    sub_1BCBDB028(v0, (uint64_t)v176);
    goto LABEL_6;
  }
  __swift_project_boxed_opaque_existential_1(v176, v177);
  v17 = sub_1BCC006F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v176);
  sub_1BCBDB028((uint64_t)v1, (uint64_t)v176);
  if ((v17 & 1) != 0)
  {
LABEL_6:
    sub_1BCBDB0A0(v176);
    goto LABEL_7;
  }
  sub_1BCBDAE7C((uint64_t)v176, (uint64_t)v173, &qword_1ED1BC8B0);
  if (v174)
  {
    __swift_project_boxed_opaque_existential_1(v173, v174);
    v18 = sub_1BCC006C0();
    sub_1BCBDB0A0(v176);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v173);
    goto LABEL_8;
  }
  sub_1BCBDB0A0(v176);
  sub_1BCBDC2D4((uint64_t)v173, &qword_1ED1BC8B0);
LABEL_7:
  v18 = 0;
LABEL_8:
  sub_1BCBDAE7C((uint64_t)(v1 + 20), (uint64_t)v173, &qword_1ED1BC8B0);
  if (v174)
  {
    __swift_project_boxed_opaque_existential_1(v173, v174);
    v19 = sub_1BCC006F0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v173);
    sub_1BCBDB028((uint64_t)v1, (uint64_t)v173);
    if ((v19 & 1) == 0)
    {
      sub_1BCBDAE7C((uint64_t)&v175, (uint64_t)v170, &qword_1ED1BC8B0);
      v20 = v171;
      if (v171)
      {
        __swift_project_boxed_opaque_existential_1(v170, v171);
        v20 = sub_1BCC006C0();
        sub_1BCBDB0A0(v173);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v170);
      }
      else
      {
        sub_1BCBDB0A0(v173);
        sub_1BCBDC2D4((uint64_t)v170, &qword_1ED1BC8B0);
      }
      goto LABEL_14;
    }
  }
  else
  {
    sub_1BCBDC2D4((uint64_t)v173, &qword_1ED1BC8B0);
    sub_1BCBDB028((uint64_t)v1, (uint64_t)v173);
  }
  sub_1BCBDB0A0(v173);
  v20 = 0;
LABEL_14:
  v21 = v1[13];
  v147 = (void (*)(char *, uint64_t))(v1 + 10);
  __swift_project_boxed_opaque_existential_1(v1 + 10, v21);
  v22 = sub_1BCC006F0();
  sub_1BCBDB028((uint64_t)v1, (uint64_t)v170);
  if ((v22 & 1) != 0)
  {
    LODWORD(v136) = 0;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v172, v172[3]);
    LODWORD(v136) = sub_1BCC006C0();
  }
  sub_1BCBDB0A0(v170);
  v150 = v1 + 15;
  sub_1BCBDAE7C((uint64_t)(v1 + 15), (uint64_t)v167, &qword_1ED1BC8B0);
  if (!v168)
  {
    sub_1BCBDC2D4((uint64_t)v167, &qword_1ED1BC8B0);
    sub_1BCBDB028((uint64_t)v1, (uint64_t)v167);
    goto LABEL_22;
  }
  __swift_project_boxed_opaque_existential_1(v167, v168);
  v23 = sub_1BCC006F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v167);
  sub_1BCBDB028((uint64_t)v1, (uint64_t)v167);
  if ((v23 & 1) != 0)
  {
LABEL_22:
    sub_1BCBDB0A0(v167);
    goto LABEL_23;
  }
  sub_1BCBDAE7C((uint64_t)&v169, (uint64_t)v164, &qword_1ED1BC8B0);
  if (v165)
  {
    __swift_project_boxed_opaque_existential_1(v164, v165);
    v149 = sub_1BCC006C0();
    sub_1BCBDB0A0(v167);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v164);
    goto LABEL_24;
  }
  sub_1BCBDB0A0(v167);
  sub_1BCBDC2D4((uint64_t)v164, &qword_1ED1BC8B0);
LABEL_23:
  v149 = 0;
LABEL_24:
  v134 = v16;
  sub_1BCBDAE7C((uint64_t)(v1 + 40), (uint64_t)v164, &qword_1ED1BC8A8);
  if (!v165)
  {
    sub_1BCBDC2D4((uint64_t)v164, &qword_1ED1BC8A8);
    sub_1BCBDB028((uint64_t)v1, (uint64_t)v164);
    goto LABEL_33;
  }
  __swift_project_boxed_opaque_existential_1(v164, v165);
  v24 = sub_1BCC006F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v164);
  sub_1BCBDB028((uint64_t)v1, (uint64_t)v164);
  if ((v24 & 1) != 0)
  {
LABEL_33:
    sub_1BCBDB0A0(v164);
    goto LABEL_34;
  }
  sub_1BCBDAE7C((uint64_t)&v166, (uint64_t)v161, &qword_1ED1BC8A8);
  if (v162)
  {
    __swift_project_boxed_opaque_existential_1(v161, v162);
    v25 = sub_1BCC006C0();
    sub_1BCBDB0A0(v164);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v161);
    if (((v18 | v20 | v149) & 1) == 0 && (v25 & 1) == 0)
      goto LABEL_29;
    goto LABEL_35;
  }
  sub_1BCBDB0A0(v164);
  sub_1BCBDC2D4((uint64_t)v161, &qword_1ED1BC8A8);
LABEL_34:
  if (((v18 | v20 | v149) & 1) == 0)
  {
LABEL_29:
    v26 = v137;
    v27 = objc_msgSend(v137, sel_traitCollection);
    sub_1BCC00E70();

    v28 = objc_msgSend(v26, sel_traitCollection);
    v29 = sub_1BCC00E70();

    v30 = 22;
    if ((v29 & 1) != 0)
      v30 = 12;
    sub_1BCBDB05C((uint64_t)&v1[v30 + 45], (uint64_t)v161);
    sub_1BCBDB05C((uint64_t)(v1 + 5), (uint64_t)&v158);
    sub_1BCBDB05C((uint64_t)v147, (uint64_t)&v155);
    sub_1BCBDB05C((uint64_t)v161, (uint64_t)v154);
    sub_1BCBDB05C((uint64_t)(v1 + 62), (uint64_t)v153);
    sub_1BCBDB05C((uint64_t)(v1 + 77), (uint64_t)&v152);
    v31 = sub_1BCC00D2C();
    v32 = MEMORY[0x1E0D42450];
    v3[3] = v31;
    v3[4] = v32;
    __swift_allocate_boxed_opaque_existential_1(v3);
    sub_1BCC00D20();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v161);
  }
LABEL_35:
  sub_1BCBDAE7C((uint64_t)v1, (uint64_t)v161, &qword_1ED1BC8B0);
  if (v162)
  {
    __swift_project_boxed_opaque_existential_1(v161, v162);
    sub_1BCC008DC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v161);
  }
  else
  {
    sub_1BCBDC2D4((uint64_t)v161, &qword_1ED1BC8B0);
  }
  sub_1BCBDAE7C((uint64_t)v1, (uint64_t)v161, &qword_1ED1BC8B0);
  if (v162)
  {
    __swift_project_boxed_opaque_existential_1(v161, v162);
    sub_1BCC008C4();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v161);
  }
  else
  {
    sub_1BCBDC2D4((uint64_t)v161, &qword_1ED1BC8B0);
  }
  __swift_project_boxed_opaque_existential_1(v1 + 5, v1[8]);
  sub_1BCC008DC();
  v33 = v1[8];
  v137 = v1 + 5;
  __swift_project_boxed_opaque_existential_1(v1 + 5, v33);
  sub_1BCC008C4();
  v34 = v147;
  __swift_project_boxed_opaque_existential_1(v147, v1[13]);
  sub_1BCC008DC();
  __swift_project_boxed_opaque_existential_1(v34, v1[13]);
  sub_1BCC008C4();
  sub_1BCBDAE7C((uint64_t)v150, (uint64_t)v161, &qword_1ED1BC8B0);
  if (v162)
  {
    __swift_project_boxed_opaque_existential_1(v161, v162);
    sub_1BCC008DC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v161);
  }
  else
  {
    sub_1BCBDC2D4((uint64_t)v161, &qword_1ED1BC8B0);
  }
  sub_1BCBDAE7C((uint64_t)v150, (uint64_t)v161, &qword_1ED1BC8B0);
  v132 = v3;
  v123[0] = v10;
  if (v162)
  {
    __swift_project_boxed_opaque_existential_1(v161, v162);
    sub_1BCC008C4();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v161);
  }
  else
  {
    sub_1BCBDC2D4((uint64_t)v161, &qword_1ED1BC8B0);
  }
  sub_1BCBDAE7C((uint64_t)v1, (uint64_t)&v158, &qword_1ED1BC8B0);
  v35 = (unsigned int *)MEMORY[0x1E0D41EC8];
  v36 = &qword_1BCC09000;
  v37 = (unsigned int *)MEMORY[0x1E0D41F28];
  v133 = v7;
  if (v159)
  {
    sub_1BCBDB3C8(&v158, (uint64_t)v161);
    if ((v18 & 1) != 0)
    {
      v38 = v35;
      v39 = v162;
      v40 = v163;
      v41 = __swift_project_boxed_opaque_existential_1(v161, v162);
      v159 = v39;
      v160 = *(_QWORD *)(v40 + 8);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v158);
      (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v39 - 8) + 16))(boxed_opaque_existential_1, v41, v39);
      v131 = v1 + 52;
      v157 = 0;
      v155 = 0u;
      v156 = 0u;
      v43 = v141;
      (*((void (**)(char *, _QWORD, uint64_t))v148 + 13))(v141, *v38, v151);
      v44 = *v37;
      v45 = v139;
      v46 = v142;
      v47 = v143;
      (*(void (**)(char *, uint64_t, uint64_t))(v139 + 104))(v142, v44, v143);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC218);
      v48 = v140;
      v49 = swift_allocObject();
      *(_OWORD *)(v49 + 16) = xmmword_1BCC091B0;
      sub_1BCC00A8C();
      v154[0] = v49;
      sub_1BCBDAC80((unint64_t *)&qword_1ED1BC200, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41F08], MEMORY[0x1E0D41F18]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC208);
      sub_1BCBDC244();
      v50 = v144;
      v51 = v146;
      sub_1BCC00EDC();
      v52 = v134;
      sub_1BCC00AD4();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v51);
      (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v47);
      (*((void (**)(char *, uint64_t))v148 + 1))(v43, v151);
      sub_1BCBDC2D4((uint64_t)&v155, &qword_1ED1BC1F8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v158);
      v53 = (_QWORD *)sub_1BCBDE21C(0, 1, 1, MEMORY[0x1E0DEE9D8]);
      v55 = v53[2];
      v54 = v53[3];
      if (v55 >= v54 >> 1)
        v53 = (_QWORD *)sub_1BCBDE21C(v54 > 1, v55 + 1, 1, v53);
      v56 = v133;
      v57 = v137;
      v53[2] = v55 + 1;
      (*(void (**)(unint64_t, _QWORD *, uint64_t))(v56 + 32))((unint64_t)v53+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(_QWORD *)(v56 + 72) * v55, v52, v145);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v161);
      v36 = &qword_1BCC09000;
      v37 = (unsigned int *)MEMORY[0x1E0D41F28];
      v35 = (unsigned int *)MEMORY[0x1E0D41EC8];
      goto LABEL_54;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v161);
LABEL_56:
    v58 = (uint64_t)(v1 + 67);
    v134 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v57 = v137;
    goto LABEL_57;
  }
  sub_1BCBDC2D4((uint64_t)&v158, &qword_1ED1BC8B0);
  if ((v18 & 1) == 0)
    goto LABEL_56;
  v53 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v57 = v137;
LABEL_54:
  v134 = v53;
  v58 = (uint64_t)(v1 + 72);
LABEL_57:
  sub_1BCBDB05C(v58, (uint64_t)v161);
  v59 = v1[8];
  v60 = v1[9];
  v61 = __swift_project_boxed_opaque_existential_1(v57, v59);
  v159 = v59;
  v160 = *(_QWORD *)(v60 + 8);
  v62 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v158);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v59 - 8) + 16))(v62, v61, v59);
  v157 = 0;
  v155 = 0u;
  v156 = 0u;
  v63 = (void (*)(char *, _QWORD, uint64_t))*((_QWORD *)v148 + 13);
  v64 = v141;
  LODWORD(v131) = *v35;
  v137 = v63;
  ((void (*)(char *))v63)(v141);
  v65 = *v37;
  v66 = v139;
  v67 = *(void (**)(_QWORD))(v139 + 104);
  v69 = v142;
  v68 = v143;
  v129 = v65;
  v130 = (void (*)(char *, _QWORD, uint64_t))v67;
  v67(v142);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC218);
  v71 = v140;
  v72 = *(unsigned __int8 *)(v140 + 80);
  v73 = (v72 + 32) & ~v72;
  v126 = v73 + *(_QWORD *)(v140 + 72);
  v127 = v70;
  v125 = v72 | 7;
  v74 = swift_allocObject();
  v124 = *((_OWORD *)v36 + 27);
  *(_OWORD *)(v74 + 16) = v124;
  v128 = v73;
  sub_1BCC00A8C();
  v154[0] = v74;
  v75 = sub_1BCBDAC80((unint64_t *)&qword_1ED1BC200, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41F08], MEMORY[0x1E0D41F18]);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC208);
  v77 = sub_1BCBDC244();
  v78 = v144;
  v123[1] = v77;
  v123[2] = v76;
  v79 = v146;
  v123[3] = v75;
  sub_1BCC00EDC();
  v80 = v138;
  sub_1BCC00AD4();
  v140 = *(_QWORD *)(v71 + 8);
  ((void (*)(char *, uint64_t))v140)(v78, v79);
  v139 = *(_QWORD *)(v66 + 8);
  ((void (*)(char *, uint64_t))v139)(v69, v68);
  v81 = (void (*)(char *, uint64_t))*((_QWORD *)v148 + 1);
  v81(v64, v151);
  sub_1BCBDC2D4((uint64_t)&v155, &qword_1ED1BC1F8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v158);
  v82 = (size_t)v134;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v82 = sub_1BCBDE21C(0, *(_QWORD *)(v82 + 16) + 1, 1, (_QWORD *)v82);
  v84 = *(_QWORD *)(v82 + 16);
  v83 = *(_QWORD *)(v82 + 24);
  if (v84 >= v83 >> 1)
    v82 = sub_1BCBDE21C(v83 > 1, v84 + 1, 1, (_QWORD *)v82);
  *(_QWORD *)(v82 + 16) = v84 + 1;
  v85 = (*(unsigned __int8 *)(v133 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v133 + 80);
  v86 = *(_QWORD *)(v133 + 72);
  v87 = *(void (**)(size_t, char *, uint64_t))(v133 + 32);
  v87(v82 + v85 + v86 * v84, v80, v145);
  if ((v136 & 1) != 0)
  {
    v136 = v86;
    v138 = (char *)v85;
    v148 = v87;
    v88 = v1[13];
    v89 = v1[14];
    v90 = __swift_project_boxed_opaque_existential_1(v147, v88);
    v159 = v88;
    v160 = *(_QWORD *)(v89 + 8);
    v91 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v158);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v88 - 8) + 16))(v91, v90, v88);
    v157 = 0;
    v155 = 0u;
    v156 = 0u;
    v92 = swift_allocObject();
    *(_OWORD *)(v92 + 16) = v124;
    sub_1BCC00AA4();
    v154[0] = v92;
    v93 = v144;
    v94 = v146;
    sub_1BCC00EDC();
    v147 = v81;
    v95 = v141;
    v96 = v151;
    ((void (*)(char *, _QWORD, uint64_t))v137)(v141, v131, v151);
    v97 = v142;
    v98 = v143;
    v130(v142, v129, v143);
    sub_1BCC00AD4();
    ((void (*)(char *, uint64_t))v139)(v97, v98);
    v99 = v95;
    v81 = v147;
    v147(v99, v96);
    ((void (*)(char *, uint64_t))v140)(v93, v94);
    sub_1BCBDC2D4((uint64_t)&v155, &qword_1ED1BC1F8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v158);
    v101 = *(_QWORD *)(v82 + 16);
    v100 = *(_QWORD *)(v82 + 24);
    if (v101 >= v100 >> 1)
      v82 = sub_1BCBDE21C(v100 > 1, v101 + 1, 1, (_QWORD *)v82);
    v85 = (unint64_t)v138;
    v102 = v135;
    v86 = v136;
    *(_QWORD *)(v82 + 16) = v101 + 1;
    v87 = v148;
    v148(v82 + v85 + v101 * v86, v102, v145);
  }
  sub_1BCBDAE7C((uint64_t)v150, (uint64_t)&v155, &qword_1ED1BC8B0);
  if (*((_QWORD *)&v156 + 1))
  {
    sub_1BCBDB3C8(&v155, (uint64_t)&v158);
    if ((v149 & 1) != 0)
    {
      v136 = v86;
      v138 = (char *)v85;
      v148 = v87;
      v103 = v159;
      v104 = v160;
      v105 = __swift_project_boxed_opaque_existential_1(&v158, v159);
      *((_QWORD *)&v156 + 1) = v103;
      v157 = *(_QWORD *)(v104 + 8);
      v106 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v155);
      (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v103 - 8) + 16))(v106, v105, v103);
      memset(v154, 0, 40);
      v107 = swift_allocObject();
      *(_OWORD *)(v107 + 16) = v124;
      sub_1BCC00AA4();
      v153[0] = v107;
      v108 = v81;
      v109 = v144;
      v110 = v146;
      sub_1BCC00EDC();
      v111 = v141;
      v112 = v151;
      ((void (*)(char *, _QWORD, uint64_t))v137)(v141, v131, v151);
      v113 = v142;
      v114 = v143;
      v130(v142, v129, v143);
      sub_1BCC00AD4();
      ((void (*)(char *, uint64_t))v139)(v113, v114);
      v108(v111, v112);
      ((void (*)(char *, uint64_t))v140)(v109, v110);
      sub_1BCBDC2D4((uint64_t)v154, &qword_1ED1BC1F8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v155);
      v116 = *(_QWORD *)(v82 + 16);
      v115 = *(_QWORD *)(v82 + 24);
      if (v116 >= v115 >> 1)
        v82 = sub_1BCBDE21C(v115 > 1, v116 + 1, 1, (_QWORD *)v82);
      v117 = v138;
      v118 = v136;
      *(_QWORD *)(v82 + 16) = v116 + 1;
      v148((size_t)&v117[v82 + v116 * v118], (char *)v123[0], v145);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v158);
  }
  else
  {
    sub_1BCBDC2D4((uint64_t)&v155, &qword_1ED1BC8B0);
  }
  v119 = sub_1BCC00AF8();
  v120 = MEMORY[0x1E0D41F70];
  v121 = v132;
  v132[3] = v119;
  v121[4] = v120;
  __swift_allocate_boxed_opaque_existential_1(v121);
  sub_1BCC00AC8();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v161);
}

uint64_t sub_1BCBD8598@<X0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  _QWORD *v5;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void (*v27)(char *, uint64_t);
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double Width;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CGFloat v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  _QWORD v57[3];
  uint64_t v58;
  _QWORD v59[4];
  CGRect v60;
  CGRect v61;

  v50 = a1;
  v52 = sub_1BCC00F54();
  v51 = *(double *)(v52 - 8);
  MEMORY[0x1E0C80A78](v52);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BCC00D5C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = sub_1BCC006B4();
  v48 = *(_QWORD *)(v49 - 8);
  MEMORY[0x1E0C80A78](v49);
  v17 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCBD737C();
  __swift_project_boxed_opaque_existential_1(v59, v59[3]);
  sub_1BCC00CC0();
  sub_1BCC0069C();
  v19 = v18;
  sub_1BCC00678();
  v21 = v19 + v20;
  sub_1BCC006A8();
  sub_1BCC00D50();
  v23 = v22;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v24 = v21 - v23;
  __swift_project_boxed_opaque_existential_1(v5 + 92, v5[95]);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  v26 = v25;
  v27 = *(void (**)(char *, uint64_t))(*(_QWORD *)&v51 + 8);
  v27(v11, v52);
  v28 = v24 + v26;
  sub_1BCC0069C();
  v30 = v29;
  sub_1BCBDAE7C((uint64_t)(v5 + 40), (uint64_t)&v55, &qword_1ED1BC8A8);
  if (v56)
  {
    sub_1BCBDB3C8(&v55, (uint64_t)v57);
    __swift_project_boxed_opaque_existential_1(v57, v58);
    if ((sub_1BCC006C0() & 1) != 0)
    {
      __swift_project_boxed_opaque_existential_1(v57, v58);
      if ((sub_1BCC006F0() & 1) == 0)
      {
        __swift_project_boxed_opaque_existential_1(v57, v58);
        sub_1BCC00708();
        v32 = v31;
        v51 = v30;
        __swift_project_boxed_opaque_existential_1(v57, v58);
        sub_1BCC0069C();
        sub_1BCC00E94();
        sub_1BCC006E4();
        __swift_project_boxed_opaque_existential_1(v5 + 114, v5[117]);
        sub_1BCBE8C78();
        sub_1BCC007BC();
        v34 = v33;
        v27(v11, v52);
        v30 = v51 + v32 + v34;
      }
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
  }
  else
  {
    sub_1BCBDC2D4((uint64_t)&v55, &qword_1ED1BC8A8);
  }
  v35 = v49;
  sub_1BCBDAE7C((uint64_t)(v5 + 20), (uint64_t)&v55, &qword_1ED1BC8B0);
  if (v56)
  {
    sub_1BCBDB3C8(&v55, (uint64_t)v57);
    __swift_project_boxed_opaque_existential_1(v57, v58);
    if ((sub_1BCC006C0() & 1) != 0)
    {
      __swift_project_boxed_opaque_existential_1(v57, v58);
      if ((sub_1BCC006F0() & 1) == 0)
        goto LABEL_24;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
  }
  else
  {
    sub_1BCBDC2D4((uint64_t)&v55, &qword_1ED1BC8B0);
  }
  sub_1BCBDAE7C((uint64_t)(v5 + 35), (uint64_t)&v55, &qword_1ED1BC8A8);
  if (v56)
  {
    sub_1BCBDB3C8(&v55, (uint64_t)v57);
    __swift_project_boxed_opaque_existential_1(v57, v58);
    if ((sub_1BCC006C0() & 1) == 0
      || (__swift_project_boxed_opaque_existential_1(v57, v58), (sub_1BCC006F0() & 1) != 0))
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
      goto LABEL_17;
    }
LABEL_24:
    __swift_project_boxed_opaque_existential_1(v57, v58);
    sub_1BCC00708();
    v52 = v44;
    __swift_project_boxed_opaque_existential_1(v57, v58);
    sub_1BCC00E94();
    sub_1BCC006E4();
LABEL_27:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
    goto LABEL_28;
  }
  sub_1BCBDC2D4((uint64_t)&v55, &qword_1ED1BC8A8);
LABEL_17:
  sub_1BCBDAE7C((uint64_t)(v5 + 25), (uint64_t)&v55, &qword_1ED1BC8A8);
  if (v56)
  {
    sub_1BCBDB3C8(&v55, (uint64_t)v57);
    __swift_project_boxed_opaque_existential_1(v57, v58);
    if ((sub_1BCC006F0() & 1) == 0)
    {
      sub_1BCBDAE7C((uint64_t)(v5 + 30), (uint64_t)&v53, &qword_1ED1BC8A8);
      if (v54)
      {
        sub_1BCBDB3C8(&v53, (uint64_t)&v55);
        __swift_project_boxed_opaque_existential_1(&v55, v56);
        if ((sub_1BCC006F0() & 1) == 0)
        {
          __swift_project_boxed_opaque_existential_1(v57, v58);
          sub_1BCC00708();
          v37 = v36;
          v39 = v38;
          v51 = a5;
          v41 = v28 - (v38 - v40);
          __swift_project_boxed_opaque_existential_1(v57, v58);
          sub_1BCC00E94();
          sub_1BCC006E4();
          __swift_project_boxed_opaque_existential_1(&v55, v56);
          sub_1BCC00708();
          v50 = v42;
          v60.origin.x = v30;
          v49 = v43;
          v60.origin.y = v41;
          v60.size.width = v37;
          v60.size.height = v39;
          CGRectGetMaxX(v60);
          __swift_project_boxed_opaque_existential_1(v5 + 109, v5[112]);
          sub_1BCBE8C78();
          sub_1BCC007BC();
          v27(v11, v52);
          __swift_project_boxed_opaque_existential_1(&v55, v56);
          a5 = v51;
          sub_1BCC00E94();
          sub_1BCC006E4();
        }
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v55);
      }
      else
      {
        sub_1BCBDC2D4((uint64_t)&v53, &qword_1ED1BC8A8);
      }
    }
    goto LABEL_27;
  }
  sub_1BCBDC2D4((uint64_t)&v55, &qword_1ED1BC8A8);
LABEL_28:
  v45 = v48;
  v61.origin.x = a2;
  v61.origin.y = a3;
  v61.size.width = a4;
  v61.size.height = a5;
  Width = CGRectGetWidth(v61);
  MEMORY[0x1BCCFDA74](a2, a3, Width, v28, v28, 0.0);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v17, v35);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
}

double sub_1BCBD8ED8(void *a1, double a2)
{
  uint64_t v2;

  return sub_1BCBDB220((_QWORD *)(v2 + 360), a1, a2);
}

_QWORD *sub_1BCBD8EE4@<X0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, double a5@<D2>, CGFloat a6@<D3>)
{
  id v12;
  char v13;

  v12 = objc_msgSend(a1, sel_traitCollection);
  v13 = sub_1BCC00E70();

  if ((v13 & 1) != 0)
    return sub_1BCBD5D48(a1, a2, a3, a4, a5, a6);
  else
    return sub_1BCBD6700((char *)a1, a2, a3, a4, a5, a6);
}

double sub_1BCBD8F98(void *a1, double a2)
{
  return sub_1BCBD5A24(a1, a2);
}

uint64_t sub_1BCBD8FB0(uint64_t a1, uint64_t a2)
{
  return sub_1BCBDACF8(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1BCBD8FBC(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1BCC00DC8();
  *a2 = 0;
  return result;
}

uint64_t sub_1BCBD9030(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1BCC00DD4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1BCBD90AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1BCC00DE0();
  v2 = sub_1BCC00DBC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1BCBD90F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1BCC00DE0();
  v2 = v1;
  if (v0 == sub_1BCC00DE0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1BCC00F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1BCBD9178@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1BCC00DE0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1BCBD91A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1BCC00DBC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t destroy for AdLockupLayout(_QWORD *a1)
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 2));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 12));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 17));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 22));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 27));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 32));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 37));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 42));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 47));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 52));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 59));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 64));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 69));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 74));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 79));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 84));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 89));
  if (a1[97])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 94));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 99));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 104));
  if (a1[112])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 109));
  if (a1[117])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 114));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 119));
  if (a1[127])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 124));
  if (a1[132])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 129));
  if (a1[137])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 134));
  if (a1[142])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 139));
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 144));
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

uint64_t initializeWithCopy for AdLockupLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
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
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  _OWORD *v25;
  _OWORD *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _OWORD *v31;
  _OWORD *v32;
  uint64_t v33;
  __int128 v34;
  _OWORD *v35;
  _OWORD *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  _OWORD *v40;
  _OWORD *v41;
  uint64_t v42;
  __int128 v43;
  _OWORD *v44;
  _OWORD *v45;
  uint64_t v46;
  __int128 v47;
  _OWORD *v48;
  _OWORD *v49;
  uint64_t v50;
  __int128 v51;
  _OWORD *v52;
  _OWORD *v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 56, a2 + 56);
  v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 96, a2 + 96);
  v7 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 136, a2 + 136);
  v8 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 200) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 176, a2 + 176);
  v9 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 240) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 216, a2 + 216);
  v10 = *(_QWORD *)(a2 + 280);
  v11 = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 280) = v10;
  *(_QWORD *)(a1 + 288) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 256, a2 + 256);
  v12 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 320) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 296, a2 + 296);
  v13 = *(_QWORD *)(a2 + 360);
  v14 = *(_QWORD *)(a2 + 368);
  *(_QWORD *)(a1 + 360) = v13;
  *(_QWORD *)(a1 + 368) = v14;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 336, a2 + 336);
  v15 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 400) = v15;
  (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 376, a2 + 376);
  v16 = *(_QWORD *)(a2 + 440);
  v17 = *(_QWORD *)(a2 + 448);
  *(_QWORD *)(a1 + 440) = v16;
  *(_QWORD *)(a1 + 448) = v17;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 416, a2 + 416);
  *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
  v18 = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 496) = v18;
  (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 472, a2 + 472);
  v19 = *(_QWORD *)(a2 + 536);
  *(_QWORD *)(a1 + 536) = v19;
  *(_QWORD *)(a1 + 544) = *(_QWORD *)(a2 + 544);
  (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 512, a2 + 512);
  v20 = *(_OWORD *)(a2 + 576);
  *(_OWORD *)(a1 + 576) = v20;
  (**(void (***)(uint64_t, uint64_t))(v20 - 8))(a1 + 552, a2 + 552);
  v21 = *(_QWORD *)(a2 + 616);
  *(_QWORD *)(a1 + 616) = v21;
  *(_QWORD *)(a1 + 624) = *(_QWORD *)(a2 + 624);
  (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 592, a2 + 592);
  v22 = *(_OWORD *)(a2 + 656);
  *(_OWORD *)(a1 + 656) = v22;
  (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 632, a2 + 632);
  v23 = *(_QWORD *)(a2 + 696);
  *(_QWORD *)(a1 + 696) = v23;
  *(_QWORD *)(a1 + 704) = *(_QWORD *)(a2 + 704);
  (**(void (***)(uint64_t, uint64_t))(v23 - 8))(a1 + 672, a2 + 672);
  v24 = *(_OWORD *)(a2 + 736);
  *(_OWORD *)(a1 + 736) = v24;
  (**(void (***)(uint64_t, uint64_t))(v24 - 8))(a1 + 712, a2 + 712);
  v25 = (_OWORD *)(a1 + 752);
  v26 = (_OWORD *)(a2 + 752);
  v27 = *(_QWORD *)(a2 + 776);
  if (v27)
  {
    *(_QWORD *)(a1 + 776) = v27;
    *(_QWORD *)(a1 + 784) = *(_QWORD *)(a2 + 784);
    (**(void (***)(_OWORD *, _OWORD *))(v27 - 8))(v25, v26);
  }
  else
  {
    v28 = *(_OWORD *)(a2 + 768);
    *v25 = *v26;
    *(_OWORD *)(a1 + 768) = v28;
    *(_QWORD *)(a1 + 784) = *(_QWORD *)(a2 + 784);
  }
  v29 = *(_OWORD *)(a2 + 816);
  *(_OWORD *)(a1 + 816) = v29;
  (**(void (***)(uint64_t, uint64_t))(v29 - 8))(a1 + 792, a2 + 792);
  v30 = *(_QWORD *)(a2 + 856);
  *(_QWORD *)(a1 + 856) = v30;
  *(_QWORD *)(a1 + 864) = *(_QWORD *)(a2 + 864);
  (**(void (***)(uint64_t, uint64_t))(v30 - 8))(a1 + 832, a2 + 832);
  v31 = (_OWORD *)(a1 + 872);
  v32 = (_OWORD *)(a2 + 872);
  v33 = *(_QWORD *)(a2 + 896);
  if (v33)
  {
    *(_QWORD *)(a1 + 896) = v33;
    *(_QWORD *)(a1 + 904) = *(_QWORD *)(a2 + 904);
    (**(void (***)(_OWORD *, _OWORD *))(v33 - 8))(v31, v32);
  }
  else
  {
    v34 = *(_OWORD *)(a2 + 888);
    *v31 = *v32;
    *(_OWORD *)(a1 + 888) = v34;
    *(_QWORD *)(a1 + 904) = *(_QWORD *)(a2 + 904);
  }
  v35 = (_OWORD *)(a1 + 912);
  v36 = (_OWORD *)(a2 + 912);
  v37 = *(_QWORD *)(a2 + 936);
  if (v37)
  {
    *(_QWORD *)(a1 + 936) = v37;
    *(_QWORD *)(a1 + 944) = *(_QWORD *)(a2 + 944);
    (**(void (***)(_OWORD *, _OWORD *))(v37 - 8))(v35, v36);
  }
  else
  {
    v38 = *(_OWORD *)(a2 + 928);
    *v35 = *v36;
    *(_OWORD *)(a1 + 928) = v38;
    *(_QWORD *)(a1 + 944) = *(_QWORD *)(a2 + 944);
  }
  v39 = *(_OWORD *)(a2 + 976);
  *(_OWORD *)(a1 + 976) = v39;
  (**(void (***)(uint64_t, uint64_t))(v39 - 8))(a1 + 952, a2 + 952);
  v40 = (_OWORD *)(a1 + 992);
  v41 = (_OWORD *)(a2 + 992);
  v42 = *(_QWORD *)(a2 + 1016);
  if (v42)
  {
    *(_QWORD *)(a1 + 1016) = v42;
    *(_QWORD *)(a1 + 1024) = *(_QWORD *)(a2 + 1024);
    (**(void (***)(_OWORD *, _OWORD *))(v42 - 8))(v40, v41);
  }
  else
  {
    v43 = *(_OWORD *)(a2 + 1008);
    *v40 = *v41;
    *(_OWORD *)(a1 + 1008) = v43;
    *(_QWORD *)(a1 + 1024) = *(_QWORD *)(a2 + 1024);
  }
  v44 = (_OWORD *)(a1 + 1032);
  v45 = (_OWORD *)(a2 + 1032);
  v46 = *(_QWORD *)(a2 + 1056);
  if (v46)
  {
    *(_QWORD *)(a1 + 1056) = v46;
    *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a2 + 1064);
    (**(void (***)(_OWORD *, _OWORD *))(v46 - 8))(v44, v45);
  }
  else
  {
    v47 = *(_OWORD *)(a2 + 1048);
    *v44 = *v45;
    *(_OWORD *)(a1 + 1048) = v47;
    *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a2 + 1064);
  }
  v48 = (_OWORD *)(a1 + 1072);
  v49 = (_OWORD *)(a2 + 1072);
  v50 = *(_QWORD *)(a2 + 1096);
  if (v50)
  {
    *(_QWORD *)(a1 + 1096) = v50;
    *(_QWORD *)(a1 + 1104) = *(_QWORD *)(a2 + 1104);
    (**(void (***)(_OWORD *, _OWORD *))(v50 - 8))(v48, v49);
  }
  else
  {
    v51 = *(_OWORD *)(a2 + 1088);
    *v48 = *v49;
    *(_OWORD *)(a1 + 1088) = v51;
    *(_QWORD *)(a1 + 1104) = *(_QWORD *)(a2 + 1104);
  }
  v52 = (_OWORD *)(a1 + 1112);
  v53 = (_OWORD *)(a2 + 1112);
  v54 = *(_QWORD *)(a2 + 1136);
  if (v54)
  {
    *(_QWORD *)(a1 + 1136) = v54;
    *(_QWORD *)(a1 + 1144) = *(_QWORD *)(a2 + 1144);
    (**(void (***)(_OWORD *, _OWORD *))(v54 - 8))(v52, v53);
  }
  else
  {
    v55 = *(_OWORD *)(a2 + 1128);
    *v52 = *v53;
    *(_OWORD *)(a1 + 1128) = v55;
    *(_QWORD *)(a1 + 1144) = *(_QWORD *)(a2 + 1144);
  }
  v56 = *(_QWORD *)(a2 + 1176);
  *(_QWORD *)(a1 + 1176) = v56;
  *(_QWORD *)(a1 + 1184) = *(_QWORD *)(a2 + 1184);
  (**(void (***)(uint64_t, uint64_t))(v56 - 8))(a1 + 1152, a2 + 1152);
  return a1;
}

uint64_t assignWithCopy for AdLockupLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 96), (uint64_t *)(a2 + 96));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 136), (uint64_t *)(a2 + 136));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 176), (uint64_t *)(a2 + 176));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 216), (uint64_t *)(a2 + 216));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 256), (uint64_t *)(a2 + 256));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 296), (uint64_t *)(a2 + 296));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 336), (uint64_t *)(a2 + 336));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 376), (uint64_t *)(a2 + 376));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 416), (uint64_t *)(a2 + 416));
  *(_QWORD *)(a1 + 456) = *(_QWORD *)(a2 + 456);
  *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 472), (uint64_t *)(a2 + 472));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 512), (uint64_t *)(a2 + 512));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 552), (uint64_t *)(a2 + 552));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 592), (uint64_t *)(a2 + 592));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 632), (uint64_t *)(a2 + 632));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 672), (uint64_t *)(a2 + 672));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 712), (uint64_t *)(a2 + 712));
  v4 = *(_QWORD *)(a2 + 776);
  if (*(_QWORD *)(a1 + 776))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 752), (uint64_t *)(a2 + 752));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 752);
  }
  else if (v4)
  {
    *(_QWORD *)(a1 + 776) = v4;
    *(_QWORD *)(a1 + 784) = *(_QWORD *)(a2 + 784);
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 752, a2 + 752);
    goto LABEL_8;
  }
  v5 = *(_OWORD *)(a2 + 752);
  v6 = *(_OWORD *)(a2 + 768);
  *(_QWORD *)(a1 + 784) = *(_QWORD *)(a2 + 784);
  *(_OWORD *)(a1 + 752) = v5;
  *(_OWORD *)(a1 + 768) = v6;
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 792), (uint64_t *)(a2 + 792));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 832), (uint64_t *)(a2 + 832));
  v7 = *(_QWORD *)(a2 + 896);
  if (*(_QWORD *)(a1 + 896))
  {
    if (v7)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 872), (uint64_t *)(a2 + 872));
      goto LABEL_15;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 872);
  }
  else if (v7)
  {
    *(_QWORD *)(a1 + 896) = v7;
    *(_QWORD *)(a1 + 904) = *(_QWORD *)(a2 + 904);
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 872, a2 + 872);
    goto LABEL_15;
  }
  v8 = *(_OWORD *)(a2 + 872);
  v9 = *(_OWORD *)(a2 + 888);
  *(_QWORD *)(a1 + 904) = *(_QWORD *)(a2 + 904);
  *(_OWORD *)(a1 + 872) = v8;
  *(_OWORD *)(a1 + 888) = v9;
LABEL_15:
  v10 = *(_QWORD *)(a2 + 936);
  if (*(_QWORD *)(a1 + 936))
  {
    if (v10)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 912), (uint64_t *)(a2 + 912));
      goto LABEL_22;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 912);
  }
  else if (v10)
  {
    *(_QWORD *)(a1 + 936) = v10;
    *(_QWORD *)(a1 + 944) = *(_QWORD *)(a2 + 944);
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 912, a2 + 912);
    goto LABEL_22;
  }
  v11 = *(_OWORD *)(a2 + 912);
  v12 = *(_OWORD *)(a2 + 928);
  *(_QWORD *)(a1 + 944) = *(_QWORD *)(a2 + 944);
  *(_OWORD *)(a1 + 912) = v11;
  *(_OWORD *)(a1 + 928) = v12;
LABEL_22:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 952), (uint64_t *)(a2 + 952));
  v13 = *(_QWORD *)(a2 + 1016);
  if (*(_QWORD *)(a1 + 1016))
  {
    if (v13)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 992), (uint64_t *)(a2 + 992));
      goto LABEL_29;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 992);
  }
  else if (v13)
  {
    *(_QWORD *)(a1 + 1016) = v13;
    *(_QWORD *)(a1 + 1024) = *(_QWORD *)(a2 + 1024);
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 992, a2 + 992);
    goto LABEL_29;
  }
  v14 = *(_OWORD *)(a2 + 992);
  v15 = *(_OWORD *)(a2 + 1008);
  *(_QWORD *)(a1 + 1024) = *(_QWORD *)(a2 + 1024);
  *(_OWORD *)(a1 + 992) = v14;
  *(_OWORD *)(a1 + 1008) = v15;
LABEL_29:
  v16 = *(_QWORD *)(a2 + 1056);
  if (*(_QWORD *)(a1 + 1056))
  {
    if (v16)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 1032), (uint64_t *)(a2 + 1032));
      goto LABEL_36;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 1032);
  }
  else if (v16)
  {
    *(_QWORD *)(a1 + 1056) = v16;
    *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a2 + 1064);
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 1032, a2 + 1032);
    goto LABEL_36;
  }
  v17 = *(_OWORD *)(a2 + 1032);
  v18 = *(_OWORD *)(a2 + 1048);
  *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a2 + 1064);
  *(_OWORD *)(a1 + 1032) = v17;
  *(_OWORD *)(a1 + 1048) = v18;
LABEL_36:
  v19 = *(_QWORD *)(a2 + 1096);
  if (*(_QWORD *)(a1 + 1096))
  {
    if (v19)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 1072), (uint64_t *)(a2 + 1072));
      goto LABEL_43;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 1072);
  }
  else if (v19)
  {
    *(_QWORD *)(a1 + 1096) = v19;
    *(_QWORD *)(a1 + 1104) = *(_QWORD *)(a2 + 1104);
    (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 1072, a2 + 1072);
    goto LABEL_43;
  }
  v20 = *(_OWORD *)(a2 + 1072);
  v21 = *(_OWORD *)(a2 + 1088);
  *(_QWORD *)(a1 + 1104) = *(_QWORD *)(a2 + 1104);
  *(_OWORD *)(a1 + 1072) = v20;
  *(_OWORD *)(a1 + 1088) = v21;
LABEL_43:
  v22 = *(_QWORD *)(a2 + 1136);
  if (!*(_QWORD *)(a1 + 1136))
  {
    if (v22)
    {
      *(_QWORD *)(a1 + 1136) = v22;
      *(_QWORD *)(a1 + 1144) = *(_QWORD *)(a2 + 1144);
      (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 1112, a2 + 1112);
      goto LABEL_50;
    }
LABEL_49:
    v23 = *(_OWORD *)(a2 + 1112);
    v24 = *(_OWORD *)(a2 + 1128);
    *(_QWORD *)(a1 + 1144) = *(_QWORD *)(a2 + 1144);
    *(_OWORD *)(a1 + 1112) = v23;
    *(_OWORD *)(a1 + 1128) = v24;
    goto LABEL_50;
  }
  if (!v22)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 1112);
    goto LABEL_49;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 1112), (uint64_t *)(a2 + 1112));
LABEL_50:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 1152), (uint64_t *)(a2 + 1152));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
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
      result[4] = a2[4];
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

void *__swift_memcpy1192_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x4A8uLL);
}

uint64_t assignWithTake for AdLockupLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
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
  __int128 v27;
  __int128 v28;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  v6 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v6;
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  v7 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v7;
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  v8 = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 296) = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 312) = v8;
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  v9 = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 352) = v9;
  *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  v10 = *(_OWORD *)(a2 + 392);
  *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
  *(_OWORD *)(a1 + 392) = v10;
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  v11 = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 432) = v11;
  *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
  *(_QWORD *)&v11 = *(_QWORD *)(a2 + 464);
  *(_QWORD *)(a1 + 456) = *(_QWORD *)(a2 + 456);
  *(_QWORD *)(a1 + 464) = v11;
  __swift_destroy_boxed_opaque_existential_1(a1 + 472);
  v12 = *(_OWORD *)(a2 + 488);
  *(_OWORD *)(a1 + 472) = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 488) = v12;
  *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
  __swift_destroy_boxed_opaque_existential_1(a1 + 512);
  v13 = *(_OWORD *)(a2 + 528);
  *(_OWORD *)(a1 + 512) = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 528) = v13;
  *(_QWORD *)(a1 + 544) = *(_QWORD *)(a2 + 544);
  __swift_destroy_boxed_opaque_existential_1(a1 + 552);
  v14 = *(_OWORD *)(a2 + 568);
  *(_OWORD *)(a1 + 552) = *(_OWORD *)(a2 + 552);
  *(_OWORD *)(a1 + 568) = v14;
  *(_QWORD *)(a1 + 584) = *(_QWORD *)(a2 + 584);
  __swift_destroy_boxed_opaque_existential_1(a1 + 592);
  v15 = *(_OWORD *)(a2 + 608);
  *(_OWORD *)(a1 + 592) = *(_OWORD *)(a2 + 592);
  *(_OWORD *)(a1 + 608) = v15;
  *(_QWORD *)(a1 + 624) = *(_QWORD *)(a2 + 624);
  __swift_destroy_boxed_opaque_existential_1(a1 + 632);
  v16 = *(_OWORD *)(a2 + 648);
  *(_OWORD *)(a1 + 632) = *(_OWORD *)(a2 + 632);
  *(_OWORD *)(a1 + 648) = v16;
  *(_QWORD *)(a1 + 664) = *(_QWORD *)(a2 + 664);
  __swift_destroy_boxed_opaque_existential_1(a1 + 672);
  v17 = *(_OWORD *)(a2 + 688);
  *(_OWORD *)(a1 + 672) = *(_OWORD *)(a2 + 672);
  *(_OWORD *)(a1 + 688) = v17;
  *(_QWORD *)(a1 + 704) = *(_QWORD *)(a2 + 704);
  __swift_destroy_boxed_opaque_existential_1(a1 + 712);
  v18 = *(_OWORD *)(a2 + 728);
  *(_OWORD *)(a1 + 712) = *(_OWORD *)(a2 + 712);
  *(_OWORD *)(a1 + 728) = v18;
  *(_QWORD *)(a1 + 744) = *(_QWORD *)(a2 + 744);
  if (*(_QWORD *)(a1 + 776))
    __swift_destroy_boxed_opaque_existential_1(a1 + 752);
  v19 = *(_OWORD *)(a2 + 768);
  *(_OWORD *)(a1 + 752) = *(_OWORD *)(a2 + 752);
  *(_OWORD *)(a1 + 768) = v19;
  *(_QWORD *)(a1 + 784) = *(_QWORD *)(a2 + 784);
  __swift_destroy_boxed_opaque_existential_1(a1 + 792);
  v20 = *(_OWORD *)(a2 + 808);
  *(_OWORD *)(a1 + 792) = *(_OWORD *)(a2 + 792);
  *(_OWORD *)(a1 + 808) = v20;
  *(_QWORD *)(a1 + 824) = *(_QWORD *)(a2 + 824);
  __swift_destroy_boxed_opaque_existential_1(a1 + 832);
  v21 = *(_OWORD *)(a2 + 848);
  *(_OWORD *)(a1 + 832) = *(_OWORD *)(a2 + 832);
  *(_OWORD *)(a1 + 848) = v21;
  *(_QWORD *)(a1 + 864) = *(_QWORD *)(a2 + 864);
  if (*(_QWORD *)(a1 + 896))
    __swift_destroy_boxed_opaque_existential_1(a1 + 872);
  v22 = *(_OWORD *)(a2 + 888);
  *(_OWORD *)(a1 + 872) = *(_OWORD *)(a2 + 872);
  *(_OWORD *)(a1 + 888) = v22;
  *(_QWORD *)(a1 + 904) = *(_QWORD *)(a2 + 904);
  if (*(_QWORD *)(a1 + 936))
    __swift_destroy_boxed_opaque_existential_1(a1 + 912);
  v23 = *(_OWORD *)(a2 + 928);
  *(_OWORD *)(a1 + 912) = *(_OWORD *)(a2 + 912);
  *(_OWORD *)(a1 + 928) = v23;
  *(_QWORD *)(a1 + 944) = *(_QWORD *)(a2 + 944);
  __swift_destroy_boxed_opaque_existential_1(a1 + 952);
  v24 = *(_OWORD *)(a2 + 968);
  *(_OWORD *)(a1 + 952) = *(_OWORD *)(a2 + 952);
  *(_OWORD *)(a1 + 968) = v24;
  *(_QWORD *)(a1 + 984) = *(_QWORD *)(a2 + 984);
  if (*(_QWORD *)(a1 + 1016))
    __swift_destroy_boxed_opaque_existential_1(a1 + 992);
  v25 = *(_OWORD *)(a2 + 1008);
  *(_OWORD *)(a1 + 992) = *(_OWORD *)(a2 + 992);
  *(_OWORD *)(a1 + 1008) = v25;
  *(_QWORD *)(a1 + 1024) = *(_QWORD *)(a2 + 1024);
  if (*(_QWORD *)(a1 + 1056))
    __swift_destroy_boxed_opaque_existential_1(a1 + 1032);
  v26 = *(_OWORD *)(a2 + 1048);
  *(_OWORD *)(a1 + 1032) = *(_OWORD *)(a2 + 1032);
  *(_OWORD *)(a1 + 1048) = v26;
  *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a2 + 1064);
  if (*(_QWORD *)(a1 + 1096))
    __swift_destroy_boxed_opaque_existential_1(a1 + 1072);
  v27 = *(_OWORD *)(a2 + 1088);
  *(_OWORD *)(a1 + 1072) = *(_OWORD *)(a2 + 1072);
  *(_OWORD *)(a1 + 1088) = v27;
  *(_QWORD *)(a1 + 1104) = *(_QWORD *)(a2 + 1104);
  if (*(_QWORD *)(a1 + 1136))
    __swift_destroy_boxed_opaque_existential_1(a1 + 1112);
  *(_QWORD *)(a1 + 1144) = *(_QWORD *)(a2 + 1144);
  v28 = *(_OWORD *)(a2 + 1128);
  *(_OWORD *)(a1 + 1112) = *(_OWORD *)(a2 + 1112);
  *(_OWORD *)(a1 + 1128) = v28;
  __swift_destroy_boxed_opaque_existential_1(a1 + 1152);
  *(_OWORD *)(a1 + 1152) = *(_OWORD *)(a2 + 1152);
  *(_OWORD *)(a1 + 1168) = *(_OWORD *)(a2 + 1168);
  *(_QWORD *)(a1 + 1184) = *(_QWORD *)(a2 + 1184);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdLockupLayout(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 1192))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdLockupLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 1160) = 0u;
    *(_OWORD *)(result + 1176) = 0u;
    *(_OWORD *)(result + 1144) = 0u;
    *(_OWORD *)(result + 1128) = 0u;
    *(_OWORD *)(result + 1112) = 0u;
    *(_OWORD *)(result + 1096) = 0u;
    *(_OWORD *)(result + 1080) = 0u;
    *(_OWORD *)(result + 1064) = 0u;
    *(_OWORD *)(result + 1048) = 0u;
    *(_OWORD *)(result + 1032) = 0u;
    *(_OWORD *)(result + 1016) = 0u;
    *(_OWORD *)(result + 1000) = 0u;
    *(_OWORD *)(result + 984) = 0u;
    *(_OWORD *)(result + 968) = 0u;
    *(_OWORD *)(result + 952) = 0u;
    *(_OWORD *)(result + 936) = 0u;
    *(_OWORD *)(result + 920) = 0u;
    *(_OWORD *)(result + 904) = 0u;
    *(_OWORD *)(result + 888) = 0u;
    *(_OWORD *)(result + 872) = 0u;
    *(_OWORD *)(result + 856) = 0u;
    *(_OWORD *)(result + 840) = 0u;
    *(_OWORD *)(result + 824) = 0u;
    *(_OWORD *)(result + 808) = 0u;
    *(_OWORD *)(result + 792) = 0u;
    *(_OWORD *)(result + 776) = 0u;
    *(_OWORD *)(result + 760) = 0u;
    *(_OWORD *)(result + 744) = 0u;
    *(_OWORD *)(result + 728) = 0u;
    *(_OWORD *)(result + 712) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 1192) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 1192) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AdLockupLayout()
{
  return &type metadata for AdLockupLayout;
}

uint64_t destroy for AdLockupLayout.Metrics(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  __swift_destroy_boxed_opaque_existential_1(a1 + 472);
  __swift_destroy_boxed_opaque_existential_1(a1 + 512);
  __swift_destroy_boxed_opaque_existential_1(a1 + 552);
  __swift_destroy_boxed_opaque_existential_1(a1 + 592);
  __swift_destroy_boxed_opaque_existential_1(a1 + 632);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 672);
}

uint64_t initializeWithCopy for AdLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
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
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 56, a2 + 56);
  v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 96, a2 + 96);
  v7 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 136, a2 + 136);
  v8 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 200) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 176, a2 + 176);
  v9 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 240) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 216, a2 + 216);
  v10 = *(_QWORD *)(a2 + 280);
  v11 = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 280) = v10;
  *(_QWORD *)(a1 + 288) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 256, a2 + 256);
  v12 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 320) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 296, a2 + 296);
  v13 = *(_QWORD *)(a2 + 360);
  v14 = *(_QWORD *)(a2 + 368);
  *(_QWORD *)(a1 + 360) = v13;
  *(_QWORD *)(a1 + 368) = v14;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 336, a2 + 336);
  v15 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 400) = v15;
  (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 376, a2 + 376);
  v16 = *(_QWORD *)(a2 + 440);
  v17 = *(_QWORD *)(a2 + 448);
  *(_QWORD *)(a1 + 440) = v16;
  *(_QWORD *)(a1 + 448) = v17;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 416, a2 + 416);
  *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
  v18 = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 496) = v18;
  (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 472, a2 + 472);
  v19 = *(_QWORD *)(a2 + 536);
  *(_QWORD *)(a1 + 536) = v19;
  *(_QWORD *)(a1 + 544) = *(_QWORD *)(a2 + 544);
  (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 512, a2 + 512);
  v20 = *(_OWORD *)(a2 + 576);
  *(_OWORD *)(a1 + 576) = v20;
  (**(void (***)(uint64_t, uint64_t))(v20 - 8))(a1 + 552, a2 + 552);
  v21 = *(_QWORD *)(a2 + 616);
  *(_QWORD *)(a1 + 616) = v21;
  *(_QWORD *)(a1 + 624) = *(_QWORD *)(a2 + 624);
  (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 592, a2 + 592);
  v22 = *(_OWORD *)(a2 + 656);
  *(_OWORD *)(a1 + 656) = v22;
  (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 632, a2 + 632);
  v23 = *(_QWORD *)(a2 + 696);
  *(_QWORD *)(a1 + 696) = v23;
  *(_QWORD *)(a1 + 704) = *(_QWORD *)(a2 + 704);
  (**(void (***)(uint64_t, uint64_t))(v23 - 8))(a1 + 672, a2 + 672);
  return a1;
}

uint64_t *assignWithCopy for AdLockupLayout.Metrics(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  __swift_assign_boxed_opaque_existential_1(a1 + 17, a2 + 17);
  __swift_assign_boxed_opaque_existential_1(a1 + 22, a2 + 22);
  __swift_assign_boxed_opaque_existential_1(a1 + 27, a2 + 27);
  __swift_assign_boxed_opaque_existential_1(a1 + 32, a2 + 32);
  __swift_assign_boxed_opaque_existential_1(a1 + 37, a2 + 37);
  __swift_assign_boxed_opaque_existential_1(a1 + 42, a2 + 42);
  __swift_assign_boxed_opaque_existential_1(a1 + 47, a2 + 47);
  __swift_assign_boxed_opaque_existential_1(a1 + 52, a2 + 52);
  a1[57] = a2[57];
  a1[58] = a2[58];
  __swift_assign_boxed_opaque_existential_1(a1 + 59, a2 + 59);
  __swift_assign_boxed_opaque_existential_1(a1 + 64, a2 + 64);
  __swift_assign_boxed_opaque_existential_1(a1 + 69, a2 + 69);
  __swift_assign_boxed_opaque_existential_1(a1 + 74, a2 + 74);
  __swift_assign_boxed_opaque_existential_1(a1 + 79, a2 + 79);
  __swift_assign_boxed_opaque_existential_1(a1 + 84, a2 + 84);
  return a1;
}

void *__swift_memcpy712_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x2C8uLL);
}

uint64_t assignWithTake for AdLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  v6 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v6;
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  v7 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v7;
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  v8 = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 296) = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 312) = v8;
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  v9 = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 352) = v9;
  *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  v10 = *(_OWORD *)(a2 + 392);
  *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
  *(_OWORD *)(a1 + 392) = v10;
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  v11 = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 432) = v11;
  *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
  *(_QWORD *)&v11 = *(_QWORD *)(a2 + 464);
  *(_QWORD *)(a1 + 456) = *(_QWORD *)(a2 + 456);
  *(_QWORD *)(a1 + 464) = v11;
  __swift_destroy_boxed_opaque_existential_1(a1 + 472);
  v12 = *(_OWORD *)(a2 + 488);
  *(_OWORD *)(a1 + 472) = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 488) = v12;
  *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
  __swift_destroy_boxed_opaque_existential_1(a1 + 512);
  v13 = *(_OWORD *)(a2 + 528);
  *(_OWORD *)(a1 + 512) = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 528) = v13;
  *(_QWORD *)(a1 + 544) = *(_QWORD *)(a2 + 544);
  __swift_destroy_boxed_opaque_existential_1(a1 + 552);
  v14 = *(_OWORD *)(a2 + 568);
  *(_OWORD *)(a1 + 552) = *(_OWORD *)(a2 + 552);
  *(_OWORD *)(a1 + 568) = v14;
  *(_QWORD *)(a1 + 584) = *(_QWORD *)(a2 + 584);
  __swift_destroy_boxed_opaque_existential_1(a1 + 592);
  v15 = *(_OWORD *)(a2 + 608);
  *(_OWORD *)(a1 + 592) = *(_OWORD *)(a2 + 592);
  *(_OWORD *)(a1 + 608) = v15;
  *(_QWORD *)(a1 + 624) = *(_QWORD *)(a2 + 624);
  __swift_destroy_boxed_opaque_existential_1(a1 + 632);
  v16 = *(_OWORD *)(a2 + 648);
  *(_OWORD *)(a1 + 632) = *(_OWORD *)(a2 + 632);
  *(_OWORD *)(a1 + 648) = v16;
  *(_QWORD *)(a1 + 664) = *(_QWORD *)(a2 + 664);
  __swift_destroy_boxed_opaque_existential_1(a1 + 672);
  v17 = *(_OWORD *)(a2 + 688);
  *(_OWORD *)(a1 + 672) = *(_OWORD *)(a2 + 672);
  *(_OWORD *)(a1 + 688) = v17;
  *(_QWORD *)(a1 + 704) = *(_QWORD *)(a2 + 704);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdLockupLayout.Metrics(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 712))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdLockupLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 712) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 712) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AdLockupLayout.Metrics()
{
  return &type metadata for AdLockupLayout.Metrics;
}

void type metadata accessor for Size(uint64_t a1)
{
  sub_1BCBDAB60(a1, &qword_1EF48D0B0);
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

uint64_t sub_1BCBDAA98(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1BCBDAAB8(uint64_t result, int a2, int a3)
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

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
  sub_1BCBDAB60(a1, &qword_1EF48D0B8);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1BCBDAB04(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1BCBDAB24(uint64_t result, int a2, int a3)
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
  sub_1BCBDAB60(a1, &qword_1EF48D0C0);
}

void sub_1BCBDAB60(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1BCBDABA4()
{
  sub_1BCBDAC80(&qword_1EF48D0F0, (uint64_t (*)(uint64_t))type metadata accessor for Size, (uint64_t)&unk_1BCC092E8);
  sub_1BCBDAC80(&qword_1EF48D0F8, (uint64_t (*)(uint64_t))type metadata accessor for Size, (uint64_t)&unk_1BCC09288);
  return sub_1BCC00F48();
}

uint64_t sub_1BCBDAC28()
{
  return sub_1BCBDAC80(&qword_1EF48D0C8, (uint64_t (*)(uint64_t))type metadata accessor for Size, (uint64_t)&unk_1BCC0924C);
}

uint64_t sub_1BCBDAC54()
{
  return sub_1BCBDAC80(&qword_1EF48D0D0, (uint64_t (*)(uint64_t))type metadata accessor for Size, (uint64_t)&unk_1BCC09220);
}

uint64_t sub_1BCBDAC80(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1BCCFEBCC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BCBDACC0()
{
  return sub_1BCBDAC80(&qword_1EF48D0D8, (uint64_t (*)(uint64_t))type metadata accessor for Size, (uint64_t)&unk_1BCC092BC);
}

uint64_t sub_1BCBDACEC(uint64_t a1, uint64_t a2)
{
  return sub_1BCBDACF8(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1BCBDACF8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1BCC00DE0();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1BCBDAD34()
{
  sub_1BCC00DE0();
  sub_1BCC00DEC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BCBDAD74()
{
  uint64_t v0;

  sub_1BCC00DE0();
  sub_1BCC00F78();
  sub_1BCC00DEC();
  v0 = sub_1BCC00F90();
  swift_bridgeObjectRelease();
  return v0;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1BCBDAE08(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for AdLockupLayout.Metrics(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCCFEBB4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1BCBDAE7C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1BCBDAEC0()
{
  unint64_t result;

  result = qword_1EF48D0E0;
  if (!qword_1EF48D0E0)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09414, &type metadata for AdLockupLayout.AdLockupInnerContentLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48D0E0);
  }
  return result;
}

uint64_t sub_1BCBDAF04()
{
  _QWORD *v0;

  if (v0[5])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 12));
  if (v0[20])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 17));
  if (v0[25])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 22));
  if (v0[30])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 27));
  if (v0[35])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 32));
  if (v0[40])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 37));
  if (v0[45])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 42));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 49));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 54));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 59));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 64));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 69));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 74));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 79));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 84));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 89));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 94));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 99));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 106));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 111));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 116));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 121));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 126));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 131));
  return swift_deallocObject();
}

uint64_t sub_1BCBDB028(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for AdLockupLayout.AdLockupInnerContentLayout(a2, a1);
  return a2;
}

uint64_t sub_1BCBDB05C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *sub_1BCBDB0A0(_QWORD *a1)
{
  destroy for AdLockupLayout.AdLockupInnerContentLayout(a1);
  return a1;
}

uint64_t sub_1BCBDB0CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 24))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BCBDB110(uint64_t a1)
{
  destroy for AdLockupLayout.Metrics(a1);
  return a1;
}

uint64_t sub_1BCBDB13C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC8A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
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

uint64_t sub_1BCBDB1C0(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for AdLockupLayout(a2, a1);
  return a2;
}

_QWORD *sub_1BCBDB1F4(_QWORD *a1)
{
  destroy for AdLockupLayout(a1);
  return a1;
}

double sub_1BCBDB220(_QWORD *a1, void *a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void (*v11)(char *, uint64_t);
  uint64_t v13;

  v6 = sub_1BCC00F54();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(a2, sel_traitCollection);
  sub_1BCC00E70();

  __swift_project_boxed_opaque_existential_1(a1 + 12, a1[15]);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  v11 = *(void (**)(char *, uint64_t))(v7 + 8);
  v11(v9, v6);
  __swift_project_boxed_opaque_existential_1(a1 + 32, a1[35]);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  v11(v9, v6);
  __swift_project_boxed_opaque_existential_1(a1 + 47, a1[50]);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  v11(v9, v6);
  return a3;
}

uint64_t sub_1BCBDB3C8(__int128 *a1, uint64_t a2)
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

uint64_t initializeBufferWithCopyOfBuffer for AdLockupLayout.AdLockupInnerContentLayout(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AdLockupLayout.AdLockupInnerContentLayout(_QWORD *a1)
{
  if (a1[3])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 5));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 10));
  if (a1[18])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 15));
  if (a1[23])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 20));
  if (a1[28])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 25));
  if (a1[33])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 30));
  if (a1[38])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 35));
  if (a1[43])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 40));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 47));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 52));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 57));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 62));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 67));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 72));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 77));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 82));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 87));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 92));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 97));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 104));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 109));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 114));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 119));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 124));
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)(a1 + 129));
}

uint64_t initializeWithCopy for AdLockupLayout.AdLockupInnerContentLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _OWORD *v19;
  _OWORD *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  _OWORD *v29;
  _OWORD *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  _OWORD *v34;
  _OWORD *v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;

  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    v5 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = v5;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, a2 + 40);
  v8 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 80, a2 + 80);
  v9 = (_OWORD *)(a1 + 120);
  v10 = (_OWORD *)(a2 + 120);
  v11 = *(_QWORD *)(a2 + 144);
  if (v11)
  {
    v12 = *(_QWORD *)(a2 + 152);
    *(_QWORD *)(a1 + 144) = v11;
    *(_QWORD *)(a1 + 152) = v12;
    (**(void (***)(_OWORD *, _OWORD *))(v11 - 8))(v9, v10);
  }
  else
  {
    v13 = *(_OWORD *)(a2 + 136);
    *v9 = *v10;
    *(_OWORD *)(a1 + 136) = v13;
    *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  }
  v14 = (_OWORD *)(a1 + 160);
  v15 = (_OWORD *)(a2 + 160);
  v16 = *(_QWORD *)(a2 + 184);
  if (v16)
  {
    v17 = *(_QWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 184) = v16;
    *(_QWORD *)(a1 + 192) = v17;
    (**(void (***)(_OWORD *, _OWORD *))(v16 - 8))(v14, v15);
  }
  else
  {
    v18 = *(_OWORD *)(a2 + 176);
    *v14 = *v15;
    *(_OWORD *)(a1 + 176) = v18;
    *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  }
  v19 = (_OWORD *)(a1 + 200);
  v20 = (_OWORD *)(a2 + 200);
  v21 = *(_QWORD *)(a2 + 224);
  if (v21)
  {
    v22 = *(_QWORD *)(a2 + 232);
    *(_QWORD *)(a1 + 224) = v21;
    *(_QWORD *)(a1 + 232) = v22;
    (**(void (***)(_OWORD *, _OWORD *))(v21 - 8))(v19, v20);
  }
  else
  {
    v23 = *(_OWORD *)(a2 + 216);
    *v19 = *v20;
    *(_OWORD *)(a1 + 216) = v23;
    *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  }
  v24 = (_OWORD *)(a1 + 240);
  v25 = (_OWORD *)(a2 + 240);
  v26 = *(_QWORD *)(a2 + 264);
  if (v26)
  {
    v27 = *(_QWORD *)(a2 + 272);
    *(_QWORD *)(a1 + 264) = v26;
    *(_QWORD *)(a1 + 272) = v27;
    (**(void (***)(_OWORD *, _OWORD *))(v26 - 8))(v24, v25);
  }
  else
  {
    v28 = *(_OWORD *)(a2 + 256);
    *v24 = *v25;
    *(_OWORD *)(a1 + 256) = v28;
    *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  }
  v29 = (_OWORD *)(a1 + 280);
  v30 = (_OWORD *)(a2 + 280);
  v31 = *(_QWORD *)(a2 + 304);
  if (v31)
  {
    v32 = *(_QWORD *)(a2 + 312);
    *(_QWORD *)(a1 + 304) = v31;
    *(_QWORD *)(a1 + 312) = v32;
    (**(void (***)(_OWORD *, _OWORD *))(v31 - 8))(v29, v30);
  }
  else
  {
    v33 = *(_OWORD *)(a2 + 296);
    *v29 = *v30;
    *(_OWORD *)(a1 + 296) = v33;
    *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  }
  v34 = (_OWORD *)(a1 + 320);
  v35 = (_OWORD *)(a2 + 320);
  v36 = *(_QWORD *)(a2 + 344);
  if (v36)
  {
    v37 = *(_QWORD *)(a2 + 352);
    *(_QWORD *)(a1 + 344) = v36;
    *(_QWORD *)(a1 + 352) = v37;
    (**(void (***)(_OWORD *, _OWORD *))(v36 - 8))(v34, v35);
  }
  else
  {
    v38 = *(_OWORD *)(a2 + 336);
    *v34 = *v35;
    *(_OWORD *)(a1 + 336) = v38;
    *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
  }
  *(_OWORD *)(a1 + 360) = *(_OWORD *)(a2 + 360);
  v39 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 400) = v39;
  (**(void (***)(uint64_t, uint64_t))(v39 - 8))(a1 + 376, a2 + 376);
  v40 = *(_QWORD *)(a2 + 440);
  v41 = *(_QWORD *)(a2 + 448);
  *(_QWORD *)(a1 + 440) = v40;
  *(_QWORD *)(a1 + 448) = v41;
  (**(void (***)(uint64_t, uint64_t))(v40 - 8))(a1 + 416, a2 + 416);
  v42 = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 480) = v42;
  (**(void (***)(uint64_t, uint64_t))(v42 - 8))(a1 + 456, a2 + 456);
  v43 = *(_QWORD *)(a2 + 520);
  *(_QWORD *)(a1 + 520) = v43;
  *(_QWORD *)(a1 + 528) = *(_QWORD *)(a2 + 528);
  (**(void (***)(uint64_t, uint64_t))(v43 - 8))(a1 + 496, a2 + 496);
  v44 = *(_OWORD *)(a2 + 560);
  *(_OWORD *)(a1 + 560) = v44;
  (**(void (***)(uint64_t, uint64_t))(v44 - 8))(a1 + 536, a2 + 536);
  v45 = *(_QWORD *)(a2 + 600);
  *(_QWORD *)(a1 + 600) = v45;
  *(_QWORD *)(a1 + 608) = *(_QWORD *)(a2 + 608);
  (**(void (***)(uint64_t, uint64_t))(v45 - 8))(a1 + 576, a2 + 576);
  v46 = *(_OWORD *)(a2 + 640);
  *(_OWORD *)(a1 + 640) = v46;
  (**(void (***)(uint64_t, uint64_t))(v46 - 8))(a1 + 616, a2 + 616);
  v47 = *(_QWORD *)(a2 + 680);
  *(_QWORD *)(a1 + 680) = v47;
  *(_QWORD *)(a1 + 688) = *(_QWORD *)(a2 + 688);
  (**(void (***)(uint64_t, uint64_t))(v47 - 8))(a1 + 656, a2 + 656);
  v48 = *(_OWORD *)(a2 + 720);
  *(_OWORD *)(a1 + 720) = v48;
  (**(void (***)(uint64_t, uint64_t))(v48 - 8))(a1 + 696, a2 + 696);
  v49 = *(_QWORD *)(a2 + 760);
  *(_QWORD *)(a1 + 760) = v49;
  *(_QWORD *)(a1 + 768) = *(_QWORD *)(a2 + 768);
  (**(void (***)(uint64_t, uint64_t))(v49 - 8))(a1 + 736, a2 + 736);
  v50 = *(_OWORD *)(a2 + 800);
  *(_OWORD *)(a1 + 800) = v50;
  (**(void (***)(uint64_t, uint64_t))(v50 - 8))(a1 + 776, a2 + 776);
  *(_OWORD *)(a1 + 816) = *(_OWORD *)(a2 + 816);
  v51 = *(_QWORD *)(a2 + 856);
  *(_QWORD *)(a1 + 856) = v51;
  *(_QWORD *)(a1 + 864) = *(_QWORD *)(a2 + 864);
  (**(void (***)(uint64_t, uint64_t))(v51 - 8))(a1 + 832, a2 + 832);
  v52 = *(_OWORD *)(a2 + 896);
  *(_OWORD *)(a1 + 896) = v52;
  (**(void (***)(uint64_t, uint64_t))(v52 - 8))(a1 + 872, a2 + 872);
  v53 = *(_QWORD *)(a2 + 936);
  *(_QWORD *)(a1 + 936) = v53;
  *(_QWORD *)(a1 + 944) = *(_QWORD *)(a2 + 944);
  (**(void (***)(uint64_t, uint64_t))(v53 - 8))(a1 + 912, a2 + 912);
  v54 = *(_OWORD *)(a2 + 976);
  *(_OWORD *)(a1 + 976) = v54;
  (**(void (***)(uint64_t, uint64_t))(v54 - 8))(a1 + 952, a2 + 952);
  v55 = *(_QWORD *)(a2 + 1016);
  *(_QWORD *)(a1 + 1016) = v55;
  *(_QWORD *)(a1 + 1024) = *(_QWORD *)(a2 + 1024);
  (**(void (***)(uint64_t, uint64_t))(v55 - 8))(a1 + 992, a2 + 992);
  v56 = *(_OWORD *)(a2 + 1056);
  *(_OWORD *)(a1 + 1056) = v56;
  (**(void (***)(uint64_t, uint64_t))(v56 - 8))(a1 + 1032, a2 + 1032);
  return a1;
}

uint64_t assignWithCopy for AdLockupLayout.AdLockupInnerContentLayout(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;

  v4 = *((_QWORD *)a2 + 3);
  if (*(_QWORD *)(a1 + 24))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  else if (v4)
  {
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a1, a2);
    goto LABEL_8;
  }
  v5 = *a2;
  v6 = a2[1];
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  *(_OWORD *)a1 = v5;
  *(_OWORD *)(a1 + 16) = v6;
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 40), (uint64_t *)a2 + 5);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 80), (uint64_t *)a2 + 10);
  v7 = *((_QWORD *)a2 + 18);
  if (*(_QWORD *)(a1 + 144))
  {
    if (v7)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 120), (uint64_t *)a2 + 15);
      goto LABEL_15;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  }
  else if (v7)
  {
    *(_QWORD *)(a1 + 144) = v7;
    *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 120, (uint64_t)a2 + 120);
    goto LABEL_15;
  }
  v8 = *(__int128 *)((char *)a2 + 120);
  v9 = *(__int128 *)((char *)a2 + 136);
  *(_QWORD *)(a1 + 152) = *((_QWORD *)a2 + 19);
  *(_OWORD *)(a1 + 120) = v8;
  *(_OWORD *)(a1 + 136) = v9;
LABEL_15:
  v10 = *((_QWORD *)a2 + 23);
  if (*(_QWORD *)(a1 + 184))
  {
    if (v10)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 160), (uint64_t *)a2 + 20);
      goto LABEL_22;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  }
  else if (v10)
  {
    *(_QWORD *)(a1 + 184) = v10;
    *(_QWORD *)(a1 + 192) = *((_QWORD *)a2 + 24);
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 160, (uint64_t)(a2 + 10));
    goto LABEL_22;
  }
  v11 = a2[10];
  v12 = a2[11];
  *(_QWORD *)(a1 + 192) = *((_QWORD *)a2 + 24);
  *(_OWORD *)(a1 + 160) = v11;
  *(_OWORD *)(a1 + 176) = v12;
LABEL_22:
  v13 = *((_QWORD *)a2 + 28);
  if (*(_QWORD *)(a1 + 224))
  {
    if (v13)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 200), (uint64_t *)a2 + 25);
      goto LABEL_29;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  }
  else if (v13)
  {
    *(_QWORD *)(a1 + 224) = v13;
    *(_QWORD *)(a1 + 232) = *((_QWORD *)a2 + 29);
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 200, (uint64_t)a2 + 200);
    goto LABEL_29;
  }
  v14 = *(__int128 *)((char *)a2 + 200);
  v15 = *(__int128 *)((char *)a2 + 216);
  *(_QWORD *)(a1 + 232) = *((_QWORD *)a2 + 29);
  *(_OWORD *)(a1 + 200) = v14;
  *(_OWORD *)(a1 + 216) = v15;
LABEL_29:
  v16 = *((_QWORD *)a2 + 33);
  if (*(_QWORD *)(a1 + 264))
  {
    if (v16)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 240), (uint64_t *)a2 + 30);
      goto LABEL_36;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  }
  else if (v16)
  {
    *(_QWORD *)(a1 + 264) = v16;
    *(_QWORD *)(a1 + 272) = *((_QWORD *)a2 + 34);
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 240, (uint64_t)(a2 + 15));
    goto LABEL_36;
  }
  v17 = a2[15];
  v18 = a2[16];
  *(_QWORD *)(a1 + 272) = *((_QWORD *)a2 + 34);
  *(_OWORD *)(a1 + 240) = v17;
  *(_OWORD *)(a1 + 256) = v18;
LABEL_36:
  v19 = *((_QWORD *)a2 + 38);
  if (*(_QWORD *)(a1 + 304))
  {
    if (v19)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 280), (uint64_t *)a2 + 35);
      goto LABEL_43;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 280);
  }
  else if (v19)
  {
    *(_QWORD *)(a1 + 304) = v19;
    *(_QWORD *)(a1 + 312) = *((_QWORD *)a2 + 39);
    (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 280, (uint64_t)a2 + 280);
    goto LABEL_43;
  }
  v20 = *(__int128 *)((char *)a2 + 280);
  v21 = *(__int128 *)((char *)a2 + 296);
  *(_QWORD *)(a1 + 312) = *((_QWORD *)a2 + 39);
  *(_OWORD *)(a1 + 280) = v20;
  *(_OWORD *)(a1 + 296) = v21;
LABEL_43:
  v22 = *((_QWORD *)a2 + 43);
  if (!*(_QWORD *)(a1 + 344))
  {
    if (v22)
    {
      *(_QWORD *)(a1 + 344) = v22;
      *(_QWORD *)(a1 + 352) = *((_QWORD *)a2 + 44);
      (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 320, (uint64_t)(a2 + 20));
      goto LABEL_50;
    }
LABEL_49:
    v23 = a2[20];
    v24 = a2[21];
    *(_QWORD *)(a1 + 352) = *((_QWORD *)a2 + 44);
    *(_OWORD *)(a1 + 320) = v23;
    *(_OWORD *)(a1 + 336) = v24;
    goto LABEL_50;
  }
  if (!v22)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 320);
    goto LABEL_49;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 320), (uint64_t *)a2 + 40);
LABEL_50:
  *(_QWORD *)(a1 + 360) = *((_QWORD *)a2 + 45);
  *(_QWORD *)(a1 + 368) = *((_QWORD *)a2 + 46);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 376), (uint64_t *)a2 + 47);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 416), (uint64_t *)a2 + 52);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 456), (uint64_t *)a2 + 57);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 496), (uint64_t *)a2 + 62);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 536), (uint64_t *)a2 + 67);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 576), (uint64_t *)a2 + 72);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 616), (uint64_t *)a2 + 77);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 656), (uint64_t *)a2 + 82);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 696), (uint64_t *)a2 + 87);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 736), (uint64_t *)a2 + 92);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 776), (uint64_t *)a2 + 97);
  *(_QWORD *)(a1 + 816) = *((_QWORD *)a2 + 102);
  *(_QWORD *)(a1 + 824) = *((_QWORD *)a2 + 103);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 832), (uint64_t *)a2 + 104);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 872), (uint64_t *)a2 + 109);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 912), (uint64_t *)a2 + 114);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 952), (uint64_t *)a2 + 119);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 992), (uint64_t *)a2 + 124);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 1032), (uint64_t *)a2 + 129);
  return a1;
}

void *__swift_memcpy1072_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x430uLL);
}

uint64_t assignWithTake for AdLockupLayout.AdLockupInnerContentLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
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
  __int128 v27;
  __int128 v28;

  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  if (*(_QWORD *)(a1 + 144))
    __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  v6 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = v6;
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  if (*(_QWORD *)(a1 + 184))
    __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v7;
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  if (*(_QWORD *)(a1 + 224))
    __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  v8 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = v8;
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  if (*(_QWORD *)(a1 + 264))
    __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  v9 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v9;
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  if (*(_QWORD *)(a1 + 304))
    __swift_destroy_boxed_opaque_existential_1(a1 + 280);
  v10 = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 296) = v10;
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  if (*(_QWORD *)(a1 + 344))
    __swift_destroy_boxed_opaque_existential_1(a1 + 320);
  v11 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 336) = v11;
  *(_QWORD *)(a1 + 352) = *(_QWORD *)(a2 + 352);
  *(_QWORD *)&v11 = *(_QWORD *)(a2 + 368);
  *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
  *(_QWORD *)(a1 + 368) = v11;
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  v12 = *(_OWORD *)(a2 + 392);
  *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
  *(_OWORD *)(a1 + 392) = v12;
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  v13 = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 432) = v13;
  *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
  __swift_destroy_boxed_opaque_existential_1(a1 + 456);
  v14 = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
  *(_OWORD *)(a1 + 472) = v14;
  *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
  __swift_destroy_boxed_opaque_existential_1(a1 + 496);
  v15 = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 496) = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 512) = v15;
  *(_QWORD *)(a1 + 528) = *(_QWORD *)(a2 + 528);
  __swift_destroy_boxed_opaque_existential_1(a1 + 536);
  v16 = *(_OWORD *)(a2 + 552);
  *(_OWORD *)(a1 + 536) = *(_OWORD *)(a2 + 536);
  *(_OWORD *)(a1 + 552) = v16;
  *(_QWORD *)(a1 + 568) = *(_QWORD *)(a2 + 568);
  __swift_destroy_boxed_opaque_existential_1(a1 + 576);
  v17 = *(_OWORD *)(a2 + 592);
  *(_OWORD *)(a1 + 576) = *(_OWORD *)(a2 + 576);
  *(_OWORD *)(a1 + 592) = v17;
  *(_QWORD *)(a1 + 608) = *(_QWORD *)(a2 + 608);
  __swift_destroy_boxed_opaque_existential_1(a1 + 616);
  v18 = *(_OWORD *)(a2 + 632);
  *(_OWORD *)(a1 + 616) = *(_OWORD *)(a2 + 616);
  *(_OWORD *)(a1 + 632) = v18;
  *(_QWORD *)(a1 + 648) = *(_QWORD *)(a2 + 648);
  __swift_destroy_boxed_opaque_existential_1(a1 + 656);
  v19 = *(_OWORD *)(a2 + 672);
  *(_OWORD *)(a1 + 656) = *(_OWORD *)(a2 + 656);
  *(_OWORD *)(a1 + 672) = v19;
  *(_QWORD *)(a1 + 688) = *(_QWORD *)(a2 + 688);
  __swift_destroy_boxed_opaque_existential_1(a1 + 696);
  v20 = *(_OWORD *)(a2 + 712);
  *(_OWORD *)(a1 + 696) = *(_OWORD *)(a2 + 696);
  *(_OWORD *)(a1 + 712) = v20;
  *(_QWORD *)(a1 + 728) = *(_QWORD *)(a2 + 728);
  __swift_destroy_boxed_opaque_existential_1(a1 + 736);
  v21 = *(_OWORD *)(a2 + 752);
  *(_OWORD *)(a1 + 736) = *(_OWORD *)(a2 + 736);
  *(_OWORD *)(a1 + 752) = v21;
  *(_QWORD *)(a1 + 768) = *(_QWORD *)(a2 + 768);
  __swift_destroy_boxed_opaque_existential_1(a1 + 776);
  v22 = *(_OWORD *)(a2 + 792);
  *(_OWORD *)(a1 + 776) = *(_OWORD *)(a2 + 776);
  *(_OWORD *)(a1 + 792) = v22;
  *(_QWORD *)(a1 + 808) = *(_QWORD *)(a2 + 808);
  *(_OWORD *)(a1 + 816) = *(_OWORD *)(a2 + 816);
  __swift_destroy_boxed_opaque_existential_1(a1 + 832);
  v23 = *(_OWORD *)(a2 + 848);
  *(_OWORD *)(a1 + 832) = *(_OWORD *)(a2 + 832);
  *(_OWORD *)(a1 + 848) = v23;
  *(_QWORD *)(a1 + 864) = *(_QWORD *)(a2 + 864);
  __swift_destroy_boxed_opaque_existential_1(a1 + 872);
  v24 = *(_OWORD *)(a2 + 888);
  *(_OWORD *)(a1 + 872) = *(_OWORD *)(a2 + 872);
  *(_OWORD *)(a1 + 888) = v24;
  *(_QWORD *)(a1 + 904) = *(_QWORD *)(a2 + 904);
  __swift_destroy_boxed_opaque_existential_1(a1 + 912);
  v25 = *(_OWORD *)(a2 + 928);
  *(_OWORD *)(a1 + 912) = *(_OWORD *)(a2 + 912);
  *(_OWORD *)(a1 + 928) = v25;
  *(_QWORD *)(a1 + 944) = *(_QWORD *)(a2 + 944);
  __swift_destroy_boxed_opaque_existential_1(a1 + 952);
  v26 = *(_OWORD *)(a2 + 968);
  *(_OWORD *)(a1 + 952) = *(_OWORD *)(a2 + 952);
  *(_OWORD *)(a1 + 968) = v26;
  *(_QWORD *)(a1 + 984) = *(_QWORD *)(a2 + 984);
  __swift_destroy_boxed_opaque_existential_1(a1 + 992);
  v27 = *(_OWORD *)(a2 + 1008);
  *(_OWORD *)(a1 + 992) = *(_OWORD *)(a2 + 992);
  *(_OWORD *)(a1 + 1008) = v27;
  *(_QWORD *)(a1 + 1024) = *(_QWORD *)(a2 + 1024);
  __swift_destroy_boxed_opaque_existential_1(a1 + 1032);
  v28 = *(_OWORD *)(a2 + 1048);
  *(_OWORD *)(a1 + 1032) = *(_OWORD *)(a2 + 1032);
  *(_OWORD *)(a1 + 1048) = v28;
  *(_QWORD *)(a1 + 1064) = *(_QWORD *)(a2 + 1064);
  return a1;
}

uint64_t getEnumTagSinglePayload for AdLockupLayout.AdLockupInnerContentLayout(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 1072))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 64);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AdLockupLayout.AdLockupInnerContentLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 1064) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 1048) = 0u;
    *(_OWORD *)(result + 1032) = 0u;
    *(_OWORD *)(result + 1016) = 0u;
    *(_OWORD *)(result + 1000) = 0u;
    *(_OWORD *)(result + 984) = 0u;
    *(_OWORD *)(result + 968) = 0u;
    *(_OWORD *)(result + 952) = 0u;
    *(_OWORD *)(result + 936) = 0u;
    *(_OWORD *)(result + 920) = 0u;
    *(_OWORD *)(result + 904) = 0u;
    *(_OWORD *)(result + 888) = 0u;
    *(_OWORD *)(result + 872) = 0u;
    *(_OWORD *)(result + 856) = 0u;
    *(_OWORD *)(result + 840) = 0u;
    *(_OWORD *)(result + 824) = 0u;
    *(_OWORD *)(result + 808) = 0u;
    *(_OWORD *)(result + 792) = 0u;
    *(_OWORD *)(result + 776) = 0u;
    *(_OWORD *)(result + 760) = 0u;
    *(_OWORD *)(result + 744) = 0u;
    *(_OWORD *)(result + 728) = 0u;
    *(_OWORD *)(result + 712) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 1072) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 64) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 1072) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AdLockupLayout.AdLockupInnerContentLayout()
{
  return &type metadata for AdLockupLayout.AdLockupInnerContentLayout;
}

unint64_t sub_1BCBDC244()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED1BC210;
  if (!qword_1ED1BC210)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED1BC208);
    result = MEMORY[0x1BCCFEBCC](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED1BC210);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCCFEBC0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1BCBDC2D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id sub_1BCBDC318()
{
  id *v0;

  return objc_msgSend(*v0, sel_alignmentRectInsets);
}

uint64_t destroy for AppShowcaseLockupLayout(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 192);
  __swift_destroy_boxed_opaque_existential_1(a1 + 232);
  __swift_destroy_boxed_opaque_existential_1(a1 + 272);
  __swift_destroy_boxed_opaque_existential_1(a1 + 312);
  if (*(_QWORD *)(a1 + 376))
    __swift_destroy_boxed_opaque_existential_1(a1 + 352);
  __swift_destroy_boxed_opaque_existential_1(a1 + 392);
  __swift_destroy_boxed_opaque_existential_1(a1 + 432);
  if (*(_QWORD *)(a1 + 496))
    __swift_destroy_boxed_opaque_existential_1(a1 + 472);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 512);
}

uint64_t initializeWithCopy for AppShowcaseLockupLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  _OWORD *v21;
  _OWORD *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 56, a2 + 56);
  v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 96, a2 + 96);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 176) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 152, a2 + 152);
  v8 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 216) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 192, a2 + 192);
  v9 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 256) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 232, a2 + 232);
  v10 = *(_QWORD *)(a2 + 296);
  v11 = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 296) = v10;
  *(_QWORD *)(a1 + 304) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 272, a2 + 272);
  v12 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 336) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 312, a2 + 312);
  v13 = (_OWORD *)(a1 + 352);
  v14 = (_OWORD *)(a2 + 352);
  v15 = *(_QWORD *)(a2 + 376);
  if (v15)
  {
    v16 = *(_QWORD *)(a2 + 384);
    *(_QWORD *)(a1 + 376) = v15;
    *(_QWORD *)(a1 + 384) = v16;
    (**(void (***)(_OWORD *, _OWORD *))(v15 - 8))(v13, v14);
  }
  else
  {
    v17 = *(_OWORD *)(a2 + 368);
    *v13 = *v14;
    *(_OWORD *)(a1 + 368) = v17;
    *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
  }
  v18 = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 416) = v18;
  (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 392, a2 + 392);
  v19 = *(_QWORD *)(a2 + 456);
  v20 = *(_QWORD *)(a2 + 464);
  *(_QWORD *)(a1 + 456) = v19;
  *(_QWORD *)(a1 + 464) = v20;
  (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 432, a2 + 432);
  v21 = (_OWORD *)(a1 + 472);
  v22 = (_OWORD *)(a2 + 472);
  v23 = *(_QWORD *)(a2 + 496);
  if (v23)
  {
    v24 = *(_QWORD *)(a2 + 504);
    *(_QWORD *)(a1 + 496) = v23;
    *(_QWORD *)(a1 + 504) = v24;
    (**(void (***)(_OWORD *, _OWORD *))(v23 - 8))(v21, v22);
  }
  else
  {
    v25 = *(_OWORD *)(a2 + 488);
    *v21 = *v22;
    *(_OWORD *)(a1 + 488) = v25;
    *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
  }
  v26 = *(_QWORD *)(a2 + 536);
  *(_QWORD *)(a1 + 536) = v26;
  *(_QWORD *)(a1 + 544) = *(_QWORD *)(a2 + 544);
  (**(void (***)(uint64_t, uint64_t))(v26 - 8))(a1 + 512, a2 + 512);
  return a1;
}

uint64_t assignWithCopy for AppShowcaseLockupLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 96), (uint64_t *)(a2 + 96));
  v4 = *(_QWORD *)(a2 + 136);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = v4;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 152), (uint64_t *)(a2 + 152));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 192), (uint64_t *)(a2 + 192));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 232), (uint64_t *)(a2 + 232));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 272), (uint64_t *)(a2 + 272));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 312), (uint64_t *)(a2 + 312));
  v5 = *(_QWORD *)(a2 + 376);
  if (*(_QWORD *)(a1 + 376))
  {
    if (v5)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 352), (uint64_t *)(a2 + 352));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 352);
  }
  else if (v5)
  {
    *(_QWORD *)(a1 + 376) = v5;
    *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
    (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 352, a2 + 352);
    goto LABEL_8;
  }
  v6 = *(_OWORD *)(a2 + 352);
  v7 = *(_OWORD *)(a2 + 368);
  *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
  *(_OWORD *)(a1 + 352) = v6;
  *(_OWORD *)(a1 + 368) = v7;
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 392), (uint64_t *)(a2 + 392));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 432), (uint64_t *)(a2 + 432));
  v8 = *(_QWORD *)(a2 + 496);
  if (!*(_QWORD *)(a1 + 496))
  {
    if (v8)
    {
      *(_QWORD *)(a1 + 496) = v8;
      *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
      (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 472, a2 + 472);
      goto LABEL_15;
    }
LABEL_14:
    v9 = *(_OWORD *)(a2 + 472);
    v10 = *(_OWORD *)(a2 + 488);
    *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
    *(_OWORD *)(a1 + 472) = v9;
    *(_OWORD *)(a1 + 488) = v10;
    goto LABEL_15;
  }
  if (!v8)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 472);
    goto LABEL_14;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 472), (uint64_t *)(a2 + 472));
LABEL_15:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 512), (uint64_t *)(a2 + 512));
  return a1;
}

void *__swift_memcpy552_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x228uLL);
}

uint64_t assignWithTake for AppShowcaseLockupLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  v6 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v6;
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  __swift_destroy_boxed_opaque_existential_1(a1 + 152);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  __swift_destroy_boxed_opaque_existential_1(a1 + 192);
  v7 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v7;
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  __swift_destroy_boxed_opaque_existential_1(a1 + 232);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  __swift_destroy_boxed_opaque_existential_1(a1 + 272);
  v8 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 288) = v8;
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  __swift_destroy_boxed_opaque_existential_1(a1 + 312);
  v9 = *(_OWORD *)(a2 + 328);
  *(_OWORD *)(a1 + 312) = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 328) = v9;
  *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
  if (*(_QWORD *)(a1 + 376))
    __swift_destroy_boxed_opaque_existential_1(a1 + 352);
  v10 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 368) = v10;
  *(_QWORD *)(a1 + 384) = *(_QWORD *)(a2 + 384);
  __swift_destroy_boxed_opaque_existential_1(a1 + 392);
  v11 = *(_OWORD *)(a2 + 408);
  *(_OWORD *)(a1 + 392) = *(_OWORD *)(a2 + 392);
  *(_OWORD *)(a1 + 408) = v11;
  *(_QWORD *)(a1 + 424) = *(_QWORD *)(a2 + 424);
  __swift_destroy_boxed_opaque_existential_1(a1 + 432);
  v12 = *(_OWORD *)(a2 + 448);
  *(_OWORD *)(a1 + 432) = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 448) = v12;
  *(_QWORD *)(a1 + 464) = *(_QWORD *)(a2 + 464);
  if (*(_QWORD *)(a1 + 496))
    __swift_destroy_boxed_opaque_existential_1(a1 + 472);
  *(_QWORD *)(a1 + 504) = *(_QWORD *)(a2 + 504);
  v13 = *(_OWORD *)(a2 + 488);
  *(_OWORD *)(a1 + 472) = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 488) = v13;
  __swift_destroy_boxed_opaque_existential_1(a1 + 512);
  v14 = *(_OWORD *)(a2 + 528);
  *(_OWORD *)(a1 + 512) = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 528) = v14;
  *(_QWORD *)(a1 + 544) = *(_QWORD *)(a2 + 544);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppShowcaseLockupLayout(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 552))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppShowcaseLockupLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 552) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 552) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppShowcaseLockupLayout()
{
  return &type metadata for AppShowcaseLockupLayout;
}

uint64_t destroy for AppShowcaseLockupLayout.Metrics(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 192);
  __swift_destroy_boxed_opaque_existential_1(a1 + 232);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 272);
}

uint64_t initializeWithCopy for AppShowcaseLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 56, a2 + 56);
  v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 96, a2 + 96);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 176) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 152, a2 + 152);
  v8 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 216) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 192, a2 + 192);
  v9 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 256) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 232, a2 + 232);
  v10 = *(_QWORD *)(a2 + 296);
  v11 = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 296) = v10;
  *(_QWORD *)(a1 + 304) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 272, a2 + 272);
  return a1;
}

uint64_t assignWithCopy for AppShowcaseLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 96), (uint64_t *)(a2 + 96));
  v4 = *(_QWORD *)(a2 + 136);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = v4;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 152), (uint64_t *)(a2 + 152));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 192), (uint64_t *)(a2 + 192));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 232), (uint64_t *)(a2 + 232));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 272), (uint64_t *)(a2 + 272));
  return a1;
}

void *__swift_memcpy312_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x138uLL);
}

uint64_t assignWithTake for AppShowcaseLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  v6 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = v6;
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  __swift_destroy_boxed_opaque_existential_1(a1 + 152);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  __swift_destroy_boxed_opaque_existential_1(a1 + 192);
  v7 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v7;
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  __swift_destroy_boxed_opaque_existential_1(a1 + 232);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  __swift_destroy_boxed_opaque_existential_1(a1 + 272);
  v8 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 288) = v8;
  *(_QWORD *)(a1 + 304) = *(_QWORD *)(a2 + 304);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppShowcaseLockupLayout.Metrics(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 312))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppShowcaseLockupLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 312) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 312) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppShowcaseLockupLayout.Metrics()
{
  return &type metadata for AppShowcaseLockupLayout.Metrics;
}

uint64_t sub_1BCBDCE18@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
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
  void (*v27)(_QWORD);
  void (*v28)(_QWORD);
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
  void (*v39)(char *, uint64_t);
  _QWORD *v40;
  void (*v41)(char *, uint64_t);
  char *v42;
  _QWORD *v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  char *v48;
  char v49;
  char v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  unint64_t v87;
  unint64_t v88;
  char v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  uint64_t *v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  unint64_t v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  char *v114;
  char *v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  void (*v122)(char *, uint64_t);
  _QWORD *v123;
  void (*v124)(char *, uint64_t);
  unint64_t v125;
  uint64_t v126;
  __int128 v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unsigned int v133;
  void (*v134)(char *, _QWORD, uint64_t);
  unsigned int v135;
  void (*v136)(char *, _QWORD, uint64_t);
  uint64_t v137;
  char *v138;
  uint64_t v139;
  _QWORD *v140;
  uint64_t v141;
  _OWORD v142[2];
  uint64_t v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;

  v116 = a1;
  v2 = sub_1BCC00AB0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v107 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v111 = sub_1BCC00A68();
  v123 = *(_QWORD **)(v111 - 8);
  v6 = v123;
  MEMORY[0x1E0C80A78](v111);
  v8 = (char *)&v107 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BCC00ABC();
  v137 = *(_QWORD *)(v9 - 8);
  v10 = v137;
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v107 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = sub_1BCC00AE0();
  v121 = *(_QWORD *)(v139 - 8);
  MEMORY[0x1E0C80A78](v139);
  v115 = (char *)&v107 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v110 = (char *)&v107 - v15;
  MEMORY[0x1E0C80A78](v16);
  v112 = (char *)&v107 - v17;
  MEMORY[0x1E0C80A78](v18);
  v117 = (char *)&v107 - v19;
  MEMORY[0x1E0C80A78](v20);
  v109 = (char *)&v107 - v21;
  MEMORY[0x1E0C80A78](v22);
  v108 = (char *)&v107 - v23;
  MEMORY[0x1E0C80A78](v24);
  v26 = (char *)&v107 - v25;
  v140 = v1;
  v138 = (char *)(v1 + 39);
  v113 = sub_1BCC008AC();
  v148 = v113;
  v149 = MEMORY[0x1E0D41BB8];
  __swift_allocate_boxed_opaque_existential_1(&v147);
  sub_1BCC008A0();
  v146 = 0;
  v144 = 0u;
  v145 = 0u;
  v27 = *(void (**)(_QWORD))(v10 + 104);
  v135 = *MEMORY[0x1E0D41F20];
  v136 = (void (*)(char *, _QWORD, uint64_t))v27;
  v27(v12);
  v28 = (void (*)(_QWORD))v6[13];
  v133 = *MEMORY[0x1E0D41EC8];
  v29 = v111;
  v134 = (void (*)(char *, _QWORD, uint64_t))v28;
  v28(v8);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC218);
  v31 = *(unsigned __int8 *)(v3 + 80);
  v32 = (v31 + 32) & ~v31;
  v33 = v32 + *(_QWORD *)(v3 + 72);
  v131 = v30;
  v130 = v33;
  v129 = v31 | 7;
  v34 = swift_allocObject();
  v127 = xmmword_1BCC091B0;
  *(_OWORD *)(v34 + 16) = xmmword_1BCC091B0;
  v132 = v32;
  sub_1BCC00A8C();
  *(_QWORD *)&v142[0] = v34;
  v35 = sub_1BCBDE1D4();
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC208);
  v37 = sub_1BCBDC244();
  v126 = v36;
  v125 = v37;
  v128 = v35;
  v38 = v26;
  sub_1BCC00EDC();
  sub_1BCC00AD4();
  v39 = *(void (**)(char *, uint64_t))(v3 + 8);
  v114 = v5;
  v118 = v2;
  v124 = v39;
  v39(v5, v2);
  v40 = (_QWORD *)v123[1];
  v138 = v8;
  v123 = v40;
  ((void (*)(char *, uint64_t))v40)(v8, v29);
  v41 = *(void (**)(char *, uint64_t))(v137 + 8);
  v42 = v12;
  v137 = v9;
  v122 = v41;
  v41(v12, v9);
  sub_1BCBDC2D4((uint64_t)&v144, &qword_1ED1BC1F8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v147);
  v43 = (_QWORD *)sub_1BCBDE21C(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v45 = v43[2];
  v44 = v43[3];
  if (v45 >= v44 >> 1)
    v43 = (_QWORD *)sub_1BCBDE21C(v44 > 1, v45 + 1, 1, v43);
  v43[2] = v45 + 1;
  v120 = (*(unsigned __int8 *)(v121 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v121 + 80);
  v119 = *(_QWORD *)(v121 + 72);
  v121 = *(_QWORD *)(v121 + 32);
  ((void (*)(char *, char *, uint64_t))v121)((char *)v43 + v120 + v119 * v45, v38, v139);
  v46 = v140;
  v47 = v140 + 49;
  sub_1BCBDB05C((uint64_t)(v140 + 49), (uint64_t)&v147);
  __swift_project_boxed_opaque_existential_1(&v147, v148);
  sub_1BCC008DC();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v147);
  __swift_project_boxed_opaque_existential_1(v46 + 49, v46[52]);
  sub_1BCC008C4();
  sub_1BCBDAE7C((uint64_t)(v46 + 44), (uint64_t)&v144, &qword_1ED1BC8A8);
  v48 = v114;
  if (!*((_QWORD *)&v145 + 1))
  {
    sub_1BCBDC2D4((uint64_t)&v144, &qword_1ED1BC8A8);
LABEL_14:
    v67 = v118;
    v68 = v140[52];
    v69 = v140[53];
    v70 = __swift_project_boxed_opaque_existential_1(v47, v68);
    v148 = v68;
    v149 = *(_QWORD *)(v69 + 8);
    v71 = __swift_allocate_boxed_opaque_existential_1(&v147);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v68 - 8) + 16))(v71, v70, v68);
    v146 = 0;
    v144 = 0u;
    v145 = 0u;
    v72 = v137;
    v136(v42, v135, v137);
    v73 = v138;
    v134(v138, v133, v29);
    v74 = swift_allocObject();
    *(_OWORD *)(v74 + 16) = v127;
    sub_1BCC00A8C();
    *(_QWORD *)&v142[0] = v74;
    sub_1BCC00EDC();
    sub_1BCC00AD4();
    v124(v48, v67);
    ((void (*)(char *, uint64_t))v123)(v73, v29);
    v122(v42, v72);
    sub_1BCBDC2D4((uint64_t)&v144, &qword_1ED1BC1F8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v147);
    v76 = v43[2];
    v75 = v43[3];
    if (v76 >= v75 >> 1)
      v43 = (_QWORD *)sub_1BCBDE21C(v75 > 1, v76 + 1, 1, v43);
    v43[2] = v76 + 1;
    ((void (*)(char *, char *, uint64_t))v121)((char *)v43 + v120 + v76 * v119, v117, v139);
    goto LABEL_17;
  }
  sub_1BCBDB3C8(&v144, (uint64_t)&v147);
  __swift_project_boxed_opaque_existential_1(&v147, v148);
  v49 = sub_1BCC006F0();
  sub_1BCBDB05C((uint64_t)&v147, (uint64_t)&v144);
  if ((v49 & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v144);
LABEL_13:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v147);
    goto LABEL_14;
  }
  __swift_project_boxed_opaque_existential_1(&v144, *((uint64_t *)&v145 + 1));
  v50 = sub_1BCC006C0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v144);
  if ((v50 & 1) == 0)
    goto LABEL_13;
  v146 = 0;
  v144 = 0u;
  v145 = 0u;
  v51 = v137;
  v136(v42, v135, v137);
  v52 = v138;
  v134(v138, v133, v29);
  v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = v127;
  sub_1BCC00A8C();
  *(_QWORD *)&v142[0] = v53;
  v54 = v118;
  sub_1BCC00EDC();
  v55 = v54;
  sub_1BCC00AD4();
  v124(v48, v54);
  ((void (*)(char *, uint64_t))v123)(v52, v29);
  v122(v42, v51);
  sub_1BCBDC2D4((uint64_t)&v144, &qword_1ED1BC1F8);
  v57 = v43[2];
  v56 = v43[3];
  if (v57 >= v56 >> 1)
    v43 = (_QWORD *)sub_1BCBDE21C(v56 > 1, v57 + 1, 1, v43);
  v43[2] = v57 + 1;
  ((void (*)(char *, char *, uint64_t))v121)((char *)v43 + v120 + v57 * v119, v108, v139);
  v58 = v140[52];
  v59 = v140[53];
  v60 = __swift_project_boxed_opaque_existential_1(v47, v58);
  *((_QWORD *)&v145 + 1) = v58;
  v146 = *(_QWORD *)(v59 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v144);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v58 - 8) + 16))(boxed_opaque_existential_1, v60, v58);
  v143 = 0;
  memset(v142, 0, sizeof(v142));
  v62 = v137;
  v136(v42, v135, v137);
  v63 = v138;
  v134(v138, v133, v29);
  v64 = swift_allocObject();
  *(_OWORD *)(v64 + 16) = v127;
  sub_1BCC00A8C();
  v141 = v64;
  sub_1BCC00EDC();
  sub_1BCC00AD4();
  v124(v48, v55);
  ((void (*)(char *, uint64_t))v123)(v63, v29);
  v122(v42, v62);
  sub_1BCBDC2D4((uint64_t)v142, &qword_1ED1BC1F8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v144);
  v66 = v43[2];
  v65 = v43[3];
  if (v66 >= v65 >> 1)
    v43 = (_QWORD *)sub_1BCBDE21C(v65 > 1, v66 + 1, 1, v43);
  v43[2] = v66 + 1;
  ((void (*)(char *, char *, uint64_t))v121)((char *)v43 + v120 + v66 * v119, v109, v139);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v147);
LABEL_17:
  v77 = v140;
  __swift_project_boxed_opaque_existential_1(v140 + 54, v140[57]);
  sub_1BCC008DC();
  __swift_project_boxed_opaque_existential_1(v77 + 54, v77[57]);
  sub_1BCC008C4();
  v78 = v77[57];
  v79 = v77[58];
  v80 = __swift_project_boxed_opaque_existential_1(v77 + 54, v78);
  v148 = v78;
  v149 = *(_QWORD *)(v79 + 8);
  v81 = __swift_allocate_boxed_opaque_existential_1(&v147);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v78 - 8) + 16))(v81, v80, v78);
  sub_1BCBDB05C((uint64_t)(v77 + 24), (uint64_t)&v144);
  v82 = v137;
  v136(v42, v135, v137);
  v83 = swift_allocObject();
  *(_OWORD *)(v83 + 16) = v127;
  sub_1BCC00AA4();
  *(_QWORD *)&v142[0] = v83;
  v84 = v118;
  sub_1BCC00EDC();
  v85 = v138;
  v134(v138, v133, v29);
  v86 = v112;
  sub_1BCC00AD4();
  ((void (*)(char *, uint64_t))v123)(v85, v29);
  v124(v48, v84);
  v122(v42, v82);
  sub_1BCBDC2D4((uint64_t)&v144, &qword_1ED1BC1F8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v147);
  v88 = v43[2];
  v87 = v43[3];
  if (v88 >= v87 >> 1)
    v43 = (_QWORD *)sub_1BCBDE21C(v87 > 1, v88 + 1, 1, v43);
  v43[2] = v88 + 1;
  ((void (*)(char *, char *, uint64_t))v121)((char *)v43 + v120 + v88 * v119, v86, v139);
  sub_1BCBDAE7C((uint64_t)(v140 + 59), (uint64_t)&v144, &qword_1ED1BC8B0);
  if (*((_QWORD *)&v145 + 1))
  {
    sub_1BCBDB3C8(&v144, (uint64_t)&v147);
    __swift_project_boxed_opaque_existential_1(&v147, v148);
    v89 = sub_1BCC006F0();
    sub_1BCBDB05C((uint64_t)&v147, (uint64_t)&v144);
    if ((v89 & 1) != 0)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v144);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(&v144, *((uint64_t *)&v145 + 1));
      v90 = sub_1BCC006C0();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v144);
      if ((v90 & 1) != 0)
      {
        v91 = v148;
        v92 = v149;
        v93 = __swift_project_boxed_opaque_existential_1(&v147, v148);
        *((_QWORD *)&v145 + 1) = v91;
        v146 = *(_QWORD *)(v92 + 8);
        v94 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v144);
        (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v91 - 8) + 16))(v94, v93, v91);
        sub_1BCBDB05C((uint64_t)(v140 + 34), (uint64_t)v142);
        v95 = v137;
        v136(v42, v135, v137);
        v96 = v138;
        v134(v138, v133, v29);
        v97 = swift_allocObject();
        *(_OWORD *)(v97 + 16) = v127;
        sub_1BCC00A8C();
        v141 = v97;
        sub_1BCC00EDC();
        sub_1BCC00AD4();
        v124(v48, v84);
        ((void (*)(char *, uint64_t))v123)(v96, v29);
        v122(v42, v95);
        sub_1BCBDC2D4((uint64_t)v142, &qword_1ED1BC1F8);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v144);
        v99 = v43[2];
        v98 = v43[3];
        if (v99 >= v98 >> 1)
          v43 = (_QWORD *)sub_1BCBDE21C(v98 > 1, v99 + 1, 1, v43);
        v43[2] = v99 + 1;
        ((void (*)(char *, char *, uint64_t))v121)((char *)v43 + v120 + v99 * v119, v110, v139);
      }
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v147);
  }
  else
  {
    sub_1BCBDC2D4((uint64_t)&v144, &qword_1ED1BC8B0);
  }
  v100 = v115;
  v148 = v113;
  v149 = MEMORY[0x1E0D41BB8];
  __swift_allocate_boxed_opaque_existential_1(&v147);
  sub_1BCC008A0();
  v146 = 0;
  v144 = 0u;
  v145 = 0u;
  v101 = v137;
  v136(v42, v135, v137);
  v102 = v138;
  v134(v138, v133, v29);
  v103 = swift_allocObject();
  *(_OWORD *)(v103 + 16) = v127;
  sub_1BCC00A8C();
  *(_QWORD *)&v142[0] = v103;
  sub_1BCC00EDC();
  sub_1BCC00AD4();
  v124(v48, v84);
  ((void (*)(char *, uint64_t))v123)(v102, v29);
  v122(v42, v101);
  sub_1BCBDC2D4((uint64_t)&v144, &qword_1ED1BC1F8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v147);
  v105 = v43[2];
  v104 = v43[3];
  if (v105 >= v104 >> 1)
    v43 = (_QWORD *)sub_1BCBDE21C(v104 > 1, v105 + 1, 1, v43);
  v43[2] = v105 + 1;
  ((void (*)(char *, char *, uint64_t))v121)((char *)v43 + v120 + v105 * v119, v100, v139);
  return sub_1BCC00AC8();
}

uint64_t sub_1BCBDE038()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_1BCC00AF8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCBDCE18((uint64_t)v3);
  sub_1BCC00A80();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_1BCBDE0FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  double v4;
  double v5;
  uint64_t v7;

  v0 = sub_1BCC00AF8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCBDCE18((uint64_t)v3);
  sub_1BCC00A74();
  v5 = v4;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

uint64_t sub_1BCBDE1C8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BCBDE394(v1, a1);
}

unint64_t sub_1BCBDE1D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED1BC200;
  if (!qword_1ED1BC200)
  {
    v1 = sub_1BCC00AB0();
    result = MEMORY[0x1BCCFEBCC](MEMORY[0x1E0D41F18], v1);
    atomic_store(result, (unint64_t *)&qword_1ED1BC200);
  }
  return result;
}

size_t sub_1BCBDE21C(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D100);
  v10 = *(_QWORD *)(sub_1BCC00AE0() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_1BCC00AE0() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_1BCBDE394(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for AppShowcaseLockupLayout.Metrics(a2, a1);
  return a2;
}

uint64_t sub_1BCBDE3C8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  double IconSize;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_1;
  void (*v11)(uint64_t *, _QWORD *, uint64_t);
  void (*v12)(_QWORD *, uint64_t);
  void *v13;
  void (*v14)(_QWORD *, uint64_t, uint64_t);
  uint64_t *v15;
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t *v21;
  id v22;
  void *v23;
  void (*v24)(_QWORD *, uint64_t, uint64_t);
  uint64_t *v25;
  id v26;
  uint64_t *v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  id v31;
  void (*v32)(_QWORD *, uint64_t, uint64_t);
  uint64_t *v33;
  id v34;
  void (*v35)(_QWORD *, uint64_t);
  uint64_t *v36;
  id v37;
  uint64_t v38;
  uint64_t *v39;
  id v40;
  uint64_t v42;
  void (*v43)(_QWORD *, uint64_t);
  unsigned int v44;
  id v45;
  void (*v46)(_QWORD *, uint64_t, uint64_t);
  uint64_t v47[5];
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;

  v0 = sub_1BCC00654();
  v1 = *(_QWORD **)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (uint64_t *)((char *)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  IconSize = ASCLockupViewSizeGetIconSize(CFSTR("small"), 1);
  v6 = v5;
  v91 = MEMORY[0x1E0DEB070];
  v92 = MEMORY[0x1E0D425E8];
  *(_QWORD *)&v90 = 0x4024000000000000;
  v7 = (void *)*MEMORY[0x1E0DC4AB8];
  *v3 = *MEMORY[0x1E0DC4AB8];
  v8 = *MEMORY[0x1E0D418E0];
  v46 = (void (*)(_QWORD *, uint64_t, uint64_t))v1[13];
  v46(v3, v8, v0);
  v9 = sub_1BCC009E4();
  v88 = v9;
  v89 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v87);
  v85 = v0;
  v86 = MEMORY[0x1E0D418E8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v84);
  v11 = (void (*)(uint64_t *, _QWORD *, uint64_t))v1[2];
  v11(boxed_opaque_existential_1, v3, v0);
  v45 = v7;
  sub_1BCC009F0();
  v12 = (void (*)(_QWORD *, uint64_t))v1[1];
  v12(v3, v0);
  v13 = (void *)*MEMORY[0x1E0DC4A88];
  *v3 = *MEMORY[0x1E0DC4A88];
  v14 = v46;
  v46(v3, v8, v0);
  v85 = v9;
  v86 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v84);
  v82 = v0;
  v83 = MEMORY[0x1E0D418E8];
  v15 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v81);
  v11(v15, v3, v0);
  v16 = v13;
  sub_1BCC009F0();
  v12(v3, v0);
  *v3 = v16;
  v14(v3, v8, v0);
  v82 = v9;
  v83 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v81);
  v79 = v0;
  v80 = MEMORY[0x1E0D418E8];
  v17 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v78);
  v11(v17, v3, v0);
  v18 = v16;
  sub_1BCC009F0();
  v12(v3, v0);
  *v3 = v18;
  v14(v3, v8, v0);
  v79 = v9;
  v80 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v78);
  v76 = v0;
  v77 = MEMORY[0x1E0D418E8];
  v19 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v75);
  v11(v19, v3, v0);
  v20 = v18;
  sub_1BCC009F0();
  v12(v3, v0);
  *v3 = v20;
  v14(v3, v8, v0);
  v76 = v9;
  v77 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v75);
  v73 = v0;
  v74 = MEMORY[0x1E0D418E8];
  v21 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v72);
  v11(v21, v3, v0);
  v22 = v20;
  sub_1BCC009F0();
  v12(v3, v0);
  v23 = v45;
  v24 = v46;
  *v3 = v45;
  v24(v3, v8, v0);
  v73 = v9;
  v74 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v72);
  v70 = v0;
  v71 = MEMORY[0x1E0D418E8];
  v25 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v69);
  v11(v25, v3, v0);
  v26 = v23;
  sub_1BCC009F0();
  v12(v3, v0);
  *v3 = v26;
  v24(v3, v8, v0);
  v70 = v9;
  v71 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v69);
  v67 = v0;
  v68 = MEMORY[0x1E0D418E8];
  v27 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v66);
  v11(v27, v3, v0);
  v28 = v26;
  sub_1BCC009F0();
  v43 = v12;
  v12(v3, v0);
  *v3 = v28;
  v24(v3, v8, v0);
  v67 = v9;
  v29 = v9;
  v68 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v66);
  v64 = v0;
  v65 = MEMORY[0x1E0D418E8];
  v30 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v63);
  v11(v30, v3, v0);
  v31 = v28;
  sub_1BCC009F0();
  v12(v3, v0);
  *v3 = v31;
  v44 = v8;
  v32 = v46;
  v46(v3, v8, v0);
  v64 = v29;
  v65 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v63);
  v61 = v0;
  v62 = MEMORY[0x1E0D418E8];
  v33 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v60);
  v11(v33, v3, v0);
  v34 = v31;
  sub_1BCC009F0();
  v35 = v43;
  v43(v3, v0);
  *v3 = v34;
  v32(v3, v8, v0);
  v61 = v29;
  v62 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v60);
  v58 = v0;
  v59 = MEMORY[0x1E0D418E8];
  v36 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v57);
  v11(v36, v3, v0);
  v37 = v34;
  sub_1BCC009F0();
  v35(v3, v0);
  v59 = MEMORY[0x1E0D425E8];
  v58 = MEMORY[0x1E0DEB070];
  v56 = MEMORY[0x1E0D425E8];
  *(_QWORD *)&v57 = 0x4024000000000000;
  v55 = MEMORY[0x1E0DEB070];
  v53 = MEMORY[0x1E0D425E8];
  *(_QWORD *)&v54 = 0x4014000000000000;
  v52 = MEMORY[0x1E0DEB070];
  v38 = MEMORY[0x1E0DEB070];
  *(_QWORD *)&v51 = 0x401C000000000000;
  *v3 = v37;
  v32(v3, v44, v0);
  v49 = v29;
  v50 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v48);
  v47[3] = v0;
  v47[4] = MEMORY[0x1E0D418E8];
  v39 = __swift_allocate_boxed_opaque_existential_1(v47);
  v11(v39, v3, v0);
  v40 = v37;
  sub_1BCC009F0();
  v35(v3, v0);
  qword_1EF48D398 = v38;
  qword_1EF48D3A0 = MEMORY[0x1E0D425E8];
  qword_1EF48D380 = 0x4040000000000000;
  qword_1EF48D3C0 = v38;
  qword_1EF48D3C8 = MEMORY[0x1E0D425E8];
  qword_1EF48D3A8 = 0x4024000000000000;
  qword_1EF48D108 = *(_QWORD *)&IconSize;
  unk_1EF48D110 = v6;
  sub_1BCBDB3C8(&v90, (uint64_t)&unk_1EF48D118);
  sub_1BCBDB3C8(&v87, (uint64_t)&unk_1EF48D140);
  sub_1BCBDB3C8(&v84, (uint64_t)&unk_1EF48D168);
  sub_1BCBDB3C8(&v81, (uint64_t)&unk_1EF48D190);
  sub_1BCBDB3C8(&v78, (uint64_t)&unk_1EF48D1B8);
  sub_1BCBDB3C8(&v75, (uint64_t)&unk_1EF48D1E0);
  sub_1BCBDB3C8(&v72, (uint64_t)&unk_1EF48D208);
  sub_1BCBDB3C8(&v69, (uint64_t)&unk_1EF48D230);
  sub_1BCBDB3C8(&v66, (uint64_t)&unk_1EF48D258);
  sub_1BCBDB3C8(&v63, (uint64_t)&unk_1EF48D280);
  sub_1BCBDB3C8(&v60, (uint64_t)&unk_1EF48D2A8);
  xmmword_1EF48D2D0 = xmmword_1BCC09520;
  sub_1BCBDB3C8(&v57, (uint64_t)&unk_1EF48D2E0);
  sub_1BCBDB3C8(&v54, (uint64_t)&unk_1EF48D308);
  sub_1BCBDB3C8(&v51, (uint64_t)&unk_1EF48D330);
  return sub_1BCBDB3C8(&v48, (uint64_t)&unk_1EF48D358);
}

uint64_t sub_1BCBDEB3C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  double IconSize;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD);
  uint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;
  void (*v14)(_QWORD *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t *, _QWORD *, uint64_t);
  void (*v19)(_QWORD *, uint64_t);
  uint64_t v20;
  void (*v21)(_QWORD *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t *v29;
  void (*v30)(_QWORD *, uint64_t);
  uint64_t v31;
  uint64_t *v32;
  void (*v33)(uint64_t *, _QWORD *, uint64_t);
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  id v38;
  uint64_t *v39;
  id v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(_QWORD *, uint64_t, uint64_t);
  void (*v45)(_QWORD *, uint64_t);
  unsigned int v46;
  void (*v47)(_QWORD *, uint64_t, uint64_t);
  void (*v48)(uint64_t *, _QWORD *, uint64_t);
  uint64_t v49[5];
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;

  v0 = sub_1BCC00654();
  v1 = *(_QWORD **)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (uint64_t *)((char *)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (void *)sub_1BCC00DBC();
  IconSize = ASCLockupViewSizeGetIconSize(v4, 1);
  v7 = v6;

  if (qword_1EF48CFF8 != -1)
    swift_once();
  v8 = sub_1BCC0078C();
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_1EF48D400);
  v47 = *(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  v47(v3, v9, v8);
  v10 = (void (*)(_QWORD))v1[13];
  v46 = *MEMORY[0x1E0D418D8];
  v44 = (void (*)(_QWORD *, uint64_t, uint64_t))v10;
  v10(v3);
  v11 = sub_1BCC009E4();
  v69 = v11;
  v70 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v68);
  v66 = v0;
  v67 = MEMORY[0x1E0D418E8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v65);
  v48 = (void (*)(uint64_t *, _QWORD *, uint64_t))v1[2];
  v48(boxed_opaque_existential_1, v3, v0);
  sub_1BCC009F0();
  v45 = (void (*)(_QWORD *, uint64_t))v1[1];
  v45(v3, v0);
  if (qword_1EF48CFE8 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v8, (uint64_t)qword_1EF48D3D0);
  v14 = v47;
  v47(v3, v13, v8);
  v15 = v46;
  v44(v3, v46, v0);
  v66 = v11;
  v67 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v65);
  v63 = v0;
  v64 = MEMORY[0x1E0D418E8];
  v16 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v62);
  v17 = v11;
  v18 = v48;
  v48(v16, v3, v0);
  sub_1BCC009F0();
  v19 = v45;
  v45(v3, v0);
  v43 = v8;
  v14(v3, v13, v8);
  v20 = v17;
  v21 = v44;
  v44(v3, v15, v0);
  v63 = v17;
  v22 = MEMORY[0x1E0D41DD0];
  v64 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v62);
  v60 = v0;
  v61 = MEMORY[0x1E0D418E8];
  v23 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v59);
  v18(v23, v3, v0);
  sub_1BCC009F0();
  v19(v3, v0);
  v24 = v22;
  if (qword_1EF48CFF0 != -1)
    swift_once();
  v25 = v43;
  v26 = __swift_project_value_buffer(v43, (uint64_t)qword_1EF48D3E8);
  v27 = v47;
  v47(v3, v26, v25);
  v28 = v46;
  v21(v3, v46, v0);
  v60 = v20;
  v61 = v24;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v59);
  v57 = v0;
  v58 = MEMORY[0x1E0D418E8];
  v29 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v56);
  v48(v29, v3, v0);
  sub_1BCC009F0();
  v30 = v45;
  v45(v3, v0);
  v27(v3, v26, v25);
  v21(v3, v28, v0);
  v31 = v20;
  v42 = v20;
  v57 = v20;
  v58 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v56);
  v54 = v0;
  v55 = MEMORY[0x1E0D418E8];
  v32 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v53);
  v33 = v48;
  v48(v32, v3, v0);
  sub_1BCC009F0();
  v30(v3, v0);
  v34 = (void *)*MEMORY[0x1E0DC4AB8];
  *v3 = *MEMORY[0x1E0DC4AB8];
  v35 = *MEMORY[0x1E0D418E0];
  v21(v3, v35, v0);
  v54 = v31;
  v55 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v53);
  v51 = v0;
  v36 = MEMORY[0x1E0D418E8];
  v52 = MEMORY[0x1E0D418E8];
  v37 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v50);
  v33(v37, v3, v0);
  v38 = v34;
  sub_1BCC009F0();
  v30(v3, v0);
  *v3 = v38;
  v21(v3, v35, v0);
  v51 = v42;
  v52 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v50);
  v49[3] = v0;
  v49[4] = v36;
  v39 = __swift_allocate_boxed_opaque_existential_1(v49);
  v33(v39, v3, v0);
  v40 = v38;
  sub_1BCC009F0();
  v30(v3, v0);
  qword_1EF48FB00 = *(_QWORD *)&IconSize;
  unk_1EF48FB08 = v7;
  sub_1BCBDB3C8(&v68, (uint64_t)&unk_1EF48FB10);
  sub_1BCBDB3C8(&v65, (uint64_t)&unk_1EF48FB38);
  sub_1BCBDB3C8(&v62, (uint64_t)&unk_1EF48FB60);
  sub_1BCBDB3C8(&v59, (uint64_t)&unk_1EF48FB98);
  sub_1BCBDB3C8(&v56, (uint64_t)&unk_1EF48FBC0);
  sub_1BCBDB3C8(&v53, (uint64_t)&unk_1EF48FBE8);
  result = sub_1BCBDB3C8(&v50, (uint64_t)&unk_1EF48FC10);
  qword_1EF48FB88 = 2;
  byte_1EF48FB90 = 0;
  return result;
}

id static ASCLayoutProxy.adLockupLayout(traitCollection:artworkView:headingText:titleText:subtitleText:offerText:offerButton:starRatingView:ratingCountLabel:adTransparencyButton:editorsChoiceView:descriptionLabel:)(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, void *a12)
{
  return sub_1BCBE065C(a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

uint64_t sub_1BCBDF2FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v18;

  v8 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v15 = objc_msgSend(v14, sel_userInterfaceIdiom);

  if ((unint64_t)v15 > 1)
    sub_1BCC0075C();
  else
    sub_1BCC00780();
  v16 = sub_1BCC00774();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 0, 1, v16);
  sub_1BCBEC668(a2, a3, a1, (uint64_t)v10);
  sub_1BCBECA90(a2, a3, (uint64_t)v13, (uint64_t)v10, a4);
  sub_1BCBE31A4((uint64_t)v10, type metadata accessor for LockupMediaLayout.DisplayType);
  sub_1BCBE3224((uint64_t)v13);
  sub_1BCBECD84((uint64_t)v10);
  return sub_1BCBE3264((uint64_t)v10, a4);
}

id static ASCLayoutProxy.lockupMediaSizingLayout(for:screenshots:trailers:containerView:mediaViews:)(uint64_t a1, uint64_t a2, void *a3, void *a4, unint64_t a5)
{
  objc_class *v5;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t *boxed_opaque_existential_1;
  id v21;
  id v22;
  objc_super v24;
  uint64_t v25[6];

  v11 = type metadata accessor for LockupMediaLayout(0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (id *)((char *)&v24.receiver - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = type metadata accessor for LockupMediaLayout.Metrics(0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCBDF2FC(a1, a2, a3, (uint64_t)v16);
  sub_1BCBE31E0((uint64_t)v16, (uint64_t)v13 + *(int *)(v11 + 24), type metadata accessor for LockupMediaLayout.Metrics);
  v17 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  v18 = MEMORY[0x1E0D42690];
  v13[3] = v17;
  v13[4] = v18;
  *v13 = a4;
  v19 = a4;
  v13[5] = sub_1BCBDF66C(a5);
  v25[3] = v11;
  v25[4] = sub_1BCBE0BD8(&qword_1EF48D430, (uint64_t)&unk_1BCC099D8);
  v25[5] = sub_1BCBE0BD8(&qword_1EF48D438, (uint64_t)&unk_1BCC099B0);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v25);
  sub_1BCBE31E0((uint64_t)v13, (uint64_t)boxed_opaque_existential_1, type metadata accessor for LockupMediaLayout);
  v21 = objc_allocWithZone(v5);
  sub_1BCBE0C18((uint64_t)v25, (uint64_t)v21 + OBJC_IVAR_____ASCLayoutProxy_base);
  v24.receiver = v21;
  v24.super_class = v5;
  v22 = objc_msgSendSuper2(&v24, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  sub_1BCBE31A4((uint64_t)v13, type metadata accessor for LockupMediaLayout);
  sub_1BCBE31A4((uint64_t)v16, type metadata accessor for LockupMediaLayout.Metrics);
  return v22;
}

_QWORD *sub_1BCBDF66C(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void **v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1BCC00F30();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x1E0DEE9D8];
  if (!v2)
    return (_QWORD *)v3;
  v19 = MEMORY[0x1E0DEE9D8];
  result = sub_1BCBE0418(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v3 = v19;
    if ((a1 & 0xC000000000000001) != 0)
    {
      v5 = 0;
      v6 = MEMORY[0x1E0D42690];
      do
      {
        v7 = MEMORY[0x1BCCFE2E4](v5, a1);
        v19 = v3;
        v9 = *(_QWORD *)(v3 + 16);
        v8 = *(_QWORD *)(v3 + 24);
        if (v9 >= v8 >> 1)
        {
          sub_1BCBE0418((_QWORD *)(v8 > 1), v9 + 1, 1);
          v3 = v19;
        }
        ++v5;
        v17 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
        v18 = v6;
        *(_QWORD *)&v16 = v7;
        *(_QWORD *)(v3 + 16) = v9 + 1;
        sub_1BCBDB3C8(&v16, v3 + 40 * v9 + 32);
      }
      while (v2 != v5);
    }
    else
    {
      v10 = (void **)(a1 + 32);
      v11 = MEMORY[0x1E0D42690];
      do
      {
        v12 = *v10;
        v19 = v3;
        v14 = *(_QWORD *)(v3 + 16);
        v13 = *(_QWORD *)(v3 + 24);
        v15 = v12;
        if (v14 >= v13 >> 1)
        {
          sub_1BCBE0418((_QWORD *)(v13 > 1), v14 + 1, 1);
          v3 = v19;
        }
        v17 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
        v18 = v11;
        *(_QWORD *)&v16 = v15;
        *(_QWORD *)(v3 + 16) = v14 + 1;
        sub_1BCBDB3C8(&v16, v3 + 40 * v14 + 32);
        ++v10;
        --v2;
      }
      while (v2);
    }
    return (_QWORD *)v3;
  }
  __break(1u);
  return result;
}

double static ASCLayoutProxy.lockupMediaPreferredMediaSize(fitting:for:with:and:in:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  double v11;
  double v12;
  uint64_t v14;

  v8 = type metadata accessor for LockupMediaLayout.Metrics(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCBDF2FC(a1, a2, a3, (uint64_t)v10);
  sub_1BCBF0C78((uint64_t)v10, a4);
  v12 = v11;
  sub_1BCBE31A4((uint64_t)v10, type metadata accessor for LockupMediaLayout.Metrics);
  return v12;
}

uint64_t static ASCLayoutProxy.artwork(from:and:)(uint64_t a1, void *a2)
{
  return sub_1BCBED560(a1, a2, 0, 1);
}

uint64_t sub_1BCBDFE84(uint64_t a1)
{
  return sub_1BCBDFFEC(a1, qword_1EF48D3D0, MEMORY[0x1E0DC4B70], 0xED0000656C746954, (uint64_t)j___s18AppStoreComponents14ASCLayoutProxyC28lockupTitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0);
}

uint64_t sub_1BCBDFEF0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v0 = sub_1BCC0078C();
  __swift_allocate_value_buffer(v0, qword_1EF48D3E8);
  v1 = (_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_1EF48D3E8);
  v2 = *MEMORY[0x1E0DC4B88];
  *v1 = 0xD000000000000010;
  v1[1] = 0x80000001BCC0DF90;
  v1[2] = j___s18AppStoreComponents14ASCLayoutProxyC31lockupSubtitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0;
  v1[3] = 0;
  v1[4] = v2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 - 8) + 104))();
}

uint64_t sub_1BCBDFFC0(uint64_t a1)
{
  return sub_1BCBDFFEC(a1, qword_1EF48D400, MEMORY[0x1E0DC4B90], 0xEF676E6964616548, (uint64_t)j___s18AppStoreComponents14ASCLayoutProxyC30lockupHeadingPointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0);
}

uint64_t sub_1BCBDFFEC(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v9 = sub_1BCC0078C();
  __swift_allocate_value_buffer(v9, a2);
  v10 = (_QWORD *)__swift_project_value_buffer(v9, (uint64_t)a2);
  v11 = *a3;
  *v10 = 0x70756B636F4C6461;
  v10[1] = a4;
  v10[2] = a5;
  v10[3] = 0;
  v10[4] = v11;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v9 - 8) + 104))();
}

uint64_t sub_1BCBE00BC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v0 = sub_1BCC0078C();
  __swift_allocate_value_buffer(v0, qword_1EF48D418);
  v1 = (_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_1EF48D418);
  v2 = *MEMORY[0x1E0DC4B90];
  *v1 = 0xD000000000000019;
  v1[1] = 0x80000001BCC0DFB0;
  v1[2] = j___s18AppStoreComponents14ASCLayoutProxyC42adTransparencyButtonTitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentK8CategoryaFZ_0;
  v1[3] = 0;
  v1[4] = v2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 - 8) + 104))();
}

double static ASCLayoutProxy.adTransparencyButtonScaledCapInset(_:in:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *boxed_opaque_existential_1;
  double v7;
  double v8;
  uint64_t v11[5];

  v0 = sub_1BCC00654();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v11[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EF48D000 != -1)
    swift_once();
  v4 = sub_1BCC0078C();
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1EF48D418);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(v3, v5, v4);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0D418D8], v0);
  v11[3] = v0;
  v11[4] = MEMORY[0x1E0D418E8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  (*(void (**)(uint64_t *, char *, uint64_t))(v1 + 16))(boxed_opaque_existential_1, v3, v0);
  sub_1BCC0063C();
  v8 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v8;
}

_QWORD *sub_1BCBE0418(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_1BCBE0434(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_1BCBE0434(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D450);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC8A0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void (*sub_1BCBE0568(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1BCBE05E8(v6, a2, a3);
  return sub_1BCBE05BC;
}

void sub_1BCBE05BC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1BCBE05E8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x1BCCFE2E4](a2, a3);
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
    return sub_1BCBE0654;
  }
  __break(1u);
  return result;
}

void sub_1BCBE0654(id *a1)
{

}

id sub_1BCBE065C(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
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
  objc_class *v37;
  id v38;
  id v39;
  void *v41;
  void *v42;
  void *v43;
  objc_super v44;
  _QWORD __src[149];
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  _OWORD v67[2];
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  __int128 __dst[75];

  if (qword_1EF48CFD8 != -1)
    swift_once();
  sub_1BCBDAE08((uint64_t)&qword_1EF48D108, (uint64_t)&v79);
  v41 = a1;
  v78 = a1;
  v19 = MEMORY[0x1E0D426C0];
  if (a2)
  {
    v77 = MEMORY[0x1E0D426C0];
    *((_QWORD *)&v76 + 1) = sub_1BCBE32A8(0, &qword_1ED1BC8D0);
    *(_QWORD *)&v75 = a2;
  }
  else
  {
    v77 = 0;
    v76 = 0u;
    v75 = 0u;
  }
  v20 = sub_1BCBE32A8(0, &qword_1ED1BC8D0);
  v21 = v20;
  v74 = v19;
  v73 = v20;
  *(_QWORD *)&v72 = a3;
  v71 = v19;
  v70 = v20;
  *(_QWORD *)&v69 = a4;
  v68 = 0;
  memset(v67, 0, sizeof(v67));
  if (a5)
  {
    v66 = v19;
    *((_QWORD *)&v65 + 1) = v20;
    *(_QWORD *)&v64 = a5;
  }
  else
  {
    v66 = 0;
    v65 = 0uLL;
    v64 = 0uLL;
  }
  v22 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  v63 = MEMORY[0x1E0D42690];
  v62 = v22;
  *(_QWORD *)&v61 = a6;
  v43 = a5;
  if (a7)
  {
    v60 = MEMORY[0x1E0D42690];
    *((_QWORD *)&v59 + 1) = v22;
    *(_QWORD *)&v58 = a7;
  }
  else
  {
    v60 = 0;
    v59 = 0u;
    v58 = 0u;
  }
  v42 = a7;
  if (a8)
  {
    v57 = v19;
    *((_QWORD *)&v56 + 1) = v21;
    v23 = a8;
    *(_QWORD *)&v55 = a8;
  }
  else
  {
    v23 = 0;
    v57 = 0;
    v56 = 0u;
    v55 = 0u;
  }
  v24 = a3;
  if (!a10)
  {
    v54 = 0;
    v53 = 0u;
    v52 = 0u;
    v25 = a11;
    if (a9)
      goto LABEL_17;
LABEL_19:
    v51 = 0;
    v50 = 0u;
    v49 = 0u;
    goto LABEL_20;
  }
  v54 = MEMORY[0x1E0D42690];
  *((_QWORD *)&v53 + 1) = v22;
  *(_QWORD *)&v52 = a10;
  v25 = a11;
  if (!a9)
    goto LABEL_19;
LABEL_17:
  v51 = MEMORY[0x1E0D42690];
  *((_QWORD *)&v50 + 1) = v22;
  *(_QWORD *)&v49 = a9;
LABEL_20:
  v48 = v19;
  v47 = v21;
  *(_QWORD *)&v46 = v25;
  sub_1BCBDAE08((uint64_t)&v79, (uint64_t)__src);
  v26 = a10;
  v27 = a9;
  v28 = v25;
  v29 = v41;
  v30 = a2;
  v31 = v24;
  v32 = a4;
  v33 = v43;
  v34 = a6;
  v35 = v42;
  v36 = v23;
  sub_1BCC006FC();
  sub_1BCBDB110((uint64_t)&v79);
  sub_1BCBDB3C8(__dst, (uint64_t)&__src[89]);
  sub_1BCBE32E0((uint64_t)&v75, (uint64_t)&__src[94], &qword_1ED1BC8B0);
  sub_1BCBDB3C8(&v72, (uint64_t)&__src[99]);
  sub_1BCBDB3C8(&v69, (uint64_t)&__src[104]);
  sub_1BCBE32E0((uint64_t)v67, (uint64_t)&__src[109], &qword_1ED1BC8B0);
  sub_1BCBE32E0((uint64_t)&v64, (uint64_t)&__src[114], &qword_1ED1BC8B0);
  sub_1BCBDB3C8(&v61, (uint64_t)&__src[119]);
  sub_1BCBE32E0((uint64_t)&v58, (uint64_t)&__src[124], &qword_1ED1BC8A8);
  sub_1BCBE32E0((uint64_t)&v55, (uint64_t)&__src[129], &qword_1ED1BC8B0);
  sub_1BCBE32E0((uint64_t)&v52, (uint64_t)&__src[134], &qword_1ED1BC8A8);
  sub_1BCBE32E0((uint64_t)&v49, (uint64_t)&__src[139], &qword_1ED1BC8A8);
  sub_1BCBDB3C8(&v46, (uint64_t)&__src[144]);
  memcpy(__dst, __src, 0x4A8uLL);

  __src[3] = &type metadata for AdLockupLayout;
  __src[4] = sub_1BCBE3324();
  __src[5] = sub_1BCBE3368();
  __src[0] = swift_allocObject();
  sub_1BCBDB1C0((uint64_t)__dst, __src[0] + 16);
  v37 = (objc_class *)type metadata accessor for ASCLayoutProxy();
  v38 = objc_allocWithZone(v37);
  sub_1BCBE0C18((uint64_t)__src, (uint64_t)v38 + OBJC_IVAR_____ASCLayoutProxy_base);
  v44.receiver = v38;
  v44.super_class = v37;
  v39 = objc_msgSendSuper2(&v44, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)__src);
  sub_1BCBDB1F4(__dst);
  return v39;
}

void _s18AppStoreComponents14ASCLayoutProxyC32numberOfViewsInLockupMediaLayout3for4with3andSiSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgtFZ_0(uint64_t a1, uint64_t a2, void *a3)
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

  v6 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v14 - v10;
  sub_1BCBEC668(a2, a3, a1, (uint64_t)&v14 - v10);
  sub_1BCBE31E0((uint64_t)v11, (uint64_t)v8, type metadata accessor for LockupMediaLayout.DisplayType);
  v12 = sub_1BCC00774();
  v13 = (char *)sub_1BCBE0B58
      + 4
      * byte_1BCC09530[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v8, 10, v12)];
  __asm { BR              X9 }
}

uint64_t sub_1BCBE0B58()
{
  uint64_t v0;

  sub_1BCBE31A4(v0, type metadata accessor for LockupMediaLayout.DisplayType);
  return 1;
}

uint64_t sub_1BCBE0BD8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for LockupMediaLayout(255);
    result = MEMORY[0x1BCCFEBCC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BCBE0C18(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id _s18AppStoreComponents14ASCLayoutProxyC17lockupMediaLayout3for11screenshots8trailers13containerView10mediaViewsACSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgSo6UIViewCSayATGtFZ_0(uint64_t a1, uint64_t a2, void *a3, void *a4, unint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t *boxed_opaque_existential_1;
  objc_class *v26;
  id v27;
  id v28;
  uint64_t v30;
  unint64_t v31;
  objc_super v32;
  uint64_t v33[6];

  v31 = a5;
  v9 = type metadata accessor for LockupMediaLayout(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (uint64_t *)((char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for LockupMediaLayout.Metrics(0);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1BCC00774();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v17, 1, 1, v21);
  sub_1BCBEC668(a2, a3, a1, (uint64_t)v14);
  sub_1BCBECA90(a2, a3, (uint64_t)v17, (uint64_t)v14, (uint64_t)v20);
  sub_1BCBE31A4((uint64_t)v14, type metadata accessor for LockupMediaLayout.DisplayType);
  sub_1BCBE3224((uint64_t)v17);
  sub_1BCBE31E0((uint64_t)v20, (uint64_t)v11 + *(int *)(v9 + 24), type metadata accessor for LockupMediaLayout.Metrics);
  v22 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  v23 = MEMORY[0x1E0D42690];
  v11[3] = v22;
  v11[4] = v23;
  *v11 = a4;
  v24 = a4;
  v11[5] = sub_1BCBDF66C(v31);
  v33[3] = v9;
  v33[4] = sub_1BCBE0BD8(&qword_1EF48D430, (uint64_t)&unk_1BCC099D8);
  v33[5] = sub_1BCBE0BD8(&qword_1EF48D438, (uint64_t)&unk_1BCC099B0);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v33);
  sub_1BCBE31E0((uint64_t)v11, (uint64_t)boxed_opaque_existential_1, type metadata accessor for LockupMediaLayout);
  v26 = (objc_class *)type metadata accessor for ASCLayoutProxy();
  v27 = objc_allocWithZone(v26);
  sub_1BCBE0C18((uint64_t)v33, (uint64_t)v27 + OBJC_IVAR_____ASCLayoutProxy_base);
  v32.receiver = v27;
  v32.super_class = v26;
  v28 = objc_msgSendSuper2(&v32, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  sub_1BCBE31A4((uint64_t)v11, type metadata accessor for LockupMediaLayout);
  sub_1BCBE31A4((uint64_t)v20, type metadata accessor for LockupMediaLayout.Metrics);
  return v28;
}

double _s18AppStoreComponents14ASCLayoutProxyC25estimatedMediaContentSize3for11screenshots8trailers7fitting2inSo6CGSizeVSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgAKSo18UITraitEnvironment_ptFZ_0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, double a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  double v23;
  uint64_t v25;

  v10 = type metadata accessor for LockupMediaLayout.Metrics(0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v25 - v20;
  sub_1BCBEC668(a2, a3, a1, (uint64_t)v18);
  sub_1BCBECD84((uint64_t)v21);
  sub_1BCBE31A4((uint64_t)v18, type metadata accessor for LockupMediaLayout.DisplayType);
  v22 = sub_1BCC00774();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v15, 1, 1, v22);
  sub_1BCBECD84((uint64_t)v18);
  sub_1BCBECA90(a2, a3, (uint64_t)v15, (uint64_t)v18, (uint64_t)v12);
  sub_1BCBE31A4((uint64_t)v18, type metadata accessor for LockupMediaLayout.DisplayType);
  v23 = sub_1BCBEF710((uint64_t)v12, a4, a5);
  sub_1BCBE31A4((uint64_t)v12, type metadata accessor for LockupMediaLayout.Metrics);
  sub_1BCBE3224((uint64_t)v15);
  sub_1BCBE31A4((uint64_t)v21, type metadata accessor for LockupMediaLayout.DisplayType);
  return v23;
}

uint64_t _s18AppStoreComponents14ASCLayoutProxyC26containerViewRotationAngle3for11screenshots8trailers12CoreGraphics7CGFloatVSo16ASCLockupContextaSg_So14ASCScreenshotsCSgSo11ASCTrailersCSgtFZ_0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t result;
  id v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v6 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v21 - v10;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v21 - v13;
  sub_1BCBEC668(a2, a3, a1, (uint64_t)v11);
  sub_1BCBECD84((uint64_t)v14);
  sub_1BCBE31A4((uint64_t)v11, type metadata accessor for LockupMediaLayout.DisplayType);
  v15 = sub_1BCBED560(a2, a3, 0, 1);
  if (v15 >> 62)
  {
    result = sub_1BCC00F30();
    if (result)
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  result = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!result)
    goto LABEL_8;
LABEL_3:
  if ((v15 & 0xC000000000000001) != 0)
  {
    v17 = (id)MEMORY[0x1BCCFE2E4](0, v15);
  }
  else
  {
    if (!*(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    v17 = *(id *)(v15 + 32);
  }
  v18 = v17;
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_isPortrait);

LABEL_9:
  sub_1BCBE31E0((uint64_t)v14, (uint64_t)v8, type metadata accessor for LockupMediaLayout.DisplayType);
  v19 = sub_1BCC00774();
  v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48))(v8, 10, v19);
  if (v20 != 7 && v20 != 6)
    sub_1BCBE31A4((uint64_t)v8, type metadata accessor for LockupMediaLayout.DisplayType);
  return sub_1BCBE31A4((uint64_t)v14, type metadata accessor for LockupMediaLayout.DisplayType);
}

double _s18AppStoreComponents14ASCLayoutProxyC13layoutMargins3for014existingLayoutG0So12UIEdgeInsetsVSo16ASCLockupContextaSg_AHtFZ_0(void *a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  id v10;
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
  char v23;
  id v24;

  if (!a1)
    return a2;
  v4 = sub_1BCC00DE0();
  v6 = v5;
  if (v4 == sub_1BCC00DE0() && v6 == v7)
  {
    v21 = a1;
    goto LABEL_16;
  }
  v9 = sub_1BCC00F60();
  v10 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
LABEL_17:
    a2 = *MEMORY[0x1E0DC49E8];

    return a2;
  }
  v11 = sub_1BCC00DE0();
  v13 = v12;
  if (v11 == sub_1BCC00DE0() && v13 == v14)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
    goto LABEL_17;
  }
  v16 = sub_1BCC00F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v16 & 1) != 0)
    goto LABEL_17;
  v17 = sub_1BCC00DE0();
  v19 = v18;
  if (v17 == sub_1BCC00DE0() && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v23 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {

      return a2;
    }
  }
  v24 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  objc_msgSend(v24, sel_userInterfaceIdiom);

  return a2;
}

double _s18AppStoreComponents14ASCLayoutProxyC28lockupTitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  double result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;

  v0 = sub_1BCC00DE0();
  v2 = v1;
  if (v0 == sub_1BCC00DE0() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
    return 19.0;
  }
  else
  {
    v5 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 19.0;
    if ((v5 & 1) == 0)
    {
      v7 = sub_1BCC00DE0();
      v9 = v8;
      if (v7 == sub_1BCC00DE0() && v9 == v10)
      {
        swift_bridgeObjectRelease_n();
        return 20.0;
      }
      v12 = sub_1BCC00F60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = 20.0;
      if ((v12 & 1) == 0)
      {
        v13 = sub_1BCC00DE0();
        v15 = v14;
        if (v13 == sub_1BCC00DE0() && v15 == v16)
        {
          swift_bridgeObjectRelease_n();
          return 21.0;
        }
        v17 = sub_1BCC00F60();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        result = 21.0;
        if ((v17 & 1) == 0)
        {
          v18 = sub_1BCC00DE0();
          v20 = v19;
          if (v18 == sub_1BCC00DE0() && v20 == v21)
          {
            swift_bridgeObjectRelease_n();
            return 22.0;
          }
          v22 = sub_1BCC00F60();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          result = 22.0;
          if ((v22 & 1) == 0)
          {
            v23 = sub_1BCC00DE0();
            v25 = v24;
            if (v23 == sub_1BCC00DE0() && v25 == v26)
            {
              swift_bridgeObjectRelease_n();
              return 24.0;
            }
            v27 = sub_1BCC00F60();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            result = 24.0;
            if ((v27 & 1) == 0)
            {
              v28 = sub_1BCC00DE0();
              v30 = v29;
              if (v28 == sub_1BCC00DE0() && v30 == v31)
              {
                swift_bridgeObjectRelease_n();
                return 26.0;
              }
              v32 = sub_1BCC00F60();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              result = 26.0;
              if ((v32 & 1) == 0)
              {
                v33 = sub_1BCC00DE0();
                v35 = v34;
                if (v33 == sub_1BCC00DE0() && v35 == v36)
                {
                  swift_bridgeObjectRelease_n();
                  return 28.0;
                }
                v37 = sub_1BCC00F60();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                result = 28.0;
                if ((v37 & 1) == 0)
                {
                  v38 = sub_1BCC00DE0();
                  v40 = v39;
                  if (v38 == sub_1BCC00DE0() && v40 == v41)
                  {
                    swift_bridgeObjectRelease_n();
                    return 34.0;
                  }
                  v43 = sub_1BCC00F60();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v43 & 1) != 0)
                    return 34.0;
                  v44 = sub_1BCC00DE0();
                  v46 = v45;
                  if (v44 == sub_1BCC00DE0() && v46 == v47)
                    goto LABEL_41;
                  v48 = sub_1BCC00F60();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v48 & 1) != 0)
                    return 36.0;
                  v49 = sub_1BCC00DE0();
                  v51 = v50;
                  if (v49 == sub_1BCC00DE0() && v51 == v52)
                    goto LABEL_41;
                  v53 = sub_1BCC00F60();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v53 & 1) != 0)
                    return 36.0;
                  v54 = sub_1BCC00DE0();
                  v56 = v55;
                  if (v54 == sub_1BCC00DE0() && v56 == v57)
                    goto LABEL_41;
                  v58 = sub_1BCC00F60();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v58 & 1) != 0)
                    return 36.0;
                  v59 = sub_1BCC00DE0();
                  v61 = v60;
                  if (v59 == sub_1BCC00DE0() && v61 == v62)
                  {
LABEL_41:
                    swift_bridgeObjectRelease_n();
                    return 36.0;
                  }
                  v63 = sub_1BCC00F60();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  result = 36.0;
                  if ((v63 & 1) == 0)
                    return 22.0;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

double _s18AppStoreComponents14ASCLayoutProxyC31lockupSubtitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  double result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;

  v0 = sub_1BCC00DE0();
  v2 = v1;
  if (v0 == sub_1BCC00DE0() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
    return 13.0;
  }
  else
  {
    v5 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 13.0;
    if ((v5 & 1) == 0)
    {
      v7 = sub_1BCC00DE0();
      v9 = v8;
      if (v7 == sub_1BCC00DE0() && v9 == v10)
      {
        swift_bridgeObjectRelease_n();
        return 14.0;
      }
      v12 = sub_1BCC00F60();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = 14.0;
      if ((v12 & 1) == 0)
      {
        v13 = sub_1BCC00DE0();
        v15 = v14;
        if (v13 == sub_1BCC00DE0() && v15 == v16)
        {
          swift_bridgeObjectRelease_n();
          return 15.0;
        }
        v17 = sub_1BCC00F60();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        result = 15.0;
        if ((v17 & 1) == 0)
        {
          v18 = sub_1BCC00DE0();
          v20 = v19;
          if (v18 == sub_1BCC00DE0() && v20 == v21)
          {
            swift_bridgeObjectRelease_n();
            return 16.0;
          }
          v22 = sub_1BCC00F60();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          result = 16.0;
          if ((v22 & 1) == 0)
          {
            v23 = sub_1BCC00DE0();
            v25 = v24;
            if (v23 == sub_1BCC00DE0() && v25 == v26)
            {
              swift_bridgeObjectRelease_n();
              return 18.0;
            }
            v27 = sub_1BCC00F60();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            result = 18.0;
            if ((v27 & 1) == 0)
            {
              v28 = sub_1BCC00DE0();
              v30 = v29;
              if (v28 == sub_1BCC00DE0() && v30 == v31)
              {
                swift_bridgeObjectRelease_n();
                return 20.0;
              }
              v32 = sub_1BCC00F60();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              result = 20.0;
              if ((v32 & 1) == 0)
              {
                v33 = sub_1BCC00DE0();
                v35 = v34;
                if (v33 == sub_1BCC00DE0() && v35 == v36)
                {
                  swift_bridgeObjectRelease_n();
                  return 22.0;
                }
                v37 = sub_1BCC00F60();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                result = 22.0;
                if ((v37 & 1) == 0)
                {
                  v38 = sub_1BCC00DE0();
                  v40 = v39;
                  if (v38 == sub_1BCC00DE0() && v40 == v41)
                    goto LABEL_36;
                  v42 = sub_1BCC00F60();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v42 & 1) != 0)
                    return 24.0;
                  v43 = sub_1BCC00DE0();
                  v45 = v44;
                  if (v43 == sub_1BCC00DE0() && v45 == v46)
                    goto LABEL_36;
                  v47 = sub_1BCC00F60();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v47 & 1) != 0)
                    return 24.0;
                  v48 = sub_1BCC00DE0();
                  v50 = v49;
                  if (v48 == sub_1BCC00DE0() && v50 == v51)
                    goto LABEL_36;
                  v52 = sub_1BCC00F60();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v52 & 1) != 0)
                    return 24.0;
                  v53 = sub_1BCC00DE0();
                  v55 = v54;
                  if (v53 == sub_1BCC00DE0() && v55 == v56)
                    goto LABEL_36;
                  v57 = sub_1BCC00F60();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if ((v57 & 1) != 0)
                    return 24.0;
                  v58 = sub_1BCC00DE0();
                  v60 = v59;
                  if (v58 == sub_1BCC00DE0() && v60 == v61)
                  {
LABEL_36:
                    swift_bridgeObjectRelease_n();
                    return 24.0;
                  }
                  v62 = sub_1BCC00F60();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  result = 16.0;
                  if ((v62 & 1) != 0)
                    return 24.0;
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

double _s18AppStoreComponents14ASCLayoutProxyC30lockupHeadingPointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentI8CategoryaFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;

  v0 = sub_1BCC00DE0();
  v2 = v1;
  if (v0 == sub_1BCC00DE0() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
    return 12.0;
  }
  v5 = sub_1BCC00F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = 12.0;
  if ((v5 & 1) == 0)
  {
    v7 = sub_1BCC00DE0();
    v9 = v8;
    if (v7 == sub_1BCC00DE0() && v9 == v10)
      goto LABEL_13;
    v12 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) != 0)
      return v6;
    v13 = sub_1BCC00DE0();
    v15 = v14;
    if (v13 == sub_1BCC00DE0() && v15 == v16)
      goto LABEL_13;
    v18 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) != 0)
      return v6;
    v19 = sub_1BCC00DE0();
    v21 = v20;
    if (v19 == sub_1BCC00DE0() && v21 == v22)
    {
      swift_bridgeObjectRelease_n();
      return 13.0;
    }
    v23 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 13.0;
    if ((v23 & 1) != 0)
      return v6;
    v24 = sub_1BCC00DE0();
    v26 = v25;
    if (v24 == sub_1BCC00DE0() && v26 == v27)
    {
      swift_bridgeObjectRelease_n();
      return 15.0;
    }
    v28 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 15.0;
    if ((v28 & 1) != 0)
      return v6;
    v29 = sub_1BCC00DE0();
    v31 = v30;
    if (v29 == sub_1BCC00DE0() && v31 == v32)
    {
      swift_bridgeObjectRelease_n();
      return 17.0;
    }
    v33 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 17.0;
    if ((v33 & 1) != 0)
      return v6;
    v34 = sub_1BCC00DE0();
    v36 = v35;
    if (v34 == sub_1BCC00DE0() && v36 == v37)
    {
      swift_bridgeObjectRelease_n();
      return 19.0;
    }
    v38 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 19.0;
    if ((v38 & 1) != 0)
      return v6;
    v39 = sub_1BCC00DE0();
    v41 = v40;
    if (v39 == sub_1BCC00DE0() && v41 == v42)
    {
      swift_bridgeObjectRelease_n();
      return 22.0;
    }
    v43 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 22.0;
    if ((v43 & 1) != 0)
      return v6;
    v44 = sub_1BCC00DE0();
    v46 = v45;
    if (v44 == sub_1BCC00DE0() && v46 == v47)
      goto LABEL_13;
    v48 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v48 & 1) != 0)
      return v6;
    v49 = sub_1BCC00DE0();
    v51 = v50;
    if (v49 == sub_1BCC00DE0() && v51 == v52)
      goto LABEL_13;
    v53 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v53 & 1) != 0)
      return v6;
    v54 = sub_1BCC00DE0();
    v56 = v55;
    if (v54 == sub_1BCC00DE0() && v56 == v57)
      goto LABEL_13;
    v58 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v58 & 1) != 0)
      return v6;
    v59 = sub_1BCC00DE0();
    v61 = v60;
    if (v59 == sub_1BCC00DE0() && v61 == v62)
    {
LABEL_13:
      swift_bridgeObjectRelease_n();
      return v6;
    }
    v63 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v63 & 1) != 0)
      return 22.0;
    else
      return 13.0;
  }
  return v6;
}

double _s18AppStoreComponents14ASCLayoutProxyC42adTransparencyButtonTitlePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentK8CategoryaFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;

  v0 = sub_1BCC00DE0();
  v2 = v1;
  if (v0 == sub_1BCC00DE0() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
    return 11.0;
  }
  v5 = sub_1BCC00F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = 11.0;
  if ((v5 & 1) == 0)
  {
    v7 = sub_1BCC00DE0();
    v9 = v8;
    if (v7 == sub_1BCC00DE0() && v9 == v10)
      goto LABEL_13;
    v12 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) != 0)
      return v6;
    v13 = sub_1BCC00DE0();
    v15 = v14;
    if (v13 == sub_1BCC00DE0() && v15 == v16)
      goto LABEL_13;
    v18 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) != 0)
      return v6;
    v19 = sub_1BCC00DE0();
    v21 = v20;
    if (v19 == sub_1BCC00DE0() && v21 == v22)
      goto LABEL_13;
    v23 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v23 & 1) != 0)
      return v6;
    v24 = sub_1BCC00DE0();
    v26 = v25;
    if (v24 == sub_1BCC00DE0() && v26 == v27)
    {
      swift_bridgeObjectRelease_n();
      return 13.0;
    }
    v28 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 13.0;
    if ((v28 & 1) != 0)
      return v6;
    v29 = sub_1BCC00DE0();
    v31 = v30;
    if (v29 == sub_1BCC00DE0() && v31 == v32)
    {
      swift_bridgeObjectRelease_n();
      return 15.0;
    }
    v33 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 15.0;
    if ((v33 & 1) != 0)
      return v6;
    v34 = sub_1BCC00DE0();
    v36 = v35;
    if (v34 == sub_1BCC00DE0() && v36 == v37)
    {
      swift_bridgeObjectRelease_n();
      return 17.0;
    }
    v38 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 17.0;
    if ((v38 & 1) != 0)
      return v6;
    v39 = sub_1BCC00DE0();
    v41 = v40;
    if (v39 == sub_1BCC00DE0() && v41 == v42)
    {
      swift_bridgeObjectRelease_n();
      return 20.0;
    }
    v43 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 20.0;
    if ((v43 & 1) != 0)
      return v6;
    v44 = sub_1BCC00DE0();
    v46 = v45;
    if (v44 == sub_1BCC00DE0() && v46 == v47)
    {
      swift_bridgeObjectRelease_n();
      return 24.0;
    }
    v48 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 24.0;
    if ((v48 & 1) != 0)
      return v6;
    v49 = sub_1BCC00DE0();
    v51 = v50;
    if (v49 == sub_1BCC00DE0() && v51 == v52)
    {
      swift_bridgeObjectRelease_n();
      return 27.0;
    }
    v53 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 27.0;
    if ((v53 & 1) != 0)
      return v6;
    v54 = sub_1BCC00DE0();
    v56 = v55;
    if (v54 == sub_1BCC00DE0() && v56 == v57)
      goto LABEL_13;
    v58 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v58 & 1) != 0)
      return v6;
    v59 = sub_1BCC00DE0();
    v61 = v60;
    if (v59 == sub_1BCC00DE0() && v61 == v62)
    {
LABEL_13:
      swift_bridgeObjectRelease_n();
      return v6;
    }
    v63 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v63 & 1) != 0)
      return 27.0;
    else
      return 11.0;
  }
  return v6;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

double _s18AppStoreComponents14ASCLayoutProxyC44adTransparencyDeveloperNamePointSizeProvidery12CoreGraphics7CGFloatVSo09UIContentK8CategoryaFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;

  v0 = sub_1BCC00DE0();
  v2 = v1;
  if (v0 == sub_1BCC00DE0() && v2 == v3)
  {
    swift_bridgeObjectRelease_n();
    return 11.0;
  }
  v5 = sub_1BCC00F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = 11.0;
  if ((v5 & 1) == 0)
  {
    v7 = sub_1BCC00DE0();
    v9 = v8;
    if (v7 == sub_1BCC00DE0() && v9 == v10)
      goto LABEL_13;
    v12 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v12 & 1) != 0)
      return v6;
    v13 = sub_1BCC00DE0();
    v15 = v14;
    if (v13 == sub_1BCC00DE0() && v15 == v16)
      goto LABEL_13;
    v18 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v18 & 1) != 0)
      return v6;
    v19 = sub_1BCC00DE0();
    v21 = v20;
    if (v19 == sub_1BCC00DE0() && v21 == v22)
    {
      swift_bridgeObjectRelease_n();
      return 12.0;
    }
    v23 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 12.0;
    if ((v23 & 1) != 0)
      return v6;
    v24 = sub_1BCC00DE0();
    v26 = v25;
    if (v24 == sub_1BCC00DE0() && v26 == v27)
    {
      swift_bridgeObjectRelease_n();
      return 14.0;
    }
    v28 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 14.0;
    if ((v28 & 1) != 0)
      return v6;
    v29 = sub_1BCC00DE0();
    v31 = v30;
    if (v29 == sub_1BCC00DE0() && v31 == v32)
    {
      swift_bridgeObjectRelease_n();
      return 16.0;
    }
    v33 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 16.0;
    if ((v33 & 1) != 0)
      return v6;
    v34 = sub_1BCC00DE0();
    v36 = v35;
    if (v34 == sub_1BCC00DE0() && v36 == v37)
    {
      swift_bridgeObjectRelease_n();
      return 18.0;
    }
    v38 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 18.0;
    if ((v38 & 1) != 0)
      return v6;
    v39 = sub_1BCC00DE0();
    v41 = v40;
    if (v39 == sub_1BCC00DE0() && v41 == v42)
    {
      swift_bridgeObjectRelease_n();
      return 22.0;
    }
    v43 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 22.0;
    if ((v43 & 1) != 0)
      return v6;
    v44 = sub_1BCC00DE0();
    v46 = v45;
    if (v44 == sub_1BCC00DE0() && v46 == v47)
    {
      swift_bridgeObjectRelease_n();
      return 24.0;
    }
    v48 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v6 = 24.0;
    if ((v48 & 1) != 0)
      return v6;
    v49 = sub_1BCC00DE0();
    v51 = v50;
    if (v49 == sub_1BCC00DE0() && v51 == v52)
      goto LABEL_13;
    v53 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v53 & 1) != 0)
      return v6;
    v54 = sub_1BCC00DE0();
    v56 = v55;
    if (v54 == sub_1BCC00DE0() && v56 == v57)
      goto LABEL_13;
    v58 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v58 & 1) != 0)
      return v6;
    v59 = sub_1BCC00DE0();
    v61 = v60;
    if (v59 == sub_1BCC00DE0() && v61 == v62)
    {
LABEL_13:
      swift_bridgeObjectRelease_n();
      return v6;
    }
    v63 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v63 & 1) != 0)
      return 24.0;
    else
      return 12.0;
  }
  return v6;
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

uint64_t sub_1BCBE31A4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1BCBE31E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1BCBE3224(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BCBE3264(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCBE32A8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1BCBE32E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1BCBE3324()
{
  unint64_t result;

  result = qword_1EF48D458;
  if (!qword_1EF48D458)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC093A0, &type metadata for AdLockupLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48D458);
  }
  return result;
}

unint64_t sub_1BCBE3368()
{
  unint64_t result;

  result = qword_1EF48D460;
  if (!qword_1EF48D460)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09378, &type metadata for AdLockupLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48D460);
  }
  return result;
}

uint64_t sub_1BCBE33AC()
{
  _QWORD *v0;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 4));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 9));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 14));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 19));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 24));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 29));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 34));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 39));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 44));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 49));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 54));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 61));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 66));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 71));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 76));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 81));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 86));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 91));
  if (v0[99])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 96));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 101));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 106));
  if (v0[114])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 111));
  if (v0[119])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 116));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 121));
  if (v0[129])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 126));
  if (v0[134])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 131));
  if (v0[139])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 136));
  if (v0[144])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 141));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 146));
  return swift_deallocObject();
}

uint64_t sub_1BCBE34E8(uint64_t a1)
{
  return sub_1BCBE3524(a1, (uint64_t)&ASCOfferButtonSizeSmall, &qword_1ED1BC220);
}

uint64_t sub_1BCBE34FC(uint64_t a1)
{
  return sub_1BCBE35B4(a1, (uint64_t)&ASCOfferButtonSizeSmall, (double *)&qword_1ED1BC9D8);
}

uint64_t sub_1BCBE3510(uint64_t a1)
{
  return sub_1BCBE3524(a1, (uint64_t)&ASCOfferButtonSizeMedium, &qword_1EF48D468);
}

uint64_t sub_1BCBE3524(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t result;
  _OWORD v6[4];
  uint64_t v7;

  type metadata accessor for ASCLayoutProxy();
  sub_1BCC00DE0();
  sub_1BCBEA038(v6);
  v4 = v7;
  sub_1BCBE85EC((uint64_t)v6);
  result = swift_bridgeObjectRelease();
  *a3 = v4;
  return result;
}

uint64_t sub_1BCBE35A0(uint64_t a1)
{
  return sub_1BCBE35B4(a1, (uint64_t)&ASCOfferButtonSizeMedium, (double *)&qword_1EF48D470);
}

uint64_t sub_1BCBE35B4(uint64_t a1, uint64_t a2, double *a3)
{
  double v4;
  uint64_t result;

  type metadata accessor for ASCLayoutProxy();
  sub_1BCC00DE0();
  v4 = static ASCLayoutProxy.axOfferButtonHeightForSize(_:)();
  result = swift_bridgeObjectRelease();
  *a3 = v4;
  return result;
}

uint64_t sub_1BCBE3614(uint64_t a1)
{
  return sub_1BCBE363C(a1, qword_1EF48D478, MEMORY[0x1E0DC4B10]);
}

uint64_t sub_1BCBE3628(uint64_t a1)
{
  return sub_1BCBE363C(a1, qword_1EF48D490, MEMORY[0x1E0DC4A98]);
}

uint64_t sub_1BCBE363C(uint64_t a1, uint64_t *a2, void **a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *boxed_opaque_existential_1;
  void *v21;
  id v22;
  void (*v23)(char *, uint64_t);
  uint64_t v26[5];

  v5 = sub_1BCC00BC4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v26[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v26[-1] - v10;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v26[-1] - v13;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v26[-1] - v16;
  __swift_allocate_value_buffer(v18, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  sub_1BCC00BB8();
  v19 = sub_1BCC00654();
  v26[3] = v19;
  v26[4] = MEMORY[0x1E0D418E8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v26);
  v21 = *a3;
  *boxed_opaque_existential_1 = (uint64_t)v21;
  (*(void (**)(void))(*(_QWORD *)(v19 - 8) + 104))();
  v22 = v21;
  sub_1BCC00B88();
  v23 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  sub_1BCC00B94();
  v23(v11, v5);
  sub_1BCC00BA0();
  v23(v14, v5);
  sub_1BCC00BAC();
  return ((uint64_t (*)(char *, uint64_t))v23)(v17, v5);
}

uint64_t sub_1BCBE37F0(uint64_t a1)
{
  return sub_1BCBE3DF0(a1, &qword_1EF48D4D0[3], &qword_1EF48D4D0[4], qword_1EF48D4D0, (uint64_t)&unk_1EF48D4A8);
}

uint64_t sub_1BCBE3808()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  double IconSize;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_QWORD *, _QWORD, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *boxed_opaque_existential_1;
  void (*v17)(uint64_t *, _QWORD *, uint64_t);
  id v18;
  void (*v19)(_QWORD *, uint64_t);
  void *v20;
  uint64_t *v21;
  id v22;
  uint64_t v25[5];
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v0 = sub_1BCC00654();
  v1 = *(_QWORD **)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (uint64_t *)((char *)&v25[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (void *)sub_1BCC00DBC();
  IconSize = ASCLockupViewSizeGetIconSize(v4, 1);
  v7 = v6;

  v33 = MEMORY[0x1E0DEB070];
  v34 = MEMORY[0x1E0D425E8];
  *(_QWORD *)&v32 = 0x4024000000000000;
  v8 = (void *)*MEMORY[0x1E0DC4B10];
  v9 = *MEMORY[0x1E0DC4B88];
  *v3 = *MEMORY[0x1E0DC4B10];
  v3[1] = v9;
  v10 = *MEMORY[0x1E0D41A60];
  v11 = sub_1BCC0078C();
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v3, v10, v11);
  v12 = (void (*)(_QWORD *, _QWORD, uint64_t))v1[13];
  v12(v3, *MEMORY[0x1E0D418D8], v0);
  v13 = sub_1BCC009E4();
  v14 = MEMORY[0x1E0D41DD0];
  v30 = v13;
  v31 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v29);
  v15 = MEMORY[0x1E0D418E8];
  v27 = v0;
  v28 = MEMORY[0x1E0D418E8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v26);
  v17 = (void (*)(uint64_t *, _QWORD *, uint64_t))v1[2];
  v17(boxed_opaque_existential_1, v3, v0);
  v18 = v8;
  sub_1BCC009F0();
  v19 = (void (*)(_QWORD *, uint64_t))v1[1];
  v19(v3, v0);
  v20 = (void *)*MEMORY[0x1E0DC4A98];
  *v3 = *MEMORY[0x1E0DC4A98];
  v12(v3, *MEMORY[0x1E0D418E0], v0);
  v27 = v13;
  v28 = v14;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v26);
  v25[3] = v0;
  v25[4] = v15;
  v21 = __swift_allocate_boxed_opaque_existential_1(v25);
  v17(v21, v3, v0);
  v22 = v20;
  sub_1BCC009F0();
  v19(v3, v0);
  qword_1EF48D598 = MEMORY[0x1E0DEB070];
  qword_1EF48D5A0 = MEMORY[0x1E0D425E8];
  qword_1EF48D580 = 0x4030000000000000;
  qword_1EF48D4F8 = *(_QWORD *)&IconSize;
  unk_1EF48D500 = v7;
  sub_1BCBDB3C8(&v32, (uint64_t)&unk_1EF48D508);
  sub_1BCBDB3C8(&v29, (uint64_t)&unk_1EF48D530);
  return sub_1BCBDB3C8(&v26, (uint64_t)&unk_1EF48D558);
}

uint64_t sub_1BCBE3A60()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  double IconSize;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t *boxed_opaque_existential_1;
  void (*v16)(uint64_t *, _QWORD *, uint64_t);
  id v17;
  void (*v18)(_QWORD *, uint64_t);
  void *v19;
  uint64_t *v20;
  id v21;
  uint64_t v23;
  void (*v24)(_QWORD *, uint64_t, uint64_t);
  unsigned int v25;
  uint64_t v26[5];
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v0 = sub_1BCC00654();
  v1 = *(_QWORD **)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (uint64_t *)((char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (void *)sub_1BCC00DBC();
  IconSize = ASCLockupViewSizeGetIconSize(v4, 1);
  v7 = v6;

  v34 = MEMORY[0x1E0DEB070];
  v35 = MEMORY[0x1E0D425E8];
  *(_QWORD *)&v33 = 0x4024000000000000;
  v8 = (void *)*MEMORY[0x1E0DC4A98];
  v9 = *MEMORY[0x1E0DC4B88];
  *v3 = *MEMORY[0x1E0DC4A98];
  v3[1] = v9;
  v25 = *MEMORY[0x1E0D41A60];
  v10 = v25;
  v11 = sub_1BCC0078C();
  v24 = *(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104);
  v24(v3, v10, v11);
  v12 = *MEMORY[0x1E0D418D8];
  v13 = (void (*)(_QWORD *, uint64_t, uint64_t))v1[13];
  v13(v3, v12, v0);
  v14 = sub_1BCC009E4();
  v31 = v14;
  v32 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v30);
  v28 = v0;
  v29 = MEMORY[0x1E0D418E8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v27);
  v16 = (void (*)(uint64_t *, _QWORD *, uint64_t))v1[2];
  v16(boxed_opaque_existential_1, v3, v0);
  v17 = v8;
  sub_1BCC009F0();
  v18 = (void (*)(_QWORD *, uint64_t))v1[1];
  v18(v3, v0);
  v19 = (void *)*MEMORY[0x1E0DC4B10];
  *v3 = *MEMORY[0x1E0DC4B10];
  v3[1] = v9;
  v24(v3, v25, v11);
  v13(v3, v12, v0);
  v28 = v14;
  v29 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v27);
  v26[3] = v0;
  v26[4] = MEMORY[0x1E0D418E8];
  v20 = __swift_allocate_boxed_opaque_existential_1(v26);
  v16(v20, v3, v0);
  v21 = v19;
  sub_1BCC009F0();
  v18(v3, v0);
  qword_1EF48D648 = MEMORY[0x1E0DEB070];
  qword_1EF48D650 = MEMORY[0x1E0D425E8];
  qword_1EF48D630 = 0x4030000000000000;
  qword_1EF48D5A8 = *(_QWORD *)&IconSize;
  unk_1EF48D5B0 = v7;
  sub_1BCBDB3C8(&v33, (uint64_t)&unk_1EF48D5B8);
  sub_1BCBDB3C8(&v30, (uint64_t)&unk_1EF48D5E0);
  return sub_1BCBDB3C8(&v27, (uint64_t)&unk_1EF48D608);
}

void sub_1BCBE3D08()
{
  CGFloat v0;
  CGFloat v1;
  id v2;
  UIImage *v3;
  CGSize v4;
  CGRect v5;

  if (qword_1EF48D030 != -1)
    swift_once();
  v0 = *(double *)&qword_1EF48D4F8;
  v1 = unk_1EF48D500;
  v2 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  v4.width = v0;
  v4.height = v1;
  UIGraphicsBeginImageContextWithOptions(v4, 0, 0.0);
  objc_msgSend(v2, sel_set);
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.width = v0;
  v5.size.height = v1;
  UIRectFill(v5);
  v3 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  qword_1EF48D658 = (uint64_t)v3;
}

uint64_t sub_1BCBE3DD8(uint64_t a1)
{
  return sub_1BCBE3DF0(a1, &qword_1ED1BC298[3], &qword_1ED1BC298[4], qword_1ED1BC298, (uint64_t)&unk_1ED1BC270);
}

uint64_t sub_1BCBE3DF0(uint64_t a1, _QWORD *a2, _QWORD *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  if (qword_1ED1BC228 != -1)
    swift_once();
  v9 = MEMORY[0x1E0DEF040];
  v10 = MEMORY[0x1E0D418A8];
  v14 = MEMORY[0x1E0DEF040];
  v15 = MEMORY[0x1E0D418A8];
  *(_QWORD *)&v13 = qword_1ED1BC220;
  if (qword_1ED1BC9E0 != -1)
    swift_once();
  v11 = qword_1ED1BC9D8;
  *a2 = v9;
  *a3 = v10;
  *a4 = v11;
  return sub_1BCBDB3C8(&v13, a5);
}

uint64_t sub_1BCBE3EC0()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  if (qword_1EF48D008 != -1)
    swift_once();
  v0 = MEMORY[0x1E0DEF040];
  v1 = MEMORY[0x1E0D418A8];
  v4 = MEMORY[0x1E0DEF040];
  v5 = MEMORY[0x1E0D418A8];
  *(_QWORD *)&v3 = qword_1EF48D468;
  if (qword_1EF48D010 != -1)
    swift_once();
  qword_1EF48D6A0 = v0;
  unk_1EF48D6A8 = v1;
  qword_1EF48D688 = qword_1EF48D470;
  return sub_1BCBDB3C8(&v3, (uint64_t)&unk_1EF48D660);
}

uint64_t sub_1BCBE3F70()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  double IconSize;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_1;
  void (*v11)(uint64_t *, _QWORD *, uint64_t);
  void (*v12)(_QWORD *, uint64_t);
  void (*v13)(_QWORD *, uint64_t);
  void *v14;
  uint64_t v15;
  void (*v16)(_QWORD *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t *v18;
  id v19;
  void (*v20)(_QWORD *, _QWORD, uint64_t);
  uint64_t *v21;
  void (*v22)(uint64_t *, _QWORD *, uint64_t);
  id v23;
  void (*v24)(_QWORD *, uint64_t);
  uint64_t v25;
  uint64_t *v26;
  void (*v27)(uint64_t *, _QWORD *, uint64_t);
  id v28;
  void (*v29)(_QWORD *, uint64_t);
  uint64_t v30;
  void (*v31)(_QWORD *, uint64_t, uint64_t);
  uint64_t *v32;
  void (*v33)(uint64_t *, _QWORD *, uint64_t);
  id v34;
  void *v35;
  uint64_t v36;
  void (*v37)(_QWORD *, uint64_t, uint64_t);
  uint64_t v38;
  uint64_t *v39;
  id v40;
  void (*v41)(_QWORD *, uint64_t);
  uint64_t *v42;
  id v43;
  uint64_t *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  unsigned int v60;
  void (*v61)(_QWORD *, uint64_t);
  void (*v62)(_QWORD *, uint64_t, uint64_t);
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  __int128 v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;

  v0 = sub_1BCC00654();
  v1 = *(_QWORD **)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (uint64_t *)((char *)&v56 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = type metadata accessor for SmallLockupLayout.Metrics(0);
  __swift_allocate_value_buffer(v4, qword_1ED1BC370);
  v59 = v4;
  v57 = __swift_project_value_buffer(v4, (uint64_t)qword_1ED1BC370);
  IconSize = ASCLockupViewSizeGetIconSize(CFSTR("small"), 1);
  v7 = v6;
  v103 = MEMORY[0x1E0DEB070];
  v104 = MEMORY[0x1E0D425E8];
  *(_QWORD *)&v102 = 0x4024000000000000;
  v8 = (void *)*MEMORY[0x1E0DC4AB8];
  *v3 = *MEMORY[0x1E0DC4AB8];
  v9 = *MEMORY[0x1E0D418E0];
  v62 = (void (*)(_QWORD *, uint64_t, uint64_t))v1[13];
  v62(v3, v9, v0);
  v56 = sub_1BCC009E4();
  v100 = v56;
  v101 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v99);
  v97 = v0;
  v98 = MEMORY[0x1E0D418E8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v96);
  v11 = (void (*)(uint64_t *, _QWORD *, uint64_t))v1[2];
  v11(boxed_opaque_existential_1, v3, v0);
  v58 = v8;
  sub_1BCC009F0();
  v12 = (void (*)(_QWORD *, uint64_t))v1[1];
  v12(v3, v0);
  v13 = v12;
  v61 = v12;
  v14 = (void *)*MEMORY[0x1E0DC4A88];
  *v3 = *MEMORY[0x1E0DC4A88];
  v15 = v9;
  v60 = v9;
  v16 = v62;
  v62(v3, v9, v0);
  v17 = v56;
  v97 = v56;
  v98 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v96);
  v94 = v0;
  v95 = MEMORY[0x1E0D418E8];
  v18 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v93);
  v11(v18, v3, v0);
  v19 = v14;
  sub_1BCC009F0();
  v13(v3, v0);
  *v3 = v19;
  v16(v3, v15, v0);
  v20 = v16;
  v94 = v17;
  v95 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v93);
  v91 = v0;
  v92 = MEMORY[0x1E0D418E8];
  v21 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v90);
  v11(v21, v3, v0);
  v22 = v11;
  v23 = v19;
  sub_1BCC009F0();
  v24 = v61;
  v61(v3, v0);
  *v3 = v23;
  v25 = v60;
  v20(v3, v60, v0);
  v91 = v17;
  v92 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v90);
  v88 = v0;
  v89 = MEMORY[0x1E0D418E8];
  v26 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v87);
  v22(v26, v3, v0);
  v27 = v22;
  v28 = v23;
  sub_1BCC009F0();
  v24(v3, v0);
  v29 = v24;
  *v3 = v28;
  v30 = v25;
  v31 = v62;
  v62(v3, v30, v0);
  v88 = v17;
  v89 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v87);
  v85 = v0;
  v86 = MEMORY[0x1E0D418E8];
  v32 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v84);
  v33 = v27;
  v27(v32, v3, v0);
  v34 = v28;
  sub_1BCC009F0();
  v29(v3, v0);
  v35 = v58;
  *v3 = v58;
  v36 = v60;
  v37 = v31;
  v31(v3, v60, v0);
  v85 = v17;
  v38 = MEMORY[0x1E0D41DD0];
  v86 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v84);
  v82 = v0;
  v83 = MEMORY[0x1E0D418E8];
  v39 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v81);
  v33(v39, v3, v0);
  v40 = v35;
  sub_1BCC009F0();
  v41 = v61;
  v61(v3, v0);
  *v3 = v40;
  v37(v3, v36, v0);
  v82 = v17;
  v83 = v38;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v81);
  v79 = v0;
  v80 = MEMORY[0x1E0D418E8];
  v42 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v78);
  v33(v42, v3, v0);
  v43 = v40;
  sub_1BCC009F0();
  v41(v3, v0);
  *v3 = v43;
  v37(v3, v36, v0);
  v79 = v17;
  v80 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v78);
  v76 = v0;
  v77 = MEMORY[0x1E0D418E8];
  v44 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v75);
  v33(v44, v3, v0);
  v45 = v43;
  sub_1BCC009F0();
  v46 = v0;
  v47 = MEMORY[0x1E0D425E8];
  v41(v3, v46);
  v48 = MEMORY[0x1E0DEB070];
  v76 = MEMORY[0x1E0DEB070];
  v77 = v47;
  *(_QWORD *)&v75 = 0x4024000000000000;
  if (qword_1ED1BC9E0 != -1)
    swift_once();
  v73 = MEMORY[0x1E0DEF040];
  v74 = MEMORY[0x1E0D418A8];
  *(_QWORD *)&v72 = qword_1ED1BC9D8;
  v70 = v48;
  v71 = v47;
  *(_QWORD *)&v69 = 0;
  v49 = sub_1BCC008AC();
  v50 = MEMORY[0x1E0D41BB8];
  v67 = v49;
  v68 = MEMORY[0x1E0D41BB8];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v66);
  sub_1BCC008A0();
  v64 = v49;
  v65 = v50;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v63);
  sub_1BCC008A0();
  v51 = (double *)v57;
  v52 = v57 + *(int *)(v59 + 76);
  v53 = *MEMORY[0x1E0D42198];
  v54 = sub_1BCC00C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 104))(v52, v53, v54);
  *v51 = IconSize;
  *((_QWORD *)v51 + 1) = v7;
  sub_1BCBDB3C8(&v102, (uint64_t)(v51 + 2));
  sub_1BCBDB3C8(&v99, (uint64_t)(v51 + 7));
  sub_1BCBDB3C8(&v96, (uint64_t)(v51 + 12));
  sub_1BCBDB3C8(&v93, (uint64_t)(v51 + 17));
  sub_1BCBDB3C8(&v90, (uint64_t)(v51 + 22));
  sub_1BCBDB3C8(&v87, (uint64_t)(v51 + 27));
  sub_1BCBDB3C8(&v66, (uint64_t)(v51 + 32));
  sub_1BCBDB3C8(&v84, (uint64_t)(v51 + 37));
  sub_1BCBDB3C8(&v81, (uint64_t)(v51 + 42));
  sub_1BCBDB3C8(&v63, (uint64_t)(v51 + 47));
  sub_1BCBDB3C8(&v78, (uint64_t)(v51 + 52));
  sub_1BCBDB3C8(&v75, (uint64_t)(v51 + 57));
  sub_1BCBDB3C8(&v72, (uint64_t)(v51 + 62));
  return sub_1BCBDB3C8(&v69, (uint64_t)(v51 + 67));
}

uint64_t sub_1BCBE4618()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  double IconSize;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void (*v9)(_QWORD *, uint64_t, uint64_t);
  void (*v10)(_QWORD *, uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  void (*v12)(uint64_t *, _QWORD *, uint64_t);
  void *v13;
  void (*v14)(_QWORD *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t *v16;
  void (*v17)(uint64_t *, _QWORD *, uint64_t);
  id v18;
  void (*v19)(_QWORD *, uint64_t);
  uint64_t *v20;
  id v21;
  void (*v22)(_QWORD *, uint64_t);
  void *v23;
  void (*v24)(_QWORD *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t *v26;
  void (*v27)(uint64_t *, _QWORD *, uint64_t);
  id v28;
  uint64_t *v29;
  id v30;
  uint64_t *v31;
  id v32;
  uint64_t *v33;
  id v34;
  void (*v36)(uint64_t *, _QWORD *, uint64_t);
  void (*v37)(_QWORD *, uint64_t, uint64_t);
  void (*v38)(_QWORD *, uint64_t);
  uint64_t v39;
  id v40;
  uint64_t v41[5];
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;

  v0 = sub_1BCC00654();
  v1 = *(_QWORD **)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (void (**)(uint64_t *, _QWORD *, uint64_t))((char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  IconSize = ASCLockupViewSizeGetIconSize(CFSTR("medium"), 1);
  v6 = v5;
  v7 = (void *)*MEMORY[0x1E0DC4AB8];
  *v3 = *MEMORY[0x1E0DC4AB8];
  v8 = *MEMORY[0x1E0D418E0];
  v9 = (void (*)(_QWORD *, uint64_t, uint64_t))v1[13];
  v9(v3, v8, v0);
  v10 = v9;
  v39 = sub_1BCC009E4();
  v61 = v39;
  v62 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v60);
  v58 = v0;
  v59 = MEMORY[0x1E0D418E8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v57);
  v12 = (void (*)(uint64_t *, _QWORD *, uint64_t))v1[2];
  v12(boxed_opaque_existential_1, v3, v0);
  v40 = v7;
  sub_1BCC009F0();
  v38 = (void (*)(_QWORD *, uint64_t))v1[1];
  v38(v3, v0);
  v13 = (void *)*MEMORY[0x1E0DC4A88];
  *v3 = *MEMORY[0x1E0DC4A88];
  v14 = v10;
  v37 = v10;
  v10(v3, v8, v0);
  v15 = v39;
  v58 = v39;
  v59 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v57);
  v55 = v0;
  v56 = MEMORY[0x1E0D418E8];
  v16 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v54);
  v12(v16, v3, v0);
  v17 = v12;
  v36 = v12;
  v18 = v13;
  sub_1BCC009F0();
  v19 = v38;
  v38(v3, v0);
  *v3 = v18;
  v14(v3, v8, v0);
  v55 = v15;
  v56 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v54);
  v52 = v0;
  v53 = MEMORY[0x1E0D418E8];
  v20 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v51);
  v17(v20, v3, v0);
  v21 = v18;
  sub_1BCC009F0();
  v19(v3, v0);
  v22 = v19;
  v23 = v40;
  *v3 = v40;
  v24 = v37;
  v37(v3, v8, v0);
  v25 = v15;
  v52 = v15;
  v53 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v51);
  v49 = v0;
  v50 = MEMORY[0x1E0D418E8];
  v26 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v48);
  v27 = v36;
  v36(v26, v3, v0);
  v28 = v23;
  sub_1BCC009F0();
  v22(v3, v0);
  *v3 = v28;
  v24(v3, v8, v0);
  v49 = v25;
  v50 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v48);
  v46 = v0;
  v47 = MEMORY[0x1E0D418E8];
  v29 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v45);
  v27(v29, v3, v0);
  v30 = v28;
  sub_1BCC009F0();
  v22(v3, v0);
  *v3 = v30;
  v24(v3, v8, v0);
  v46 = v25;
  v47 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v45);
  v43 = v0;
  v44 = MEMORY[0x1E0D418E8];
  v31 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
  v27(v31, v3, v0);
  v32 = v30;
  sub_1BCC009F0();
  v22(v3, v0);
  *v3 = v32;
  v24(v3, v8, v0);
  v43 = v25;
  v44 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
  v41[3] = v0;
  v41[4] = MEMORY[0x1E0D418E8];
  v33 = __swift_allocate_boxed_opaque_existential_1(v41);
  v27(v33, v3, v0);
  v34 = v32;
  sub_1BCC009F0();
  v22(v3, v0);
  if (qword_1ED1BC228 != -1)
    swift_once();
  qword_1EF48D7F8 = MEMORY[0x1E0DEF040];
  unk_1EF48D800 = MEMORY[0x1E0D418A8];
  qword_1EF48D7E0 = qword_1ED1BC220;
  qword_1EF48D6B0 = *(_QWORD *)&IconSize;
  *(_QWORD *)algn_1EF48D6B8 = v6;
  qword_1EF48D6C0 = 0x402C000000000000;
  sub_1BCBDB3C8(&v60, (uint64_t)&unk_1EF48D6C8);
  sub_1BCBDB3C8(&v57, (uint64_t)&unk_1EF48D6F0);
  sub_1BCBDB3C8(&v54, (uint64_t)&unk_1EF48D718);
  sub_1BCBDB3C8(&v51, (uint64_t)&unk_1EF48D740);
  sub_1BCBDB3C8(&v48, (uint64_t)&unk_1EF48D768);
  sub_1BCBDB3C8(&v45, (uint64_t)&unk_1EF48D790);
  return sub_1BCBDB3C8(&v42, (uint64_t)&unk_1EF48D7B8);
}

uint64_t sub_1BCBE4B18()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  double IconSize;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void (*v9)(_QWORD *, uint64_t, uint64_t);
  void (*v10)(_QWORD *, uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  void (*v12)(uint64_t *, _QWORD *, uint64_t);
  void *v13;
  void (*v14)(_QWORD *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t *v16;
  void (*v17)(uint64_t *, _QWORD *, uint64_t);
  id v18;
  void (*v19)(_QWORD *, uint64_t);
  uint64_t *v20;
  id v21;
  void (*v22)(_QWORD *, uint64_t);
  void *v23;
  void (*v24)(_QWORD *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t *v26;
  void (*v27)(uint64_t *, _QWORD *, uint64_t);
  id v28;
  uint64_t *v29;
  id v30;
  uint64_t *v31;
  id v32;
  uint64_t *v33;
  id v34;
  void (*v36)(uint64_t *, _QWORD *, uint64_t);
  void (*v37)(_QWORD *, uint64_t, uint64_t);
  void (*v38)(_QWORD *, uint64_t);
  uint64_t v39;
  id v40;
  uint64_t v41[5];
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  uint64_t v61;
  uint64_t v62;

  v0 = sub_1BCC00654();
  v1 = *(_QWORD **)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (void (**)(uint64_t *, _QWORD *, uint64_t))((char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  IconSize = ASCLockupViewSizeGetIconSize(CFSTR("medium"), 2);
  v6 = v5;
  v7 = (void *)*MEMORY[0x1E0DC4AB8];
  *v3 = *MEMORY[0x1E0DC4AB8];
  v8 = *MEMORY[0x1E0D418E0];
  v9 = (void (*)(_QWORD *, uint64_t, uint64_t))v1[13];
  v9(v3, v8, v0);
  v10 = v9;
  v39 = sub_1BCC009E4();
  v61 = v39;
  v62 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v60);
  v58 = v0;
  v59 = MEMORY[0x1E0D418E8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v57);
  v12 = (void (*)(uint64_t *, _QWORD *, uint64_t))v1[2];
  v12(boxed_opaque_existential_1, v3, v0);
  v40 = v7;
  sub_1BCC009F0();
  v38 = (void (*)(_QWORD *, uint64_t))v1[1];
  v38(v3, v0);
  v13 = (void *)*MEMORY[0x1E0DC4A88];
  *v3 = *MEMORY[0x1E0DC4A88];
  v14 = v10;
  v37 = v10;
  v10(v3, v8, v0);
  v15 = v39;
  v58 = v39;
  v59 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v57);
  v55 = v0;
  v56 = MEMORY[0x1E0D418E8];
  v16 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v54);
  v12(v16, v3, v0);
  v17 = v12;
  v36 = v12;
  v18 = v13;
  sub_1BCC009F0();
  v19 = v38;
  v38(v3, v0);
  *v3 = v18;
  v14(v3, v8, v0);
  v55 = v15;
  v56 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v54);
  v52 = v0;
  v53 = MEMORY[0x1E0D418E8];
  v20 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v51);
  v17(v20, v3, v0);
  v21 = v18;
  sub_1BCC009F0();
  v19(v3, v0);
  v22 = v19;
  v23 = v40;
  *v3 = v40;
  v24 = v37;
  v37(v3, v8, v0);
  v25 = v15;
  v52 = v15;
  v53 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v51);
  v49 = v0;
  v50 = MEMORY[0x1E0D418E8];
  v26 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v48);
  v27 = v36;
  v36(v26, v3, v0);
  v28 = v23;
  sub_1BCC009F0();
  v22(v3, v0);
  *v3 = v28;
  v24(v3, v8, v0);
  v49 = v25;
  v50 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v48);
  v46 = v0;
  v47 = MEMORY[0x1E0D418E8];
  v29 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v45);
  v27(v29, v3, v0);
  v30 = v28;
  sub_1BCC009F0();
  v22(v3, v0);
  *v3 = v30;
  v24(v3, v8, v0);
  v46 = v25;
  v47 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v45);
  v43 = v0;
  v44 = MEMORY[0x1E0D418E8];
  v31 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
  v27(v31, v3, v0);
  v32 = v30;
  sub_1BCC009F0();
  v22(v3, v0);
  *v3 = v32;
  v24(v3, v8, v0);
  v43 = v25;
  v44 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v42);
  v41[3] = v0;
  v41[4] = MEMORY[0x1E0D418E8];
  v33 = __swift_allocate_boxed_opaque_existential_1(v41);
  v27(v33, v3, v0);
  v34 = v32;
  sub_1BCC009F0();
  v22(v3, v0);
  if (qword_1ED1BC228 != -1)
    swift_once();
  qword_1EF48D950 = MEMORY[0x1E0DEF040];
  unk_1EF48D958 = MEMORY[0x1E0D418A8];
  qword_1EF48D938 = qword_1ED1BC220;
  qword_1EF48D808 = *(_QWORD *)&IconSize;
  unk_1EF48D810 = v6;
  qword_1EF48D818 = 0x402E000000000000;
  sub_1BCBDB3C8(&v60, (uint64_t)&unk_1EF48D820);
  sub_1BCBDB3C8(&v57, (uint64_t)&unk_1EF48D848);
  sub_1BCBDB3C8(&v54, (uint64_t)&unk_1EF48D870);
  sub_1BCBDB3C8(&v51, (uint64_t)&unk_1EF48D898);
  sub_1BCBDB3C8(&v48, (uint64_t)&unk_1EF48D8C0);
  sub_1BCBDB3C8(&v45, (uint64_t)&unk_1EF48D8E8);
  return sub_1BCBDB3C8(&v42, (uint64_t)&unk_1EF48D910);
}

uint64_t sub_1BCBE5018()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  double IconSize;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;
  void (*v12)(_QWORD *, uint64_t);
  void *v13;
  void (*v14)(_QWORD *, uint64_t, uint64_t);
  uint64_t *v15;
  void (*v16)(uint64_t *, _QWORD *, uint64_t);
  id v17;
  uint64_t *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  id v23;
  void (*v24)(_QWORD *, _QWORD, uint64_t);
  uint64_t v25;
  uint64_t *v26;
  id v27;
  void *v28;
  void (*v29)(_QWORD *, _QWORD, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  void (*v33)(uint64_t *, _QWORD *, uint64_t);
  id v34;
  void (*v35)(_QWORD *, uint64_t);
  uint64_t *v36;
  id v37;
  uint64_t result;
  uint64_t v39;
  void (*v40)(_QWORD *, uint64_t);
  uint64_t v41;
  id v42;
  unsigned int v43;
  void (*v44)(uint64_t *, _QWORD *, uint64_t);
  void (*v45)(_QWORD *, uint64_t, uint64_t);
  uint64_t v46[5];
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;

  v0 = sub_1BCC00654();
  v1 = *(_QWORD **)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (uint64_t *)((char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (void *)sub_1BCC00DBC();
  IconSize = ASCLockupViewSizeGetIconSize(v4, 1);
  v7 = v6;

  v8 = (void *)*MEMORY[0x1E0DC4AB8];
  *v3 = *MEMORY[0x1E0DC4AB8];
  v9 = *MEMORY[0x1E0D418E0];
  v45 = (void (*)(_QWORD *, uint64_t, uint64_t))v1[13];
  v45(v3, v9, v0);
  v66 = sub_1BCC009E4();
  v67 = MEMORY[0x1E0D41DD0];
  v10 = v66;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v65);
  v63 = v0;
  v64 = MEMORY[0x1E0D418E8];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v62);
  v44 = (void (*)(uint64_t *, _QWORD *, uint64_t))v1[2];
  v44(boxed_opaque_existential_1, v3, v0);
  v42 = v8;
  sub_1BCC009F0();
  v12 = (void (*)(_QWORD *, uint64_t))v1[1];
  v12(v3, v0);
  v13 = (void *)*MEMORY[0x1E0DC4B58];
  *v3 = *MEMORY[0x1E0DC4B58];
  v43 = v9;
  v14 = v45;
  v45(v3, v9, v0);
  v63 = v10;
  v64 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v62);
  v60 = v0;
  v61 = MEMORY[0x1E0D418E8];
  v15 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v59);
  v16 = v44;
  v44(v15, v3, v0);
  v17 = v13;
  sub_1BCC009F0();
  v12(v3, v0);
  *v3 = v17;
  v14(v3, v9, v0);
  v60 = v10;
  v41 = v10;
  v61 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v59);
  v57 = v0;
  v58 = MEMORY[0x1E0D418E8];
  v18 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v56);
  v16(v18, v3, v0);
  v19 = v17;
  sub_1BCC009F0();
  v12(v3, v0);
  v20 = (void *)*MEMORY[0x1E0DC4B10];
  *v3 = *MEMORY[0x1E0DC4B10];
  v21 = v43;
  v14(v3, v43, v0);
  v57 = v10;
  v58 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v56);
  v54 = v0;
  v55 = MEMORY[0x1E0D418E8];
  v22 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v53);
  v16(v22, v3, v0);
  v23 = v20;
  sub_1BCC009F0();
  v12(v3, v0);
  v40 = v12;
  *v3 = v23;
  v24 = v45;
  v45(v3, v21, v0);
  v25 = v41;
  v54 = v41;
  v55 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v53);
  v51 = v0;
  v52 = MEMORY[0x1E0D418E8];
  v26 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v50);
  v16(v26, v3, v0);
  v27 = v23;
  sub_1BCC009F0();
  v12(v3, v0);
  v28 = v42;
  *v3 = v42;
  v29 = v24;
  v24(v3, v21, v0);
  v30 = v25;
  v51 = v25;
  v31 = MEMORY[0x1E0D41DD0];
  v52 = MEMORY[0x1E0D41DD0];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v50);
  v48 = v0;
  v49 = MEMORY[0x1E0D418E8];
  v32 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v47);
  v33 = v44;
  v44(v32, v3, v0);
  v34 = v28;
  sub_1BCC009F0();
  v35 = v40;
  v40(v3, v0);
  *v3 = v34;
  v29(v3, v43, v0);
  v48 = v30;
  v49 = v31;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v47);
  v46[3] = v0;
  v46[4] = MEMORY[0x1E0D418E8];
  v36 = __swift_allocate_boxed_opaque_existential_1(v46);
  v33(v36, v3, v0);
  v37 = v34;
  sub_1BCC009F0();
  v35(v3, v0);
  qword_1EF48D960 = *(_QWORD *)&IconSize;
  unk_1EF48D968 = v7;
  sub_1BCBDB3C8(&v65, (uint64_t)&unk_1EF48D970);
  sub_1BCBDB3C8(&v62, (uint64_t)&unk_1EF48D998);
  sub_1BCBDB3C8(&v59, (uint64_t)&unk_1EF48D9C0);
  sub_1BCBDB3C8(&v56, (uint64_t)&unk_1EF48D9F8);
  sub_1BCBDB3C8(&v53, (uint64_t)&unk_1EF48DA20);
  sub_1BCBDB3C8(&v50, (uint64_t)&unk_1EF48DA48);
  result = sub_1BCBDB3C8(&v47, (uint64_t)&unk_1EF48DA70);
  qword_1EF48D9E8 = 0;
  byte_1EF48D9F0 = 1;
  return result;
}

double static ASCLayoutProxy.smallOfferButtonLockupEstimatedSize(fitting:compatibleWith:)(void *a1, double a2)
{
  return sub_1BCBE6374(a1, &qword_1ED1BC1D0, (uint64_t)&unk_1ED1BC270, a2);
}

double static ASCLayoutProxy.mediumOfferButtonLockupEstimatedSize(fitting:compatibleWith:)(void *a1, double a2)
{
  return sub_1BCBE6374(a1, &qword_1EF48D048, (uint64_t)&unk_1EF48D660, a2);
}

double static ASCLayoutProxy.smallLockupEstimatedSize(fitting:compatibleWith:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  double v7;

  if (qword_1ED1BC388 != -1)
    swift_once();
  v2 = type metadata accessor for SmallLockupLayout.Metrics(0);
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1ED1BC370);
  sub_1BCC00C54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BCA08);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BCC09540;
  *(_QWORD *)(v4 + 32) = a1;
  sub_1BCC00E28();
  v5 = a1;
  v6 = (void *)sub_1BCC00C60();
  v7 = sub_1BCBE59C4(v3, v6);

  return v7;
}

double sub_1BCBE59C4(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  _QWORD v20[5];
  uint64_t v21[3];
  uint64_t v22;
  uint64_t v23;

  v4 = sub_1BCC009B4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BCC009D8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t, __n128))(v5 + 104))(v7, *MEMORY[0x1E0D41D80], v4, v10);
  sub_1BCC009C0();
  v13 = objc_msgSend(a2, sel_traitCollection);
  LOBYTE(v7) = sub_1BCC00E70();

  if ((v7 & 1) != 0)
  {
    v14 = *(_QWORD *)(a1 + 8);
    v20[3] = MEMORY[0x1E0DEF040];
    v20[4] = MEMORY[0x1E0D418A8];
    v20[0] = v14;
    v15 = sub_1BCC00C30();
    v16 = MEMORY[0x1E0D42218];
    v22 = v15;
    v23 = MEMORY[0x1E0D42218];
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1BCBDB05C(a1 + 16, (uint64_t)v20);
    v22 = v15;
    v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1BCBDB05C(a1 + 56, (uint64_t)v20);
    v22 = v15;
    v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1BCBDB05C(a1 + 216, (uint64_t)v20);
    v22 = v15;
    v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1BCBDB05C(a1 + 296, (uint64_t)v20);
    v22 = v15;
    v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1BCBDB05C(a1 + 336, (uint64_t)v20);
    v22 = v15;
    v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1BCBDB05C(a1 + 456, (uint64_t)v20);
    v22 = v15;
    v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1BCBDB05C(a1 + 496, (uint64_t)v20);
    v22 = v15;
    v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1BCBDB05C(a1 + 416, (uint64_t)v20);
    v22 = v15;
    v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1BCBDB05C(a1 + 536, (uint64_t)v20);
  }
  else
  {
    sub_1BCBDB05C(a1 + 96, (uint64_t)v20);
    v15 = sub_1BCC00C30();
    v16 = MEMORY[0x1E0D42218];
    v22 = v15;
    v23 = MEMORY[0x1E0D42218];
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1BCBDB05C(a1 + 296, (uint64_t)v20);
    v22 = v15;
    v23 = v16;
    __swift_allocate_boxed_opaque_existential_1(v21);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
    sub_1BCBDB05C(a1 + 416, (uint64_t)v20);
  }
  v22 = v15;
  v23 = v16;
  __swift_allocate_boxed_opaque_existential_1(v21);
  sub_1BCC00C3C();
  sub_1BCC009CC();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  sub_1BCC009A8();
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  return v18;
}

double _s18AppStoreComponents14ASCLayoutProxyC23miniLockupEstimatedSize7fitting14compatibleWithSo6CGSizeVAH_So17UITraitCollectionCtFZ_0(uint64_t a1, double a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  _BYTE v32[337];
  __int128 v33;
  ValueMetadata *v34;
  unint64_t v35;
  uint64_t v36[3];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39[5];
  uint64_t v40[5];
  _OWORD v41[11];
  __int128 v42[22];

  v28 = a1;
  v29 = sub_1BCC00D08();
  v27 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1BCC0090C();
  MEMORY[0x1E0C80A78](v5);
  v26 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1BCC00BC4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1BCC00990();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EF48D030 != -1)
    swift_once();
  sub_1BCBE8338(&qword_1EF48D4F8, v41);
  if (qword_1EF48D040 != -1)
    swift_once();
  v15 = qword_1EF48D098;
  v16 = (id)qword_1EF48D658;
  if (v15 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v11, (uint64_t)qword_1EF48FC38);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v17, v11);
  v40[3] = sub_1BCC009FC();
  v40[4] = MEMORY[0x1E0D41E00];
  __swift_allocate_boxed_opaque_existential_1(v40);
  sub_1BCC00A08();
  if (qword_1EF48D018 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v7, (uint64_t)qword_1EF48D478);
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v19(v10, v18, v7);
  sub_1BCC00A14();
  v20 = sub_1BCC00A20();
  v21 = MEMORY[0x1E0D41E38];
  v39[3] = v20;
  v39[4] = MEMORY[0x1E0D41E38];
  __swift_allocate_boxed_opaque_existential_1(v39);
  sub_1BCC00A38();
  if (qword_1EF48D020 != -1)
    swift_once();
  v22 = __swift_project_value_buffer(v7, (uint64_t)qword_1EF48D490);
  v19(v10, v22, v7);
  sub_1BCC00A14();
  v37 = v20;
  v38 = v21;
  __swift_allocate_boxed_opaque_existential_1(v36);
  sub_1BCC00A38();
  if (qword_1EF48D028 != -1)
    swift_once();
  v34 = &type metadata for OfferButtonPlaceholder;
  v35 = sub_1BCBE8654();
  *(_QWORD *)&v33 = swift_allocObject();
  sub_1BCBE86C4((uint64_t)&unk_1EF48D4A8, v33 + 16);
  sub_1BCBE8338(v41, v32);
  sub_1BCBDB05C((uint64_t)v40, (uint64_t)&v32[176]);
  sub_1BCBDB05C((uint64_t)v39, (uint64_t)&v32[216]);
  sub_1BCBE8414((uint64_t)v36, (uint64_t)&v30);
  if (v31)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    sub_1BCBE845C((uint64_t)v41);
    sub_1BCBDB3C8(&v30, (uint64_t)v42);
  }
  else
  {
    sub_1BCC00900();
    sub_1BCC00A14();
    *((_QWORD *)&v42[1] + 1) = v20;
    *(_QWORD *)&v42[2] = v21;
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)v42);
    sub_1BCC00A2C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v39);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    sub_1BCBE845C((uint64_t)v41);
    sub_1BCBE8490((uint64_t)&v30);
  }
  sub_1BCBDB3C8(v42, (uint64_t)&v32[256]);
  v23 = v37 == 0;
  sub_1BCBE8490((uint64_t)v36);
  v32[336] = v23;
  sub_1BCBDB3C8(&v33, (uint64_t)&v32[296]);
  memcpy(v42, v32, 0x151uLL);
  sub_1BCBF3784((uint64_t)v4);
  v24 = v29;
  sub_1BCC00D8C();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v24);
  sub_1BCBE8700((uint64_t)v42);
  return a2;
}

double sub_1BCBE6374(void *a1, _QWORD *a2, uint64_t a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v20[2];
  _BYTE v21[24];
  uint64_t v22;
  _QWORD v23[4];

  v8 = sub_1BCC00F54();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*a2 != -1)
    swift_once();
  sub_1BCBE81D0(a3, (uint64_t)v21);
  sub_1BCC00C54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BCA08);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BCC09540;
  *(_QWORD *)(v12 + 32) = a1;
  v20[1] = v12;
  sub_1BCC00E28();
  v13 = a1;
  v14 = (void *)sub_1BCC00C60();
  v15 = objc_msgSend(v14, sel_traitCollection);
  v16 = sub_1BCC00E70();

  if ((v16 & 1) != 0)
  {
    v17 = v23;
    v18 = v23[3];
  }
  else
  {
    v18 = v22;
    v17 = v21;
  }
  __swift_project_boxed_opaque_existential_1(v17, v18);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  sub_1BCBE8620((uint64_t)v21);
  return a4;
}

double sub_1BCBE651C(_QWORD *a1, void *a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char *v10;
  id v11;
  void (*v12)(char *, uint64_t);
  uint64_t v14;

  v6 = sub_1BCC00F54();
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)&v8 = MEMORY[0x1E0C80A78](v6).n128_u64[0];
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(a2, sel_traitCollection, v8);
  __swift_project_boxed_opaque_existential_1(a1 + 8, a1[11]);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  v12 = *(void (**)(char *, uint64_t))(v7 + 8);
  v12(v10, v6);
  if ((sub_1BCC00E58() & 1) != 0)
  {
    __swift_project_boxed_opaque_existential_1(a1 + 18, a1[21]);
    sub_1BCBE8C78();
    sub_1BCC007BC();
    v12(v10, v6);
  }
  else
  {
    if ((sub_1BCC00E70() & 1) != 0)
      __swift_project_boxed_opaque_existential_1(a1 + 18, a1[21]);
    else
      __swift_project_boxed_opaque_existential_1(a1 + 23, a1[26]);
    sub_1BCBE8C78();
    sub_1BCC007BC();
    v12(v10, v6);
    __swift_project_boxed_opaque_existential_1(a1 + 28, a1[31]);
    sub_1BCBE8C78();
    sub_1BCC007BC();
    v12(v10, v6);
  }
  __swift_project_boxed_opaque_existential_1(a1 + 33, a1[36]);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  v12(v10, v6);
  __swift_project_boxed_opaque_existential_1(a1 + 38, a1[41]);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  v12(v10, v6);
  sub_1BCC00E70();

  return a3;
}

double _s18AppStoreComponents14ASCLayoutProxyC25mediumLockupEstimatedSize7fitting14compatibleWithSo6CGSizeVAH_So17UITraitCollectionCtFZ_0(void *a1, double a2)
{
  uint64_t *v4;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  _QWORD v10[43];

  if (objc_msgSend(a1, sel_horizontalSizeClass) == (id)1)
  {
    if (qword_1EF48D050 != -1)
      swift_once();
    v4 = &qword_1EF48D6B0;
  }
  else
  {
    if (qword_1EF48D058 != -1)
      swift_once();
    v4 = &qword_1EF48D808;
  }
  sub_1BCBE7F0C((uint64_t)v4, (uint64_t)v10);
  sub_1BCC00C54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BCA08);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1BCC09540;
  *(_QWORD *)(v5 + 32) = a1;
  sub_1BCC00E28();
  v6 = a1;
  v7 = (void *)sub_1BCC00C60();
  v8 = sub_1BCBE651C(v10, v7, a2);

  sub_1BCBE80DC((uint64_t)v10);
  return v8;
}

uint64_t _s18AppStoreComponents14ASCLayoutProxyC12lockupLayout6ofSize15traitCollection11artworkView11headingText05titleO008subtitleO005offerO00R6Button5badgeACSo09ASCLockupmI0a_So07UITraitK0CSo6UIViewCSo7UILabelCSgA2uv2SSgtFZ_0(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  objc_class *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  void *v40;
  objc_class *v41;
  id v42;
  id v43;
  id v44;
  uint64_t result;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  void *v53;
  objc_class *v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  _QWORD *v72;
  void *v73;
  uint64_t *boxed_opaque_existential_1;
  objc_class *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  id v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  objc_class *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char v111;
  uint64_t v112;
  unint64_t v113;
  id v114;
  void *v115;
  void *v116;
  id v117;
  uint64_t v118;
  void *v119;
  objc_class *v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  unint64_t v136;
  id v137;
  void *v138;
  void *v139;
  id v140;
  uint64_t v141;
  void *v142;
  objc_class *v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  char *v152;
  void *v153;
  id v154;
  id v155;
  void *v156;
  id v157;
  void *v158;
  objc_super v159;
  __int128 v160;
  uint64_t v161;
  __int128 v162;
  uint64_t v163;
  uint64_t v164;
  objc_super v165;
  objc_super v166;
  objc_super v167;
  objc_super v168;
  __int128 v169;
  __int128 v170;
  uint64_t v171;
  _BYTE v172[344];
  _BYTE v173[344];
  uint64_t v174;
  _BYTE v175[32];
  uint64_t v176;
  _BYTE v177[32];
  uint64_t v178;
  _BYTE v179[32];
  uint64_t v180;
  _BYTE v181[32];
  uint64_t v182;
  void *v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;
  uint64_t v187;
  _OWORD v188[22];
  objc_super v189;
  objc_super v190;
  __int128 v191;
  __int128 v192;
  uint64_t v193;
  __int128 v194;
  uint64_t v195;
  uint64_t v196;
  __int128 v197;
  __int128 v198;
  uint64_t v199;
  __int128 v200;
  __int128 v201;
  unint64_t v202;

  v157 = a3;
  v158 = a8;
  v153 = a7;
  v154 = a6;
  v155 = a4;
  v156 = a5;
  v151 = a2;
  v9 = type metadata accessor for SmallLockupLayout.Metrics(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v151 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (int *)type metadata accessor for SmallLockupLayout(0);
  MEMORY[0x1E0C80A78](v12);
  v152 = (char *)&v151 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1BCC0090C();
  MEMORY[0x1E0C80A78](v14);
  v15 = (void *)sub_1BCC00DBC();
  v16 = sub_1BCC00DE0();
  v18 = v17;
  if (v16 == sub_1BCC00DE0() && v18 == v19)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_5;
  }
  v20 = sub_1BCC00F60();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v20 & 1) != 0)
  {
LABEL_5:
    v21 = v156;
    if (v155)
    {
      v22 = v155;
      if ((objc_msgSend(v22, sel_isHidden) & 1) == 0 && objc_msgSend(v22, sel_hasContent))
      {
        v23 = qword_1EF48D038;
        v24 = v22;
        v25 = v21;
        if (v23 != -1)
          swift_once();
        sub_1BCBE8338(&qword_1EF48D5A8, v188);

LABEL_15:
        sub_1BCBE8338(v188, v172);
        *(_QWORD *)v173 = v157;
        sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
        sub_1BCC00720();
        *(_QWORD *)v173 = v24;
        sub_1BCBE32A8(0, &qword_1ED1BC8D0);
        sub_1BCC00720();
        *(_QWORD *)v173 = v25;
        sub_1BCC00720();
        *(_QWORD *)v173 = v158;
        sub_1BCC00720();
        *((_QWORD *)&v201 + 1) = &type metadata for MiniLockupLayout;
        v202 = sub_1BCBE8374();
        v27 = swift_allocObject();
        v28 = (void *)(v27 + 16);
        *(_QWORD *)&v200 = v27;
        sub_1BCBE8338(v172, v173);
        sub_1BCBDB05C((uint64_t)&v197, (uint64_t)&v173[176]);
        sub_1BCBDB05C((uint64_t)&v194, (uint64_t)&v173[216]);
        sub_1BCBE8414((uint64_t)&v191, (uint64_t)&v160);
        if (v161)
        {
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v194);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v197);
          sub_1BCBE845C((uint64_t)v172);
          sub_1BCBDB3C8(&v160, (uint64_t)&v162);
        }
        else
        {
          sub_1BCC00900();
          sub_1BCC00A14();
          v163 = sub_1BCC00A20();
          v164 = MEMORY[0x1E0D41E38];
          __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v162);
          sub_1BCC00A2C();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v194);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v197);
          sub_1BCBE845C((uint64_t)v172);
          sub_1BCBE8490((uint64_t)&v160);
        }
        sub_1BCBDB3C8(&v162, (uint64_t)&v173[256]);
        v29 = *((_QWORD *)&v192 + 1) == 0;
        sub_1BCBE8490((uint64_t)&v191);
        v173[336] = v29;
        sub_1BCBDB3C8(&v169, (uint64_t)&v173[296]);
        memcpy(v28, v173, 0x151uLL);
        sub_1BCBDB3C8(&v200, (uint64_t)v172);
        *(_QWORD *)&v173[24] = &type metadata for PlaceableLayoutProxy;
        *(_QWORD *)&v173[32] = sub_1BCBE84D0();
        *(_QWORD *)&v173[40] = sub_1BCBE8514();
        *(_QWORD *)v173 = swift_allocObject();
        sub_1BCBE857C((uint64_t)v172, *(_QWORD *)v173 + 16);
        v30 = (objc_class *)type metadata accessor for ASCLayoutProxy();
        v31 = objc_allocWithZone(v30);
        sub_1BCBE0C18((uint64_t)v173, (uint64_t)v31 + OBJC_IVAR_____ASCLayoutProxy_base);
        v159.receiver = v31;
        v159.super_class = v30;
        v32 = objc_msgSendSuper2(&v159, sel_init);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v173);
        sub_1BCBE85B8((uint64_t)v172);

        sub_1BCBE845C((uint64_t)v188);
        return (uint64_t)v32;
      }

    }
    v26 = qword_1EF48D030;
    v25 = v154;
    if (v26 != -1)
      swift_once();
    sub_1BCBE8338(&qword_1EF48D4F8, v188);
    v24 = v21;
    goto LABEL_15;
  }
  v33 = (void *)sub_1BCC00DBC();
  v34 = sub_1BCC00DE0();
  v36 = v35;
  if (v34 == sub_1BCC00DE0() && v36 == v37)
  {

    swift_bridgeObjectRelease_n();
LABEL_23:
    if (qword_1ED1BC1D0 != -1)
      swift_once();
    sub_1BCBE81D0((uint64_t)&unk_1ED1BC270, (uint64_t)v173);
    v39 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
    *(_QWORD *)&v173[112] = MEMORY[0x1E0D42690];
    *(_QWORD *)&v173[104] = v39;
    v40 = v158;
    *(_QWORD *)&v173[80] = v158;
    *((_QWORD *)&v188[1] + 1) = &type metadata for OfferButtonLockupLayout;
    *(_QWORD *)&v188[2] = sub_1BCBE820C();
    *((_QWORD *)&v188[2] + 1) = sub_1BCBE8250();
    *(_QWORD *)&v188[0] = swift_allocObject();
    sub_1BCBE82C8(v173, (_OWORD *)(*(_QWORD *)&v188[0] + 16));
    v41 = (objc_class *)type metadata accessor for ASCLayoutProxy();
    v42 = objc_allocWithZone(v41);
    sub_1BCBE0C18((uint64_t)v188, (uint64_t)v42 + OBJC_IVAR_____ASCLayoutProxy_base);
    v165.receiver = v42;
    v165.super_class = v41;
    v43 = v40;
    v44 = objc_msgSendSuper2(&v165, sel_init);
LABEL_26:
    v32 = v44;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v188);
    sub_1BCBE8304((uint64_t)v173);
    return (uint64_t)v32;
  }
  v38 = sub_1BCC00F60();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v38 & 1) != 0)
    goto LABEL_23;
  v46 = (void *)sub_1BCC00DBC();
  v47 = sub_1BCC00DE0();
  v49 = v48;
  if (v47 == sub_1BCC00DE0() && v49 == v50)
  {

    swift_bridgeObjectRelease_n();
LABEL_32:
    if (qword_1EF48D048 != -1)
      swift_once();
    sub_1BCBE81D0((uint64_t)&unk_1EF48D660, (uint64_t)v173);
    v52 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
    *(_QWORD *)&v173[112] = MEMORY[0x1E0D42690];
    *(_QWORD *)&v173[104] = v52;
    v53 = v158;
    *(_QWORD *)&v173[80] = v158;
    *((_QWORD *)&v188[1] + 1) = &type metadata for OfferButtonLockupLayout;
    *(_QWORD *)&v188[2] = sub_1BCBE820C();
    *((_QWORD *)&v188[2] + 1) = sub_1BCBE8250();
    *(_QWORD *)&v188[0] = swift_allocObject();
    sub_1BCBE82C8(v173, (_OWORD *)(*(_QWORD *)&v188[0] + 16));
    v54 = (objc_class *)type metadata accessor for ASCLayoutProxy();
    v55 = objc_allocWithZone(v54);
    sub_1BCBE0C18((uint64_t)v188, (uint64_t)v55 + OBJC_IVAR_____ASCLayoutProxy_base);
    v166.receiver = v55;
    v166.super_class = v54;
    v56 = v53;
    v44 = objc_msgSendSuper2(&v166, sel_init);
    goto LABEL_26;
  }
  v51 = sub_1BCC00F60();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v51 & 1) != 0)
    goto LABEL_32;
  v57 = sub_1BCC00DE0();
  v59 = v58;
  if (v57 == sub_1BCC00DE0() && v59 == v60)
  {
    swift_bridgeObjectRelease_n();
LABEL_39:
    if (qword_1ED1BC388 != -1)
      swift_once();
    v62 = __swift_project_value_buffer(v9, (uint64_t)qword_1ED1BC370);
    sub_1BCBE31E0(v62, (uint64_t)v11, type metadata accessor for SmallLockupLayout.Metrics);
    v63 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
    v64 = MEMORY[0x1E0D42690];
    *(_QWORD *)&v173[32] = MEMORY[0x1E0D42690];
    *(_QWORD *)&v173[24] = v63;
    v65 = v156;
    *(_QWORD *)v173 = v157;
    v66 = v153;
    v67 = v155;
    if (v155)
    {
      v68 = sub_1BCBE32A8(0, &qword_1ED1BC8D0);
      *(_QWORD *)&v188[2] = MEMORY[0x1E0D426C0];
      *((_QWORD *)&v188[1] + 1) = v68;
      *(_QWORD *)&v188[0] = v67;
    }
    else
    {
      memset(v188, 0, 40);
    }
    v69 = sub_1BCBE32A8(0, &qword_1ED1BC8D0);
    *(_QWORD *)&v172[24] = v69;
    *(_QWORD *)&v172[32] = MEMORY[0x1E0D426C0];
    *(_QWORD *)v172 = v65;
    *((_QWORD *)&v201 + 1) = v69;
    v202 = MEMORY[0x1E0D426C0];
    *(_QWORD *)&v200 = v154;
    if (v66)
    {
      *((_QWORD *)&v198 + 1) = v69;
      v199 = MEMORY[0x1E0D426C0];
      *(_QWORD *)&v197 = v66;
    }
    else
    {
      v199 = 0;
      v197 = 0u;
      v198 = 0u;
    }
    v70 = (uint64_t)v152;
    v71 = &v152[v12[10]];
    *((_QWORD *)v71 + 4) = 0;
    *(_OWORD *)v71 = 0u;
    *((_OWORD *)v71 + 1) = 0u;
    v72 = (_QWORD *)(v70 + v12[11]);
    v72[3] = v63;
    v72[4] = v64;
    v73 = v158;
    *v72 = v158;
    sub_1BCBE8110((uint64_t)v11, v70);
    sub_1BCBDB3C8((__int128 *)v173, v70 + v12[5]);
    sub_1BCBE32E0((uint64_t)v188, v70 + v12[6], &qword_1ED1BC8B0);
    sub_1BCBDB3C8((__int128 *)v172, v70 + v12[7]);
    sub_1BCBDB3C8(&v200, v70 + v12[8]);
    sub_1BCBE32E0((uint64_t)&v197, v70 + v12[9], &qword_1ED1BC8B0);
    *(_QWORD *)&v173[24] = v12;
    *(_QWORD *)&v173[32] = sub_1BCBE8154(&qword_1ED1BC3A8, (uint64_t)&unk_1BCC0A388);
    *(_QWORD *)&v173[40] = sub_1BCBE8154(qword_1ED1BC3B0, (uint64_t)&unk_1BCC0A360);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)v173);
    sub_1BCBE31E0(v70, (uint64_t)boxed_opaque_existential_1, type metadata accessor for SmallLockupLayout);
    v75 = (objc_class *)type metadata accessor for ASCLayoutProxy();
    v76 = objc_allocWithZone(v75);
    sub_1BCBE0C18((uint64_t)v173, (uint64_t)v76 + OBJC_IVAR_____ASCLayoutProxy_base);
    v167.receiver = v76;
    v167.super_class = v75;
    v77 = v67;
    v78 = v65;
    v79 = v154;
    v80 = v73;
    v81 = v157;
    v82 = v66;
    v32 = objc_msgSendSuper2(&v167, sel_init);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v173);
    sub_1BCBE8194(v70);
    return (uint64_t)v32;
  }
  v61 = sub_1BCC00F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v61 & 1) != 0)
    goto LABEL_39;
  v83 = sub_1BCC00DE0();
  v85 = v84;
  if (v83 == sub_1BCC00DE0() && v85 == v86)
  {
    swift_bridgeObjectRelease_n();
LABEL_52:
    v88 = objc_msgSend(v151, sel_horizontalSizeClass);
    v89 = v157;
    if (v88 == (id)1)
    {
      v91 = v155;
      v90 = v156;
      v92 = v153;
      if (qword_1EF48D050 != -1)
        swift_once();
      v93 = &qword_1EF48D6B0;
    }
    else
    {
      v91 = v155;
      v90 = v156;
      v92 = v153;
      if (qword_1EF48D058 != -1)
        swift_once();
      v93 = &qword_1EF48D808;
    }
    sub_1BCBE7F0C((uint64_t)v93, (uint64_t)v188);
    sub_1BCBE7F0C((uint64_t)v188, (uint64_t)v172);
    v94 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
    v95 = MEMORY[0x1E0D42690];
    *((_QWORD *)&v201 + 1) = v94;
    v202 = MEMORY[0x1E0D42690];
    *(_QWORD *)&v200 = v89;
    if (v91)
    {
      *((_QWORD *)&v198 + 1) = sub_1BCBE32A8(0, &qword_1ED1BC8D0);
      v199 = MEMORY[0x1E0D426C0];
      *(_QWORD *)&v197 = v91;
    }
    else
    {
      v199 = 0;
      v197 = 0u;
      v198 = 0u;
    }
    v96 = sub_1BCBE32A8(0, &qword_1ED1BC8D0);
    v195 = v96;
    v196 = MEMORY[0x1E0D426C0];
    v193 = MEMORY[0x1E0D426C0];
    *(_QWORD *)&v194 = v90;
    *((_QWORD *)&v192 + 1) = v96;
    *(_QWORD *)&v191 = v154;
    if (v92)
    {
      *((_QWORD *)&v170 + 1) = v96;
      v171 = MEMORY[0x1E0D426C0];
      *(_QWORD *)&v169 = v92;
    }
    else
    {
      v171 = 0;
      v169 = 0u;
      v170 = 0u;
    }
    v186 = v94;
    v187 = v95;
    v97 = v158;
    v185 = (unint64_t)v158;
    memcpy(v173, v172, sizeof(v173));
    sub_1BCBDB3C8(&v200, (uint64_t)&v174);
    sub_1BCBE32E0((uint64_t)&v197, (uint64_t)&v176, &qword_1ED1BC8B0);
    sub_1BCBDB3C8(&v194, (uint64_t)&v178);
    sub_1BCBDB3C8(&v191, (uint64_t)&v180);
    sub_1BCBE32E0((uint64_t)&v169, (uint64_t)&v182, &qword_1ED1BC8B0);
    *(_QWORD *)&v172[24] = &type metadata for MediumLockupLayout;
    *(_QWORD *)&v172[32] = sub_1BCBE7F48();
    *(_QWORD *)&v172[40] = sub_1BCBE7F8C();
    *(_QWORD *)v172 = swift_allocObject();
    sub_1BCBE806C((uint64_t)v173, *(_QWORD *)v172 + 16);
    v98 = (objc_class *)type metadata accessor for ASCLayoutProxy();
    v99 = objc_allocWithZone(v98);
    sub_1BCBE0C18((uint64_t)v172, (uint64_t)v99 + OBJC_IVAR_____ASCLayoutProxy_base);
    v168.receiver = v99;
    v168.super_class = v98;
    v100 = v91;
    v101 = v90;
    v102 = v154;
    v103 = v97;
    v104 = v89;
    v105 = v92;
    v32 = objc_msgSendSuper2(&v168, sel_init);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v172);
    sub_1BCBE80A8((uint64_t)v173);
    sub_1BCBE80DC((uint64_t)v188);
    return (uint64_t)v32;
  }
  v87 = sub_1BCC00F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v87 & 1) != 0)
    goto LABEL_52;
  v106 = (void *)sub_1BCC00DBC();
  v107 = sub_1BCC00DE0();
  v109 = v108;
  if (v107 == sub_1BCC00DE0() && v109 == v110)
  {

    swift_bridgeObjectRelease_n();
LABEL_70:
    if (qword_1EF48D060 != -1)
      swift_once();
    sub_1BCBDE394((uint64_t)&qword_1EF48D960, (uint64_t)v188);
    v112 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
    v113 = MEMORY[0x1E0D42690];
    *(_QWORD *)&v172[24] = v112;
    *(_QWORD *)&v172[32] = MEMORY[0x1E0D42690];
    v115 = v156;
    v114 = v157;
    *(_QWORD *)v172 = v157;
    v116 = v153;
    v117 = v155;
    if (v155)
    {
      *((_QWORD *)&v201 + 1) = sub_1BCBE32A8(0, &qword_1ED1BC8D0);
      v202 = v113;
      *(_QWORD *)&v200 = v117;
    }
    else
    {
      v202 = 0;
      v200 = 0u;
      v201 = 0u;
    }
    v118 = sub_1BCBE32A8(0, &qword_1ED1BC8D0);
    *((_QWORD *)&v198 + 1) = v118;
    v199 = MEMORY[0x1E0D426C0];
    v196 = MEMORY[0x1E0D426C0];
    *(_QWORD *)&v197 = v115;
    v195 = v118;
    *(_QWORD *)&v194 = v154;
    if (v116)
    {
      *((_QWORD *)&v192 + 1) = v118;
      v193 = MEMORY[0x1E0D426C0];
      *(_QWORD *)&v191 = v116;
    }
    else
    {
      v193 = 0;
      v191 = 0u;
      v192 = 0u;
    }
    v184 = v112;
    v185 = v113;
    v119 = v158;
    v183 = v158;
    memcpy(v173, v188, 0x138uLL);
    sub_1BCBDB3C8((__int128 *)v172, (uint64_t)&v173[312]);
    sub_1BCBE32E0((uint64_t)&v200, (uint64_t)v175, &qword_1ED1BC8A8);
    sub_1BCBDB3C8(&v197, (uint64_t)v177);
    sub_1BCBDB3C8(&v194, (uint64_t)v179);
    sub_1BCBE32E0((uint64_t)&v191, (uint64_t)v181, &qword_1ED1BC8B0);
    *((_QWORD *)&v188[1] + 1) = &type metadata for AppShowcaseLockupLayout;
    *(_QWORD *)&v188[2] = sub_1BCBE7D80();
    *((_QWORD *)&v188[2] + 1) = sub_1BCBE7DC4();
    *(_QWORD *)&v188[0] = swift_allocObject();
    sub_1BCBE7E9C((uint64_t)v173, *(_QWORD *)&v188[0] + 16);
    v120 = (objc_class *)type metadata accessor for ASCLayoutProxy();
    v121 = objc_allocWithZone(v120);
    sub_1BCBE0C18((uint64_t)v188, (uint64_t)v121 + OBJC_IVAR_____ASCLayoutProxy_base);
    v189.receiver = v121;
    v189.super_class = v120;
    v122 = v117;
    v123 = v115;
    v124 = v154;
    v125 = v119;
    v126 = v114;
    v127 = v116;
    v128 = objc_msgSendSuper2(&v189, sel_init);
LABEL_92:
    v32 = v128;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v188);
    sub_1BCBE7ED8((uint64_t)v173);
    return (uint64_t)v32;
  }
  v111 = sub_1BCC00F60();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v111 & 1) != 0)
    goto LABEL_70;
  v129 = (void *)sub_1BCC00DBC();
  v130 = sub_1BCC00DE0();
  v132 = v131;
  if (v130 == sub_1BCC00DE0() && v132 == v133)
  {

    swift_bridgeObjectRelease_n();
LABEL_83:
    if (qword_1EF48CFE0 != -1)
      swift_once();
    sub_1BCBDE394((uint64_t)&qword_1EF48FB00, (uint64_t)v188);
    v135 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
    v136 = MEMORY[0x1E0D42690];
    *(_QWORD *)&v172[24] = v135;
    *(_QWORD *)&v172[32] = MEMORY[0x1E0D42690];
    v138 = v156;
    v137 = v157;
    *(_QWORD *)v172 = v157;
    v139 = v153;
    v140 = v155;
    if (v155)
    {
      *((_QWORD *)&v201 + 1) = sub_1BCBE32A8(0, &qword_1ED1BC8D0);
      v202 = v136;
      *(_QWORD *)&v200 = v140;
    }
    else
    {
      v202 = 0;
      v200 = 0u;
      v201 = 0u;
    }
    v141 = sub_1BCBE32A8(0, &qword_1ED1BC8D0);
    *((_QWORD *)&v198 + 1) = v141;
    v199 = MEMORY[0x1E0D426C0];
    v196 = MEMORY[0x1E0D426C0];
    *(_QWORD *)&v197 = v138;
    v195 = v141;
    *(_QWORD *)&v194 = v154;
    if (v139)
    {
      *((_QWORD *)&v192 + 1) = v141;
      v193 = MEMORY[0x1E0D426C0];
      *(_QWORD *)&v191 = v139;
    }
    else
    {
      v193 = 0;
      v191 = 0u;
      v192 = 0u;
    }
    v184 = v135;
    v185 = v136;
    v142 = v158;
    v183 = v158;
    memcpy(v173, v188, 0x138uLL);
    sub_1BCBDB3C8((__int128 *)v172, (uint64_t)&v173[312]);
    sub_1BCBE32E0((uint64_t)&v200, (uint64_t)v175, &qword_1ED1BC8A8);
    sub_1BCBDB3C8(&v197, (uint64_t)v177);
    sub_1BCBDB3C8(&v194, (uint64_t)v179);
    sub_1BCBE32E0((uint64_t)&v191, (uint64_t)v181, &qword_1ED1BC8B0);
    *((_QWORD *)&v188[1] + 1) = &type metadata for AppShowcaseLockupLayout;
    *(_QWORD *)&v188[2] = sub_1BCBE7D80();
    *((_QWORD *)&v188[2] + 1) = sub_1BCBE7DC4();
    *(_QWORD *)&v188[0] = swift_allocObject();
    sub_1BCBE7E9C((uint64_t)v173, *(_QWORD *)&v188[0] + 16);
    v143 = (objc_class *)type metadata accessor for ASCLayoutProxy();
    v144 = objc_allocWithZone(v143);
    sub_1BCBE0C18((uint64_t)v188, (uint64_t)v144 + OBJC_IVAR_____ASCLayoutProxy_base);
    v190.receiver = v144;
    v190.super_class = v143;
    v145 = v140;
    v146 = v138;
    v147 = v154;
    v148 = v142;
    v149 = v137;
    v150 = v139;
    v128 = objc_msgSendSuper2(&v190, sel_init);
    goto LABEL_92;
  }
  v134 = sub_1BCC00F60();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v134 & 1) != 0)
    goto LABEL_83;
  *(_QWORD *)v173 = 0;
  *(_QWORD *)&v173[8] = 0xE000000000000000;
  sub_1BCC00EE8();
  sub_1BCC00DF8();
  *(_QWORD *)&v188[0] = a1;
  type metadata accessor for Size(0);
  sub_1BCC00F18();
  result = sub_1BCC00F24();
  __break(1u);
  return result;
}

unint64_t sub_1BCBE7D80()
{
  unint64_t result;

  result = qword_1EF48DA98;
  if (!qword_1EF48DA98)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC094E8, &type metadata for AppShowcaseLockupLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DA98);
  }
  return result;
}

unint64_t sub_1BCBE7DC4()
{
  unint64_t result;

  result = qword_1EF48DAA0;
  if (!qword_1EF48DAA0)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC094C0, &type metadata for AppShowcaseLockupLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DAA0);
  }
  return result;
}

uint64_t sub_1BCBE7E08()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1(v0 + 168);
  __swift_destroy_boxed_opaque_existential_1(v0 + 208);
  __swift_destroy_boxed_opaque_existential_1(v0 + 248);
  __swift_destroy_boxed_opaque_existential_1(v0 + 288);
  __swift_destroy_boxed_opaque_existential_1(v0 + 328);
  if (*(_QWORD *)(v0 + 392))
    __swift_destroy_boxed_opaque_existential_1(v0 + 368);
  __swift_destroy_boxed_opaque_existential_1(v0 + 408);
  __swift_destroy_boxed_opaque_existential_1(v0 + 448);
  if (*(_QWORD *)(v0 + 512))
    __swift_destroy_boxed_opaque_existential_1(v0 + 488);
  __swift_destroy_boxed_opaque_existential_1(v0 + 528);
  return swift_deallocObject();
}

uint64_t sub_1BCBE7E9C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for AppShowcaseLockupLayout(a2, a1);
  return a2;
}

uint64_t sub_1BCBE7ED8(uint64_t a1)
{
  destroy for AppShowcaseLockupLayout(a1);
  return a1;
}

uint64_t sub_1BCBE7F0C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for MediumLockupLayout.Metrics(a2, a1);
  return a2;
}

unint64_t sub_1BCBE7F48()
{
  unint64_t result;

  result = qword_1EF48DAA8;
  if (!qword_1EF48DAA8)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09AD4, &type metadata for MediumLockupLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DAA8);
  }
  return result;
}

unint64_t sub_1BCBE7F8C()
{
  unint64_t result;

  result = qword_1EF48DAB0;
  if (!qword_1EF48DAB0)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09AAC, &type metadata for MediumLockupLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DAB0);
  }
  return result;
}

uint64_t sub_1BCBE7FD0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1(v0 + 80);
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  __swift_destroy_boxed_opaque_existential_1(v0 + 200);
  __swift_destroy_boxed_opaque_existential_1(v0 + 240);
  __swift_destroy_boxed_opaque_existential_1(v0 + 280);
  __swift_destroy_boxed_opaque_existential_1(v0 + 320);
  __swift_destroy_boxed_opaque_existential_1(v0 + 360);
  if (*(_QWORD *)(v0 + 424))
    __swift_destroy_boxed_opaque_existential_1(v0 + 400);
  __swift_destroy_boxed_opaque_existential_1(v0 + 440);
  __swift_destroy_boxed_opaque_existential_1(v0 + 480);
  if (*(_QWORD *)(v0 + 544))
    __swift_destroy_boxed_opaque_existential_1(v0 + 520);
  __swift_destroy_boxed_opaque_existential_1(v0 + 560);
  return swift_deallocObject();
}

uint64_t sub_1BCBE806C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for MediumLockupLayout(a2, a1);
  return a2;
}

uint64_t sub_1BCBE80A8(uint64_t a1)
{
  destroy for MediumLockupLayout(a1);
  return a1;
}

uint64_t sub_1BCBE80DC(uint64_t a1)
{
  destroy for MediumLockupLayout.Metrics(a1);
  return a1;
}

uint64_t sub_1BCBE8110(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SmallLockupLayout.Metrics(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCBE8154(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for SmallLockupLayout(255);
    result = MEMORY[0x1BCCFEBCC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1BCBE8194(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SmallLockupLayout(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BCBE81D0(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for OfferButtonLockupLayout.Metrics(a2, a1);
  return a2;
}

unint64_t sub_1BCBE820C()
{
  unint64_t result;

  result = qword_1ED1BC2C0;
  if (!qword_1ED1BC2C0)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09D88, &type metadata for OfferButtonLockupLayout);
    atomic_store(result, (unint64_t *)&qword_1ED1BC2C0);
  }
  return result;
}

unint64_t sub_1BCBE8250()
{
  unint64_t result;

  result = qword_1ED1BC2C8[0];
  if (!qword_1ED1BC2C8[0])
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09D60, &type metadata for OfferButtonLockupLayout);
    atomic_store(result, qword_1ED1BC2C8);
  }
  return result;
}

uint64_t sub_1BCBE8294()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  return swift_deallocObject();
}

_OWORD *sub_1BCBE82C8(_OWORD *a1, _OWORD *a2)
{
  initializeWithCopy for OfferButtonLockupLayout(a2, a1);
  return a2;
}

uint64_t sub_1BCBE8304(uint64_t a1)
{
  destroy for CenteredThreeLineReverseTextLayout(a1);
  return a1;
}

_OWORD *sub_1BCBE8338(_OWORD *a1, _OWORD *a2)
{
  initializeWithCopy for MiniLockupLayout.Metrics(a2, a1);
  return a2;
}

unint64_t sub_1BCBE8374()
{
  unint64_t result;

  result = qword_1EF48DAB8;
  if (!qword_1EF48DAB8)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09BBC, &type metadata for MiniLockupLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DAB8);
  }
  return result;
}

uint64_t sub_1BCBE83B8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1(v0 + 192);
  __swift_destroy_boxed_opaque_existential_1(v0 + 232);
  __swift_destroy_boxed_opaque_existential_1(v0 + 272);
  __swift_destroy_boxed_opaque_existential_1(v0 + 312);
  return swift_deallocObject();
}

uint64_t sub_1BCBE8414(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48DAC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCBE845C(uint64_t a1)
{
  destroy for MiniLockupLayout.Metrics(a1);
  return a1;
}

uint64_t sub_1BCBE8490(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48DAC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1BCBE84D0()
{
  unint64_t result;

  result = qword_1EF48DAC8;
  if (!qword_1EF48DAC8)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC0A240, &type metadata for PlaceableLayoutProxy);
    atomic_store(result, (unint64_t *)&qword_1EF48DAC8);
  }
  return result;
}

unint64_t sub_1BCBE8514()
{
  unint64_t result;

  result = qword_1EF48DAD0;
  if (!qword_1EF48DAD0)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC0A218, &type metadata for PlaceableLayoutProxy);
    atomic_store(result, (unint64_t *)&qword_1EF48DAD0);
  }
  return result;
}

uint64_t sub_1BCBE8558()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1BCBE857C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for OfferDisclosureLayout(a2, a1);
  return a2;
}

uint64_t sub_1BCBE85B8(uint64_t a1)
{
  destroy for CenteringLayout();
  return a1;
}

uint64_t sub_1BCBE85EC(uint64_t a1)
{
  destroy for OfferTextLayout.Metrics(a1);
  return a1;
}

uint64_t sub_1BCBE8620(uint64_t a1)
{
  destroy for OfferButtonLockupLayout.Metrics(a1);
  return a1;
}

unint64_t sub_1BCBE8654()
{
  unint64_t result;

  result = qword_1EF48DAD8;
  if (!qword_1EF48DAD8)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09E08, &type metadata for OfferButtonPlaceholder);
    atomic_store(result, (unint64_t *)&qword_1EF48DAD8);
  }
  return result;
}

uint64_t sub_1BCBE8698()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocObject();
}

uint64_t sub_1BCBE86C4(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for OfferButtonPlaceholder(a2, a1);
  return a2;
}

uint64_t sub_1BCBE8700(uint64_t a1)
{
  destroy for MiniLockupLayout(a1);
  return a1;
}

double sub_1BCBE8734()
{
  double result;

  xmmword_1EF48DAE0 = (__int128)vdupq_n_s64(0x404B800000000000uLL);
  xmmword_1EF48DAF0 = (__int128)vdupq_n_s64(0x4054C00000000000uLL);
  xmmword_1EF48DB00 = xmmword_1BCC09550;
  xmmword_1EF48DB10 = xmmword_1BCC09560;
  result = 6.0;
  xmmword_1EF48DB20 = xmmword_1BCC09570;
  return result;
}

double static ASCLayoutProxy.miniProductPagePreferredArtworkSize.getter()
{
  if (qword_1EF48D068 != -1)
    swift_once();
  return *(double *)&xmmword_1EF48DAF0;
}

id static ASCLayoutProxy.miniProductPageLayout(traitCollection:iconArtwork:title:subtitle:metadata:description:screenshots:)()
{
  return sub_1BCBE88E0();
}

id sub_1BCBE88E0()
{
  __int128 v0;
  objc_class *v1;
  id v2;
  id v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  objc_super v9;
  _QWORD v10[6];
  _QWORD v11[5];
  _OWORD v12[20];

  if (qword_1EF48D068 != -1)
    swift_once();
  v7 = xmmword_1EF48DAF0;
  v8 = xmmword_1EF48DAE0;
  v5 = xmmword_1EF48DB10;
  v6 = xmmword_1EF48DB00;
  v0 = xmmword_1EF48DB20;
  sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  sub_1BCC00720();
  sub_1BCC00720();
  sub_1BCBE32A8(0, &qword_1ED1BC8D0);
  sub_1BCC00720();
  sub_1BCC00720();
  sub_1BCC00720();
  sub_1BCC00720();
  v12[0] = v8;
  v12[1] = v7;
  v12[2] = v6;
  v12[3] = v5;
  v12[4] = v0;
  v11[3] = &type metadata for MiniProductPageLayout;
  v11[4] = sub_1BCBE8B54();
  v11[0] = swift_allocObject();
  sub_1BCBE8BE4((uint64_t)v12, v11[0] + 16);
  v10[3] = &type metadata for PlaceableLayoutProxy;
  v10[4] = sub_1BCBE84D0();
  v10[5] = sub_1BCBE8514();
  v10[0] = swift_allocObject();
  sub_1BCBE857C((uint64_t)v11, v10[0] + 16);
  v1 = (objc_class *)type metadata accessor for ASCLayoutProxy();
  v2 = objc_allocWithZone(v1);
  sub_1BCBE0C18((uint64_t)v10, (uint64_t)v2 + OBJC_IVAR_____ASCLayoutProxy_base);
  v9.receiver = v2;
  v9.super_class = v1;
  v3 = objc_msgSendSuper2(&v9, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  sub_1BCBE85B8((uint64_t)v11);
  sub_1BCBE8C44((uint64_t)v12);
  return v3;
}

unint64_t sub_1BCBE8B54()
{
  unint64_t result;

  result = qword_1EF48DB30;
  if (!qword_1EF48DB30)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09CA8, &type metadata for MiniProductPageLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DB30);
  }
  return result;
}

uint64_t sub_1BCBE8B98()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  __swift_destroy_boxed_opaque_existential_1(v0 + 216);
  __swift_destroy_boxed_opaque_existential_1(v0 + 256);
  __swift_destroy_boxed_opaque_existential_1(v0 + 296);
  return swift_deallocObject();
}

uint64_t sub_1BCBE8BE4(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for MiniProductPageLayout(a2, a1);
  return a2;
}

uint64_t sub_1BCBE8C20()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1BCBE8C44(uint64_t a1)
{
  destroy for MiniProductPageLayout(a1);
  return a1;
}

double static ASCLayoutProxy.offerButtonHeightForSize(_:)()
{
  double v0;
  _OWORD v2[4];
  double v3;

  sub_1BCBEA038(v2);
  v0 = v3;
  sub_1BCBE85EC((uint64_t)v2);
  return v0;
}

double static ASCLayoutProxy.axOfferButtonHeightForSize(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  void *v5;
  double v6;
  id v7;
  double v8;
  double v9;
  void (*v10)(_QWORD, _QWORD);
  double v11;
  id v12;
  double v13;
  double v14;
  _OWORD v16[4];
  double v17;
  _QWORD v18[4];
  _QWORD v19[4];

  v0 = sub_1BCC00F54();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCC00C54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BCA08);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1BCC09540;
  sub_1BCBE32A8(0, &qword_1ED1BC8C0);
  *(_QWORD *)(v4 + 32) = sub_1BCC00E7C();
  *(_QWORD *)&v16[0] = v4;
  sub_1BCC00E28();
  v5 = (void *)sub_1BCC00C60();
  sub_1BCBEA038(v16);
  v6 = v17;
  __swift_project_boxed_opaque_existential_1(v18, v18[3]);
  v7 = v5;
  sub_1BCC00648();
  sub_1BCC007BC();
  v9 = v8;

  v10 = *(void (**)(_QWORD, _QWORD))(v1 + 8);
  v10(v3, v0);
  v11 = v6 + v9;
  __swift_project_boxed_opaque_existential_1(v19, v19[3]);
  v12 = v7;
  sub_1BCC00648();
  sub_1BCC007BC();
  v14 = v13;

  v10(v3, v0);
  sub_1BCBE85EC((uint64_t)v16);
  return v11 + v14;
}

double static ASCLayoutProxy.offerProgressDiameterForSize(_:)()
{
  double v0;
  _OWORD v2[3];

  sub_1BCBEA250(v2);
  v0 = *((double *)v2 + 1);
  sub_1BCBE8F54((uint64_t)v2);
  return v0;
}

uint64_t sub_1BCBE8F54(uint64_t a1)
{
  destroy for OfferIconLayout.Metrics(a1);
  return a1;
}

double static ASCLayoutProxy.offerButtonRegularWidthForSize(_:)()
{
  double v0;
  _OWORD v2[3];

  sub_1BCBEA468(v2);
  v0 = *(double *)v2;
  sub_1BCBE8F54((uint64_t)v2);
  return v0;
}

id static ASCLayoutProxy.offerIconLayoutForSize(_:imageView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldTrailingAlign:)(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, char a7, char a8, char a9)
{
  objc_class *v9;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  ValueMetadata *v31;
  unint64_t v32;
  unint64_t v33;
  _OWORD v34[3];

  if ((a7 & 1) != 0)
    sub_1BCBEA250(v34);
  else
    sub_1BCBEA468(v34);
  sub_1BCBE9DBC(v34, &v30);
  v16 = MEMORY[0x1E0D42690];
  if (!a5)
  {
    v29 = 0;
    v27 = 0u;
    v28 = 0u;
    if (a6)
      goto LABEL_6;
LABEL_8:
    v26 = 0;
    v24 = 0u;
    v25 = 0u;
    goto LABEL_9;
  }
  *((_QWORD *)&v28 + 1) = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  v29 = v16;
  *(_QWORD *)&v27 = a5;
  if (!a6)
    goto LABEL_8;
LABEL_6:
  *((_QWORD *)&v25 + 1) = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  v26 = v16;
  *(_QWORD *)&v24 = a6;
LABEL_9:
  v17 = a5;
  v18 = a6;
  v19 = sub_1BCBE98FC(&v30, (uint64_t)a4, (uint64_t)&v27, (uint64_t)&v24, a8 & 1, a9 & 1, a1);
  v31 = &type metadata for OfferIconLayout;
  v32 = sub_1BCBE9DF8();
  v33 = sub_1BCBE9E3C();
  *(_QWORD *)&v30 = v19;
  v20 = objc_allocWithZone(v9);
  sub_1BCBE0C18((uint64_t)&v30, (uint64_t)v20 + OBJC_IVAR_____ASCLayoutProxy_base);
  v23.receiver = v20;
  v23.super_class = v9;
  swift_retain();
  v21 = objc_msgSendSuper2(&v23, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
  swift_release();
  sub_1BCBE8F54((uint64_t)v34);
  return v21;
}

id static ASCLayoutProxy.offerTextLayoutForSize(_:titleBackgroundView:titleView:subtitleView:hasTrailingSubtitle:shouldTopAlign:topPadding:shouldExpandBackground:)(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, char a7, char a8, char a9)
{
  objc_class *v9;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  ValueMetadata *v29;
  unint64_t v30;
  unint64_t v31;

  sub_1BCBEA038(&v28);
  if (a6)
  {
    *((_QWORD *)&v26 + 1) = sub_1BCBE32A8(0, &qword_1ED1BC8D0);
    v27 = MEMORY[0x1E0D426C0];
    *(_QWORD *)&v25 = a6;
  }
  else
  {
    v27 = 0;
    v25 = 0u;
    v26 = 0u;
  }
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = sub_1BCBE9A4C(&v28, (uint64_t)v17, (uint64_t)v18, (uint64_t)&v25, a7 & 1, a8 & 1, a9 & 1, a1);
  v29 = &type metadata for OfferTextLayout;
  v30 = sub_1BCBE9E80();
  v31 = sub_1BCBE9EC4();
  *(_QWORD *)&v28 = v20;
  v21 = objc_allocWithZone(v9);
  sub_1BCBE0C18((uint64_t)&v28, (uint64_t)v21 + OBJC_IVAR_____ASCLayoutProxy_base);
  v24.receiver = v21;
  v24.super_class = v9;
  swift_retain();
  v22 = objc_msgSendSuper2(&v24, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
  swift_release();
  return v22;
}

id static ASCLayoutProxy.offerDisclosureLayout(disclosureIndicator:)()
{
  objc_class *v0;
  objc_class *v1;
  id v2;
  id v3;
  objc_super v5;
  _QWORD v6[6];
  _QWORD v7[5];

  v1 = v0;
  v7[3] = &type metadata for OfferDisclosureLayout;
  v7[4] = sub_1BCBE9F08();
  v7[0] = swift_allocObject();
  sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  sub_1BCC00720();
  v6[3] = &type metadata for PlaceableLayoutProxy;
  v6[4] = sub_1BCBE84D0();
  v6[5] = sub_1BCBE8514();
  v6[0] = swift_allocObject();
  sub_1BCBE857C((uint64_t)v7, v6[0] + 16);
  v2 = objc_allocWithZone(v0);
  sub_1BCBE0C18((uint64_t)v6, (uint64_t)v2 + OBJC_IVAR_____ASCLayoutProxy_base);
  v5.receiver = v2;
  v5.super_class = v1;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  sub_1BCBE85B8((uint64_t)v7);
  return v3;
}

uint64_t sub_1BCBE98FC(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, double a7)
{
  uint64_t v14;
  __int128 v15;
  __int128 v17;
  _OWORD v18[2];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v25 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  v26 = MEMORY[0x1E0D42690];
  *(_QWORD *)&v24 = a2;
  sub_1BCBE9DBC(a1, &v17);
  *((_QWORD *)&v21 + 1) = MEMORY[0x1E0DEF040];
  *(_QWORD *)&v22 = MEMORY[0x1E0D418A8];
  *(double *)&v20 = a7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  sub_1BCBDB3C8(&v20, (uint64_t)v18);
  v20 = v17;
  v21 = v18[0];
  v22 = v18[1];
  v23 = v19;
  sub_1BCBE8F54((uint64_t)a1);
  type metadata accessor for OfferIconLayout.Storage();
  v14 = swift_allocObject();
  v15 = v21;
  *(_OWORD *)(v14 + 16) = v20;
  *(_OWORD *)(v14 + 32) = v15;
  *(_OWORD *)(v14 + 48) = v22;
  *(_QWORD *)(v14 + 64) = v23;
  sub_1BCBDB3C8(&v24, v14 + 72);
  sub_1BCBE32E0(a3, v14 + 112, &qword_1ED1BC8A8);
  sub_1BCBE32E0(a4, v14 + 152, &qword_1ED1BC8A8);
  *(_BYTE *)(v14 + 192) = a5;
  *(_BYTE *)(v14 + 193) = a6;
  return v14;
}

uint64_t sub_1BCBE9A4C(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, char a6, char a7, double a8)
{
  char v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _OWORD v25[12];
  _OWORD v26[3];
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v15 = a7 & 1;
  v46 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  v47 = MEMORY[0x1E0D42690];
  *(_QWORD *)&v45 = a2;
  v43 = sub_1BCBE32A8(0, &qword_1ED1BC8D0);
  v44 = MEMORY[0x1E0D426C0];
  *(_QWORD *)&v42 = a3;
  sub_1BCBE9F70(a1, v25);
  *((_QWORD *)&v28 + 1) = MEMORY[0x1E0DEF040];
  *(_QWORD *)&v29 = MEMORY[0x1E0D418A8];
  *(double *)&v27 = a8;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26 + 8);
  sub_1BCBDB3C8(&v27, (uint64_t)v26 + 8);
  v39 = v26[0];
  v40 = v26[1];
  v41 = v26[2];
  v35 = v25[8];
  v36 = v25[9];
  v37 = v25[10];
  v38 = v25[11];
  v31 = v25[4];
  v32 = v25[5];
  v33 = v25[6];
  v34 = v25[7];
  v27 = v25[0];
  v28 = v25[1];
  v29 = v25[2];
  v30 = v25[3];
  sub_1BCBE85EC((uint64_t)a1);
  type metadata accessor for OfferTextLayout.Storage();
  v16 = swift_allocObject();
  v17 = v40;
  *(_OWORD *)(v16 + 208) = v39;
  *(_OWORD *)(v16 + 224) = v17;
  *(_OWORD *)(v16 + 240) = v41;
  v18 = v36;
  *(_OWORD *)(v16 + 144) = v35;
  *(_OWORD *)(v16 + 160) = v18;
  v19 = v38;
  *(_OWORD *)(v16 + 176) = v37;
  *(_OWORD *)(v16 + 192) = v19;
  v20 = v32;
  *(_OWORD *)(v16 + 80) = v31;
  *(_OWORD *)(v16 + 96) = v20;
  v21 = v34;
  *(_OWORD *)(v16 + 112) = v33;
  *(_OWORD *)(v16 + 128) = v21;
  v22 = v28;
  *(_OWORD *)(v16 + 16) = v27;
  *(_OWORD *)(v16 + 32) = v22;
  v23 = v30;
  *(_OWORD *)(v16 + 48) = v29;
  *(_OWORD *)(v16 + 64) = v23;
  sub_1BCBDB3C8(&v45, v16 + 256);
  sub_1BCBDB3C8(&v42, v16 + 296);
  sub_1BCBE32E0(a4, v16 + 336, &qword_1ED1BC8B0);
  *(_BYTE *)(v16 + 376) = a5;
  *(_BYTE *)(v16 + 377) = a6;
  *(_BYTE *)(v16 + 378) = v15;
  return v16;
}

id _s18AppStoreComponents14ASCLayoutProxyC16offerEmptyLayout9imageView05titleJ008subtitleJ0ACSo6UIViewC_AISgAJtFZ_0(void *a1, void *a2, void *a3)
{
  unint64_t v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  __int128 v20;
  uint64_t v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  unint64_t v25;

  v6 = MEMORY[0x1E0D42690];
  if (!a2)
  {
    v18 = 0;
    v16 = 0u;
    v17 = 0u;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v25 = 0;
    v23 = 0u;
    v24 = 0u;
    goto LABEL_6;
  }
  *((_QWORD *)&v17 + 1) = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  v18 = v6;
  *(_QWORD *)&v16 = a2;
  if (!a3)
    goto LABEL_5;
LABEL_3:
  *((_QWORD *)&v24 + 1) = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  v25 = v6;
  *(_QWORD *)&v23 = a3;
LABEL_6:
  v21 = sub_1BCBE32A8(0, (unint64_t *)&qword_1ED1BC8C8);
  v22 = v6;
  *(_QWORD *)&v20 = a1;
  type metadata accessor for OfferEmptyLayout.Storage();
  v7 = swift_allocObject();
  sub_1BCBDB3C8(&v20, v7 + 16);
  sub_1BCBE32E0((uint64_t)&v16, v7 + 56, &qword_1ED1BC8A8);
  sub_1BCBE32E0((uint64_t)&v23, v7 + 96, &qword_1ED1BC8A8);
  *((_QWORD *)&v17 + 1) = &type metadata for OfferEmptyLayout;
  v18 = sub_1BCBE9FAC();
  v19 = sub_1BCBE9FF0();
  *(_QWORD *)&v16 = v7;
  v8 = (objc_class *)type metadata accessor for ASCLayoutProxy();
  v9 = objc_allocWithZone(v8);
  sub_1BCBE0C18((uint64_t)&v16, (uint64_t)v9 + OBJC_IVAR_____ASCLayoutProxy_base);
  v15.receiver = v9;
  v15.super_class = v8;
  v10 = a1;
  v11 = a2;
  v12 = a3;
  swift_retain();
  v13 = objc_msgSendSuper2(&v15, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
  swift_release();
  return v13;
}

_OWORD *sub_1BCBE9DBC(_OWORD *a1, _OWORD *a2)
{
  initializeWithCopy for OfferIconLayout.Metrics(a2, a1);
  return a2;
}

unint64_t sub_1BCBE9DF8()
{
  unint64_t result;

  result = qword_1ED1BC1D8;
  if (!qword_1ED1BC1D8)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC0A044, &type metadata for OfferIconLayout);
    atomic_store(result, (unint64_t *)&qword_1ED1BC1D8);
  }
  return result;
}

unint64_t sub_1BCBE9E3C()
{
  unint64_t result;

  result = qword_1ED1BC1E0;
  if (!qword_1ED1BC1E0)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC0A01C, &type metadata for OfferIconLayout);
    atomic_store(result, (unint64_t *)&qword_1ED1BC1E0);
  }
  return result;
}

unint64_t sub_1BCBE9E80()
{
  unint64_t result;

  result = qword_1ED1BC868;
  if (!qword_1ED1BC868)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC0A1D8, &type metadata for OfferTextLayout);
    atomic_store(result, (unint64_t *)&qword_1ED1BC868);
  }
  return result;
}

unint64_t sub_1BCBE9EC4()
{
  unint64_t result;

  result = qword_1ED1BC870;
  if (!qword_1ED1BC870)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC0A1B0, &type metadata for OfferTextLayout);
    atomic_store(result, (unint64_t *)&qword_1ED1BC870);
  }
  return result;
}

unint64_t sub_1BCBE9F08()
{
  unint64_t result;

  result = qword_1EF48DB38;
  if (!qword_1EF48DB38)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09EC8, &type metadata for OfferDisclosureLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DB38);
  }
  return result;
}

uint64_t sub_1BCBE9F4C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

_OWORD *sub_1BCBE9F70(_OWORD *a1, _OWORD *a2)
{
  initializeWithCopy for OfferTextLayout.Metrics(a2, a1);
  return a2;
}

unint64_t sub_1BCBE9FAC()
{
  unint64_t result;

  result = qword_1ED1BC1E8;
  if (!qword_1ED1BC1E8)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09F5C, &type metadata for OfferEmptyLayout);
    atomic_store(result, (unint64_t *)&qword_1ED1BC1E8);
  }
  return result;
}

unint64_t sub_1BCBE9FF0()
{
  unint64_t result;

  result = qword_1ED1BC1F0;
  if (!qword_1ED1BC1F0)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09F34, &type metadata for OfferEmptyLayout);
    atomic_store(result, (unint64_t *)&qword_1ED1BC1F0);
  }
  return result;
}

_OWORD *sub_1BCBEA038@<X0>(_OWORD *a1@<X8>)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  char v14;
  _OWORD *result;

  v2 = (void *)sub_1BCC00DBC();
  v3 = sub_1BCC00DE0();
  v5 = v4;
  if (v3 == sub_1BCC00DE0() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_10;
  }
  v8 = sub_1BCC00F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
LABEL_10:

    if (qword_1EF48D078 != -1)
      swift_once();
    v13 = &xmmword_1EF48DB78;
    return sub_1BCBE9F70(v13, a1);
  }
  v9 = sub_1BCC00DE0();
  v11 = v10;
  if (v9 == sub_1BCC00DE0() && v11 == v12)
  {

    swift_bridgeObjectRelease_n();
LABEL_14:
    if (qword_1ED1BC9D0 != -1)
      swift_once();
    v13 = &xmmword_1ED1BC8E0;
    return sub_1BCBE9F70(v13, a1);
  }
  v14 = sub_1BCC00F60();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0)
    goto LABEL_14;
  sub_1BCC00EE8();
  swift_bridgeObjectRelease();
  sub_1BCC00DF8();
  result = (_OWORD *)sub_1BCC00F24();
  __break(1u);
  return result;
}

_OWORD *sub_1BCBEA250@<X0>(_OWORD *a1@<X8>)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  char v14;
  _OWORD *result;

  v2 = (void *)sub_1BCC00DBC();
  v3 = sub_1BCC00DE0();
  v5 = v4;
  if (v3 == sub_1BCC00DE0() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_10;
  }
  v8 = sub_1BCC00F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
LABEL_10:

    if (qword_1EF48D088 != -1)
      swift_once();
    v13 = &xmmword_1EF48DCA0;
    return sub_1BCBE9DBC(v13, a1);
  }
  v9 = sub_1BCC00DE0();
  v11 = v10;
  if (v9 == sub_1BCC00DE0() && v11 == v12)
  {

    swift_bridgeObjectRelease_n();
LABEL_14:
    if (qword_1EF48D070 != -1)
      swift_once();
    v13 = &xmmword_1EF48DB40;
    return sub_1BCBE9DBC(v13, a1);
  }
  v14 = sub_1BCC00F60();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0)
    goto LABEL_14;
  sub_1BCC00EE8();
  swift_bridgeObjectRelease();
  sub_1BCC00DF8();
  result = (_OWORD *)sub_1BCC00F24();
  __break(1u);
  return result;
}

_OWORD *sub_1BCBEA468@<X0>(_OWORD *a1@<X8>)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  char v14;
  _OWORD *result;

  v2 = (void *)sub_1BCC00DBC();
  v3 = sub_1BCC00DE0();
  v5 = v4;
  if (v3 == sub_1BCC00DE0() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_10;
  }
  v8 = sub_1BCC00F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
LABEL_10:

    if (qword_1EF48D080 != -1)
      swift_once();
    v13 = &xmmword_1EF48DC68;
    return sub_1BCBE9DBC(v13, a1);
  }
  v9 = sub_1BCC00DE0();
  v11 = v10;
  if (v9 == sub_1BCC00DE0() && v11 == v12)
  {

    swift_bridgeObjectRelease_n();
LABEL_14:
    if (qword_1ED1BC268 != -1)
      swift_once();
    v13 = &xmmword_1ED1BC230;
    return sub_1BCBE9DBC(v13, a1);
  }
  v14 = sub_1BCC00F60();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v14 & 1) != 0)
    goto LABEL_14;
  sub_1BCC00EE8();
  swift_bridgeObjectRelease();
  sub_1BCC00DF8();
  result = (_OWORD *)sub_1BCC00F24();
  __break(1u);
  return result;
}

double sub_1BCBEA680()
{
  double result;

  qword_1ED1BC948 = MEMORY[0x1E0DEB070];
  unk_1ED1BC950 = MEMORY[0x1E0D425E8];
  qword_1ED1BC930 = 0x4028000000000000;
  qword_1ED1BC970 = MEMORY[0x1E0DEB070];
  unk_1ED1BC978 = MEMORY[0x1E0D425E8];
  qword_1ED1BC958 = 0x4008000000000000;
  qword_1ED1BC998 = MEMORY[0x1E0DEB070];
  unk_1ED1BC9A0 = MEMORY[0x1E0D425E8];
  qword_1ED1BC980 = 0x4050000000000000;
  qword_1ED1BC9C0 = MEMORY[0x1E0DEB070];
  unk_1ED1BC9C8 = MEMORY[0x1E0D425E8];
  qword_1ED1BC9A8 = 0;
  xmmword_1ED1BC8E0 = xmmword_1BCC095B0;
  *(_OWORD *)algn_1ED1BC8F0 = xmmword_1BCC095B0;
  xmmword_1ED1BC900 = xmmword_1BCC095B0;
  unk_1ED1BC910 = xmmword_1BCC095B0;
  result = 74.0;
  xmmword_1ED1BC920 = xmmword_1BCC09520;
  return result;
}

double sub_1BCBEA6E4()
{
  double result;

  qword_1ED1BC258 = MEMORY[0x1E0DEB070];
  unk_1ED1BC260 = MEMORY[0x1E0D425E8];
  qword_1ED1BC240 = 0;
  result = 74.0;
  xmmword_1ED1BC230 = xmmword_1BCC095C0;
  return result;
}

__n128 sub_1BCBEA714()
{
  __n128 result;

  qword_1EF48DB68 = MEMORY[0x1E0DEB070];
  unk_1EF48DB70 = MEMORY[0x1E0D425E8];
  qword_1EF48DB50 = 0;
  __asm { FMOV            V0.2D, #28.0 }
  xmmword_1EF48DB40 = (__int128)result;
  return result;
}

double sub_1BCBEA740()
{
  double result;

  qword_1EF48DBE0 = MEMORY[0x1E0DEB070];
  unk_1EF48DBE8 = MEMORY[0x1E0D425E8];
  qword_1EF48DBC8 = 0x4028000000000000;
  qword_1EF48DC08 = MEMORY[0x1E0DEB070];
  unk_1EF48DC10 = MEMORY[0x1E0D425E8];
  qword_1EF48DBF0 = 0x4008000000000000;
  qword_1EF48DC30 = MEMORY[0x1E0DEB070];
  unk_1EF48DC38 = MEMORY[0x1E0D425E8];
  qword_1EF48DC18 = 0x4050000000000000;
  qword_1EF48DC58 = MEMORY[0x1E0DEB070];
  unk_1EF48DC60 = MEMORY[0x1E0D425E8];
  qword_1EF48DC40 = 0;
  xmmword_1EF48DB78 = xmmword_1BCC095B0;
  unk_1EF48DB88 = xmmword_1BCC095B0;
  xmmword_1EF48DB98 = xmmword_1BCC095B0;
  unk_1EF48DBA8 = xmmword_1BCC095B0;
  result = 74.0;
  xmmword_1EF48DBB8 = xmmword_1BCC095D0;
  return result;
}

double sub_1BCBEA7A4()
{
  double result;

  qword_1EF48DC90 = MEMORY[0x1E0DEB070];
  unk_1EF48DC98 = MEMORY[0x1E0D425E8];
  qword_1EF48DC78 = 0;
  result = 74.0;
  xmmword_1EF48DC68 = xmmword_1BCC095D0;
  return result;
}

double sub_1BCBEA7D4()
{
  double result;

  qword_1EF48DCC8 = MEMORY[0x1E0DEB070];
  unk_1EF48DCD0 = MEMORY[0x1E0D425E8];
  qword_1EF48DCB0 = 0;
  result = 28.0;
  xmmword_1EF48DCA0 = xmmword_1BCC095E0;
  return result;
}

double sub_1BCBEA804()
{
  double result;

  qword_1EF48DD10 = MEMORY[0x1E0DEB070];
  unk_1EF48DD18 = MEMORY[0x1E0D425E8];
  qword_1EF48DCF8 = 0x4042800000000000;
  result = 0.0;
  xmmword_1EF48DCD8 = xmmword_1BCC095F0;
  unk_1EF48DCE8 = xmmword_1BCC095F0;
  return result;
}

id _s18AppStoreComponents14ASCLayoutProxyC17tvTextPillOverlay14backgroundView04textK0ACSo6UIViewC_AHtFZ_0(void *a1, void *a2)
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __n128 v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t v17[5];
  _OWORD v18[4];
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  _BYTE v25[24];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = (objc_class *)type metadata accessor for ASCLayoutProxy();
  if (qword_1EF48D090 != -1)
    swift_once();
  sub_1BCBEAA54(&xmmword_1EF48DCD8, v18);
  v20 = sub_1BCBEAA90();
  v21 = MEMORY[0x1E0D42690];
  v19 = a1;
  v23 = v20;
  v24 = MEMORY[0x1E0D42690];
  v22 = a2;
  v17[3] = sub_1BCC00A50();
  v17[4] = MEMORY[0x1E0D41E70];
  __swift_allocate_boxed_opaque_existential_1(v17);
  v5 = a1;
  v6 = a2;
  sub_1BCC00A5C();
  sub_1BCBEAACC();
  sub_1BCC00CCC();
  sub_1BCBEAB10((uint64_t)v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  v7 = v26;
  v8 = v27;
  v9 = v28;
  v10 = __swift_mutable_project_boxed_opaque_existential_2((uint64_t)v25, v26);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v14 + 16))(v13, v11);
  v15 = sub_1BCBEB62C((uint64_t)v13, v4, v7, v8, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  return v15;
}

_OWORD *sub_1BCBEAA54(_OWORD *a1, _OWORD *a2)
{
  initializeWithCopy for TVTextPillOverlayLayout.Metrics(a2, a1);
  return a2;
}

unint64_t sub_1BCBEAA90()
{
  unint64_t result;

  result = qword_1ED1BC8C8;
  if (!qword_1ED1BC8C8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED1BC8C8);
  }
  return result;
}

unint64_t sub_1BCBEAACC()
{
  unint64_t result;

  result = qword_1EF48DD20;
  if (!qword_1EF48DD20)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC0A400, &type metadata for TVTextPillOverlayLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DD20);
  }
  return result;
}

uint64_t sub_1BCBEAB10(uint64_t a1)
{
  destroy for TVTextPillOverlayLayout(a1);
  return a1;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_2(uint64_t a1, uint64_t a2)
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

uint64_t static ASCLayoutProxy.traitEnvironment(with:)(void *a1)
{
  id v2;
  id v3;

  v2 = objc_allocWithZone((Class)sub_1BCC00C54());
  v3 = a1;
  return sub_1BCC00C48();
}

uint64_t static ASCLayoutProxy.rectWithLayoutDirection(for:in:relativeTo:)(void *a1)
{
  id v1;

  v1 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v1, sel_layoutDirection);

  return sub_1BCC00EA0();
}

uint64_t static ASCLayoutProxy.rectWithLayoutDirection(for:layoutDirection:relativeTo:)()
{
  return sub_1BCC00EA0();
}

uint64_t ASCLayoutProxy.measuredSize(fitting:in:)()
{
  uint64_t v0;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR_____ASCLayoutProxy_base), *(_QWORD *)(v0 + OBJC_IVAR_____ASCLayoutProxy_base + 24));
  return sub_1BCC00714();
}

double ASCLayoutProxy.alignmentInsets(in:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  double v5;
  __int128 v7[2];
  uint64_t v8;
  _BYTE v9[48];
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  sub_1BCBE0C18(v1 + OBJC_IVAR_____ASCLayoutProxy_base, (uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC8B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48DD30);
  if (swift_dynamicCast())
  {
    sub_1BCBDB3C8(v7, (uint64_t)v10);
    v3 = v11;
    v4 = v12;
    __swift_project_boxed_opaque_existential_1(v10, v11);
    v5 = (*(double (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a1, v3, v4);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    v8 = 0;
    memset(v7, 0, sizeof(v7));
    sub_1BCBEB00C((uint64_t)v7);
    return *MEMORY[0x1E0DC49E8];
  }
  return v5;
}

uint64_t sub_1BCBEB00C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48DD38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ASCLayoutProxy.placeChildren(relativeTo:in:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v1 = sub_1BCC006B4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + OBJC_IVAR_____ASCLayoutProxy_base), *(_QWORD *)(v0 + OBJC_IVAR_____ASCLayoutProxy_base + 24));
  sub_1BCC00CC0();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_1BCBEB2AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v0 = sub_1BCC00978();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1BCC00990();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v8, qword_1EF48FC38);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EF48FC38);
  sub_1BCC00984();
  sub_1BCC0096C();
  sub_1BCC00960();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t ASCLayoutProxy.description.getter()
{
  sub_1BCC00EE8();
  sub_1BCC00DF8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC8B8);
  sub_1BCC00F18();
  sub_1BCC00DF8();
  return 0;
}

id ASCLayoutProxy.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ASCLayoutProxy.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ASCLayoutProxy.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ASCLayoutProxy()
{
  return objc_opt_self();
}

uint64_t method lookup function for ASCLayoutProxy()
{
  return swift_lookUpClassMethod();
}

id sub_1BCBEB62C(uint64_t a1, objc_class *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  id v9;
  id v10;
  objc_super v12;
  uint64_t v13[6];

  v13[3] = a3;
  v13[4] = a4;
  v13[5] = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  v9 = objc_allocWithZone(a2);
  sub_1BCBE0C18((uint64_t)v13, (uint64_t)v9 + OBJC_IVAR_____ASCLayoutProxy_base);
  v12.receiver = v9;
  v12.super_class = a2;
  v10 = objc_msgSendSuper2(&v12, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  return v10;
}

uint64_t CenteredThreeLineReverseTextLayout.init(primaryText:secondaryText:primarySpace:numberOfLines:)@<X0>(__int128 *a1@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t result;

  sub_1BCBDB3C8(a1, a5);
  sub_1BCBDB3C8(a2, a5 + 40);
  result = sub_1BCBDB3C8(a3, a5 + 80);
  *(_QWORD *)(a5 + 120) = a4;
  return result;
}

uint64_t CenteredThreeLineReverseTextLayout.primaryText.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BCBDB05C(v1, a1);
}

uint64_t CenteredThreeLineReverseTextLayout.primaryText.setter(__int128 *a1)
{
  uint64_t v1;

  __swift_destroy_boxed_opaque_existential_1(v1);
  return sub_1BCBDB3C8(a1, v1);
}

uint64_t (*CenteredThreeLineReverseTextLayout.primaryText.modify())()
{
  return _ASCAdLockupView_incorrectFrameSize;
}

uint64_t CenteredThreeLineReverseTextLayout.secondaryText.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BCBDB05C(v1 + 40, a1);
}

uint64_t CenteredThreeLineReverseTextLayout.secondaryText.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + 40;
  __swift_destroy_boxed_opaque_existential_1(v3);
  return sub_1BCBDB3C8(a1, v3);
}

uint64_t (*CenteredThreeLineReverseTextLayout.secondaryText.modify())()
{
  return _ASCAdLockupView_incorrectFrameSize;
}

uint64_t CenteredThreeLineReverseTextLayout.primarySpace.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BCBDB05C(v1 + 80, a1);
}

uint64_t CenteredThreeLineReverseTextLayout.primarySpace.setter(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + 80;
  __swift_destroy_boxed_opaque_existential_1(v3);
  return sub_1BCBDB3C8(a1, v3);
}

uint64_t (*CenteredThreeLineReverseTextLayout.primarySpace.modify())()
{
  return _ASCAdLockupView_incorrectFrameSize;
}

uint64_t CenteredThreeLineReverseTextLayout.numberOfLines.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 120);
}

uint64_t CenteredThreeLineReverseTextLayout.numberOfLines.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = result;
  return result;
}

uint64_t (*CenteredThreeLineReverseTextLayout.numberOfLines.modify())()
{
  return _ASCAdLockupView_incorrectFrameSize;
}

uint64_t CenteredThreeLineReverseTextLayout.placeChildren(relativeTo:in:)(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  _QWORD *v4;
  _QWORD *v5;
  char v10;
  char v11;
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
  CGFloat v25;
  CGFloat v26;
  CGFloat MinX;
  CGFloat v28;
  double MinY;
  double v30;
  double v31;
  double MaxY;
  CGFloat v33;
  CGFloat Width;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  CGFloat rect;
  double recta;
  _QWORD v47[4];
  _BYTE v48[40];
  _QWORD v49[4];
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v5 = v4;
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  v10 = sub_1BCC008B8();
  sub_1BCBEBD6C((uint64_t)v5, (uint64_t)v48);
  if ((v10 & 1) != 0)
  {
    sub_1BCBEBDA0((uint64_t)v48);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v49, v49[3]);
    v11 = sub_1BCC008B8();
    sub_1BCBEBDA0((uint64_t)v48);
    if ((v11 & 1) == 0)
    {
      __swift_project_boxed_opaque_existential_1(v5, v5[3]);
      sub_1BCC008DC();
      __swift_project_boxed_opaque_existential_1(v5, v5[3]);
      sub_1BCC00708();
      v13 = v16;
      v15 = v17;
      __swift_project_boxed_opaque_existential_1(v5, v5[3]);
      sub_1BCC008F4();
      sub_1BCBDB05C((uint64_t)(v5 + 5), (uint64_t)v47);
      __swift_project_boxed_opaque_existential_1(v47, v47[3]);
      sub_1BCC008DC();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
      __swift_project_boxed_opaque_existential_1(v5 + 5, v5[8]);
      goto LABEL_6;
    }
  }
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1BCC008DC();
  __swift_project_boxed_opaque_existential_1(v5 + 5, v5[8]);
  sub_1BCC008DC();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1BCC00708();
  v13 = v12;
  v15 = v14;
  __swift_project_boxed_opaque_existential_1(v5 + 5, v5[8]);
LABEL_6:
  sub_1BCC00708();
  v19 = v18;
  v42 = v15;
  v43 = v20;
  v22 = v21;
  v36 = v13;
  __swift_project_boxed_opaque_existential_1(v5 + 10, v5[13]);
  sub_1BCC007D4();
  v40 = v23;
  rect = v19;
  v37 = v22;
  v24 = v13 + v19 - v22 + v23;
  v50.origin.x = a1;
  v50.origin.y = a2;
  v50.size.width = a3;
  v50.size.height = a4;
  v25 = (CGRectGetHeight(v50) - v24) * 0.5;
  v51.origin.x = a1;
  v51.origin.y = a2;
  v51.size.width = a3;
  v51.size.height = a4;
  v26 = CGRectGetMinY(v51) + v25;
  v52.origin.x = a1;
  v52.origin.y = a2;
  v52.size.width = a3;
  v52.size.height = a4;
  MinX = CGRectGetMinX(v52);
  v53.origin.x = a1;
  v53.origin.y = a2;
  v53.size.width = a3;
  v53.size.height = a4;
  v28 = a4;
  Width = CGRectGetWidth(v53);
  __swift_project_boxed_opaque_existential_1(v5 + 5, v5[8]);
  sub_1BCC006E4();
  v54.origin.x = a1;
  v54.origin.y = a2;
  v54.size.width = a3;
  v54.size.height = a4;
  v39 = CGRectGetMinX(v54);
  v55.origin.x = MinX;
  v55.origin.y = v26;
  v55.size.width = Width;
  v55.size.height = rect;
  v38 = v40 + CGRectGetMaxY(v55) - v37;
  v56.origin.x = a1;
  v56.origin.y = a2;
  v56.size.width = a3;
  v56.size.height = a4;
  v41 = CGRectGetWidth(v56);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1BCC006E4();
  v57.origin.x = MinX;
  v57.origin.y = v26;
  v57.size.width = Width;
  v57.size.height = rect;
  MinY = CGRectGetMinY(v57);
  v58.origin.x = a1;
  v58.origin.y = a2;
  v58.size.width = a3;
  v58.size.height = a4;
  recta = v43 + MinY - CGRectGetMinY(v58);
  v59.origin.x = a1;
  v59.origin.y = a2;
  v59.size.width = a3;
  v59.size.height = a4;
  v44 = CGRectGetMinX(v59);
  v60.origin.x = a1;
  v60.origin.y = a2;
  v60.size.width = a3;
  v60.size.height = a4;
  v30 = CGRectGetMinY(v60);
  v61.origin.x = a1;
  v61.origin.y = a2;
  v61.size.width = a3;
  v61.size.height = v28;
  v31 = CGRectGetWidth(v61);
  v62.origin.y = v38;
  v62.origin.x = v39;
  v62.size.width = v41;
  v62.size.height = v36;
  MaxY = CGRectGetMaxY(v62);
  v63.origin.x = a1;
  v63.origin.y = a2;
  v63.size.width = a3;
  v63.size.height = v28;
  v33 = CGRectGetMinY(v63);
  return MEMORY[0x1BCCFDA50](v44, v30, v31, MaxY - v33, recta, v42);
}

uint64_t sub_1BCBEBD6C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for CenteredThreeLineReverseTextLayout(a2, a1);
  return a2;
}

uint64_t sub_1BCBEBDA0(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  return a1;
}

uint64_t destroy for CenteredThreeLineReverseTextLayout(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 80);
}

uint64_t initializeWithCopy for CenteredThreeLineReverseTextLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  return a1;
}

uint64_t *assignWithCopy for CenteredThreeLineReverseTextLayout(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  a1[15] = a2[15];
  return a1;
}

__n128 __swift_memcpy128_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t assignWithTake for CenteredThreeLineReverseTextLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  v6 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for CenteredThreeLineReverseTextLayout(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 128))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CenteredThreeLineReverseTextLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 128) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 128) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CenteredThreeLineReverseTextLayout()
{
  return &type metadata for CenteredThreeLineReverseTextLayout;
}

uint64_t initializeWithCopy for CenteringLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for CenteringLayout(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CenteringLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for CenteringLayout(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CenteringLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CenteringLayout()
{
  return &type metadata for CenteringLayout;
}

_QWORD *sub_1BCBEC184@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1BCBEC190(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_1BCBEC198@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_1BCBEC1AC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_1BCBEC1C0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1BCBEC1D4(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_1BCBEC204@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1BCBEC230@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_1BCBEC254(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_1BCBEC268(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_1BCBEC27C(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_1BCBEC290@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1BCBEC2A4(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1BCBEC2B8(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1BCBEC2CC(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1BCBEC2E0()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_1BCBEC2F0()
{
  return sub_1BCC00ED0();
}

_QWORD *sub_1BCBEC308(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_1BCBEC31C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1BCBEC32C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_1BCBEC338(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1BCBEC34C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_1BCBEC62C(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_1BCBEC388(double a1, double a2, double a3, double a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v5 = v4;
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_1BCC00708();
  v10 = v4[5];
  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = a4;
  if ((v10 & 1) != 0)
    CGRectGetMidX(*(CGRect *)&v11);
  else
    CGRectGetMinX(*(CGRect *)&v11);
  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  if ((v10 & 2) != 0)
    CGRectGetMidY(*(CGRect *)&v15);
  else
    CGRectGetMinY(*(CGRect *)&v15);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1BCC00E94();
  sub_1BCC006E4();
  return sub_1BCC00660();
}

ValueMetadata *type metadata accessor for CenteringLayout.Axis()
{
  return &type metadata for CenteringLayout.Axis;
}

unint64_t sub_1BCBEC510()
{
  unint64_t result;

  result = qword_1EF48DD40;
  if (!qword_1EF48DD40)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09714, &type metadata for CenteringLayout.Axis);
    atomic_store(result, (unint64_t *)&qword_1EF48DD40);
  }
  return result;
}

unint64_t sub_1BCBEC558()
{
  unint64_t result;

  result = qword_1EF48DD48;
  if (!qword_1EF48DD48)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC096E4, &type metadata for CenteringLayout.Axis);
    atomic_store(result, (unint64_t *)&qword_1EF48DD48);
  }
  return result;
}

unint64_t sub_1BCBEC5A0()
{
  unint64_t result;

  result = qword_1EF48DD50;
  if (!qword_1EF48DD50)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC0973C, &type metadata for CenteringLayout.Axis);
    atomic_store(result, (unint64_t *)&qword_1EF48DD50);
  }
  return result;
}

unint64_t sub_1BCBEC5E8()
{
  unint64_t result;

  result = qword_1EF48DD58;
  if (!qword_1EF48DD58)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09774, &type metadata for CenteringLayout.Axis);
    atomic_store(result, (unint64_t *)&qword_1EF48DD58);
  }
  return result;
}

uint64_t sub_1BCBEC62C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_1BCBEC668@<X0>(uint64_t a1@<X1>, id a2@<X2>, uint64_t a3@<X0>, uint64_t a4@<X8>)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  void *v35;
  id v36;
  unsigned int v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;

  v6 = sub_1BCBED560(a1, a2, 0, 1);
  if (!(v6 >> 62))
  {
    if (*(uint64_t *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10) >= 1)
      goto LABEL_3;
LABEL_42:
    v41 = sub_1BCC00774();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(a4, 5, 10, v41);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v40 = sub_1BCC00F30();
  swift_bridgeObjectRelease();
  if (v40 < 1)
    goto LABEL_42;
LABEL_3:
  if (!a3)
  {
LABEL_26:
    sub_1BCBECEC8(v6, a4);
    return swift_bridgeObjectRelease();
  }
  v7 = sub_1BCC00DE0();
  v9 = v8;
  if (v7 == sub_1BCC00DE0() && v9 == v10)
    goto LABEL_11;
  v12 = sub_1BCC00F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
    goto LABEL_12;
  v13 = sub_1BCC00DE0();
  v15 = v14;
  if (v13 == sub_1BCC00DE0() && v15 == v16)
  {
LABEL_11:
    swift_bridgeObjectRelease_n();
    goto LABEL_12;
  }
  v24 = sub_1BCC00F60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v24 & 1) != 0)
  {
LABEL_12:
    swift_bridgeObjectRelease();
    v17 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v18 = objc_msgSend(v17, sel_userInterfaceIdiom);

    v19 = sub_1BCC00774();
    v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
    v21 = a4;
    if (v18 == (id)1)
      v22 = 7;
    else
      v22 = 6;
    return v20(v21, v22, 10, v19);
  }
  v25 = sub_1BCC00DE0();
  v27 = v26;
  if (v25 != sub_1BCC00DE0() || v27 != v28)
  {
    v29 = sub_1BCC00F60();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v29 & 1) != 0)
      goto LABEL_24;
    v30 = sub_1BCC00DE0();
    v32 = v31;
    if (v30 != sub_1BCC00DE0() || v32 != v33)
    {
      v34 = sub_1BCC00F60();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v34 & 1) != 0)
        goto LABEL_24;
      goto LABEL_26;
    }
  }
  result = swift_bridgeObjectRelease_n();
LABEL_24:
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v35 = (void *)sub_1BCC00F30();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v35 = *(void **)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v35)
  {
    swift_bridgeObjectRelease();
    v37 = 1;
LABEL_34:
    v38 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v39 = objc_msgSend(v38, sel_userInterfaceIdiom);

    v19 = sub_1BCC00774();
    v20 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
    v21 = a4;
    if (v37)
    {
      if (v39 == (id)1)
        v22 = 9;
      else
        v22 = 3;
    }
    else if (v39 == (id)1)
    {
      v22 = 10;
    }
    else
    {
      v22 = 8;
    }
    return v20(v21, v22, 10, v19);
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
    v36 = (id)MEMORY[0x1BCCFE2E4](0, v6);
    goto LABEL_32;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v36 = *(id *)(v6 + 32);
LABEL_32:
    v35 = v36;
    swift_bridgeObjectRelease();
    v37 = objc_msgSend(v35, sel_isPortrait);
    goto LABEL_34;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BCBECA90@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t result;
  id v22;
  void *v23;
  int *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1BCC00774();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCBED250(a4, (uint64_t)v19);
  v20 = sub_1BCBED560(a1, a2, 0, 1);
  if (v20 >> 62)
  {
    result = sub_1BCC00F30();
    if (result)
      goto LABEL_3;
LABEL_8:
    swift_bridgeObjectRelease();
    sub_1BCC00780();
    goto LABEL_9;
  }
  result = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!result)
    goto LABEL_8;
LABEL_3:
  if ((v20 & 0xC000000000000001) != 0)
  {
    v22 = (id)MEMORY[0x1BCCFE2E4](0, v20);
  }
  else
  {
    if (!*(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    v22 = *(id *)(v20 + 32);
  }
  v23 = v22;
  swift_bridgeObjectRelease();
  objc_msgSend(v23, sel_width);
  objc_msgSend(v23, sel_height);
  sub_1BCC00780();

LABEL_9:
  sub_1BCBED98C(a3, (uint64_t)v12);
  v24 = (int *)type metadata accessor for LockupMediaLayout.Metrics(0);
  v25 = a5 + v24[6];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v25, 1, 1, v13);
  sub_1BCBED250((uint64_t)v19, a5);
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(a5 + v24[5], v16, v13);
  sub_1BCBED9D4((uint64_t)v12, v25);
  if ((objc_msgSend((id)objc_opt_self(), sel_isMainThread) & 1) != 0)
  {
    v26 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v26, sel_bounds);
    v28 = v27;
    v30 = v29;

    sub_1BCBE3224((uint64_t)v12);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    result = sub_1BCBED294((uint64_t)v19);
    v31 = (_QWORD *)(a5 + v24[7]);
    *v31 = v28;
    v31[1] = v30;
  }
  else
  {
    sub_1BCBE3224((uint64_t)v12);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    result = sub_1BCBED294((uint64_t)v19);
    v32 = (_QWORD *)(a5 + v24[7]);
    *v32 = 0;
    v32[1] = 0;
  }
  return result;
}

uint64_t sub_1BCBECD84@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v13;

  v2 = v1;
  v4 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v8 = objc_msgSend(v7, sel_userInterfaceIdiom);

  sub_1BCBED250(v2, (uint64_t)v6);
  v9 = sub_1BCC00774();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v6, 10, v9);
  if (v11 == 2)
  {
    if (v8 != (id)1)
      goto LABEL_8;
LABEL_6:
    sub_1BCBED250(v2, a1);
    return sub_1BCBED294((uint64_t)v6);
  }
  if (v11 != 1)
    goto LABEL_6;
  if (v8 == (id)1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, 2, 10, v9);
    return sub_1BCBED294((uint64_t)v6);
  }
LABEL_8:
  sub_1BCBED294((uint64_t)v6);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, 3, 10, v9);
}

uint64_t sub_1BCBECEC8@<X0>(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;

  v4 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v5 = objc_msgSend(v4, sel_userInterfaceIdiom);

  if (!(a1 >> 62))
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    v8 = v6;
    if (v6)
      goto LABEL_3;
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  v8 = sub_1BCC00F30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  result = sub_1BCC00F30();
  if (!result)
    goto LABEL_9;
LABEL_3:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v9 = (id)MEMORY[0x1BCCFE2E4](0, a1);
LABEL_6:
    v10 = v9;
    swift_bridgeObjectRelease();
    v11 = objc_msgSend(v10, sel_isPortrait);

    if ((v11 & 1) == 0)
    {
      v12 = sub_1BCC00774();
      v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
      v14 = a2;
      v15 = 4;
      return v13(v14, v15, 10, v12);
    }
LABEL_10:
    if (v8 <= 2 || v5 == (id)1)
    {
      if (v8 >= 2)
      {
        v12 = sub_1BCC00774();
        v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
        v14 = a2;
        v15 = 2;
      }
      else
      {
        v12 = sub_1BCC00774();
        v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
        v14 = a2;
        if (v8 == 1)
          v15 = 1;
        else
          v15 = 5;
      }
    }
    else
    {
      v12 = sub_1BCC00774();
      v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
      v14 = a2;
      v15 = 3;
    }
    return v13(v14, v15, 10, v12);
  }
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v9 = *(id *)(a1 + 32);
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_1BCBED098(unint64_t a1)
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
    v3 = sub_1BCC00F30();
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
    v5 = sub_1BCC00F30();
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
    v4 = MEMORY[0x1BCCFE2F0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1BCBED3BC(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1BCC00F30();
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
    return sub_1BCC00E28();
  }
  __break(1u);
  return result;
}

uint64_t sub_1BCBED250(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCBED294(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1BCBED2D0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v7;
  int64_t v8;
  uint64_t v9;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_11:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      if (v4 != a3)
      {
LABEL_7:
        sub_1BCBE32A8(0, &qword_1EF48D440);
        swift_arrayInitWithCopy();
        return;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BCA08);
      v7 = (_QWORD *)swift_allocObject();
      v8 = _swift_stdlib_malloc_size(v7);
      v9 = v8 - 32;
      if (v8 < 32)
        v9 = v8 - 25;
      v7[2] = v5;
      v7[3] = (2 * (v9 >> 3)) | 1;
      if (v4 != a3)
        goto LABEL_7;
    }
    __break(1u);
    goto LABEL_11;
  }
}

uint64_t sub_1BCBED3BC(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1BCC00F30();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_1BCC00F30();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1BCBEDA1C();
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48DD68);
            v10 = sub_1BCBE0568(v13, i, a3);
            v12 = *v11;
            ((void (*)(void (**)(id *), _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1BCBE32A8(0, &qword_1EF48D440);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1BCBED560(uint64_t a1, id a2, uint64_t a3, char a4)
{
  uint64_t v4;
  id v7;
  unint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  unint64_t v28;

  LOBYTE(v4) = a4;
  v28 = MEMORY[0x1E0DEE9D8];
  if (!a2)
    goto LABEL_10;
  v7 = objc_msgSend(a2, sel_videos);
  sub_1BCBE32A8(0, &qword_1EF48DD60);
  v8 = sub_1BCC00E1C();

  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = (id)sub_1BCC00F30();
    swift_bridgeObjectRelease();
    if (v9)
      goto LABEL_4;
LABEL_36:
    swift_bridgeObjectRelease();
    if (!a1)
      goto LABEL_12;
    goto LABEL_11;
  }
  v9 = *(id *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v9)
    goto LABEL_36;
LABEL_4:
  if ((v8 & 0xC000000000000001) != 0)
  {
    v10 = (id)MEMORY[0x1BCCFE2E4](0, v8);
  }
  else
  {
    if (!*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_42;
    }
    v10 = *(id *)(v8 + 32);
  }
  v11 = v10;
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v11, sel_preview);

  if (!v12)
    goto LABEL_10;
  v9 = v12;
  MEMORY[0x1BCCFE1E8]();
  if (*(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    goto LABEL_46;
  while (1)
  {
    sub_1BCC00E40();
    sub_1BCC00E28();

LABEL_10:
    if (a1)
    {
LABEL_11:
      v13 = objc_msgSend((id)a1, sel_artwork);
      sub_1BCBE32A8(0, &qword_1EF48D440);
      a1 = sub_1BCC00E1C();

      sub_1BCBED098(a1);
    }
LABEL_12:
    v8 = v28;
    if ((v4 & 1) != 0)
      return v8;
    v9 = (id)(v28 >> 62);
    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      v27 = sub_1BCC00F30();
      swift_bridgeObjectRelease();
      if (v27 <= a3)
        return v8;
    }
    else if (*(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10) <= a3)
    {
      return v8;
    }
    if (a3 < 0)
    {
LABEL_42:
      __break(1u);
    }
    else if (!v9)
    {
      v4 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v4 >= a3)
        goto LABEL_18;
      goto LABEL_45;
    }
    swift_bridgeObjectRetain();
    a1 = sub_1BCC00F30();
    result = swift_bridgeObjectRelease();
    if (a1 < 0)
      break;
    swift_bridgeObjectRetain();
    v4 = sub_1BCC00F30();
    swift_bridgeObjectRelease();
    if (v4 >= a3)
    {
LABEL_18:
      if ((v8 & 0xC000000000000001) != 0 && a3)
      {
        sub_1BCBE32A8(0, &qword_1EF48D440);
        v14 = 0;
        do
        {
          v15 = v14 + 1;
          sub_1BCC00EF4();
          v14 = v15;
        }
        while (a3 != v15);
      }
      if (v9)
      {
        swift_bridgeObjectRetain();
        v16 = sub_1BCC00F3C();
        v17 = v19;
        v9 = v20;
        v18 = v21;
        swift_bridgeObjectRelease();
        if ((v18 & 1) != 0)
          goto LABEL_27;
      }
      else
      {
        v16 = v8 & 0xFFFFFFFFFFFFFF8;
        v17 = (v8 & 0xFFFFFFFFFFFFFF8) + 32;
        v18 = (2 * a3) | 1;
        swift_bridgeObjectRetain();
        if ((v18 & 1) != 0)
        {
LABEL_27:
          sub_1BCC00F6C();
          swift_unknownObjectRetain_n();
          v24 = swift_dynamicCastClass();
          if (!v24)
          {
            swift_unknownObjectRelease();
            v24 = MEMORY[0x1E0DEE9D8];
          }
          v25 = *(_QWORD *)(v24 + 16);
          swift_release();
          if (__OFSUB__(v18 >> 1, v9))
          {
            __break(1u);
          }
          else if (v25 == (v18 >> 1) - (_QWORD)v9)
          {
            v23 = swift_dynamicCastClass();
            if (!v23)
            {
              swift_unknownObjectRelease();
              v23 = MEMORY[0x1E0DEE9D8];
            }
            goto LABEL_33;
          }
          swift_unknownObjectRelease();
        }
      }
      sub_1BCBED2D0(v16, v17, (uint64_t)v9, v18);
      v23 = v22;
LABEL_33:
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      return v23;
    }
LABEL_45:
    __break(1u);
LABEL_46:
    sub_1BCC00E34();
  }
  __break(1u);
  return result;
}

uint64_t sub_1BCBED98C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCBED9D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

unint64_t sub_1BCBEDA1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF48DD70;
  if (!qword_1EF48DD70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF48DD68);
    result = MEMORY[0x1BCCFEBCC](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EF48DD70);
  }
  return result;
}

uint64_t *sub_1BCBEDA68(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t *, uint64_t, uint64_t);
  uint64_t v10;
  void (*v11)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1BCC00774();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48);
    if (v9(a2, 10, v7))
    {
      v10 = type metadata accessor for LockupMediaLayout.DisplayType(0);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
      v11 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    }
    else
    {
      v11 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
      v11(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 10, v7);
    }
    v11((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]), v7);
    v13 = a3[6];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    if (v9((uint64_t *)((char *)a2 + v13), 1, v7))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      v11((uint64_t *)v14, (uint64_t *)v15, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v14, 0, 1, v7);
    }
    *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  }
  return a1;
}

uint64_t type metadata accessor for LockupMediaLayout.DisplayType(uint64_t a1)
{
  return sub_1BCBEF64C(a1, (uint64_t *)&unk_1EF48DD98);
}

uint64_t sub_1BCBEDBF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  int v7;
  void (*v8)(_QWORD, _QWORD);
  uint64_t v9;
  uint64_t result;
  void (*v11)(_QWORD, _QWORD);

  v4 = sub_1BCC00774();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  v7 = v6(a1, 10, v4);
  v8 = *(void (**)(_QWORD, _QWORD))(v5 + 8);
  v11 = v8;
  if (!v7)
  {
    v8(a1, v4);
    v8 = v11;
  }
  v8(a1 + *(int *)(a2 + 20), v4);
  v9 = a1 + *(int *)(a2 + 24);
  result = v6(v9, 1, v4);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v11)(v9, v4);
  return result;
}

char *sub_1BCBEDCC0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v6 = sub_1BCC00774();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 10, v6))
  {
    v9 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    v10 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  }
  else
  {
    v10 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
    v10(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
  }
  v10(&a1[a3[5]], &a2[a3[5]], v6);
  v11 = a3[6];
  v12 = &a1[v11];
  v13 = &a2[v11];
  if (v8(&a2[v11], 1, v6))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v10(v12, v13, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
  }
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

char *sub_1BCBEDE0C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;

  v6 = sub_1BCC00774();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 10, v6);
  v10 = v8(a2, 10, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  v12 = *(void (**)(char *, char *, uint64_t))(v7 + 24);
  v12(&a1[a3[5]], &a2[a3[5]], v6);
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = v8(&a1[v13], 1, v6);
  v17 = v8(v15, 1, v6);
  if (!v16)
  {
    if (!v17)
    {
      v12(v14, v15, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v6);
    goto LABEL_12;
  }
  if (v17)
  {
LABEL_12:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v14, v15, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, v6);
LABEL_13:
  v19 = a3[7];
  v20 = &a1[v19];
  v21 = &a2[v19];
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
  return a1;
}

char *sub_1BCBEDFF0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v6 = sub_1BCC00774();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(a2, 10, v6))
  {
    v9 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    v10 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  }
  else
  {
    v10 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v10(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
  }
  v10(&a1[a3[5]], &a2[a3[5]], v6);
  v11 = a3[6];
  v12 = &a1[v11];
  v13 = &a2[v11];
  if (v8(&a2[v11], 1, v6))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v10(v12, v13, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
  }
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

char *sub_1BCBEE13C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  int v16;
  int v17;
  uint64_t v18;

  v6 = sub_1BCC00774();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 10, v6);
  v10 = v8(a2, 10, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  v12 = *(void (**)(char *, char *, uint64_t))(v7 + 40);
  v12(&a1[a3[5]], &a2[a3[5]], v6);
  v13 = a3[6];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = v8(&a1[v13], 1, v6);
  v17 = v8(v15, 1, v6);
  if (!v16)
  {
    if (!v17)
    {
      v12(v14, v15, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v14, v6);
    goto LABEL_12;
  }
  if (v17)
  {
LABEL_12:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v14, v15, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, v6);
LABEL_13:
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

uint64_t sub_1BCBEE310()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCBEE31C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = sub_1BCC00774();
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_1BCBEE3B8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCBEE3C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = sub_1BCC00774();
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for LockupMediaLayout.Metrics(uint64_t a1)
{
  return sub_1BCBEF64C(a1, (uint64_t *)&unk_1EF48DD80);
}

void sub_1BCBEE47C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  type metadata accessor for LockupMediaLayout.DisplayType(319);
  if (v0 <= 0x3F)
  {
    sub_1BCC00774();
    if (v1 <= 0x3F)
    {
      sub_1BCBEE524();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_1BCBEE524()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF48DD90)
  {
    sub_1BCC00774();
    v0 = sub_1BCC00EC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF48DD90);
  }
}

uint64_t *sub_1BCBEE578(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = sub_1BCC00774();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 10, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 10, v7);
    }
  }
  return a1;
}

uint64_t sub_1BCBEE640(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = sub_1BCC00774();
  v3 = *(_QWORD *)(v2 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 10, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  return result;
}

void *sub_1BCBEE6A8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1BCC00774();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 10, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
  }
  return a1;
}

void *sub_1BCBEE74C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_1BCC00774();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 10, v6);
  v10 = v8(a2, 10, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
  return a1;
}

void *sub_1BCBEE83C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1BCC00774();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 10, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
  }
  return a1;
}

void *sub_1BCBEE8E0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;

  v6 = sub_1BCC00774();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 10, v6);
  v10 = v8(a2, 10, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 10, v6);
  return a1;
}

uint64_t sub_1BCBEE9D0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCBEE9DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = sub_1BCC00774();
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 0xB)
    return v5 - 10;
  else
    return 0;
}

uint64_t sub_1BCBEEA28()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCBEEA34(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 10);
  else
    v5 = 0;
  v6 = sub_1BCC00774();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_1BCBEEA88(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1BCC00774();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 10, v2);
}

uint64_t sub_1BCBEEAC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BCC00774();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 10, v4);
}

uint64_t sub_1BCBEEB00()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BCC00774();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

_QWORD *sub_1BCBEEB54(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  __int128 v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  int *v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    v4[5] = a2[5];
    v8 = *(int *)(a3 + 24);
    v9 = (char *)v4 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1BCC00774();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 10, v11))
    {
      v14 = type metadata accessor for LockupMediaLayout.DisplayType(0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 10, v11);
    }
    v16 = (int *)type metadata accessor for LockupMediaLayout.Metrics(0);
    v17 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    v17(&v9[v16[5]], &v10[v16[5]], v11);
    v18 = v16[6];
    v19 = &v9[v18];
    v20 = &v10[v18];
    if (v13(&v10[v18], 1, v11))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v17(v19, v20, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v19, 0, 1, v11);
    }
    *(_OWORD *)&v9[v16[7]] = *(_OWORD *)&v10[v16[7]];
  }
  return v4;
}

uint64_t sub_1BCBEED14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  void (*v11)(uint64_t, uint64_t);

  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_1BCC00774();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 10, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = type metadata accessor for LockupMediaLayout.Metrics(0);
  v11 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v11(v4 + *(int *)(v8 + 20), v5);
  v9 = v4 + *(int *)(v8 + 24);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v9, 1, v5);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v11)(v9, v5);
  return result;
}

uint64_t sub_1BCBEEDFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  int *v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v7 = *(int *)(a3 + 24);
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = sub_1BCC00774();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 10, v10))
  {
    v13 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 10, v10);
  }
  v14 = (int *)type metadata accessor for LockupMediaLayout.Metrics(0);
  v15 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v15(&v8[v14[5]], &v9[v14[5]], v10);
  v16 = v14[6];
  v17 = &v8[v16];
  v18 = &v9[v16];
  if (v12(&v9[v16], 1, v10))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    v15(v17, v18, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v17, 0, 1, v10);
  }
  *(_OWORD *)&v8[v14[7]] = *(_OWORD *)&v9[v14[7]];
  return a1;
}

uint64_t *sub_1BCBEEF88(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  int *v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  char *v18;
  char *v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t *v27;

  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v27 = a1;
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1BCC00774();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 10, v9);
  v13 = v11(v8, 10, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 10, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = (int *)type metadata accessor for LockupMediaLayout.Metrics(0);
  v16 = *(void (**)(char *, char *, uint64_t))(v10 + 24);
  v16(&v7[v15[5]], &v8[v15[5]], v9);
  v17 = v15[6];
  v18 = &v7[v17];
  v19 = &v8[v17];
  v20 = v11(&v7[v17], 1, v9);
  v21 = v11(v19, 1, v9);
  if (!v20)
  {
    if (!v21)
    {
      v16(v18, v19, v9);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
    goto LABEL_12;
  }
  if (v21)
  {
LABEL_12:
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v18, v19, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
LABEL_13:
  v23 = v15[7];
  v24 = &v7[v23];
  v25 = &v8[v23];
  *(_QWORD *)v24 = *(_QWORD *)v25;
  *((_QWORD *)v24 + 1) = *((_QWORD *)v25 + 1);
  return v27;
}

uint64_t sub_1BCBEF1AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  int *v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)(a1 + v6);
  v8 = (char *)(a2 + v6);
  v9 = sub_1BCC00774();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 10, v9))
  {
    v12 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 10, v9);
  }
  v13 = (int *)type metadata accessor for LockupMediaLayout.Metrics(0);
  v14 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v14(&v7[v13[5]], &v8[v13[5]], v9);
  v15 = v13[6];
  v16 = &v7[v15];
  v17 = &v8[v15];
  if (v11(&v8[v15], 1, v9))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    v14(v16, v17, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
  }
  *(_OWORD *)&v7[v13[7]] = *(_OWORD *)&v8[v13[7]];
  return a1;
}

uint64_t sub_1BCBEF318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  int *v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  char *v21;
  int v22;
  int v23;
  uint64_t v24;
  char *v26;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 24);
  v9 = (char *)(a1 + v8);
  v10 = (char *)(a2 + v8);
  v11 = sub_1BCC00774();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 10, v11);
  v15 = v13(v10, 10, v11);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 10, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    v16 = type metadata accessor for LockupMediaLayout.DisplayType(0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  v17 = (int *)type metadata accessor for LockupMediaLayout.Metrics(0);
  v18 = *(void (**)(char *, char *, uint64_t))(v12 + 40);
  v18(&v9[v17[5]], &v10[v17[5]], v11);
  v19 = v17[6];
  v20 = &v9[v19];
  v26 = v10;
  v21 = &v10[v19];
  v22 = v13(&v9[v19], 1, v11);
  v23 = v13(v21, 1, v11);
  if (!v22)
  {
    if (!v23)
    {
      v18(v20, v21, v11);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v20, v11);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v20, v21, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v20, 0, 1, v11);
LABEL_13:
  *(_OWORD *)&v9[v17[7]] = *(_OWORD *)&v26[v17[7]];
  return a1;
}

uint64_t sub_1BCBEF530()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCBEF53C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for LockupMediaLayout.Metrics(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_1BCBEF5B8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCBEF5C4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for LockupMediaLayout.Metrics(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for LockupMediaLayout(uint64_t a1)
{
  return sub_1BCBEF64C(a1, (uint64_t *)&unk_1EF48DDA8);
}

uint64_t sub_1BCBEF64C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1BCBEF680()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for LockupMediaLayout.Metrics(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_1BCBEF700()
{
  qword_1EF48DD78 = 0x4024000000000000;
}

double sub_1BCBEF710(uint64_t a1, uint64_t a2, double a3)
{
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
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
  unsigned int (*v32)(char *, uint64_t, uint64_t);
  char *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void (*v38)(char *, uint64_t);
  _QWORD v40[10];

  v40[8] = a2;
  v5 = type metadata accessor for LockupMediaLayout.Metrics(0);
  MEMORY[0x1E0C80A78](v5);
  v40[3] = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v40[2] = (char *)v40 - v8;
  v9 = sub_1BCC00F54();
  v40[6] = *(_QWORD *)(v9 - 8);
  v40[7] = v9;
  MEMORY[0x1E0C80A78](v9);
  v40[5] = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1E0C80A78](v11);
  v40[4] = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  MEMORY[0x1E0C80A78](v14);
  v40[1] = (char *)v40 - v15;
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)v40 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1BCC00774();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22);
  v40[0] = (char *)v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v25);
  MEMORY[0x1E0C80A78](v26);
  v28 = (char *)v40 - v27;
  MEMORY[0x1E0C80A78](v29);
  v31 = (char *)v40 - v30;
  v40[9] = v5;
  sub_1BCBED98C(a1 + *(int *)(v5 + 24), (uint64_t)v21);
  v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
  if (v32(v21, 1, v22) == 1)
  {
    sub_1BCBDC2D4((uint64_t)v21, &qword_1EF48D448);
    sub_1BCBE31E0(a1, (uint64_t)v18, type metadata accessor for LockupMediaLayout.DisplayType);
    v33 = (char *)&loc_1BCBEF9CC + 4 * word_1BCC09890[v32(v18, 10, v22)];
    __asm { BR              X10 }
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v31, v21, v22);
  sub_1BCC00780();
  sub_1BCC00738();
  v35 = v34;
  sub_1BCC00738();
  if (v36 >= v35)
  {
    sub_1BCC00750();
  }
  else
  {
    sub_1BCC00744();
    a3 = v37;
  }
  v38 = *(void (**)(char *, uint64_t))(v23 + 8);
  v38(v28, v22);
  v38(v31, v22);
  return a3;
}

uint64_t sub_1BCBEFF9C@<X0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void (*v34)(char *, uint64_t);
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  uint64_t v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  CGFloat v56;
  double MaxX;
  double MaxY;
  uint64_t v59;
  unsigned int v60;
  id v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v67;
  unsigned int (*v68)(char *, uint64_t, uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  CGFloat v72;
  CGFloat v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  _OWORD v79[2];
  __int128 v80;
  _OWORD v81[3];
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v7 = v6;
  v74 = a2;
  v13 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1E0C80A78](v13);
  v71 = (uint64_t)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D448);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1BCC00774();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v67 - v23;
  v25 = (uint64_t)v7 + *(int *)(type metadata accessor for LockupMediaLayout(0) + 24);
  v26 = type metadata accessor for LockupMediaLayout.Metrics(0);
  sub_1BCBED98C(v25 + *(int *)(v26 + 24), (uint64_t)v17);
  v68 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
  if (v68(v17, 1, v18) == 1)
  {
    sub_1BCBDC2D4((uint64_t)v17, &qword_1EF48D448);
    v27 = a6;
    v28 = a5;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v24, v17, v18);
    sub_1BCC00780();
    sub_1BCC00738();
    v30 = v29;
    sub_1BCC00738();
    if (v31 >= v30)
    {
      sub_1BCC00750();
      v27 = v33;
      v28 = a5;
    }
    else
    {
      sub_1BCC00744();
      v28 = v32;
      v27 = a6;
    }
    v34 = *(void (**)(char *, uint64_t))(v19 + 8);
    v34(v21, v18);
    v34(v24, v18);
  }
  v70 = v18;
  v69 = v25;
  v72 = v28;
  v73 = v27;
  sub_1BCBF0C78(v25, (uint64_t)a1);
  v36 = v35;
  v38 = v37;
  v39 = *(_QWORD *)(v7[5] + 16);
  v40 = swift_bridgeObjectRetain();
  v67 = v40;
  if (v39)
  {
    v41 = 0;
    v42 = v40 + 32;
    v43 = 0.0;
    v44 = 0.0;
    v77 = a5;
    v76 = v36;
    v75 = v38;
    do
    {
      v78 = v44;
      v45 = v41 + 1;
      sub_1BCBDB05C(v42, (uint64_t)v79 + 8);
      *(_QWORD *)&v81[0] = v41;
      sub_1BCBDB3C8((_OWORD *)((char *)v79 + 8), (uint64_t)v81 + 8);
      v79[0] = v81[0];
      v79[1] = v81[1];
      v80 = v81[2];
      sub_1BCBF05C0(*(uint64_t *)&v81[0], (uint64_t)a1, v36, v38);
      v47 = v46;
      v48 = a4;
      v50 = v49;
      v51 = a3;
      v53 = v52;
      v54 = a6;
      v56 = v55;
      __swift_project_boxed_opaque_existential_1((_QWORD *)v79 + 1, v80);
      sub_1BCC006E4();
      v82.origin.x = v47;
      v82.origin.y = v50;
      v82.size.width = v53;
      v82.size.height = v56;
      MaxX = CGRectGetMaxX(v82);
      if (v43 <= MaxX)
        v43 = MaxX;
      v83.origin.x = v47;
      v36 = v76;
      v83.origin.y = v50;
      a4 = v48;
      v83.size.width = v53;
      a3 = v51;
      v38 = v75;
      v44 = v78;
      v83.size.height = v56;
      a6 = v54;
      a5 = v77;
      MaxY = CGRectGetMaxY(v83);
      if (v44 <= MaxY)
        v44 = MaxY;
      sub_1BCBDC2D4((uint64_t)v79, &qword_1EF48DDC0);
      v42 += 40;
      ++v41;
    }
    while (v39 != v45);
  }
  swift_bridgeObjectRelease();
  v59 = v71;
  sub_1BCBE31E0(v69, v71, type metadata accessor for LockupMediaLayout.DisplayType);
  v60 = v68((char *)v59, 10, v70);
  if (v60 - 6 >= 2)
  {
    if (v60 == 8)
    {
      v86.origin.x = a3;
      v86.origin.y = a4;
      v86.size.width = a5;
      v86.size.height = a6;
      CGRectGetMidX(v86);
    }
    else
    {
      sub_1BCBE31A4(v59, type metadata accessor for LockupMediaLayout.DisplayType);
    }
  }
  else
  {
    v84.origin.x = a3;
    v84.origin.y = a4;
    v84.size.width = a5;
    v84.size.height = a6;
    CGRectGetMidX(v84);
    v85.origin.x = a3;
    v85.origin.y = a4;
    v85.size.width = a5;
    v85.size.height = a6;
    CGRectGetMidY(v85);
  }
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  sub_1BCC00E94();
  sub_1BCC006E4();
  v61 = objc_msgSend(a1, sel_traitCollection, v67);
  v62 = sub_1BCC00E64();

  if ((v62 & 1) != 0)
  {
    v63 = v7[5];
    v64 = *(_QWORD *)(v63 + 16);
    if (v64)
    {
      v65 = (_QWORD *)(v63 + 32);
      swift_bridgeObjectRetain();
      do
      {
        __swift_project_boxed_opaque_existential_1(v65, v65[3]);
        __swift_project_boxed_opaque_existential_1(v65, v65[3]);
        sub_1BCC006D8();
        sub_1BCC00E94();
        sub_1BCC006E4();
        v65 += 5;
        --v64;
      }
      while (v64);
      swift_bridgeObjectRelease();
    }
  }
  return sub_1BCC00660();
}

void sub_1BCBF05C0(uint64_t a1, uint64_t a2, double a3, double a4)
{
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t, uint64_t);
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  _QWORD v27[5];
  _QWORD v28[3];
  uint64_t v29;
  uint64_t v30;

  v27[2] = a1;
  v27[3] = a2;
  *(double *)&v27[4] = a4;
  v5 = sub_1BCC00F54();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1E0C80A78](v9);
  v27[1] = (char *)v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v27[0] = (char *)v27 - v12;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)v27 - v14;
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)v27 - v17;
  v19 = v4 + *(int *)(type metadata accessor for LockupMediaLayout(0) + 24);
  sub_1BCBE31E0(v19, (uint64_t)v18, type metadata accessor for LockupMediaLayout.DisplayType);
  v20 = sub_1BCC00774();
  v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 48);
  v22 = v21(v18, 10, v20);
  v23 = MEMORY[0x1E0DEF040];
  v24 = MEMORY[0x1E0D418A8];
  if ((v22 - 9) >= 2)
  {
    if (v22 != 7)
    {
      if (qword_1EF48D0A0 != -1)
        swift_once();
      v29 = v23;
      v30 = v24;
      v28[0] = qword_1EF48DD78;
      sub_1BCBE31A4((uint64_t)v18, type metadata accessor for LockupMediaLayout.DisplayType);
      v23 = v29;
LABEL_9:
      __swift_project_boxed_opaque_existential_1(v28, v23);
      sub_1BCBE8C78();
      sub_1BCC007BC();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
      sub_1BCBE31E0(v19, (uint64_t)v15, type metadata accessor for LockupMediaLayout.DisplayType);
      v26 = (char *)&loc_1BCBF0834 + 4 * byte_1BCC098B1[v21(v15, 10, v20)];
      __asm { BR              X10 }
    }
    v30 = MEMORY[0x1E0D418A8];
    v25 = 0x4022000000000000;
  }
  else
  {
    v30 = MEMORY[0x1E0D418A8];
    v25 = 0x4010000000000000;
  }
  v29 = MEMORY[0x1E0DEF040];
  v28[0] = v25;
  goto LABEL_9;
}

double sub_1BCBF0BC0(uint64_t a1, uint64_t a2, double a3)
{
  return sub_1BCBEF710(a1, a2, a3);
}

double sub_1BCBF0BDC(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;

  return sub_1BCBEF710(v3 + *(int *)(a2 + 24), a1, a3);
}

uint64_t sub_1BCBF0C04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1BCBE31E0(v2 + *(int *)(a1 + 24), a2, type metadata accessor for LockupMediaLayout.Metrics);
}

unint64_t sub_1BCBF0C30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF48DDB8;
  if (!qword_1EF48DDB8)
  {
    v1 = type metadata accessor for LockupMediaLayout(255);
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09950, v1);
    atomic_store(result, (unint64_t *)&qword_1EF48DDB8);
  }
  return result;
}

void sub_1BCBF0C78(uint64_t a1, uint64_t a2)
{
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
  uint64_t (*v13)(_QWORD);
  char *v14;
  _QWORD v15[4];
  uint64_t v16;

  v15[3] = a2;
  v16 = sub_1BCC00F54();
  v15[2] = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v15[1] = (char *)v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1BCC00774();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  MEMORY[0x1E0C80A78](v6);
  MEMORY[0x1E0C80A78](v7);
  v8 = type metadata accessor for LockupMediaLayout.DisplayType(0);
  MEMORY[0x1E0C80A78](v8);
  MEMORY[0x1E0C80A78](v9);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v15 - v11;
  sub_1BCBE31E0(a1, (uint64_t)v15 - v11, v13);
  v14 = (char *)sub_1BCBF0E1C
      + 4 * byte_1BCC098D2[(*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 10, v4)];
  __asm { BR              X10 }
}

uint64_t sub_1BCBF0E1C()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  sub_1BCBE31E0(v2, v3, type metadata accessor for LockupMediaLayout.DisplayType);
  v4 = v0(v3, 10, v1);
  return ((uint64_t (*)(void))((char *)sub_1BCBF0E60 + 4 * byte_1BCC098DD[v4]))();
}

double sub_1BCBF0E60()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  sub_1BCBE31E0(v2, v3, type metadata accessor for LockupMediaLayout.DisplayType);
  v7 = v0(v3, 10, v1);
  if ((v7 - 9) < 2)
  {
    v8 = MEMORY[0x1E0DEF040];
    *(_QWORD *)(v4 - 120) = MEMORY[0x1E0D418A8];
    v9 = 0x4010000000000000;
LABEL_5:
    *(_QWORD *)(v4 - 128) = v8;
    *(_QWORD *)(v4 - 152) = v9;
    goto LABEL_9;
  }
  if (v7 == 7)
  {
    v8 = MEMORY[0x1E0DEF040];
    *(_QWORD *)(v4 - 120) = MEMORY[0x1E0D418A8];
    v9 = 0x4022000000000000;
    goto LABEL_5;
  }
  if (qword_1EF48D0A0 != -1)
    swift_once();
  v10 = qword_1EF48DD78;
  v11 = MEMORY[0x1E0D418A8];
  *(_QWORD *)(v4 - 128) = MEMORY[0x1E0DEF040];
  *(_QWORD *)(v4 - 120) = v11;
  *(_QWORD *)(v4 - 152) = v10;
  sub_1BCBE31A4(v3, type metadata accessor for LockupMediaLayout.DisplayType);
LABEL_9:
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 - 152), MEMORY[0x1E0DEF040]);
  v12 = *(_QWORD *)(v4 - 184);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  v14 = v13;
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 176) + 8))(v12, *(_QWORD *)(v4 - 160));
  __swift_destroy_boxed_opaque_existential_1(v4 - 152);
  v15 = 1.0 + -1.0;
  if (1.0 + -1.0 <= 0.0)
    v15 = 0.0;
  v16 = (v6 - v15 * v14) / 1.0;
  type metadata accessor for LockupMediaLayout.Metrics(0);
  sub_1BCC00750();
  if (v17 > v5)
  {
    sub_1BCC00744();
    return v18;
  }
  return v16;
}

uint64_t sub_1BCBF123C(uint64_t result)
{
  if (__OFSUB__(result, 3 * (result / 3)))
    __break(1u);
  return result;
}

double sub_1BCBF12A0(uint64_t a1, double a2, double a3, double a4)
{
  double v4;
  double v5;
  double result;

  v4 = 2.0;
  v5 = 1.0;
  switch(a1)
  {
    case 1:
    case 5:
      return a4 * 0.5 + a2 * 0.5 + v5 * a2 + v5 * a4;
    case 2:
      goto LABEL_4;
    case 3:
    case 7:
      v5 = 0.0;
      return a4 * 0.5 + a2 * 0.5 + v5 * a2 + v5 * a4;
    case 4:
      v4 = 1.0;
      goto LABEL_4;
    case 6:
      v4 = 0.0;
LABEL_4:
      result = v4 * a2 + v4 * a4;
      break;
    default:
      result = a2 + a4;
      break;
  }
  return result;
}

uint64_t sub_1BCBF1344(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result - 3;
  if (__OFSUB__(result, 3))
    goto LABEL_13;
  if ((v1 & 0x8000000000000000) == 0)
  {
    v2 = result - 8;
    if (__OFSUB__(v1, 5)
      || (v2 & 0x8000000000000000) == 0
      && ((v3 = result - 12, __OFSUB__(v2, 4)) || (v3 & 0x8000000000000000) == 0 && __OFSUB__(v3, 2)))
    {
      __break(1u);
LABEL_13:
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1BCBF1414()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MediaPlatform()
{
  return objc_opt_self();
}

uint64_t sub_1BCBF1444@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  void (*v46)(char *, uint64_t);
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t *v85;
  uint64_t v86;
  char *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  uint64_t v98;
  int v99;
  _QWORD *v100;
  uint64_t *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  void (*v110)(_QWORD);
  char *v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void (*v124)(char *);
  uint64_t v125;
  uint64_t v126;
  char *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130[5];
  __int128 v131;
  __int128 v132;
  uint64_t v133;
  __int128 v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137[3];
  uint64_t v138;
  uint64_t v139;
  _QWORD v140[3];
  uint64_t v141;
  uint64_t v142;
  _QWORD v143[3];
  uint64_t v144;
  uint64_t v145;
  _QWORD v146[3];
  uint64_t v147;
  uint64_t v148;
  _QWORD v149[63];
  uint64_t v150;

  v3 = (_QWORD *)v2;
  v121 = a1;
  v5 = sub_1BCC00ABC();
  v123 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v95 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BCC00A68();
  v122 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v127 = (char *)&v95 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = sub_1BCC00AB0();
  v10 = *(_QWORD *)(v119 - 8);
  MEMORY[0x1E0C80A78](v119);
  v118 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = sub_1BCC00AE0();
  v117 = *(_QWORD *)(v125 - 8);
  MEMORY[0x1E0C80A78](v125);
  v113 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v111 = (char *)&v95 - v14;
  MEMORY[0x1E0C80A78](v15);
  v116 = (char *)&v95 - v16;
  v17 = sub_1BCC00AF8();
  v114 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v128 = (char *)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = v2 + 504;
  sub_1BCBF36B8(v2 + 504, (uint64_t)v149);
  v19 = v149[3];
  sub_1BCBDC2D4((uint64_t)v149, &qword_1ED1BC8B0);
  sub_1BCBE806C(v2, (uint64_t)v149);
  v120 = v5;
  if (!v19)
  {
    sub_1BCBE80A8((uint64_t)v149);
LABEL_8:
    sub_1BCBE806C(v2, (uint64_t)v146);
    goto LABEL_9;
  }
  sub_1BCBF36B8((uint64_t)&v150, (uint64_t)v146);
  if (!v147)
  {
    sub_1BCBE80A8((uint64_t)v149);
    sub_1BCBDC2D4((uint64_t)v146, &qword_1ED1BC8B0);
    goto LABEL_8;
  }
  __swift_project_boxed_opaque_existential_1(v146, v147);
  v20 = sub_1BCC006F0();
  sub_1BCBE80A8((uint64_t)v149);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v146);
  sub_1BCBE806C((uint64_t)v3, (uint64_t)v146);
  if ((v20 & 1) != 0)
  {
LABEL_9:
    sub_1BCBE80A8((uint64_t)v146);
    goto LABEL_10;
  }
  sub_1BCBF36B8((uint64_t)&v148, (uint64_t)v143);
  if (v144)
  {
    __swift_project_boxed_opaque_existential_1(v143, v144);
    LODWORD(v124) = sub_1BCC006C0();
    sub_1BCBE80A8((uint64_t)v146);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v143);
    goto LABEL_11;
  }
  sub_1BCBE80A8((uint64_t)v146);
  sub_1BCBDC2D4((uint64_t)v143, &qword_1ED1BC8B0);
LABEL_10:
  LODWORD(v124) = 0;
LABEL_11:
  sub_1BCBF36B8((uint64_t)(v3 + 48), (uint64_t)v143);
  v21 = v144;
  sub_1BCBDC2D4((uint64_t)v143, &qword_1ED1BC8B0);
  sub_1BCBE806C((uint64_t)v3, (uint64_t)v143);
  v115 = v17;
  v126 = v8;
  if (!v21)
  {
    sub_1BCBE80A8((uint64_t)v143);
LABEL_18:
    v23 = v10;
    sub_1BCBE806C((uint64_t)v3, (uint64_t)v140);
    goto LABEL_19;
  }
  sub_1BCBF36B8((uint64_t)&v145, (uint64_t)v140);
  if (!v141)
  {
    sub_1BCBE80A8((uint64_t)v143);
    sub_1BCBDC2D4((uint64_t)v140, &qword_1ED1BC8B0);
    goto LABEL_18;
  }
  __swift_project_boxed_opaque_existential_1(v140, v141);
  v22 = sub_1BCC006F0();
  sub_1BCBE80A8((uint64_t)v143);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v140);
  sub_1BCBE806C((uint64_t)v3, (uint64_t)v140);
  v23 = v10;
  if ((v22 & 1) != 0)
  {
LABEL_19:
    sub_1BCBE80A8((uint64_t)v140);
    goto LABEL_20;
  }
  sub_1BCBF36B8((uint64_t)&v142, (uint64_t)v137);
  if (v138)
  {
    __swift_project_boxed_opaque_existential_1(v137, v138);
    v24 = sub_1BCC006C0();
    sub_1BCBE80A8((uint64_t)v140);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v137);
    goto LABEL_21;
  }
  sub_1BCBE80A8((uint64_t)v140);
  sub_1BCBDC2D4((uint64_t)v137, &qword_1ED1BC8B0);
LABEL_20:
  v24 = 0;
LABEL_21:
  if ((sub_1BCC00E58() & 1) != 0)
  {
    if (((v124 | v24) & 1) == 0)
    {
LABEL_23:
      __swift_project_boxed_opaque_existential_1(v3 + 53, v3[56]);
      sub_1BCC008C4();
      __swift_project_boxed_opaque_existential_1(v3 + 58, v3[61]);
      sub_1BCC008C4();
      sub_1BCBDB05C((uint64_t)(v3 + 53), (uint64_t)v137);
      sub_1BCBDB05C((uint64_t)(v3 + 58), (uint64_t)&v134);
      sub_1BCBDB05C((uint64_t)(v3 + 8), (uint64_t)&v131);
      sub_1BCBDB05C((uint64_t)(v3 + 18), (uint64_t)v130);
      sub_1BCBDB05C((uint64_t)(v3 + 18), (uint64_t)&v129);
      v25 = sub_1BCC00D2C();
      v26 = MEMORY[0x1E0D42450];
      a2[3] = v25;
      a2[4] = v26;
      a2[5] = MEMORY[0x1E0D42458];
      __swift_allocate_boxed_opaque_existential_1(a2);
      return sub_1BCC00D20();
    }
  }
  else if (!(v124 & 1 | ((sub_1BCC00E70() & 1) == 0) | v24 & 1))
  {
    goto LABEL_23;
  }
  LODWORD(v121) = v24;
  v101 = a2;
  v102 = v7;
  v28 = v3 + 53;
  __swift_project_boxed_opaque_existential_1(v3 + 53, v3[56]);
  sub_1BCC008DC();
  __swift_project_boxed_opaque_existential_1(v3 + 53, v3[56]);
  sub_1BCC008C4();
  __swift_project_boxed_opaque_existential_1(v3 + 58, v3[61]);
  sub_1BCC008DC();
  v29 = v3[61];
  v100 = v3 + 58;
  __swift_project_boxed_opaque_existential_1(v3 + 58, v29);
  sub_1BCC008C4();
  sub_1BCC00AC8();
  sub_1BCBF36B8((uint64_t)(v3 + 48), (uint64_t)&v134);
  v107 = v23;
  if (v135)
  {
    sub_1BCBDB3C8(&v134, (uint64_t)v137);
    v30 = v138;
    v31 = v139;
    v32 = __swift_project_boxed_opaque_existential_1(v137, v138);
    v135 = v30;
    v136 = *(_QWORD *)(v31 + 8);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v134);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(boxed_opaque_existential_1, v32, v30);
    v108 = (uint64_t)(v3 + 3);
    v133 = 0;
    v131 = 0u;
    v132 = 0u;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC218);
    v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_1BCC09A20;
    sub_1BCC00AA4();
    sub_1BCC00A98();
    v130[0] = v34;
    sub_1BCBDAC80((unint64_t *)&qword_1ED1BC200, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41F08], MEMORY[0x1E0D41F18]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC208);
    sub_1BCBF3700((unint64_t *)&qword_1ED1BC210, &qword_1ED1BC208);
    v110 = (void (*)(_QWORD))(v3 + 53);
    v36 = v118;
    v35 = v119;
    sub_1BCC00EDC();
    v37 = *MEMORY[0x1E0D41EC8];
    v38 = v122;
    v39 = *(void (**)(char *, uint64_t, uint64_t))(v122 + 104);
    v109 = v3;
    v41 = v126;
    v40 = v127;
    v39(v127, v37, v126);
    v42 = v123;
    v43 = v102;
    v44 = v120;
    (*(void (**)(char *, _QWORD, uint64_t))(v123 + 104))(v102, *MEMORY[0x1E0D41F28], v120);
    v45 = v116;
    sub_1BCC00AD4();
    v46 = *(void (**)(char *, uint64_t))(v42 + 8);
    v47 = v40;
    v3 = v109;
    v46(v43, v44);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v47, v41);
    v48 = v36;
    v28 = v110;
    (*(void (**)(char *, uint64_t))(v107 + 8))(v48, v35);
    sub_1BCBDC2D4((uint64_t)&v131, &qword_1ED1BC1F8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v134);
    sub_1BCC00AEC();
    (*(void (**)(char *, uint64_t))(v117 + 8))(v45, v125);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v137);
  }
  else
  {
    sub_1BCBDC2D4((uint64_t)&v134, &qword_1ED1BC8B0);
    v47 = v127;
  }
  v49 = v3[56];
  v50 = v3[57];
  v51 = __swift_project_boxed_opaque_existential_1(v28, v49);
  v138 = v49;
  v139 = *(_QWORD *)(v50 + 8);
  v52 = __swift_allocate_boxed_opaque_existential_1(v137);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v49 - 8) + 16))(v52, v51, v49);
  v53 = 8;
  if ((v121 & 1) != 0)
    v53 = 13;
  v99 = v121 | v124;
  sub_1BCBDB05C((uint64_t)&v3[v53], (uint64_t)&v134);
  v133 = 0;
  v131 = 0u;
  v132 = 0u;
  LODWORD(v121) = *MEMORY[0x1E0D41EC8];
  v124 = *(void (**)(char *))(v122 + 104);
  v124(v47);
  LODWORD(v109) = *MEMORY[0x1E0D41F28];
  v110 = *(void (**)(_QWORD))(v123 + 104);
  v54 = v102;
  v55 = v120;
  v110(v102);
  v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC218);
  v56 = v107;
  v57 = *(unsigned __int8 *)(v107 + 80);
  v58 = (v57 + 32) & ~v57;
  v96 = *(_QWORD *)(v107 + 72);
  v98 = v58 + v96;
  v106 = v57 | 7;
  v59 = swift_allocObject();
  v97 = xmmword_1BCC091B0;
  *(_OWORD *)(v59 + 16) = xmmword_1BCC091B0;
  sub_1BCC00A8C();
  v130[0] = v59;
  v105 = sub_1BCBDAC80((unint64_t *)&qword_1ED1BC200, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41F08], MEMORY[0x1E0D41F18]);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC208);
  v103 = sub_1BCBF3700((unint64_t *)&qword_1ED1BC210, &qword_1ED1BC208);
  v60 = v118;
  v61 = v119;
  sub_1BCC00EDC();
  v62 = v111;
  v63 = v127;
  sub_1BCC00AD4();
  v107 = *(_QWORD *)(v56 + 8);
  ((void (*)(char *, uint64_t))v107)(v60, v61);
  v123 = *(_QWORD *)(v123 + 8);
  ((void (*)(char *, uint64_t))v123)(v54, v55);
  v122 = *(_QWORD *)(v122 + 8);
  ((void (*)(char *, uint64_t))v122)(v63, v126);
  sub_1BCBDC2D4((uint64_t)&v131, &qword_1ED1BC1F8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v134);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v137);
  sub_1BCC00AEC();
  v117 = *(_QWORD *)(v117 + 8);
  ((void (*)(char *, uint64_t))v117)(v62, v125);
  v64 = v54;
  v65 = v3[61];
  v66 = v3[62];
  v67 = __swift_project_boxed_opaque_existential_1(v100, v65);
  v138 = v65;
  v68 = *(_QWORD *)(v66 + 8);
  v69 = v55;
  v70 = v64;
  v139 = v68;
  v71 = __swift_allocate_boxed_opaque_existential_1(v137);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v65 - 8) + 16))(v71, v67, v65);
  v72 = 18;
  if ((v99 & 1) != 0)
    v72 = 23;
  sub_1BCBDB05C((uint64_t)&v3[v72], (uint64_t)&v134);
  v133 = 0;
  v131 = 0u;
  v132 = 0u;
  v73 = swift_allocObject();
  *(_OWORD *)(v73 + 16) = v97;
  v111 = (char *)v58;
  sub_1BCC00AA4();
  v130[0] = v73;
  sub_1BCC00EDC();
  v74 = v126;
  v75 = v127;
  ((void (*)(char *, _QWORD, uint64_t))v124)(v127, v121, v126);
  ((void (*)(char *, _QWORD, uint64_t))v110)(v64, v109, v69);
  v76 = v113;
  sub_1BCC00AD4();
  ((void (*)(char *, uint64_t))v123)(v64, v69);
  v77 = v75;
  v78 = v74;
  ((void (*)(char *, uint64_t))v122)(v77, v74);
  ((void (*)(char *, uint64_t))v107)(v60, v61);
  sub_1BCBDC2D4((uint64_t)&v131, &qword_1ED1BC1F8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v134);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v137);
  v79 = v128;
  sub_1BCC00AEC();
  ((void (*)(char *, uint64_t))v117)(v76, v125);
  sub_1BCBF36B8(v112, (uint64_t)&v134);
  if (v135)
  {
    v80 = v60;
    v81 = v78;
    sub_1BCBDB3C8(&v134, (uint64_t)v137);
    v82 = v138;
    v83 = v139;
    v84 = __swift_project_boxed_opaque_existential_1(v137, v138);
    v135 = v82;
    v136 = *(_QWORD *)(v83 + 8);
    v85 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v134);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v82 - 8) + 16))(v85, v84, v82);
    v133 = 0;
    v131 = 0u;
    v132 = 0u;
    v86 = swift_allocObject();
    *(_OWORD *)(v86 + 16) = xmmword_1BCC09A20;
    sub_1BCC00AA4();
    sub_1BCC00A98();
    v130[0] = v86;
    sub_1BCC00EDC();
    v87 = v127;
    ((void (*)(char *, _QWORD, uint64_t))v124)(v127, v121, v81);
    ((void (*)(char *, _QWORD, uint64_t))v110)(v70, v109, v69);
    v88 = v116;
    sub_1BCC00AD4();
    ((void (*)(char *, uint64_t))v123)(v70, v69);
    ((void (*)(char *, uint64_t))v122)(v87, v81);
    ((void (*)(char *, uint64_t))v107)(v80, v61);
    sub_1BCBDC2D4((uint64_t)&v131, &qword_1ED1BC1F8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v134);
    v89 = v128;
    sub_1BCC00AEC();
    ((void (*)(char *, uint64_t))v117)(v88, v125);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v137);
    v90 = v115;
  }
  else
  {
    v91 = v79;
    sub_1BCBDC2D4((uint64_t)&v134, &qword_1ED1BC8B0);
    v90 = v115;
    v89 = v91;
  }
  v92 = MEMORY[0x1E0D41F70];
  v93 = v101;
  v101[3] = v90;
  v93[4] = v92;
  v93[5] = MEMORY[0x1E0D41F78];
  v94 = __swift_allocate_boxed_opaque_existential_1(v93);
  return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v114 + 32))(v94, v89, v90);
}

uint64_t sub_1BCBF2250@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t);
  uint64_t v60;
  char *v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  __int128 v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93[5];
  _BYTE v94[32];
  uint64_t v95;
  uint64_t v96[3];
  uint64_t v97;
  uint64_t v98;
  _BYTE v99[48];
  uint64_t v100[3];
  __int128 v101;
  uint64_t v102;
  uint64_t v103[3];
  __int128 v104;

  v90 = a2;
  v83 = sub_1BCC00C00();
  v80 = *(_QWORD *)(v83 - 8);
  MEMORY[0x1E0C80A78](v83);
  v85 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v82 = (char *)&v63 - v6;
  v86 = sub_1BCC00C24();
  v84 = *(_QWORD *)(v86 - 8);
  MEMORY[0x1E0C80A78](v86);
  v81 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1BCC00B1C();
  v73 = *(_QWORD *)(v8 - 8);
  v74 = v8;
  MEMORY[0x1E0C80A78](v8);
  v75 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1BCC00B28();
  v78 = *(_QWORD *)(v10 - 8);
  v79 = v10;
  MEMORY[0x1E0C80A78](v10);
  v77 = (char *)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1BCC00B34();
  v71 = *(_QWORD *)(v12 - 8);
  v72 = v12;
  MEMORY[0x1E0C80A78](v12);
  v70 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1BCC00B4C();
  v68 = *(_QWORD *)(v14 - 8);
  v69 = v14;
  MEMORY[0x1E0C80A78](v14);
  v67 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = sub_1BCC00B64();
  v16 = *(_QWORD *)(v64 - 8);
  MEMORY[0x1E0C80A78](v64);
  v87 = (char *)&v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1BCC00B7C();
  v88 = *(_QWORD *)(v18 - 8);
  *(_QWORD *)&v89 = v18;
  MEMORY[0x1E0C80A78](v18);
  v76 = (char *)&v63 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1BCC00BDC();
  v63 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v23);
  v25 = (char *)&v63 - v24;
  v26 = sub_1BCC00BF4();
  v65 = *(_QWORD *)(v26 - 8);
  v66 = v26;
  *(_QWORD *)&v27 = MEMORY[0x1E0C80A78](v26).n128_u64[0];
  v29 = (char *)&v63 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = (uint64_t)objc_msgSend(a1, sel_traitCollection, v27);
  v92 = v2;
  sub_1BCBF1444(v30, v103);

  v91 = a1;
  v31 = objc_msgSend(a1, sel_traitCollection);
  LOBYTE(v30) = sub_1BCC00E70();

  if ((v30 & 1) != 0)
  {
    v89 = v104;
    v32 = v104;
    v33 = __swift_project_boxed_opaque_existential_1(v103, v104);
    v101 = v89;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v100);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(boxed_opaque_existential_1, v33, v32);
    v35 = v92;
    sub_1BCBDB05C(v92 + 344, (uint64_t)v99);
    v36 = *(_QWORD *)(v35 + 16);
    v97 = MEMORY[0x1E0DEF040];
    v98 = MEMORY[0x1E0D418A8];
    v96[0] = v36;
    sub_1BCBDB05C(v35 + 544, (uint64_t)v94);
    sub_1BCBDB05C(v35 + 264, (uint64_t)v93);
    v37 = *MEMORY[0x1E0D42118];
    v38 = *(void (**)(char *, uint64_t, uint64_t))(v63 + 104);
    v38(v25, v37, v20);
    v38(v22, v37, v20);
    sub_1BCC00BE8();
    sub_1BCC00BD0();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v29, v66);
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v87, *MEMORY[0x1E0D42080], v64);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48DDD0);
    v39 = *(unsigned __int8 *)(*(_QWORD *)(sub_1BCC00B58() - 8) + 80);
    v40 = (v39 + 32) & ~v39;
    v41 = swift_allocObject();
    *(_OWORD *)(v41 + 16) = xmmword_1BCC091B0;
    v66 = v41 + v40;
    v42 = v67;
    v43 = v68;
    v44 = v69;
    (*(void (**)(char *, _QWORD, uint64_t))(v68 + 104))(v67, *MEMORY[0x1E0D42040], v69);
    v100[0] = MEMORY[0x1E0DEE9D8];
    sub_1BCBDAC80(&qword_1EF48DDD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D42010], MEMORY[0x1E0D42020]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48DDE0);
    sub_1BCBF3700(&qword_1EF48DDE8, &qword_1EF48DDE0);
    v45 = v70;
    v46 = v72;
    sub_1BCC00EDC();
    sub_1BCC00B40();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v45, v46);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v42, v44);
    v47 = sub_1BCC008AC();
    v48 = MEMORY[0x1E0D41BB8];
    *(_QWORD *)&v101 = v47;
    *((_QWORD *)&v101 + 1) = MEMORY[0x1E0D41BB8];
    __swift_allocate_boxed_opaque_existential_1(v100);
    sub_1BCC008A0();
    v49 = v76;
    sub_1BCC00B70();
    v50 = v89;
    *(_QWORD *)&v101 = v89;
    *((_QWORD *)&v101 + 1) = MEMORY[0x1E0D42098];
    v102 = MEMORY[0x1E0D420A0];
    v51 = __swift_allocate_boxed_opaque_existential_1(v100);
    (*(void (**)(uint64_t *, char *, uint64_t))(v88 + 16))(v51, v49, v50);
    sub_1BCBE0C18((uint64_t)v103, (uint64_t)v99);
    (*(void (**)(char *, _QWORD, uint64_t))(v73 + 104))(v75, *MEMORY[0x1E0D41FE0], v74);
    v52 = v92;
    sub_1BCBDB05C(v92 + 264, (uint64_t)v96);
    v53 = v77;
    sub_1BCC00B10();
    v54 = v79;
    *(_QWORD *)&v101 = v79;
    *((_QWORD *)&v101 + 1) = MEMORY[0x1E0D41FF0];
    v55 = __swift_allocate_boxed_opaque_existential_1(v100);
    v56 = v78;
    (*(void (**)(uint64_t *, char *, uint64_t))(v78 + 16))(v55, v53, v54);
    sub_1BCBDB05C(v52 + 344, (uint64_t)v99);
    v57 = *(_QWORD *)(v52 + 16);
    v97 = MEMORY[0x1E0DEF040];
    v98 = MEMORY[0x1E0D418A8];
    v96[0] = v57;
    v95 = 0;
    memset(v94, 0, sizeof(v94));
    v93[3] = v47;
    v93[4] = v48;
    __swift_allocate_boxed_opaque_existential_1(v93);
    sub_1BCC008A0();
    v58 = *MEMORY[0x1E0D42198];
    v59 = *(void (**)(char *, uint64_t, uint64_t))(v80 + 104);
    v60 = v83;
    v59(v82, v58, v83);
    v59(v85, v58, v60);
    v61 = v81;
    sub_1BCC00C18();
    sub_1BCC00C0C();
    (*(void (**)(char *, uint64_t))(v84 + 8))(v61, v86);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v53, v54);
    (*(void (**)(char *, _QWORD))(v88 + 8))(v49, v89);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v103);
}

double sub_1BCBF2A10(_QWORD *a1, void *a2, double a3)
{
  swift_getObjectType();
  return sub_1BCBE651C(a1, a2, a3);
}

uint64_t sub_1BCBF2A58()
{
  sub_1BCBF3740();
  return sub_1BCC00B04();
}

uint64_t sub_1BCBF2AB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BCBE7F0C(v1, a1);
}

uint64_t destroy for MediumLockupLayout(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  __swift_destroy_boxed_opaque_existential_1(a1 + 64);
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  __swift_destroy_boxed_opaque_existential_1(a1 + 144);
  __swift_destroy_boxed_opaque_existential_1(a1 + 184);
  __swift_destroy_boxed_opaque_existential_1(a1 + 224);
  __swift_destroy_boxed_opaque_existential_1(a1 + 264);
  __swift_destroy_boxed_opaque_existential_1(a1 + 304);
  __swift_destroy_boxed_opaque_existential_1(a1 + 344);
  if (*(_QWORD *)(a1 + 408))
    __swift_destroy_boxed_opaque_existential_1(a1 + 384);
  __swift_destroy_boxed_opaque_existential_1(a1 + 424);
  __swift_destroy_boxed_opaque_existential_1(a1 + 464);
  if (*(_QWORD *)(a1 + 528))
    __swift_destroy_boxed_opaque_existential_1(a1 + 504);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 544);
}

uint64_t initializeWithCopy for MediumLockupLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  _OWORD *v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 24, a2 + 24);
  v5 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 88) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 64, a2 + 64);
  v6 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 128) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 104, a2 + 104);
  v7 = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 168) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 144, a2 + 144);
  v8 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 208) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 184, a2 + 184);
  v9 = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 248) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 224, a2 + 224);
  v10 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 288) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 264, a2 + 264);
  v11 = *(_QWORD *)(a2 + 328);
  v12 = *(_QWORD *)(a2 + 336);
  *(_QWORD *)(a1 + 328) = v11;
  *(_QWORD *)(a1 + 336) = v12;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 304, a2 + 304);
  v13 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 368) = v13;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 344, a2 + 344);
  v14 = (_OWORD *)(a1 + 384);
  v15 = (_OWORD *)(a2 + 384);
  v16 = *(_QWORD *)(a2 + 408);
  if (v16)
  {
    v17 = *(_QWORD *)(a2 + 416);
    *(_QWORD *)(a1 + 408) = v16;
    *(_QWORD *)(a1 + 416) = v17;
    (**(void (***)(_OWORD *, _OWORD *))(v16 - 8))(v14, v15);
  }
  else
  {
    v18 = *(_OWORD *)(a2 + 400);
    *v14 = *v15;
    *(_OWORD *)(a1 + 400) = v18;
    *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
  }
  v19 = *(_OWORD *)(a2 + 448);
  *(_OWORD *)(a1 + 448) = v19;
  (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 424, a2 + 424);
  v20 = *(_QWORD *)(a2 + 488);
  v21 = *(_QWORD *)(a2 + 496);
  *(_QWORD *)(a1 + 488) = v20;
  *(_QWORD *)(a1 + 496) = v21;
  (**(void (***)(uint64_t, uint64_t))(v20 - 8))(a1 + 464, a2 + 464);
  v22 = (_OWORD *)(a1 + 504);
  v23 = (_OWORD *)(a2 + 504);
  v24 = *(_QWORD *)(a2 + 528);
  if (v24)
  {
    *(_QWORD *)(a1 + 528) = v24;
    *(_QWORD *)(a1 + 536) = *(_QWORD *)(a2 + 536);
    (**(void (***)(_OWORD *, _OWORD *))(v24 - 8))(v22, v23);
  }
  else
  {
    v25 = *(_OWORD *)(a2 + 520);
    *v22 = *v23;
    *(_OWORD *)(a1 + 520) = v25;
    *(_QWORD *)(a1 + 536) = *(_QWORD *)(a2 + 536);
  }
  v26 = *(_QWORD *)(a2 + 568);
  *(_QWORD *)(a1 + 568) = v26;
  *(_QWORD *)(a1 + 576) = *(_QWORD *)(a2 + 576);
  (**(void (***)(uint64_t, uint64_t))(v26 - 8))(a1 + 544, a2 + 544);
  return a1;
}

uint64_t assignWithCopy for MediumLockupLayout(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 24), (uint64_t *)(a2 + 24));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 64), (uint64_t *)(a2 + 64));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 104), (uint64_t *)(a2 + 104));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 144), (uint64_t *)(a2 + 144));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 184), (uint64_t *)(a2 + 184));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 224), (uint64_t *)(a2 + 224));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 264), (uint64_t *)(a2 + 264));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 304), (uint64_t *)(a2 + 304));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 344), (uint64_t *)(a2 + 344));
  v4 = *(_QWORD *)(a2 + 408);
  if (*(_QWORD *)(a1 + 408))
  {
    if (v4)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 384), (uint64_t *)(a2 + 384));
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(a1 + 384);
  }
  else if (v4)
  {
    *(_QWORD *)(a1 + 408) = v4;
    *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 384, a2 + 384);
    goto LABEL_8;
  }
  v5 = *(_OWORD *)(a2 + 384);
  v6 = *(_OWORD *)(a2 + 400);
  *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 384) = v5;
  *(_OWORD *)(a1 + 400) = v6;
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 424), (uint64_t *)(a2 + 424));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 464), (uint64_t *)(a2 + 464));
  v7 = *(_QWORD *)(a2 + 528);
  if (!*(_QWORD *)(a1 + 528))
  {
    if (v7)
    {
      *(_QWORD *)(a1 + 528) = v7;
      *(_QWORD *)(a1 + 536) = *(_QWORD *)(a2 + 536);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 504, a2 + 504);
      goto LABEL_15;
    }
LABEL_14:
    v8 = *(_OWORD *)(a2 + 504);
    v9 = *(_OWORD *)(a2 + 520);
    *(_QWORD *)(a1 + 536) = *(_QWORD *)(a2 + 536);
    *(_OWORD *)(a1 + 504) = v8;
    *(_OWORD *)(a1 + 520) = v9;
    goto LABEL_15;
  }
  if (!v7)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 504);
    goto LABEL_14;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 504), (uint64_t *)(a2 + 504));
LABEL_15:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 544), (uint64_t *)(a2 + 544));
  return a1;
}

void *__swift_memcpy584_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x248uLL);
}

uint64_t assignWithTake for MediumLockupLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 64);
  v4 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 144);
  v5 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v5;
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 184);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  __swift_destroy_boxed_opaque_existential_1(a1 + 224);
  v6 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v6;
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  __swift_destroy_boxed_opaque_existential_1(a1 + 264);
  v7 = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 280) = v7;
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  __swift_destroy_boxed_opaque_existential_1(a1 + 304);
  v8 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 320) = v8;
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  __swift_destroy_boxed_opaque_existential_1(a1 + 344);
  v9 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = v9;
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  if (*(_QWORD *)(a1 + 408))
    __swift_destroy_boxed_opaque_existential_1(a1 + 384);
  v10 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
  *(_OWORD *)(a1 + 400) = v10;
  *(_QWORD *)(a1 + 416) = *(_QWORD *)(a2 + 416);
  __swift_destroy_boxed_opaque_existential_1(a1 + 424);
  v11 = *(_OWORD *)(a2 + 440);
  *(_OWORD *)(a1 + 424) = *(_OWORD *)(a2 + 424);
  *(_OWORD *)(a1 + 440) = v11;
  *(_QWORD *)(a1 + 456) = *(_QWORD *)(a2 + 456);
  __swift_destroy_boxed_opaque_existential_1(a1 + 464);
  v12 = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 464) = *(_OWORD *)(a2 + 464);
  *(_OWORD *)(a1 + 480) = v12;
  *(_QWORD *)(a1 + 496) = *(_QWORD *)(a2 + 496);
  if (*(_QWORD *)(a1 + 528))
    __swift_destroy_boxed_opaque_existential_1(a1 + 504);
  *(_QWORD *)(a1 + 536) = *(_QWORD *)(a2 + 536);
  v13 = *(_OWORD *)(a2 + 520);
  *(_OWORD *)(a1 + 504) = *(_OWORD *)(a2 + 504);
  *(_OWORD *)(a1 + 520) = v13;
  __swift_destroy_boxed_opaque_existential_1(a1 + 544);
  v14 = *(_OWORD *)(a2 + 560);
  *(_OWORD *)(a1 + 544) = *(_OWORD *)(a2 + 544);
  *(_OWORD *)(a1 + 560) = v14;
  *(_QWORD *)(a1 + 576) = *(_QWORD *)(a2 + 576);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediumLockupLayout(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 584))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MediumLockupLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 584) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 584) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MediumLockupLayout()
{
  return &type metadata for MediumLockupLayout;
}

uint64_t destroy for MediumLockupLayout.Metrics(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  __swift_destroy_boxed_opaque_existential_1(a1 + 64);
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  __swift_destroy_boxed_opaque_existential_1(a1 + 144);
  __swift_destroy_boxed_opaque_existential_1(a1 + 184);
  __swift_destroy_boxed_opaque_existential_1(a1 + 224);
  __swift_destroy_boxed_opaque_existential_1(a1 + 264);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 304);
}

uint64_t initializeWithCopy for MediumLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 24, a2 + 24);
  v5 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 88) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 64, a2 + 64);
  v6 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 128) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 104, a2 + 104);
  v7 = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 168) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 144, a2 + 144);
  v8 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 208) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 184, a2 + 184);
  v9 = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 248) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 224, a2 + 224);
  v10 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 288) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 264, a2 + 264);
  v11 = *(_QWORD *)(a2 + 328);
  v12 = *(_QWORD *)(a2 + 336);
  *(_QWORD *)(a1 + 328) = v11;
  *(_QWORD *)(a1 + 336) = v12;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 304, a2 + 304);
  return a1;
}

uint64_t *assignWithCopy for MediumLockupLayout.Metrics(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  __swift_assign_boxed_opaque_existential_1(a1 + 3, a2 + 3);
  __swift_assign_boxed_opaque_existential_1(a1 + 8, a2 + 8);
  __swift_assign_boxed_opaque_existential_1(a1 + 13, a2 + 13);
  __swift_assign_boxed_opaque_existential_1(a1 + 18, a2 + 18);
  __swift_assign_boxed_opaque_existential_1(a1 + 23, a2 + 23);
  __swift_assign_boxed_opaque_existential_1(a1 + 28, a2 + 28);
  __swift_assign_boxed_opaque_existential_1(a1 + 33, a2 + 33);
  __swift_assign_boxed_opaque_existential_1(a1 + 38, a2 + 38);
  return a1;
}

void *__swift_memcpy344_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x158uLL);
}

uint64_t assignWithTake for MediumLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 64);
  v4 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 144);
  v5 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v5;
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 184);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  __swift_destroy_boxed_opaque_existential_1(a1 + 224);
  v6 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v6;
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  __swift_destroy_boxed_opaque_existential_1(a1 + 264);
  v7 = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 280) = v7;
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  __swift_destroy_boxed_opaque_existential_1(a1 + 304);
  v8 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 320) = v8;
  *(_QWORD *)(a1 + 336) = *(_QWORD *)(a2 + 336);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediumLockupLayout.Metrics(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 344))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MediumLockupLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 344) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 48) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 344) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MediumLockupLayout.Metrics()
{
  return &type metadata for MediumLockupLayout.Metrics;
}

unint64_t sub_1BCBF3674()
{
  unint64_t result;

  result = qword_1EF48DDC8;
  if (!qword_1EF48DDC8)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09A4C, &type metadata for MediumLockupLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DDC8);
  }
  return result;
}

uint64_t sub_1BCBF36B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC8B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCBF3700(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1BCCFEBCC](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BCBF3740()
{
  unint64_t result;

  result = qword_1EF48DDF0;
  if (!qword_1EF48DDF0)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09A7C, &type metadata for MediumLockupLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DDF0);
  }
  return result;
}

uint64_t sub_1BCBF3784@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(_QWORD *, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t);
  uint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  void (*v74)(char *, uint64_t);
  _QWORD *v75;
  unsigned int v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  char *v81;
  _QWORD *v82;
  uint64_t v83;
  char *v84;
  _QWORD *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char *v93;
  char *v94;
  uint64_t v95;
  void (*v96)(char *, uint64_t);
  char *v97;
  char *v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102[5];
  uint64_t v103[43];
  uint64_t v104[3];
  uint64_t v105;
  uint64_t v106;
  uint64_t v107[3];
  uint64_t v108;
  uint64_t v109;

  v2 = v1;
  v90 = a1;
  v101 = sub_1BCC00894();
  v82 = *(_QWORD **)(v101 - 8);
  MEMORY[0x1E0C80A78](v101);
  v84 = (char *)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v86 = (char *)&v74 - v5;
  MEMORY[0x1E0C80A78](v6);
  v87 = (char *)&v74 - v7;
  MEMORY[0x1E0C80A78](v8);
  v98 = (char *)&v74 - v9;
  MEMORY[0x1E0C80A78](v10);
  v99 = (char *)&v74 - v11;
  v95 = sub_1BCC00CD8();
  v78 = *(_QWORD *)(v95 - 8);
  MEMORY[0x1E0C80A78](v95);
  v94 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v93 = (char *)&v74 - v14;
  MEMORY[0x1E0C80A78](v15);
  v17 = (void (**)(char *, uint64_t))((char *)&v74 - v16);
  MEMORY[0x1E0C80A78](v18);
  v20 = (void (**)(char *, uint64_t))((char *)&v74 - v19);
  v21 = sub_1BCC00C6C();
  v80 = *(_QWORD **)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  v97 = (char *)&v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_1BCC00954();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23);
  v75 = (void (**)(char *, uint64_t))((char *)&v74 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v26);
  v28 = (char *)&v74 - v27;
  v83 = sub_1BCC00C78();
  MEMORY[0x1E0C80A78](v83);
  v81 = (char *)&v74 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_1BCC00D08();
  v88 = *(_QWORD *)(v30 - 8);
  v89 = v30;
  MEMORY[0x1E0C80A78](v30);
  v100 = (char *)&v74 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = v28;
  sub_1BCC0093C();
  v85 = v1 + 37;
  sub_1BCBDB05C((uint64_t)(v1 + 37), (uint64_t)v107);
  sub_1BCBF420C((uint64_t)v1, (uint64_t)v103);
  v32 = swift_allocObject();
  memcpy((void *)(v32 + 16), v103, 0x151uLL);
  v105 = v23;
  v106 = MEMORY[0x1E0D41D28];
  v91 = v23;
  __swift_allocate_boxed_opaque_existential_1(v104);
  sub_1BCC00948();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v107);
  v96 = *(void (**)(char *, uint64_t))(v24 + 8);
  v96(v28, v23);
  sub_1BCC00C90();
  v79 = sub_1BCC00CA8();
  v108 = v79;
  v109 = MEMORY[0x1E0D42350];
  __swift_allocate_boxed_opaque_existential_1(v107);
  sub_1BCC00CB4();
  ((void (*)(char *, _QWORD, uint64_t))v80[13])(v97, *MEMORY[0x1E0D42308], v21);
  v33 = (uint64_t)v75;
  sub_1BCC0093C();
  v80 = v1 + 22;
  sub_1BCBDB05C((uint64_t)(v1 + 22), (uint64_t)v103);
  v34 = *v1;
  v35 = MEMORY[0x1E0DEF040];
  v36 = MEMORY[0x1E0D418A8];
  v20[3] = MEMORY[0x1E0DEF040];
  v20[4] = v36;
  v37 = v35;
  *v20 = v34;
  v39 = *(void (**)(_QWORD *, _QWORD, uint64_t))(v78 + 104);
  v76 = *MEMORY[0x1E0D42390];
  v38 = v76;
  v40 = v95;
  v39(v20, v76, v95);
  v41 = v2[1];
  v17[3] = v37;
  v17[4] = v36;
  *v17 = v41;
  v39(v17, v38, v40);
  v77 = *MEMORY[0x1E0D42398];
  v42 = v77;
  v39(v93, v77, v40);
  v39(v94, v42, v40);
  v78 = sub_1BCC00CE4();
  v105 = v78;
  v106 = MEMORY[0x1E0D423B0];
  __swift_allocate_boxed_opaque_existential_1(v104);
  sub_1BCC00CF0();
  sub_1BCBF420C((uint64_t)v2, (uint64_t)v103);
  v43 = swift_allocObject();
  memcpy((void *)(v43 + 16), v103, 0x151uLL);
  sub_1BCC00948();
  swift_release();
  v96((char *)v33, v91);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v104);
  v44 = v98;
  sub_1BCC0087C();
  v75 = v2 + 27;
  sub_1BCBDB05C((uint64_t)(v2 + 27), (uint64_t)v104);
  sub_1BCBF420C((uint64_t)v2, (uint64_t)v103);
  v45 = swift_allocObject();
  memcpy((void *)(v45 + 16), v103, 0x151uLL);
  v46 = v99;
  sub_1BCC00888();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v104);
  v47 = (void (*)(char *, uint64_t))v82[1];
  v48 = v101;
  v47(v44, v101);
  v74 = v47;
  v82 = v2 + 32;
  sub_1BCBDB05C((uint64_t)(v2 + 32), (uint64_t)v104);
  sub_1BCBF420C((uint64_t)v2, (uint64_t)v103);
  v49 = swift_allocObject();
  memcpy((void *)(v49 + 16), v103, 0x151uLL);
  v102[3] = v48;
  v102[4] = MEMORY[0x1E0D41B98];
  __swift_allocate_boxed_opaque_existential_1(v102);
  sub_1BCC00888();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v104);
  v47(v46, v48);
  v50 = v91;
  v105 = v91;
  v106 = MEMORY[0x1E0D41D28];
  __swift_allocate_boxed_opaque_existential_1(v104);
  v51 = v92;
  sub_1BCC00948();
  v96(v51, v50);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v102);
  sub_1BCC00C9C();
  v103[3] = v79;
  v103[4] = MEMORY[0x1E0D42350];
  __swift_allocate_boxed_opaque_existential_1(v103);
  sub_1BCC00CB4();
  v52 = v81;
  sub_1BCC00C84();
  v53 = sub_1BCBDAC80(&qword_1EF48DE00, (uint64_t (*)(uint64_t))MEMORY[0x1E0D42328], MEMORY[0x1E0D42318]);
  MEMORY[0x1BCCFE0F8](v52, v83, v53);
  v54 = v84;
  sub_1BCC0087C();
  sub_1BCBDB05C((uint64_t)v80, (uint64_t)v103);
  v55 = *v2;
  v56 = MEMORY[0x1E0DEF040];
  v20[3] = MEMORY[0x1E0DEF040];
  v57 = MEMORY[0x1E0D418A8];
  v20[4] = MEMORY[0x1E0D418A8];
  *v20 = v55;
  v58 = v76;
  v59 = v95;
  v39(v20, v76, v95);
  v60 = v2[1];
  v17[3] = v56;
  v17[4] = v57;
  *v17 = v60;
  v39(v17, v58, v59);
  v61 = v77;
  v39(v93, v77, v59);
  v39(v94, v61, v59);
  v108 = v78;
  v109 = MEMORY[0x1E0D423B0];
  __swift_allocate_boxed_opaque_existential_1(v107);
  sub_1BCC00CF0();
  sub_1BCBF420C((uint64_t)v2, (uint64_t)v103);
  v62 = swift_allocObject();
  memcpy((void *)(v62 + 16), v103, 0x151uLL);
  v63 = v86;
  sub_1BCC00888();
  swift_release();
  v64 = v101;
  v65 = v74;
  v74(v54, v101);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v107);
  sub_1BCBDB05C((uint64_t)v75, (uint64_t)v107);
  sub_1BCBF420C((uint64_t)v2, (uint64_t)v103);
  v66 = swift_allocObject();
  memcpy((void *)(v66 + 16), v103, 0x151uLL);
  v67 = v87;
  sub_1BCC00888();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v107);
  v65(v63, v64);
  sub_1BCBDB05C((uint64_t)v82, (uint64_t)v107);
  sub_1BCBF420C((uint64_t)v2, (uint64_t)v103);
  v68 = swift_allocObject();
  memcpy((void *)(v68 + 16), v103, 0x151uLL);
  v69 = v98;
  sub_1BCC00888();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v107);
  v65(v67, v64);
  sub_1BCBDB05C((uint64_t)v85, (uint64_t)v107);
  sub_1BCBF420C((uint64_t)v2, (uint64_t)v103);
  v70 = swift_allocObject();
  memcpy((void *)(v70 + 16), v103, 0x151uLL);
  v71 = v99;
  sub_1BCC00888();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v107);
  v65(v69, v64);
  sub_1BCBDAC80(&qword_1EF48DE08, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41BA0], MEMORY[0x1E0D41B90]);
  v72 = v100;
  sub_1BCC00CFC();
  v65(v71, v64);
  return (*(uint64_t (**)(char *, uint64_t))(v88 + 8))(v72, v89);
}

uint64_t sub_1BCBF41CC(uint64_t a1, uint64_t a2)
{
  _BYTE v3[40];

  sub_1BCBDB05C(a2 + 136, (uint64_t)v3);
  sub_1BCC00918();
  return sub_1BCC00930();
}

uint64_t sub_1BCBF420C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for MiniLockupLayout(a2, a1);
  return a2;
}

uint64_t sub_1BCBF4244(uint64_t a1)
{
  uint64_t v1;

  return sub_1BCBF41CC(a1, v1 + 16);
}

uint64_t sub_1BCBF424C()
{
  return sub_1BCC00930();
}

uint64_t sub_1BCBF4270(uint64_t a1, uint64_t a2)
{
  _BYTE v4[40];

  sub_1BCC00930();
  sub_1BCBDB05C(a2 + 16, (uint64_t)v4);
  return sub_1BCC00924();
}

uint64_t sub_1BCBF42B8(uint64_t a1)
{
  uint64_t v1;

  return sub_1BCBF4270(a1, v1 + 16);
}

uint64_t sub_1BCBF42C0()
{
  if (qword_1EF48D0A8 != -1)
    swift_once();
  return sub_1BCC00858();
}

uint64_t sub_1BCBF4318(uint64_t a1, uint64_t a2)
{
  _BYTE v3[40];

  sub_1BCBDB05C(a2 + 96, (uint64_t)v3);
  sub_1BCC00840();
  return sub_1BCC00834();
}

uint64_t sub_1BCBF4360(uint64_t a1)
{
  uint64_t v1;

  return sub_1BCBF4318(a1, v1 + 16);
}

uint64_t sub_1BCBF4368()
{
  sub_1BCC00870();
  return sub_1BCC00858();
}

uint64_t sub_1BCBF4390()
{
  uint64_t v0;
  _BYTE v2[40];

  sub_1BCBDB05C(v0 + 32, (uint64_t)v2);
  return sub_1BCC0084C();
}

uint64_t sub_1BCBF43D0()
{
  uint64_t v0;
  _BYTE v2[40];

  sub_1BCBDB05C(v0 + 72, (uint64_t)v2);
  return sub_1BCC00840();
}

uint64_t sub_1BCBF4410()
{
  uint64_t v0;
  _BYTE v2[40];

  sub_1BCBDB05C(v0 + 112, (uint64_t)v2);
  return sub_1BCC00840();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1(v0 + 192);
  __swift_destroy_boxed_opaque_existential_1(v0 + 232);
  __swift_destroy_boxed_opaque_existential_1(v0 + 272);
  __swift_destroy_boxed_opaque_existential_1(v0 + 312);
  return swift_deallocObject();
}

uint64_t sub_1BCBF44AC()
{
  uint64_t v0;
  _BYTE v2[40];

  sub_1BCBDB05C(v0 + 152, (uint64_t)v2);
  return sub_1BCC00840();
}

uint64_t sub_1BCBF44E8()
{
  uint64_t result;

  result = sub_1BCC00864();
  qword_1EF48DDF8 = result;
  return result;
}

uint64_t destroy for MiniLockupLayout(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 296);
}

uint64_t initializeWithCopy for MiniLockupLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 56, a2 + 56);
  v6 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 96, a2 + 96);
  v7 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 136, a2 + 136);
  v8 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 200) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 176, a2 + 176);
  v9 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 240) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 216, a2 + 216);
  v10 = *(_QWORD *)(a2 + 280);
  v11 = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 280) = v10;
  *(_QWORD *)(a1 + 288) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 256, a2 + 256);
  v12 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 320) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 296, a2 + 296);
  *(_BYTE *)(a1 + 336) = *(_BYTE *)(a2 + 336);
  return a1;
}

uint64_t assignWithCopy for MiniLockupLayout(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 56), (uint64_t *)(a2 + 56));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 96), (uint64_t *)(a2 + 96));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 136), (uint64_t *)(a2 + 136));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 176), (uint64_t *)(a2 + 176));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 216), (uint64_t *)(a2 + 216));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 256), (uint64_t *)(a2 + 256));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 296), (uint64_t *)(a2 + 296));
  *(_BYTE *)(a1 + 336) = *(_BYTE *)(a2 + 336);
  return a1;
}

void *__swift_memcpy337_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x151uLL);
}

uint64_t assignWithTake for MiniLockupLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  v6 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v6;
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  v7 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v7;
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  v8 = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 296) = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 312) = v8;
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_BYTE *)(a1 + 336) = *(_BYTE *)(a2 + 336);
  return a1;
}

uint64_t getEnumTagSinglePayload for MiniLockupLayout(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 337))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MiniLockupLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 328) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 336) = 0;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 337) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 337) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MiniLockupLayout()
{
  return &type metadata for MiniLockupLayout;
}

uint64_t destroy for MiniLockupLayout.Metrics(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 136);
}

_OWORD *initializeWithCopy for MiniLockupLayout.Metrics(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  *a1 = *a2;
  v4 = *(_OWORD *)((char *)a2 + 40);
  *(_OWORD *)((char *)a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))((uint64_t)(a1 + 1), (uint64_t)(a2 + 1));
  v5 = a2[5];
  a1[5] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 56, (uint64_t)a2 + 56);
  v6 = *(_OWORD *)((char *)a2 + 120);
  *(_OWORD *)((char *)a1 + 120) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 6), (uint64_t)(a2 + 6));
  v7 = a2[10];
  a1[10] = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)a1 + 136, (uint64_t)a2 + 136);
  return a1;
}

uint64_t *assignWithCopy for MiniLockupLayout.Metrics(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  __swift_assign_boxed_opaque_existential_1(a1 + 17, a2 + 17);
  return a1;
}

__n128 __swift_memcpy176_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  __int128 v9;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  result = (__n128)a2[7];
  v8 = a2[8];
  v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(__n128 *)(a1 + 112) = result;
  *(_OWORD *)(a1 + 128) = v8;
  return result;
}

uint64_t assignWithTake for MiniLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  return a1;
}

uint64_t getEnumTagSinglePayload for MiniLockupLayout.Metrics(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 176))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MiniLockupLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 168) = 0;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 176) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 176) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MiniLockupLayout.Metrics()
{
  return &type metadata for MiniLockupLayout.Metrics;
}

_OWORD *sub_1BCBF4C08@<X0>(_OWORD *a1@<X8>)
{
  _OWORD *v1;

  return sub_1BCBE8338(v1, a1);
}

double sub_1BCBF4C14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  double v4;
  double v5;
  uint64_t v7;

  v0 = sub_1BCC00D08();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCBF3784((uint64_t)v3);
  sub_1BCC00D8C();
  v5 = v4;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

uint64_t sub_1BCBF4CEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_1BCC00D08();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCBF3784((uint64_t)v3);
  sub_1BCC00D80();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1BCBF4DB4()
{
  sub_1BCBF4E50();
  return sub_1BCC007E0();
}

unint64_t sub_1BCBF4DFC()
{
  unint64_t result;

  result = qword_1EF48DE10;
  if (!qword_1EF48DE10)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09B1C, &type metadata for MiniLockupLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DE10);
  }
  return result;
}

uint64_t sub_1BCBF4E40()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1BCBF4E50()
{
  unint64_t result;

  result = qword_1EF48DE18;
  if (!qword_1EF48DE18)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09B74, &type metadata for MiniLockupLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DE18);
  }
  return result;
}

uint64_t sub_1BCBF4E94()
{
  return MEMORY[0x1E0D42408];
}

uint64_t destroy for MiniProductPageLayout(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 280);
}

uint64_t initializeWithCopy for MiniProductPageLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v5;
  v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 120, a2 + 120);
  v8 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 160, a2 + 160);
  v9 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 224) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 200, a2 + 200);
  v10 = *(_QWORD *)(a2 + 264);
  v11 = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 264) = v10;
  *(_QWORD *)(a1 + 272) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 240, a2 + 240);
  v12 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 304) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 280, a2 + 280);
  return a1;
}

uint64_t *assignWithCopy for MiniProductPageLayout(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  __swift_assign_boxed_opaque_existential_1(a1 + 15, a2 + 15);
  __swift_assign_boxed_opaque_existential_1(a1 + 20, a2 + 20);
  __swift_assign_boxed_opaque_existential_1(a1 + 25, a2 + 25);
  __swift_assign_boxed_opaque_existential_1(a1 + 30, a2 + 30);
  __swift_assign_boxed_opaque_existential_1(a1 + 35, a2 + 35);
  return a1;
}

void *__swift_memcpy320_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x140uLL);
}

uint64_t assignWithTake for MiniProductPageLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v7;
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  __swift_destroy_boxed_opaque_existential_1(a1 + 240);
  v8 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v8;
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  __swift_destroy_boxed_opaque_existential_1(a1 + 280);
  v9 = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 296) = v9;
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  return a1;
}

uint64_t getEnumTagSinglePayload for MiniProductPageLayout(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 320))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 104);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MiniProductPageLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 312) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 320) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 104) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 320) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MiniProductPageLayout()
{
  return &type metadata for MiniProductPageLayout;
}

uint64_t sub_1BCBF5274@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  _QWORD *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t *boxed_opaque_existential_1;
  char *v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t);
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  void (*v66)(char *, uint64_t);
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  void (*v93)(char *, uint64_t);
  char *v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  void (*v102)(char *, uint64_t);
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  char *v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  _QWORD *v114;
  uint64_t v115;
  char *v116;
  _QWORD *v117;
  char *v118;
  char *v119;
  char *v120;
  uint64_t v121;
  char *v122;
  char v123;
  char v124;
  uint64_t v125[3];
  uint64_t v126;
  uint64_t v127;
  uint64_t v128[41];

  v112 = a1;
  v2 = sub_1BCC00828();
  v3 = *(_QWORD *)(v2 - 8);
  v110 = v2;
  v111 = v3;
  MEMORY[0x1E0C80A78](v2);
  v109 = (char *)&v95 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = sub_1BCC00894();
  v106 = *(_QWORD *)(v115 - 8);
  MEMORY[0x1E0C80A78](v115);
  v107 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v108 = (char *)&v95 - v7;
  MEMORY[0x1E0C80A78](v8);
  v118 = (char *)&v95 - v9;
  MEMORY[0x1E0C80A78](v10);
  v119 = (char *)&v95 - v11;
  v12 = sub_1BCC00954();
  v102 = *(void (**)(char *, uint64_t))(v12 - 8);
  v103 = v12;
  MEMORY[0x1E0C80A78](v12);
  v100 = (char *)&v95 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v101 = (char *)&v95 - v15;
  MEMORY[0x1E0C80A78](v16);
  v105 = (char *)&v95 - v17;
  v18 = sub_1BCC00CD8();
  v97 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v116 = (char *)&v95 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v113 = (char *)&v95 - v21;
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v95 - v23;
  MEMORY[0x1E0C80A78](v25);
  v27 = (char *)&v95 - v26;
  v114 = (_QWORD *)sub_1BCC00CE4();
  v99 = *(v114 - 1);
  MEMORY[0x1E0C80A78](v114);
  v29 = (char *)&v95 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = sub_1BCC00D08();
  v98 = *(_QWORD *)(v121 - 8);
  MEMORY[0x1E0C80A78](v121);
  v104 = (char *)&v95 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v31);
  v122 = (char *)&v95 - v32;
  MEMORY[0x1E0C80A78](v33);
  v120 = (char *)&v95 - v34;
  v96 = v1 + 10;
  sub_1BCBDB05C((uint64_t)(v1 + 10), (uint64_t)v128);
  v35 = *v1;
  v36 = v1;
  v117 = v1;
  v37 = MEMORY[0x1E0DEF040];
  v38 = MEMORY[0x1E0D418A8];
  *((_QWORD *)v27 + 3) = MEMORY[0x1E0DEF040];
  *((_QWORD *)v27 + 4) = v38;
  v39 = v38;
  *(_QWORD *)v27 = v35;
  v40 = *MEMORY[0x1E0D42390];
  v41 = *(void (**)(char *, uint64_t, uint64_t))(v97 + 104);
  v41(v27, v40, v18);
  v42 = v36[1];
  *((_QWORD *)v24 + 3) = v37;
  *((_QWORD *)v24 + 4) = v39;
  *(_QWORD *)v24 = v42;
  v41(v24, v40, v18);
  v43 = *MEMORY[0x1E0D42398];
  v41(v113, v43, v18);
  v41(v116, v43, v18);
  v95 = v29;
  sub_1BCC00CF0();
  v97 = sub_1BCBDAC80(&qword_1EF48DE28, (uint64_t (*)(uint64_t))MEMORY[0x1E0D423B8], MEMORY[0x1E0D423A8]);
  MEMORY[0x1BCCFE0F8](v29, v114, v97);
  sub_1BCBDB05C((uint64_t)v96, (uint64_t)v128);
  v44 = (uint64_t)v117;
  v45 = v117[2];
  v46 = MEMORY[0x1E0DEF040];
  *((_QWORD *)v27 + 3) = MEMORY[0x1E0DEF040];
  v47 = MEMORY[0x1E0D418A8];
  *((_QWORD *)v27 + 4) = MEMORY[0x1E0D418A8];
  *(_QWORD *)v27 = v45;
  v41(v27, v40, v18);
  v48 = *(_QWORD *)(v44 + 24);
  *((_QWORD *)v24 + 3) = v46;
  *((_QWORD *)v24 + 4) = v47;
  *(_QWORD *)v24 = v48;
  v41(v24, v40, v18);
  v41(v113, v43, v18);
  v41(v116, v43, v18);
  v49 = v95;
  sub_1BCC00CF0();
  v50 = v120;
  v51 = v114;
  v52 = v122;
  sub_1BCC00CFC();
  (*(void (**)(char *, _QWORD *))(v99 + 8))(v49, v51);
  v53 = v98;
  v116 = *(char **)(v98 + 8);
  v54 = v121;
  ((void (*)(char *, uint64_t))v116)(v52, v121);
  v55 = (uint64_t)v117;
  sub_1BCBE8BE4((uint64_t)v117, (uint64_t)v128);
  v56 = swift_allocObject();
  memcpy((void *)(v56 + 16), v128, 0x140uLL);
  v57 = v100;
  sub_1BCC0093C();
  v128[3] = v54;
  v128[4] = MEMORY[0x1E0D42408];
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v128);
  v114 = *(_QWORD **)(v53 + 16);
  ((void (*)(uint64_t *, char *, uint64_t))v114)(boxed_opaque_existential_1, v50, v54);
  v59 = v101;
  sub_1BCC00948();
  v60 = v103;
  v61 = (void (*)(char *, uint64_t))*((_QWORD *)v102 + 1);
  v61(v57, v103);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
  v62 = v118;
  sub_1BCC0087C();
  v63 = v55;
  v113 = (char *)(v55 + 120);
  sub_1BCBDB05C(v55 + 120, (uint64_t)v125);
  sub_1BCBE8BE4(v55, (uint64_t)v128);
  v64 = swift_allocObject();
  memcpy((void *)(v64 + 16), v128, 0x140uLL);
  v65 = v119;
  sub_1BCC00888();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v125);
  v66 = *(void (**)(char *, uint64_t))(v106 + 8);
  v67 = v115;
  v66(v62, v115);
  v106 = v63 + 160;
  v128[3] = v67;
  v128[4] = MEMORY[0x1E0D41B98];
  __swift_allocate_boxed_opaque_existential_1(v128);
  sub_1BCC00888();
  v66(v65, v67);
  v68 = v105;
  sub_1BCC00948();
  v61(v59, v60);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
  v69 = sub_1BCBDAC80(&qword_1EF48DE30, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41D30], MEMORY[0x1E0D41D20]);
  v70 = v104;
  MEMORY[0x1BCCFE0F8](v68, v60, v69);
  v71 = v107;
  sub_1BCC0087C();
  v72 = v121;
  v128[3] = v121;
  v128[4] = MEMORY[0x1E0D42408];
  v73 = __swift_allocate_boxed_opaque_existential_1(v128);
  ((void (*)(uint64_t *, char *, uint64_t))v114)(v73, v120, v72);
  v74 = v108;
  sub_1BCC00888();
  v66(v71, v67);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
  sub_1BCBDB05C((uint64_t)v113, (uint64_t)v125);
  sub_1BCBE8BE4(v63, (uint64_t)v128);
  v75 = swift_allocObject();
  memcpy((void *)(v75 + 16), v128, 0x140uLL);
  v76 = v118;
  sub_1BCC00888();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v125);
  v66(v74, v67);
  v77 = v119;
  sub_1BCC00888();
  v66(v76, v67);
  sub_1BCBDAC80(&qword_1EF48DE08, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41BA0], MEMORY[0x1E0D41B90]);
  v78 = v122;
  v79 = v67;
  sub_1BCC00CFC();
  v66(v77, v67);
  v80 = v121;
  ((void (*)(char *, uint64_t))v116)(v70, v121);
  sub_1BCC0087C();
  v128[3] = v80;
  v128[4] = MEMORY[0x1E0D42408];
  v81 = __swift_allocate_boxed_opaque_existential_1(v128);
  ((void (*)(uint64_t *, char *, uint64_t))v114)(v81, v78, v80);
  sub_1BCC00888();
  v66(v71, v67);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
  v82 = (uint64_t)v117;
  sub_1BCBDB05C((uint64_t)(v117 + 25), (uint64_t)v125);
  sub_1BCBE8BE4(v82, (uint64_t)v128);
  v83 = swift_allocObject();
  memcpy((void *)(v83 + 16), v128, 0x140uLL);
  v84 = v118;
  sub_1BCC00888();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v125);
  v102 = v66;
  v66(v74, v79);
  v85 = v109;
  sub_1BCC00810();
  v86 = v110;
  v126 = v110;
  v127 = MEMORY[0x1E0D41B28];
  __swift_allocate_boxed_opaque_existential_1(v125);
  sub_1BCC0081C();
  (*(void (**)(char *, uint64_t))(v111 + 8))(v85, v86);
  sub_1BCBE8BE4(v82, (uint64_t)v128);
  v87 = swift_allocObject();
  memcpy((void *)(v87 + 16), v128, 0x140uLL);
  sub_1BCC00888();
  swift_release();
  v66(v84, v79);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v125);
  sub_1BCBDB05C(v82 + 280, (uint64_t)v128);
  MEMORY[0x1BCCFDE28](0, 1, 0, 1);
  MEMORY[0x1BCCFDE28](0, 1, 0, 1);
  LOBYTE(v84) = v88;
  LOBYTE(v70) = v89;
  v126 = sub_1BCC00D68();
  v127 = MEMORY[0x1E0D42510];
  __swift_allocate_boxed_opaque_existential_1(v125);
  v124 = v84 & 1;
  v123 = v70 & 1;
  sub_1BCC00D74();
  sub_1BCBE8BE4(v82, (uint64_t)v128);
  v90 = swift_allocObject();
  memcpy((void *)(v90 + 16), v128, 0x140uLL);
  v91 = v119;
  sub_1BCC00888();
  swift_release();
  v102(v91, v115);
  v92 = v121;
  v93 = (void (*)(char *, uint64_t))v116;
  ((void (*)(char *, uint64_t))v116)(v122, v121);
  v93(v120, v92);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v125);
}

uint64_t sub_1BCBF5DCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t *, uint64_t, uint64_t);
  uint64_t v9;

  v0 = sub_1BCC00804();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (uint64_t *)((char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = sub_1BCC008AC();
  v5 = MEMORY[0x1E0D41BB8];
  v3[3] = v4;
  v3[4] = v5;
  __swift_allocate_boxed_opaque_existential_1(v3);
  sub_1BCC008A0();
  v6 = *MEMORY[0x1E0D41B08];
  v7 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v1 + 104);
  v7(v3, v6, v0);
  sub_1BCC007EC();
  v3[3] = v4;
  v3[4] = v5;
  __swift_allocate_boxed_opaque_existential_1(v3);
  sub_1BCC008A0();
  v7(v3, v6, v0);
  return sub_1BCC007F8();
}

__n128 sub_1BCBF5EBC@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  __int128 v3;
  __n128 result;

  v2 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 48) = v3;
  result = *(__n128 *)(v1 + 64);
  *(__n128 *)(a1 + 64) = result;
  return result;
}

double sub_1BCBF5ED8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  double v4;
  double v5;
  uint64_t v7;

  v0 = sub_1BCC00894();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCBF5274((uint64_t)v3);
  sub_1BCC00D8C();
  v5 = v4;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

uint64_t sub_1BCBF5FB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_1BCC00894();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCBF5274((uint64_t)v3);
  sub_1BCC00D80();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1BCBF6078()
{
  sub_1BCBF6348();
  return sub_1BCC007E0();
}

unint64_t sub_1BCBF60C0()
{
  unint64_t result;

  result = qword_1EF48DE20;
  if (!qword_1EF48DE20)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09C08, &type metadata for MiniProductPageLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DE20);
  }
  return result;
}

uint64_t sub_1BCBF6104()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1BCBF6118()
{
  sub_1BCC00930();
  return sub_1BCC00924();
}

uint64_t sub_1BCBF6170()
{
  return sub_1BCC00840();
}

uint64_t sub_1BCBF61C0()
{
  return sub_1BCC00840();
}

uint64_t sub_1BCBF6210()
{
  return sub_1BCC00840();
}

uint64_t sub_1BCBF6260()
{
  return sub_1BCC00840();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  __swift_destroy_boxed_opaque_existential_1(v0 + 216);
  __swift_destroy_boxed_opaque_existential_1(v0 + 256);
  __swift_destroy_boxed_opaque_existential_1(v0 + 296);
  return swift_deallocObject();
}

uint64_t sub_1BCBF62FC()
{
  return sub_1BCC00840();
}

unint64_t sub_1BCBF6348()
{
  unint64_t result;

  result = qword_1EF48DE38;
  if (!qword_1EF48DE38)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09C60, &type metadata for MiniProductPageLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DE38);
  }
  return result;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for MiniProductPageLayout.Metrics(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MiniProductPageLayout.Metrics(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 80) = v3;
  return result;
}

ValueMetadata *type metadata accessor for MiniProductPageLayout.Metrics()
{
  return &type metadata for MiniProductPageLayout.Metrics;
}

uint64_t sub_1BCBF6418()
{
  return MEMORY[0x1E0D41B98];
}

Swift::String __swiftcall NSBundle.localizedString(forKey:in:with:)(Swift::String forKey, Swift::String_optional in, Swift::String with)
{
  void *v3;
  void *object;
  uint64_t countAndFlagsBits;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  Swift::String result;
  _QWORD v20[2];

  object = with._object;
  countAndFlagsBits = with._countAndFlagsBits;
  v20[1] = in.value._object;
  v6 = forKey._object;
  v7 = forKey._countAndFlagsBits;
  v8 = sub_1BCC00DB0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC8D8);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BCC091B0;
  *(_QWORD *)(v12 + 32) = countAndFlagsBits;
  *(_QWORD *)(v12 + 40) = object;
  v13 = v3;
  swift_bridgeObjectRetain();
  sub_1BCC00DA4();
  v14 = sub_1BCC00D98();
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v16)
  {
    v7 = v14;
    v6 = v16;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  v17 = v7;
  v18 = v6;
  result._object = v18;
  result._countAndFlagsBits = v17;
  return result;
}

id sub_1BCBF6550(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;

  v19 = sub_1BCC00DB0();
  v6 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCC00DE0();
  if (a4)
    sub_1BCC00DE0();
  v9 = sub_1BCC00DE0();
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC8D8);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1BCC091B0;
  *(_QWORD *)(v12 + 32) = v9;
  *(_QWORD *)(v12 + 40) = v11;
  v13 = a1;
  swift_bridgeObjectRetain();
  sub_1BCC00DA4();
  sub_1BCC00D98();
  v15 = v14;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  if (!v15)
    swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v16 = (void *)sub_1BCC00DBC();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_1BCBF66E8()
{
  uint64_t v0;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 104));
  sub_1BCC006E4();
  return sub_1BCC00660();
}

uint64_t sub_1BCBF6770()
{
  uint64_t v0;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 104));
  return sub_1BCC00708();
}

uint64_t sub_1BCBF67D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BCBE81D0(v1, a1);
}

double sub_1BCBF67E0(_QWORD *a1, void *a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char *v10;
  id v11;
  char v12;
  uint64_t v14;

  v6 = sub_1BCC00F54();
  v7 = *(_QWORD *)(v6 - 8);
  *(_QWORD *)&v8 = MEMORY[0x1E0C80A78](v6).n128_u64[0];
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(a2, sel_traitCollection, v8);
  v12 = sub_1BCC00E70();

  if ((v12 & 1) != 0)
    __swift_project_boxed_opaque_existential_1(a1 + 5, a1[8]);
  else
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return a3;
}

_OWORD *initializeWithCopy for OfferButtonLockupLayout(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v4 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = a2[4];
  a1[4] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  return a1;
}

uint64_t *assignWithCopy for OfferButtonLockupLayout(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for OfferButtonLockupLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferButtonLockupLayout(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferButtonLockupLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for OfferButtonLockupLayout()
{
  return &type metadata for OfferButtonLockupLayout;
}

uint64_t destroy for OfferButtonLockupLayout.Metrics(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 40);
}

uint64_t initializeWithCopy for OfferButtonLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *assignWithCopy for OfferButtonLockupLayout.Metrics(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  return a1;
}

uint64_t assignWithTake for OfferButtonLockupLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferButtonLockupLayout.Metrics(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferButtonLockupLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for OfferButtonLockupLayout.Metrics()
{
  return &type metadata for OfferButtonLockupLayout.Metrics;
}

unint64_t sub_1BCBF6CF0()
{
  unint64_t result;

  result = qword_1EF48DE40;
  if (!qword_1EF48DE40)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09D00, &type metadata for OfferButtonLockupLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DE40);
  }
  return result;
}

ValueMetadata *type metadata accessor for OfferButtonPlaceholder.Metrics()
{
  return &type metadata for OfferButtonPlaceholder.Metrics;
}

ValueMetadata *type metadata accessor for OfferButtonPlaceholder()
{
  return &type metadata for OfferButtonPlaceholder;
}

double sub_1BCBF6D64(double a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD v5[4];

  if ((sub_1BCC00E70() & 1) != 0)
    v3 = v1 + 40;
  else
    v3 = v1;
  sub_1BCBDB05C(v3, (uint64_t)v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_1BCC007C8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return a1;
}

uint64_t sub_1BCBF6DFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BCBE86C4(v1, a1);
}

uint64_t initializeWithCopy for OfferDisclosureLayout(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for OfferDisclosureLayout(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
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

uint64_t assignWithTake for OfferDisclosureLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferDisclosureLayout(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferDisclosureLayout(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for OfferDisclosureLayout()
{
  return &type metadata for OfferDisclosureLayout;
}

uint64_t sub_1BCBF6F58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_1BCC00954();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCC0093C();
  sub_1BCC00948();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

double sub_1BCBF6FFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(char *, uint64_t);
  double v8;
  double v9;
  uint64_t v11;

  v0 = sub_1BCC00954();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v11 - v5;
  sub_1BCC0093C();
  sub_1BCC00948();
  v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v3, v0);
  sub_1BCC00D8C();
  v9 = v8;
  v7(v6, v0);
  return v9;
}

uint64_t sub_1BCBF7120()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(char *, uint64_t);
  uint64_t v9;

  v0 = sub_1BCC00954();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v9 - v5;
  sub_1BCC0093C();
  sub_1BCC00948();
  v7 = *(void (**)(char *, uint64_t))(v1 + 8);
  v7(v3, v0);
  sub_1BCC00D80();
  return ((uint64_t (*)(char *, uint64_t))v7)(v6, v0);
}

uint64_t sub_1BCBF7234()
{
  sub_1BCBF72D0();
  return sub_1BCC007E0();
}

unint64_t sub_1BCBF727C()
{
  unint64_t result;

  result = qword_1EF48DE48;
  if (!qword_1EF48DE48)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09E58, &type metadata for OfferDisclosureLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DE48);
  }
  return result;
}

uint64_t sub_1BCBF72C0()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1BCBF72D0()
{
  unint64_t result;

  result = qword_1EF48DE50;
  if (!qword_1EF48DE50)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC09E80, &type metadata for OfferDisclosureLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DE50);
  }
  return result;
}

uint64_t sub_1BCBF7314()
{
  return MEMORY[0x1E0D41D28];
}

uint64_t sub_1BCBF7320()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1BCBF7374(v0 + 56);
  sub_1BCBF7374(v0 + 96);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OfferEmptyLayout.Storage()
{
  return objc_opt_self();
}

uint64_t sub_1BCBF7374(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC8A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for OfferEmptyLayout()
{
  return &type metadata for OfferEmptyLayout;
}

uint64_t sub_1BCBF73C4(uint64_t a1, uint64_t a2)
{
  _QWORD v4[3];
  uint64_t v5;

  sub_1BCC00E94();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 40));
  sub_1BCC006E4();
  sub_1BCBF7534(a2 + 56, (uint64_t)v4);
  if (v5)
  {
    __swift_project_boxed_opaque_existential_1(v4, v5);
    sub_1BCC006E4();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    sub_1BCBF7374((uint64_t)v4);
  }
  sub_1BCBF7534(a2 + 96, (uint64_t)v4);
  if (v5)
  {
    __swift_project_boxed_opaque_existential_1(v4, v5);
    sub_1BCC006E4();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    sub_1BCBF7374((uint64_t)v4);
  }
  return sub_1BCC00684();
}

uint64_t sub_1BCBF7518(uint64_t a1)
{
  uint64_t *v1;

  return sub_1BCBF73C4(a1, *v1);
}

double sub_1BCBF7520()
{
  return *MEMORY[0x1E0D426E0];
}

uint64_t sub_1BCBF7534(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC8A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BCBF757C()
{
  uint64_t v0;

  sub_1BCBE8F54(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  sub_1BCBF7374(v0 + 112);
  sub_1BCBF7374(v0 + 152);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OfferIconLayout.Storage()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for OfferIconLayout()
{
  return &type metadata for OfferIconLayout;
}

uint64_t destroy for OfferIconLayout.Metrics(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
}

_OWORD *initializeWithCopy for OfferIconLayout.Metrics(_OWORD *a1, _OWORD *a2)
{
  __int128 v3;

  *a1 = *a2;
  v3 = *(_OWORD *)((char *)a2 + 40);
  *(_OWORD *)((char *)a1 + 40) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))((uint64_t)(a1 + 1), (uint64_t)(a2 + 1));
  return a1;
}

_QWORD *assignWithCopy for OfferIconLayout.Metrics(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for OfferIconLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferIconLayout.Metrics(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferIconLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for OfferIconLayout.Metrics()
{
  return &type metadata for OfferIconLayout.Metrics;
}

uint64_t sub_1BCBF7774(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  __int128 v9;
  _QWORD v10[4];

  v3 = sub_1BCC00F54();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BCBE9DBC((_OWORD *)(a2 + 16), &v9);
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 72), *(_QWORD *)(a2 + 96));
  return sub_1BCC00708();
}

uint64_t sub_1BCBF78CC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v12 = sub_1BCC00F54();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 96));
  sub_1BCC00708();
  v17 = v16;
  v28.origin.x = a3;
  v28.origin.y = a4;
  v28.size.width = a5;
  v28.size.height = a6;
  if (v17 < CGRectGetHeight(v28) && *(_BYTE *)(a1 + 192) == 1)
  {
    v29.origin.x = a3;
    v29.origin.y = a4;
    v29.size.width = a5;
    v29.size.height = a6;
    CGRectGetMinY(v29);
    sub_1BCBE9DBC((_OWORD *)(a1 + 16), &v24);
    __swift_project_boxed_opaque_existential_1(&v25, v27);
    v23 = a2;
    sub_1BCBE8C78();
    sub_1BCC007BC();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
  }
  else
  {
    v30.origin.x = a3;
    v30.origin.y = a4;
    v30.size.width = a5;
    v30.size.height = a6;
    CGRectGetMidY(v30);
  }
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  if (*(_BYTE *)(a1 + 193) == 1)
    CGRectGetMaxX(*(CGRect *)&v18);
  else
    CGRectGetMidX(*(CGRect *)&v18);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 96));
  sub_1BCC00E94();
  sub_1BCC006E4();
  sub_1BCC00E94();
  sub_1BCBF7534(a1 + 112, (uint64_t)&v24);
  if (v26)
  {
    __swift_project_boxed_opaque_existential_1(&v24, v26);
    sub_1BCC006E4();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
  }
  else
  {
    sub_1BCBF7374((uint64_t)&v24);
  }
  sub_1BCBF7534(a1 + 152, (uint64_t)&v24);
  if (v26)
  {
    __swift_project_boxed_opaque_existential_1(&v24, v26);
    sub_1BCC006E4();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
  }
  else
  {
    sub_1BCBF7374((uint64_t)&v24);
  }
  return sub_1BCC00660();
}

uint64_t sub_1BCBF7C1C@<X0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  uint64_t *v5;

  return sub_1BCBF78CC(*v5, a1, a2, a3, a4, a5);
}

uint64_t sub_1BCBF7C24(uint64_t a1)
{
  uint64_t *v1;

  return sub_1BCBF7774(a1, *v1);
}

_OWORD *sub_1BCBF7C40@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1BCBE9DBC((_OWORD *)(*(_QWORD *)v1 + 16), a1);
}

BOOL sub_1BCBF7C50(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1BCBF7C68()
{
  sub_1BCC00F78();
  sub_1BCC00F84();
  return sub_1BCC00F90();
}

uint64_t sub_1BCBF7CAC()
{
  return sub_1BCC00F84();
}

uint64_t sub_1BCBF7CD4()
{
  sub_1BCC00F78();
  sub_1BCC00F84();
  return sub_1BCC00F90();
}

uint64_t sub_1BCBF7D14()
{
  uint64_t v0;

  sub_1BCBE85EC(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 256);
  __swift_destroy_boxed_opaque_existential_1(v0 + 296);
  sub_1BCBF90D0(v0 + 336);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OfferTextLayout.Storage()
{
  return objc_opt_self();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for OfferTextLayout.BackgroundContentMode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for OfferTextLayout.BackgroundContentMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1BCBF7E58 + 4 * byte_1BCC0A075[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1BCBF7E8C + 4 * byte_1BCC0A070[v4]))();
}

uint64_t sub_1BCBF7E8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCBF7E94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1BCBF7E9CLL);
  return result;
}

uint64_t sub_1BCBF7EA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1BCBF7EB0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1BCBF7EB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCBF7EBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1BCBF7EC8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1BCBF7ED0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for OfferTextLayout.BackgroundContentMode()
{
  return &type metadata for OfferTextLayout.BackgroundContentMode;
}

ValueMetadata *type metadata accessor for OfferTextLayout()
{
  return &type metadata for OfferTextLayout;
}

uint64_t destroy for OfferTextLayout.Metrics(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 200);
}

_OWORD *initializeWithCopy for OfferTextLayout.Metrics(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  a1[4] = a2[4];
  v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  v7 = a2[9];
  a1[9] = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)a1 + 120, (uint64_t)a2 + 120);
  v8 = *(_OWORD *)((char *)a2 + 184);
  *(_OWORD *)((char *)a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))((uint64_t)(a1 + 10), (uint64_t)(a2 + 10));
  v9 = a2[14];
  a1[14] = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))((uint64_t)a1 + 200, (uint64_t)a2 + 200);
  return a1;
}

uint64_t *assignWithCopy for OfferTextLayout.Metrics(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  a1[8] = a2[8];
  a1[9] = a2[9];
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  __swift_assign_boxed_opaque_existential_1(a1 + 15, a2 + 15);
  __swift_assign_boxed_opaque_existential_1(a1 + 20, a2 + 20);
  __swift_assign_boxed_opaque_existential_1(a1 + 25, a2 + 25);
  return a1;
}

__n128 __swift_memcpy240_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __n128 result;
  __int128 v11;
  __int128 v12;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  v7 = a2[7];
  v8 = a2[8];
  v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  result = (__n128)a2[11];
  v11 = a2[12];
  v12 = a2[14];
  *(_OWORD *)(a1 + 208) = a2[13];
  *(_OWORD *)(a1 + 224) = v12;
  *(__n128 *)(a1 + 176) = result;
  *(_OWORD *)(a1 + 192) = v11;
  return result;
}

uint64_t assignWithTake for OfferTextLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  __swift_destroy_boxed_opaque_existential_1(a1 + 120);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  __swift_destroy_boxed_opaque_existential_1(a1 + 160);
  v7 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v7;
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  __swift_destroy_boxed_opaque_existential_1(a1 + 200);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferTextLayout.Metrics(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 240))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 104);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferTextLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 232) = 0;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 240) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 104) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 240) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for OfferTextLayout.Metrics()
{
  return &type metadata for OfferTextLayout.Metrics;
}

void *sub_1BCBF8258(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  void *result;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  __int128 v14;
  uint64_t v15;
  _QWORD v16[3];
  uint64_t v17;

  v3 = sub_1BCC00F54();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 216), *(_QWORD *)(a2 + 240));
  sub_1BCBE8C78();
  sub_1BCC007BC();
  v13[1] = v7;
  v8 = *(void (**)(char *, uint64_t))(v4 + 8);
  v8(v6, v3);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 296), *(_QWORD *)(a2 + 320));
  sub_1BCC00708();
  sub_1BCBF36B8(a2 + 336, (uint64_t)&v14);
  if (!v15)
    return (void *)sub_1BCBF90D0((uint64_t)&v14);
  sub_1BCBDB3C8(&v14, (uint64_t)v16);
  __swift_project_boxed_opaque_existential_1(v16, v17);
  if ((sub_1BCC006C0() & 1) == 0)
    return (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  if (*(_BYTE *)(a2 + 376) == 1)
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 176), *(_QWORD *)(a2 + 200));
    sub_1BCBE8C78();
    sub_1BCC007BC();
    v8(v6, v3);
    __swift_project_boxed_opaque_existential_1(v16, v17);
    sub_1BCC00708();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 96), *(_QWORD *)(a2 + 120));
    sub_1BCC007D4();
    return (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  __swift_project_boxed_opaque_existential_1(v16, v17);
  if (sub_1BCC008D0() != 1)
  {
    __swift_project_boxed_opaque_existential_1(v16, v17);
    sub_1BCC00708();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 96), *(_QWORD *)(a2 + 120));
    sub_1BCC007D4();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + 136), *(_QWORD *)(a2 + 160));
    sub_1BCC00798();
    return (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  sub_1BCBDB05C(a2 + 96, (uint64_t)&v14);
  __swift_project_boxed_opaque_existential_1(&v14, v15);
  __swift_project_boxed_opaque_existential_1(v16, v17);
  result = (void *)sub_1BCC008E8();
  if (!result)
  {
    __break(1u);
    goto LABEL_14;
  }
  v10 = result;
  sub_1BCC007A4();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  sub_1BCBDB05C(a2 + 136, (uint64_t)&v14);
  __swift_project_boxed_opaque_existential_1(&v14, v15);
  __swift_project_boxed_opaque_existential_1(v16, v17);
  result = (void *)sub_1BCC008E8();
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v11 = result;
  sub_1BCC007B0();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  __swift_project_boxed_opaque_existential_1(v16, v17);
  result = (void *)sub_1BCC008E8();
  if (result)
  {
    v12 = result;
    objc_msgSend(result, sel_lineHeight);

    return (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
LABEL_15:
  __break(1u);
  return result;
}

void sub_1BCBF8714(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRect v12;

  sub_1BCC00EB8();
  v12.origin.x = a5;
  v12.origin.y = a6;
  v12.size.width = a7;
  v12.size.height = a8;
  CGRectGetWidth(v12);
}

double sub_1BCBF87D0(uint64_t a1, double a2, double a3, double a4, double a5, double a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11, CGFloat a12, CGFloat a13, CGFloat a14)
{
  double v23;
  double v24;
  CGFloat v29;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v23 = a11;
  v24 = fabs(a3);
  if (fabs(a2) >= COERCE_DOUBLE(1) && v24 >= COERCE_DOUBLE(1))
  {
    v29 = a7;
    if (*(_BYTE *)(a1 + 376) == 1)
    {
      v23 = CGRectGetMaxX(*(CGRect *)&v29) + a6;
      v34.origin.x = a7;
      v34.origin.y = a8;
      v34.size.width = a9;
      v34.size.height = a10;
      floor(CGRectGetMidY(v34) + a3 * -0.5);
    }
    else
    {
      if (CGRectGetWidth(*(CGRect *)&v29) >= a2)
      {
        v36.origin.x = a7;
        v36.origin.y = a8;
        v36.size.width = a9;
        v36.size.height = a10;
        v23 = floor(CGRectGetMidX(v36) + a2 * -0.5);
      }
      else
      {
        v35.size.width = a13;
        v35.size.height = a14;
        v35.origin.x = a11;
        v35.origin.y = a12;
        v23 = CGRectGetMaxX(v35) - a2;
      }
      v37.origin.x = a7;
      v37.origin.y = a8;
      v37.size.width = a9;
      v37.size.height = a10;
      CGRectGetMaxY(v37);
    }
  }
  return v23;
}

uint64_t sub_1BCBF8918@<X0>(void *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
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
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  char v42;
  CGFloat v43;
  BOOL v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat MidX;
  double v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  _QWORD v67[3];
  CGFloat v68;
  CGFloat v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  _QWORD *v76;
  _QWORD *v77;
  id v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  __int128 v84;
  uint64_t v85;
  _QWORD v86[3];
  uint64_t v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v67[1] = a3;
  v13 = (char *)(a2 + 47);
  v14 = sub_1BCC00F54();
  v15 = *(_QWORD *)(v14 - 8);
  *(_QWORD *)&v16 = MEMORY[0x1E0C80A78](v14).n128_u64[0];
  v18 = (char *)v67 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = objc_msgSend(a1, sel_traitCollection, v16);
  v78 = objc_msgSend(v19, sel_layoutDirection);

  sub_1BCC00EAC();
  v20 = a2[40];
  v76 = a2 + 37;
  __swift_project_boxed_opaque_existential_1(a2 + 37, v20);
  sub_1BCC00708();
  v22 = v21;
  v24 = v23;
  v25 = a5;
  v83 = a7;
  sub_1BCBF8714(v21, v23, v26, v27, a4, a5, a6, a7);
  v29 = v28;
  v82 = v30;
  sub_1BCBF36B8((uint64_t)(a2 + 42), (uint64_t)&v84);
  v80 = v29;
  v77 = a2 + 42;
  v75 = v22;
  v74 = v24;
  if (v85)
  {
    sub_1BCBDB3C8(&v84, (uint64_t)v86);
    __swift_project_boxed_opaque_existential_1(v86, v87);
    if ((sub_1BCC006C0() & 1) != 0)
    {
      if (*v13 == 1)
      {
        __swift_project_boxed_opaque_existential_1(a2 + 22, a2[25]);
        sub_1BCBE8C78();
        sub_1BCC007BC();
        (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
        v88.origin.x = a4;
        v88.origin.y = a5;
        v88.size.width = a6;
        v88.size.height = v83;
        CGRectGetHeight(v88);
      }
      __swift_project_boxed_opaque_existential_1(v86, v87);
      sub_1BCC00708();
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      __swift_project_boxed_opaque_existential_1(a2 + 12, a2[15]);
      sub_1BCC007D4();
      v79 = v39;
      __swift_project_boxed_opaque_existential_1(a2 + 17, a2[20]);
      v73 = v32;
      v71 = v36;
      v70 = v38;
      sub_1BCC00798();
      v41 = v40;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
      v29 = v80;
      v42 = *v13;
      if ((*v13 & 1) == 0)
        goto LABEL_10;
LABEL_14:
      v44 = 0;
      goto LABEL_15;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  }
  else
  {
    sub_1BCBF90D0((uint64_t)&v84);
  }
  v34 = *(double *)(MEMORY[0x1E0D426E0] + 8);
  v73 = *(double *)MEMORY[0x1E0D426E0];
  v71 = *(double *)(MEMORY[0x1E0D426E0] + 16);
  v70 = *(double *)(MEMORY[0x1E0D426E0] + 24);
  v41 = 0.0;
  v79 = 0.0;
  v42 = *v13;
  if ((*v13 & 1) != 0)
    goto LABEL_14;
LABEL_10:
  if ((v13[1] & 1) != 0)
    goto LABEL_14;
  v89.size.height = v83;
  v43 = v41 + v82 + v79 + v34;
  v89.origin.x = a4;
  v89.origin.y = v25;
  v89.size.width = a6;
  if (v43 < CGRectGetHeight(v89))
  {
    v44 = 1;
    goto LABEL_15;
  }
  if ((*(_QWORD *)&v34 & 0x7FF0000000000000) != 0)
    goto LABEL_14;
  v44 = (*(_QWORD *)&v34 & 0xFFFFFFFFFFFFFLL) == 0;
LABEL_15:
  v72 = v34;
  __swift_project_boxed_opaque_existential_1(a2 + 27, a2[30]);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  v46 = v45;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  v47 = a4;
  v48 = v25;
  if ((v42 & 1) == 0)
  {
    v49 = a4;
    v50 = v25;
    v51 = a6;
    v52 = v83;
    if (v44)
      v48 = floor(CGRectGetMidY(*(CGRect *)&v49) + v82 * -0.5);
    else
      v48 = v46 + CGRectGetMinY(*(CGRect *)&v49);
    v90.origin.x = a4;
    v90.origin.y = v25;
    v90.size.width = a6;
    v90.size.height = v83;
    v47 = floor(CGRectGetMidX(v90) + v29 * -0.5);
  }
  v81 = v47;
  __swift_project_boxed_opaque_existential_1(a2 + 32, a2[35]);
  v69 = a4;
  v53 = v82;
  sub_1BCC00EA0();
  sub_1BCC006E4();
  v91.origin.x = v47;
  v91.origin.y = v48;
  v91.size.width = v29;
  v91.size.height = v53;
  MidX = CGRectGetMidX(v91);
  v68 = v25;
  v92.size.width = v29;
  v55 = v48;
  v67[2] = floor(MidX - v75 * 0.5);
  v92.origin.x = v81;
  v92.origin.y = v48;
  v92.size.height = v53;
  CGRectGetMidY(v92);
  __swift_project_boxed_opaque_existential_1(v76, a2[40]);
  v56 = v69;
  v57 = v83;
  sub_1BCC00EA0();
  sub_1BCC006E4();
  v58 = v79;
  v79 = v55;
  v59 = sub_1BCBF87D0((uint64_t)a2, v73, v72, v71, v70, v58, v81, v55, v80, v82, v56, v68, a6, v57);
  v61 = v60;
  v63 = v62;
  v65 = v64;
  sub_1BCBF36B8((uint64_t)v77, (uint64_t)v86);
  if (v87)
  {
    __swift_project_boxed_opaque_existential_1(v86, v87);
    sub_1BCC00EA0();
    sub_1BCC006E4();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v86);
  }
  else
  {
    sub_1BCBF90D0((uint64_t)v86);
  }
  v93.origin.y = v79;
  v94.size.width = v63;
  v93.origin.x = v81;
  v93.size.height = v82;
  v93.size.width = v80;
  v94.origin.x = v59;
  v94.origin.y = v61;
  v94.size.height = v65;
  CGRectUnion(v93, v94);
  return sub_1BCC00660();
}

uint64_t sub_1BCBF9028@<X0>(void *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>)
{
  _QWORD **v6;

  return sub_1BCBF8918(a1, *v6, a2, a3, a4, a5, a6);
}

void *sub_1BCBF9030(uint64_t a1)
{
  uint64_t *v1;

  return sub_1BCBF8258(a1, *v1);
}

void *sub_1BCBF904C()
{
  uint64_t *v0;

  return sub_1BCBF9110(*v0);
}

_OWORD *sub_1BCBF9054@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1BCBE9F70((_OWORD *)(*(_QWORD *)v1 + 16), a1);
}

unint64_t sub_1BCBF9064(uint64_t a1)
{
  unint64_t result;

  result = sub_1BCBE9EC4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1BCBF908C()
{
  unint64_t result;

  result = qword_1EF48DE58;
  if (!qword_1EF48DE58)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC0A188, &type metadata for OfferTextLayout.BackgroundContentMode);
    atomic_store(result, (unint64_t *)&qword_1EF48DE58);
  }
  return result;
}

uint64_t sub_1BCBF90D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC8B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_1BCBF9110(uint64_t a1)
{
  void *result;
  void *v2;
  _QWORD v3[4];

  sub_1BCBDB05C(a1 + 296, (uint64_t)v3);
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  result = (void *)sub_1BCC008E8();
  if (result)
  {
    v2 = result;
    objc_msgSend(result, sel_lineHeight);

    return (void *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

ValueMetadata *type metadata accessor for PlaceableLayoutProxy()
{
  return &type metadata for PlaceableLayoutProxy;
}

uint64_t sub_1BCBF91E0(void *a1)
{
  _QWORD *v1;
  id v3;

  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  v3 = objc_msgSend(a1, sel_traitCollection);
  sub_1BCC00D80();

  return sub_1BCC00660();
}

double sub_1BCBF9294(void *a1)
{
  _QWORD *v1;
  id v3;
  double v4;
  double v5;

  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  v3 = objc_msgSend(a1, sel_traitCollection);
  sub_1BCC00D8C();
  v5 = v4;

  return v5;
}

_OWORD *sub_1BCBF9338(_OWORD *a1, uint64_t *a2, uint64_t a3)
{
  _OWORD *v4;
  int v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v28 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (_OWORD *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_OWORD *)a2;
    v7 = *(_OWORD *)(a2 + 5);
    *(_OWORD *)((char *)a1 + 40) = v7;
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)(a1 + 1), (uint64_t)(a2 + 2));
    v8 = *((_OWORD *)a2 + 5);
    v4[5] = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))((uint64_t)v4 + 56, (uint64_t)(a2 + 7));
    v9 = *(_OWORD *)(a2 + 15);
    *(_OWORD *)((char *)v4 + 120) = v9;
    (**(void (***)(uint64_t, uint64_t))(v9 - 8))((uint64_t)(v4 + 6), (uint64_t)(a2 + 12));
    v10 = *((_OWORD *)a2 + 10);
    v4[10] = v10;
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))((uint64_t)v4 + 136, (uint64_t)(a2 + 17));
    v11 = *(_OWORD *)(a2 + 25);
    *(_OWORD *)((char *)v4 + 200) = v11;
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))((uint64_t)(v4 + 11), (uint64_t)(a2 + 22));
    v12 = *((_OWORD *)a2 + 15);
    v4[15] = v12;
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))((uint64_t)v4 + 216, (uint64_t)(a2 + 27));
    v13 = a2[35];
    v14 = a2[36];
    *((_QWORD *)v4 + 35) = v13;
    *((_QWORD *)v4 + 36) = v14;
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))((uint64_t)(v4 + 16), (uint64_t)(a2 + 32));
    v15 = *((_OWORD *)a2 + 20);
    v4[20] = v15;
    (**(void (***)(uint64_t, uint64_t))(v15 - 8))((uint64_t)v4 + 296, (uint64_t)(a2 + 37));
    v16 = a2[45];
    v17 = a2[46];
    *((_QWORD *)v4 + 45) = v16;
    *((_QWORD *)v4 + 46) = v17;
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))((uint64_t)(v4 + 21), (uint64_t)(a2 + 42));
    v18 = *((_OWORD *)a2 + 25);
    v4[25] = v18;
    (**(void (***)(uint64_t, uint64_t))(v18 - 8))((uint64_t)v4 + 376, (uint64_t)(a2 + 47));
    v19 = a2[55];
    v20 = a2[56];
    *((_QWORD *)v4 + 55) = v19;
    *((_QWORD *)v4 + 56) = v20;
    (**(void (***)(uint64_t, uint64_t))(v19 - 8))((uint64_t)(v4 + 26), (uint64_t)(a2 + 52));
    v21 = *((_OWORD *)a2 + 30);
    v4[30] = v21;
    (**(void (***)(uint64_t, uint64_t))(v21 - 8))((uint64_t)v4 + 456, (uint64_t)(a2 + 57));
    v22 = a2[65];
    *((_QWORD *)v4 + 65) = v22;
    *((_QWORD *)v4 + 66) = a2[66];
    (**(void (***)(uint64_t, uint64_t))(v22 - 8))((uint64_t)(v4 + 31), (uint64_t)(a2 + 62));
    v23 = *((_OWORD *)a2 + 35);
    v4[35] = v23;
    (**(void (***)(uint64_t, uint64_t))(v23 - 8))((uint64_t)v4 + 536, (uint64_t)(a2 + 67));
    v24 = *(int *)(a3 + 76);
    v25 = (char *)v4 + v24;
    v26 = (uint64_t)a2 + v24;
    v27 = sub_1BCC00C00();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
  }
  return v4;
}

uint64_t sub_1BCBF9580(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  __swift_destroy_boxed_opaque_existential_1(a1 + 456);
  __swift_destroy_boxed_opaque_existential_1(a1 + 496);
  __swift_destroy_boxed_opaque_existential_1(a1 + 536);
  v4 = a1 + *(int *)(a2 + 76);
  v5 = sub_1BCC00C00();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_1BCBF9630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, a2 + 16);
  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 56, a2 + 56);
  v8 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 96, a2 + 96);
  v9 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 136, a2 + 136);
  v10 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 200) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 176, a2 + 176);
  v11 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 240) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 216, a2 + 216);
  v12 = *(_QWORD *)(a2 + 280);
  v13 = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 280) = v12;
  *(_QWORD *)(a1 + 288) = v13;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 256, a2 + 256);
  v14 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 320) = v14;
  (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1 + 296, a2 + 296);
  v15 = *(_QWORD *)(a2 + 360);
  v16 = *(_QWORD *)(a2 + 368);
  *(_QWORD *)(a1 + 360) = v15;
  *(_QWORD *)(a1 + 368) = v16;
  (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 336, a2 + 336);
  v17 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 400) = v17;
  (**(void (***)(uint64_t, uint64_t))(v17 - 8))(a1 + 376, a2 + 376);
  v18 = *(_QWORD *)(a2 + 440);
  v19 = *(_QWORD *)(a2 + 448);
  *(_QWORD *)(a1 + 440) = v18;
  *(_QWORD *)(a1 + 448) = v19;
  (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 416, a2 + 416);
  v20 = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 480) = v20;
  (**(void (***)(uint64_t, uint64_t))(v20 - 8))(a1 + 456, a2 + 456);
  v21 = *(_QWORD *)(a2 + 520);
  *(_QWORD *)(a1 + 520) = v21;
  *(_QWORD *)(a1 + 528) = *(_QWORD *)(a2 + 528);
  (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 496, a2 + 496);
  v22 = *(_OWORD *)(a2 + 560);
  *(_OWORD *)(a1 + 560) = v22;
  (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 536, a2 + 536);
  v23 = *(int *)(a3 + 76);
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = sub_1BCC00C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
  return a1;
}

uint64_t *sub_1BCBF9844(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  __swift_assign_boxed_opaque_existential_1(a1 + 17, a2 + 17);
  __swift_assign_boxed_opaque_existential_1(a1 + 22, a2 + 22);
  __swift_assign_boxed_opaque_existential_1(a1 + 27, a2 + 27);
  __swift_assign_boxed_opaque_existential_1(a1 + 32, a2 + 32);
  __swift_assign_boxed_opaque_existential_1(a1 + 37, a2 + 37);
  __swift_assign_boxed_opaque_existential_1(a1 + 42, a2 + 42);
  __swift_assign_boxed_opaque_existential_1(a1 + 47, a2 + 47);
  __swift_assign_boxed_opaque_existential_1(a1 + 52, a2 + 52);
  __swift_assign_boxed_opaque_existential_1(a1 + 57, a2 + 57);
  __swift_assign_boxed_opaque_existential_1(a1 + 62, a2 + 62);
  __swift_assign_boxed_opaque_existential_1(a1 + 67, a2 + 67);
  v6 = *(int *)(a3 + 76);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1BCC00C00();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_1BCBF9958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  v6 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v6;
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  v7 = *(_OWORD *)(a2 + 256);
  v8 = *(_OWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 256) = v7;
  *(_OWORD *)(a1 + 272) = v8;
  v9 = *(_OWORD *)(a2 + 296);
  v10 = *(_OWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_OWORD *)(a1 + 296) = v9;
  *(_OWORD *)(a1 + 312) = v10;
  v11 = *(_OWORD *)(a2 + 336);
  v12 = *(_OWORD *)(a2 + 352);
  *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 336) = v11;
  *(_OWORD *)(a1 + 352) = v12;
  v13 = *(_OWORD *)(a2 + 376);
  v14 = *(_OWORD *)(a2 + 392);
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
  *(_OWORD *)(a1 + 376) = v13;
  *(_OWORD *)(a1 + 392) = v14;
  v15 = *(_OWORD *)(a2 + 416);
  v16 = *(_OWORD *)(a2 + 432);
  *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
  *(_OWORD *)(a1 + 416) = v15;
  *(_OWORD *)(a1 + 432) = v16;
  v17 = *(_OWORD *)(a2 + 456);
  v18 = *(_OWORD *)(a2 + 472);
  *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
  *(_OWORD *)(a1 + 456) = v17;
  *(_OWORD *)(a1 + 472) = v18;
  v19 = *(_OWORD *)(a2 + 496);
  v20 = *(_OWORD *)(a2 + 512);
  *(_QWORD *)(a1 + 528) = *(_QWORD *)(a2 + 528);
  *(_OWORD *)(a1 + 496) = v19;
  *(_OWORD *)(a1 + 512) = v20;
  v21 = *(_OWORD *)(a2 + 536);
  v22 = *(_OWORD *)(a2 + 552);
  *(_QWORD *)(a1 + 568) = *(_QWORD *)(a2 + 568);
  v23 = *(int *)(a3 + 76);
  v24 = a1 + v23;
  v25 = a2 + v23;
  *(_OWORD *)(a1 + 536) = v21;
  *(_OWORD *)(a1 + 552) = v22;
  v26 = sub_1BCC00C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 32))(v24, v25, v26);
  return a1;
}

uint64_t sub_1BCBF9ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  v8 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v8;
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  v9 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v9;
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  v10 = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 296) = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 312) = v10;
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  v11 = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 352) = v11;
  *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  v12 = *(_OWORD *)(a2 + 392);
  *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
  *(_OWORD *)(a1 + 392) = v12;
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  v13 = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 432) = v13;
  *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
  __swift_destroy_boxed_opaque_existential_1(a1 + 456);
  v14 = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
  *(_OWORD *)(a1 + 472) = v14;
  *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
  __swift_destroy_boxed_opaque_existential_1(a1 + 496);
  v15 = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 496) = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 512) = v15;
  *(_QWORD *)(a1 + 528) = *(_QWORD *)(a2 + 528);
  __swift_destroy_boxed_opaque_existential_1(a1 + 536);
  v16 = *(_OWORD *)(a2 + 552);
  *(_OWORD *)(a1 + 536) = *(_OWORD *)(a2 + 536);
  *(_OWORD *)(a1 + 552) = v16;
  *(_QWORD *)(a1 + 568) = *(_QWORD *)(a2 + 568);
  v17 = *(int *)(a3 + 76);
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_1BCC00C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  return a1;
}

uint64_t sub_1BCBF9CBC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCBF9CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1BCC00C00();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 76), a2, v8);
  }
}

uint64_t sub_1BCBF9D44()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCBF9D50(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 40) = (a2 - 1);
  }
  else
  {
    v7 = sub_1BCC00C00();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 76), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for SmallLockupLayout.Metrics(uint64_t a1)
{
  return sub_1BCBEF64C(a1, (uint64_t *)&unk_1ED1BC9E8);
}

uint64_t sub_1BCBF9DD8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BCC00C00();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

double sub_1BCBF9E70(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char v21;
  char v22;
  int v23;
  char v24;
  char v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  id v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  id v49;
  _QWORD v50[5];
  uint64_t v51[3];
  uint64_t v52;
  uint64_t v53;

  v2 = v1;
  v49 = a1;
  v45 = sub_1BCC009B4();
  v44 = *(_QWORD *)(v45 - 8);
  MEMORY[0x1E0C80A78](v45);
  v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1BCC009D8();
  v46 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (int *)type metadata accessor for SmallLockupLayout(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v43 - v12;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v43 - v15;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v43 - v18;
  sub_1BCBDAE7C(v2 + *(int *)(v20 + 24), (uint64_t)v51, &qword_1ED1BC8B0);
  v47 = v5;
  if (!v52)
  {
    sub_1BCBDC2D4((uint64_t)v51, &qword_1ED1BC8B0);
    sub_1BCBE31E0(v2, (uint64_t)v19, type metadata accessor for SmallLockupLayout);
    goto LABEL_6;
  }
  __swift_project_boxed_opaque_existential_1(v51, v52);
  v21 = sub_1BCC006F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  sub_1BCBE31E0(v2, (uint64_t)v19, type metadata accessor for SmallLockupLayout);
  if ((v21 & 1) != 0)
  {
LABEL_6:
    sub_1BCBE8194((uint64_t)v19);
    goto LABEL_7;
  }
  sub_1BCBDAE7C((uint64_t)&v19[v8[6]], (uint64_t)v51, &qword_1ED1BC8B0);
  if (v52)
  {
    __swift_project_boxed_opaque_existential_1(v51, v52);
    v48 = sub_1BCC006C0();
    sub_1BCBE8194((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    goto LABEL_8;
  }
  sub_1BCBE8194((uint64_t)v19);
  sub_1BCBDC2D4((uint64_t)v51, &qword_1ED1BC8B0);
LABEL_7:
  v48 = 0;
LABEL_8:
  sub_1BCBDAE7C(v2 + v8[9], (uint64_t)v51, &qword_1ED1BC8B0);
  if (v52)
  {
    __swift_project_boxed_opaque_existential_1(v51, v52);
    v22 = sub_1BCC006F0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1BCBE31E0(v2, (uint64_t)v16, type metadata accessor for SmallLockupLayout);
    if ((v22 & 1) == 0)
    {
      sub_1BCBDAE7C((uint64_t)&v16[v8[9]], (uint64_t)v51, &qword_1ED1BC8B0);
      v23 = v52;
      if (v52)
      {
        __swift_project_boxed_opaque_existential_1(v51, v52);
        v23 = sub_1BCC006C0();
        sub_1BCBE8194((uint64_t)v16);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      }
      else
      {
        sub_1BCBE8194((uint64_t)v16);
        sub_1BCBDC2D4((uint64_t)v51, &qword_1ED1BC8B0);
      }
      goto LABEL_14;
    }
  }
  else
  {
    sub_1BCBDC2D4((uint64_t)v51, &qword_1ED1BC8B0);
    sub_1BCBE31E0(v2, (uint64_t)v16, type metadata accessor for SmallLockupLayout);
  }
  sub_1BCBE8194((uint64_t)v16);
  v23 = 0;
LABEL_14:
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + v8[8]), *(_QWORD *)(v2 + v8[8] + 24));
  v24 = sub_1BCC006F0();
  sub_1BCBE31E0(v2, (uint64_t)v13, type metadata accessor for SmallLockupLayout);
  if ((v24 & 1) != 0)
  {
    v25 = 0;
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(&v13[v8[8]], *(_QWORD *)&v13[v8[8] + 24]);
    v25 = sub_1BCC006C0();
  }
  sub_1BCBE8194((uint64_t)v13);
  sub_1BCBDAE7C(v2 + v8[10], (uint64_t)v51, &qword_1ED1BC8A8);
  v26 = v52;
  sub_1BCBDC2D4((uint64_t)v51, &qword_1ED1BC8A8);
  sub_1BCBE31E0(v2, (uint64_t)v10, type metadata accessor for SmallLockupLayout);
  if (v26)
  {
    sub_1BCBDAE7C((uint64_t)&v10[v8[10]], (uint64_t)v51, &qword_1ED1BC8A8);
    if (v52)
    {
      __swift_project_boxed_opaque_existential_1(v51, v52);
      v27 = sub_1BCC006F0();
      sub_1BCBE8194((uint64_t)v10);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
      v28 = v27 ^ 1;
      goto LABEL_23;
    }
    sub_1BCBE8194((uint64_t)v10);
    sub_1BCBDC2D4((uint64_t)v51, &qword_1ED1BC8A8);
  }
  else
  {
    sub_1BCBE8194((uint64_t)v10);
  }
  v28 = 0;
LABEL_23:
  (*(void (**)(char *, _QWORD, uint64_t))(v44 + 104))(v4, *MEMORY[0x1E0D41D80], v45);
  sub_1BCC009C0();
  v29 = MEMORY[0x1E0D42218];
  if ((v48 & 1) != 0)
  {
    sub_1BCBDB05C(v2 + 56, (uint64_t)v50);
    v30 = sub_1BCC00C30();
    v52 = v30;
    v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1BCBDB05C(v2 + 216, (uint64_t)v50);
    v52 = v30;
    v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1BCC00C3C();
  }
  else
  {
    if ((v23 & 1) != 0)
      v31 = v2 + 176;
    else
      v31 = v2 + 96;
    sub_1BCBDB05C(v31, (uint64_t)v50);
    v52 = sub_1BCC00C30();
    v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1BCC00C3C();
  }
  sub_1BCC009CC();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  if ((v25 & 1) != 0
    || (v32 = objc_msgSend(v49, sel_traitCollection),
        v33 = sub_1BCC00E70(),
        v32,
        (v33 & 1) != 0))
  {
    sub_1BCBDB05C(v2 + 296, (uint64_t)v50);
    v52 = sub_1BCC00C30();
    v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    if ((v28 & 1) == 0)
    {
LABEL_32:
      v34 = v49;
      if ((v23 & 1) == 0)
        goto LABEL_34;
      goto LABEL_33;
    }
  }
  else if ((v28 & 1) == 0)
  {
    goto LABEL_32;
  }
  sub_1BCBDB05C(v2 + 376, (uint64_t)v50);
  v52 = sub_1BCC00C30();
  v53 = v29;
  __swift_allocate_boxed_opaque_existential_1(v51);
  sub_1BCC00C3C();
  sub_1BCC009CC();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  v34 = v49;
  if ((v23 & 1) != 0)
  {
LABEL_33:
    sub_1BCBDB05C(v2 + 336, (uint64_t)v50);
    v52 = sub_1BCC00C30();
    v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  }
LABEL_34:
  v35 = objc_msgSend(v34, sel_traitCollection);
  v36 = sub_1BCC00E70();

  if ((v36 & 1) != 0)
  {
    v37 = *(_QWORD *)(v2 + 8);
    v50[3] = MEMORY[0x1E0DEF040];
    v50[4] = MEMORY[0x1E0D418A8];
    v50[0] = v37;
    v38 = sub_1BCC00C30();
    v52 = v38;
    v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1BCC00C3C();
    sub_1BCC0099C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1BCBDB05C(v2 + 16, (uint64_t)v50);
    v52 = v38;
    v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1BCC00C3C();
    sub_1BCC0099C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1BCBDB05C(v2 + 456, (uint64_t)v50);
    v52 = v38;
    v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1BCBDB05C(v2 + 496, (uint64_t)v50);
    v52 = v38;
    v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1BCBDB05C(v2 + 416, (uint64_t)v50);
    v52 = v38;
    v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1BCBDB05C(v2 + 536, (uint64_t)v50);
    v52 = v38;
    v53 = v29;
    __swift_allocate_boxed_opaque_existential_1(v51);
    sub_1BCC00C3C();
    sub_1BCC009CC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    sub_1BCC009A8();
    v40 = v39;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v47);
  }
  else
  {
    if (((v48 | v23) & 1) == 0)
    {
      sub_1BCBDB05C(v2 + 416, (uint64_t)v50);
      v52 = sub_1BCC00C30();
      v53 = v29;
      __swift_allocate_boxed_opaque_existential_1(v51);
      sub_1BCC00C3C();
      sub_1BCC009CC();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    }
    sub_1BCC009A8();
    v40 = v41;
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + v8[11]), *(_QWORD *)(v2 + v8[11] + 24));
    sub_1BCC00708();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v7, v47);
  }
  return v40;
}

uint64_t sub_1BCBFA80C@<X0>(void (*a1)(char *)@<X0>, uint64_t **a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(char *);
  uint64_t v8;
  void (*v9)(char *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  int v28;
  uint64_t v29;
  _QWORD *v30;
  char v31;
  _QWORD *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *);
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  void (*v62)(char *);
  char *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t *v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  void (*v75)(char *);
  void (*v76)(void (*)(_QWORD), void (*)(_QWORD));
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void (*v84)(char *);
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t result;
  char *v90;
  char v91;
  uint64_t v92;
  char v93;
  _QWORD *v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  uint64_t **v98;
  char v99;
  char v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  uint64_t *v104;
  char *v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  void (*v113)(char *, uint64_t);
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t *v117;
  id v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t *boxed_opaque_existential_1;
  __int128 v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  __int128 v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void (*v143)(char *);
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  uint64_t **v148;
  char *v149;
  void (*v150)(char *);
  _QWORD *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void (*v155)(char *);
  char *v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  _OWORD v161[2];
  uint64_t v162;
  __int128 v163;
  __int128 v164;
  uint64_t v165;
  __int128 v166;
  __int128 v167;
  uint64_t v168;
  __int128 v169;
  uint64_t v170;
  uint64_t v171;

  v3 = v2;
  v150 = a1;
  v148 = a2;
  v153 = sub_1BCC00ABC();
  v145 = *(_QWORD *)(v153 - 8);
  MEMORY[0x1E0C80A78](v153);
  v149 = (char *)&v130 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v154 = sub_1BCC00A68();
  v152 = *(_QWORD *)(v154 - 8);
  MEMORY[0x1E0C80A78](v154);
  v157 = (char *)&v130 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v147 = sub_1BCC00AB0();
  v151 = *(_QWORD **)(v147 - 8);
  MEMORY[0x1E0C80A78](v147);
  v146 = (char *)&v130 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (void (*)(char *))sub_1BCC00AE0();
  v144 = *((_QWORD *)v7 - 1);
  MEMORY[0x1E0C80A78](v7);
  v9 = (void (*)(char *))((char *)&v130 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v142 = sub_1BCC00AF8();
  v141 = *(_QWORD *)(v142 - 8);
  MEMORY[0x1E0C80A78](v142);
  v156 = (char *)&v130 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for SmallLockupLayout(0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v130 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v130 - v15;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v130 - v18;
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v130 - v21;
  v159 = v23;
  v24 = v2 + *(int *)(v23 + 24);
  sub_1BCBDAE7C(v24, (uint64_t)&v169, &qword_1ED1BC8B0);
  if (!v170)
  {
    sub_1BCBDC2D4((uint64_t)&v169, &qword_1ED1BC8B0);
    sub_1BCBE31E0(v2, (uint64_t)v22, type metadata accessor for SmallLockupLayout);
    goto LABEL_6;
  }
  __swift_project_boxed_opaque_existential_1(&v169, v170);
  v25 = sub_1BCC006F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v169);
  sub_1BCBE31E0(v3, (uint64_t)v22, type metadata accessor for SmallLockupLayout);
  if ((v25 & 1) != 0)
  {
LABEL_6:
    sub_1BCBE8194((uint64_t)v22);
    goto LABEL_7;
  }
  sub_1BCBDAE7C((uint64_t)&v22[*(int *)(v159 + 24)], (uint64_t)&v169, &qword_1ED1BC8B0);
  if (v170)
  {
    __swift_project_boxed_opaque_existential_1(&v169, v170);
    LODWORD(v155) = sub_1BCC006C0();
    sub_1BCBE8194((uint64_t)v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v169);
    goto LABEL_8;
  }
  sub_1BCBE8194((uint64_t)v22);
  sub_1BCBDC2D4((uint64_t)&v169, &qword_1ED1BC8B0);
LABEL_7:
  LODWORD(v155) = 0;
LABEL_8:
  v26 = v3 + *(int *)(v159 + 36);
  sub_1BCBDAE7C(v26, (uint64_t)&v169, &qword_1ED1BC8B0);
  v140 = v26;
  if (!v170)
  {
    sub_1BCBDC2D4((uint64_t)&v169, &qword_1ED1BC8B0);
    sub_1BCBE31E0(v3, (uint64_t)v19, type metadata accessor for SmallLockupLayout);
    goto LABEL_13;
  }
  __swift_project_boxed_opaque_existential_1(&v169, v170);
  v27 = sub_1BCC006F0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v169);
  sub_1BCBE31E0(v3, (uint64_t)v19, type metadata accessor for SmallLockupLayout);
  if ((v27 & 1) != 0)
  {
LABEL_13:
    sub_1BCBE8194((uint64_t)v19);
    v28 = 0;
    goto LABEL_14;
  }
  sub_1BCBDAE7C((uint64_t)&v19[*(int *)(v159 + 36)], (uint64_t)&v169, &qword_1ED1BC8B0);
  v28 = v170;
  if (v170)
  {
    __swift_project_boxed_opaque_existential_1(&v169, v170);
    v28 = sub_1BCC006C0();
    sub_1BCBE8194((uint64_t)v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v169);
  }
  else
  {
    sub_1BCBE8194((uint64_t)v19);
    sub_1BCBDC2D4((uint64_t)&v169, &qword_1ED1BC8B0);
  }
LABEL_14:
  v29 = *(int *)(v159 + 28);
  v158 = v3;
  v30 = (_QWORD *)(v3 + v29);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + v29), *(_QWORD *)(v3 + v29 + 24));
  v31 = sub_1BCC006C0();
  v32 = v151;
  if ((v31 & 1) == 0
    || (__swift_project_boxed_opaque_existential_1((_QWORD *)(v158 + *(int *)(v159 + 32)), *(_QWORD *)(v158 + *(int *)(v159 + 32) + 24)), (sub_1BCC006C0() & 1) != 0))
  {
LABEL_23:
    v33 = v157;
    if (((v155 | v28) & 1) != 0)
      goto LABEL_24;
LABEL_35:
    v90 = v33;
    __swift_project_boxed_opaque_existential_1(v30, v30[3]);
    v91 = sub_1BCC006C0();
    v92 = v158;
    sub_1BCBE31E0(v158, (uint64_t)v16, type metadata accessor for SmallLockupLayout);
    if ((v91 & 1) != 0)
    {
      sub_1BCBE8194((uint64_t)v16);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(&v16[*(int *)(v159 + 32)], *(_QWORD *)&v16[*(int *)(v159 + 32) + 24]);
      v93 = sub_1BCC006C0();
      sub_1BCBE8194((uint64_t)v16);
      if ((v93 & 1) != 0)
      {
        v94 = (_QWORD *)(v92 + *(int *)(v159 + 32));
        v95 = v94[3];
        v96 = v94[4];
        v97 = __swift_project_boxed_opaque_existential_1(v94, v95);
        v98 = v148;
LABEL_53:
        v98[3] = (uint64_t *)&type metadata for CenteringLayout;
        v98[4] = (uint64_t *)sub_1BCBFD740();
        v128 = (uint64_t *)swift_allocObject();
        *v98 = v128;
        v128[5] = v95;
        v128[6] = *(_QWORD *)(v96 + 8);
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v128 + 2);
        result = (*(uint64_t (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v95 - 8) + 16))(boxed_opaque_existential_1, v97, v95);
        v128[7] = 2;
        return result;
      }
    }
    __swift_project_boxed_opaque_existential_1(v30, v30[3]);
    v99 = sub_1BCC006C0();
    sub_1BCBE31E0(v92, (uint64_t)v13, type metadata accessor for SmallLockupLayout);
    if ((v99 & 1) != 0)
    {
      __swift_project_boxed_opaque_existential_1(&v13[*(int *)(v159 + 32)], *(_QWORD *)&v13[*(int *)(v159 + 32) + 24]);
      v100 = sub_1BCC006C0();
      sub_1BCBE8194((uint64_t)v13);
      if ((v100 & 1) == 0)
      {
        sub_1BCBDAE7C(v92 + *(int *)(v159 + 40), (uint64_t)&v166, &qword_1ED1BC8A8);
        if (*((_QWORD *)&v167 + 1))
        {
          sub_1BCBDB3C8(&v166, (uint64_t)&v169);
          __swift_project_boxed_opaque_existential_1(&v169, v170);
          if ((sub_1BCC006F0() & 1) == 0)
          {
            __swift_project_boxed_opaque_existential_1(&v169, v170);
            if ((sub_1BCC006C0() & 1) != 0)
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EF48D100);
              v156 = *(char **)(v144 + 72);
              v159 = swift_allocObject();
              *(_OWORD *)(v159 + 16) = xmmword_1BCC09A20;
              v101 = v30[3];
              v102 = v30[4];
              v103 = __swift_project_boxed_opaque_existential_1(v30, v101);
              *((_QWORD *)&v167 + 1) = v101;
              v168 = *(_QWORD *)(v102 + 8);
              v104 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v166);
              (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v101 - 8) + 16))(v104, v103, v101);
              v137 = v158 + 256;
              v165 = 0;
              v163 = 0u;
              v164 = 0u;
              LODWORD(v155) = *MEMORY[0x1E0D41EC8];
              v150 = *(void (**)(char *))(v152 + 104);
              v105 = v90;
              v150(v90);
              LODWORD(v144) = *MEMORY[0x1E0D41F28];
              v106 = v145;
              v143 = *(void (**)(char *))(v145 + 104);
              v107 = v149;
              v143(v149);
              v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC218);
              v108 = *((unsigned __int8 *)v32 + 80);
              v140 = ((v108 + 32) & ~v108) + v32[9];
              v139 = v108 | 7;
              v109 = swift_allocObject();
              v138 = xmmword_1BCC091B0;
              *(_OWORD *)(v109 + 16) = xmmword_1BCC091B0;
              sub_1BCC00A8C();
              *(_QWORD *)&v161[0] = v109;
              v135 = sub_1BCBDAC80((unint64_t *)&qword_1ED1BC200, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41F08], MEMORY[0x1E0D41F18]);
              v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC208);
              v136 = sub_1BCBDC244();
              v110 = v146;
              v111 = v147;
              sub_1BCC00EDC();
              sub_1BCC00AD4();
              v151 = (_QWORD *)v32[1];
              ((void (*)(char *, uint64_t))v151)(v110, v111);
              v145 = *(_QWORD *)(v106 + 8);
              v112 = v153;
              ((void (*)(char *, uint64_t))v145)(v107, v153);
              v113 = *(void (**)(char *, uint64_t))(v152 + 8);
              v114 = v154;
              v113(v105, v154);
              sub_1BCBDC2D4((uint64_t)&v163, &qword_1ED1BC1F8);
              __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
              v168 = 0;
              v166 = 0u;
              v167 = 0u;
              ((void (*)(char *, _QWORD, uint64_t))v150)(v105, v155, v114);
              ((void (*)(char *, _QWORD, uint64_t))v143)(v107, v144, v112);
              v115 = swift_allocObject();
              *(_OWORD *)(v115 + 16) = v138;
              sub_1BCC00A8C();
              *(_QWORD *)&v163 = v115;
              sub_1BCC00EDC();
              sub_1BCC00AD4();
              ((void (*)(char *, uint64_t))v151)(v110, v111);
              ((void (*)(char *, uint64_t))v145)(v107, v112);
              v113(v105, v154);
              sub_1BCBDC2D4((uint64_t)&v166, &qword_1ED1BC1F8);
              v116 = MEMORY[0x1E0D41F70];
              v117 = (uint64_t *)v148;
              v148[3] = (uint64_t *)v142;
              v117[4] = v116;
              __swift_allocate_boxed_opaque_existential_1(v117);
              sub_1BCC00AC8();
              return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v169);
            }
          }
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v169);
        }
        else
        {
          sub_1BCBDC2D4((uint64_t)&v166, &qword_1ED1BC8A8);
        }
        v98 = v148;
        v95 = v30[3];
        v96 = v30[4];
        v97 = __swift_project_boxed_opaque_existential_1(v30, v95);
        goto LABEL_53;
      }
    }
    else
    {
      sub_1BCBE8194((uint64_t)v13);
    }
    v118 = objc_msgSend(v150, sel_traitCollection);
    v119 = objc_msgSend(v118, sel_preferredContentSizeCategory);

    LOBYTE(v118) = sub_1BCC00E88();
    sub_1BCBDB05C((uint64_t)v30, (uint64_t)&v169);
    sub_1BCBDB05C(v92 + *(int *)(v159 + 32), (uint64_t)&v166);
    if ((v118 & 1) != 0)
    {
      sub_1BCBDB05C(v92 + 296, (uint64_t)&v163);
      v120 = sub_1BCC00D44();
      v121 = MEMORY[0x1E0D424B8];
      v122 = (uint64_t *)v148;
      v148[3] = (uint64_t *)v120;
      v122[4] = v121;
      __swift_allocate_boxed_opaque_existential_1(v122);
      return sub_1BCC00D38();
    }
    else
    {
      sub_1BCBDB05C(v92 + 96, (uint64_t)&v163);
      sub_1BCBDB05C(v92 + 136, (uint64_t)v161);
      sub_1BCBDB05C(v92 + 296, (uint64_t)&v160);
      v123 = sub_1BCC00D2C();
      v124 = MEMORY[0x1E0D42450];
      v125 = (uint64_t *)v148;
      v148[3] = (uint64_t *)v123;
      v125[4] = v124;
      __swift_allocate_boxed_opaque_existential_1(v125);
      return sub_1BCC00D20();
    }
  }
  sub_1BCBDAE7C(v24, (uint64_t)&v166, &qword_1ED1BC8B0);
  if (!*((_QWORD *)&v167 + 1))
  {
    sub_1BCBDC2D4((uint64_t)&v166, &qword_1ED1BC8B0);
    goto LABEL_23;
  }
  sub_1BCBDB3C8(&v166, (uint64_t)&v169);
  if ((v155 & 1) == 0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v169);
    v33 = v157;
    if ((v28 & 1) != 0)
      goto LABEL_24;
    goto LABEL_35;
  }
  v33 = v157;
  if ((v28 & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v169);
LABEL_24:
    v143 = v9;
    v150 = v7;
    sub_1BCC00AC8();
    sub_1BCBDAE7C(v24, (uint64_t)&v166, &qword_1ED1BC8B0);
    if (*((_QWORD *)&v167 + 1))
    {
      sub_1BCBDB3C8(&v166, (uint64_t)&v169);
      v34 = v33;
      __swift_project_boxed_opaque_existential_1(&v169, v170);
      sub_1BCC008DC();
      __swift_project_boxed_opaque_existential_1(&v169, v170);
      sub_1BCC008C4();
      v35 = v170;
      v36 = v171;
      v37 = __swift_project_boxed_opaque_existential_1(&v169, v170);
      *((_QWORD *)&v167 + 1) = v35;
      v168 = *(_QWORD *)(v36 + 8);
      v38 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v166);
      (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v35 - 8) + 16))(v38, v37, v35);
      v139 = v158 + 56;
      v165 = 0;
      v163 = 0u;
      v164 = 0u;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC218);
      v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_1BCC09A20;
      sub_1BCC00AA4();
      sub_1BCC00A98();
      *(_QWORD *)&v161[0] = v39;
      sub_1BCBDAC80((unint64_t *)&qword_1ED1BC200, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41F08], MEMORY[0x1E0D41F18]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC208);
      sub_1BCBDC244();
      v40 = v146;
      v41 = v147;
      sub_1BCC00EDC();
      v42 = v152;
      v43 = v154;
      (*(void (**)(char *, _QWORD, uint64_t))(v152 + 104))(v34, *MEMORY[0x1E0D41EC8], v154);
      v44 = v145;
      v45 = v149;
      v46 = v153;
      (*(void (**)(char *, _QWORD, uint64_t))(v145 + 104))(v149, *MEMORY[0x1E0D41F28], v153);
      v47 = v143;
      sub_1BCC00AD4();
      (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v46);
      v48 = *(void (**)(char *, uint64_t))(v42 + 8);
      v32 = v151;
      v48(v34, v43);
      ((void (*)(char *, uint64_t))v32[1])(v40, v41);
      sub_1BCBDC2D4((uint64_t)&v163, &qword_1ED1BC1F8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
      sub_1BCC00AEC();
      (*(void (**)(void (*)(char *), void (*)(char *)))(v144 + 8))(v47, v150);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v169);
    }
    else
    {
      sub_1BCBDC2D4((uint64_t)&v166, &qword_1ED1BC8B0);
      v46 = v153;
      v43 = v154;
      v45 = v149;
    }
    __swift_project_boxed_opaque_existential_1(v30, v30[3]);
    sub_1BCC008DC();
    __swift_project_boxed_opaque_existential_1(v30, v30[3]);
    sub_1BCC008C4();
    v49 = 176;
    if ((v155 & 1) != 0)
      v49 = 216;
    sub_1BCBDB05C(v158 + v49, (uint64_t)&v169);
    v50 = v30[3];
    v51 = v30[4];
    v52 = __swift_project_boxed_opaque_existential_1(v30, v50);
    *((_QWORD *)&v167 + 1) = v50;
    v168 = *(_QWORD *)(v51 + 8);
    v53 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v166);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v50 - 8) + 16))(v53, v52, v50);
    v165 = 0;
    v163 = 0u;
    v164 = 0u;
    LODWORD(v139) = *MEMORY[0x1E0D41EC8];
    v155 = *(void (**)(char *))(v152 + 104);
    v155(v157);
    LODWORD(v137) = *MEMORY[0x1E0D41F28];
    v54 = v145;
    *(_QWORD *)&v138 = *(_QWORD *)(v145 + 104);
    ((void (*)(char *))v138)(v45);
    v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC218);
    v55 = v46;
    v136 = v32[9];
    v56 = *((unsigned __int8 *)v32 + 80);
    v57 = v43;
    v58 = (v56 + 32) & ~v56;
    v134 = v56 | 7;
    v59 = swift_allocObject();
    *(_OWORD *)(v59 + 16) = xmmword_1BCC091B0;
    sub_1BCC00A8C();
    *(_QWORD *)&v161[0] = v59;
    v133 = sub_1BCBDAC80((unint64_t *)&qword_1ED1BC200, (uint64_t (*)(uint64_t))MEMORY[0x1E0D41F08], MEMORY[0x1E0D41F18]);
    v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1BC208);
    v131 = sub_1BCBDC244();
    v60 = v146;
    v61 = v147;
    sub_1BCC00EDC();
    v62 = v143;
    v63 = v157;
    sub_1BCC00AD4();
    v151 = (_QWORD *)v32[1];
    ((void (*)(char *, uint64_t))v151)(v60, v61);
    v145 = *(_QWORD *)(v54 + 8);
    ((void (*)(char *, uint64_t))v145)(v45, v55);
    v152 = *(_QWORD *)(v152 + 8);
    ((void (*)(char *, uint64_t))v152)(v63, v57);
    sub_1BCBDC2D4((uint64_t)&v163, &qword_1ED1BC1F8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
    sub_1BCC00AEC();
    v144 = *(_QWORD *)(v144 + 8);
    ((void (*)(void (*)(char *), void (*)(char *)))v144)(v62, v150);
    v64 = (_QWORD *)(v158 + *(int *)(v159 + 32));
    __swift_project_boxed_opaque_existential_1(v64, v64[3]);
    sub_1BCC008DC();
    __swift_project_boxed_opaque_existential_1(v64, v64[3]);
    sub_1BCC008C4();
    v65 = v64[3];
    v66 = v64[4];
    v67 = __swift_project_boxed_opaque_existential_1(v64, v65);
    *((_QWORD *)&v167 + 1) = v65;
    v168 = *(_QWORD *)(v66 + 8);
    v68 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v166);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v65 - 8) + 16))(v68, v67, v65);
    v165 = 0;
    v163 = 0u;
    v164 = 0u;
    v69 = swift_allocObject();
    v130 = xmmword_1BCC09A20;
    *(_OWORD *)(v69 + 16) = xmmword_1BCC09A20;
    v159 = v58;
    sub_1BCC00AA4();
    v70 = v157;
    v71 = v149;
    sub_1BCC00A98();
    *(_QWORD *)&v161[0] = v69;
    sub_1BCC00EDC();
    v72 = v154;
    ((void (*)(char *, _QWORD, uint64_t))v155)(v70, v139, v154);
    v73 = v153;
    ((void (*)(char *, _QWORD, uint64_t))v138)(v71, v137, v153);
    sub_1BCC00AD4();
    ((void (*)(char *, uint64_t))v145)(v71, v73);
    ((void (*)(char *, uint64_t))v152)(v70, v72);
    ((void (*)(char *, uint64_t))v151)(v60, v61);
    sub_1BCBDC2D4((uint64_t)&v163, &qword_1ED1BC1F8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
    v74 = v156;
    sub_1BCC00AEC();
    v75 = v62;
    v76 = (void (*)(void (*)(_QWORD), void (*)(_QWORD)))v144;
    ((void (*)(void (*)(char *), void (*)(char *)))v144)(v75, v150);
    sub_1BCBDAE7C(v140, (uint64_t)&v163, &qword_1ED1BC8B0);
    if (*((_QWORD *)&v164 + 1))
    {
      sub_1BCBDB3C8(&v163, (uint64_t)&v166);
      __swift_project_boxed_opaque_existential_1(&v166, *((uint64_t *)&v167 + 1));
      sub_1BCC008DC();
      __swift_project_boxed_opaque_existential_1(&v166, *((uint64_t *)&v167 + 1));
      sub_1BCC008C4();
      v77 = *((_QWORD *)&v167 + 1);
      v78 = v168;
      v79 = __swift_project_boxed_opaque_existential_1(&v166, *((uint64_t *)&v167 + 1));
      *((_QWORD *)&v164 + 1) = v77;
      v165 = *(_QWORD *)(v78 + 8);
      v80 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v163);
      (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v77 - 8) + 16))(v80, v79, v77);
      v162 = 0;
      memset(v161, 0, sizeof(v161));
      v81 = swift_allocObject();
      *(_OWORD *)(v81 + 16) = v130;
      sub_1BCC00AA4();
      sub_1BCC00A98();
      v160 = v81;
      sub_1BCC00EDC();
      v82 = v154;
      ((void (*)(char *, _QWORD, uint64_t))v155)(v70, v139, v154);
      v83 = v153;
      ((void (*)(char *, _QWORD, uint64_t))v138)(v71, v137, v153);
      v84 = v143;
      sub_1BCC00AD4();
      ((void (*)(char *, uint64_t))v145)(v71, v83);
      ((void (*)(char *, uint64_t))v152)(v70, v82);
      v74 = v156;
      ((void (*)(char *, uint64_t))v151)(v60, v61);
      sub_1BCBDC2D4((uint64_t)v161, &qword_1ED1BC1F8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v163);
      sub_1BCC00AEC();
      v76((void (*)(_QWORD))v84, (void (*)(_QWORD))v150);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v166);
    }
    else
    {
      sub_1BCBDC2D4((uint64_t)&v163, &qword_1ED1BC8B0);
    }
    v85 = MEMORY[0x1E0D41F70];
    v86 = (uint64_t *)v148;
    v87 = v142;
    v148[3] = (uint64_t *)v142;
    v86[4] = v85;
    v88 = __swift_allocate_boxed_opaque_existential_1(v86);
    (*(void (**)(uint64_t *, char *, uint64_t))(v141 + 32))(v88, v74, v87);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v169);
  }
  v126 = (uint64_t *)v148;
  v148[3] = (uint64_t *)&type metadata for CenteredThreeLineReverseTextLayout;
  v126[4] = sub_1BCBFD7A8();
  v127 = swift_allocObject();
  *v126 = v127;
  sub_1BCBDB05C((uint64_t)v30, v127 + 16);
  sub_1BCBDB3C8(&v169, v127 + 56);
  result = sub_1BCBDB05C(v158 + 216, v127 + 96);
  *(_QWORD *)(v127 + 136) = 2;
  return result;
}

uint64_t sub_1BCBFC044()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_1BCC00C00();
  __swift_allocate_value_buffer(v0, qword_1ED1BC390);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED1BC390);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(v1, *MEMORY[0x1E0D42188], v0);
}

uint64_t sub_1BCBFC09C@<X0>(void (*a1)(char *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v15;
  double v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *);
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[40];
  _BYTE v43[40];
  _BYTE v44[40];
  _BYTE v45[40];
  uint64_t *v46[2];

  v3 = v2;
  v41 = a2;
  v36 = sub_1BCC00C00();
  v34 = *(_QWORD *)(v36 - 8);
  MEMORY[0x1E0C80A78](v36);
  v39 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v35 = (char *)&v32 - v7;
  v40 = sub_1BCC00C24();
  v38 = *(_QWORD *)(v40 - 8);
  MEMORY[0x1E0C80A78](v40);
  v37 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1BCC00BDC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v32 - v14;
  v33 = sub_1BCC00BF4();
  v32 = *(_QWORD *)(v33 - 8);
  *(_QWORD *)&v16 = MEMORY[0x1E0C80A78](v33).n128_u64[0];
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = a1;
  v20 = objc_msgSend(a1, sel_traitCollection, v16);
  v21 = sub_1BCC00E70();

  if ((v21 & 1) != 0)
  {
    sub_1BCBFA80C(v19, v46);
    v22 = type metadata accessor for SmallLockupLayout(0);
    sub_1BCBDB05C(v3 + *(int *)(v22 + 20), (uint64_t)v45);
    sub_1BCBDB05C(v3 + 16, (uint64_t)v44);
    sub_1BCBDB05C(v3 + *(int *)(v22 + 44), (uint64_t)v43);
    sub_1BCBDB05C(v3 + 416, (uint64_t)v42);
    v23 = *MEMORY[0x1E0D42118];
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
    v24(v15, v23, v9);
    v24(v12, v23, v9);
    sub_1BCC00BE8();
    sub_1BCC00BD0();
    return (*(uint64_t (**)(char *, uint64_t))(v32 + 8))(v18, v33);
  }
  else
  {
    sub_1BCBFA80C(v19, v46);
    v26 = type metadata accessor for SmallLockupLayout(0);
    sub_1BCBDB05C(v3 + *(int *)(v26 + 20), (uint64_t)v45);
    sub_1BCBDB05C(v3 + 16, (uint64_t)v44);
    v27 = type metadata accessor for SmallLockupLayout.Metrics(0);
    v28 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 16);
    v29 = v36;
    v28(v35, v3 + *(int *)(v27 + 76), v36);
    sub_1BCBDB05C(v3 + *(int *)(v26 + 44), (uint64_t)v43);
    sub_1BCBDB05C(v3 + 456, (uint64_t)v42);
    if (qword_1ED1BC368 != -1)
      swift_once();
    v30 = __swift_project_value_buffer(v29, (uint64_t)qword_1ED1BC390);
    v28(v39, v30, v29);
    v31 = v37;
    sub_1BCC00C18();
    sub_1BCC00C0C();
    return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v31, v40);
  }
}

double sub_1BCBFC4D0(uint64_t a1, void *a2)
{
  swift_getObjectType();
  return sub_1BCBE59C4(a1, a2);
}

uint64_t sub_1BCBFC51C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1BCBE31E0(v1, a1, type metadata accessor for SmallLockupLayout.Metrics);
}

_OWORD *sub_1BCBFC540(_OWORD *a1, uint64_t *a2, int *a3)
{
  _OWORD *v4;
  int v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v35 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (_OWORD *)(v35 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_OWORD *)a2;
    v7 = *(_OWORD *)(a2 + 5);
    *(_OWORD *)((char *)a1 + 40) = v7;
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)(a1 + 1), (uint64_t)(a2 + 2));
    v8 = *((_OWORD *)a2 + 5);
    v4[5] = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))((uint64_t)v4 + 56, (uint64_t)(a2 + 7));
    v9 = *(_OWORD *)(a2 + 15);
    *(_OWORD *)((char *)v4 + 120) = v9;
    (**(void (***)(uint64_t, uint64_t))(v9 - 8))((uint64_t)(v4 + 6), (uint64_t)(a2 + 12));
    v10 = *((_OWORD *)a2 + 10);
    v4[10] = v10;
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))((uint64_t)v4 + 136, (uint64_t)(a2 + 17));
    v11 = *(_OWORD *)(a2 + 25);
    *(_OWORD *)((char *)v4 + 200) = v11;
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))((uint64_t)(v4 + 11), (uint64_t)(a2 + 22));
    v12 = *((_OWORD *)a2 + 15);
    v4[15] = v12;
    (**(void (***)(uint64_t, uint64_t))(v12 - 8))((uint64_t)v4 + 216, (uint64_t)(a2 + 27));
    v13 = a2[35];
    v14 = a2[36];
    *((_QWORD *)v4 + 35) = v13;
    *((_QWORD *)v4 + 36) = v14;
    (**(void (***)(uint64_t, uint64_t))(v13 - 8))((uint64_t)(v4 + 16), (uint64_t)(a2 + 32));
    v15 = *((_OWORD *)a2 + 20);
    v4[20] = v15;
    (**(void (***)(uint64_t, uint64_t))(v15 - 8))((uint64_t)v4 + 296, (uint64_t)(a2 + 37));
    v16 = a2[45];
    v17 = a2[46];
    *((_QWORD *)v4 + 45) = v16;
    *((_QWORD *)v4 + 46) = v17;
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))((uint64_t)(v4 + 21), (uint64_t)(a2 + 42));
    v18 = *((_OWORD *)a2 + 25);
    v4[25] = v18;
    (**(void (***)(uint64_t, uint64_t))(v18 - 8))((uint64_t)v4 + 376, (uint64_t)(a2 + 47));
    v19 = a2[55];
    v20 = a2[56];
    *((_QWORD *)v4 + 55) = v19;
    *((_QWORD *)v4 + 56) = v20;
    (**(void (***)(uint64_t, uint64_t))(v19 - 8))((uint64_t)(v4 + 26), (uint64_t)(a2 + 52));
    v21 = *((_OWORD *)a2 + 30);
    v4[30] = v21;
    (**(void (***)(uint64_t, uint64_t))(v21 - 8))((uint64_t)v4 + 456, (uint64_t)(a2 + 57));
    v22 = a2[65];
    *((_QWORD *)v4 + 65) = v22;
    *((_QWORD *)v4 + 66) = a2[66];
    (**(void (***)(uint64_t, uint64_t))(v22 - 8))((uint64_t)(v4 + 31), (uint64_t)(a2 + 62));
    v23 = *((_OWORD *)a2 + 35);
    v4[35] = v23;
    (**(void (***)(uint64_t, uint64_t))(v23 - 8))((uint64_t)v4 + 536, (uint64_t)(a2 + 67));
    v24 = *(int *)(type metadata accessor for SmallLockupLayout.Metrics(0) + 76);
    v25 = (char *)v4 + v24;
    v26 = (uint64_t)a2 + v24;
    v27 = sub_1BCC00C00();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v25, v26, v27);
    v28 = a3[5];
    v29 = *(_OWORD *)((char *)a2 + v28 + 24);
    *(_OWORD *)((char *)v4 + v28 + 24) = v29;
    (**(void (***)(void))(v29 - 8))();
    v30 = a3[6];
    v31 = (char *)v4 + v30;
    v32 = (uint64_t)a2 + v30;
    v33 = *(uint64_t *)((char *)a2 + v30 + 24);
    if (v33)
    {
      v34 = *(_QWORD *)(v32 + 32);
      *((_QWORD *)v31 + 3) = v33;
      *((_QWORD *)v31 + 4) = v34;
      (**(void (***)(void))(v33 - 8))();
    }
    else
    {
      v36 = *(_OWORD *)(v32 + 16);
      *(_OWORD *)v31 = *(_OWORD *)v32;
      *((_OWORD *)v31 + 1) = v36;
      *((_QWORD *)v31 + 4) = *(_QWORD *)(v32 + 32);
    }
    v37 = a3[7];
    v38 = *(_OWORD *)((char *)a2 + v37 + 24);
    *(_OWORD *)((char *)v4 + v37 + 24) = v38;
    (**(void (***)(void))(v38 - 8))();
    v39 = a3[8];
    v40 = *(_OWORD *)((char *)a2 + v39 + 24);
    *(_OWORD *)((char *)v4 + v39 + 24) = v40;
    (**(void (***)(void))(v40 - 8))();
    v41 = a3[9];
    v42 = (char *)v4 + v41;
    v43 = (uint64_t)a2 + v41;
    v44 = *(uint64_t *)((char *)a2 + v41 + 24);
    if (v44)
    {
      v45 = *(_QWORD *)(v43 + 32);
      *((_QWORD *)v42 + 3) = v44;
      *((_QWORD *)v42 + 4) = v45;
      (**(void (***)(void))(v44 - 8))();
    }
    else
    {
      v46 = *(_OWORD *)(v43 + 16);
      *(_OWORD *)v42 = *(_OWORD *)v43;
      *((_OWORD *)v42 + 1) = v46;
      *((_QWORD *)v42 + 4) = *(_QWORD *)(v43 + 32);
    }
    v47 = a3[10];
    v48 = (char *)v4 + v47;
    v49 = (uint64_t)a2 + v47;
    v50 = *(uint64_t *)((char *)a2 + v47 + 24);
    if (v50)
    {
      v51 = *(_QWORD *)(v49 + 32);
      *((_QWORD *)v48 + 3) = v50;
      *((_QWORD *)v48 + 4) = v51;
      (**(void (***)(void))(v50 - 8))();
    }
    else
    {
      v52 = *(_OWORD *)(v49 + 16);
      *(_OWORD *)v48 = *(_OWORD *)v49;
      *((_OWORD *)v48 + 1) = v52;
      *((_QWORD *)v48 + 4) = *(_QWORD *)(v49 + 32);
    }
    v53 = a3[11];
    v54 = *(_OWORD *)((char *)a2 + v53 + 24);
    *(_OWORD *)((char *)v4 + v53 + 24) = v54;
    (**(void (***)(void))(v54 - 8))();
  }
  return v4;
}

uint64_t sub_1BCBFC8DC(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  __swift_destroy_boxed_opaque_existential_1(a1 + 456);
  __swift_destroy_boxed_opaque_existential_1(a1 + 496);
  __swift_destroy_boxed_opaque_existential_1(a1 + 536);
  v4 = a1 + *(int *)(type metadata accessor for SmallLockupLayout.Metrics(0) + 76);
  v5 = sub_1BCC00C00();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[5]);
  v6 = a1 + a2[6];
  if (*(_QWORD *)(v6 + 24))
    __swift_destroy_boxed_opaque_existential_1(v6);
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[7]);
  __swift_destroy_boxed_opaque_existential_1(a1 + a2[8]);
  v7 = a1 + a2[9];
  if (*(_QWORD *)(v7 + 24))
    __swift_destroy_boxed_opaque_existential_1(v7);
  v8 = a1 + a2[10];
  if (*(_QWORD *)(v8 + 24))
    __swift_destroy_boxed_opaque_existential_1(v8);
  return __swift_destroy_boxed_opaque_existential_1(a1 + a2[11]);
}

uint64_t sub_1BCBFCA08(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 16, a2 + 16);
  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 56, a2 + 56);
  v8 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 120) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 96, a2 + 96);
  v9 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 136, a2 + 136);
  v10 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 200) = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 176, a2 + 176);
  v11 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 240) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 216, a2 + 216);
  v12 = *(_QWORD *)(a2 + 280);
  v13 = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 280) = v12;
  *(_QWORD *)(a1 + 288) = v13;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 256, a2 + 256);
  v14 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 320) = v14;
  (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1 + 296, a2 + 296);
  v15 = *(_QWORD *)(a2 + 360);
  v16 = *(_QWORD *)(a2 + 368);
  *(_QWORD *)(a1 + 360) = v15;
  *(_QWORD *)(a1 + 368) = v16;
  (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 336, a2 + 336);
  v17 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 400) = v17;
  (**(void (***)(uint64_t, uint64_t))(v17 - 8))(a1 + 376, a2 + 376);
  v18 = *(_QWORD *)(a2 + 440);
  v19 = *(_QWORD *)(a2 + 448);
  *(_QWORD *)(a1 + 440) = v18;
  *(_QWORD *)(a1 + 448) = v19;
  (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 416, a2 + 416);
  v20 = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 480) = v20;
  (**(void (***)(uint64_t, uint64_t))(v20 - 8))(a1 + 456, a2 + 456);
  v21 = *(_QWORD *)(a2 + 520);
  *(_QWORD *)(a1 + 520) = v21;
  *(_QWORD *)(a1 + 528) = *(_QWORD *)(a2 + 528);
  (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 496, a2 + 496);
  v22 = *(_OWORD *)(a2 + 560);
  *(_OWORD *)(a1 + 560) = v22;
  (**(void (***)(uint64_t, uint64_t))(v22 - 8))(a1 + 536, a2 + 536);
  v23 = *(int *)(type metadata accessor for SmallLockupLayout.Metrics(0) + 76);
  v24 = a1 + v23;
  v25 = a2 + v23;
  v26 = sub_1BCC00C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v24, v25, v26);
  v27 = a3[5];
  v28 = *(_OWORD *)(a2 + v27 + 24);
  *(_OWORD *)(a1 + v27 + 24) = v28;
  (**(void (***)(void))(v28 - 8))();
  v29 = a3[6];
  v30 = a1 + v29;
  v31 = a2 + v29;
  v32 = *(_QWORD *)(a2 + v29 + 24);
  if (v32)
  {
    v33 = *(_QWORD *)(v31 + 32);
    *(_QWORD *)(v30 + 24) = v32;
    *(_QWORD *)(v30 + 32) = v33;
    (**(void (***)(void))(v32 - 8))();
  }
  else
  {
    v34 = *(_OWORD *)(v31 + 16);
    *(_OWORD *)v30 = *(_OWORD *)v31;
    *(_OWORD *)(v30 + 16) = v34;
    *(_QWORD *)(v30 + 32) = *(_QWORD *)(v31 + 32);
  }
  v35 = a3[7];
  v36 = *(_OWORD *)(a2 + v35 + 24);
  *(_OWORD *)(a1 + v35 + 24) = v36;
  (**(void (***)(void))(v36 - 8))();
  v37 = a3[8];
  v38 = *(_OWORD *)(a2 + v37 + 24);
  *(_OWORD *)(a1 + v37 + 24) = v38;
  (**(void (***)(void))(v38 - 8))();
  v39 = a3[9];
  v40 = a1 + v39;
  v41 = a2 + v39;
  v42 = *(_QWORD *)(a2 + v39 + 24);
  if (v42)
  {
    v43 = *(_QWORD *)(v41 + 32);
    *(_QWORD *)(v40 + 24) = v42;
    *(_QWORD *)(v40 + 32) = v43;
    (**(void (***)(void))(v42 - 8))();
  }
  else
  {
    v44 = *(_OWORD *)(v41 + 16);
    *(_OWORD *)v40 = *(_OWORD *)v41;
    *(_OWORD *)(v40 + 16) = v44;
    *(_QWORD *)(v40 + 32) = *(_QWORD *)(v41 + 32);
  }
  v45 = a3[10];
  v46 = a1 + v45;
  v47 = a2 + v45;
  v48 = *(_QWORD *)(a2 + v45 + 24);
  if (v48)
  {
    v49 = *(_QWORD *)(v47 + 32);
    *(_QWORD *)(v46 + 24) = v48;
    *(_QWORD *)(v46 + 32) = v49;
    (**(void (***)(void))(v48 - 8))();
  }
  else
  {
    v50 = *(_OWORD *)(v47 + 16);
    *(_OWORD *)v46 = *(_OWORD *)v47;
    *(_OWORD *)(v46 + 16) = v50;
    *(_QWORD *)(v46 + 32) = *(_QWORD *)(v47 + 32);
  }
  v51 = a3[11];
  v52 = *(_OWORD *)(a2 + v51 + 24);
  *(_OWORD *)(a1 + v51 + 24) = v52;
  (**(void (***)(void))(v52 - 8))();
  return a1;
}

uint64_t *sub_1BCBFCD70(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;

  *a1 = *a2;
  a1[1] = a2[1];
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  __swift_assign_boxed_opaque_existential_1(a1 + 12, a2 + 12);
  __swift_assign_boxed_opaque_existential_1(a1 + 17, a2 + 17);
  __swift_assign_boxed_opaque_existential_1(a1 + 22, a2 + 22);
  __swift_assign_boxed_opaque_existential_1(a1 + 27, a2 + 27);
  __swift_assign_boxed_opaque_existential_1(a1 + 32, a2 + 32);
  __swift_assign_boxed_opaque_existential_1(a1 + 37, a2 + 37);
  __swift_assign_boxed_opaque_existential_1(a1 + 42, a2 + 42);
  __swift_assign_boxed_opaque_existential_1(a1 + 47, a2 + 47);
  __swift_assign_boxed_opaque_existential_1(a1 + 52, a2 + 52);
  __swift_assign_boxed_opaque_existential_1(a1 + 57, a2 + 57);
  __swift_assign_boxed_opaque_existential_1(a1 + 62, a2 + 62);
  __swift_assign_boxed_opaque_existential_1(a1 + 67, a2 + 67);
  v6 = *(int *)(type metadata accessor for SmallLockupLayout.Metrics(0) + 76);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1BCC00C00();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + a3[5]), (uint64_t *)((char *)a2 + a3[5]));
  v10 = a3[6];
  v11 = (uint64_t)a1 + v10;
  v12 = (uint64_t *)((char *)a2 + v10);
  v13 = *(uint64_t *)((char *)a2 + v10 + 24);
  if (*(uint64_t *)((char *)a1 + v10 + 24))
  {
    if (v13)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)v11, v12);
      goto LABEL_8;
    }
    __swift_destroy_boxed_opaque_existential_1(v11);
  }
  else if (v13)
  {
    *(_QWORD *)(v11 + 24) = v13;
    *(_QWORD *)(v11 + 32) = v12[4];
    (**(void (***)(uint64_t, char *))(v13 - 8))(v11, (char *)v12);
    goto LABEL_8;
  }
  v14 = *(_OWORD *)v12;
  v15 = *((_OWORD *)v12 + 1);
  *(_QWORD *)(v11 + 32) = v12[4];
  *(_OWORD *)v11 = v14;
  *(_OWORD *)(v11 + 16) = v15;
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + a3[7]), (uint64_t *)((char *)a2 + a3[7]));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + a3[8]), (uint64_t *)((char *)a2 + a3[8]));
  v16 = a3[9];
  v17 = (uint64_t)a1 + v16;
  v18 = (uint64_t *)((char *)a2 + v16);
  v19 = *(uint64_t *)((char *)a2 + v16 + 24);
  if (*(uint64_t *)((char *)a1 + v16 + 24))
  {
    if (v19)
    {
      __swift_assign_boxed_opaque_existential_1((uint64_t *)v17, v18);
      goto LABEL_15;
    }
    __swift_destroy_boxed_opaque_existential_1(v17);
  }
  else if (v19)
  {
    *(_QWORD *)(v17 + 24) = v19;
    *(_QWORD *)(v17 + 32) = v18[4];
    (**(void (***)(uint64_t, char *))(v19 - 8))(v17, (char *)v18);
    goto LABEL_15;
  }
  v20 = *(_OWORD *)v18;
  v21 = *((_OWORD *)v18 + 1);
  *(_QWORD *)(v17 + 32) = v18[4];
  *(_OWORD *)v17 = v20;
  *(_OWORD *)(v17 + 16) = v21;
LABEL_15:
  v22 = a3[10];
  v23 = (uint64_t)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = *(uint64_t *)((char *)a2 + v22 + 24);
  if (!*(uint64_t *)((char *)a1 + v22 + 24))
  {
    if (v25)
    {
      *(_QWORD *)(v23 + 24) = v25;
      *(_QWORD *)(v23 + 32) = *((_QWORD *)v24 + 4);
      (**(void (***)(uint64_t, char *))(v25 - 8))(v23, v24);
      goto LABEL_22;
    }
LABEL_21:
    v26 = *(_OWORD *)v24;
    v27 = *((_OWORD *)v24 + 1);
    *(_QWORD *)(v23 + 32) = *((_QWORD *)v24 + 4);
    *(_OWORD *)v23 = v26;
    *(_OWORD *)(v23 + 16) = v27;
    goto LABEL_22;
  }
  if (!v25)
  {
    __swift_destroy_boxed_opaque_existential_1(v23);
    goto LABEL_21;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v23, (uint64_t *)v24);
LABEL_22:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)((char *)a1 + a3[11]), (uint64_t *)((char *)a2 + a3[11]));
  return a1;
}

uint64_t sub_1BCBFD018(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 *v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  v8 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v8;
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  v9 = *(_OWORD *)(a2 + 256);
  v10 = *(_OWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 256) = v9;
  *(_OWORD *)(a1 + 272) = v10;
  v11 = *(_OWORD *)(a2 + 296);
  v12 = *(_OWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_OWORD *)(a1 + 296) = v11;
  *(_OWORD *)(a1 + 312) = v12;
  v13 = *(_OWORD *)(a2 + 336);
  v14 = *(_OWORD *)(a2 + 352);
  *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 336) = v13;
  *(_OWORD *)(a1 + 352) = v14;
  v15 = *(_OWORD *)(a2 + 376);
  v16 = *(_OWORD *)(a2 + 392);
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
  *(_OWORD *)(a1 + 376) = v15;
  *(_OWORD *)(a1 + 392) = v16;
  v17 = *(_OWORD *)(a2 + 416);
  v18 = *(_OWORD *)(a2 + 432);
  *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
  *(_OWORD *)(a1 + 416) = v17;
  *(_OWORD *)(a1 + 432) = v18;
  v19 = *(_OWORD *)(a2 + 456);
  v20 = *(_OWORD *)(a2 + 472);
  *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
  *(_OWORD *)(a1 + 456) = v19;
  *(_OWORD *)(a1 + 472) = v20;
  v21 = *(_OWORD *)(a2 + 496);
  v22 = *(_OWORD *)(a2 + 512);
  *(_QWORD *)(a1 + 528) = *(_QWORD *)(a2 + 528);
  *(_OWORD *)(a1 + 496) = v21;
  *(_OWORD *)(a1 + 512) = v22;
  v23 = *(_OWORD *)(a2 + 536);
  v24 = *(_OWORD *)(a2 + 552);
  *(_QWORD *)(a1 + 568) = *(_QWORD *)(a2 + 568);
  *(_OWORD *)(a1 + 536) = v23;
  *(_OWORD *)(a1 + 552) = v24;
  v25 = *(int *)(type metadata accessor for SmallLockupLayout.Metrics(0) + 76);
  v26 = a1 + v25;
  v27 = a2 + v25;
  v28 = sub_1BCC00C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v26, v27, v28);
  v29 = a3[5];
  v30 = a3[6];
  v31 = a1 + v29;
  v32 = a2 + v29;
  *(_QWORD *)(v31 + 32) = *(_QWORD *)(v32 + 32);
  v33 = *(_OWORD *)(v32 + 16);
  *(_OWORD *)v31 = *(_OWORD *)v32;
  *(_OWORD *)(v31 + 16) = v33;
  v34 = a1 + v30;
  v35 = a2 + v30;
  *(_QWORD *)(v34 + 32) = *(_QWORD *)(v35 + 32);
  v36 = *(_OWORD *)(v35 + 16);
  *(_OWORD *)v34 = *(_OWORD *)v35;
  *(_OWORD *)(v34 + 16) = v36;
  v37 = a3[7];
  v38 = a3[8];
  v39 = a1 + v37;
  v40 = a2 + v37;
  v41 = *(_OWORD *)(v40 + 16);
  *(_OWORD *)v39 = *(_OWORD *)v40;
  *(_OWORD *)(v39 + 16) = v41;
  *(_QWORD *)(v39 + 32) = *(_QWORD *)(v40 + 32);
  v42 = a1 + v38;
  v43 = (__int128 *)(a2 + v38);
  v44 = *v43;
  v45 = v43[1];
  *(_QWORD *)(v42 + 32) = *((_QWORD *)v43 + 4);
  *(_OWORD *)v42 = v44;
  *(_OWORD *)(v42 + 16) = v45;
  v46 = a3[9];
  v47 = a3[10];
  v48 = a1 + v46;
  v49 = a2 + v46;
  *(_QWORD *)(v48 + 32) = *(_QWORD *)(v49 + 32);
  v50 = *(_OWORD *)(v49 + 16);
  *(_OWORD *)v48 = *(_OWORD *)v49;
  *(_OWORD *)(v48 + 16) = v50;
  v51 = a1 + v47;
  v52 = a2 + v47;
  *(_QWORD *)(v51 + 32) = *(_QWORD *)(v52 + 32);
  v53 = *(_OWORD *)(v52 + 16);
  *(_OWORD *)v51 = *(_OWORD *)v52;
  *(_OWORD *)(v51 + 16) = v53;
  v54 = a3[11];
  v55 = a1 + v54;
  v56 = a2 + v54;
  v57 = *(_OWORD *)(v56 + 16);
  *(_OWORD *)v55 = *(_OWORD *)v56;
  *(_OWORD *)(v55 + 16) = v57;
  *(_QWORD *)(v55 + 32) = *(_QWORD *)(v56 + 32);
  return a1;
}

uint64_t sub_1BCBFD25C(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  __swift_destroy_boxed_opaque_existential_1(a1 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v7;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  __swift_destroy_boxed_opaque_existential_1(a1 + 136);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  __swift_destroy_boxed_opaque_existential_1(a1 + 176);
  v8 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v8;
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  __swift_destroy_boxed_opaque_existential_1(a1 + 216);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  __swift_destroy_boxed_opaque_existential_1(a1 + 256);
  v9 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v9;
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  __swift_destroy_boxed_opaque_existential_1(a1 + 296);
  v10 = *(_OWORD *)(a2 + 312);
  *(_OWORD *)(a1 + 296) = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 312) = v10;
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  __swift_destroy_boxed_opaque_existential_1(a1 + 336);
  v11 = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 336) = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 352) = v11;
  *(_QWORD *)(a1 + 368) = *(_QWORD *)(a2 + 368);
  __swift_destroy_boxed_opaque_existential_1(a1 + 376);
  v12 = *(_OWORD *)(a2 + 392);
  *(_OWORD *)(a1 + 376) = *(_OWORD *)(a2 + 376);
  *(_OWORD *)(a1 + 392) = v12;
  *(_QWORD *)(a1 + 408) = *(_QWORD *)(a2 + 408);
  __swift_destroy_boxed_opaque_existential_1(a1 + 416);
  v13 = *(_OWORD *)(a2 + 432);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  *(_OWORD *)(a1 + 432) = v13;
  *(_QWORD *)(a1 + 448) = *(_QWORD *)(a2 + 448);
  __swift_destroy_boxed_opaque_existential_1(a1 + 456);
  v14 = *(_OWORD *)(a2 + 472);
  *(_OWORD *)(a1 + 456) = *(_OWORD *)(a2 + 456);
  *(_OWORD *)(a1 + 472) = v14;
  *(_QWORD *)(a1 + 488) = *(_QWORD *)(a2 + 488);
  __swift_destroy_boxed_opaque_existential_1(a1 + 496);
  v15 = *(_OWORD *)(a2 + 512);
  *(_OWORD *)(a1 + 496) = *(_OWORD *)(a2 + 496);
  *(_OWORD *)(a1 + 512) = v15;
  *(_QWORD *)(a1 + 528) = *(_QWORD *)(a2 + 528);
  __swift_destroy_boxed_opaque_existential_1(a1 + 536);
  v16 = *(_OWORD *)(a2 + 552);
  *(_OWORD *)(a1 + 536) = *(_OWORD *)(a2 + 536);
  *(_OWORD *)(a1 + 552) = v16;
  *(_QWORD *)(a1 + 568) = *(_QWORD *)(a2 + 568);
  v17 = *(int *)(type metadata accessor for SmallLockupLayout.Metrics(0) + 76);
  v18 = a1 + v17;
  v19 = a2 + v17;
  v20 = sub_1BCC00C00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v18, v19, v20);
  v21 = a3[5];
  v22 = a1 + v21;
  v23 = a2 + v21;
  __swift_destroy_boxed_opaque_existential_1(a1 + v21);
  *(_QWORD *)(v22 + 32) = *(_QWORD *)(v23 + 32);
  v24 = *(_OWORD *)(v23 + 16);
  *(_OWORD *)v22 = *(_OWORD *)v23;
  *(_OWORD *)(v22 + 16) = v24;
  v25 = a3[6];
  v26 = a1 + v25;
  v27 = a2 + v25;
  if (*(_QWORD *)(a1 + v25 + 24))
    __swift_destroy_boxed_opaque_existential_1(v26);
  v28 = *(_OWORD *)(v27 + 16);
  *(_OWORD *)v26 = *(_OWORD *)v27;
  *(_OWORD *)(v26 + 16) = v28;
  *(_QWORD *)(v26 + 32) = *(_QWORD *)(v27 + 32);
  v29 = a3[7];
  v30 = a1 + v29;
  v31 = a2 + v29;
  __swift_destroy_boxed_opaque_existential_1(a1 + v29);
  v32 = *(_OWORD *)(v31 + 16);
  *(_OWORD *)v30 = *(_OWORD *)v31;
  *(_OWORD *)(v30 + 16) = v32;
  *(_QWORD *)(v30 + 32) = *(_QWORD *)(v31 + 32);
  v33 = a3[8];
  v34 = a1 + v33;
  v35 = a2 + v33;
  __swift_destroy_boxed_opaque_existential_1(a1 + v33);
  *(_QWORD *)(v34 + 32) = *(_QWORD *)(v35 + 32);
  v36 = *(_OWORD *)(v35 + 16);
  *(_OWORD *)v34 = *(_OWORD *)v35;
  *(_OWORD *)(v34 + 16) = v36;
  v37 = a3[9];
  v38 = a1 + v37;
  v39 = a2 + v37;
  if (*(_QWORD *)(a1 + v37 + 24))
    __swift_destroy_boxed_opaque_existential_1(v38);
  v40 = *(_OWORD *)(v39 + 16);
  *(_OWORD *)v38 = *(_OWORD *)v39;
  *(_OWORD *)(v38 + 16) = v40;
  *(_QWORD *)(v38 + 32) = *(_QWORD *)(v39 + 32);
  v41 = a3[10];
  v42 = a1 + v41;
  if (*(_QWORD *)(a1 + v41 + 24))
    __swift_destroy_boxed_opaque_existential_1(a1 + v41);
  v43 = *(_OWORD *)(a2 + v41 + 16);
  *(_OWORD *)v42 = *(_OWORD *)(a2 + v41);
  *(_OWORD *)(v42 + 16) = v43;
  *(_QWORD *)(v42 + 32) = *(_QWORD *)(a2 + v41 + 32);
  v44 = a3[11];
  v45 = a1 + v44;
  v46 = a2 + v44;
  __swift_destroy_boxed_opaque_existential_1(a1 + v44);
  v47 = *(_OWORD *)(v46 + 16);
  *(_OWORD *)v45 = *(_OWORD *)v46;
  *(_OWORD *)(v45 + 16) = v47;
  *(_QWORD *)(v45 + 32) = *(_QWORD *)(v46 + 32);
  return a1;
}

uint64_t sub_1BCBFD568()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCBFD574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for SmallLockupLayout.Metrics(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 24);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1BCBFD5F4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BCBFD600(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for SmallLockupLayout.Metrics(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for SmallLockupLayout(uint64_t a1)
{
  return sub_1BCBEF64C(a1, (uint64_t *)&unk_1ED1BC9F8);
}

uint64_t sub_1BCBFD690()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SmallLockupLayout.Metrics(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1BCBFD714()
{
  return sub_1BCBDAC80(&qword_1EF48DE60, type metadata accessor for SmallLockupLayout, (uint64_t)&unk_1BCC0A300);
}

unint64_t sub_1BCBFD740()
{
  unint64_t result;

  result = qword_1EF48DE68;
  if (!qword_1EF48DE68)
  {
    result = MEMORY[0x1BCCFEBCC](&unk_1BCC096B4, &type metadata for CenteringLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DE68);
  }
  return result;
}

uint64_t sub_1BCBFD784()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

unint64_t sub_1BCBFD7A8()
{
  unint64_t result;

  result = qword_1EF48DE70;
  if (!qword_1EF48DE70)
  {
    result = MEMORY[0x1BCCFEBCC](&protocol conformance descriptor for CenteredThreeLineReverseTextLayout, &type metadata for CenteredThreeLineReverseTextLayout);
    atomic_store(result, (unint64_t *)&qword_1EF48DE70);
  }
  return result;
}

uint64_t sub_1BCBFD7EC()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  return swift_deallocObject();
}

uint64_t destroy for TVTextPillOverlayLayout(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 112);
}

_OWORD *initializeWithCopy for TVTextPillOverlayLayout(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_OWORD *)((char *)a2 + 56);
  *(_OWORD *)((char *)a1 + 56) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  v6 = a2[6];
  a1[6] = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)a1 + 72, (uint64_t)a2 + 72);
  v7 = *(_OWORD *)((char *)a2 + 136);
  *(_OWORD *)((char *)a1 + 136) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)(a1 + 7), (uint64_t)(a2 + 7));
  return a1;
}

uint64_t *assignWithCopy for TVTextPillOverlayLayout(uint64_t *a1, uint64_t *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  __swift_assign_boxed_opaque_existential_1(a1 + 4, a2 + 4);
  __swift_assign_boxed_opaque_existential_1(a1 + 9, a2 + 9);
  __swift_assign_boxed_opaque_existential_1(a1 + 14, a2 + 14);
  return a1;
}

__n128 __swift_memcpy152_8(uint64_t a1, uint64_t a2)
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
  v8 = *(_OWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for TVTextPillOverlayLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  __swift_destroy_boxed_opaque_existential_1(a1 + 72);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  __swift_destroy_boxed_opaque_existential_1(a1 + 112);
  v6 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v6;
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for TVTextPillOverlayLayout(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 152))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TVTextPillOverlayLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 152) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 56) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 152) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TVTextPillOverlayLayout()
{
  return &type metadata for TVTextPillOverlayLayout;
}

uint64_t destroy for TVTextPillOverlayLayout.Metrics(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1 + 32);
}

_OWORD *initializeWithCopy for TVTextPillOverlayLayout.Metrics(_OWORD *a1, _OWORD *a2)
{
  __int128 v3;
  __int128 v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = *(_OWORD *)((char *)a2 + 56);
  *(_OWORD *)((char *)a1 + 56) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  return a1;
}

_QWORD *assignWithCopy for TVTextPillOverlayLayout.Metrics(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  __swift_assign_boxed_opaque_existential_1(a1 + 4, a2 + 4);
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for TVTextPillOverlayLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  __swift_destroy_boxed_opaque_existential_1(a1 + 32);
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for TVTextPillOverlayLayout.Metrics(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TVTextPillOverlayLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 56) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TVTextPillOverlayLayout.Metrics()
{
  return &type metadata for TVTextPillOverlayLayout.Metrics;
}

uint64_t sub_1BCBFDC4C@<X0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  _QWORD v28[6];
  CGFloat v29;
  CGFloat v30;
  __int128 v31;
  _QWORD v32[4];
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v29 = a2;
  v30 = a3;
  v28[5] = a1;
  v8 = sub_1BCC00F54();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + 112), *(_QWORD *)(v5 + 136));
  sub_1BCC00708();
  v13 = v12;
  *(double *)&v28[3] = v12;
  v15 = v14;
  v16 = *(double *)(v5 + 8);
  v17 = *(double *)(v5 + 24);
  sub_1BCBEAA54((_OWORD *)v5, &v31);
  __swift_project_boxed_opaque_existential_1(v32, v32[3]);
  sub_1BCBE8C78();
  sub_1BCC007BC();
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  *(double *)&v28[4] = v15;
  if (v15 > v19)
    v20 = v15;
  else
    v20 = v19;
  v21 = v13 + v16 + v17;
  v23 = v29;
  v22 = v30;
  v33.origin.x = v29;
  v33.origin.y = v30;
  v33.size.width = a4;
  v24 = a5;
  v33.size.height = a5;
  v25 = CGRectGetMaxX(v33) - v21;
  v34.origin.x = v23;
  v34.origin.y = v22;
  *(CGFloat *)&v28[2] = a4;
  v34.size.width = a4;
  v34.size.height = v24;
  *(CGFloat *)&v28[1] = v24;
  v26 = CGRectGetMaxY(v34) - v20;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + 72), *(_QWORD *)(v5 + 96));
  sub_1BCC00E94();
  sub_1BCC006E4();
  v35.origin.x = v25;
  v35.origin.y = v26;
  v35.size.width = v21;
  v35.size.height = v20;
  CGRectGetMidX(v35);
  v36.origin.x = v25;
  v36.origin.y = v26;
  v36.size.width = v21;
  v36.size.height = v20;
  CGRectGetMidY(v36);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + 112), *(_QWORD *)(v5 + 136));
  sub_1BCC00E94();
  sub_1BCC006E4();
  return sub_1BCC00660();
}

_OWORD *sub_1BCBFDF10@<X0>(_OWORD *a1@<X8>)
{
  _OWORD *v1;

  return sub_1BCBEAA54(v1, a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void ASCAXLabelForElements_cold_1()
{
  dlerror();
  abort_report_np();
  -[ASCAdamID initWithCoder:].cold.1();
}

uint64_t __getSKStoreProductViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[ASCLockupRequest initWithCoder:].cold.1(v0);
}

void ASCLockupImageStringForName_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not find image %@ for lockup text", (uint8_t *)&v1, 0xCu);
}

uint64_t sub_1BCC0063C()
{
  return MEMORY[0x1E0D418B0]();
}

uint64_t sub_1BCC00648()
{
  return MEMORY[0x1E0D418C0]();
}

uint64_t sub_1BCC00654()
{
  return MEMORY[0x1E0D418F0]();
}

uint64_t sub_1BCC00660()
{
  return MEMORY[0x1E0D41908]();
}

uint64_t sub_1BCC0066C()
{
  return MEMORY[0x1E0D41910]();
}

uint64_t sub_1BCC00678()
{
  return MEMORY[0x1E0D41920]();
}

uint64_t sub_1BCC00684()
{
  return MEMORY[0x1E0D41928]();
}

uint64_t sub_1BCC00690()
{
  return MEMORY[0x1E0D41930]();
}

uint64_t sub_1BCC0069C()
{
  return MEMORY[0x1E0D41948]();
}

uint64_t sub_1BCC006A8()
{
  return MEMORY[0x1E0D41958]();
}

uint64_t sub_1BCC006B4()
{
  return MEMORY[0x1E0D41960]();
}

uint64_t sub_1BCC006C0()
{
  return MEMORY[0x1E0D41978]();
}

uint64_t sub_1BCC006CC()
{
  return MEMORY[0x1E0D41988]();
}

uint64_t sub_1BCC006D8()
{
  return MEMORY[0x1E0D41990]();
}

uint64_t sub_1BCC006E4()
{
  return MEMORY[0x1E0D41998]();
}

uint64_t sub_1BCC006F0()
{
  return MEMORY[0x1E0D419A0]();
}

uint64_t sub_1BCC006FC()
{
  return MEMORY[0x1E0D419B8]();
}

uint64_t sub_1BCC00708()
{
  return MEMORY[0x1E0D419D0]();
}

uint64_t sub_1BCC00714()
{
  return MEMORY[0x1E0D419D8]();
}

uint64_t sub_1BCC00720()
{
  return MEMORY[0x1E0D419E8]();
}

uint64_t sub_1BCC0072C()
{
  return MEMORY[0x1E0D419F0]();
}

uint64_t sub_1BCC00738()
{
  return MEMORY[0x1E0D419F8]();
}

uint64_t sub_1BCC00744()
{
  return MEMORY[0x1E0D41A00]();
}

uint64_t sub_1BCC00750()
{
  return MEMORY[0x1E0D41A08]();
}

uint64_t sub_1BCC0075C()
{
  return MEMORY[0x1E0D41A10]();
}

uint64_t sub_1BCC00768()
{
  return MEMORY[0x1E0D41A20]();
}

uint64_t sub_1BCC00774()
{
  return MEMORY[0x1E0D41A28]();
}

uint64_t sub_1BCC00780()
{
  return MEMORY[0x1E0D41A40]();
}

uint64_t sub_1BCC0078C()
{
  return MEMORY[0x1E0D41A70]();
}

uint64_t sub_1BCC00798()
{
  return MEMORY[0x1E0D41AA0]();
}

uint64_t sub_1BCC007A4()
{
  return MEMORY[0x1E0D41AA8]();
}

uint64_t sub_1BCC007B0()
{
  return MEMORY[0x1E0D41AB0]();
}

uint64_t sub_1BCC007BC()
{
  return MEMORY[0x1E0D41AB8]();
}

uint64_t sub_1BCC007C8()
{
  return MEMORY[0x1E0D41AC0]();
}

uint64_t sub_1BCC007D4()
{
  return MEMORY[0x1E0D41AC8]();
}

uint64_t sub_1BCC007E0()
{
  return MEMORY[0x1E0D41AD0]();
}

uint64_t sub_1BCC007EC()
{
  return MEMORY[0x1E0D41AE8]();
}

uint64_t sub_1BCC007F8()
{
  return MEMORY[0x1E0D41AF0]();
}

uint64_t sub_1BCC00804()
{
  return MEMORY[0x1E0D41B10]();
}

uint64_t sub_1BCC00810()
{
  return MEMORY[0x1E0D41B18]();
}

uint64_t sub_1BCC0081C()
{
  return MEMORY[0x1E0D41B20]();
}

uint64_t sub_1BCC00828()
{
  return MEMORY[0x1E0D41B30]();
}

uint64_t sub_1BCC00834()
{
  return MEMORY[0x1E0D41B38]();
}

uint64_t sub_1BCC00840()
{
  return MEMORY[0x1E0D41B40]();
}

uint64_t sub_1BCC0084C()
{
  return MEMORY[0x1E0D41B48]();
}

uint64_t sub_1BCC00858()
{
  return MEMORY[0x1E0D41B50]();
}

uint64_t sub_1BCC00864()
{
  return MEMORY[0x1E0D41B68]();
}

uint64_t sub_1BCC00870()
{
  return MEMORY[0x1E0D41B70]();
}

uint64_t sub_1BCC0087C()
{
  return MEMORY[0x1E0D41B80]();
}

uint64_t sub_1BCC00888()
{
  return MEMORY[0x1E0D41B88]();
}

uint64_t sub_1BCC00894()
{
  return MEMORY[0x1E0D41BA0]();
}

uint64_t sub_1BCC008A0()
{
  return MEMORY[0x1E0D41BB0]();
}

uint64_t sub_1BCC008AC()
{
  return MEMORY[0x1E0D41BC0]();
}

uint64_t sub_1BCC008B8()
{
  return MEMORY[0x1E0D41BD0]();
}

uint64_t sub_1BCC008C4()
{
  return MEMORY[0x1E0D41BE8]();
}

uint64_t sub_1BCC008D0()
{
  return MEMORY[0x1E0D41BF0]();
}

uint64_t sub_1BCC008DC()
{
  return MEMORY[0x1E0D41BF8]();
}

uint64_t sub_1BCC008E8()
{
  return MEMORY[0x1E0D41C08]();
}

uint64_t sub_1BCC008F4()
{
  return MEMORY[0x1E0D41C18]();
}

uint64_t sub_1BCC00900()
{
  return MEMORY[0x1E0D41C50]();
}

uint64_t sub_1BCC0090C()
{
  return MEMORY[0x1E0D41C58]();
}

uint64_t sub_1BCC00918()
{
  return MEMORY[0x1E0D41CF0]();
}

uint64_t sub_1BCC00924()
{
  return MEMORY[0x1E0D41CF8]();
}

uint64_t sub_1BCC00930()
{
  return MEMORY[0x1E0D41D00]();
}

uint64_t sub_1BCC0093C()
{
  return MEMORY[0x1E0D41D10]();
}

uint64_t sub_1BCC00948()
{
  return MEMORY[0x1E0D41D18]();
}

uint64_t sub_1BCC00954()
{
  return MEMORY[0x1E0D41D30]();
}

uint64_t sub_1BCC00960()
{
  return MEMORY[0x1E0D41D40]();
}

uint64_t sub_1BCC0096C()
{
  return MEMORY[0x1E0D41D48]();
}

uint64_t sub_1BCC00978()
{
  return MEMORY[0x1E0D41D50]();
}

uint64_t sub_1BCC00984()
{
  return MEMORY[0x1E0D41D58]();
}

uint64_t sub_1BCC00990()
{
  return MEMORY[0x1E0D41D60]();
}

uint64_t sub_1BCC0099C()
{
  return MEMORY[0x1E0D41D70]();
}

uint64_t sub_1BCC009A8()
{
  return MEMORY[0x1E0D41D78]();
}

uint64_t sub_1BCC009B4()
{
  return MEMORY[0x1E0D41D88]();
}

uint64_t sub_1BCC009C0()
{
  return MEMORY[0x1E0D41D90]();
}

uint64_t sub_1BCC009CC()
{
  return MEMORY[0x1E0D41D98]();
}

uint64_t sub_1BCC009D8()
{
  return MEMORY[0x1E0D41DA8]();
}

uint64_t sub_1BCC009E4()
{
  return MEMORY[0x1E0D41DD8]();
}

uint64_t sub_1BCC009F0()
{
  return MEMORY[0x1E0D41DE8]();
}

uint64_t sub_1BCC009FC()
{
  return MEMORY[0x1E0D41E08]();
}

uint64_t sub_1BCC00A08()
{
  return MEMORY[0x1E0D41E10]();
}

uint64_t sub_1BCC00A14()
{
  return MEMORY[0x1E0D41E28]();
}

uint64_t sub_1BCC00A20()
{
  return MEMORY[0x1E0D41E40]();
}

uint64_t sub_1BCC00A2C()
{
  return MEMORY[0x1E0D41E48]();
}

uint64_t sub_1BCC00A38()
{
  return MEMORY[0x1E0D41E50]();
}

uint64_t sub_1BCC00A44()
{
  return MEMORY[0x1E0D41E60]();
}

uint64_t sub_1BCC00A50()
{
  return MEMORY[0x1E0D41E78]();
}

uint64_t sub_1BCC00A5C()
{
  return MEMORY[0x1E0D41E80]();
}

uint64_t sub_1BCC00A68()
{
  return MEMORY[0x1E0D41ED8]();
}

uint64_t sub_1BCC00A74()
{
  return MEMORY[0x1E0D41EE0]();
}

uint64_t sub_1BCC00A80()
{
  return MEMORY[0x1E0D41EE8]();
}

uint64_t sub_1BCC00A8C()
{
  return MEMORY[0x1E0D41EF0]();
}

uint64_t sub_1BCC00A98()
{
  return MEMORY[0x1E0D41EF8]();
}

uint64_t sub_1BCC00AA4()
{
  return MEMORY[0x1E0D41F00]();
}

uint64_t sub_1BCC00AB0()
{
  return MEMORY[0x1E0D41F08]();
}

uint64_t sub_1BCC00ABC()
{
  return MEMORY[0x1E0D41F38]();
}

uint64_t sub_1BCC00AC8()
{
  return MEMORY[0x1E0D41F48]();
}

uint64_t sub_1BCC00AD4()
{
  return MEMORY[0x1E0D41F50]();
}

uint64_t sub_1BCC00AE0()
{
  return MEMORY[0x1E0D41F58]();
}

uint64_t sub_1BCC00AEC()
{
  return MEMORY[0x1E0D41F68]();
}

uint64_t sub_1BCC00AF8()
{
  return MEMORY[0x1E0D41F80]();
}

uint64_t sub_1BCC00B04()
{
  return MEMORY[0x1E0D41FA0]();
}

uint64_t sub_1BCC00B10()
{
  return MEMORY[0x1E0D41FD0]();
}

uint64_t sub_1BCC00B1C()
{
  return MEMORY[0x1E0D41FE8]();
}

uint64_t sub_1BCC00B28()
{
  return MEMORY[0x1E0D41FF8]();
}

uint64_t sub_1BCC00B34()
{
  return MEMORY[0x1E0D42010]();
}

uint64_t sub_1BCC00B40()
{
  return MEMORY[0x1E0D42028]();
}

uint64_t sub_1BCC00B4C()
{
  return MEMORY[0x1E0D42058]();
}

uint64_t sub_1BCC00B58()
{
  return MEMORY[0x1E0D42060]();
}

uint64_t sub_1BCC00B64()
{
  return MEMORY[0x1E0D42088]();
}

uint64_t sub_1BCC00B70()
{
  return MEMORY[0x1E0D42090]();
}

uint64_t sub_1BCC00B7C()
{
  return MEMORY[0x1E0D420A8]();
}

uint64_t sub_1BCC00B88()
{
  return MEMORY[0x1E0D420E0]();
}

uint64_t sub_1BCC00B94()
{
  return MEMORY[0x1E0D420E8]();
}

uint64_t sub_1BCC00BA0()
{
  return MEMORY[0x1E0D420F0]();
}

uint64_t sub_1BCC00BAC()
{
  return MEMORY[0x1E0D420F8]();
}

uint64_t sub_1BCC00BB8()
{
  return MEMORY[0x1E0D42100]();
}

uint64_t sub_1BCC00BC4()
{
  return MEMORY[0x1E0D42108]();
}

uint64_t sub_1BCC00BD0()
{
  return MEMORY[0x1E0D42110]();
}

uint64_t sub_1BCC00BDC()
{
  return MEMORY[0x1E0D42128]();
}

uint64_t sub_1BCC00BE8()
{
  return MEMORY[0x1E0D42130]();
}

uint64_t sub_1BCC00BF4()
{
  return MEMORY[0x1E0D42140]();
}

uint64_t sub_1BCC00C00()
{
  return MEMORY[0x1E0D421A0]();
}

uint64_t sub_1BCC00C0C()
{
  return MEMORY[0x1E0D421B8]();
}

uint64_t sub_1BCC00C18()
{
  return MEMORY[0x1E0D421C8]();
}

uint64_t sub_1BCC00C24()
{
  return MEMORY[0x1E0D421E0]();
}

uint64_t sub_1BCC00C30()
{
  return MEMORY[0x1E0D42220]();
}

uint64_t sub_1BCC00C3C()
{
  return MEMORY[0x1E0D42228]();
}

uint64_t sub_1BCC00C48()
{
  return MEMORY[0x1E0D42298]();
}

uint64_t sub_1BCC00C54()
{
  return MEMORY[0x1E0D422A0]();
}

uint64_t sub_1BCC00C60()
{
  return MEMORY[0x1E0D422A8]();
}

uint64_t sub_1BCC00C6C()
{
  return MEMORY[0x1E0D42310]();
}

uint64_t sub_1BCC00C78()
{
  return MEMORY[0x1E0D42328]();
}

uint64_t sub_1BCC00C84()
{
  return MEMORY[0x1E0D42338]();
}

uint64_t sub_1BCC00C90()
{
  return MEMORY[0x1E0D42340]();
}

uint64_t sub_1BCC00C9C()
{
  return MEMORY[0x1E0D42348]();
}

uint64_t sub_1BCC00CA8()
{
  return MEMORY[0x1E0D42358]();
}

uint64_t sub_1BCC00CB4()
{
  return MEMORY[0x1E0D42368]();
}

uint64_t sub_1BCC00CC0()
{
  return MEMORY[0x1E0D42378]();
}

uint64_t sub_1BCC00CCC()
{
  return MEMORY[0x1E0D42380]();
}

uint64_t sub_1BCC00CD8()
{
  return MEMORY[0x1E0D423A0]();
}

uint64_t sub_1BCC00CE4()
{
  return MEMORY[0x1E0D423B8]();
}

uint64_t sub_1BCC00CF0()
{
  return MEMORY[0x1E0D423C8]();
}

uint64_t sub_1BCC00CFC()
{
  return MEMORY[0x1E0D42400]();
}

uint64_t sub_1BCC00D08()
{
  return MEMORY[0x1E0D42410]();
}

uint64_t sub_1BCC00D14()
{
  return MEMORY[0x1E0D42420]();
}

uint64_t sub_1BCC00D20()
{
  return MEMORY[0x1E0D42448]();
}

uint64_t sub_1BCC00D2C()
{
  return MEMORY[0x1E0D42460]();
}

uint64_t sub_1BCC00D38()
{
  return MEMORY[0x1E0D424B0]();
}

uint64_t sub_1BCC00D44()
{
  return MEMORY[0x1E0D424C0]();
}

uint64_t sub_1BCC00D50()
{
  return MEMORY[0x1E0D424D0]();
}

uint64_t sub_1BCC00D5C()
{
  return MEMORY[0x1E0D42508]();
}

uint64_t sub_1BCC00D68()
{
  return MEMORY[0x1E0D42518]();
}

uint64_t sub_1BCC00D74()
{
  return MEMORY[0x1E0D42528]();
}

uint64_t sub_1BCC00D80()
{
  return MEMORY[0x1E0D42538]();
}

uint64_t sub_1BCC00D8C()
{
  return MEMORY[0x1E0D42540]();
}

uint64_t sub_1BCC00D98()
{
  return MEMORY[0x1E0D404A8]();
}

uint64_t sub_1BCC00DA4()
{
  return MEMORY[0x1E0D404B0]();
}

uint64_t sub_1BCC00DB0()
{
  return MEMORY[0x1E0D404C0]();
}

uint64_t sub_1BCC00DBC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BCC00DC8()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1BCC00DD4()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1BCC00DE0()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BCC00DEC()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1BCC00DF8()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1BCC00E04()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1BCC00E10()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1BCC00E1C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1BCC00E28()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1BCC00E34()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1BCC00E40()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1BCC00E4C()
{
  return MEMORY[0x1E0D42608]();
}

uint64_t sub_1BCC00E58()
{
  return MEMORY[0x1E0D42610]();
}

uint64_t sub_1BCC00E64()
{
  return MEMORY[0x1E0D42618]();
}

uint64_t sub_1BCC00E70()
{
  return MEMORY[0x1E0D42620]();
}

uint64_t sub_1BCC00E7C()
{
  return MEMORY[0x1E0D42628]();
}

uint64_t sub_1BCC00E88()
{
  return MEMORY[0x1E0DC2D50]();
}

uint64_t sub_1BCC00E94()
{
  return MEMORY[0x1E0D42648]();
}

uint64_t sub_1BCC00EA0()
{
  return MEMORY[0x1E0D42650]();
}

uint64_t sub_1BCC00EAC()
{
  return MEMORY[0x1E0D42660]();
}

uint64_t sub_1BCC00EB8()
{
  return MEMORY[0x1E0D42668]();
}

uint64_t sub_1BCC00EC4()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1BCC00ED0()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1BCC00EDC()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1BCC00EE8()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1BCC00EF4()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1BCC00F00()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1BCC00F0C()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1BCC00F18()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1BCC00F24()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1BCC00F30()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1BCC00F3C()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1BCC00F48()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1BCC00F54()
{
  return MEMORY[0x1E0DED510]();
}

uint64_t sub_1BCC00F60()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1BCC00F6C()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1BCC00F78()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1BCC00F84()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1BCC00F90()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t AMSHashIfNeeded()
{
  return MEMORY[0x1E0CFD850]();
}

uint64_t AMSLogableError()
{
  return MEMORY[0x1E0CFD860]();
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x1E0C9C468](c, *(_QWORD *)&cap);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x1E0C9C570](c);
}

void CGPathAddRelativeArc(CGMutablePathRef path, const CGAffineTransform *matrix, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat delta)
{
  MEMORY[0x1E0C9D2D0](path, matrix, x, y, radius, startAngle, delta);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3D0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

uint64_t JUMeasurementsMake()
{
  return MEMORY[0x1E0D426D8]();
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x1E0DC4598](*(_QWORD *)&notification, argument);
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

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x1E0DC5720]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
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

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

