id MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(uint64_t a1, uint64_t a2)
{
  return MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(a1, a2, 0);
}

id MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(uint64_t a1, uint64_t a2, int a3)
{
  id v4;
  void **v5;
  void **v6;
  void **v7;
  void *v8;

  v4 = 0;
  switch(a1)
  {
    case 0:
      v5 = (void **)MEMORY[0x24BE1E368];
      goto LABEL_30;
    case 1:
    case 2:
    case 3:
      v5 = (void **)MEMORY[0x24BE1E3D0];
      v6 = (void **)MEMORY[0x24BE1E3C8];
      goto LABEL_28;
    case 4:
    case 16:
      v5 = (void **)MEMORY[0x24BE1E348];
      goto LABEL_30;
    case 5:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
      return v4;
    case 6:
      v5 = (void **)MEMORY[0x24BE1E3D8];
      goto LABEL_30;
    case 7:
    case 11:
      goto LABEL_7;
    case 8:
      v5 = (void **)MEMORY[0x24BE1E360];
      goto LABEL_30;
    case 9:
    case 12:
    case 17:
      v5 = (void **)MEMORY[0x24BE1E330];
      v6 = (void **)MEMORY[0x24BE1E328];
      goto LABEL_28;
    case 10:
    case 13:
    case 18:
      v5 = (void **)MEMORY[0x24BE1E340];
      v6 = (void **)MEMORY[0x24BE1E338];
      goto LABEL_28;
    case 14:
      v7 = (void **)MEMORY[0x24BE1E320];
      if (a2 != 2 && _os_feature_enabled_impl())
        v7 = (void **)MEMORY[0x24BE1E318];
      v8 = *v7;
      goto LABEL_31;
    case 15:
      v5 = (void **)MEMORY[0x24BE1E2F0];
      v6 = (void **)MEMORY[0x24BE1E2E8];
      goto LABEL_28;
    case 19:
      v5 = (void **)MEMORY[0x24BE1E300];
      v6 = (void **)MEMORY[0x24BE1E2F8];
      goto LABEL_28;
    case 20:
      v5 = (void **)MEMORY[0x24BE1E350];
      goto LABEL_30;
    case 21:
      v5 = (void **)MEMORY[0x24BE1E358];
      goto LABEL_30;
    case 22:
      v5 = (void **)MEMORY[0x24BE1E3E0];
      goto LABEL_30;
    case 23:
      v5 = (void **)MEMORY[0x24BE1E2E0];
      goto LABEL_30;
    case 50:
      v5 = (void **)MEMORY[0x24BE1E370];
      v6 = (void **)MEMORY[0x24BE1E378];
      goto LABEL_28;
    case 51:
      v5 = (void **)MEMORY[0x24BE1E3B8];
      v6 = (void **)MEMORY[0x24BE1E3C0];
      goto LABEL_28;
    case 52:
      v5 = (void **)MEMORY[0x24BE1E3A8];
      v6 = (void **)MEMORY[0x24BE1E3B0];
      goto LABEL_28;
    case 53:
      v5 = (void **)MEMORY[0x24BE1E380];
      v6 = (void **)MEMORY[0x24BE1E388];
      goto LABEL_28;
    case 54:
      v5 = (void **)MEMORY[0x24BE1E390];
      v6 = (void **)MEMORY[0x24BE1E3A0];
      if (!a3)
        v6 = (void **)MEMORY[0x24BE1E398];
LABEL_28:
      if (a2 != 2)
        v5 = v6;
      goto LABEL_30;
    default:
      if (a1 != 101)
        return v4;
LABEL_7:
      v5 = (void **)MEMORY[0x24BE1E3D0];
LABEL_30:
      v8 = *v5;
LABEL_31:
      v4 = v8;
      return v4;
  }
}

id MTCoreMaterialVisualStyleCategoryForVisualStyleCategory(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)*MEMORY[0x24BE1E3F0];
  if ((unint64_t)(a1 - 1) <= 2)
  {
    v3 = **((id **)&unk_24C3DBBA8 + a1 - 1);

    v2 = v3;
  }
  return v2;
}

id MTCoreMaterialVisualStyleForVisualStyle(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = a1 + 1;
  if ((unint64_t)(a1 + 1) <= 0x19 && ((0x3E0007Fu >> v1) & 1) != 0)
    v2 = **((id **)&unk_24C3DBAD8 + v1);
  else
    v2 = 0;
  return v2;
}

BOOL MTIsValidVisualStyle(unint64_t a1)
{
  return a1 < 6 || a1 - 20 < 5;
}

void sub_20AE5DA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __supportedAnimationPropertyKey(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = __supportedAnimationPropertyKey_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&__supportedAnimationPropertyKey_onceToken, &__block_literal_global_1);
  v3 = objc_msgSend((id)__supportedAnimationPropertyKey___animatableKeys, "containsObject:", v2);

  return v3;
}

__CFString *NSStringFromMTLumaDodgePillStyle(unint64_t a1)
{
  if (a1 < 5)
    return off_24C3DB858[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%li)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void MTRegisterMaterialKitLogging()
{
  if (MTRegisterMaterialKitLogging_onceToken != -1)
    dispatch_once(&MTRegisterMaterialKitLogging_onceToken, &__block_literal_global);
}

void sub_20AE5FC5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t MTMaterialRecipeForUIBlurEffectStyle(uint64_t a1)
{
  if ((unint64_t)(a1 - 6) > 0xE)
    return 0;
  else
    return qword_20AE68FF8[a1 - 6];
}

BOOL MTIsUIBlurEffectStyleDynamic(uint64_t a1)
{
  return (unint64_t)(a1 - 21) < 0xFFFFFFFFFFFFFFF6;
}

double _MainScreenReferenceBounds()
{
  if (_MainScreenReferenceBounds___once != -1)
    dispatch_once(&_MainScreenReferenceBounds___once, &__block_literal_global_211);
  return *(double *)&_MainScreenReferenceBounds___bounds_0;
}

__CFString *NSStringFromMTLumaDodgePillBackgroundLuminance(unint64_t a1)
{
  if (a1 < 3)
    return off_24C3DB880[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%li)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromMTLumaDodgeGraphicsQuality(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("high");
  if (a1 == -100)
  {
    v1 = CFSTR("low");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%li)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void ____supportedAnimationPropertyKey_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("filters.homeAffordanceBase.inputAddWhite"), CFSTR("filters.homeAffordanceBase.inputAmount"), CFSTR("filters.homeAffordanceBase.inputOverlayOpacity"), CFSTR("filters.gaussianBlur.inputRadius"), CFSTR("filters.colorBrightness.inputAmount"), CFSTR("filters.colorSaturate.inputAmount"), CFSTR("filters.colorMatrix.inputColorMatrix"), 0);
  v1 = (void *)__supportedAnimationPropertyKey___animatableKeys;
  __supportedAnimationPropertyKey___animatableKeys = v0;

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t MTIsValidBlurInputQuality(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("default")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("low")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("medium")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("high"));
  }

  return v2;
}

uint64_t MTCompareBlurInputQualities(void *a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = a1;
  if (!MTIsValidBlurInputQuality(v4) || (MTIsValidBlurInputQuality(v3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSComparisonResult MTCompareBlurInputQualities(NSString *__strong, NSString *__strong)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("MTUtilities.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("MTIsValidBlurInputQuality(inputQuality1) && MTIsValidBlurInputQuality(inputQuality2)"));

  }
  if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("default")))
    v5 = CFSTR("medium");
  else
    v5 = v4;
  v6 = v5;

  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("default")))
    v7 = CFSTR("medium");
  else
    v7 = v3;
  v8 = v7;

  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", v8) & 1) != 0)
  {
    v9 = 0;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("low")) & 1) != 0)
  {
    v9 = -1;
  }
  else if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("high")) & 1) != 0)
  {
    v9 = 1;
  }
  else if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("low")))
  {
    v9 = 1;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

double MTEdgeInsetsInvert(double a1)
{
  return -a1;
}

uint64_t MTRectApplyInsets()
{
  return UIRectInset();
}

uint64_t MTRectApplyOutsets()
{
  return UIRectInset();
}

const __CFString *MTStringFromMaterialRecipe(uint64_t a1)
{
  const __CFString *result;

  result = CFSTR("[Undefined]");
  switch(a1)
  {
    case 0:
      result = CFSTR("MTMaterialRecipeNone");
      break;
    case 1:
      result = CFSTR("MTMaterialRecipeNotifications");
      break;
    case 2:
      result = CFSTR("MTMaterialRecipeWidgetHosts");
      break;
    case 3:
      result = CFSTR("MTMaterialRecipeWidgets");
      break;
    case 4:
      result = CFSTR("MTMaterialRecipeControlCenterModules");
      break;
    case 5:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
      return result;
    case 6:
      result = CFSTR("MTMaterialRecipePreviewBackground");
      break;
    case 7:
      goto LABEL_4;
    case 8:
      result = CFSTR("MTMaterialRecipeControlCenterModulesSheer");
      break;
    case 9:
      result = CFSTR("MTMaterialRecipeSiriPlatter");
      break;
    case 10:
      result = CFSTR("MTMaterialRecipeSiriPlatterSheer");
      break;
    case 11:
      result = CFSTR("MTMaterialRecipeSiriDialogue");
      break;
    case 12:
      result = CFSTR("MTMaterialRecipeSpotlightPlatter");
      break;
    case 13:
      result = CFSTR("MTMaterialRecipeSpotlightPlatterSheer");
      break;
    case 14:
      result = CFSTR("MTMaterialRecipeSpotlightBackground");
      break;
    case 15:
      result = CFSTR("MTMaterialRecipeCarPlayNotifications");
      break;
    case 16:
      result = CFSTR("MTMaterialRecipeSiriBackground");
      break;
    case 17:
      result = CFSTR("MTMaterialRecipeSleepPlatter");
      break;
    case 18:
      result = CFSTR("MTMaterialRecipeSleepPlatterSheer");
      break;
    case 19:
      result = CFSTR("MTMaterialRecipeDock");
      break;
    case 20:
      result = CFSTR("MTMaterialRecipeControlCenterBackground");
      break;
    case 21:
      result = CFSTR("MTMaterialRecipeControlCenterBackgroundSheer");
      break;
    case 22:
      result = CFSTR("MTMaterialRecipeSessions");
      break;
    case 23:
      result = CFSTR("MTMaterialRecipeActivityAmbientCompact");
      break;
    case 50:
      result = CFSTR("MTMaterialRecipeSystemChromeBackground");
      break;
    case 51:
      result = CFSTR("MTMaterialRecipeSystemVibrantBackgroundUltraThin");
      break;
    case 52:
      result = CFSTR("MTMaterialRecipeSystemVibrantBackgroundThin");
      break;
    case 53:
      result = CFSTR("MTMaterialRecipeSystemVibrantBackgroundRegular");
      break;
    case 54:
      result = CFSTR("MTMaterialRecipeSystemVibrantBackgroundThick");
      break;
    default:
      if (a1 == 101)
LABEL_4:
        result = CFSTR("MTMaterialRecipeNotificationsDark");
      break;
  }
  return result;
}

id _MTCoreMaterialRecipeNameForMaterialRecipeAndUserInterfaceStyle(uint64_t a1, uint64_t a2)
{
  return MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(a1, a2, 0);
}

uint64_t _MTInternalVibrancyEffectStyleForPublicStyle(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  switch(a1)
  {
    case 0:
      result = 101;
      break;
    case 1:
      result = 102;
      break;
    case 2:
      result = 103;
      break;
    case 3:
      result = 104;
      break;
    case 4:
      result = 110;
      break;
    case 5:
      result = 111;
      break;
    case 6:
      result = 112;
      break;
    case 7:
      result = 120;
      break;
    default:
      if (((1 << (a1 - 101)) & 0x80E0F) != 0)
        v1 = a1;
      else
        v1 = 0;
      if ((unint64_t)(a1 - 101) <= 0x13)
        result = v1;
      else
        result = 0;
      break;
  }
  return result;
}

id _MTCoreMaterialRecipeNameForSystemColorCompatibleWithTraitCollection(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v3 = a2;
  v4 = (id)*MEMORY[0x24BE1E368];
  if ((unint64_t)(a1 - 20) <= 4)
  {
    MTCoreMaterialVisualStyleForVisualStyle(a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_msgSend(v3, "userInterfaceStyle");
      v7 = (_QWORD *)MEMORY[0x24BE1E488];
      if (v6 != 2)
        v7 = (_QWORD *)MEMORY[0x24BE1E490];
      if (*v7)
      {
        MTCoreMaterialRecipeForVisualStyleFromStyleWithName();
        v8 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v8;
      }
    }

  }
  return v4;
}

id MTCoreMaterialPlatformColorsStyleNameForUserInterfaceStyle(uint64_t a1)
{
  id *v1;

  v1 = (id *)MEMORY[0x24BE1E488];
  if (a1 != 2)
    v1 = (id *)MEMORY[0x24BE1E490];
  return *v1;
}

id _MTCoreMaterialRecipeNameForSystemColor(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _MTCoreMaterialRecipeNameForSystemColorCompatibleWithTraitCollection(a1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id MTCoreMaterialRecipeForMaterialRecipe(uint64_t a1)
{
  return MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(a1, 0, 0);
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x24BE0BB40]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x24BE0BBD0]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x24BE0BBE8]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x24BE0BC08]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x24BE0BCC0]();
}

uint64_t BSSizeEqualToSize()
{
  return MEMORY[0x24BE0BD40]();
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

uint64_t MTCoreMaterialRecipeForVisualStyleFromRecipeFromBundle()
{
  return MEMORY[0x24BE1E308]();
}

uint64_t MTCoreMaterialRecipeForVisualStyleFromStyleWithName()
{
  return MEMORY[0x24BE1E310]();
}

uint64_t MTDimensionsForContinuousCornerRadiusInBounds()
{
  return MEMORY[0x24BE1E428]();
}

uint64_t MTDynamicBlurRadiusGraphicsQuality()
{
  return MEMORY[0x24BE1E430]();
}

uint64_t MTEdgeOutsetsForCoreMaterialShadowProperties()
{
  return MEMORY[0x24BE1E438]();
}

uint64_t MTResizableAreaForCornerDimensionsInBounds()
{
  return MEMORY[0x24BE1E448]();
}

uint64_t MTShadowImageCreateWithCoreMaterialShadowProperties()
{
  return MEMORY[0x24BE1E450]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BDF7288]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BDF7290]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x24BDF7CC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectInset()
{
  return MEMORY[0x24BDF7CE0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _MTDefaultBackdropScaleAdjustmentForWeighting()
{
  return MEMORY[0x24BE1E478]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x24BEDCEB8](cls, name);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

